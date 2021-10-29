Return-Path: <SRS0=Jpfl=PR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980F3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541C56044F
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Oct 2021 17:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 541C56044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SN6xRuNapbjJR++uJgwB3j60WPqP7xq+L3FR1Kk3fIo=; b=ey08y7JDRHU0Yr
	vTq1bg+iORQLiuBKEOxvN1D7HkoVASXmmyJG0oMjBNxnjj3OS/b3y160H9i2i/a8EZRbydH2gefuH
	iyjXEmtum0Y2b73Jllt9CgCI4Xz+2k4szwtaOpqEWcboFAQYkqd3H9xTjSJt7aTwLTPfwZsd3YNhh
	AXi7LYRyLiGI4Sx9oyl9hamffJvxYc1P6fC8J0rauqhKRZasxmZIjZMidr7pk3BGpfd6YEfXsoij1
	YrPtvaF7GvqWNRNwo9u6wPO9MiUvxQlojBnCAyosbyZ3WsLHNf02IcDM3xJlWZO2GKzWGb41Iwk2r
	8tB+xIh/vDaRNjKPWJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVo9-00Bbym-Iu; Fri, 29 Oct 2021 17:36:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVf1-00BZCD-Lq; Fri, 29 Oct 2021 17:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1635528443; x=1667064443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eqzsUVDRw9YtN5m/66KMPe1YJhfXp/62EoZND71iCKw=;
 b=y76MLpuPZqTiTCZSOxESPrDTzJqfLNNU+PMPv5RcagdB8AYcvtNdu+FE
 fLC5LLpMLbC0N0Fp4L7FARexHF6J5oKCyJw1niZhzBfvA9ASxJ5ikiaud
 s0J0UKz430Jz+5Nq95YIr8RCv6CJttEsTA2X1uOVNrHQKYbXuebg65ES9
 ixXhwxmRMbOw62IcsmEwjKL37WybQ9bNOj74rZAJfnqCQQFZickETSGa/
 vvSgOuyI8Qt3rOFFJnotgwm96+dpctKMAl6xjKgbHifagyzEAyjmyMDYJ
 0j9BoAy6ngGg0PCWp2nGq7ok8NQFDJ/hQgqUQQDCW4w/fuROjB/a1B12I Q==;
IronPort-SDR: nxqUj+I4H50sisMaIPiC+ZTj/S8k31zS4lEhgJt3W5Qfy21mJCVATaxIs5WpECf0U85GtDsWYZ
 Xmqg9e/OmAO+w6zjrNNGnPRAuajVC1/cNb/Q1b2qvNZik7YDm51F/rOfmTu9001XEHzxKAxEtD
 HbU700CrMZ8FRHW6CdLapcRkf9ncqpCE2AMOL/AkE93Nw4E9WbCPYeXVVc59nhkvw/ue5PS1rD
 n7XV9BD75mcYhIAM7MSgwMgWUqJ7R6dC1t5a10EgKxw7gHvsB9Lc5mQUZt2zEohky9VBIyK8GZ
 4Wv421/VNYlB6RxZXq2+kJeC
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="134820855"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2021 10:27:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 29 Oct 2021 10:27:20 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 29 Oct 2021 10:27:16 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <michael@walle.cc>, <vigneshr@ti.com>, <p.yadav@ti.com>
Subject: [PATCH v3 08/25] mtd: spi-nor: winbond: Use manufacturer late_init()
 for OTP ops
Date: Fri, 29 Oct 2021 20:26:16 +0300
Message-ID: <20211029172633.886453-9-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_102723_868898_35CCAC5E 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: macromorgan@hotmail.com, jaimeliao@mxic.com.tw, Tudor
 Ambarus <tudor.ambarus@microchip.com>, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

OTP is not described in the JESD216 SFDP standard, place the
OTP ops init in late_init().

We can't get rid of the default_init() hook for winbond, as the
4byte_addr_mode is SFDP specific and will require to have all
flashes at hand, in order to check which has the SFDP tables defined,
in which case there's nothing to do if the SFDP tables are corect,
and which of the flashes do not define the SFDP tables in which case
each flash should declare a late_init() fixup.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 96573f61caf5..dd4be0f78e67 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -147,12 +147,17 @@ static const struct spi_nor_otp_ops winbond_otp_ops = {
 static void winbond_default_init(struct spi_nor *nor)
 {
 	nor->params->set_4byte_addr_mode = winbond_set_4byte_addr_mode;
+}
+
+static void winbond_late_init(struct spi_nor *nor)
+{
 	if (nor->params->otp.org->n_regions)
 		nor->params->otp.ops = &winbond_otp_ops;
 }
 
 static const struct spi_nor_fixups winbond_fixups = {
 	.default_init = winbond_default_init,
+	.late_init = winbond_late_init,
 };
 
 const struct spi_nor_manufacturer spi_nor_winbond = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
