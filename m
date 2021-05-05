Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29356C43461
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:39:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A6C613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A6C613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k2xPJYcRqFtfXNrEOafaPyR5IPa2xBvwAo5WJ5qyifo=; b=hI/G7p6En/PtLxfmOSS5GD3PM
	jb7qN4HTKQJrtNwq0uge5BGIqaXoQ3M3NS6YlN8EVcF+VzP2QRYymeP3OfpU0F6qzPAklJfE6ashx
	Xp0eiswwCrB05rc69tqKATCOZpJzU/BB6gzIr8VMLjZ9N2Srdv3opKUm4iQI+EKOr25Yn54tMMdqd
	mpo0wO2IV2RWZlLrmyzDxAQOJQ7epkJaX9T05rGuEf5JaEzkoS5/6adJuBiJMtDZIiBjIl6BJlSaX
	vnyXTWz72qjRXdKOx33AcHss0wdMmb12Q1GO/PWSCg83JjMi86L38jDhvrSJKnxQgtqGLlVF3NSOM
	gxwNQ3qTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePE3-002OsL-4p; Wed, 05 May 2021 21:38:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDY-002Olw-0j
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jL1+Y7PUD4pLS8I9rZQ1xJOWErS81qvSI34oBP3+QRo=; b=LjZr5XnpS3/cDK6CUHcrapVpyr
 kea3G+BIKimkCTSjqswJnnjfYCpbYUfRFFDMew1u9740qJmTLGxXylfMJ5M7G6qZJPkj5RO1SxlwL
 ZOANX+Jmtk5qrZ6ED7TayBZSX5ujG2f6eMY16rWobav+l6ckvBWY99SRDsvXqLgR3ZbxAcZhwuc5z
 Og7ZO7bWUuhhfQTc0AM5uKzbtaM88l5/cJvMmxmNK0SCWB9nMifORtKbkYMC/ozWE583L/YvOyjI5
 /q0m8fb2LEHZxI4zQKkr/OE3M3fvk0Bgpb4F6bVvshlZCsWtSShBYiAwIyHUnLNiUrr4SdBJB+yuW
 etmf89dA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDT-005Icp-NS
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:02 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B7DD61BF203;
 Wed,  5 May 2021 21:37:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 01/22] mtd: rawnand: Add a helper to clarify the interface
 configuration
Date: Wed,  5 May 2021 23:37:29 +0200
Message-Id: <20210505213750.257417-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143759_931685_EEE0B37F 
X-CRM114-Status: GOOD (  13.17  )
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
index 29df2f43dcb5..39b31f8e03b7 100644
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
