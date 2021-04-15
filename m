Return-Path: <SRS0=g3N+=JM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5628FC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 10:18:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AC060C3E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Apr 2021 10:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20AC060C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwV7v2o8zSr4tWpcV/jxLR+0rGSpYp2of9eMLX51aR0=; b=A9OJRp+9JATwO1rA02p4Vkn/iS
	SkLD2SGpGJP7XhvZcbHFrggH3Jh1H6weUb4vDs39ICl4iB4LKPQKoXsZ1mwAotBOZmuTlDXhXB9fj
	YXLvWdriSrGp4/VoL3AyZt62DBZDSk/d2DpJOrMOxA4lwi7kmHRHnYHcogZXgtosc90lDaf8d5wSP
	Z53ssyZA9xEWMU0OpPtDQDGqtnscjoEiohkXJD0EabPVgNuTpUF8A6lf8Ad9Hye5kl5W31OBi19dx
	rj1GrY84J1QTb0FkPAOiu78VjLjzBZZaiuv4KCkcgpaWjX85Uh+TExnrtUZOUq5OF8tHpTSxU9iTk
	M24ZYuXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWz3v-00Fgfl-Qo; Thu, 15 Apr 2021 10:17:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyy8-00Ff4s-U2
 for linux-mtd@desiato.infradead.org; Thu, 15 Apr 2021 10:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=4wmvylyy1doPVRSNJvX1/2y4/RLac7yxS9MU0VzHeLc=; b=y6LG0/RdYc69cZFMQ6qG46xbo8
 eq0b7faPqswstsuIKiTj0o89BR+p7likOICCxzVmCK1lVCM/ZSQVjAOFI7V8ZYnYPcFZsibI6mQJr
 O7Ewz1Vdo2OTnW5/Z/lm1XunZ8v+u97FTD9tzSSQQGsuuhakkdZ8OQaG4myUTD+muTT+Ucj1YR0j/
 COm3f/3tk22tbG6/1k54MToYP8xb8iAE4TnEoWjFqcw5i8c2FJBetcBNcdZTh5PZHYBZAJywwn7aD
 4eM8y5+mGfx/+OXo6jaiIkO+GkDGse9ueWoRYl5NYrtinVyfX1k+sd8UmCXnBENawRPLRsczWp4Pe
 BmpWFydw==;
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyy5-008SfM-E6
 for linux-mtd@lists.infradead.org; Thu, 15 Apr 2021 10:11:26 +0000
IronPort-SDR: S/33vUyrYfxdiKMp4acNuQ341UVjGWa4+/4SBnfXZr74w9y/B0mjvp6OxLBD9ywctKOXw9Uv20
 NE9jA13ZCRIg==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194389048"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="194389048"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 03:11:23 -0700
IronPort-SDR: TvRUioKVI51O5dvrb/Sul2XCkA4Q2/ba3mA3XUsxiW4R6MsdIOr2MA7F45Ecj5Ys9A0N1TQlf+
 ouUC8L2dFUSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="399524995"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 15 Apr 2021 03:11:21 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 7162E12A; Thu, 15 Apr 2021 13:11:38 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Alder Lake-M
 SPI serial flash
Date: Thu, 15 Apr 2021 13:11:38 +0300
Message-Id: <20210415101138.2174-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_031125_499955_4CD6E450 
X-CRM114-Status: GOOD (  10.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
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

Intel Alder Lake-M has the same SPI serial flash controller as Alder
Lake-S. Add Alder Lake-M PCI ID to the driver list of supported devices.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
index 825610a2e9dc..1bc53b8bb88a 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
@@ -74,6 +74,7 @@ static const struct pci_device_id intel_spi_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x4b24), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x4da4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0x51a4), (unsigned long)&cnl_info },
+	{ PCI_VDEVICE(INTEL, 0x54a4), (unsigned long)&cnl_info },
 	{ PCI_VDEVICE(INTEL, 0x7aa4), (unsigned long)&cnl_info },
 	{ PCI_VDEVICE(INTEL, 0xa0a4), (unsigned long)&bxt_info },
 	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
