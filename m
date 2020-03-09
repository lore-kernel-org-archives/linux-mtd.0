Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C6AC10F27
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:57:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC2532051A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 11:57:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UGI3dV91";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY3Na1mL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC2532051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HHTyvKu7EgXUwjrQfl0KoxUVzyGFTLN6sx1aCjueD6Q=; b=UGI3dV91ONtDOKzIojQNX9S4Vm
	0+rsxrn2N3hyHxh6SYqDsCDoisD2Cw7+zW2bJz4LXaz1X7/ZKqnRbXHw4mi6Iv2/Y+TljittrLam4
	qnESbj1MtgaFJ+pFhkFEfqyxhVXQUcJgkVxQqZ9LXInNgedL5T1TpBWXipNkhIksUUQawNIgIOMqF
	ramtanRfqu+NJEGW7gvZU+pyGQh6OgPJcEiSUskeNcPh9sBQCjJtmEpj4MZUzyS5yRB0dkdBK1cwz
	+ckHlCf+Et9qH3o+fgqps74J2m3fDVUXMBx4CA5aKEN5x8eV97HubJLbSKknSkU9msUUEEfADNJax
	DfKfeiJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBH1b-0000Be-3V; Mon, 09 Mar 2020 11:56:47 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBH0Y-0007Vf-CO
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2020 11:55:43 +0000
Received: by mail-wm1-x344.google.com with SMTP id g134so9533097wme.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2020 04:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7lXgaGBU6RYi6U6zxTiRxw0HA/EAYgc0JnTYQzLHUZg=;
 b=VY3Na1mLM78VKAyOTeoV1Njv3SZVtsUYheUrE33KJg1MCMxT0E6frrxkRQzFh+TaGp
 7K1LE7UV+tI8XBABegzy8dWa1xZfaDGIS+9pYWHLZGmB6m9NmyVgXRHwJKp8rFCZETd1
 7Y+4CKw1rya+E9PBH333GawS2NLDRSOKxQ7qZ2tS/7hiRTmzAOob4zOZdtHeB8oNuCOE
 CVp/LIh9z5Yw9IZAujMMymIZasQIS92aeNTgdQcKrco3cPO9v6xxMnk9rgA/BJtdUmGH
 v4sOKpCrAfM4jClj62oQcBb562MjcrastX+X1wMrblktCqFg4A99iqPVa0/MlV3RZg4E
 i4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7lXgaGBU6RYi6U6zxTiRxw0HA/EAYgc0JnTYQzLHUZg=;
 b=QJCYDyWecTd8Tb8r9ZZ7ZBf4/k1FdzQgcKrP3Z9tgxWF/tvNtei7ajzwd6yOdf+Svm
 qvY9cmGF/ttpb0oZ7cBkZWK5z0vD2DEUlN98rLN20oaoe2r3SNLzsOaE4rTGHApzbc2o
 bTz9OerDJyWnJBlFyeB1UNS8pPuTuAGmVnpL13sqWQ4QwcTWz7TsV+/5EftAFdt7bDV9
 bVpMcm2THUQ0uFOMQ7OUVtg5E6aywow/548aWtQiibUX3GrgZy+ZCMhD4JpNjtMDVEAG
 n7gx+E/LCfJgzq7l9bF4c8jP8gGxHNBJTSATSmfqin+nNJAC6zNP3sQn39aLsGpQP26O
 tMQA==
X-Gm-Message-State: ANhLgQ2QbVG4mvx35g2viQQmYrsr6fBSb7vrl6dERYtIA6i4AWiK84L5
 bJvy9kne9XaOFB3HqJB3Zhap77wx
X-Google-Smtp-Source: ADFU+vvejN3V2BjAHmFzd1LQdR64g8eDfBcDa6OWHYqV6LCuJXOwg9pJLSW6FlI5cvJYQ97jFw4lvw==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr7341078wmi.47.1583754940859;
 Mon, 09 Mar 2020 04:55:40 -0700 (PDT)
Received: from opensdev.fritz.box
 (business-178-015-117-054.static.arcor-ip.net. [178.15.117.54])
 by smtp.gmail.com with ESMTPSA id m21sm25035226wmi.27.2020.03.09.04.55.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 04:55:40 -0700 (PDT)
From: shiva.linuxworks@gmail.com
X-Google-Original-From: sshivamurthy@micron.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/6] mtd: spinand: micron: Add M70A series Micron SPI NAND
 devices
Date: Mon,  9 Mar 2020 12:52:29 +0100
Message-Id: <20200309115230.7207-6-sshivamurthy@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200309115230.7207-1-sshivamurthy@micron.com>
References: <20200309115230.7207-1-sshivamurthy@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_045542_481453_ECC09F44 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Shivamurthy Shastri <sshivamurthy@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Shivamurthy Shastri <sshivamurthy@micron.com>

Add device table for M70A series Micron SPI NAND devices.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/nand/spi/micron.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/nand/spi/micron.c b/drivers/mtd/nand/spi/micron.c
index ff0a3c01441d..9db1ab71fcae 100644
--- a/drivers/mtd/nand/spi/micron.c
+++ b/drivers/mtd/nand/spi/micron.c
@@ -133,6 +133,26 @@ static const struct spinand_info micron_spinand_table[] = {
 		     0,
 		     SPINAND_ECCINFO(&micron_8_ooblayout,
 				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 3.3V */
+	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
+	/* M70A 4Gb 1.8V */
+	SPINAND_INFO("MT29F4G01ABBFD", 0x35,
+		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_CR_FEAT_BIT,
+		     SPINAND_ECCINFO(&micron_8_ooblayout,
+				     micron_8_ecc_get_status)),
 };
 
 static int micron_spinand_detect(struct spinand_device *spinand)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
