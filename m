Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14b2DV-0000L9-00
	for mtd-list@infradead.org; Thu, 08 Mar 2001 15:20:37 +0000
Received: from fjordland.nl.linux.org ([131.211.28.101] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14b2DS-0000Ji-00
	for mtd@infradead.org; Thu, 08 Mar 2001 15:20:35 +0000
Message-ID: <3AA7A1FE.B07D5797@danielind.com>
Date: Thu, 08 Mar 2001 09:15:10 -0600
From: Vipin Malik <vmalik@danielind.com>
MIME-Version: 1.0
To: Jonas Holmberg <jonas.holmberg@axis.com>
CC: 'Erwin Authried' <eauth@softsys.co.at>,
	"'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: reset/read mode cmd for AMD compatible flash
References: <E6FE4E054F02D511818E00025558B61D429E7A@cluster01.axis.se>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>From the AMD 29LV017 CFI flash data sheet (pg. 16) (talking about the CFI cmd register and commands):

"Writing incorrect address or data values or in the impropper sequence resets the device to reading array data."

Vipin



Jonas Holmberg wrote:

> I _think_ it should be 0xf0 (but 0xff seems to work on AM29LV160DB and DT!?). Isn't it just a typo?
>
> BTW: did you try amd_flash_probe() with your Atmel chip? In that case can you give me manufacturer id, device id and eraseregions info, please? I'd like to add support for as many AMD compatible chips as possible in the AMD driver.
>
> Best regards
> /Jonas
>
> > -----Original Message-----
> > From: Erwin Authried [mailto:eauth@softsys.co.at]
> > Sent: Thursday, March 08, 2001 9:30 AM
> > To: 'mtd@infradead.org'
> > Subject: reset/read mode cmd for AMD compatible flash
> >
> >
> > In cfi-probe.c, it seems that the command 0xff is used to
> > switch the flash
> > into read mode. I have studied several datasheets of AMD
> > compatible flash
> > (AMD29F160, Fujitsu MB29F160, Atmel AT49BV160...), and they specify
> > 0xf0 as the reset mode command. Can anybody please enlighten me?
> >
> > -Erwin
> >
> >
> >
> >
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
