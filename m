Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6420FCCFA02
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Oct 2025 17:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5byU1TR7O/wrgBOJVF09ui6hH++hNN0KxWN0zvamXhU=; b=JQ6RVWwdcXsXsU
	aTmEiC+NvRpwOiBCBzLl8ve7jyQkW+ZdsYZBSxPnM0m1C0WccX6OUrIt56bHRKOlnbDCbKEHI7P9D
	Vp6fsxtvZMFssOudt/7IHK96GDKNEOMP8EtMmq1FoKz0tKBD2CKsE7na2X/NVyDAbc0YEdioRN99/
	5+blQ/FBsAWIJJC8TofcAuqlDOSJL4yFi8VLPWxt0jletU79ptEzTOaN5Yu8nkB++JDQMWx+R1SRc
	eKEQYnjx8THvqI4Fiz7NQWKPYZi8RsTnkmTT/Q3/+dEq7tFoFdjUJXGZT/7R853Gb0COaY1PXnyOx
	z0BnmG1Cg+eiYUrBRVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEswi-00000006Vyz-2xJy;
	Fri, 31 Oct 2025 17:29:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvf-00000006Udm-1I7l
	for linux-mtd@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 555D54E41442;
	Fri, 31 Oct 2025 17:28:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C41160704;
	Fri, 31 Oct 2025 17:28:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8471311818466;
	Fri, 31 Oct 2025 18:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761931724; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r4QdbcFBCx7yyVZucPnXkIWsxV+Bp5ag9tk3sEn1mAA=;
	b=W+sBhqYbh0YnF2BOR9j6yWodY+F0iL6iTI1C89zODzGruf9oYX65k7aEjAwT6FyBp7qLfI
	laKGbTNXjRpOr8Re7HQbifnYuH7DuxZK37+BWqoLUab9vpIOpNqBKhpN1DMb9S+8lOX132
	IbEPn+FdZhD5W5kNykWUNlrCKjCscdS4DNmeJpAKZ7x2K9ioYXxSrAz32dhqb5L5vlZ7qY
	l9urCVerHBXFWMu5tUgMBwBW6dAPdLjSd9Gvgi5v92xgTmassmRLZBGzld4ZkG1DqvoaZs
	246LY/1+aQ3zB4n+Jn6t6N/7xbjUNV9DMZb2hDpdGn9pnc3XAottbEdN60D5Hg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Oct 2025 18:27:10 +0100
Subject: [PATCH 26/28] mtd: spinand: Warn if using SSDR-only vendor
 commands in a non SSDR mode
MIME-Version: 1.0
Message-Id: <20251031-winbond-v6-17-rc1-oddr-v1-26-be42de23ebf1@bootlin.com>
References: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
In-Reply-To: <20251031-winbond-v6-17-rc1-oddr-v1-0-be42de23ebf1@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102847_602181_2DE5E464 
X-CRM114-Status: UNSURE (   8.09  )
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

Both Macronix and Winbond have chip specific operations which are SSDR
only. Trying to use them in an ODTR setup will fail and doing this is a
pure software bug. Warn explicitly in this case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/macronix.c | 2 ++
 drivers/mtd/nand/spi/winbond.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/macronix.c b/drivers/mtd/nand/spi/macronix.c
index 6b7cbcc6e2872d3369b8eb765dede05c7299c896..84be5e0402b5db8787178dc0a39901b938b0d2e1 100644
--- a/drivers/mtd/nand/spi/macronix.c
+++ b/drivers/mtd/nand/spi/macronix.c
@@ -53,6 +53,8 @@ static SPINAND_OP_VARIANTS(macronix_ops,
 static struct spi_mem_op
 spinand_fill_macronix_read_eccsr_op(struct spinand_device *spinand, void *valptr)
 {
+	WARN_ON_ONCE(spinand->bus_iface != SSDR);
+
 	return (struct spi_mem_op)SPINAND_MACRONIX_READ_ECCSR_1S_0_1S(valptr);
 }
 
diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 419f4303a0dc7518017e2bd422584813dca14d48..90e4ece00cf5e727df87cb2367d9f85a2a6759bb 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -114,6 +114,8 @@ static SPINAND_OP_VARIANTS(winbond_w25_ops,
 static struct spi_mem_op
 spinand_fill_winbond_select_target_op(struct spinand_device *spinand, void *valptr)
 {
+	WARN_ON_ONCE(spinand->bus_iface != SSDR);
+
 	return (struct spi_mem_op)SPINAND_WINBOND_SELECT_TARGET_1S_0_1S(valptr);
 }
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
