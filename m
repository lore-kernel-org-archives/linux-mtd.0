Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14nqG1-0004P0-00
	for mtd-list@infradead.org; Fri, 13 Apr 2001 00:12:09 +0100
Received: from mail.ss7-link.com ([209.204.106.218] helo=slink12.ss7-link.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14nqFx-0004Ou-00
	for mtd@infradead.org; Fri, 13 Apr 2001 00:12:05 +0100
Message-ID: <F1BD619B2A58D41197990050DA2C08E40258D8@SLINK12>
From: Jan Rovins <jrovins@ss7-link.com>
To: mtd@infradead.org
Cc: Steve Ferri <sferri@ss7-link.com>
Subject: MTD on a Motorola MPCN765 ?
Date: Thu, 12 Apr 2001 19:11:34 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi all,
We are working on a project that involves a MPCN765 host card, and we are
running a 2.2.17 Kernel.
I have Downloaded the MTD patches and have merged them into our kernel, and
every thing still boots...
I tried some guesses at AMD CFI configuration, but it looks like our board
has exotic flash chips & geometry
that are not currently supported in MTD. (Time to roll up my sleeves & start
hacking code)

The MPCN765 has a 16MB bank of flash that is 64 bits wide (Ugh!) and is
comprised of four 16 bit devices.
we are planning to use the bottom 2/3 of this for boot image and the top 1/3
for application data storage (via MTD).
The Motorola literature mentions the flash chips as AM29DL323C in one
document, and AM29LV323C in an other doc.
The chips them selves say D323CT90VI on them, and the only data sheet that
is on the AMD web site is for a AM29DL323D.
at this point I am hoping that these are all similar enough so that the
differences wont matter.
 Is any one out there familiar with these chips? 

Right now I am looking for some general guidance as to which direction to
proceed.
my gut feel is to do a board specific Mapping implementation, because of the
strange geometry.
The other alternative would be to expand the generic AMD/CFI stuff so that
it could accommodate our board's flash geometry.
at this point I am still familiarizing myself with the MTD code, and would
appreciate any opinions and/or advice.

Thanks in advance,

Jan Rovins 
Member Technical Staff 
S-Link Corp. 
jrovins@ss7-link.com 
856-642-9229 X-228 




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
