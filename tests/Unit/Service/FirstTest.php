<?php

namespace CaringCircles\P2pCare\Tests;

use PHPUnit\Framework\TestCase;

class FirstTest extends TestCase
{

    protected function setUp(): void
    {
        // NOOP
    }

    public function testPlaceholder(): void
    {
        $text = 'tests are running';

        self::assertNotEmpty($text);
    }


}
