Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeK-0006TD-KA
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:54 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 15/35] UBI: Fastmap: Enhance fastmap checking
Date: Wed, 29 Oct 2014 13:45:38 +0100
Message-Id: <1414586758-9972-16-git-send-email-richard@nod.at>
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

Don't update the fastmap upon detach if fastmap checking is enabled.
This is poor men's power cut testing feature. :-)

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 941110d..3712f88 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1110,8 +1110,11 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 	ubi_msg("detaching mtd%d from ubi%d", ubi->mtd->index, ubi_num);
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	/* If we don't write a new fastmap at detach time we lose all
-	 * EC updates that have been made since the last written fastmap. */
-	ubi_update_fastmap(ubi);
+	 * EC updates that have been made since the last written fastmap.
+	 * In case of fastmap debugging we omit the update to simulate an
+	 * unclean shutdown. */
+	if (!ubi_dbg_chk_fastmap(ubi))
+		ubi_update_fastmap(ubi);
 #endif
 	/*
 	 * Before freeing anything, we have to stop the background thread to
-- 
1.8.4.5
