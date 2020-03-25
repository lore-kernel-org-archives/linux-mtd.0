Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EA6C1975A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 17:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C715E20789
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 17:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVw85SAs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnrdJX9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C715E20789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SAlnEaxDiMSN/OgYSEYunIB6KQyuS66ou6yVnTJps0E=; b=NVw85SAsyPHB3AWmOEdw4L1ihq
	FnyyKvYkI5dVTsNr9ccxa6eCOWInbH8XdWswjodw9dWjT//ruLmIsYmqHT6aGFX/csrBtWcgp4Xpr
	Fa7YPbscCkgK2/u5CpYkMVdc4iVS4Egh0a8hZQWqYVg52KatMghtE+LmwEqqNmmW5a5UDWljt8BPg
	pruV27J9AQ/zn8AHDI49wK6TCgXFBwl/yaBf0kCsZQHtFo762oy+oy7+fpITcyn5uanGZ/17eJ1Q2
	cT+HFrAgrg8MwJ5lFXtvvJGo/D0a20OAqHc/GokljmlYWEsPU9vxgah7EnMKyKdqdqYCZdRNLlwqC
	mJrwRyyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH9vI-0002b6-9I; Wed, 25 Mar 2020 17:34:36 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH9vF-0002aL-Ec
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 17:34:34 +0000
Received: by mail-oi1-x241.google.com with SMTP id y71so2847234oia.7
 for <linux-mtd@lists.infradead.org>; Wed, 25 Mar 2020 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=GB4mzfkxNJsJ+FgewMVj9Xcmsrebcjoz46kB78hOKgk=;
 b=jnrdJX9KYXP83mbNBaO/lG9wFYaD3ZHpMOr8s4sgAxae29pltG2tjwzLygYqnYAGEP
 i1rmeY/hecLIvqoz4BCBYseKGgBBCierHqW0svgcib+bIhyyw6QA0yS5C+R+9fdbP1yM
 14TSf0NQGd4uXmfjkDiWg4NSJ0XjW9OFhyhj6KUwbZvZxbf4wJC4ah6aa3kzhrFcgNA0
 dxawTuTCv+3xyD0GG+Oaq4dW+3lyVQTq5vFHEhFLbXgSRUBlisZ56qcQUKtGmgehz5RC
 7NY6tqtwAtaHQR0FKVNWRq5HJXRpidhJPv6rhLZQNiIKkGd8rSTJ3spqHZS5m9Il4wng
 ihRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=GB4mzfkxNJsJ+FgewMVj9Xcmsrebcjoz46kB78hOKgk=;
 b=sGPDeAwWlc67co+9Olqu/5glIXrzL5CPwXExnursySPbtgl6mJwFesJB0+B9H8hCeP
 /dJ7eiBqkt3xYPHl4D4O0dNyQ5zpAKtEc5Pp6VqDH7NGfS4y1Djq9KZIJUwAymSFXtoO
 WfMRmgT6Dwvu5x6gJ1r9b8q5j/E29b6qxJZuGUOh8kwxMskZo+w4vTzQmPcVJqR6f6QW
 DdQLB65w4lqO8O+HXN9wtuoQdH1HWCnHEFQD5Kl42MMya5Xm5Lj6QoIH0mpigQzQ6bnK
 SqNgIf+4zcBr3W/IHQIUfbzEBCn/HnXpJURjarTyeJNVOu1pfUL0r31XchPmOfmZNIzl
 n1zA==
X-Gm-Message-State: ANhLgQ0MX5Bqv9gnl15iY5Ply4alFsvljvW7RsWxqfzmOmaoHimpiPut
 PUjesuLSbYjeZiys0SXkcPEkVi0vWvsZWLuP4lYboHcO
X-Google-Smtp-Source: ADFU+vtBSomrF4B5ozAnUlwTMA/ikFLeWRjpADp7AbHJdpqoyCulP/Gc6ch97KDBITpOC1Ci0kF0Bo3yiMVhDg9NPu4=
X-Received: by 2002:a05:6808:8:: with SMTP id u8mr3166666oic.37.1585157672011; 
 Wed, 25 Mar 2020 10:34:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAP6exYJ3xk46PODgT=5WAdiLDNY=9MggxyaEwov6qyDQstLj7g@mail.gmail.com>
 <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
In-Reply-To: <CAP6exY+W+zTtEB1LmHYDnhEnPj26Y97Ld9TBAxsgX3vGDb4LnQ@mail.gmail.com>
From: ron minnich <rminnich@gmail.com>
Date: Wed, 25 Mar 2020 10:34:20 -0700
Message-ID: <CAP6exYKrAs_OpC_qkoW2cH0MxpqxDrgP2nhJGkp=2BX-6kAWbQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd/intel-spi: Support cmdline-based partition
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 mika.westerberg@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_103433_493562_3DB8AED6 
X-CRM114-Status: GOOD (  16.77  )
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

Signed-off-by: Ronald G. Minnich <rminnich@google.com>
Change-Id: Ibfa5caba51b8cdd3c41c60b15f8f8c583ded82ff
---
 drivers/mtd/spi-nor/intel-spi-pci.c | 23 +++++++++++++++++++++++
 drivers/mtd/spi-nor/intel-spi.c     |  5 ++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c
b/drivers/mtd/spi-nor/intel-spi-pci.c
index 81329f680bec..dc608d74e824 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -24,6 +24,24 @@ static const struct intel_spi_boardinfo cnl_info = {
     .type = INTEL_SPI_CNL,
 };

+/*
+ * PCI names use a ':' as a separator, which conflicts
+ * with the mtdparts cmdline parameter. Dup the name and
+ * replace : with .
+ */
+static int fixname(struct pci_dev *pdev)
+{
+    char *name;
+
+    name = kstrdup(pci_name(pdev), GFP_KERNEL);
+    if (!name)
+        return -ENOMEM;
+    strreplace(name, ':', '.');
+    dev_set_name(&pdev->dev, name);
+    kfree(name);
+    return 0;
+}
+
 static int intel_spi_pci_probe(struct pci_dev *pdev,
                    const struct pci_device_id *id)
 {
@@ -41,6 +59,11 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
     if (!info)
         return -ENOMEM;

+    if (fixname(pdev)) {
+        kfree(info);
+        return -ENOMEM;
+    }
+
     /* Try to make the chip read/write */
     pci_read_config_dword(pdev, BCR, &bcr);
     if (!(bcr & BCR_WPD)) {
diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
index 61d2a0ad2131..cb08ee4d2029 100644
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
@@ -941,7 +943,8 @@ struct intel_spi *intel_spi_probe(struct device *dev,
     if (!ispi->writeable || !writeable)
         ispi->nor.mtd.flags &= ~MTD_WRITEABLE;

-    ret = mtd_device_register(&ispi->nor.mtd, &part, 1);
+    ret = mtd_device_parse_register(&ispi->nor.mtd, part_probes,
+                    NULL, &part, 1);

     if (ret)
         return ERR_PTR(ret);

--
2.25.1.696.g5e7596f4ac-goog

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
