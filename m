Return-Path: <SRS0=nxGi=F3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864CDC433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 21:57:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11706221FA
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Dec 2020 21:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11706221FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LCjj6MsIuKiM4X3RfU1fsAXyFpU+r41efk6tF2Phn7M=; b=gsRACwxZu2pPhnU0M3RA5mXNT
	GUHKu7u8DIZjR6qJywAeFr1WIAJgweKyWZeI94qSRB2X1zzLjOeBgxDrwvT1AL5zHmg3hOrJKDIGO
	uMNGWBW2/lVtJbc4/wE65et8p3p6BzikgbdplejgAKp+R3kNUiY3qZ2B7scbRAqlHEf1DB17ekpcN
	yGv6t8oqmp3UEVBErFDyOLSQE68L0U3o6MPJu3zM0isvSWLlT2l2nAjjZc4tIZaEaFoeekSRnOxv+
	xIRysBLi+D9tR7pRU2pciYV7uK40X10hMaVgmNHtt+GZvBIYJtP8bUTYPNEI/EUy6VH9PEICxSD9m
	XS81zltkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksC7s-0005N1-RZ; Wed, 23 Dec 2020 21:56:56 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksC7q-0005MK-8H
 for linux-mtd@lists.infradead.org; Wed, 23 Dec 2020 21:56:55 +0000
Received: by mail-qv1-xf49.google.com with SMTP id f7so366391qvr.4
 for <linux-mtd@lists.infradead.org>; Wed, 23 Dec 2020 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=jCG+pP5B/ha4zc4aANM/eXYqzTZqfBuYgIBq10srGgc=;
 b=nYnwax4SRVuQGeooRFDyFNIzMBuAzj2r78Z9tDwBEIoUniS/GEnKWslTLzZnz1Nj66
 ROa3/HZfcX02fZCFHI3djGAdq4s+6dSMOjYaJqnBFasdx5ivJpisntJAeyn2mvX/40R5
 RCGezh0HlnVam7sPVVjsZRtt5XA3MGpmBxuW9HhKmOznHKuVq7IA4BEmHIZbGIPfam9T
 8VC/NgTHTCuVE/+P+/HJWHFlHgczn3NQRq9Ce1pr1/NIhhClMv4LLbmdE00o1e98N2to
 SXdi+NPV2axecTksd43+iolSehqV269OvtqJkuo1eFjml13ZZP1c7w6q19xRH0C1PZC0
 iopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jCG+pP5B/ha4zc4aANM/eXYqzTZqfBuYgIBq10srGgc=;
 b=tfIQqTlMRvLEcNhMf2yDm89wKGpT31fx2MVQtgPRmX05Yx7dvWWMkg52BJCZmrLXvJ
 1L/T/gUkve4DtJMTRfL3DY07DKfRRK8XQsytigot0zPLLydTr1y5laednMP3K/7NGkST
 BjFGI7Ug2vVz6uz747B8efY11cqyb3eLgJ3wuiLBO7WJUV0xyk8sgpL/0C3weMGL0oDK
 ZQfSnEVptmwmIbZIMOeCD+BJA5xIm5v0LyfnGMPgAAGLQyf1cShzA6uzqY0GjcbSyyNW
 PAMBBDWrWiOS2Ugc02wN97zCQgVZoqWvWLnadqOzRSI1JnCSLD2WmvbSzctPTxsRJXPP
 obZw==
X-Gm-Message-State: AOAM532RxlNVf254aWZRYIQPNx6q0BvLp5wHdFT/xu92xglEWFMqSLvF
 epujiC1xSqO0ER9mx+mAXT0mISc/knoSWT0=
X-Google-Smtp-Source: ABdhPJzcdwpbleDWDWlKof2to9y4p0GOiPNS6G4j2LvnBlWfhcsRwwRXXcgSu5YAX4np3ypNVVy68a+po87tukw=
X-Received: from overmind.svl.corp.google.com
 ([2620:15c:2c5:3:1ea0:b8ff:fe77:e712])
 (user=goegebuer job=sendgmr) by 2002:a05:6214:533:: with SMTP id
 x19mr29179737qvw.20.1608760607341; Wed, 23 Dec 2020 13:56:47 -0800 (PST)
Date: Wed, 23 Dec 2020 13:56:30 -0800
In-Reply-To: <1887c783-7a80-a71c-949f-c07c83c2d0fe@ti.com>
Message-Id: <20201223215630.1917891-1-goegebuer@google.com>
Mime-Version: 1.0
References: <1887c783-7a80-a71c-949f-c07c83c2d0fe@ti.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
From: Ian Goegebuer <goegebuer@google.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_165654_352143_802EBBE2 
X-CRM114-Status: GOOD (  14.53  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Jethro Beekman <jethro@fortanix.com>, linux-kernel@vger.kernel.org,
 Ian Goegebuer <goegebuer@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 "Ronald G . Minnich" <rminnich@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

Signed-off-by: "Ronald G. Minnich" <rminnich@google.com>
Signed-off-by: Ian Goegebuer <goegebuer@google.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index b54a56a68100..9de38851c411 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -903,6 +903,8 @@ static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.erase = intel_spi_erase,
 };
 
+static const char * const part_probes[] = { "cmdlinepart", NULL };
+
 struct intel_spi *intel_spi_probe(struct device *dev,
 	struct resource *mem, const struct intel_spi_boardinfo *info)
 {
@@ -950,7 +952,8 @@ struct intel_spi *intel_spi_probe(struct device *dev,
 	if (!ispi->writeable || !writeable)
 		ispi->nor.mtd.flags &= ~MTD_WRITEABLE;
 
-	ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
+	ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
+					NULL, &part, 1);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.29.2.729.g45daf8777d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
