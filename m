Received: from sigma.superhosting.bg ([91.196.124.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LypmP-00063q-KB
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 16:03:40 +0000
Received: from blueice2n1.de.ibm.com ([195.212.29.171] helo=[9.157.146.18])
	by sigma.superhosting.bg with esmtpsa (SSLv3:AES256-SHA:256)
	(Exim 4.69) (envelope-from <s.popov@rsc.bg>) id 1LypmN-0000i1-IB
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 19:03:31 +0300
Message-ID: <49F728CE.8090200@rsc.bg>
Date: Tue, 28 Apr 2009 19:03:26 +0300
From: Stanislav Popov <s.popov@rsc.bg>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND + YAFFS2 - bad blocks
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have 64 MB NAND flash on Jacinto (ARM) board.
I am using the device formatted as one YAFFS2 partition.
My SW ECC from NAND is enabled in the kernel and "useNANDECC" in YAFFS 
is set to 0
(If this is non-zero, then YAFFS will not perform ECC and it is assumed 
that the hardware ECC or specified NAND access functions will perform EC 
checks.)

I found that I have 1000-2000 eraseblocks that were reported as "bad block".
I can see them in u-boot with "nand bad" command and when laoding my 
nand_jacinto driver.
When using the NAND they are getting much more.
Actually they are NOT bad blocks!

I edited the kernel and remove is_bad checking when erasing.
Also I edited the mtd-utils (flash_eraseall) and removed is_bad checking 
when erasing.
So I was able to make low-level format of my NAND flash which also erase 
the bad blocks.
(like 'nand erase scrub' command in u-boot, but I currently I do not 
have such command)
After that I had NO bad blocks.

I made some tests:
I formatted Nand with YAFFS2 FS
-  YAFFS2 ECC + NO NAND ECC - when using fs appeared bad blocks and 
getting more.
-  YAFFS2 NO ECC + NAND SW ECC - when using fs appeared bad blocks and 
getting more.

I formatted Nand with EXT2 FS (ext2 fs is not writing into oob)
-  NAND SW ECC ENABLE - NO bad blocks appeared in the time!!!

So the result is that the issue is in using YAFFS2 + NAND.

Maybe the source of the issue is some YAFFS2 configurations?
Do you have any idea?
It's very critical issue for me.

Thanks and Regards,
Stanislav
