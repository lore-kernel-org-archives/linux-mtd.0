Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73098C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Jul 2022 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3lQPgiwauyO3FHTJznq4fM168CYRCTb+vJMvarZXgmI=; b=Qm8x4xaytN9kCT
	cQB8J/a5ZdYXXsivRs42zaTHHo5lB+gOqRfTnU57KRGo5f6e7Xkrf1tffRJjt/5nYZXuuREB4DxBD
	wYSd0uSKuyAPrYS3D7MGGi9fLzjuZQuTa2G8M2XwAT+n76Exzv9gECJrpeAGbl1QgzH+O7vkI4Y2n
	38GHY8eT9n+44s2ImPmxoBxCa4Z7uVzlRQx+Qe+auGIWa2c5mnFSAGrix6ulGO3WuPWr5gP0Jec7P
	QwkvtrS6nWxSOLWRmWNuyUUdXCOd9zfhvJsES3ozs7SxBLj8xOw2obk+ht9JXXWeJdfSEhSe3jv3s
	wo28jVVqz/jTkmFFx4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8R5Z-00Aho3-98; Mon, 04 Jul 2022 18:46:29 +0000
Received: from smtp05.smtpout.orange.fr ([80.12.242.127] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8R5M-00Ahb2-0t
	for linux-mtd@lists.infradead.org; Mon, 04 Jul 2022 18:46:18 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 8R57ovKj1E80K8R58oOSoK; Mon, 04 Jul 2022 20:46:03 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 04 Jul 2022 20:46:03 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ubi: fastmap: Use the bitmap API to allocate bitmaps
Date: Mon,  4 Jul 2022 20:46:00 +0200
Message-Id: <64cde893efca8f4dc381184cd7f6e5a54cd000f9.1656960335.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_114616_231948_529E604C 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mtd/ubi/fastmap.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 6e95c4b1473e..ca2d9efe62c3 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -20,8 +20,7 @@ static inline unsigned long *init_seen(struct ubi_device *ubi)
 	if (!ubi_dbg_chk_fastmap(ubi))
 		return NULL;
 
-	ret = kcalloc(BITS_TO_LONGS(ubi->peb_count), sizeof(unsigned long),
-		      GFP_KERNEL);
+	ret = bitmap_zalloc(ubi->peb_count, GFP_KERNEL);
 	if (!ret)
 		return ERR_PTR(-ENOMEM);
 
@@ -34,7 +33,7 @@ static inline unsigned long *init_seen(struct ubi_device *ubi)
  */
 static inline void free_seen(unsigned long *seen)
 {
-	kfree(seen);
+	bitmap_free(seen);
 }
 
 /**
@@ -1108,8 +1107,7 @@ int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count)
 	if (!ubi->fast_attach)
 		return 0;
 
-	vol->checkmap = kcalloc(BITS_TO_LONGS(leb_count), sizeof(unsigned long),
-				GFP_KERNEL);
+	vol->checkmap = bitmap_zalloc(leb_count, GFP_KERNEL);
 	if (!vol->checkmap)
 		return -ENOMEM;
 
@@ -1118,7 +1116,7 @@ int ubi_fastmap_init_checkmap(struct ubi_volume *vol, int leb_count)
 
 void ubi_fastmap_destroy_checkmap(struct ubi_volume *vol)
 {
-	kfree(vol->checkmap);
+	bitmap_free(vol->checkmap);
 }
 
 /**
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
