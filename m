Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13ECBO-00078P-00
	for mtd-list@infradead.org; Mon, 17 Jul 2000 15:47:46 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13ECBK-00078J-00
	for mtd@infradead.org; Mon, 17 Jul 2000 15:47:43 +0100
Received: (from mtxmail@localhost)
	by morrison.matrox.com (8.8.8/8.8.8) id KAA12347
	for <mtd@infradead.org>; Mon, 17 Jul 2000 10:47:43 -0400 (EDT)
Received: from pluton.matrox.com (pluton.matrox.com [192.168.145.6])
	by venus.matrox.com (8.9.3/8.9.3) with ESMTP id KAA11541
	for <mtd@infradead.org>; Mon, 17 Jul 2000 10:46:58 -0400 (EDT)
Received: from matrox.com (scote1@dyn-18-107.matrox.com [192.168.18.107])
	by pluton.matrox.com (8.8.8/8.8.8) with ESMTP id KAA12456
	for <mtd@infradead.org>; Mon, 17 Jul 2000 10:44:37 -0400 (EDT)
Message-ID: <39731CC4.65600194@matrox.com>
Date: Mon, 17 Jul 2000 10:48:36 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Compiling MTD in the kernel
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi,

I just tried to compile MTD in the kernel (not as a module) btu, even if
everything compiles fine, it doesn't work.  If I try to cat a jffs image
in /dev/mtd0 (I use mtdram), I get:

bash: /dev/mtd0: No such device.

If I try to mount a partition using jffs (even though this partition
isn't jffs), I get:
mount: fs type jffs not supported by kernel

It's the same errors I would get If I had compiled everything as modules
but didn't load them.

Any clue?

--=20
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
