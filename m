Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QqVeS-00012B-Bc
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2011 19:38:18 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 5/9] doc: nand: update YAFFS URL
Date: Mon, 8 Aug 2011 12:37:15 -0700
Message-ID: <1312832239-21759-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
References: <1312832239-21759-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The YAFFS website has moved. They're sitll redirecting, but we should
switch.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 doc/nand.xml |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/doc/nand.xml b/doc/nand.xml
index 1d55685..281e0e0 100644
--- a/doc/nand.xml
+++ b/doc/nand.xml
@@ -139,7 +139,7 @@ designed for the usage of DiskOnChip devices. JFFS2 supports raw NAND chips and
 SmartMediaCards at the moment. A JFFS2 support for DiskOnChip devices, based on the 
 NAND code, is planned. There are some other Open Source projects for NAND filesystem 
 support, but there's no other working solution than JFFS, YAFFS, and UBIFS at the moment of this writing.
-YAFFS is available from <a href="http://www.aleph1.co.uk/armlinux/projects/yaffs">YAFFS-Homepage</a>.
+YAFFS is available from <a href="http://www.yaffs.net/">YAFFS-Homepage</a>.
 YAFFS is faster than JFFS2 and consumes less RAM, JFFS2 provides on the fly file compression and
 decompression, which is very helpful for small FLASHs.  UBIFS provides compression similar to JFFS2, but
 is usually a better choice for large NAND flash chips (see <a href="ubifs.html">here</a> for more 
@@ -334,7 +334,7 @@ CONFIG_JFFS2_FS_NAND=y</p>
 <h2>References:</h2>
 <h3>Open Source</h3>
 <p>JFFS2, NTFL, and UBIFS are located on this <a href="../index.html">website</a>.<br />
-YAFFS is located at <a href="http://www.aleph1.co.uk/armlinux/projects/yaffs">YAFFS-Homepage</a>.</p>
+YAFFS is located at <a href="http://www.yaffs.net/">YAFFS-Homepage</a>.</p>
 <h3>Hardware</h3>
 <p><a href="http://www.toshiba.com/taec">Toshiba</a></p>
 <p><a href="http://samsungelectronics.com">Samsung</a></p>
-- 
1.7.0.4
