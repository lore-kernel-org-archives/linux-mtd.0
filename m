Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169AAC433E6
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 12:26:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F0264F41
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 12:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F0264F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ZK+CSjiE8fqWAW8g1nmaTSxT87T1XZIo0Umfwkoekk=; b=e0cFDqf49VarsdRnocK7J9S4E
	xbeFQ7YZpBcBjT+QgGCXSa/bT1PWxbbY6dd3vpgcLqKH0HWRc8oA3Ixeh4krzCmwoPW+qaW0Dnsn5
	JS8Fq6cHbSw+R/ZeeMH7AL4Ehrwb9744o9syXHM8eBCmNBVWlCE9H7HHsSG0TDr3ETzyGXkiznV4N
	Jr5zVyGVIuG1tR9JRiJI/9mp/aYNH33NUhpGQF47LdBEqjrjAmXz0eas2CvJyO0UcEtzWaLGkGmC3
	ZW3xs1AsxSoIZmZtKq9tUy9UQ1hGNPmeSV47Il7YFH7OF+D6GcTgFuE7sbSy+5QJU0IT1e9dADmtG
	7vd8yG6Tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMVFU-0035wR-P5; Wed, 17 Mar 2021 12:26:04 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMVF5-0035u6-FQ
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 12:25:43 +0000
Received: by mail-pf1-x42f.google.com with SMTP id j25so986218pfe.2
 for <linux-mtd@lists.infradead.org>; Wed, 17 Mar 2021 05:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=hyvzVHeaKT5CdkW0D6cUUD6bRVX++YCV20wSSg1coULPHz5AfgOLvfL7HQdaFojqF4
 5v5t26HbIHzmBHYJByEC5vRHB0+BuY3YWAuFHJzy78JeIiK+Omr99zGUnnIo0UEk3NJH
 +7NCVU+du5H0Nc9HPbgBqKXKKf4SQnGGeac+PX2ihWZMdU+GY1g6IlxX9ftl+p47cmeC
 GB7jHqacMALLLOWAy593vGyu8uMc6wI6cFc+6AXzfAiYhA9FJHJ5ZtCHCeFPTQ1/sWUc
 DIOWri0EIJbsenDSWoRFMeIGOG9c1TVi3ShhoCPpbZ1KwWu9AaVWZWZXvbLI6BVpbciN
 H1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGzmTTjWe1AbEuSBzNDXhCdxGNlI9I7Ym5rhNfsOEPE=;
 b=XRtWj1PEzHYY+GCaEXii2q0y4XKX3YTxSnJxNNx9yEzneP+rOxmtPZCM45S+fAverA
 MMU9sc1a6OpmD6E8wBZALclyXFvkyo514dODt4ExUUQU0r2gO9UoC5VE1jWOs9syDPOH
 hrGEGI+5VMF1QM6je2G3oRy+SPv2AmZtMk4R+SJxs0o5X4qCRRWriDRDK0BxJgL9iuH9
 uec8iyaziPom6TAWTsJRnPhqArXJXdQGIIrpWKdBVflEE89NoJcuYZCc953UqoXDxp2S
 HbvPQaAUp2pB8xpgEA1HRJ2OjWqpGWKgFzJQUGeWarYYf9Wun8Mv9uFh7bm74mr+Ofzk
 aXWA==
X-Gm-Message-State: AOAM5307jrZ44zfDMSkLr0aAyLsVyKpxn3LUao1DbdnXOPCoxpdbvDFb
 MxRRYMYmLpQ02VyVC6d5nrrJ
X-Google-Smtp-Source: ABdhPJy/SeiYsJVh0qMKBjSvnT0Qdi9a9LDO5ABIuNeOAUoWTJYARGoqrPl1gtZ2yOidGarSm3aqOQ==
X-Received: by 2002:aa7:92c7:0:b029:1ee:75b2:2dab with SMTP id
 k7-20020aa792c70000b02901ee75b22dabmr4123453pfa.61.1615983938243; 
 Wed, 17 Mar 2021 05:25:38 -0700 (PDT)
Received: from localhost.localdomain ([103.66.79.72])
 by smtp.gmail.com with ESMTPSA id y23sm19285730pfo.50.2021.03.17.05.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 05:25:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, Daniele.Palmas@telit.com,
 bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in NAND chips
Date: Wed, 17 Mar 2021 17:55:12 +0530
Message-Id: <20210317122513.42369-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
References: <20210317122513.42369-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_122541_529927_53A17879 
X-CRM114-Status: GOOD (  10.53  )
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
