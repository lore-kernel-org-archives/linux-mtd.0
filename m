Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6984FC54798
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Feb 2024 01:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+4uTmgqd6AEQi79Z8LwkHXP1xmdF22rkLBPbifRNuRY=; b=X2DvDXT2sVhnBZ
	mrBdBgDtbQuK9MBZpKAD2twnXwjRDPpMefHPSQXe0zxOGPjSj0YSOgeIn++aZ9+/dluPkLxZbw58W
	A72PBLS9Z7Rdfr0ONcxurGDgd3w5UsHo7VHesUr+8glOosACXTiVkoe+HqMxz7Tw7uCUdZ9bxkoS5
	0jYgcgAbEEpt/HwekBbKPhRIm67q7DxlOsylN0J3vRrSKzOL1tzSQWhwqPnhMIkJKVNnvhEZTn9aC
	ixBxx7ixwvyWYVKiI0MEynUmo504jWUDr50bGSbk+9P0rXdgkiLzIuqqYI1Q4j+Ks0YKZPpz3Thcx
	K21wxKpe9gG463ENsVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf91v-00000007b0f-2OBj;
	Wed, 28 Feb 2024 01:46:43 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf85b-00000007RFE-31Gq
	for linux-mtd@lists.infradead.org;
	Wed, 28 Feb 2024 00:46:29 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rf85L-0002GY-1d;
	Wed, 28 Feb 2024 00:46:11 +0000
Date: Wed, 28 Feb 2024 00:46:02 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: ubi: fix NVMEM over UBI volumes on 32-bit systems
Message-ID: <31a20aead3419209991bf01aaeaefe07ab94d23a.1709081052.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_164627_784342_DF6D16AB 
X-CRM114-Status: GOOD (  11.48  )
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

A compiler warning related to sizeof(int) != 8 when calling do_div()
is triggered when building on 32-bit platforms.
Address this by using integer types having a well-defined size.

Fixes: 3ce485803da1 ("mtd: ubi: provide NVMEM layer over UBI volumes")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: use size_t for 'bytes_left' variable to match parameter type

 drivers/mtd/ubi/nvmem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index b7a93c495d172..e68b8589c4279 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -23,9 +23,12 @@ struct ubi_nvmem {
 static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 			      void *val, size_t bytes)
 {
-	int err = 0, lnum = from, offs, bytes_left = bytes, to_read;
 	struct ubi_nvmem *unv = priv;
 	struct ubi_volume_desc *desc;
+	size_t bytes_left = bytes;
+	uint32_t offs, to_read;
+	uint64_t lnum = from;
+	int err = 0;
 
 	desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
 	if (IS_ERR(desc))
-- 
2.44.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
