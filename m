Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7790BC433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:02:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE5A613D8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE5A613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wLm+I2urYH+e46CO0YjZ9/KJxo5ZZSQkFaJSpNvf50I=; b=BAiRSpigOB9Hz7lklpwzme81U
	FYu+5waOvtwyfmPIHADjzUdyiCUde4YKZMB7YLeX7STT0zJGxR2Gyye+ZCtVcHWD8oYJ5NP3lz2yE
	oqwPhXLkeShrPdaj9v2UIo8cK+PUML/BLSyKDkpOUU/5IzvCylZbSJar4yyG3YuO/p7c4YpRBnPKH
	83UjPniZXdZtZOgzrHIL16ZhXG3CNgOA8RiMdCEf7Do8+SVPAwPFfZiqBEpDzR0N4jSahnQ4jZ/fd
	+I4+EO6YdZIlZbL5o9hbGSA7uLX1uEFBHQDnegWs5EhJqPP82ISTv8VWM0UzaXYz50anamNUtxmgs
	2LBxkFzjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePak-002SCD-7R; Wed, 05 May 2021 22:02:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDf-002OoQ-VN
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=YjeVqkH5v+f7PsLchxQ97m44jFa3mhhrrNQiWkzbX3o=; b=YRIAV7qjU8BgEtSXXoDzFAOyOH
 oAaI0Nz4XXJheeQHfE+ICAD5j5dzLB68m+IORTcWjaQmJNrFS/yLNbWBBEsS6qKbeM6+QwkD2JkoZ
 Zs1nEv8XndUR+DF+dmGTkz1e0sYOtmlTndbSmaLpWcKi4Vo35olXdI87N15yC8wYhkHj7S9KcCH+4
 7ExI8/1rtVlJv35MV3oFTb2RzlahZkon/qVd9xYOhM5ii/GSzeU6Dh7XQza4ckDHQxpeVMyqA4I5I
 lwZVhn4GjDZpxdlPOfFCNnfMdfcgZqzpkggf4XFZRMpI3OIEs/hFQvwSVtN5zID3mcZgVnss4gZVk
 /fqmtmgA==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDd-005IgW-5Y
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:10 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E288F1BF20E;
 Wed,  5 May 2021 21:38:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 15/22] mtd: rawnand: Add a helper to find the closest ONFI
 NV-DDR mode
Date: Wed,  5 May 2021 23:37:43 +0200
Message-Id: <20210505213750.257417-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143809_506120_C02D81B0 
X-CRM114-Status: GOOD (  12.43  )
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

Introduce a similar helper to onfi_find_closest_sdr_mode(), but for
NV-DDR timings. It just takes a timing structure as parameter and
returns the closest mode by comparing all minimum timings. This is
useful for rigid controllers on which tuning the timings is not
possible.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h    |  2 ++
 drivers/mtd/nand/raw/nand_timings.c | 42 +++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 012876e14317..c06bc2f1aaa2 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -90,6 +90,8 @@ void onfi_fill_interface_config(struct nand_chip *chip,
 				unsigned int timing_mode);
 unsigned int
 onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
+unsigned int
+onfi_find_closest_nvddr_mode(const struct nand_nvddr_timings *spec_timings);
 int nand_choose_best_sdr_timings(struct nand_chip *chip,
 				 struct nand_interface_config *iface,
 				 struct nand_sdr_timings *spec_timings);
diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
index 8eaa132c3900..7b41afc372d2 100644
--- a/drivers/mtd/nand/raw/nand_timings.c
+++ b/drivers/mtd/nand/raw/nand_timings.c
@@ -601,6 +601,48 @@ onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
 }
 
 /**
+ * onfi_find_closest_nvddr_mode - Derive the closest ONFI NVDDR timing mode
+ *                                given a set of timings
+ * @spec_timings: the timings to challenge
+ */
+unsigned int
+onfi_find_closest_nvddr_mode(const struct nand_nvddr_timings *spec_timings)
+{
+	const struct nand_nvddr_timings *onfi_timings;
+	int mode;
+
+	for (mode = ARRAY_SIZE(onfi_nvddr_timings) - 1; mode > 0; mode--) {
+		onfi_timings = &onfi_nvddr_timings[mode].timings.nvddr;
+
+		if (spec_timings->tCCS_min <= onfi_timings->tCCS_min &&
+		    spec_timings->tAC_min <= onfi_timings->tAC_min &&
+		    spec_timings->tADL_min <= onfi_timings->tADL_min &&
+		    spec_timings->tCAD_min <= onfi_timings->tCAD_min &&
+		    spec_timings->tCAH_min <= onfi_timings->tCAH_min &&
+		    spec_timings->tCALH_min <= onfi_timings->tCALH_min &&
+		    spec_timings->tCALS_min <= onfi_timings->tCALS_min &&
+		    spec_timings->tCAS_min <= onfi_timings->tCAS_min &&
+		    spec_timings->tCEH_min <= onfi_timings->tCEH_min &&
+		    spec_timings->tCH_min <= onfi_timings->tCH_min &&
+		    spec_timings->tCK_min <= onfi_timings->tCK_min &&
+		    spec_timings->tCS_min <= onfi_timings->tCS_min &&
+		    spec_timings->tDH_min <= onfi_timings->tDH_min &&
+		    spec_timings->tDQSCK_min <= onfi_timings->tDQSCK_min &&
+		    spec_timings->tDQSD_min <= onfi_timings->tDQSD_min &&
+		    spec_timings->tDS_min <= onfi_timings->tDS_min &&
+		    spec_timings->tDSC_min <= onfi_timings->tDSC_min &&
+		    spec_timings->tRHW_min <= onfi_timings->tRHW_min &&
+		    spec_timings->tRR_min <= onfi_timings->tRR_min &&
+		    spec_timings->tWHR_min <= onfi_timings->tWHR_min &&
+		    spec_timings->tWRCK_min <= onfi_timings->tWRCK_min &&
+		    spec_timings->tWW_min <= onfi_timings->tWW_min)
+			return mode;
+	}
+
+	return 0;
+}
+
+/*
  * onfi_fill_sdr_interface_config - Initialize a SDR interface config from a
  *                                  given ONFI mode
  * @chip: The NAND chip
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
