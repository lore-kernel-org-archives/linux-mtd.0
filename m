Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B81AC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 03:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rj0AdVp1PJwRcLhC4sZkEWE5cxUSN2Jb/zF+tTOHXhQ=; b=tvXZva5verksll
	wiupvjtee6hu8D1XkZipY4pDXR01VGwNa48U4jFtpZeRYoYAPTLk1zL8pz8qgLVH+aAtGV2QZfNVl
	GU6X/kr9NDo6BqP506tNXa2vzgLjb/2xBVZEBVY39v3MvU2bT5KC+tTbr53YNaQakptJWM7io08l4
	JO+wvP1n8F3/Gew/vUe4KX08IA1sT668o71SaBr4gxqstpWEio6YnMWwb57WJZ529ce1+Z/RYo/jb
	mLESOZBdlBCADTDuiKUrfMH6KB47vJgeHCgXeptg+B2OGZ9X4AMHFmny7Zo1CAalJUvtxS7qkJ/8L
	e8/gkzs/z2B4HKYIKolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1jo-008Cx3-Ts; Tue, 27 Sep 2022 03:58:28 +0000
Received: from out30-57.freemail.mail.aliyun.com ([115.124.30.57])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od1jb-008CvU-4C; Tue, 27 Sep 2022 03:58:19 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VQq8mOj_1664251084;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VQq8mOj_1664251084)
          by smtp.aliyun-inc.com;
          Tue, 27 Sep 2022 11:58:07 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: richard@nod.at
Cc: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] UBI: Fastmap: Fix kernel-doc
Date: Tue, 27 Sep 2022 11:57:58 +0800
Message-Id: <20220927035758.46804-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_205817_124699_803FB219 
X-CRM114-Status: UNSURE (   6.63  )
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

drivers/mtd/ubi/fastmap.c:104: warning: expecting prototype for new_fm_vhdr(). Prototype was for new_fm_vbuf() instead.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2289
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/mtd/ubi/fastmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index ca2d9efe62c3..28c8151a0725 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -93,7 +93,7 @@ size_t ubi_calc_fm_size(struct ubi_device *ubi)
 
 
 /**
- * new_fm_vhdr - allocate a new volume header for fastmap usage.
+ * new_fm_vbuf() - allocate a new volume header for fastmap usage.
  * @ubi: UBI device description object
  * @vol_id: the VID of the new header
  *
-- 
2.20.1.7.g153144c


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
