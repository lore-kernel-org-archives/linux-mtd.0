Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H6cS-0000h1-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 16:27:44 +0100
Message-ID: <F6E17DCC9E59D411979400508BD9041402379F@mail.msys.co.il>
From: Oron Ogdan <Orono@m-sys.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: 64M DOC2000 
Date: Tue, 25 Jul 2000 18:27:12 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-8"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

A small issue I think you guys should know about. From 15/7/2000 we are
using Samsung parts as well as Toshiba parts. I am pasting the list of parts
that could be used on the DOC2000. 

Samsung (Manufacture ID = 0xEC )
=================================
(0x64) :             /* 2 Mb */
(0xEA) :

(0xE3) :             /* 4 Mb */
(0xE5) :

(0xE6) :             /* 8 Mb */

(0x73) :             /* 16 Mb  */

(0x75) :             /* 32 Mb */

(0x76) :             /* 64 Mb */

Toshiba (Manufacture ID 0x98) 
=================================
(0x64) :             /* 2 Mb */
(0xEA) :

(0x6B) :             /* 4 Mb */
(0xE5) :

(0xE6) :             /* 8 Mb */

(0x73) :             /* 16 Mb */

(0x75) :             /* 32 Mb */

(0x76) :             /* 64 Mb */

Regards

Oron

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Tuesday, July 25, 2000 3:32 PM
> To: Ian Thompson
> Cc: mtd@infradead.org
> Subject: Re: 64M DOC2000 
> 
> 
> 
> ithompson@coollogic.com said:
> > I've just tried a 64M Doc2000 with kernel 2.2.16 and the 
> IGEL driver,
> > and it is not recognised. I have no problems with 16M and 32M parts.
> > Can someone on the list confirm that this is the case? 
> 
> No clue. Try it with the free driver and see what happens.
> 
> --
> dwmw2
> 
> 
> 
> 
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
> 


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
