Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADBFC25B78
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 21:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b20CH9KYO4YKtbdiBZ2U9f1I2rWWygu19lrSjC4NDys=; b=hB2PY3WYW4zsjH
	/UiZlCTTl+Uq5I1A2QupZoZ0MQOYaSoC0o2PwaOo0i5dWj+BMJX8ypBSYOHTfrlJCJ068EQc/jpK7
	lqXc10aa5YpyXQXmn+qBYTOxF2MqL7ov9JdH6FGfoD5HE9mYHfaHV/qkKGNE7CHUKC/BBl+Bz72gX
	vNPOMMvoT/BVCiqEaldbXLDz6hVea17Hw8J+MiQLpg9RHEEZPsv+aXMdXFpCvxxogRQKY3AEdyjN/
	+rLdJVLKu2Es6YkR3Nno0aEiRndiWB0pbYqtrdZI7ZWSZC8EIGP6z1BfV0d6AjF0qgAh5oUf94gsd
	0vx/bRtRvSXu6DSmDnbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbiv-00000003rJt-38Xl;
	Tue, 04 Jun 2024 21:29:41 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbio-00000003rDO-3Zo2
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 21:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zA/cvpSqfElfT0r6FDsRgA1YFQJ3P0br6JbLu5Xhd7c=; b=Nq/kRn
	Qjv5PYPTUPiv4Pvop9gisylQDuRVoPvwiFaa09ybKasLtYTUnwumWDaHPLU0nq9t
	9ugMj53sIho7uvTy4XP/5EdRP5Id/GJQenSlicgpgJTnftFRR5UWl+WJlSviex9P
	9GtpGnVphz8FdhlOS/8CKB8VylFXiMRQRXGp8ED979kNa5QeFK03zzM7YZITcNuI
	ZQ/0fj+vMfLiCsTwjRkMXuZsSScZMYkG7tQbLPqFxRgI6kr0WhecWekj/W4Ebmj3
	1baHO3aRQ9RUiFJ56HfuPGg1ex+qNC1rWQCTANRG30u3uIUCfhhZJOffLthBtoml
	0yh165ELd1gIY1XA==
Received: (qmail 2450912 invoked from network); 4 Jun 2024 23:29:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 23:29:26 +0200
X-UD-Smtp-Session: l3s3148p1@mF7sJBca9NlehhtB
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: nand: mxc_nand: use 'time_left' variable with wait_for_completion_timeout()
Date: Tue,  4 Jun 2024 23:29:20 +0200
Message-ID: <20240604212919.5038-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
References: <20240604212919.5038-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_142935_217804_83004FD0 
X-CRM114-Status: GOOD (  11.76  )
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

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 9d50f41b3d5a..e22fbea970d1 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -457,14 +457,14 @@ static int wait_op_done(struct mxc_nand_host *host, int useirq)
 		return 0;
 
 	if (useirq) {
-		unsigned long timeout;
+		unsigned long time_left;
 
 		reinit_completion(&host->op_completion);
 
 		irq_control(host, 1);
 
-		timeout = wait_for_completion_timeout(&host->op_completion, HZ);
-		if (!timeout && !host->devtype_data->check_int(host)) {
+		time_left = wait_for_completion_timeout(&host->op_completion, HZ);
+		if (!time_left && !host->devtype_data->check_int(host)) {
 			dev_dbg(host->dev, "timeout waiting for irq\n");
 			ret = -ETIMEDOUT;
 		}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
