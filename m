From: Shubhrajyoti D <shubhrajyoti@ti.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH RFC 2/2] mtd : Make the mtd_suspend return 0 if the suspend is
 not implemented
Date: Mon, 23 Jan 2012 13:42:41 +0530
Message-ID: <1327306361-9803-3-git-send-email-shubhrajyoti@ti.com>
In-Reply-To: <1327306361-9803-1-git-send-email-shubhrajyoti@ti.com>
References: <1327306361-9803-1-git-send-email-shubhrajyoti@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-omap@vger.kernel.org, Shubhrajyoti D <shubhrajyoti@ti.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently mtd_suspend returns an error value -EOPNOTSUPP
if the suspend function is not implemented which prevents the
suspend. This patch prevents the nack of suspend if suspend
is not implemented.

Signed-off-by: Shubhrajyoti D <shubhrajyoti@ti.com>
---
 include/linux/mtd/mtd.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 1a81fde..c717bb6 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -427,9 +427,9 @@ static inline int mtd_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 
 static inline int mtd_suspend(struct mtd_info *mtd)
 {
-	if (!mtd->suspend)
-		return -EOPNOTSUPP;
-	return mtd->suspend(mtd);
+	if (mtd->suspend)
+		return mtd->suspend(mtd);
+	return 0;
 }
 
 static inline void mtd_resume(struct mtd_info *mtd)
-- 
1.7.1
