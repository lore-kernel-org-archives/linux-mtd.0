Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14tkcN-0003l3-00
	for mtd-list@infradead.org; Sun, 29 Apr 2001 07:23:39 +0100
Received: from www.ccimackay.com
	([203.52.109.14] helo=mail.ccimackay.com ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14tkcK-0003kx-00
	for mtd@infradead.org; Sun, 29 Apr 2001 07:23:37 +0100
Received: from dave (dave.ccimackay.com [192.168.100.130])
	by mail.ccimackay.com (8.9.3/8.8.7) with SMTP id QAA26035
	for <mtd@infradead.org>; Sun, 29 Apr 2001 16:41:03 +1000
Message-ID: <004b01c0d074$d2c3b980$8264a8c0@dave>
From: "David Griffith" <dgriffith@ccimackay.com>
To: <mtd@infradead.org>
Subject: Modification to Doc2000.c for Virgin Webplayer
Date: Sun, 29 Apr 2001 16:22:53 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,
    Apologies for this note if someone else has been there / done that.

I have a few Virgin Webplayers with 48MB doc2000's in them.
(Basically a MediaGX 200Mhz sbc)

Anyways, I've been having trouble with the detection of the DOC. The MTD
drivers in the linux kernel have trouble finding
partitions on the DOC. (When I say "Have trouble" its means 99 out of 100
times the nftl layer can't find a valid boot record, gets all grumpy, and
gives up).

So I turned on debugging,  liberally sprinkled a few more printk's around..
and hmmm.... turning on level 3 debugging makes it work.

So, I says to meself, "Self, it must be some interaction with some sort of
delay thingy with the DoC :-)",  a quick poke through the source showed this
in doc2000.c in one of the functions near the front (I can't remember the
name! sorry - my code is at home!)

 what makes it work is to change this line (about 75 lines down in kernel
2.4.4):

    for (i = 0; i < cycles ; i++) {

    to this :

    for (i = 0; i < cycles*4 ; i++) {


This effectively *quadruples* the delay time for all sorts of things in the
code it seems.
With this in - I can detect partitions, mount them , read / write to them
just fine.
I did try just doubling it, and I could read it, but it wasn't very happy
about writing to it.
I'd post logs , but currently I boot to a ramdisk...

So,
Any ideas as to why? ;-)

Regards,
    David



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
