Return-Path: <SRS0=RLHh=GQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C98AC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 10:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0023206C3
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 10:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0023206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lB4Mn27fxFeZTLqCLePzIfjg6Eghd3l27v1yvPYT19w=; b=jAjiFDQExwLQQTPHDyCD538I2b
	EAomtO6jS/QdQUrdhv0luduSzDzlP71fROaecBsgIbfWkQnOIshpBE2Lh3zGEFzVFwa9yweYVjSUU
	CK7Jupq1YeAHqs61wbOxOE7HDyXg/LiQfpOX41/BAJwGh946+/LD2AF+R6CQPWcrRD7DEuOgXjJMb
	sob6Jr4/s9b0aWttfAN9b9DkoHpHBgLeMu9TDBouaEgOaoFAaujR5pTTMUcZObdQqA8nM6Lhmfoi0
	PfZChDQKMYM3GrgimP7zX8IIO0XOLyTgx+SmT5XKBAv2LSiIR6uQCODDh5PTJ2zVU+DrSr7FNDvPO
	psGsCytg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdC1-0007IG-Hn; Wed, 13 Jan 2021 10:15:57 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdBy-0007HL-Cj
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2021 10:15:55 +0000
IronPort-SDR: vqYtKzTYpB04HaLrHIkDcfqSHHd92F87LB7VsrPBOXGBGFsSYhZMyhWtdZlW9fjkSRSgXIGaXX
 ALamygcr2sFw==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="177405873"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="177405873"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 02:15:48 -0800
IronPort-SDR: GGMkTzOzN4XZXjUP9ZlsOOzDcY+orn1GzKK8aTJNq20+jPejoIci4u47BhUjxuvelUaGwO/Pry
 lKXPw5isROgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="424511841"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 13 Jan 2021 02:15:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 0230119D; Wed, 13 Jan 2021 12:15:45 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-P
 SPI serial flash
Date: Wed, 13 Jan 2021 13:15:45 +0300
Message-Id: <20210113101545.71579-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_051554_595599_8282F1DE 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Intel Alder Lake-P has the same SPI serial flash controller as Alder
Lake-S. Add Alder Lake-P PCI ID to the driver list of supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 555fe55d14ae..825610a2e9dc 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -73,6 +73,7 @@ static const struct pci_device_id intel_spi_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x43a4), (unsigned long)&cnl_info },
 	{ PCI_VDEVICE(INTEL, 0x4b24), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x4da4), (unsigned long)&bxt_info },
+	{ PCI_VDEVICE(INTEL, 0x51a4), (unsigned long)&cnl_info },
 	{ PCI_VDEVICE(INTEL, 0x7aa4), (unsigned long)&cnl_info },
 	{ PCI_VDEVICE(INTEL, 0xa0a4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
