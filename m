Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H0qN-0007Yd-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 10:17:43 +0100
Received: from cr355197-a.poco1.bc.wave.home.com ([24.112.113.88] helo=whiskey.fireplug.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H0qM-0007YX-00
	for mtd@infradead.org; Tue, 25 Jul 2000 10:17:42 +0100
Date: Tue, 25 Jul 2000 02:17:38 -0700
From: Stuart Lynne <sl@fireplug.net>
To: Kira Brown <kira@linuxgrrls.org>
Cc: mtd@infradead.org
Subject: Re: ELANSC400
Message-ID: <20000725021738.X19558@fireplug.net>
Reply-To: Stuart Lynne <sl@fireplug.net>
References: <8likhn$d2h$1@whiskey.fireplug.net> <Pine.LNX.4.21.0007250955450.27686-100000@carrot.linuxgrrls.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0007250955450.27686-100000@carrot.linuxgrrls.org>; from kira@linuxgrrls.org on Tue, Jul 25, 2000 at 09:59:28AM +0100
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Tue, Jul 25, 2000 at 09:59:28AM +0100, Kira Brown wrote:
> 
> 
> On 24 Jul 2000, Stuart Lynne wrote:
> 
> > The flash parts on the SC400 are mapped through the SC400 MMU. There are 
> > several models, but the easiest is to map them 8kb at a time into a memory
> > window in low memory (0xc8000 if I remember correctly).
> 
> Actually, it can be anywhere between 0xc8000 and 0xd4000, maybe even
> higher than that, I can't remember.  The MMU isn't really involved.  the
> SC4x0 generates a bunch of chipselects whose active address windows can be
> set using addressed registers.  The PCMCIA system is involved on SC400,
> and the vestiges of it are involved on SC410.  Interestingly, there's also
> a chip called SC405, but I can't get AMD to admit that it exists...
 
Well it has been a year since I wrote that driver.... so I checked the SC400 
Register Set Manual..

The simple way is to use MMS Window A which is 32k bytes wide with a fixed
address range of B0000-B7FFFh (Pg. 3-40).

This is of course assuming the Flash devices are wired to their own select
line which is the norm on their (AMD) reference board. 

I suppose you could can also use the PC Card A or B memory space. That is
not what they (AMD) do on their reference board.

-- 
                                            __O 
Fireplug - a Lineo company                _-\<,_ 
PGP Fingerprint: 28 E2 A0 15 99 62 9A 00 (_)/ (_) 88 EC A3 EE 2D 1C 15 68
Stuart Lynne <sl@fireplug.net>         www.lineo.com         604-461-7532


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
