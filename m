Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0E9C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:57:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F046112F
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F046112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j1MjFCuxsFEguhJqPULkiWL2cWibNsvBog1U5P2juo0=; b=KPPLJekGRbfXu7Rs4dbxAfcK1
	t/6Ubd27CjcasDZZkcTkQIzKBOMELh5q8JiB1jrtFxYBAooOS9HWFMOGcwdVEDwzOMgaupDo1Es2A
	+3ioMteeubkeDL/15TyQ/uYIpVLEK1wryMLD4EzIc5YLejQXn6QGaioiofx/iKV+H3gg5GZbYy4A2
	B2PbUqPJxN6KEAnuIgdnTjvHUKGf6pwysonJFot4lT0s6LteXplEzL8XOGZTBCUj/55LI+Et6PnO5
	0f4o+Yv6yWeRkHahcRGPGMhZTLOgnNXNbAcTjjyHaDAhkrFqHYhpUEtFfodTh+Vzbf6R9eAeWL2go
	22sDJLykw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGXl-00Cft4-O0; Fri, 02 Apr 2021 09:56:45 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTX-00Cexj-G5
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:26 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CA50B1C000B;
 Fri,  2 Apr 2021 09:52:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 09/16] mtd: rawnand: Retrieve NV-DDR timing modes from the
 ONFI parameter page
Date: Fri,  2 Apr 2021 11:51:38 +0200
Message-Id: <20210402095145.254867-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105224_751986_82AE1EAD 
X-CRM114-Status: GOOD (  10.15  )
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

When parsing the ONFI parameter page, save the available NV-DDR timing
modes in the core's dynamic ONFI structure. Once available to the rest
of the core out of the ONFI driver, these values will then be used to
derive the best timing mode.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_onfi.c | 2 ++
 include/linux/mtd/onfi.h         | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 02303455c34f..f7a4a0573fe7 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -316,6 +316,8 @@ int nand_onfi_detect(struct nand_chip *chip)
 	onfi->tR = le16_to_cpu(p->t_r);
 	onfi->tCCS = le16_to_cpu(p->t_ccs);
 	onfi->sdr_timing_modes = le16_to_cpu(p->sdr_timing_modes);
+	if (p->features & ONFI_FEATURE_NV_DDR)
+		onfi->nvddr_timing_modes = p->nvddr_timing_modes;
 	onfi->vendor_revision = le16_to_cpu(p->vendor_revision);
 	memcpy(onfi->vendor, p->vendor, sizeof(p->vendor));
 	chip->parameters.onfi = onfi;
diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index 319e1736851d..14e66a49557e 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -25,6 +25,7 @@
 
 /* ONFI features */
 #define ONFI_FEATURE_16_BIT_BUS		BIT(0)
+#define ONFI_FEATURE_NV_DDR		BIT(5)
 #define ONFI_FEATURE_EXT_PARAM_PAGE	BIT(7)
 
 /* ONFI timing mode, used in both asynchronous and synchronous mode */
@@ -162,6 +163,7 @@ struct onfi_ext_param_page {
  * @tR: Page read time
  * @tCCS: Change column setup time
  * @sdr_timing_modes: Supported asynchronous/SDR timing modes
+ * @nvddr_timing_modes: Supported source synchronous/NV-DDR timing modes
  * @vendor_revision: Vendor specific revision number
  * @vendor: Vendor specific data
  */
@@ -172,6 +174,7 @@ struct onfi_params {
 	u16 tR;
 	u16 tCCS;
 	u16 sdr_timing_modes;
+	u16 nvddr_timing_modes;
 	u16 vendor_revision;
 	u8 vendor[88];
 };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
