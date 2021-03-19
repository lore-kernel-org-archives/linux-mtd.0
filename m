Return-Path: <SRS0=vdk9=IR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A56C433E2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 15:01:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D901161930
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Mar 2021 15:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D901161930
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ZK+CSjiE8fqWAW8g1nmaTSxT87T1XZIo0Umfwkoekk=; b=EGAML4Uz/AW8MuNPtk36DTL5Y
	onRsdmonTNQIRrHSGV3RVaxPu/c/1GTEEojlxlSUO51Yp8PdaNm9d8Wr+lyB9t803ob37gWJJLchU
	yLdtnL2mHxgTLEWbTv5DU43jWaveGI7iHt9n/LZKNca/J1ALZ318qCveckHiiUGfO/8rxdQdpAVUT
	pMfZUmP112QO1pITgv0wfr8o1KSoqqwZTCbx0xNPNoBTOHgDYQG3we17+e8zRklvHIX9Ae0Ke5tEd
	xjJqZnhJtWnC/cNB6ZvnIgeGo4tQXfufvJK9FMPhE81dty/ilRBura+VZQNvZUpAzz5oNNqshElob
	BSxtmYLEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNGcP-007a6o-QQ; Fri, 19 Mar 2021 15:00:53 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNGcA-007a4x-5W
 for linux-mtd@lists.infradead.org; Fri, 19 Mar 2021 15:00:39 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so5015691pjb.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Mar 2021 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=ohvrJt68oUBNkBpQAKJcjO2bUbdF7woTHDFm5MbJb0YRsHlluRF1P47NUZjK+Mfriy
 vhedOAaoRdsWWXEABh7ctC4jxo2q3MnFOaAkNIJi6F3NtpowIbuKZMSdqOggmXSx0HHI
 XlIL8nsLCd7MDB7nn7FBrEmwrBngUdYX3sTf/OpEoREMSV2Ab+Lqn1OxuzoNeGp3RxWx
 9sovfJ6xzlKoWFvFITeYW9RlMIxWvH8SE40OOpNmicQ5z5WnPljHnGDNyumQjcMhK2Va
 BqDk37lGlQsvlCEd0ZHcg/opa5w1PXo+q0jaxyd0FTxg4/ah4wi8OCBsm2N5obrZrOE8
 uohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=AuGtcQ7/f+2HA7+TzB8Ao+C1/InNxU/MMEwsqeo58/caDnvgZr19DoT1PPaTMU1q39
 xKJHvaOdSAKGCE7GhOFb1NsGmQSXL1+Pn9CgTVmSCbxeEI1Fz7MCxbSxnJ0rF4HFpBPJ
 q7rB4D1juf6EzRKGn3EaaKn/AQr5k/kF/FlosgfK8X5LqZ+Mt1702hx/d67EL1notEnY
 ZU7Q79N0pyekP1N51DvX+EXa+oslTAHDc2fVuRw1kAjcPtl2SyUEMBRbc8DufsPW3LQJ
 Xos2PJ03S0C+sVEYMiP1YHXRcXcH8cot9gDyfrzNQ77YeH5KeAwjUDWUUeK2VjlAWh88
 DN+w==
X-Gm-Message-State: AOAM533F+hdMQ4JmJ7jlYd8kjg1f/S0ZYIqelumhbnNxebE5jB16JPKi
 /6erq2mTbXJvJWadtwhaDXSf
X-Google-Smtp-Source: ABdhPJxbYUC3aJcdyDm/DVWvSwOUU/+CzGqsycRz3kMEYgrnzWUZb1jzISsn8q4kMb4ExdZ6nDsphQ==
X-Received: by 2002:a17:902:f1c2:b029:e4:6c23:489f with SMTP id
 e2-20020a170902f1c2b02900e46c23489fmr15169667plc.62.1616166036933; 
 Fri, 19 Mar 2021 08:00:36 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:387:dba9:92f4:36c7:1aec:59de])
 by smtp.gmail.com with ESMTPSA id h19sm6092345pfc.172.2021.03.19.08.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 08:00:36 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v7 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Fri, 19 Mar 2021 20:30:09 +0530
Message-Id: <20210319150010.32122-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
References: <20210319150010.32122-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_150038_280233_4C73CC22 
X-CRM114-Status: GOOD (  11.02  )
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
index d0e422f4b3e0..678b39952502 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -143,6 +143,13 @@ patternProperties:
           Ready/Busy pins. Active state refers to the NAND ready state and
           should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
 
+      secure-regions:
+        $ref: /schemas/types.yaml#/definitions/uint64-matrix
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
