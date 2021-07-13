Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F258C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386FD61158
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 09:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 386FD61158
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hF3KmgDMKfkpZitzsW0Ak7jdT86pSXYae2jV19Xp1u4=; b=a+O6Ut/LUL8Ndc
	yxk7Q2jlUVaUqKYOFdQdIVwYEZW+7Ry8J4svkYtr5BwuEK/BojxrCLhP4YvLmADIR8WRc9ZHnDEis
	JoAzEh6cMx/31Byg+InkbVFEdRzQ5MI8XERpiiJNWMp6Z4+yPlwbJto+FiMBly6WS3yD39ZyrMf+1
	HVYwuvNMWz4p9m+IHC9eyILOYF9f5b6B9NENZooWT8YTovBKXe6Skb2Z0vjn3fyExffIwJsGU/87d
	E2ga35uOlHSXDMSHOJdkvcP6vZuGbTwUu6h8PMQiYmjmljCrOEdTAjt4IiT462zbYeDK2WUIhVjyz
	F5P63GQiqkhHRN1dDZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3EyU-009hQe-Vh; Tue, 13 Jul 2021 09:45:11 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3ExS-009h1o-KD
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 09:44:08 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 83729C639B; Tue, 13 Jul 2021 10:44:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1626169443; bh=D1vgvmCaQAQWQHV+ryRh55IfCZX3zvF3trNhVm1Oarg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JzO6GceltXedd+q5MHPRBdlYrxSq1Yf/0Yz1eFVR/bGVmpFK3ARi7VsAoRd/cBSfA
 wqydRpbzpiwLC8NtVKZliYOjshmRM9SWyvKrRNC5tMaZkr/xJAh97f+XNuOnh80aMf
 bkZtaQx9vwZ6Y8DjQuY1QiIJDAr+Xs8Sb9lUXoNSvr19oVV1QzvagZY3Iv21MR//xk
 MEVTdtNp+xK4ReklFW3Th6OzlFB9nqzayzB7oHbaoqk+pFyKs4PttK4azsrhayjfBZ
 izId+qKwDbrhX900O4K5ZNoR1UitB7hYZr+31pH1baQ0TA6LQVTqDg0PLQutHHs/SG
 WPtdJfP4judvw==
From: Sean Young <sean@mess.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: rfd_ftl: allow use of MTD_RAM for testing purposes
Date: Tue, 13 Jul 2021 10:44:00 +0100
Message-Id: <5f9ca4ce43ab49e900339e2cef26782825e3ab6f.1626169090.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626169090.git.sean@mess.org>
References: <cover.1626169090.git.sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_024406_869782_CD8D17E8 
X-CRM114-Status: GOOD (  10.55  )
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

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/mtd/rfd_ftl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 6e0d5ce9b010..7b243f2b2fa3 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -720,7 +720,8 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 {
 	struct partition *part;
 
-	if (mtd->type != MTD_NORFLASH || mtd->size > UINT_MAX)
+	if ((mtd->type != MTD_NORFLASH && mtd->type != MTD_RAM) ||
+	    mtd->size > UINT_MAX)
 		return;
 
 	part = kzalloc(sizeof(struct partition), GFP_KERNEL);
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
