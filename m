Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B270FF887E
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2026 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N92NRtfsKISgEGX5t4mWyLCnFYNzyTSyktXxhq0bi5Y=; b=NVENa1WiwzBD0j
	5WBIoTD0FXLbcquSQL6yiQ3e7dUttYASJ2ADtRjUIVZJbLdv25D4/7ojoK82C4ulhnMOTIB9blfwj
	IHATZC4m2AAGfW3MHHq91meb+2wgY6o1GM2uWzfTl7bK0THfmPkefuBV+sUCx4Pot6l9KfFQTYWNF
	nZafTUzj7DU6bA/ZHd93haDVVkYiQZorPCYtZNRI5jjpCMQXmk636VCmghaDiEoFXgTxRN6zZVBcL
	cW6+xK5/F9ciVb4o/4y8XoBFSJ2FBUBEL7LSlgnUPlTloHKNxaiohx29HGLcs1NbLy0ukMl9BuUec
	Hzn8uMCYu6gECdadxhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9B9-000000041As-0I27;
	Wed, 29 Apr 2026 17:58:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9Aw-000000040ux-0kAb
	for linux-mtd@bombadil.infradead.org;
	Wed, 29 Apr 2026 17:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5tIkRnE1ORjoj4u0h1eWmFg73tjo03bMRc5hBjhSYqM=; b=ZxFzpSrnEh5cY4mHhpU1cF5J9a
	01QWjkFpjS80SssJpsyUho/WocB6ujDoWIz5mbf7BppzbMV6+AuNfblNnccnGDwKXXimiDUFIUXGz
	Kmi2jeu/XVkDWIx3jb4UD2hQE0LXB/81hmctyWbzw1oXBObQ3M0OGcfSKVfY2NQEUO4pHA5lTonyN
	++j1TSiAWpFzrPeOcLWCOyAbwHBAVfHbUO91mYZyvJfMrerVbi7zdU1ei9hRUIINQ1wlkeQZTJBzP
	QDrC/CKNayPFn/eymlnSznHn0nIrNwRWbMrPQ8wImLCH4KXfdQTDk1LVKpb1zuUcxOIr2x7LXbkWs
	uypg9n7Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI9At-00000005wMz-1Zkt
	for linux-mtd@lists.infradead.org;
	Wed, 29 Apr 2026 17:58:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35F694E42B73;
	Wed, 29 Apr 2026 17:58:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09E735FD43;
	Wed, 29 Apr 2026 17:58:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A14B1072B175;
	Wed, 29 Apr 2026 19:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485491; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5tIkRnE1ORjoj4u0h1eWmFg73tjo03bMRc5hBjhSYqM=;
	b=Vmb/o8DHri8qfjlDxdgxVCmz1cOiWo5fai2OHnEYLHyIsyVdpDTgWD44JJKYBik+Bop6+W
	qO/mPLDC2HvVPtzzFzJzmO0zmj8Ud0q8Cl6mkOzfLIV5t4BqhYfAOS/P4cCduBkSpSOfmM
	5M8eLmzfXkqP4D5NBRKhvhmcWtsq9c1mg0MVwung6UnlsGwZeb4fsNZ/pNVgjm2S/Vrlqz
	cQsoBDbxgbA6MAC7jdwUUgJJZj7f2xsTfwFvpawEIDwOwqd6ZhkIt1k16aESiXmhdrWfdA
	Wg5O+8KVvlIUYgrSqKw5HE7tXplaioeNXtYi4yXBgQzvAFVe4lpxohvMt0C13A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:46 +0200
Subject: [PATCH v3 09/11] mtd: spinand: winbond: Create a helper to write
 the HS bit
MIME-Version: 1.0
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-9-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185815_473501_72198311 
X-CRM114-Status: UNSURE (   9.36  )
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

Updating the HS bit is not complex but implies reading, setting/clearing
a bit and writing. Clean a bit this section by moving this logic in its
own helper.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 6c11f59a9f8d..b30a343a6672 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -404,13 +404,28 @@ static int w25w35nxxjw_ecc_get_status(struct spinand_device *spinand, u8 status)
 	return -EINVAL;
 }
 
+static int w25n0xjw_set_sr4_hs(struct spinand_device *spinand, bool enable)
+{
+	int ret;
+	u8 sr4;
+
+	ret = spinand_read_reg_op(spinand, W25N0XJW_SR4, &sr4);
+	if (ret)
+		return ret;
+
+	if (enable)
+		sr4 |= W25N0XJW_SR4_HS;
+	else
+		sr4 &= ~W25N0XJW_SR4_HS;
+
+	return spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
+}
+
 static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 			   enum spinand_bus_interface iface)
 {
 	const struct spi_mem_op *op;
 	bool hs;
-	u8 sr4;
-	int ret;
 
 	if (iface != SSDR)
 		return -EOPNOTSUPP;
@@ -429,20 +444,7 @@ static int w25n0xjw_hs_cfg(struct spinand_device *spinand,
 	else
 		hs = true;
 
-	ret = spinand_read_reg_op(spinand, W25N0XJW_SR4, &sr4);
-	if (ret)
-		return ret;
-
-	if (hs)
-		sr4 |= W25N0XJW_SR4_HS;
-	else
-		sr4 &= ~W25N0XJW_SR4_HS;
-
-	ret = spinand_write_reg_op(spinand, W25N0XJW_SR4, sr4);
-	if (ret)
-		return ret;
-
-	return 0;
+	return w25n0xjw_set_sr4_hs(spinand, hs);
 }
 
 static int w35n0xjw_write_vcr(struct spinand_device *spinand, u8 reg, u8 val)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
