Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14Sey5-0006TA-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 12:54:05 +0000
Message-ID: <C88F387E7F6ED4118B5308002BC3EB1E0327D5@yen.crl.dec.com>
From: Jamey Hicks <jamey@crl.dec.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
       Jonas Holmberg
	 <jonas.holmberg@axis.com>
Cc: Johan Adolfsson <johan.adolfsson@axis.com>, mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Tue, 13 Feb 2001 07:53:23 -0500
MIME-Version: 1.0
Content-Type: text/plain
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


According to the spec, you should be able to look at the AMD autoselect
codes.  Autoselect with A1=0, A0=1
	D[15:8] => 0x22
	D[7:0] => 0xC4  for top boot
	D[7:0] => 0x49 for bottom boot

-Jamey

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Tuesday, February 13, 2001 4:17 AM
To: Jonas Holmberg
Cc: Johan Adolfsson; mtd@infradead.org
Subject: Re: Problems with cfi_cmdset_0002.c 



jonas.holmberg@axis.com said:
> I have two AM29LV160D one top and one bottom boot and the both say
> bootloc==0 :(

One of these days I really am going to painfully slaughter a hardware 
designer. The engineers at an unnamed company who decided to route the 
PCMCIA socket's interrupt line to a general purpose I/O line on the SH3 CPU 
without any possibility of generating an interrupt were prime targets a few 
weeks ago. AMD are in that spot now. Strange - the chip manufacturers are 
generally more clueful - it's the monkeys who glue them together who 
usually screw it up (present company excepted :)

Is there _any_ difference between these chips which is detectable without 
actually trying to erase the damn things and observing how much data gets 
removed?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
