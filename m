Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13H0Vf-0007Th-00
	for mtd-list@infradead.org; Tue, 25 Jul 2000 09:56:19 +0100
Received: from [62.6.164.226] (helo=mail.linuxgrrls.org ident=postfix)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13H0Ve-0007Ta-00
	for mtd@infradead.org; Tue, 25 Jul 2000 09:56:18 +0100
Date: Tue, 25 Jul 2000 09:59:28 +0100 (BST)
From: Kira Brown <kira@linuxgrrls.org>
To: sl@fireplug.net
Cc: mtd@infradead.org
Subject: Re: ELANSC400
In-Reply-To: <8likhn$d2h$1@whiskey.fireplug.net>
Message-ID: <Pine.LNX.4.21.0007250955450.27686-100000@carrot.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On 24 Jul 2000, Stuart Lynne wrote:

> The flash parts on the SC400 are mapped through the SC400 MMU. There are 
> several models, but the easiest is to map them 8kb at a time into a memory
> window in low memory (0xc8000 if I remember correctly).

Actually, it can be anywhere between 0xc8000 and 0xd4000, maybe even
higher than that, I can't remember.  The MMU isn't really involved.  the
SC4x0 generates a bunch of chipselects whose active address windows can be
set using addressed registers.  The PCMCIA system is involved on SC400,
and the vestiges of it are involved on SC410.  Interestingly, there's also
a chip called SC405, but I can't get AMD to admit that it exists...

kira.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
