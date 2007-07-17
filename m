Received: from xerxes.tchmachines.com ([208.76.80.175])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IAwVj-0007qc-6D
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 19:31:22 -0400
Message-ID: <1766.69.30.123.186.1184715072.squirrel@architechnical.net>
Date: Tue, 17 Jul 2007 16:31:12 -0700 (PDT)
Subject: jffs2 cleanmarker on OneNAND
From: "Pete MacKay" <linux@architechnical.net>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We're using a hand-updated 2.6.18 kernel with a root partition on OneNAND.
 We write a jffs2 image (mkfs.jffs2 version 1.50) with nandwrite -p.  If
we use flash_eraseall -j to write the cleanmarkers to the OOB then
jffs2_check_nand_cleanmarker comes back OK but jffs2_check_oob_empty
returns a 1 because it sees 0x30 at location 0xB, which is part of the
cleanmarker (it ignores ECC data properly).  This causes an unnecessary
block erase.

Does anyone know why that byte in the cleanmarker isn't being skipped in
checking for 0xFF?

mtd-utils are latest from git cross-compiled to arm-linux with gcc-3.4.4
running on a PXA-270.

Also, different topic: we get "Unknown but compatible feature node
(0x2005)" messages at the beginning of each populated block.  Any ideas on
that?  Mismatched MTD driver / mtd-utils versions maybe?

Thanks Much,
Pete MacKay
