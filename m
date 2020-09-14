Return-Path: <SRS0=tjU8=CX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC8DC2BBD1
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 21:44:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8509320759
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2020 21:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PwnXSD7S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXcW4c+s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8509320759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfEao1djT8wmDl2X3TWdjcSKjMJlLdi6X1tu7wLipnQ=; b=PwnXSD7S6CW9w/t3KpvV/VJaiX
	vJrD5Lv0CzvWKbrnw9n5yv1Khh7gEs/18e0FNFViawBXndhSjcpZkQ0hLWP+BsCl6lLIPMOiE2/gz
	LRk9mDCLQkLZ7YMs4ObmDJWBgyq57rCEVg9GdXNMHMtOQcMe7D2a0FVBDSMEPZ7NFZ/LM79P7yKSQ
	GJ2jnkCKsoou6nGnq3/0yDMKkJzQT6nhMM30P9+V/6BW9Dt2nwI7qF7l0GtPKDc/HtPPXqF4n14sK
	wBpEM6j+H8lOLA5emofZS3N+8r5jR350BBgHNLmMV776BQyTvvUTed7nOUOLgtB8HA0o2RaXIx28T
	namU5SnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHwFT-0002Ae-ER; Mon, 14 Sep 2020 21:42:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHwFQ-00029x-6T; Mon, 14 Sep 2020 21:42:52 +0000
Received: by mail-wr1-x442.google.com with SMTP id z4so1167916wrr.4;
 Mon, 14 Sep 2020 14:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bv3jV7gXm2zqMYubAXDmuMLaJFvcfVa1TTcvWO4iJog=;
 b=DXcW4c+sYUy6WIxjwulWXeTf6DVn8qTz+NUCU9jkOH+38ihpU6hLLfNGZ9wf89DZ41
 +Rx4f9Rn9LF1fhSZi9a4Rqw3onUVbcqq1+9erxd0F+b7Dvye1+IooWgGK6Y9yd1Z10nS
 c1VNJ8ff43OnFXL7TxvC2Po+vQ6gkpAsJr1mZFokBNqkV5Kz1chjJuV0iaFeZjrwsrfY
 ZPG5zorp0IRMpIlghv4UBYEnrCUEWEEoo7CDpE9W1y59eoFsaTrYvAofbHtyUkQ7nrU7
 +qxi150zKvHIe2hNATtt1HDtV992UK5cCZjQyWaHuZu4EFJdvtyw7xXo7STiHnrnvP99
 qhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bv3jV7gXm2zqMYubAXDmuMLaJFvcfVa1TTcvWO4iJog=;
 b=Poq3KMniiDxkwVm2gP+rQo6Vu5+03c4p/zs3tKesKu2tH0zrhHwaHb5EAXwq5WblAp
 Cp/AbJsC2XJICPvGJ4SmLViOSn88xB/5eTpU3MKk/+RRKriaPEiAbdOKam3SQ+f10Rig
 5PCIUFI5rLcE4MMRwt7SOzGtkZgiLOx4sSssDvrue7PN81Gk2DwA8TP/LH3fjq7ghy3G
 c1Fs9avrgv9xpwLAtjHF0zL9rZNGhO8N+hT1/Di/ToNUDp8sjQH4Ff960rxB6vbJkWHK
 F9X7fseYtlss9/2U2pmDg/5dui0LHaBjDc3r7vXUzjxYoqUGcYYEZPbpPxNCvnERz9tE
 NXLw==
X-Gm-Message-State: AOAM531XIusI2sXFAJ+iXfDRV2/uWKGjoLdNdoyN4g4lVE4Y7kqQhV4Q
 7+Mi+TwfTpTcAp8W8INywnwbQIUJj4S2jyFc
X-Google-Smtp-Source: ABdhPJyLeG/7qJcqtKMm981UPoUoJxPqLs/sFip5XZeftkOhvXxRtZAVgnv5+L8j6dsyb0uiVZxm/g==
X-Received: by 2002:adf:efc9:: with SMTP id i9mr18650597wrp.187.1600119771142; 
 Mon, 14 Sep 2020 14:42:51 -0700 (PDT)
Received: from localhost.localdomain
 (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
 by smtp.gmail.com with ESMTPSA id h16sm23913899wre.87.2020.09.14.14.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 14:42:50 -0700 (PDT)
From: Alex Dewar <alex.dewar90@gmail.com>
To: 
Subject: [PATCH] mtd: rawnand: atmel: Check return values for nand_read_data_op
Date: Mon, 14 Sep 2020 22:42:44 +0100
Message-Id: <20200914214245.14626-1-alex.dewar90@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_174252_280174_C29AB818 
X-CRM114-Status: GOOD (  12.24  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alex Dewar <alex.dewar90@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In atmel_nand_pmecc_read_pg(), nand_read_data_op() is called twice
without the return values being checked for errors. Add these checks.

Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 309ce410d792..e6ceec8f50dc 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -948,11 +948,17 @@ static int atmel_nand_pmecc_read_pg(struct nand_chip *chip, u8 *buf,
 	if (ret)
 		return ret;
 
-	nand_read_data_op(chip, buf, mtd->writesize, false, false);
-	nand_read_data_op(chip, chip->oob_poi, mtd->oobsize, false, false);
+	ret = nand_read_data_op(chip, buf, mtd->writesize, false, false);
+	if (ret)
+		goto out_disable;
+
+	ret = nand_read_data_op(chip, chip->oob_poi, mtd->oobsize, false, false);
+	if (ret)
+		goto out_disable;
 
 	ret = atmel_nand_pmecc_correct_data(chip, buf, raw);
 
+out_disable:
 	atmel_nand_pmecc_disable(chip, raw);
 
 	return ret;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
