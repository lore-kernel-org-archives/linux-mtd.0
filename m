Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1363C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:52:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60A02610D2
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:52:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60A02610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XhLgWKfdJBdxhECWE4grLapPrhplII3k/oIDi9YAtE8=; b=hls+Vm9JTOkL/y+gBM198pUEM
	CKgtbZR+2QEqQPtwcxVDq9fuXXkqKo52suYxjS1CzbgNyVhIB3B5WFijXqeKA8zbbwXUxXx/zAihQ
	+7EF/pJClD16X+nj1dx5Rgzy8siBDY6pJX2uHPTtneUvwBkFcDLxSf2nlOkhO1MlnuZc1NJ5LuNaV
	HaxSyWssvxkXraYvlu3c4PGfQbMVxW0xKHGnVrjxvPe8dcrBLMGEYmP8BAMNA4cdz/bXPDE+3PRCN
	sTUpzDa7lHLlMD9JYurM2CWjSOUmx5CIztvTu6Ht8Gj4x/XIdpCQa4DzZixD+0VQyaD+KeKGXTgqH
	I/Yz3BrsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGTQ-00CewC-Q6; Fri, 02 Apr 2021 09:52:17 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGT8-00CerY-Mf
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:01 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0AE311C0003;
 Fri,  2 Apr 2021 09:51:54 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 01/16] mtd: rawnand: Add a helper to clarify the interface
 configuration
Date: Fri,  2 Apr 2021 11:51:30 +0200
Message-Id: <20210402095145.254867-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105159_909522_39AB8087 
X-CRM114-Status: GOOD (  12.74  )
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

Name it nand_interface_is_sdr() which will make even more sense when
nand_interface_is_nvddr() will be introduced.

Use it when relevant.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c |  2 +-
 include/linux/mtd/rawnand.h                  | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index 8aab1017b460..53b3a11b9952 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1246,7 +1246,7 @@ static int atmel_smc_nand_prepare_smcconf(struct atmel_nand *nand,
 	nc = to_nand_controller(nand->base.controller);
 
 	/* DDR interface not supported. */
-	if (conf->type != NAND_SDR_IFACE)
+	if (!nand_interface_is_sdr(conf))
 		return -ENOTSUPP;
 
 	/*
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 93e8f72beba6..7f6a937a0bed 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -496,6 +496,15 @@ struct nand_interface_config {
 	} timings;
 };
 
+/**
+ * nand_interface_is_sdr - get the interface type
+ * @conf:	The data interface
+ */
+static bool nand_interface_is_sdr(const struct nand_interface_config *conf)
+{
+	return conf->type == NAND_SDR_IFACE;
+}
+
 /**
  * nand_get_sdr_timings - get SDR timing from data interface
  * @conf:	The data interface
@@ -503,7 +512,7 @@ struct nand_interface_config {
 static inline const struct nand_sdr_timings *
 nand_get_sdr_timings(const struct nand_interface_config *conf)
 {
-	if (conf->type != NAND_SDR_IFACE)
+	if (!nand_interface_is_sdr(conf))
 		return ERR_PTR(-EINVAL);
 
 	return &conf->timings.sdr;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
