package com.saple.learn.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api") // Base path (optional)
public class FController {

    @GetMapping("/test") // Endpoint: GET /api/test
    public String test() {
        return "Test success";
    }
}
