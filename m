Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450AAC678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pCUgJDXFWiS4ZYlOSoYHrhgk/SI36lnnXHtOl3Kh+sA=; b=oWEADPuKCj8weZ
	lC9++3ryNLnUihO9j/TBK6Q9+TNdeHObMknEi2a7Dl+qGveB4QxIBD1jfE+hMBth98Vx0TkNHbpan
	pujpw/dmmB2mR/tCh8qwk46icKe8OmpnlNzLonbIxvbtFiayKapNBsiMNccU9voqTcMwD/jO8KLlB
	mRAgwJGBMUuGWyic1Eq0qZm5oPMsycRRjNw4MFWDY2h9VaS/E68f5XTSC9ai3ZKDN6RA06QbmAI/Q
	2kRrTRoFrWArYAki91TqrR1pGz2i4WBm1tGcZlSz3JrmsCip+m+u0Jmpu6x3yZlBCWPP1+J3rebUf
	/PoqggMA4qr79Ffk+Yvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvx-002Elo-7X; Tue, 07 Mar 2023 19:25:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvt-002EhV-8x
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:25:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B369CE000A;
	Tue,  7 Mar 2023 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8zjaG8q+BvDi/KIrFf/tSXnR0LynVo0mh9XnIp39uho=;
	b=N6ZbaWeBcuDD8mbKilE4V+XjzKByYTbENPInUY/BDEhZO8+CJZlmM/cmn8v4SfBy6ZeFxD
	ZJ93dXbfGY/kI4798RepC913fzIWmJQMiKAXUUj3D/dSb2kfZCVQy8DudBIGIzNiJbyR65
	8i9rrsYdXmOuL0//xE90GCYoVVSbaaUtwKwmhSBZ+Ysnh1bZ4V4tmzCKFT+Mg0Wk3Dxe4P
	e7k9RylpGJcFeKQHwgdJYpfQnFTVTYyUSakqKA/vsdYwCZiVZOsEUNYSkcB+7uNHA7/uKV
	dx9FIydJmzxG4ppsuZfniSesCD28eNzE1AleQhuGphWS+0TWKA6t6eetbzAiTg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: Avoid printing error messages on probe deferrals
Date: Tue,  7 Mar 2023 20:25:06 +0100
Message-Id: <20230307192506.439532-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112509_486872_E56171D3 
X-CRM114-Status: GOOD (  11.77  )
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

There is no reason to complain about probe errors in case of deferrals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v2:
* Use of dev_err_probe().

 drivers/mtd/mtdcore.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0feacb9fbdac..e4e102585021 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -536,12 +536,11 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	mtd->nvmem = nvmem_register(&config);
 	if (IS_ERR(mtd->nvmem)) {
 		/* Just ignore if there is no NVMEM support in the kernel */
-		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
+		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
 			mtd->nvmem = NULL;
-		} else {
-			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
-			return PTR_ERR(mtd->nvmem);
-		}
+		else
+			return dev_err_probe(&mtd->dev,	PTR_ERR(mtd->nvmem),
+					     "Failed to register NVMEM device\n");
 	}
 
 	return 0;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
