Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Fab3-0003RE-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 12:04:01 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Fab0-0003R8-00
	for mtd@infradead.org; Fri, 21 Jul 2000 12:03:59 +0100
Message-ID: <39783001.2FE9E3AC@evoserve.com>
Date: Fri, 21 Jul 2000 19:12:01 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: Ollie Lho <ollie@sis.com.tw>
CC: hecman@evoserve.com, mtd@infradead.org
Subject: Re: SOLVED: Turnning On DOC Millennium ECC Logic
References: <397825D6.BDE058A3@sis.com.tw>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hec, this got me very excited:

Ollie Lho wrote:

> David,
>         I have successfully turned on the ECC logic of DoC Millennium. The
> ECC logic correctly caculate the ECC on both read and write cases. Now the Millennium driver is as complete as DoC 2000
> driver. I will send you a patch
> next Monday after I did some test (should I CC to Linus also ??).
>
> Ronald,
>         I can now program the IPL area correctly, the IPL area can be download

Cool! Can this be done on the DOC2000 too?

>
> by the internal logic of the Millennium such that the disk on chip acts as a
> 512 bytes ROM when power-up. We can proceed to work on how to shrink the DRAM
> sizing/timing code into 512 byte. After that we will have a complete Diskless,
> BIOSless, maintance free enviroment which should be very useful for you cluster

Is that also usefull on ordinary PC?  Super cool!

>
> nodes. BTW, did you read the SPD DRAM sizing/timing code I sent to you ?? And
> did you reproduce the SiS FB (no VGA BIOS) stuff on your side ??
>
> Ollie
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
