Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ptsi-0008DE-00
	for mtd-list@infradead.org; Thu, 11 May 2000 15:24:04 +0100
Received: from morrison.matrox.com ([204.50.136.19])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ptsg-0008D8-00
	for mtd@infradead.org; Thu, 11 May 2000 15:24:02 +0100
Received: (from mtxmail@localhost)
	by morrison.matrox.com (8.8.8/8.8.8) id KAA21601
	for <mtd@infradead.org>; Thu, 11 May 2000 10:29:38 -0400 (EDT)
Received: from pluton.matrox.com (pluton.matrox.com [192.168.145.6])
	by venus.matrox.com (8.9.3/8.9.3) with ESMTP id KAA27323
	for <mtd@infradead.org>; Thu, 11 May 2000 10:28:31 -0400 (EDT)
Received: from matrox.com (scote1@dyn-18-103.matrox.com [192.168.18.103])
	by pluton.matrox.com (8.8.8/8.8.8) with ESMTP id KAA06560
	for <mtd@infradead.org>; Thu, 11 May 2000 10:28:34 -0400 (EDT)
Message-ID: <391AC3AB.F92C72CD@matrox.com>
Date: Thu, 11 May 2000 10:28:59 -0400
From: =?iso-8859-1?Q?S=E9bastien=20C=F4t=E9?= <scote1@Matrox.COM>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: ext2_lookup() and i_count
References: <Pine.LNX.3.96.1000511160915.11688A-100000@biffen.cendio.se>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Alexander Larsson wrote :

> First create your to be filesystem in a directory (call it e.g. img_dir=
),
> then run "mkfs.jffs img_dir > fs.jffs", this creates an image fs.jffs t=
hat
> you can copy to your flash (in the case of an mtdram flash, just do "ca=
t
> fs.jffs > /dev/mtd0". Then mount the flash "mount -t jffs /dev/mtdblock=
0
> /mnt/jffs".

How can I create these devices??  MAKEDEV doesn't know about them and
mknod needs major/minor numbers that aren't mentionned anywhere...

./MAKEDEV: don't know what "mtd" is

--
S=E9bastien C=F4t=E9


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
