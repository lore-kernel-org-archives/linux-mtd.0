Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSek-0000my-CV
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:47:19 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 22/35] UBI: Fastmap: Make WL pool size 50% of user pool size
Date: Wed, 29 Oct 2014 13:45:45 +0100
Message-Id: <1414586758-9972-23-git-send-email-richard@nod.at>
In-Reply-To: <1414586758-9972-1-git-send-email-richard@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't use a fixed size for the WL pool.
Make it instead 50% of the user pool.
We don't make it 100% as it is not as heavily used as the user pool.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c     | 2 +-
 drivers/mtd/ubi/ubi-media.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3712f88..666b2a0 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -947,7 +947,7 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	if (ubi->fm_pool.max_size < UBI_FM_MIN_POOL_SIZE)
 		ubi->fm_pool.max_size = UBI_FM_MIN_POOL_SIZE;
 
-	ubi->fm_wl_pool.max_size = UBI_FM_WL_POOL_SIZE;
+	ubi->fm_wl_pool.max_size = ubi->fm_pool.max_size / 2;
 	ubi->fm_disabled = !fm_autoconvert;
 
 	if (!ubi->fm_disabled && (int)mtd_div_by_eb(ubi->mtd->size, ubi->mtd)
diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index ac2b24d..d0d072e 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -403,8 +403,6 @@ struct ubi_vtbl_record {
 #define UBI_FM_MIN_POOL_SIZE	8
 #define UBI_FM_MAX_POOL_SIZE	256
 
-#define UBI_FM_WL_POOL_SIZE	25
-
 /**
  * struct ubi_fm_sb - UBI fastmap super block
  * @magic: fastmap super block magic number (%UBI_FM_SB_MAGIC)
-- 
1.8.4.5
