Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sRme-0002NW-00
	for mtd-list@infradead.org; Wed, 25 Apr 2001 17:04:52 +0100
Received: from mail.com1.fr ([62.161.40.252])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sRmb-0002NQ-00
	for mtd@infradead.org; Wed, 25 Apr 2001 17:04:50 +0100
Received: from MSTEMPIN (ns.com1.fr [62.161.40.253])
	by mail.com1.fr (8.9.3/8.9.3) with SMTP id SAA27909
	for <mtd@infradead.org>; Wed, 25 Apr 2001 18:04:43 +0200
From: "Michel STEMPIN" <mstempin@com1.fr>
To: "mtd" <mtd@infradead.org>
Subject: Booting from StrataFlash on SBC-104
Date: Wed, 25 Apr 2001 18:05:02 +0200
Message-ID: <NEBBLPFMELCDALFMOJILEEFGCFAA.mstempin@com1.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I am trying to squeeze linux on an Arcom SBC-104 board (4Mb DRAM/4Mb
StrataFlash).

Right now, I am able to make it boot from a noisy HDD, a silent (somewhat
appendix-like) CompactFlash, and from an additional DOC, using the binary
driver from M-Systems as a ramdisk-loaded driver.

My goal is to be able to boot it from the built-in StrataFlash device, and
thus, I have a few questions:
	- would you recommend using JFFS or JFFS2?
	- I saw a "boot" directory under the CVS: what is its status?
	- under "boot" the Makefile is building 2 targets "flashloader.rom" and
"sbc_mediagx.rom": what are they for? Which one should I get, since the
sbc_mediagx and the sbc_104 are from the same manufacturer?

I guess the best way will be to follow the HOWTO, then build one of these
and transfer it onto the chip. How? Is it a "dd" using the mtdblock device?

Excuse me for these dummy questions, I am new to the list, and trying to
catch up with the train! I tried to read the archives first, finding no
answer.

--
Michel Stempin
MIS
COM One SA, 11 parc de Marticot, 33610 CESTAS, FRANCE
Tel: +33(0)5 57 97 72 72
Fax: +33(0)5 56 78 84 78
Email: mstempin@com1.fr



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
