Return-Path: <SRS0=xDMw=JV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7AAC433B4
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:09:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EEC16146B
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EEC16146B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k75G/Lr9R+HydtsyaC0JtO0HggI3BlLkjk1Q4fahLfo=; b=kLoxhQPqk5GlMISarVi3pMVxF
	6Q5sv3PokuYLlnDTMsetjQUPwHHi9ahnixyOknwh4URBVW9fX97YtTvHdE0e2HGGszX5yNnE6zOFy
	DleLVEhFDMeloV5DulHmBvtBEbRUOFE4iCoEY6ydUrWZvI/XtPivAb2dxRoPniI/ecP9NLt0J8PaR
	LmV0xsTPkAx8hxefU7OTEyWsyA9YgCRJ4t0RgQIAPlY5oMuyGM9cDG5g9ISTXFgiMnI3MkF5uXwBS
	nbyi8tiU+Jxf1IGumL0YcgUSGxTkwOZKeBMJ8C2k5I+nMS0sHzGKRhiEhuLUnlq+FF3aLde4V8Qfs
	f/F0QUzoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laG7Z-003h2A-FD; Sat, 24 Apr 2021 11:06:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7E-003gzs-Qi
 for linux-mtd@desiato.infradead.org; Sat, 24 Apr 2021 11:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=mt+USGcgMuYRSvhgvaBBu5wVT3FzFNAP4aN4m/X9RA0=; b=r7xfUGEwBWE7OUes+dHJ6uqxcO
 65P5tpFCduhZNGk/hkXvFj19OZb0jj4VU+k3dXwYcu3fYftzu1AFCHTTb2+NU+fluOyUswj3Rxmq8
 oSxotp9RXd/1nrlCLgeGyMGD4bEoBPHV+RgBPrAZFsw3TATPOc/qag15sP0m4Hn4Ekb+l+BEhYXUW
 vy3REMXuKWsS5YPznZI0bebN15YdDsFXM736byaKaXBWuXyPUjxd+1HjlNqmU5rU8BbRL0cyrmS1V
 oEhMT11f2EMY7sxdgap2oGuDbkB0jSPl+4etEyr7ylq9HdOZbybEak67QsOY9oL7hLkZke6aCW9oV
 inhIfcLA==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7C-00Eyjb-75
 for linux-mtd@lists.infradead.org; Sat, 24 Apr 2021 11:06:23 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5C15222255;
 Sat, 24 Apr 2021 13:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619262380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mt+USGcgMuYRSvhgvaBBu5wVT3FzFNAP4aN4m/X9RA0=;
 b=dP34j55+3DThW1LIQWyGoET38bQeZRoYrlFVCAiJzMMsTT/lyjD02Nd9tqsqk0kFBVm3Fi
 L01xN9kozNL0RXnDQmIQj7uGsvzQVOh9JK4TjWrN6e4aaKQZz93oofKqq55HElt+RloFs6
 Sx38VwCWHqnebf3RWhj/1bwzXb/qKfw=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH v2 3/5] dt-bindings: mtd: add OTP bindings
Date: Sat, 24 Apr 2021 13:06:06 +0200
Message-Id: <20210424110608.15748-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210424110608.15748-1-michael@walle.cc>
References: <20210424110608.15748-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_040622_430442_736E01F9 
X-CRM114-Status: GOOD (  11.31  )
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

Flash devices can have one-time-programmable regions. Add a nvmem
binding so they can be used as a nvmem provider.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since v1:
 - drop "mtd-" prefix for the compatible strings

Changes since RFC:
 - added missing "$"
 - dropped first example
 - use real device compatibles

   Please note, that this will lead to an error without patch 4/5, which
   introduces that property for the jedec,spi-nor. Should I keep it
   seperate or should I squash that patch into this one?

 .../devicetree/bindings/mtd/mtd.yaml          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 086b0ecd1604..376b679cfc70 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,6 +21,25 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+patternProperties:
+  "^otp(-[0-9]+)?$":
+    type: object
+    $ref: ../nvmem/nvmem.yaml#
+
+    description: |
+      An OTP memory region. Some flashes provide a one-time-programmable
+      memory whose content can either be programmed by a user or is already
+      pre-programmed by the factory. Some flashes might provide both.
+
+    properties:
+      compatible:
+        enum:
+          - user-otp
+          - factory-otp
+
+    required:
+      - compatible
+
 additionalProperties: true
 
 examples:
@@ -36,4 +55,35 @@ examples:
         };
     };
 
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            reg = <0>;
+            compatible = "jedec,spi-nor";
+
+            otp-1 {
+                compatible = "factory-otp";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                electronic-serial-number@0 {
+                    reg = <0 8>;
+                };
+            };
+
+            otp-2 {
+                compatible = "user-otp";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                mac-address@0 {
+                    reg = <0 6>;
+                };
+            };
+        };
+    };
+
 ...
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
