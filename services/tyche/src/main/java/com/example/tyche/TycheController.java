package com.example.tyche;

import org.slf4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TycheController {

    Logger logger = org.slf4j.LoggerFactory.getLogger("jsonLogger");
//    Logger logger = org.slf4j.LoggerFactory.getLogger(TycheController.class);

    @GetMapping("/")
    public String index() {
        return "Hi I'm Tyche and I'm the goddess of fortune and prosperity!";
    }

    @GetMapping("/int")
    public String randint() {
        /*
          Get a random integer between 0 and 100.
          get X-Correlation-ID from request header
          write to log generated random integer and X-Correlation-ID

          It is very bad random generator, it fails 50% of the time.
         */
        logger.info("Request for random integer.");
        int randomInt = (int) ((Math.random() * 200) - 100);
        if (randomInt < 0) {
            logger.error("Random integer " + randomInt + " is negative! I give up!");
            throw new RuntimeException("Random integer is negative!");
        }
        logger.info("Random integer: " + randomInt);
        return String.valueOf(randomInt);
    }
}
