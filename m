Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7E8C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:46:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC36F60C3D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 05:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC36F60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dQK2pj6l4ieEqkLMpGMzJpCtZeUSIVqf4588JdPuCkg=; b=GTn6pNBg7Co6LUfbVPtMW5HkL
	ICCuMlGOC/3y9T/80E3HLz3y0aIfUULXKoRgw19iwFnG0ieHy1FYGjdEROiXyX2fVPJcFAO1PRmxK
	Hf1CGzYC/s8/nU22BKLkPzwNuPby4RKwa2Bz5xf/82hzDaJe1XQs13xW0vH27K51Sc8E36Z4uIkdJ
	6zpuApzwTcKdyeIym/z6DiUClyWO6pudWKYtjtZ+OltX9WFRvG/j+nDg48J6PgS6IblvUSiqhTQjW
	Joe4wyma/e8vGwo9By4BLWcvjEU5jM774tH8/zILDCfOA0xMquKHdmrIzI42Nnh082R3kIug5XQxP
	nH8bquACw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8ht-00FKW2-UV; Mon, 08 Mar 2021 05:45:30 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8hf-00FKQG-AH
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 05:45:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 16so4928749pfn.5
 for <linux-mtd@lists.infradead.org>; Sun, 07 Mar 2021 21:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0vZpb9y8MutMaka6YLswZQUFtbMSrJ0Y46Hxti/8tHM=;
 b=BJ/nj+3l8mDnLcnBxLlfarOq64qe5GCTAGyv452RcjzDzQpB4tYWS6+XYTFp1wDjLg
 iekeoQ8giTKMDsFCXfSNVD0QgoGyu/K42d7mJXVvz2aZnWHm/gNU14zW/Y3R7m5YsN3h
 fd7WoXMP/NspTSfDlYrON5Hdlbrys7rnjkhYIunH2u2usjqGZ3LVdW0ymxcqrvobyp93
 UvbWKUzzalTAkVeIqkca95kXND+bReJeQoPRoLuOgzOD2pqaupg7xO76WXBfkXBWfOsj
 LEIpVyb42vMZL1lLkvnY0ikFcr64g4HTqfIZseiRA1pZfYXuyiUcX6jbIpEDNbTM5rL6
 NjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0vZpb9y8MutMaka6YLswZQUFtbMSrJ0Y46Hxti/8tHM=;
 b=LnuMpF3cH8s8ipWyaMDPSrAO+hzBgXionPTugjDMQ2dcSMV4I2lQf0k0M35yY/6Eg+
 tbIxOPTDF92gRsK4s2b4AtPCAdMrBKEDOnfLZMYKfRLgj6W7nyW6MhllGwY/JwcWh0/J
 aFffgWLlei116FBa17Df8GNsLn4LqOUWSRpczB2duE9f9eD8ibbMxVzRKwYAi2Vu3src
 i0zSzXkwxjUGxZmbDNX8sowYutB4zMmrWsdKxbfJvp+GdPKn8AGwm/o1gHbF9zIoCNhz
 QrZWNnPAVw6w+vTm5PNZSlnqZyL9+oZKWsBS7k/WuCYV7pOE1Cjg0mtpccgydnqGLouu
 Mu/Q==
X-Gm-Message-State: AOAM531YuALnHIjOMClH9JysjZrdkCczs/ljmusdDCZKdZ2+7EIKO66X
 uZvGgKKde6Zfow2S7ZQzJna2
X-Google-Smtp-Source: ABdhPJzu4JCu5Md6ryj1ZYan4yE9jY/7uorHkfnhX/Zx7RM8Yyi0ijeyH/Uqm+yzonvi8XTt8PV6Fw==
X-Received: by 2002:a05:6a00:1493:b029:1ef:a5e:ae7 with SMTP id
 v19-20020a056a001493b02901ef0a5e0ae7mr20047950pfu.61.1615182313824; 
 Sun, 07 Mar 2021 21:45:13 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4072:6e84:fef9:1070:d306:6d0e:bf6b])
 by smtp.gmail.com with ESMTPSA id y29sm4331506pfp.206.2021.03.07.21.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 21:45:13 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Mon,  8 Mar 2021 11:14:46 +0530
Message-Id: <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_054515_862405_0CD6DB81 
X-CRM114-Status: GOOD (  11.34  )
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

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

So let's add a property for declaring such secure regions so that the
drivers can skip touching them.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..15a674bedca3 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        description:
+          Regions in the NAND chip which are protected using a secure element
+          like Trustzone. This property contains the start address and size of
+          the secure regions present.
+
     required:
       - reg
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
