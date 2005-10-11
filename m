Received: from w228.z208176144.sjc-ca.dsl.cnc.net ([208.176.144.228]
	helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EP7dk-0003G1-98
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 20:05:17 -0400
Received: from jmd (w238.z208176144.sjc-ca.dsl.cnc.net [208.176.144.238])
	(authenticated bits=0)
	by ns1.pwrseries.com (8.12.8/8.12.8) with ESMTP id j9ANfFj4027739
	(version=TLSv1/SSLv3 cipher=DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Mon, 10 Oct 2005 16:41:15 -0700
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 Oct 2005 17:04:57 -0700
MIME-Version: 1.0
Message-ID: <434A9F39.29129.1B3216A@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Subject: docboot: nandwrite:  Input file is not page aligned
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am trying to use the /mtd/docboot tool to place a boot image on a 
DOC 2000 (INFTL version), but nandwrite is failing:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 08000000 00004000 "DiskOnChip 2000 (INFTL Model)"
mtd1: 00a14000 00004000 " DiskOnChip BDK partition"
mtd2: 075dc000 00004000 " DiskOnChip BDTL partition"
# flash_eraseall /dev/mtd1
erasing 16 Kibyte @ 74000 -- 4 % complete
Skipping badblock @ 0x00078000
Erasing 16 Kibyte @ a10000 -- 99 % complete.
# nandwrite -o /dev/mtd1 doc_spl
Input file is not page aligned: Success
Data did not fit into device, due to bad blocks.
: Success

First, what is this "Input file is not page aligned" error and how do 
I make the doc_spl image so that it is page aligned?

Second,  there is only one bad block on the 10MB BDK partition, so 
there shouldn't be any problem loading my doc_spl which is only 1.9MB 
(Unless nandwrite is not aware of bad blocks.) How do I fix that 
issue?

Third,  when the kernel reads the bbt it reports two bad blocks:
nand_read_bbt: Bad block at 0x00080000
nand_read_bbt: Bad block at 0x03370000
nand_read_bbt: Reserved block at 0x07ffc000
That, in conjunction with the badblock reported by flash_eraseall, 
indicates to me that the IPL is actually using 2 eraseblocks.
(0x0080000 - 0x00078000 = 0x00008000)
I thought the IPL is only supposed to be in the first erase block.  
Is that correct?

Thanks a mega,

- Joe
