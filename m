Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ayL1-0005tD-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 11:12:07 +0000
Received: from roma.axis.se ([193.13.178.2])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ayL0-0005t0-00
	for mtd@infradead.org; Thu, 08 Mar 2001 11:12:06 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E7A@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'Erwin Authried'" <eauth@softsys.co.at>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: reset/read mode cmd for AMD compatible flash
Date: Thu, 8 Mar 2001 12:11:02 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I _think_ it should be 0xf0 (but 0xff seems to work on AM29LV160DB and DT!?). Isn't it just a typo?

BTW: did you try amd_flash_probe() with your Atmel chip? In that case can you give me manufacturer id, device id and eraseregions info, please? I'd like to add support for as many AMD compatible chips as possible in the AMD driver.

Best regards
/Jonas

> -----Original Message-----
> From: Erwin Authried [mailto:eauth@softsys.co.at]
> Sent: Thursday, March 08, 2001 9:30 AM
> To: 'mtd@infradead.org'
> Subject: reset/read mode cmd for AMD compatible flash
> 
> 
> In cfi-probe.c, it seems that the command 0xff is used to 
> switch the flash
> into read mode. I have studied several datasheets of AMD 
> compatible flash
> (AMD29F160, Fujitsu MB29F160, Atmel AT49BV160...), and they specify
> 0xf0 as the reset mode command. Can anybody please enlighten me?
> 
> -Erwin
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
