Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EB3C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:55:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C648461103
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C648461103
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PPtWb4WivxkfbNAotcCQkS66OuB2A/02eaTPl4kXSJ4=; b=PVISUqnzmtolhhfeSUuk+NP6E
	wz9nxE/gyGfY7cPjUKbjJ7z7mWZtLyvIsgm4b5YiJ9NRbiegI4z2at26VlMJYnG3/aGz5svtBjc9q
	B13UuMyYdob85jX2KNJLa4EKkyJJVDSbdWOMEY/r0KJZtcK+zhUOooxADdMAx3Mji/2IOPs0mQjeM
	2H+G/PXPXeaILfWrvkkbm2iGSMpqTigKWhJwkGqw/DAk2Ej9MZlleNoA4GwJPSJo+quTKnCnJdNqy
	HMtDfnVTH3AvNaxG1mc7jSkjoAaAEWavB3HaJ1bqqxazjRESlYyJ8rRo9tnmHrzOZvFRKOn9utzIP
	jbNFXv05Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXN3O-001zZ2-EB; Fri, 16 Apr 2021 11:54:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyo-001yfO-8A
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 11:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xWTr4qHeviZFMb/wEtFKQQRLgF2/dLjHlxCN00SpzuA=; b=pK4ju45ndmZOMUzVK41IRC9AZ4
 M8frRMRMO/Aw8ENn6so14YY7l3WE5ncgJh+JECVz5LlGvVKsQZG5CEQ3r737KQgHX8cUP238phIGY
 TN97MiHMLnNyQLRTxM1xXyqh5xkIEcBROFHwytSn50rbnTM4wcsyC0An9AuArVZOpdGuM4LzZcEMx
 /Aj9pLWR9tW9A4NPa+D2G4IENrlWzwdfOmQB99fUH3yhHzneUXuXzBA9zrZffzOhts1kp9g7201uZ
 uLNocjopMEG4w0FS/iW3TRj8zXNJZZgmVBosojzhJeM1H5uQGAp1yUSGzzUkAGTOWFApBKyQ1/yjL
 HPj/E1Nw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyg-009KfU-Gl
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 11:49:45 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4B79322253;
 Fri, 16 Apr 2021 13:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618573774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWTr4qHeviZFMb/wEtFKQQRLgF2/dLjHlxCN00SpzuA=;
 b=POyag6gRhleSn0C/8EJeoXUrAgRXCWBa+dMa1SyRTRnObQ2YOCvSk5XopKhfKqzWYZFUAY
 IdlZTqAQYTbz0dc5FWGZ3TewTo+k8V1JL4WKfYEBxLWW74vYuP6r6OFIW5/CkQsaGac5gg
 3LZBF6n5RpPUg/9zleH+F54OIRLStSo=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 1/5] nvmem: core: allow specifying of_node
Date: Fri, 16 Apr 2021 13:49:24 +0200
Message-Id: <20210416114928.27758-2-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416114928.27758-1-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_044938_811032_ED6B169D 
X-CRM114-Status: GOOD (  14.06  )
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
Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since RFC:
 - none

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
