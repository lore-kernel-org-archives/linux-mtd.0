Received: from snail.directvbroadband.net ([216.227.60.197])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vohQ-0003MB-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 00:09:24 +0100
Received: from snail.directvbroadband.net (snail.directvbroadband.net [216.227.60.197])
	by snail.directvbroadband.net (Build 101 8.9.3/NT-8.9.3) with SMTP id QAA08958
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 16:25:23 -0700
Message-ID: <617933180D08D311AB500090273F1F96016767DE@storm.corp.directvbroadband.net>
From: "Fry, Dan" <dfry@bb.directv.com>
To: linux-mtd@lists.infradead.org
Subject: Improper Command Sequence
Date: Fri, 4 May 2001 16:09:46 -0700 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi List,

I'm still trying to get JFFS2 up and running on an atlas demo board. 

I have four 64Mbit Intel Strata Flash chips which are seemly being detected.


physmap flash device: 2000000 at 1c000000 
Physically mapped flash: Found 2 x16 devices at 0x0 in 32-bit mode

Physically mapped flash: Found 2 x16 devices at 0x1000000 in 32-bit mode

JEDEC ID: 89 15

0: offset=0x0,size=0x40000,blocks=64

1: offset=0x1000000,size=0x40000,blocks=64  


However when I attempt to mount /dev/mtdblock0/ as JFFS2 I get the
following: 

JFFS2: Erase block at 0x00000000 is not formatted. It will be erased

JFFS2: Erase block at 0x00040000 is not formatted. It will be erased

JFFS2: Erase block at 0x00080000 is not formatted. It will be erased

JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased

JFFS2: Erase block at 0x00100000 is not formatted. It will be erased

JFFS2: Erase block at 0x00140000 is not formatted. It will be erased

JFFS2: Erase block at 0x00180000 is not formatted. It will be erased

JFFS2: Erase block at 0x001c0000 is not formatted. It will be erased

JFFS2: Erase block at 0x00200000 is not formatted. It will be erased


Chip reports improper command sequence: status 0xa800a8

Erase at 0x01fc0000 failed immediately: -5

Chip reports improper command sequence: status 0xa800a8

Erase at 0x01f80000 failed immediately: -5

Chip reports improper command sequence: status 0xa800a8

Erase at 0x01f40000 failed immediately: -5

Chip reports improper command sequence: status 0xa800a8

Erase at 0x01f00000 failed immediately: -5

Chip reports improper command sequence: status 0xa800a8

Erase at 0x01ec0000 failed immediately: -5

Chip reports improper command sequence: status 0xa800a8

Erase at 0x01e80000 failed immediately: -5



Questions :
1) Does MTD support Intel Strata Flash??
2) Could there be a locking problem? 
-- I looked through the code and it seems that locking is handled.

Cheers,

	- Dan        
