Received: from code-monkey.de ([88.198.45.137])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oln1C-0003dx-1l
	for linux-mtd@lists.infradead.org; Wed, 18 Aug 2010 18:05:43 +0000
Received: from brimstone (stgt-d9be8498.pool.mediaWays.net [217.190.132.152])
	by code-monkey.de (Postfix) with ESMTPA id B3C163F236
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Aug 2010 20:05:38 +0200 (CEST)
Date: Wed, 18 Aug 2010 20:05:38 +0200
From: Tilman Sauerbeck <tilman@code-monkey.de>
To: linux-mtd@lists.infradead.org
Subject: Bad assumption about ID field definition for Samsung NAND?
Message-ID: <20100818180538.GA12238@code-monkey.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
on my GuruPlug, I was seeing lots of bad block errors for the NAND chip
when booting a 2.6.35 kernel. With earlier kernels (2.6.33, 2.6.34),
no bad blocks were reported. See below for the exact error messages.
Since _all_ of the first 128 blocks are claimed to be bad, and the NAND
chips appears to be working just fine, I suspect the kernel is lying.

I bisected linux-2.6.35.y.git, and found that the kernel started
reporting bad blocks starting with this commit:
426c457a3216fac74e mtd: nand: extend NAND flash detection to new MLC chips

Patching nand_base.c with the following diff (thus restoring the
previously used behaviour) the kernel stops reporting bad blocks:

@@ -2852,6 +2852,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
                 */
                if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
                                id_data[0] == NAND_MFR_SAMSUNG &&
+                               (chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
                                id_data[5] != 0x00) {
                        /* Calc pagesize */
                        mtd->writesize = 2048 << (extid & 0x03);

I added a check for the MLC bit since
a) the commit message talks about MLC chips and
b) the NAND chip that the GuruPlug features is a Samsung K9F4G08U0B
   (which is SLC according to the part number decoder on samsung.com)

I have no idea if that's the right fix though. Unfortunately I couldn't
find the data sheet for the K9F4G08U0B online, so I couldn't verify if
it uses the old field definition or the new one...

Please CC me in your replies; I'm not subscribed to the list.

Thanks,
Tilman

Kernel messages:
Scanning device for bad blocks
Bad eraseblock 0 at 0x000000000000
Bad eraseblock 1 at 0x000000400000
[same for the following blocks]
Bad eraseblock 127 at 0x00001fc00000
Creating 3 MTD partitions on "orion_nand":
0x000000000000-0x000000100000 : "u-boot"
mtd: partition "u-boot" doesn't end on an erase block -- force read-only
Moving partition 1: 0x000000100000 -> 0x000000400000
0x000000400000-0x000000800000 : "uImage"
0x000000800000-0x000020000000 : "root"

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?
