Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Q3xs-0002Av-00
	for mtd-list@infradead.org; Wed, 01 Mar 2000 07:54:36 +0000
Received: from adsl-63-192-223-74.dsl.snfc21.pacbell.net ([63.192.223.74] helo=gateway.berkeley.innomedia.com)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Q3xq-0002Ap-00
	for mtd@infradead.org; Wed, 01 Mar 2000 07:54:34 +0000
Received: from berkeley.innomedia.com (imap.berkeley.innomedia.com [192.168.1.5])
	by gateway.berkeley.innomedia.com (8.9.1/8.9.1) with ESMTP id XAA01636
	for <mtd@infradead.org>; Tue, 29 Feb 2000 23:14:58 -0800
Received: (from mickey@localhost)
	by berkeley.innomedia.com (8.9.3/8.9.3) id XAA00389
	for mtd@infradead.org; Tue, 29 Feb 2000 23:54:31 -0800
From: Michael Thompson <mickey@berkeley.innomedia.com>
Message-Id: <200003010754.XAA00389@berkeley.innomedia.com>
Subject: How to use MTD
To: mtd@infradead.org
Date: Tue, 29 Feb 2000 23:54:31 -0800 (PST)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



I'd really like to start experimenting with MTD, but I'm afraid I've only
got half a clue about how to use it.

Here's what I'd like to do:

	1) Create an ext2 filesystem on an mtd block device and mount
	   it read-write from linux. This is to experiment with MTD
	   without the flash.
	2) Create an ext2 filesystem on a set of flash devices from an
	   embedded system running linux. The underlying flash devices
	   are Intel's StrataFlash; they support CFI and JEDEC.

To accomplish (1), I thought I should:

	# insmod mtd
	# insmod slram
	# insmod mtdblock
	# mkfs -t ext2 /dev/mtdblock0
but mkfs says:
        mke2fs 1.15.6, 13-Aug-1999 for EXT2 FS 0.5b, 95/08/09
        /dev/mtdblock0: Invalid argument passed to ext2 library while setting up        superblock

Can someone please explain the fundamentals?

Thanks!

-Michael Thompson
mickey@berkeley.innomedia.com


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
