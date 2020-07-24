Return-Path: <SRS0=mo6j=BD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64162C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 21:30:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 253B1206F6
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jul 2020 21:30:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UMScBbYJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="M3fN3srJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 253B1206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjmoDTQ/D4doRdPed5EC45X8YAVhIufUC7SyzD6f1ZE=; b=UMScBbYJD9yQDQuhaHMmx7Gm7s
	7kq2LL7okP6GrzVaLqHRxpbVN3eaukSFAedaKC514tp2Ear/L7z2g77NbeGYQg8w03cCWPzlVZmT4
	2HR+7yT9MVi9G54Ji+gCie98ZV/DPa17SDhp+2AmP1NKbyD+bnIZpRZIHbVy/TOdBfx7ZWuK0arrz
	aWp6uzPT/OiaAWFMKLpTS71lGd3xeJIdHwWpPIPIYHrW+N1XJTsemg8Fi2ZF5NtHLz0V6VMueL/B1
	YKOkcZZwnrwfglMh3fmOboBwB0rr4yfoa6jmc9ssrnDz7xW5K8ZGdUIYrh4CS96HHUOeBhfWTX29M
	BC9r1dgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jz5Fm-0001Pi-RT; Fri, 24 Jul 2020 21:29:18 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jz5Fk-0001PA-6N
 for linux-mtd@lists.infradead.org; Fri, 24 Jul 2020 21:29:17 +0000
Received: by mail-qv1-xf43.google.com with SMTP id di5so4747270qvb.11
 for <linux-mtd@lists.infradead.org>; Fri, 24 Jul 2020 14:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0IwUFhaabh/nXh3QEUZEDpYs1syuDyPDgcXgIKM8icc=;
 b=M3fN3srJWK4wZCZQQtn7XxJP42rIvQg08x8E33MCjq7j9nhRRdCy8t5nlIcD+KSIjq
 AI1ytt8VTE7Ip0c4gvu9reBmAa4My6LSkAQII1gJR9TwnfSTABvAKkLLbILh8iCQ12BW
 AAJdy5ppk44j/FUobN7U2GscswkShLiuBleIJtiywE96IOzLknpDNMSJrF6h+0Z1c+K0
 LsQ1WNswd7r9pigvQSg1k25lmK2pxThZ6cYPBhYCnz1dYDd4Q/7oqfQ7x43olx0PcwVM
 cs2zvOR2gk6RIpmRfCgw8DY3TsczcO5riQFtWWdGARWG/KudN0Sugk4IxUtZyXfgsxRe
 RL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0IwUFhaabh/nXh3QEUZEDpYs1syuDyPDgcXgIKM8icc=;
 b=EgHrJAenMQTua5qQQNgWROLmjUZ7o0zhKmTyY9YYVh9AKQmCBXVlVVJeGLL3Z9HxYM
 HG80REEidj1hNOEw8GviO/eBL9/0ojwsEJ4CteAx77vxCbuwm0mzv9tO9cIa0Zzi9jYS
 Ka2rClN1l/A7iyRkluxCICeEVQ7PmJPRo7Qko2IU7f+wFXmAFeYuSejMJ0x15ge9SAeK
 F6Ger5CjNHoCUq15MuizzEnGEH8r9jEuo9b/ksxVR9X6a2n0nHJnIw+/+hhktdClkznB
 1qvYzcVFBHnpjr1Q3TGWlqBgW0WJuNcoA+cdeefBG+MFgsAaCJu5ujEU4f5Xkwlqojqz
 98Qw==
X-Gm-Message-State: AOAM531HPchAOq1nla8IiA9FIHsQJ/J5TwU428oGYN8sToskRbZW5BdS
 8KUiEG1vXsqF/Js9RgM2Euqm3Q==
X-Google-Smtp-Source: ABdhPJyNdEPcfYzQHlPqEuCVHXHTCMhlXskpv805tJl0l+zUNf5Xt0TaQfFkQT307jEtgWwPUdclqQ==
X-Received: by 2002:ad4:5042:: with SMTP id m2mr11509729qvq.225.1595626152945; 
 Fri, 24 Jul 2020 14:29:12 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id p202sm5224758qke.97.2020.07.24.14.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jul 2020 14:29:12 -0700 (PDT)
From: Daniel Gutson <daniel.gutson@eclypsium.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Gutson <daniel.gutson@eclypsium.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Bazhaniuk <alex@eclypsium.com>,
 Richard Hughes <hughsient@gmail.com>
Subject: [PATCH] Module argument to control whether intel-spi-pci attempts to
 turn the SPI flash chip writeable
Date: Fri, 24 Jul 2020 18:28:53 -0300
Message-Id: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_172916_514262_4205234B 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Currently, intel-spi has a module argument that controls whether the driver
attempts to turn the SPI flash chip writeable. The default value
is FALSE (don't try to make it writeable).
However, this flag applies only for a number of devices, coming from the
platform driver, whereas the devices detected through the PCI driver
(intel-spi-pci) are not subject to this check since the configuration
takes place in intel-spi-pci which doesn't have an argument.

That's why I propose this patch to add such argument to intel-spi-pci,
so the user can control whether the driver tries to make the chip
writeable or not, being the default FALSE as is the argument of
intel-spi.

Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 81329f680bec..77e57450f166 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -24,6 +24,10 @@ static const struct intel_spi_boardinfo cnl_info = {
 	.type = INTEL_SPI_CNL,
 };
 
+static bool writeable;
+module_param(writeable, bool, 0);
+MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");
+
 static int intel_spi_pci_probe(struct pci_dev *pdev,
 			       const struct pci_device_id *id)
 {
@@ -41,12 +45,14 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
 	if (!info)
 		return -ENOMEM;
 
-	/* Try to make the chip read/write */
-	pci_read_config_dword(pdev, BCR, &bcr);
-	if (!(bcr & BCR_WPD)) {
-		bcr |= BCR_WPD;
-		pci_write_config_dword(pdev, BCR, bcr);
+	if (writeable) {
+		/* Try to make the chip read/write */
 		pci_read_config_dword(pdev, BCR, &bcr);
+		if (!(bcr & BCR_WPD)) {
+			bcr |= BCR_WPD;
+			pci_write_config_dword(pdev, BCR, bcr);
+			pci_read_config_dword(pdev, BCR, &bcr);
+		}
 	}
 	info->writeable = !!(bcr & BCR_WPD);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
