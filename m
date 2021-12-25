Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63562C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJVwm660EYs1SiuRxNsdF5WV4hI66LES+NYXDeCN1pk=; b=yoZpbOdtAS8BSI
	CDJi+AwxRPJ45bIMxC8eAFFtVPN6ltYsu018UMLAfh5FZRoEax/YNuWuuC8gaDvQlO3oFPptSQ3uY
	i0k6rPXS09rn+3JCx5/7dfBGcRg3a8cpWNeXmYQI/E6n1joLI/5L/hgRp0iiubCKHqJFmCYTcAZd3
	9T+PXpfXmh4YMgGa316rTcbFWLmdxxvPIe62+29QfamZVgubIiNuZeVcjti8RrSYvaAIluMyuRCTo
	/SevPCpOPomfLF7HQwiFH74OKDTpU/iLicqY4WBGGn8SKNNEhsi/RqTARdk6kWXUxqIKmnEizbmi1
	vW9etZ7ugAz4sNmUmD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n13wr-00Eo6r-2o; Sat, 25 Dec 2021 10:06:45 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n13wo-00Eo6U-9L
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 10:06:43 +0000
Received: by mail-pg1-x532.google.com with SMTP id v25so9448421pge.2
 for <linux-mtd@lists.infradead.org>; Sat, 25 Dec 2021 02:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tr5XUUdLtNZAp31+iJJ7YFpkXDTAliU1rXFTU2oYGMU=;
 b=TdLQSmlB2gLGwclAt9mNo/9QYOsMYBTP6PtsssOCdDO8bqXtBVo4b82w9kiJMKhu2I
 KjXNz1BTS7KmgAcQV52Ax7V5/af0eW8lhhqJtf35K7XUK8bJ3KQYlSWVgMXt8spIm4Wp
 LStF6Jkn8THpepotqmceR60qAD5jCcB8YF8m0yuE/xuDU8ber2J5XsEIRvOA96zt8TpP
 4gk1v1tdzSeqRJmvvjVVtdmLlTeEik7uoRuPARjrb65yWgXmmFwO+shXIbgpDnjZLU6Q
 hip/z9SpD3R8d1+MFESviY3B93KqLgTIVX1vYOpj3dSl0BsV1sVGL9LdnlBOx4q3wh/Y
 vV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tr5XUUdLtNZAp31+iJJ7YFpkXDTAliU1rXFTU2oYGMU=;
 b=wqcv4gNrShtNo4kAhWx1mL0Z3StZqN8bR3MR3HF+c4c3fcmlTnEbv458dmpOr+RMTZ
 YdDAFEn01wqEswPXQlVPyH9wT1zcN6NbnKr130JBEixdRs7P+Nw8yUlg2AkvjncLloAr
 PsZlXo43ISMIX9wEG1Ab5JmtTgdj23YZhFzKKs/LXr4zEvsZM3UixxSqwOCk9gUrbdO3
 3L/4VGANdJGa0BriazOpgnER55JSuch3qC9vT2yYQg8TmDEcUpiiqg95P33lkWVUJSBW
 3az90dca9+7qxPMMq3S0KyDo3p8gZVudvZLsrpgh1fSpFTu6nWoGOWW1ArtRElj8bVWu
 e6hA==
X-Gm-Message-State: AOAM532vp24SSNFucpDOkHU5cUJK8tFoCjIcBbyawHEdGPxo8A7lstqw
 4PDhxe+E6LZEYrTGPfe3b0M=
X-Google-Smtp-Source: ABdhPJykZ17Xl6Xri6yGAWosneOSr6CIeXWUESSCcoFY6BfxQ2EBaj2kpbkeORUEzSNLWQ439uyexg==
X-Received: by 2002:a65:6241:: with SMTP id q1mr8931713pgv.98.1640426800696;
 Sat, 25 Dec 2021 02:06:40 -0800 (PST)
Received: from localhost.localdomain (1-34-229-86.hinet-ip.hinet.net.
 [1.34.229.86])
 by smtp.gmail.com with ESMTPSA id ob8sm15980723pjb.38.2021.12.25.02.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:06:40 -0800 (PST)
From: s921975628@gmail.com
To: richard@nod.at,
	vigneshr@ti.com,
	miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 RinHizakura <s921975628@gmail.com>
Subject: [PATCH 1/3] mtd: rawnand: nandsim: Replace overflow check with
 kzalloc to single kcalloc
Date: Sat, 25 Dec 2021 18:06:07 +0800
Message-Id: <20211225100607.118932-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_020642_371331_EE669407 
X-CRM114-Status: UNSURE (   8.36  )
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

From: RinHizakura <s921975628@gmail.com>

Instead of self-checking overflow and allocating an array of specific size
by counting the total required space handy, we already have existed kernel
API which responses for all these works.

Signed-off-by: RinHizakura <s921975628@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 0750121ac..3698fb430 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -979,15 +979,8 @@ static int ns_read_error(unsigned int page_no)
 
 static int ns_setup_wear_reporting(struct mtd_info *mtd)
 {
-	size_t mem;
-
 	wear_eb_count = div_u64(mtd->size, mtd->erasesize);
-	mem = wear_eb_count * sizeof(unsigned long);
-	if (mem / sizeof(unsigned long) != wear_eb_count) {
-		NS_ERR("Too many erase blocks for wear reporting\n");
-		return -ENOMEM;
-	}
-	erase_block_wear = kzalloc(mem, GFP_KERNEL);
+	erase_block_wear = kcalloc(wear_eb_count, sizeof(unsigned long), GFP_KERNEL);
 	if (!erase_block_wear) {
 		NS_ERR("Too many erase blocks for wear reporting\n");
 		return -ENOMEM;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
