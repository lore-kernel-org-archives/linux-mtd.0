Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B58D6DDFA
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Nov 2024 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tjbhxi2QXFzloEw0gRDHIztl/QTobANh4EUau3fQEF0=; b=TPzxs4NXSBCsZu
	0rS4zglwNawsOlNhknkVjWRPGcTR0YzCN2kWs5YzWo5D6glYiUUvgMDYKYQUqz7H2k7eifJdK83cg
	f70QMD1+S0JWtCJm/H3pQ2RzAaihL8XrdgCdsMW+uy31+OtIgusK6JvWh5t7TgW//jS7AyH6cRS/a
	YjM8tyY2uuPlSvmhYwRpgGNjDZ0gRvqjI1JgeFYjkTIt0HAJnRY5NLTPfJCGN2F1xGqqvqPvHbDZG
	WPEsk8L5YTCSQWAOFEx7lKogyiN8m3Ux4hJym3X5iDOB+ZdxbqPTp9nQT7pARzcvs6GLi60pBEfx/
	9yzg/bslLtoMFcOX9Z/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLT-00000002nY5-1wgt;
	Fri, 15 Nov 2024 13:26:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBwLP-00000002nSS-1RI7
	for linux-mtd@lists.infradead.org;
	Fri, 15 Nov 2024 13:26:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id C27AE2000A;
	Fri, 15 Nov 2024 13:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731677195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOO57gCrd7kA1kaHAYAJHP1GvAJRJefE1dAecm/19NU=;
	b=iDYt4TIzHr8+xIODoea7yrM2qFW2zm4jTncX33Zx04rUY7qPZeO9m4e6/edL58GDsvhp4n
	GjJA2z/K3UTok+8dqxyVopUp9QgWs4fw1BOOdAVJhbrUxJoi84O0qt8Ui+9uLNy/nTyLwz
	xiNgfED64pWf2ivKlfR/5EVKT52LxiyULJE5hXu1YOl+udl2LUKJbjzuM9wEWVxQJtY1bS
	JS8LBWETImXtwkbb5Zx1AtxI/Wu3RTRUwCNrfJ0nbfCW9jWmHwx/Li0qsWPjNtEF/+JoPf
	bLvu40SVZCQe+fBroW8ut68nGlCb46gjf69tBEu9+fehf1oosU8IQCGrt9eFpA==
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
Subject: [PATCH v4 02/10] memory: ti-aemif: Remove unnecessary local variables
Date: Fri, 15 Nov 2024 14:26:23 +0100
Message-ID: <20241115132631.264609-3-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_052639_646911_B9A9B38E 
X-CRM114-Status: UNSURE (   9.60  )
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

CS timings are copied to local variables that are then used as is,
without any modifications.

Remove these unneeded local variables and deal directly with the timings
stored in the struct aemif_cs_data.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 drivers/memory/ti-aemif.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index bd0c49ba1939..6a751a23d41a 100644
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
