Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13F5Wg-0007SG-00
	for mtd-list@infradead.org; Thu, 20 Jul 2000 02:53:26 +0100
Received: from sis.com.tw ([203.67.208.2] helo=fw11.sis.com.tw)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13F5Wa-0007SA-00
	for mtd@infradead.org; Thu, 20 Jul 2000 02:53:20 +0100
Message-ID: <39765B06.7BB3C893@sis.com.tw>
Date: Thu, 20 Jul 2000 09:51:02 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: Matt Hortman <mbhortman@ieee.org>
CC: mtd@infradead.org
Subject: Re: using int 13h to access DOC
References: <20000719183341.B26693@khayman.mavrik.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Matt Hortman wrote:
> 
> Hi guys...
> 
> Shoot this down: Since the M-Sys firmware in the DOC simply installs
> an int 13h handler, why not use it to access the DOC using "bios"
> calls.  I realize that the kernel probably overwrites that handler but
> that could be fixed.  I don't know, however, about using a real-mode
> interrupt from a device driver.  It seems too simple to work.  What
> have I overlooked?
> 

Why ?? We have GPL'd driver for both DoC 2000 and DoC Millennium now.

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
