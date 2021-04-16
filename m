Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1791DC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:54:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8881561184
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8881561184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Beo+mqxx1viuJzC+sa16MN5r6xcmXdUa2i1viGok4Wg=; b=W4zpQrAsJyYyslAQs1erqyjBo
	orR4O2UNtm4IRfo3knKWKDYBA9F4OTD4rA9ETnb5SW4XE345mecyuiTm8aoJQ5j9OVW35r8KLocec
	B2wVRKVihIUY7Vre6pvjtgL6EtgmL4sXrptId/XB9O82OopZruEM72kFgj5kswTH6zy5Xz3ezuSNh
	i7He/bBtiWqIELLSAaZI7EiM+nU3H6MNya8G+L6Bkw0YDNA0NqqAV0ArnlUE35ZTMtZ93BGfurCC1
	UYSPsjYrTmfKZoHnhiXlCIh9oD5fM8mLxjvVGCAFWqARvvI9WnbuoxxZX1+gHoH5v0eSFbFBBwpAN
	vrq+e5KFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXN2g-001zRt-My; Fri, 16 Apr 2021 11:53:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyo-001yfP-9K
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 11:49:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rwNQQwuvkXgYqZ0wPSlRqs63aHrarWZIIoxesnKvIpE=; b=c6mLtNEMcHSf/BZyqp0g3Th7A2
 v9Fq5r/qPm3Td2My8cSnt3b9P9jjL59J4un8EyGExCd7hfr6kuzulIa0FJv4s4K/d5fcmyxAWBObB
 7dhKG/+AW2jkkRE1yAdsXVJgdvX1jbpZnNnxtoldS6zHE2s7KKGTK68WnykR/cU2b4mLzEkpupt2s
 p2CGrFmDcvpS/LcmaIXRmvcBXfmhv6JaodzmW24wETHfhnnI+mLiaXzgOxc/2AZbgHSHv+c2jXR5G
 cQeo6gqt13DPFQBhopC+p6Jy+Tfp0CzJKG5k+F8pqkWlhSehLBQ71utoCySOnbKe2KUzSNIRx1Fhf
 Z180/zEg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyg-009Kfa-Gm
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 11:49:45 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id C2BDF22258;
 Fri, 16 Apr 2021 13:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618573777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rwNQQwuvkXgYqZ0wPSlRqs63aHrarWZIIoxesnKvIpE=;
 b=bPmcm8zPeorjx7ZwkG7zbtjhQxJFmJ5u8UGbTWRnLpwXiuS2kKJYcuTD5CRv0/DoVe3/cH
 sUDcD1/ClOnAfQyKKPqNVShTkgrye0+3ZjOCZZk2xXz2S/Ieqg0B5GGyaYsTuuBwZ2wY0a
 sGaG0VlrcIxXaIGJ2lv7Cv62P4tol+s=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 3/5] dt-bindings: mtd: add OTP bindings
Date: Fri, 16 Apr 2021 13:49:26 +0200
Message-Id: <20210416114928.27758-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416114928.27758-1-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_044938_811424_150EB094 
X-CRM114-Status: GOOD (  11.51  )
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
index 086b0ecd1604..dd43fb8b4fd1 100644
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
+          - mtd-user-otp
+          - mtd-factory-otp
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
+                compatible = "mtd-factory-otp";
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                electronic-serial-number@0 {
+                    reg = <0 8>;
+                };
+            };
+
+            otp-2 {
+                compatible = "mtd-user-otp";
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
