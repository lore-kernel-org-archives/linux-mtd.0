Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D504BC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:55:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7178A610D1
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7178A610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MCUPtNGhsEps3UJamT8hyoF9djaVRuFUcR8+WY9kmDE=; b=AcGq53Hm35F/xAMXqwwEeaFFe
	etkhNOZuxCX8OqfgPRRm7JQ0X8Iy5s65d28nl5c0DCXsoUJLLfzJSlXiwKgZ/omhm5ut79vLNZGYA
	gUPmXZY29pnh/rgeLtyNJ7NW/vK6iiorD+Mxc4EU64uCpXABFtiqFn1vrj3enXRma5CFdqz8gP/ot
	I3AzF3njcaXOscPoi2/vnr38iBcgkImHSjq7CxdZAeqW1Z6dUvrkeCK5c8HdSdtpdkIiN1hiVijJ+
	EZYPrm8/AIeMnlMmneiNM61ZdZGknWueDMPAy/8U6rp3BnplJfTUqRd7+BnUOOfIQ8VTMwTQVK09u
	V1nziE2ZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGVo-00CfZc-OL; Fri, 02 Apr 2021 09:54:44 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGTR-00CewS-IJ
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:52:19 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BF4591C0003;
 Fri,  2 Apr 2021 09:52:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 07/16] mtd: rawnand: Clarify the NV-DDR entries in the
 ONFI structure
Date: Fri,  2 Apr 2021 11:51:36 +0200
Message-Id: <20210402095145.254867-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402095145.254867-1-miquel.raynal@bootlin.com>
References: <20210402095145.254867-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105217_869156_F22DDA5C 
X-CRM114-Status: GOOD (  10.44  )
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
