Return-Path: <SRS0=ukLJ=SM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8F7C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 07:39:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5307C217D9
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2019 07:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BmZVfswX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5307C217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mmO7AJDcJav0e4v8JXan6dP0x0GjKVkKXPch52+1luc=; b=BmZVfswXs/2qrI
	usk4lT+qv171olrhSA3Cb2UlI5FOG1tRawmvLXiA0pJIuPYXazT2KJxFJ2jVof5uIfjE8fDWyUTEZ
	+38xT+2LyYCvsiAh8nouZQ1Yw4dn0bSwu6N7UnR8afFP29EVhYomlugwkKwOHWkmtSFBvLngFKuUY
	VkErbnsah9mf5wiOGbrnwICGPBfq6KZXqEblnHD2jSqXeMN5dIgBl6WiSDhjdPY2D8QluImhsEdhw
	snC2i2Iq+IC7lAZMBEOkuowHlEZlvyYCTrJ+s2WG0To43479mydQJLjbiM40J4TH1/u+j1fnI8Kgc
	05MogOmGfjcQ6eU2reWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE7pV-0004QK-Tr; Wed, 10 Apr 2019 07:39:33 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hE7pS-0004PO-E7
 for linux-mtd@lists.infradead.org; Wed, 10 Apr 2019 07:39:31 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Apr 2019 00:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,332,1549958400"; d="scan'208";a="130101060"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 10 Apr 2019 00:39:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 90D78EC; Wed, 10 Apr 2019 10:39:23 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] spi-nor: intel-spi: Add support for Intel Comet Lake SPI
 serial flash
Date: Wed, 10 Apr 2019 10:39:23 +0300
Message-Id: <20190410073923.35693-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_003930_522973_BF9AED1C 
X-CRM114-Status: GOOD (  12.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Intel Comet Lake has the same SPI serial flash controller than Ice Lake.
Add Comet Lake PCI ID to the driver list of supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
index 872b40922608..bfbfc17ed6aa 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -63,6 +63,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id intel_spi_pci_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x02a4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x34a4), (unsigned long)&bxt_info },
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
