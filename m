Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjSeO-0006Sm-1g
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 12:46:59 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: [PATCH 28/35] UBI: Fastmap: Make self_check_eba() depend on fastmap
 self checking
Date: Wed, 29 Oct 2014 13:45:51 +0100
Message-Id: <1414586758-9972-29-git-send-email-richard@nod.at>
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

...instead of generic self checking.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/attach.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index 9364348..e36fd2e 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -1454,7 +1454,7 @@ int ubi_attach(struct ubi_device *ubi, int force_scan)
 		goto out_wl;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
-	if (ubi->fm && ubi_dbg_chk_gen(ubi)) {
+	if (ubi->fm && ubi_dbg_chk_fastmap(ubi)) {
 		struct ubi_attach_info *scan_ai;
 
 		scan_ai = alloc_ai();
-- 
1.8.4.5
