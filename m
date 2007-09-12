Received: from relay.peterstar.ru ([217.195.65.5])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IVPh0-0004ql-7H
	for linux-mtd@lists.infradead.org; Wed, 12 Sep 2007 06:43:37 -0400
Received: from fiord.com ([84.204.217.186])
	by relay.peterstar.ru (8.14.1/8.11.4) with ESMTP id l8CAhKTj020148
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Sep 2007 14:43:32 +0400 (MSD)
Received: from sarge.FIORD by fiord.com (MDaemon PRO v9.0.8)
	with ESMTP id md50000108844.msg
	for <linux-mtd@lists.infradead.org>; Wed, 12 Sep 2007 14:46:12 +0400
Received: from anthony by sarge.FIORD with local (Exim 4.44)
	id 1IVPgM-00011w-MD
	for linux-mtd@lists.infradead.org; Wed, 12 Sep 2007 14:42:54 +0400
Date: Wed, 12 Sep 2007 14:42:54 +0400
To: linux-mtd@lists.infradead.org
Subject: problems with DOCboot
Message-ID: <20070912104254.GA3953@fiord.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
From: Anthony Sharobaiko <anthony@fiord.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm trying to get DOCboot working with doc2000. Currently it installs itself
ok, but fails to find kernel image block - the one with 0xdb b1 bytes in OOB
area (prints "CANNOT FIND IMAGE ON DEVICE" after scanning entire(?)
partition).

And there is no 0xdb b1 signature in `nanddump /dev/mtd1` nor in doc_spl
(generated image of docboot+kernel). -o switch of nandwrite does not help.
What tool and from what generates oob data? nandwrite from image being
written?

I use latest mtd-utils from cvs (flash_eraseall, nandwrite) and vanilla kernel
v2.6.22.6.
Size of BDK partition is appropriate for docboot image (generated doc_spl is
1412400 bytes long, I
issued 'dformat /win:e000 /bdkl0:1500k', hope this is enough).

#cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00004000 "DiskOnChip 2000 (NFTL Model)"
mtd1: 00180000 00004000 " DiskOnChip Firmware / Media Header partition"
mtd2: 01e80000 00004000 " DiskOnChip BDTL partition"

What did I forget?

-- 
