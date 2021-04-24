Return-Path: <SRS0=xDMw=JV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E95C433B4
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:11:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD8661476
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD8661476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8mJ0pzwJWwEkGtUeCPIMKAuzy/0/Z/MLo3eR3ATxrZo=; b=D1iSrY2BV5K04POQ/iNIKle4T
	UWiDdf/TsrPc+Eks3l8ZB4dhwvYU6JqTGjJ5RSqItuoUmOky96z4gnrufwTVAYCZFMlJHfXQoxH66
	3RjzspSwsLdQIJCfyD+i7K4C3qiYyimCEuaM46PGlkle9vAHZQNZtKqP44l7W8tzBneklw+4EkA32
	oFBIRb+xJVKS1pjw5evcbtRpACknS285VvFwOiTXX4Q7p7JkGXyFypJebD3QC15NvcCPng2dTTMXT
	9q71jOib7BknAVQz7YGomCF/Rjepp4o8bgyQfS8sJmMywFob83GbaXq0xpk46VnlKj18Lyif4hzQy
	CfN05q+ZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laGAe-003hOi-NV; Sat, 24 Apr 2021 11:09:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7F-003gzu-JQ
 for linux-mtd@desiato.infradead.org; Sat, 24 Apr 2021 11:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=n2HvHI2OzHepSWAD3Mvat5NnUhX2ATOzMyqhqXyfREQ=; b=SCkeHrwqgRIRqdz3F/90wwzGOT
 2ivsCgVsFNBOAaGTMWYl5I1tUeotTy3fvFb7AKM09B7YqeW8qDYgnhJxzX7qyLff4cmIjMFflQkjF
 ZZ0ilHzvt2TZTdhrjC3CGM/XhMn7S6btovNe5TVRBwmLk5F2nicu14+GUZA0oPa40tDrKJ/VlGje3
 zb2ccqYbras7djlDlaRsOEfyqEwPTO8TQMPijElySqmtcbGCfuodBEkW2ZqiLzTLUYSo5Dp23eJ2A
 iIBedvYYc4Z0dKNTo8vrtKxqEZgj2C/5sCb1qhENdi+YSkQqZWSMn4Ev8CkPjh/RIYdIV8oYxQ1a5
 uO/MGyWw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7C-00Eyjc-PN
 for linux-mtd@lists.infradead.org; Sat, 24 Apr 2021 11:06:24 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0A5F422258;
 Sat, 24 Apr 2021 13:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619262381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2HvHI2OzHepSWAD3Mvat5NnUhX2ATOzMyqhqXyfREQ=;
 b=nlBxAQ0FhgmYYH+3EsT77lH3EOCvdjNbfbbaKjCfKri4HAkJGyEmNUjg7HXhF6i5JH+/0h
 m/OiBe2Ft8mXzwCSp0dY0e4vsAvmYOKxnuLD6YHsxSJwJ1tjvDllJmQ6U5I5aL34gYhgpu
 VOW0kbrwDrEp07x7pOutFxAuFRt/WyY=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2 4/5] dt-bindings: mtd: spi-nor: add otp property
Date: Sat, 24 Apr 2021 13:06:07 +0200
Message-Id: <20210424110608.15748-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210424110608.15748-1-michael@walle.cc>
References: <20210424110608.15748-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_040622_998338_A2456549 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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

SPI-NOR flashes may have OTP regions and have a nvmem binding. This
binding is described in mtd.yaml.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since v1:
 - none

Changes since RFC:
 - new patch

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 5e7e5349f9a1..ed590d7c6e37 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -9,6 +9,9 @@ title: SPI NOR flash ST M25Pxx (and similar) serial flash chips
 maintainers:
   - Rob Herring <robh@kernel.org>
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 properties:
   compatible:
     oneOf:
@@ -82,6 +85,9 @@ patternProperties:
   '^partition@':
     type: object
 
+  "^otp(-[0-9]+)?$":
+    type: object
+
 additionalProperties: false
 
 examples:
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
