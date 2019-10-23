Return-Path: <SRS0=W5Gy=YQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A49DCA9EB6
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 14:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB2D2086D
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Oct 2019 14:53:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rmSV4x13"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB2D2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5QoMDCMOXU1N3cZSn98c4EdcDZ8oDk9QB5QOMp+Fdcg=; b=rmSV4x13K158Jd
	mgnyFsqznbrLPacWpntxwM6yWrSDcb3LNfeHxOmbsoEAlPNeQ1fqqMADT3zesXO5y3G1Mz4POPdfL
	XRwNZrzn8GTVLizkC52NNw8pPFsh51BcOaHjtJrmnCZB4ltbsBV/javaGS7WCbn27s8OchGB5JvvT
	Ojhs87pZuGsQYGXVDpQ2pg85t68Vppl0JzwA8Ibc7hTkdkUP0OJGUvRzGkCuQuILE3FHrzr05VFnp
	12q2CeTRX+HoeadnHXy0GyWtFedoy0M6/e0zk+4Fth7P5pFCJkLFNlW3ofgeL//zErV9CjhUGgeCx
	fQ/pJMQN/5ojLUcqglWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNI1E-00018L-Qm; Wed, 23 Oct 2019 14:53:48 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNI1C-0000rB-0u
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2019 14:53:47 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 07:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="191853388"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 23 Oct 2019 07:51:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id AE4A8125; Wed, 23 Oct 2019 17:51:40 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Comet Lake-H
 SPI serial flash
Date: Wed, 23 Oct 2019 17:51:40 +0300
Message-Id: <20191023145140.51427-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_075346_105630_13047E53 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Intel Comet Lake-H PCH has the same SPI serial flash controller as Comet
Lake-LP. Add Comet Lake-H PCI ID to the driver list of supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
index 3cda8e7a68f8..266e5efc1771 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -61,6 +61,7 @@ static void intel_spi_pci_remove(struct pci_dev *pdev)
 
 static const struct pci_device_id intel_spi_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x02a4), (unsigned long)&bxt_info },
+	{ PCI_VDEVICE(INTEL, 0x06a4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x18e0), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x19e0), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x34a4), (unsigned long)&bxt_info },
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
