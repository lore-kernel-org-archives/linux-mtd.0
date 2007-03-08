Received: from lst-amand-152-33-17-184.w82-127.abo.wanadoo.fr ([82.127.60.184]
	helo=polaris.sacet.fr)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HPMRx-0008Bz-6Y
	for linux-mtd@lists.infradead.org; Thu, 08 Mar 2007 12:30:47 -0500
Received: from [127.0.0.1] (mimosa.sacet.fr [192.168.82.19])
	by polaris.sacet.fr (8.12.11/8.12.11) with ESMTP id l28HVYj0019814
	for <linux-mtd@lists.infradead.org>; Thu, 8 Mar 2007 18:31:34 +0100
Message-ID: <45F0468C.5020306@sacet.com>
Date: Thu, 08 Mar 2007 18:23:24 +0100
From: Michel LECONTE <michel.leconte@sacet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND Flash FTL
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks David it works now.

The problem now is it's too long to be mount.
I think my filesystem is too big.
I've try another way with FTL and ext2.
First I did some partition :
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00010000 "physmap-flash.0"
mtd1: 04000000 00020000 "Linux"
mtd2: 0e000000 00020000 "Apps"
mtd3: 10000000 00020000 "Data"

Then I used nftl_format :
# ./nftl_format /dev/mtd1
$Id: nftl_format.c,v 1.24 2005/11/07 11:15:13 gleixner Exp $
Unrecognized Erase size, 0x20000 - I'm confused

And ftl_format :
cm-debian:/opt# ./ftl_format /dev/mtd1
Partition size = 64 mb, erase unit size = 128 kb, 1 transfer units
Reserved 5%, formatted size = 62883328 bytes
Erasing all blocks...
+++
block erase failed: Input/output error
format failed.

ftl_chek :
cm-debian:/opt# ./ftl_check /dev/mtd1
Memory region info:
  Region size = 64 mb  Erase block size = 128 kb

No valid erase unit headers!

What's wrong ?
Can I use FTL with my NAND Flash ?
ftl_format is it just for PMCIA and nftl_format for Disk On Chip or not ?
