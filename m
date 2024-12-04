Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3138E77178
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFD9ARzQM54n0sA23lICK4brVczHSusBwNJ/EOAfn5s=; b=tj6tyyjKfBO/d0
	D4/aizysicXrqa0erQNqo++1eCW8Qp6CMPmvTY6piOj3gp9FdSAfY+jgk75rCfqKXK+V8IQxULixZ
	1bTs/SsTH+l9Ih9YZSlyhF3XWd9A5VmR8HI4jb1cwe/e9iG6xxwf8QBYUw9ef09W/pO8bX1LH9geg
	yAqPeKq/wAyqgNmPp2EC9wfeQpscIvXYIlPFv+NkSYsPmO1h2brFe+koC3jjzjs4uHR6TzQoXrXY0
	vZO/tQ/QE8n+Govl+2BZ80LX/HcNrwa0gW22EEjVe/BstsJkOuSi1iLcz46OjgBaVqHcACnnJbF2z
	Ooe4q6VKTM/xXWhhlJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlxh-0000000C6FQ-0wJt;
	Wed, 04 Dec 2024 09:46:25 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlup-0000000C5ah-0wsQ
	for linux-mtd@lists.infradead.org;
	Wed, 04 Dec 2024 09:43:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AAFF36000B;
	Wed,  4 Dec 2024 09:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733305404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NVdYJysLi5n1RUC9YCAebU4m2JnvzkI3+7eLaZOZoto=;
	b=YfC0a/iqtP4VitNKQCBacFOdIXuFnZvGCOcyKRHCZ8PBNoPmiQuSpaqchX3zQ6QFc0L1sj
	mmx4fN1QTv3INfgHsjtikiE5eplc9NOfV6BLLKLyITrDlB08LuGCouHMb+LTlxnDN7xMkE
	D3rb3S6Mb4cqIRMIoZV3yHEkktoDfVajTtUgo7+ub25uLBFuxo4ExutgyQfZJmCIOvpNnb
	4siKZwd1gNOmeJq1Z5niaDN0VB47KDRx9aIa5QdFjfRn9S+BZGOuoy4h92nRb4sDS6ePL9
	Za7oglhBuQyUr1E9BrhjxG04qyJ1K1FLtrPe2bVKoerkpSVVsZVI8R5pawVrtQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Subject: [PATCH v5 2/9] memory: ti-aemif: Remove unnecessary local variables
Date: Wed,  4 Dec 2024 10:43:12 +0100
Message-ID: <20241204094319.1050826-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_014327_547627_CEE87604 
X-CRM114-Status: GOOD (  10.18  )
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

CS timings are copied to local variables that are then used as is,
without any modifications.

Remove these unneeded local variables and deal directly with the timings
stored in the struct aemif_cs_data.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/memory/ti-aemif.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index f23a549b219b..a0e1a6b53256 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -174,22 +174,14 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 {
 	struct aemif_device *aemif = platform_get_drvdata(pdev);
 	struct aemif_cs_data *data = &aemif->cs_data[csnum];
-	int ta, rhold, rstrobe, rsetup, whold, wstrobe, wsetup;
 	unsigned offset;
 	u32 set, val;
 
 	offset = A1CR_OFFSET + (data->cs - aemif->cs_offset) * 4;
 
-	ta	=  data->ta;
-	rhold	=  data->rhold;
-	rstrobe	=  data->rstrobe;
-	rsetup	=  data->rsetup;
-	whold	=  data->whold;
-	wstrobe	=  data->wstrobe;
-	wsetup	=  data->wsetup;
-
-	set = TA(ta) | RHOLD(rhold) | RSTROBE(rstrobe) | RSETUP(rsetup) |
-		WHOLD(whold) | WSTROBE(wstrobe) | WSETUP(wsetup);
+	set = TA(data->ta) |
+		RHOLD(data->rhold) | RSTROBE(data->rstrobe) | RSETUP(data->rsetup) |
+		WHOLD(data->whold) | WSTROBE(data->wstrobe) | WSETUP(data->wsetup);
 
 	set |= (data->asize & ACR_ASIZE_MASK);
 	if (data->enable_ew)
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
