Received: from lgeamrelo13.lge.com ([156.147.23.53])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ciaOv-0006sv-Lc
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 05:32:47 +0000
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Richard Weinberger <richard@nod.at>
CC: Artem Bityutskiy <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, Hyunchul Lee <cheol.lee@lge.com>
Subject: [PATCH 3/3] ubifs: add "compr=lz4hc" into ubifs.txt
Date: Tue, 28 Feb 2017 14:17:17 +0900
Message-ID: <1488259037-12565-1-git-send-email-hyc.lee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Hyunchul Lee <cheol.lee@lge.com>

Signed-off-by: Hyunchul Lee <cheol.lee@lge.com>
---
 Documentation/filesystems/ubifs.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/filesystems/ubifs.txt b/Documentation/filesystems/ubifs.txt
index a0a61d2..1133200 100644
--- a/Documentation/filesystems/ubifs.txt
+++ b/Documentation/filesystems/ubifs.txt
@@ -91,6 +91,7 @@ chk_data_crc		do not skip checking CRCs on data nodes
 compr=none              override default compressor and set it to "none"
 compr=lzo               override default compressor and set it to "lzo"
 compr=zlib              override default compressor and set it to "zlib"
+compr=lz4hc             override default compressor and set it to "lz4hc"
 
 
 Quick usage instructions
-- 
1.9.1
