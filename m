Received: from [195.144.108.44] (helo=mail.deltaes.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ojL1-0003gi-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 11:33:16 +0100
Received: from lxserver.deltes.cz (IDENT:martin@lxserver.deltes.cz [192.168.5.5])
	by mail.deltaes.com (8.9.3/8.9.3) with ESMTP id KAA27663
	for <linux-mtd@lists.infradead.org>; Wed, 3 Oct 2001 10:43:55 +0200
Date: Wed, 3 Oct 2001 12:43:08 +0200 (CEST)
From: martin.kula@deltaes.cz
Reply-To: martin.kula@deltaes.cz
To: linux-mtd@lists.infradead.org
Subject: DoC (NFTL) problem with 2.4.10-ac3
Message-ID: <Pine.LNX.4.21.0110031230510.6225-100000@lxserver.deltes.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi
I tried new kernel 2.4.10-ac3 and I get next result for my DoC2000
(24MB) drive :
..................
DiskOnChip 2000 found at address 0xE8000
..............
ANAND header found at 0xc000 in mtd0, but ECC read failed (err 1)
ANAND header found at 0xe000 in mtd0, but ECC read failed (err 1)
Could not find valid boot record
Could not mount NFTL device
.........
mount: /dev/nftla1: unknown device

With the yesterday MTD cvs snapshot is result the same.

Have you any ideas?

Thanks

Martin
