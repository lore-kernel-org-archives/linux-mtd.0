Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58887C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:42:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0416613E3
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0416613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MCUPtNGhsEps3UJamT8hyoF9djaVRuFUcR8+WY9kmDE=; b=UA0zIn+BYzM2aG3HbeCbq7pdt
	9NkQm638NeNtlhTHgNM5AbbqLkBjm/ZOQR0rxzc7pmkN7iJUyjg/ujFFv1JfPf4IyvduSxbOJk1TV
	FP45AtYZ02HFCLhEdowxtan1zvk85QQ94gDw5mQ/it17KAXJy6to1gZuEglyovvobB4E/QL2XqJ2e
	cLU+c8LM2tEd9+2pTX7Bo2l/+8VZIaOZj/aTs2UosFvsCKqsqLJhTm0G39zp5LZ5/eLZ4VSN7VT17
	m8N9ByspJuG8v2H3oi3SfdIsqgrWLvZKHRpnceNLr7hxbVDrFVwUGMEbNfWkmvHR0O5voG7pJ11Ym
	zQ4zCmPwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePH0-002PYQ-AB; Wed, 05 May 2021 21:41:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDZ-002OmC-6A
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=IpKchSNTT4yGMmyYxCqIBu5fE9LlEOT2NbifEtZ8/JU=; b=HoVLSuhY2I4qs7tloIgDdJXV3Q
 k4GimUvbtjY+qk6zsigGn7wxDIJWbFh0KkO1hmQAQ4O58BLucAEKCiKOdQxhF8wnMqW+k2uQhKXCa
 kSxiGzytip78+6W6LsEtGR9/UcgIrVh3SR0NEtnmbpAWkMYyeC3SiFUXKSWK3a/S0gi7VSD8WIrRj
 Y347kCK7Wj5Onj4CIvPiGnWzNQi7uJcIU19iydIWgxIDQAbnXLstM9HEK4u4EK+GwTV2D0McBAZTA
 JUOiLs6WPoRtiHqPUNw0I90WEeD+DOhBH9xaAWI4VtYEiFrLCkgrodVsnkVd6WqKuj4YcnRgi6wLJ
 ER/GUaIg==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDV-005Icy-1I
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:04 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id D5E8C1BF20D;
 Wed,  5 May 2021 21:37:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 07/22] mtd: rawnand: Clarify the NV-DDR entries in the ONFI
 structure
Date: Wed,  5 May 2021 23:37:35 +0200
Message-Id: <20210505213750.257417-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143801_233022_4B1D0E64 
X-CRM114-Status: GOOD (  10.66  )
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

Both src_sync_timing_mode and src_ssync_features entries of the ONFI
parameter page have been updated and now are named nvddr_timing_modes,
nvddr2_timing_modes and nvddr_nvddr2_features, which is much more
understandable for someone which do not know the history of the ONFI
specification. Update the relevant structure with regard to these
changes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/onfi.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/onfi.h b/include/linux/mtd/onfi.h
index 2ade5632dc5b..319e1736851d 100644
--- a/include/linux/mtd/onfi.h
+++ b/include/linux/mtd/onfi.h
@@ -99,8 +99,9 @@ struct nand_onfi_params {
 	__le16 t_bers;
 	__le16 t_r;
 	__le16 t_ccs;
-	__le16 src_sync_timing_mode;
-	u8 src_ssync_features;
+	u8 nvddr_timing_modes;
+	u8 nvddr2_timing_modes;
+	u8 nvddr_nvddr2_features;
 	__le16 clk_pin_capacitance_typ;
 	__le16 io_pin_capacitance_typ;
 	__le16 input_pin_capacitance_typ;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
