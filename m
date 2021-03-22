Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B58C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:21:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02E2561992
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:21:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02E2561992
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MPrG8kYnGGfmivqVXPiHfzkmIUjgpGc4iQt9L65Zflo=; b=bJsNxYvb6djZUTvdkcSVlQhHm
	y/TDHGFO8tgNcLFEGO8QocoQlWFojdHyWLcv2xh6zJE0j7FxAyvCeAyfB3tnHLtyEB6SJKFj9paqa
	9rb9dDqGfbBGi4LkHeui/psCh0w7fRkInymiEaBNArnKUie7SWrQ88sJ2c8g3O0mxnOCw2XvvsahH
	4auI1sJujqu+qUSh36jc74ZVxEXEa4yc/y8RA/DYZZZCJU/l71cqOrB78eloquU19TdvqOinCjmNE
	wvaoCmJ/cZLjemZ/mlKay0L+KEGnvanspMnmsJ2Qi+/PBv/B1v7l+ycQ2j/8lseLUrwftUsV58mim
	9uld3bTaQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPA8-00CEn3-Ty; Mon, 22 Mar 2021 18:20:24 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOP9r-00CEhb-RF
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 18:20:10 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0F90B2224E;
 Mon, 22 Mar 2021 19:20:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616437206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqn5S9TybePbO422xYcFMOeKpJEHtS42X4tYuvW7Ujc=;
 b=B5+erL/5mE9scPEO1K9bRLvN+5ygbHcjGUKy5LJreaw5u0Esi4tTLx1NTyZ862NdQrRtP4
 qk1gaBPXlQQ9pOYhENcEnVz0v9DEQzWg3+szRztAUBLUIL9+tlb3U5BWUQ5vAX3ibSjPaK
 vaiQy/UauJr8gWowiU8lkxTUT2HekBg=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 1/4] nvmem: core: allow specifying of_node
Date: Mon, 22 Mar 2021 19:19:46 +0100
Message-Id: <20210322181949.2805-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322181949.2805-1-michael@walle.cc>
References: <20210322181949.2805-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_182008_402325_61C5F84F 
X-CRM114-Status: GOOD (  15.79  )
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

Until now, the of_node of the parent device is used. Some devices
provide more than just the nvmem provider. To avoid name space clashes,
add a way to allow specifying the nvmem cells in subnodes. Consider the
following example:

    flash@0 {
        compatible = "jedec,spi-nor";

        partitions {
            compatible = "fixed-partitions";
            #address-cells = <1>;
            #size-cells = <1>;

            partition@0 {
                reg = <0x000000 0x010000>;
            };
        };

        otp {
            compatible = "mtd-user-otp";
            #address-cells = <1>;
            #size-cells = <1>;

            serial-number@0 {
                reg = <0x0 0x8>;
            };
        };
    };

There the nvmem provider might be the MTD partition or the OTP region of
the flash.

Add a new config->of_node parameter, which if set, will be used instead
of the parent's of_node.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/nvmem/core.c           | 4 +++-
 include/linux/nvmem-provider.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index bca671ff4e54..62d363a399d3 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -789,7 +789,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->reg_write = config->reg_write;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
-	if (!config->no_of_node)
+	if (config->of_node)
+		nvmem->dev.of_node = config->of_node;
+	else if (!config->no_of_node)
 		nvmem->dev.of_node = config->dev->of_node;
 
 	switch (config->id) {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index e162b757b6d5..471cb7b9e896 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -57,6 +57,7 @@ struct nvmem_keepout {
  * @type:	Type of the nvmem storage
  * @read_only:	Device is read-only.
  * @root_only:	Device is accessibly to root only.
+ * @of_node:	If given, this will be used instead of the parent's of_node.
  * @no_of_node:	Device should not use the parent's of_node even if it's !NULL.
  * @reg_read:	Callback to read data.
  * @reg_write:	Callback to write data.
@@ -86,6 +87,7 @@ struct nvmem_config {
 	enum nvmem_type		type;
 	bool			read_only;
 	bool			root_only;
+	struct device_node	*of_node;
 	bool			no_of_node;
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
