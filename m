Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572D4C43331
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 19:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27E552070A
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 19:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gOuxhTq3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m29XoZSa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27E552070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OzYcBBcS2i74iQ6UC2HqaikALzKU9NCd55mAxYTSuPo=; b=gOu
	xhTq3VX7qHoLTFoo3TzlPGdDLgIFvk0lZcDeYnOA0fX5HYle91b2jSn4jlt3tsYdoRZDFuRN0MUm5
	dY4J7Qbszvd9PHMfEZvzEwGIJvzi40soLnyrYlFOvnkQRSQvGhJfHuV7P0B5S/AVPczwWsNhM4kN4
	rBMsLDLWTo5zGoBjklLCZNwltnqoh2InV7KEZ4vPE+bX7ISGA6c53d87UaVF4opRTpBKTYpOWaQIn
	WokcVBWdEkudjNaABnwuWijJpesq1S48kyjFJKuco76nx1Gjcgoy72I3jwPJPT/g24f8aX0K1PCJh
	p0jlikIpJarnNFC/Q4m/W099/rWSVCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGTDe-0003YS-0L; Mon, 23 Mar 2020 19:58:42 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGTDb-0003Xu-2J
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 19:58:40 +0000
Received: by mail-oi1-x244.google.com with SMTP id q204so8262687oia.13
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 12:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=isXxjm1k/CuPZto/U2dYrOfurqY1C+YcEhnMykFhmjA=;
 b=m29XoZSaF/fAkORgPyYPxiC5YaPAkiJu+i1tVkxo6BuN++1G8HyxGYYfzmfeL/urlJ
 UmLWUNCZV3ftNfjvWrV5X/rE2zo+A15CNN1f/1pU/lLFrjQNSOqKjYuEfu80c1Gt4ZWS
 c8r+3+RdMFlt908rju3r3fF06tlljDRnsqGAAqkbxQfbqD8SaJhN5jGJeD20zrNYC1NT
 L09PvqRF/QFdbencEbeADGLeHbcgOXVzhf0ZUwbEUn0zvWLuFgYyNSGAim4faF83SGUL
 C7qW1XHtanPvLEQ7ANREZf41TWe6yTbT282WK8z6r/TnKk4sq/oHuG2V3u0xkoVxhsrf
 waHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=isXxjm1k/CuPZto/U2dYrOfurqY1C+YcEhnMykFhmjA=;
 b=n243DVYWRIkTm3tqOvjVA3Ym7P02FiJikbv0Bavyu8nr0TizAbdZIwpkXhuoRmgPt9
 nbZQL0M7c7B3xHVibXnzvaNsXr7aqEhNDm3j7mHrw5SfJ1ubIo5yC9qQ4JdsQl/s33Xc
 J48+olZjViBjNo5oKdKxDJ0Dt4NizY3Lv9lxpR3T/ViOWDGPIIP4RRSqWKEFcY3b/JKq
 w8RGUZW6EpPg8Ut5UDtrjIFk2ayGfjSaXAZc75RxitsenZv/+vZxH75jWQxiT/4v0mPt
 JJ9Dt8pfKvi95DCEXqEbdq4MGGGHrOdH9x7ztmL7VWvuSrvvyz1KcX1Y3egNY8qWbjNw
 uMrw==
X-Gm-Message-State: ANhLgQ1/7yI+qvEIglaIMn/64odLC1YOxoSM2cFPLQDnrK3EGTeTUJ63
 FAeonHfYodUegO9Tn+SJcFBWR+13x+E0nLfA3nM=
X-Google-Smtp-Source: ADFU+vvgb4eydO4iBASM00qHG28LbiJUafs7Y9Rdt+OKSgrhaZRSdOVBfUi38Pe3NakyLaddHkKnnnZcppJVFSzkweg=
X-Received: by 2002:aca:5d8a:: with SMTP id r132mr793922oib.129.1584993513685; 
 Mon, 23 Mar 2020 12:58:33 -0700 (PDT)
MIME-Version: 1.0
From: ron minnich <rminnich@gmail.com>
Date: Mon, 23 Mar 2020 12:58:22 -0700
Message-ID: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
Subject: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_125839_111379_2018F9F0 
X-CRM114-Status: GOOD (  16.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The MTD subsystem can support command-line defined partitions
for one or more MTD devices.

The format is:
 * mtdparts=<mtddef>[;<mtddef]
 * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]

The ':' currently separates the id from the partdef.

The mtdparts can define more than one part, in which case
there will be more than one <mtd-id>:<partdef> component.

On Intel spi devices, the name is set to the PCI slot name,
e.g. 0000:00:1f.5.  There are two : in the name alone.
Since strchr is used to find the <mtd-id>,
in this case it will return the wrong
result. Using strrchr is not an option, as there may
be more than one mtddef in the argument.

This change modifies the name attached to the intel spi
device, changing all ':' to '.', e.g. 0000:00:1f.5
becomes 0000.00.1f.5. It also adds command line partition
parsing registration to the intel_spi_probe function.

This change has been tested and works on a modern Intel chipset with
a 64 MiB FLASH part.

Signed-off-by: Ronald G. Minnich <rminnich@google.com>
---
 drivers/mtd/spi-nor/intel-spi-pci.c | 22 ++++++++++++++++++++++
 drivers/mtd/spi-nor/intel-spi.c     |  4 +++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c
b/drivers/mtd/spi-nor/intel-spi-pci.c
index 81329f680bec..57716e53c219 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -24,6 +24,23 @@ static const struct intel_spi_boardinfo cnl_info = {
        .type = INTEL_SPI_CNL,
 };

+/*
+ * PCI names use a ':' as a separator, which conflicts
+ * with the mtdparts cmdline parameter. Dup the name and
+ * replace : with .
+ */
+static int fixname(struct pci_dev *pdev) {
+       char *name;
+        name = kstrdup(pci_name(pdev), GFP_KERNEL);
+       if (! name) {
+               return -ENOMEM;
+       }
+       strreplace(name, ':', '.');
+       dev_set_name(&pdev->dev, name);
+       kfree(name);
+       return 0;
+}
+
 static int intel_spi_pci_probe(struct pci_dev *pdev,
                               const struct pci_device_id *id)
 {
@@ -41,6 +58,11 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
        if (!info)
                return -ENOMEM;

+       if (fixname(pdev)) {
+               kfree(info);
+               return -ENOMEM;
+       }
+
        /* Try to make the chip read/write */
        pci_read_config_dword(pdev, BCR, &bcr);
        if (!(bcr & BCR_WPD)) {
diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 61d2a0ad2131..261b10cf5076 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -894,6 +894,8 @@ static const struct spi_nor_controller_ops
intel_spi_controller_ops = {
        .erase = intel_spi_erase,
 };

+static const char * const part_probes[] = { "cmdlinepart", NULL };
+
 struct intel_spi *intel_spi_probe(struct device *dev,
        struct resource *mem, const struct intel_spi_boardinfo *info)
 {
@@ -941,7 +943,7 @@ struct intel_spi *intel_spi_probe(struct device *dev,
        if (!ispi->writeable || !writeable)
                ispi->nor.mtd.flags &= ~MTD_WRITEABLE;

-       ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
+       ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
NULL, &part, 1);
        if (ret)
                return ERR_PTR(ret);

-- 
2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
