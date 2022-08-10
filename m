Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFC1C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=odrBljsbMQC2pbmJdNG7RrzQ+8DaqSqd+Bzc2yQzNYc=; b=xXoamC0ZFIrRfn
	XrmsNGRe9eKLwkQjK8qLiKWpAeyWTwtD+6oI4+HSYDxFYh1Cg+GACqFhlEH19prMCacgOygHkRZBr
	EJsDblNUDDD8/i0RLbDo+Dw1t4VZn/+rB0bLaZxqTbfWPCZBgBIP7fVWpqCQWDQsmnd1qwSazN2Sq
	Bkk4IjDSP/sNmywpDUyLFPQKcB9uTyTajeVjaLq/tcBwOXqmSZiwEGcrjUNpY0idauJHVNE8DrKKy
	mzP3PVOIpm/dQBNNuc84g8o4plWdRqKWtJxgQtuclb6/RbLvyYWiC8y1hrPiyGm4WYH8bCszDMYcD
	vel7/veqWHRBRNBskZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlkf-00C0P5-Ha; Wed, 10 Aug 2022 13:28:01 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlkY-00C0N0-UU
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:27:59 +0000
X-QQ-mid: bizesmtp82t1660137620tvqpxd73
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:20:19 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: uGhnJwy6xZK3/a4RZGPHChyYxZyQ91n+aQkD5cRY+ai5ylW5xYcDUzJOD4ag6
	UT+isujEYjcMdxFWz61a6UcvPhdLs3ds0tSLae7msJWbfm1NAk2XQpurmB8hHcsSZneUl07
	elWLQWUOKyeIdLwGt+3bSiLUzb3DfS/nOphfpqdekAapLR3IBRBrSDnO8gmDzZpgP01b5bl
	jik0taODm1e+3rAfeQj0rVkK4L0e/HjqZntXd/y3wGOldU6aPVbukNPuQdrGXhlD57XsObg
	aJ03JRsCH5jnLytcPSr4cFaYdLzgb5gNg7w1hQkmqDATgCjJWIkglhRI6gjybOvd2wiQcJa
	jVKx7hkbjAk3RXmOpA7+eoWuu0QaJQf9+gUwH2z9gXQNtOXLteIJd3dMWQWWw==
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] drivers/mtd: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:20:09 +0800
Message-Id: <20220810132009.59842-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_062757_716303_4D14ECC2 
X-CRM114-Status: GOOD (  10.53  )
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

 Delete the redundant word 'in'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/mtdconcat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index f685a581df48..193428de6a4b 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -836,7 +836,7 @@ struct mtd_info *mtd_concat_create(struct mtd_info *subdev[],	/* subdevices to c
 
 		/*
 		 * walk the map of the new device once more and fill in
-		 * in erase region info:
+		 * erase region info:
 		 */
 		curr_erasesize = subdev[0]->erasesize;
 		begin = position = 0;
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
