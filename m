Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB92C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:31:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7BD651F7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7BD651F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZD6nknoFkShgrz2Himvsya/xhqEcBSS7UhGVjp/a6DA=; b=JUNlSoRw6eeYqamxbjLXpvQ1y
	fy3b+NrUw0iL/6m3CMXZVrl5+r6Ip9O+H//56G9b7XSkUTxXE91MlpWIOF162EqfeoqHx0ezenDrC
	nQ6KqijaS0maHe6a5Ek25RXy2P0G9B063uL1ywE5cJx8c5HsDmv9OSTjy/Wlx+MXOw0zqz9ArCndQ
	VgG6DsQmYlqROen+9yp+sMOs6LnHZgMcrl3FnJ9uJyNGVhIZ2VjF8BQwDUGaFwBTNNYe4TzqMdv0t
	YghwL+SvPKEpMN8EopVwvwtGM77Vnfg2+NmbgvkcZDtgjrrlypfyTTi95lWmPDvomRKCODvCgQfqd
	gsH7V/u7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9PQ-00FUoJ-Ao; Mon, 08 Mar 2021 06:30:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Oq-00FUfL-2j
 for linux-mtd@desiato.infradead.org; Mon, 08 Mar 2021 06:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fFhuRG8fyN09qjFqaq0Ebd5Trh6cuEQoES9A7/6HAL0=; b=p5w9gvZ8SvtMcIRz/kNYaYV0GX
 NvQ2Dhy1+LcUAqooJXapxE9iEChbrc+J1fyr7xr9adXk+NJHmOATD6dUEFTnPihhxbH34LxymEn46
 d4dRd7sUPafWQ7XsgGVwovS1BpY162ltPV2AdnIMsxyqxiiRDukNOHtOLfZrcZ3p6KHeaF5FnWf7p
 6QpRdC6YYEf/iqqp9x3+PFyq9r6nelfEV0CXJd7kmqZEcWG/OfjZCfFEtYawIWaJfUAhOKQOOdfWD
 8nSkN9rJ8gS8Ohigw/Dg3EgZjRBycgu8fd3ycg5c5/F+7hFSGFKjNFjDdfv8sUAPJgeJd7SA9On1X
 42eCnWnA==;
Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9Og-00F81V-K4
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:29:50 +0000
IronPort-SDR: WUWPpa/H/a43B0dDqoaIoLY2shqZM5pWZXk2gciR1t6blg6bGETIzbh3KXq3jTbvlHSCd7H0Xt
 vUzp/bnSR6Yw==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188084470"
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="188084470"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:08 -0800
IronPort-SDR: zZ9UK6moBNTswwaFmapDV6oShOfztmBsdZUioPHE48ZNTDiPOtctXnfByaKBCjFJhQ576xHQqV
 PstsX5/Inu+w==
X-IronPort-AV: E=Sophos;i="5.81,231,1610438400"; d="scan'208";a="409181912"
Received: from twinkler-lnx.jer.intel.com ([10.12.91.138])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2021 22:28:05 -0800
From: Tomas Winkler <tomas.winkler@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>,
 Vitaly Lubart <vitaly.lubart@intel.com>, linux-mtd@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, Tomas Winkler <tomas.winkler@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [RFC PATCH 02/10 v2] drm/i915/spi: intel_spi_region map
Date: Mon,  8 Mar 2021 08:27:40 +0200
Message-Id: <20210308062748.208017-3-tomas.winkler@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308062748.208017-1-tomas.winkler@intel.com>
References: <20210308062748.208017-1-tomas.winkler@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_062946_310831_F5941DCA 
X-CRM114-Status: GOOD (  11.06  )
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

Add the dGFX spi region map and convey it via mfd cell platform data
to the spi child device.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
---
V2: Rebase
 drivers/gpu/drm/i915/spi/intel_spi.c | 9 +++++++++
 drivers/gpu/drm/i915/spi/intel_spi.h | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/spi/intel_spi.c b/drivers/gpu/drm/i915/spi/intel_spi.c
index 932221dff1c1..8eb09366124e 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.c
+++ b/drivers/gpu/drm/i915/spi/intel_spi.c
@@ -14,11 +14,20 @@ static const struct resource spi_resources[] = {
 	DEFINE_RES_MEM_NAMED(GEN12_GUNIT_SPI_BASE, 0x80, "i915-spi-mmio"),
 };
 
+static const struct i915_spi_region regions[I915_SPI_REGIONS] = {
+	[0] = { .name = "DESCRIPTOR", },
+	[2] = { .name = "GSC", },
+	[11] = { .name = "OptionROM", },
+	[12] = { .name = "DAM", },
+};
+
 static const struct mfd_cell intel_spi_cell = {
 	.id = 2,
 	.name = "i915-spi",
 	.num_resources = ARRAY_SIZE(spi_resources),
 	.resources = spi_resources,
+	.platform_data = (void *)regions,
+	.pdata_size    = sizeof(regions),
 };
 
 void intel_spi_init(struct intel_spi *spi, struct drm_i915_private *dev_priv)
diff --git a/drivers/gpu/drm/i915/spi/intel_spi.h b/drivers/gpu/drm/i915/spi/intel_spi.h
index 237724fe9d50..37f6771ddbf6 100644
--- a/drivers/gpu/drm/i915/spi/intel_spi.h
+++ b/drivers/gpu/drm/i915/spi/intel_spi.h
@@ -8,6 +8,11 @@
 
 struct drm_i915_private;
 
+#define I915_SPI_REGIONS 13
+struct i915_spi_region {
+	const char *name;
+};
+
 struct intel_spi {
 	struct drm_i915_private *i915;
 };
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
