Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F32C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jun 2022 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T52j8L62ttItijoqyhKG2xNJTZHK62rPtexXXeTkfuQ=; b=JKoLeRLZpTuV/r
	P5i/11dtHXUt2v2kK5nJRDRZxThTkWz1PI756U+ZQ9+mEeTZHFmY6iyuqWdbd/p120ShB5NhvfuPF
	rlb5mhPLtNEKxvAZmfewI3M6teQURN/0CBE971KZUqLYDRLxk53Xzs2G1JTPSkaOEHbWldg+DbBZG
	+jPsSiBh0cUreCS9vG7/FMzJ2ZrbuLoTmDbK9NwIhOhJY3OAFv7tP1PX0V3/nLk4Z0wAOb9BZ36B3
	FBTrXdabJhI/McrrgTrOgBgCasWjqyBz28paSxD/65tDqD0wsh6lR6tYk7cjPVTsgBc3E7jHMnstJ
	WZFBtTR+aJggm5q7cDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HHt-00DsZW-BX; Thu, 23 Jun 2022 07:30:01 +0000
Received: from smtpbg139.qq.com ([175.27.65.136] helo=smtpbg.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HHn-00DsTx-65
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2022 07:30:00 +0000
X-QQ-mid: bizesmtp62t1655969359tf9qc6cl
Received: from ubuntu.localdomain ( [106.117.99.68])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jun 2022 15:29:11 +0800 (CST)
X-QQ-SSF: 01000000008000B0C000B00A0000000
X-QQ-FEAT: F3yR32iATbhu3pcGn39LV3mpGHIZkAD842sH0YqrO4SIcMGrMZt43slG6a29b
	lylRIzFUqtuYNtkbksQZLGjiQskjvKLMUMDPL2Qq3APiPlHjmsE/p37GaWonecPY4ckrmKf
	Uoo+XT8fFpncPwRQAXeBe5e9T5kNV2qv9FZxLLnaMTD97a4F8jOLy+Cw2b9TcdvKauNq2wN
	7ug+5YVf6YFpHaTjqJUjBOkexMAKxe6hO+vpLHvBWsvv8sGQSSG5IEGUbETdhFiElfAGgnu
	dGZhdhtJ1nzIvLimMsEedQxxCHJLB2xMtY3pB/PFZASr/ye9fzzHUMt9rbhuQ/oscQWwAxg
	FGJoe58jxyH5jAuufJffiG7o/4Qrw==
X-QQ-GoodBg: 0
From: Jiang Jian <jiangjian@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiang Jian <jiangjian@cdjrlc.com>
Subject: [PATCH v1] mtd: ubi: drop unexpected word 'a' in comments
Date: Thu, 23 Jun 2022 15:29:09 +0800
Message-Id: <20220623072909.16518-1-jiangjian@cdjrlc.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_002955_598650_4A19C0D1 
X-CRM114-Status: UNSURE (   8.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

there is an unexpected word 'a' in the comments that need to be dropped

file - drivers/mtd/ubi/wl.c
line - 379

* This function returns a a wear leveling entry in case of success and

changed to:

* This function returns a wear leveling entry in case of success and

Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
---
 drivers/mtd/ubi/wl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 55bae06cf408..f1fa78c1391b 100644
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
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
