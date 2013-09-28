Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPuzv-0003Wv-H6
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2013 13:55:53 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 3/7] UBI: Call scan_all() with correct offset in error case
Date: Sat, 28 Sep 2013 15:55:12 +0200
Message-Id: <1380376516-30144-4-git-send-email-richard@nod.at>
In-Reply-To: <1380376516-30144-1-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
Cc: richard.genoud@gmail.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If we find an invalid fastmap we have to scan from the very beginning.
Otherwise we leak the first 64 PEBs.

Reported-and-tested-by: Richard Genoud <richard.genoud@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index c071d41..03b32b0 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1417,9 +1417,11 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 				ai = alloc_ai("ubi_aeb_slab_cache2");
 				if (!ai)
 					return -ENOMEM;
-			}
 
-			err = scan_all(ubi, ai, UBI_FM_MAX_START);
+				err = scan_all(ubi, ai, 0);
+			} else {
+				err = scan_all(ubi, ai, UBI_FM_MAX_START);
+			}
 		}
 	}
 #else
-- 
1.8.3.1
