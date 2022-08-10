Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71630C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a88dwB+icSScjD5UyhFYlxRewMGCnczBuAioRczpHoM=; b=DjxgTR8AfKrka6
	jHaJBi1UvFXdhWSuUq9K72Nk1fFRRKW5VqMBhgp2nV9BnJH9PN5h5fbEYJs5mRLyUDBmVyAPnQ68P
	yvPsFz2W+BL2T0rhLcc01NvuceZmGaVPsP7QGZep8PcbPufpcOJqiLH/DLvEW+cgC8CrzsZx4sE84
	NjgB3sKQn7ZXRogS7yVueJJAjvBU42CmSVQ9XQsZNGLupKv3sO+3n0ddlnYvMkz5p5iNjEzdXnwPu
	G5tOFkfOpeRJUIhXCs26dbs9WylHuHx7u6cG5L/mjTEjPS7g6pNWFMNXw127lh5KWACUdS6ucbS6K
	kcge+CeO8DsuPua0/atw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlwH-00C5U5-Kx; Wed, 10 Aug 2022 13:40:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlvW-00C58c-As
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:39:16 +0000
X-QQ-mid: bizesmtp80t1660138745tdu021vk
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:39:03 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: svq08P3H43XysrHG5O8YQOL7NCARp11jQQ/d0i2y4vJ5mUitLQ3G+dXMq8vQx
	6w7MJ02hNuwQ+uOnWgAOYXeafIaquK1wb70U1x2r2ZHx/iCI1SiQadd8EzfxBP8KpXNPguy
	uOSjDCjcTxCnv1C1cZM+i4iLBtk7mURdtH3w41Xl19jmDxGZH4ZWXCuJuozfhUF5bDbFAjL
	D8VJrbT7e7AkvQ+8xc3i+PUU3gA6ClNj2TVfcTyFKa9C3fjcKAHauxrD63CJ7q+2vxNEdAw
	AicoWz6QuqmlaC+l51Roo+bGPsxvI39aox5qB4Xu7uUzxW1/Vijrw41ACnO15+5J8ZnRX1D
	GY5FiMXb2j7ecz0qBQ4lOkaQHW9FgVDezsQioXKsR8Q6Tk+P+SYQTTnFmvyTUzB+9GTLdMx
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] mtd/ubi: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:38:56 +0800
Message-Id: <20220810133856.4546-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_063914_719845_58D5C37E 
X-CRM114-Status: GOOD (  11.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

 Delete the redundant word 'a'.
 Delete the redundant word 'the'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/ubi/wl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 55bae06cf408..0fadd55beee0 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -376,7 +376,7 @@ static struct ubi_wl_entry *find_mean_wl_entry(struct ubi_device *ubi,
  * refill_wl_user_pool().
  * @ubi: UBI device description object
  *
- * This function returns a a wear leveling entry in case of success and
+ * This function returns a wear leveling entry in case of success and
  * NULL in case of failure.
  */
 static struct ubi_wl_entry *wl_get_wle(struct ubi_device *ubi)
@@ -429,7 +429,7 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
 /**
  * sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
- * @e: the the physical eraseblock to erase
+ * @e: the physical eraseblock to erase
  * @torture: if the physical eraseblock has to be tortured
  *
  * This function returns zero in case of success and a negative error code in
@@ -1016,7 +1016,7 @@ static int ensure_wear_leveling(struct ubi_device *ubi, int nested)
 
 	/*
 	 * If the ubi->scrub tree is not empty, scrubbing is needed, and the
-	 * the WL worker has to be scheduled anyway.
+	 * WL worker has to be scheduled anyway.
 	 */
 	if (!ubi->scrub.rb_node) {
 #ifdef CONFIG_MTD_UBI_FASTMAP
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
