Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DF1C2D0EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 15:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F07F208E4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 15:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HVEKalwU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJHNPZGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F07F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YE5DeLeZtQh58N4UYVAf5Gx1GzrHkIGO7hePCkKGXmY=; b=HVEKalwUDj8VtR
	e/uxpoPvf5YGQgnr4SswTrscCpNVsx3Per7X/Gw+OLGm4r/UucTeCvYHiCo1koXR2zaMLc18qJh5w
	OTMstA9XSpFIGVbZpOFT1UCIegsox5cEFrMXS9qAl1OHSCnZ6xTjl2cswYidVDOOtxxvO5prpDx1p
	R6+YK/KqGAPhfFoKbiX5GsLiLrQO4pd5VB2191t6QSN0uDS8JI/+00GbM+6fSYDccErgOQ60hIAGx
	0GhEH3TGLCMkmaQHxe/10TJx57V5nP8ALPbgepY1fFWoQiaKt9IE+DjYCcQboCosuQ5mtqUzngENx
	nbsFBNx/ksSKTB6dPutA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPStC-0008R5-Md; Fri, 17 Apr 2020 15:26:46 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPSt6-0008LQ-P1
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 15:26:42 +0000
Received: by mail-pg1-x542.google.com with SMTP id r4so1258778pgg.4
 for <linux-mtd@lists.infradead.org>; Fri, 17 Apr 2020 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DH5AjWb5Y/HC4rBu1O6z9vHzFuPiXlFK1AmlrEvjj1A=;
 b=AJHNPZGamNVhXj58t/rjjOmLiPwPhdg3Cmlp2SvMNpyIAXJg83bmi/2+TShr3PED4q
 Q+oIbSREwdqz6sKTkYNsDy+2g4NVIFHK+hEsTnRDyahOhREzVwCiKh4u1+/RYg+wzQOQ
 bvycfFGUVNCpF049Gd0ffo45Z61vIZ0AKjf6DNu+s1orFIeOqJKxRc4JOO2TozTMxLwX
 1GA/U1Hei91bRTglzUEw1StxZv3zDkxxZSzbThVAcXHfhyi6nDj5iRnX+q/TmiEd8yaL
 8GdEOVaSOQNcRMwbq62nPCxZN4zgYtesoUzRZgo0yaBpnCECDPgQWaIutlScWzOL7mfV
 Xoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DH5AjWb5Y/HC4rBu1O6z9vHzFuPiXlFK1AmlrEvjj1A=;
 b=T6SdHi4kkdPWo6Zt1yVP7VYlF1PkJXhupR1A8RZ31UlUbVvMvj2n/ST097XoEupUDb
 cLpo3gXrCKAs6/6NUSxB7OUApyB10W/mkE7RgILHfiw5WllTd42TP/OMh5ZAA1AQIBlN
 T4CWs/qTe4GDgPxabYsazNq24t/UjPdi1w/BwPl0OTaTtPwiYKZHqpmKnQpOxA/65HIq
 M6o7+DD6Mdp+UWxwRxCrk8QMWOPSE+CqEG8nfZn7NjxYwz8WE04/UGCv53CxVGC9w6M8
 SUCfwGrqWOVtutZb8Hqgo0eR4pmJXOPQg3Jz7XdfI4JlyENsvLN1eJWQvcleK4CPGCW+
 Layg==
X-Gm-Message-State: AGi0PubHN2vL1KxQMX4dHx/wy+2+ZFxN9yyvBeITA1+4rheeaFj1E/vo
 iLIxjmR31einRec4f8DsIv8=
X-Google-Smtp-Source: APiQypKeRXG2E61w4rat3AOZywRaxqK4VdTTZAbbbIZ4/PWI3LoCg+td2GI0G3iPti4SdUu57/PgSg==
X-Received: by 2002:aa7:9f93:: with SMTP id z19mr3832007pfr.187.1587137199052; 
 Fri, 17 Apr 2020 08:26:39 -0700 (PDT)
Received: from minnich.svl.corp.google.com
 ([2620:15c:2c5:3:65f9:fd8e:a0b8:2917])
 by smtp.googlemail.com with ESMTPSA id z6sm18265299pgg.39.2020.04.17.08.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:26:38 -0700 (PDT)
From: "Ronald G. Minnich" <rminnich@gmail.com>
X-Google-Original-From: "Ronald G. Minnich" <rminnich@google.com>
To: 
Subject: [PATCH] mtd: spi-nor: controllers: intel-spi: Add support for command
 line partitions
Date: Fri, 17 Apr 2020 08:26:11 -0700
Message-Id: <20200417152613.176554-1-rminnich@google.com>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_082640_903735_0BD41EE8 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, "Ronald G. Minnich" <rminnich@google.com>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Intel platforms, the usable SPI area is located several
MiB in from the start, to leave room for descriptors and
the Management Engine binary. Further, not all the remaining
space can be used, as the last 16 MiB contains firmware.

To make the SPI usable for mtdblock and other devices,
it is necessary to enable command line partitions so the
middle usable region can be specified.

Add a part_probes array which includes only "cmdelineparts",
and change to mtd_device_parse_register to use this part_probes.

Signed-off-by: Ronald G. Minnich <rminnich@google.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index 61d2a0ad2131..132129e89d07 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -894,6 +894,8 @@ static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.erase = intel_spi_erase,
 };
 
+static const char * const part_probes[] = { "cmdlinepart", NULL };
+
 struct intel_spi *intel_spi_probe(struct device *dev,
 	struct resource *mem, const struct intel_spi_boardinfo *info)
 {
@@ -941,7 +943,8 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	if (!ispi->writeable || !writeable)
 		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
 
-	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
+	ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
+				       NULL, &part, 1);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.26.1.301.g55bc3eb7cb9-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
