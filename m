Return-Path: <SRS0=GAYx=BO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FBEC433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 13:59:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B2432086A
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2020 13:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0oqsXs0u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="NmSO8dxB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B2432086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f67NJQ30VpM9OVmwu1+nYMg2kX1IizZOtaLiunpyq+4=; b=0oqsXs0uVsU1c6YnEiXemwDGgc
	ZDBWCFyC2hZQpTbkCtAqCmGBqC5dBkOpxJ7+b+utyg1cXyT7xuRKltcj17G2BOKJ1mUnh0+EZG3UL
	MqV+YD0Hiju52DtHXaecr1tBJ6m3GM6DJzu1Z6Fkyp4T09VvyOv2JvPqPNEZV9noeRAET7W2YqpJq
	aHcCCN4aMo9b1EMifjR9Putj22hgBJDR3re+Rb8yuE8JJu6LaGtABbMy8K0RPMUOHsugJ+mVgwzjP
	HSOgqtJzAtiNQNV/LYxLwhserU1DJKAkT5spJ6+kxIiFf80LPlRbLc4IpNiuj+YLwVN6gLy4S99VE
	/ukJ0DNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2xSZ-0000ln-Jx; Tue, 04 Aug 2020 13:58:31 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2xSX-0000lB-Sf
 for linux-mtd@lists.infradead.org; Tue, 04 Aug 2020 13:58:30 +0000
Received: by mail-qv1-xf43.google.com with SMTP id o2so19001759qvk.6
 for <linux-mtd@lists.infradead.org>; Tue, 04 Aug 2020 06:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v//52S0oWqF0q/pvhHFNNBHFoWzKUF/wuj38r6SqPoQ=;
 b=NmSO8dxBPaU+APGuwDQiFe+kBY/TLdbQbVnSiP6W1ot8o8tXBd0uEtKb9uokPDMqXB
 hDUtallKiMZmQmSe2lSKO/mNUkeE9HnCX6yLVClEhifcAH7MqyfLD1LCnDRPcILxQneN
 PeUUNfy4LZBd27L/d0sL4vC9RShHYsZUilMaslQTQ3Qy22c3M/VYscd6D2tnIgvBHclM
 J0v4CNKmpgd1Qu6nqLHEXMGP518uEiVqnrlGxm2eAKrwsd7nNL8xX5YJG5qf8EBdVfxb
 rB0Ykb/cd/vaceNna27I3VGMIO7EplBiUZnrUsT/lMZmCkrFE8euWUr+zhTRgFoS+MR6
 2C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v//52S0oWqF0q/pvhHFNNBHFoWzKUF/wuj38r6SqPoQ=;
 b=nMrVIpnH923GNDijZXRradOsCBiY5wpPPxnRfl4eP6xFCG/7dIoPm9n7/rFZGgD2Ue
 NetkWDzTpKRomGZRWIIJQnZMeaU+f22I82lBZC+wpQrWcUwE+qS4OGUERwtIbvDwUf/q
 1qV9P/d39bHHzB2Aw0B4I5M7IPEfjBKYcF4ToFF/m1Pwxk9IQ+zaGwY2lxpIrBrVZSjd
 LbocU31oP2NorsSaOvTRQ7FY2b0pBdHOyX4EYvQDnycS8NqI4GZqgJT+rKS1L3NCWakP
 fUesMF4N8AnBex2IU+ETIBej/zT1W6P0hlIwjYia1X7iuauVdTG0p2lIE1GPE+3fua5T
 P0kw==
X-Gm-Message-State: AOAM532r0psrL5qTlK1hykvq4mrHL9Ig9lcV79r0rCL9Sy4+FkH5nJfp
 zAOff6txh5WzCR01ex3w0x35Cg==
X-Google-Smtp-Source: ABdhPJxQ0oF4/D4p6FW7hD76hNivUtUBUtuUhxt3B5tN5owha1nvT9xeuaSSq8pj5PtFqI/A8uA4pg==
X-Received: by 2002:a0c:9e4e:: with SMTP id z14mr22039852qve.71.1596549505898; 
 Tue, 04 Aug 2020 06:58:25 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id c7sm20637736qkd.92.2020.08.04.06.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 06:58:25 -0700 (PDT)
From: Daniel Gutson <daniel.gutson@eclypsium.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Gutson <daniel.gutson@eclypsium.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Bazhaniuk <alex@eclypsium.com>,
 Richard Hughes <hughsient@gmail.com>
Subject: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
Date: Tue,  4 Aug 2020 10:58:17 -0300
Message-Id: <20200804135817.5495-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_095830_050931_E17F417C 
X-CRM114-Status: GOOD (  14.95  )
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

Currently, the intel-spi-pci driver tries to unconditionally set
the SPI chip writeable. After discussing in the LKML, the original
author decided that it was better  to remove the attempt.

Context, the intel-spi has a module argument that controls
whether the driver attempts to turn the SPI flash chip writeable.
The default value is FALSE (don't try to make it writeable).
However, this flag applies only for a number of devices, coming from the
platform driver, whereas the devices detected through the PCI driver
(intel-spi-pci) are not subject to this check since the configuration
takes place in intel-spi-pci which doesn't have an argument.

This patch removes the code that attempts to turn the SPI chip writeable.

Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 81329f680bec..2b071da804e7 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -41,14 +41,9 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
 	if (!info)
 		return -ENOMEM;
 
-	/* Try to make the chip read/write */
 	pci_read_config_dword(pdev, BCR, &bcr);
-	if (!(bcr & BCR_WPD)) {
-		bcr |= BCR_WPD;
-		pci_write_config_dword(pdev, BCR, bcr);
-		pci_read_config_dword(pdev, BCR, &bcr);
-	}
 	info->writeable = !!(bcr & BCR_WPD);
+	dev_dbg(&pdev->dev, "device is writeable: %d\n", (int)info->writeable);
 
 	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
 	if (IS_ERR(ispi))
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
