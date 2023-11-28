package com.example.tyche;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.MDC;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CorrelationFilter implements Filter {
    private static final String REQUEST_ID_HEADER = "X-Correlation-ID";

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        String correlationId = httpServletRequest.getHeader(REQUEST_ID_HEADER);
        MDC.put("correlationId", correlationId);
        chain.doFilter(request, response);
        MDC.remove("correlationId");
    }
}
