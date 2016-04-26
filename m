Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auzKa-0003Pj-Vg
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 09:30:58 +0000
Received: from nat-ies.mentorg.com ([192.94.31.2]
 helo=SVR-IES-FEM-01.mgc.mentorg.com)
 by relay1.mentorg.com with esmtp
 id 1auzKI-0000rQ-C2 from Marian_Rotariu@mentor.com
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 02:30:38 -0700
From: Marian Rotariu <marian_rotariu@mentor.com>
To: <linux-mtd@lists.infradead.org>
CC: Marian Rotariu <marian_rotariu@mentor.com>
Subject: [PATCH 1/4] mtd-utils: add support for erase regions
Date: Tue, 26 Apr 2016 12:30:21 +0300
Message-ID: <1461663024-12022-2-git-send-email-marian_rotariu@mentor.com>
In-Reply-To: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
References: <1461663024-12022-1-git-send-email-marian_rotariu@mentor.com>
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

This field will reflect the mtd->numeraseregions available in the kernel
space.

Signed-off-by: Marian Rotariu <marian_rotariu@mentor.com>
---
 include/libmtd.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/libmtd.h b/include/libmtd.h
index a78c8cb..b111a77 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -67,6 +67,7 @@ struct mtd_info
  * @subpage_size: sub-page size
  * @oob_size: OOB size (zero if the device does not have OOB area)
  * @region_cnt: count of additional erase regions
+ * @reginfo: erase regions information
  * @writable: zero if the device is read-only
  * @bb_allowed: non-zero if the MTD device may have bad eraseblocks
  */
@@ -85,6 +86,7 @@ struct mtd_dev_info
 	int subpage_size;
 	int oob_size;
 	int region_cnt;
+	struct region_info_user *reginfo;
 	unsigned int writable:1;
 	unsigned int bb_allowed:1;
 };
-- 
1.9.1
