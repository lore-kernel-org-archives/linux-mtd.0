Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A2ACD98E2
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jun 2026 18:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O9ThJCeVECGeiEK1KcHRYHhviMuWONUXAdSOrm3kXXo=; b=uIDBQqXsrz6neU
	/WN9lbCHyDAwwbqLOjMVU0D7d7NJQcLwJsPuSyGpXCxwONoEhD4Vnb48kNyvgASETWRez7mK+zA3z
	34pSl/5pt7UtSBannE8Xsm1a1jq0H1+NAJVYNNhTslR2DURSnIOmvUsKH42vzQwTNGjBtSk2StLaC
	P+8PPQt6MXkrhFhMhMwoe6vLALVs6r3h9X+RlEEkG0N8kMjITVoO8KZ+xNnIrVik1N8C2UB8JAy50
	r9htR66S4bN1vWAMlgQ9Ua5cLS3vkznZ2lpLWffWnvDY7RCsK35htt1UrtLqryyY9Wqr5T528Ig9j
	CRu5w2bKmCtE0WzcTypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv9D-00000000Agf-0SJC;
	Wed, 17 Jun 2026 18:37:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv9A-00000000Ag7-0EcT
	for linux-mtd@lists.infradead.org;
	Wed, 17 Jun 2026 18:37:57 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so55509a12.2
        for <linux-mtd@lists.infradead.org>; Wed, 17 Jun 2026 11:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781721475; x=1782326275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lYpJamEbWyw02n/C8koZ8iP3QVe0VDluw/xlX1fj75c=;
        b=GBYIre7D1EaYXmf+Y2Sk68eyg0WPJNF8L8QSszszYfVJ5YNhSja+Mzr/3kspg1EfiM
         lFGkOSNQAClyCS9UQDeHFG/+3cMkpVlHt9i3Vpi3j4weOYmNAHb724GIA8fu+CbRKIsS
         W+vd9+rSSSQfXteB57EFrUk8Yr5GH/F790elNBOdceqDLMmzfUfo6ZNYDfC5tffKABIK
         6KikPjT5cgq+DSSwETlyttCXJBymRjpvnDqBQlqHKaI0jEHRmKouhi2e74TejQQ987Av
         PrLAkVxnIJal1OR8d+UuhIgWM/RbV3X38Cy8rLqfjZe+fMZv6YdX16FXpmBIosXpAG1I
         71lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781721475; x=1782326275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYpJamEbWyw02n/C8koZ8iP3QVe0VDluw/xlX1fj75c=;
        b=qF/JouLzpaS7uwUruDoX/A5bYH59e1PisxK/G+4ufHxKErb0dNampBN2nLB0sxuFo5
         w87GKQkLLeQE95KGbFnbeTGq8nWeS3cRpF7lyI9wUS+Mhmz5nd+Z6stsUdNaqvsC0LEN
         nqB4sWVmsU7j7n61RbSNYQ37zuEUyDdEZpkTSKYeldiuUNf5Ca/xAeO9a90I7ONEfMEj
         fr8TAvv1VmiCcE7DWBnUE4Uz2A+UisX7VyzIyLn6XC+6OmCCiu0nWSG6YIjNdUr97PXf
         1ecYai7DjFk8FRmvsK2OClrzlmOnABM+aWuMW6urC6gltTw5moe8iWNp3hmy+7Rwqe8U
         6ZPA==
X-Forwarded-Encrypted: i=1; AFNElJ+PNyYCzp/WBJwKZP8A7bqGdyD8hPCEKGEagPYGLdRBRNGKZ8aZeEynHywr4nlptxqFRUa+Nri5cP8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5tcWKNOrE18JkyRN7oI8Ir+Y45Q1Txw3elGUgq/K/ISAnmqhp
	AQA9YEw+WI2ihmhagjCt9xag38tRyCerHSRApqe1pjVE3LP0EAUXdtH8
X-Gm-Gg: Acq92OEuZBomImZKyTS2QWpYCcKjnZmT95FRSvL1IUxLZ7iQbl2PF/JOnmOOV1fs46B
	hJwZCZG69pTkf1OacTBrEuk0oMAxS0JqgZ3rWB9ZkQFHHLxlxRSpM9hQei+LOBDcyupTLt3VZro
	4BTFlbZUcDHW8dHwuCZRiZ/hznhKbmJ4HTY4mxgsoHqzcOH2Z/5qop4TVGDF9w9Cb/bsz1HqVla
	BEv7bisE3I9vTEJlmUc2mnRqdz3foKgpvYXcpVCJpI3tGR9caMWdrMtoEElZyGzSYnSUj5GmcKz
	DnzQi793r9a8XdhQPq3C3jgPlIQ/zNuNTNiCCoLBVyhtiYOWaVTsADtqbKqYfUPPZs1WR24tVyW
	KOawdWuH2SzbY7eMqoRux7ePtLMC6gMKsm5GgNJeZcCNSnrjhguA5eahoCtJ5sqxIk+j531qF57
	xSwdH357jLi0E1mXOQJczTnKV2dqLCBYp6
X-Received: by 2002:a05:6a20:2450:b0:3b3:ef0:49f6 with SMTP id adf61e73a8af0-3b9e5b22857mr583816637.7.1781721475097;
        Wed, 17 Jun 2026 11:37:55 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:1886:6b7a:3e78:272c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1c8sm15058327a12.9.2026.06.17.11.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 11:37:54 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: initialize ret in regular page reads
Date: Thu, 18 Jun 2026 02:37:49 +0800
Message-ID: <20260617183750.1103221-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_113756_092980_83995A8F 
X-CRM114-Status: GOOD (  12.36  )
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

spinand_mtd_regular_page_read() returns ret after iterating over the
requested pages. If the request contains no data or OOB bytes, the
iterator does not run and ret is not assigned. Initialize it to 0 for the
empty request path.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 786e3fb4874d8..051af3e1cf5ea 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -817,7 +817,7 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 	bool disable_ecc = false;
 	bool ecc_failed = false;
 	unsigned int retry_mode = 0;
-	int ret;
+	int ret = 0;
 
 	old_stats = mtd->ecc_stats;
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
