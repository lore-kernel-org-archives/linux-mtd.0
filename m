Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B851C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:45:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 137792076E
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="USj8URll";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="BRxWYRrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 137792076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QGMOyy1oji/Yk62r8m2+fkt3wAYsp00hCAEBwM22p8g=; b=USj8URllOYeVp3Yp2U3Du5jyeW
	OVG/GV8sSIdld45npGfVSrWTtstyygVcfNgnQB/O8rlsWqdLeTNwKOo2crW05QIjqrEKHT6+DAERg
	CZkZGzxlmxUEDKwUz+PZ4k2I+oCigr24viHKj/mS94IFoST9YO18bpjXxanjsSnNALIrcjqOM0qb9
	lPNI+jtSx6pyiikAndn98YKzsEuaCJj73Der4zioH4QEu3q6dtlDnFAikkoqLWw1xgQxdMfTD/LBL
	NltGw+JmpBKEWC41E+uwrh3+wVjY2nFzmE5cdkTEnWn87OUI2im9GGJTk1KM7i9MfMm2pmVbS2XLj
	N9cOlkeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2amJ-0006FY-5h; Mon, 03 Aug 2020 13:45:23 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2amG-0006F6-N6
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 13:45:21 +0000
Received: by mail-qk1-x743.google.com with SMTP id l64so28302497qkb.8
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5jZpyOsHwlMwVkwX/UG+yhCnHasbRZdF2QEv3wd8FYg=;
 b=BRxWYRrrGBIwd61roJhGedBKxiROX9FIdXtsSlHnnRy//E0ye8dDxT9fgkxfU3CbwO
 NED8qQKFG7oRyGcjviIr24/E0oXZ31UA8WCDvQhkyQ0jy4nVjn5UZHH4654gMhaFYeuj
 u2v5h0cKqCxdHwkbAckMgLOY+hcMV34hxzYNghB0LJx0wevTaJ7tRs5zi5RUU5zjMcpu
 AYhugN2Pk3PIfd9YEZJQmaUf1gGd1gQrkWmUle26CPFJPoY3Jgw3WeBH/EWD/OhdIulp
 frJwg2uy3YYLzGMsDHo1GRpBTxSvcjcMpMCL0ZPkeQTA5dpa4+APPDTuKYHPrL1XbYGe
 c2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5jZpyOsHwlMwVkwX/UG+yhCnHasbRZdF2QEv3wd8FYg=;
 b=cJDJZ5KG3fgLz8p6zL+yr1/8Cy2mKXNCyrluNhZa3SFzPq548mjA9Uc2igc4Dl3x8y
 UiYMIzBbSscznv8y+tjHEH1bZLmEttjE7l7I2uPJddSk5dBe/WMDQP2dBeC+JiK59oN1
 1dleqNZQ6Qc3IpI1lpAL9pANzgoPjoncHZ5+YAT0AJR0pKc0HSkVuVGl+hWNLOYmhf7O
 6MfEboGVVrS5sNECtfHf1RIhe18JkAxKdKBNxUciSmzq1cFyUup3EaGJxBF5uEOtI1aM
 9a9YnziGQJcgYXC7f/jhaRnaRrn8CIgxgvHQ3z4xHi1kilXf89K99IOWWa0+SDtSmTGc
 pJXA==
X-Gm-Message-State: AOAM531bx/z04kaf643p9Y0OUVA+cjvMCnrRIrEUbub10VEoxYNQH52d
 GBtC4bRL+J16m4gLiyfit2z5fDC6o+c=
X-Google-Smtp-Source: ABdhPJzeQaFTlpvYXYws/wBRMz1IvaAHL6jQqA1oSXICoac3JwjCsMaaUfpn4WOcucvP48rWnKtNug==
X-Received: by 2002:a37:9c7:: with SMTP id 190mr12769774qkj.303.1596462318338; 
 Mon, 03 Aug 2020 06:45:18 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id g4sm20078538qtp.89.2020.08.03.06.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 06:45:17 -0700 (PDT)
From: Daniel Gutson <daniel.gutson@eclypsium.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Daniel Gutson <daniel.gutson@eclypsium.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Bazhaniuk <alex@eclypsium.com>,
 Richard Hughes <hughsient@gmail.com>
Subject: [PATCH] Remove attempt by intel-spi-pci to turn the SPI flash chip
 writeable
Date: Mon,  3 Aug 2020 10:44:49 -0300
Message-Id: <20200803134449.72502-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_094521_067212_C22A8DA1 
X-CRM114-Status: GOOD (  14.06  )
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
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 81329f680bec..d721ba4e8b41 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -41,13 +41,7 @@ static int intel_spi_pci_probe(struct pci_dev *pdev,
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
 
 	ispi = intel_spi_probe(&pdev->dev, &pdev->resource[0], info);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
