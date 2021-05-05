Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A5DC433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:12:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B191461222
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 22:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B191461222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pka524Cly71JWXllJkcXhrK1iw9ecXccuksstuKQb0w=; b=dIlD/TaeZcwQdCjjBC8iF6zoS
	KZh+r/QtAhPsLO2tYdPC27H7NzCSEL3qz/uOAEa/YeZjwW/X7M+LLMwqZ9q2sO8yRm0Ww555PjlQz
	+Ozf04tMnl8O85nqKv+3z09EwcZ3Y1HvpuYtkoRzpxhVAzBfI3wtMVvyrfNbk8H0WBfFRVAbWRJuy
	b9C2P1C5YRDZWSrv8Tm1a5ktySTVNcYyCk5luQo0aL0O9wi6O0MO9mSmkRzevTPPzwZxMxt9K1dqg
	gq/wXoUI1G2x8eq7EC3bM2v0WARwcKG+qdSCIhotSyuA+r3PU3+91P2ema7ScBkDU4T8fyXfcO+R8
	7zfHTZdxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePjW-002SyW-EM; Wed, 05 May 2021 22:11:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDj-002Op5-9M
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=87jXk9qQixZPxNAovti6Dvkde4R/hzmwQHUoBAEKgq8=; b=LgWd3Y4z/+KvgXLYd33IswwM8X
 +rr4H/aYS/jU7GcEa1V0UmzbLl34Bj7nihxDFy7usWbq4yEcArX6wjzchErmacM48gAJU/6NpRy1d
 vsymTYmn3x/jUYSWrMFbyoX32A2mlKOgJpOuJJk/yoDkhAsCT8LRNqc+VtPH6+lFkwTK3/oYXSbMS
 x0pbsT8fcR3yJwi/nCl5z+4R4PCt46iv+KF3GhauSLVxbdTVFu0YrgxHWi5Fv3Nom0c52cMknnEPR
 LGCdugfjVYtC1Unq+9RGIGmf01795O+ZU/gX9q+t9DWO8e7h+yCeiZ6R8xYDLo023BY4HONJWgz0N
 RJRGcYCw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDg-005IhI-BC
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:14 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 117ED1BF209;
 Wed,  5 May 2021 21:38:09 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 18/22] mtd: rawnand: Choose the best timings, NV-DDR included
Date: Wed,  5 May 2021 23:37:46 +0200
Message-Id: <20210505213750.257417-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210505213750.257417-1-miquel.raynal@bootlin.com>
References: <20210505213750.257417-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143812_683365_5D5E2B92 
X-CRM114-Status: GOOD (  24.14  )
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

Now that the necessary peaces to support the NV-DDR interface type have
been contributed, let's add the relevant logic to make use of it. In
particular, the core does not choose the best SDR timings anymore but
calls a more generic helper instead.

This helper checks if NV-DDR is supported by trying to find the best
NV-DDR supported mode through a logic very close to what is being done
for SDR timings. If no NV-DDR mode in common between the NAND controller
and the NAND chip is found, the core will fallback to SDR.

Side note: theoretically, the data clock speed in NV-DDR mode 0 is
slower than in SDR mode 5. In the situation where we would get a working
NV-DDR mode 0, we could also try if SDR mode 5 is supported and
eventually fallback to it in order to get the fastest possible
throughput. However, in the field, it looks like most of the devices
supporting NV-DDR avoid implementing the fastest SDR modes (like 4 and 5
EDO modes, which are a bit more complicated to handle than the other SDR
modes). So, we will stick to the simplest logic: try NV-DDR otherwise
fallback to SDR. If someone else experiences strong differences because
of that we may still implement the logic defined above.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/internals.h |  3 ++
 drivers/mtd/nand/raw/nand_base.c | 76 +++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index c06bc2f1aaa2..7016e0f38398 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -95,6 +95,9 @@ onfi_find_closest_nvddr_mode(const struct nand_nvddr_timings *spec_timings);
 int nand_choose_best_sdr_timings(struct nand_chip *chip,
 				 struct nand_interface_config *iface,
 				 struct nand_sdr_timings *spec_timings);
+int nand_choose_best_nvddr_timings(struct nand_chip *chip,
+				   struct nand_interface_config *iface,
+				   struct nand_nvddr_timings *spec_timings);
 const struct nand_interface_config *nand_get_reset_interface_config(void);
 int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
 int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e20551cb3ce5..22974a53077f 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -961,6 +961,80 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
 	return ret;
 }
 
+/**
+ * nand_choose_best_nvddr_timings - Pick up the best NVDDR timings that both the
+ *                                  NAND controller and the NAND chip support
+ * @chip: the NAND chip
+ * @iface: the interface configuration (can eventually be updated)
+ * @spec_timings: specific timings, when not fitting the ONFI specification
+ *
+ * If specific timings are provided, use them. Otherwise, retrieve supported
+ * timing modes from ONFI information.
+ */
+int nand_choose_best_nvddr_timings(struct nand_chip *chip,
+				   struct nand_interface_config *iface,
+				   struct nand_nvddr_timings *spec_timings)
+{
+	const struct nand_controller_ops *ops = chip->controller->ops;
+	int best_mode = 0, mode, ret;
+
+	iface->type = NAND_NVDDR_IFACE;
+
+	if (spec_timings) {
+		iface->timings.nvddr = *spec_timings;
+		iface->timings.mode = onfi_find_closest_nvddr_mode(spec_timings);
+
+		/* Verify the controller supports the requested interface */
+		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
+					   iface);
+		if (!ret) {
+			chip->best_interface_config = iface;
+			return ret;
+		}
+
+		/* Fallback to slower modes */
+		best_mode = iface->timings.mode;
+	} else if (chip->parameters.onfi) {
+		best_mode = fls(chip->parameters.onfi->nvddr_timing_modes) - 1;
+	}
+
+	for (mode = best_mode; mode >= 0; mode--) {
+		onfi_fill_interface_config(chip, iface, NAND_NVDDR_IFACE, mode);
+
+		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
+					   iface);
+		if (!ret) {
+			chip->best_interface_config = iface;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * nand_choose_best_timings - Pick up the best NVDDR or SDR timings that both
+ *                            NAND controller and the NAND chip support
+ * @chip: the NAND chip
+ * @iface: the interface configuration (can eventually be updated)
+ *
+ * If specific timings are provided, use them. Otherwise, retrieve supported
+ * timing modes from ONFI information.
+ */
+static int nand_choose_best_timings(struct nand_chip *chip,
+				    struct nand_interface_config *iface)
+{
+	int ret;
+
+	/* Try the fastest timings: NV-DDR */
+	ret = nand_choose_best_nvddr_timings(chip, iface, NULL);
+	if (!ret)
+		return 0;
+
+	/* Fallback to SDR timings otherwise */
+	return nand_choose_best_sdr_timings(chip, iface, NULL);
+}
+
 /**
  * nand_choose_interface_config - find the best data interface and timings
  * @chip: The NAND chip
@@ -989,7 +1063,7 @@ static int nand_choose_interface_config(struct nand_chip *chip)
 	if (chip->ops.choose_interface_config)
 		ret = chip->ops.choose_interface_config(chip, iface);
 	else
-		ret = nand_choose_best_sdr_timings(chip, iface, NULL);
+		ret = nand_choose_best_timings(chip, iface);
 
 	if (ret)
 		kfree(iface);
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
