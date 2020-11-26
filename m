Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AE1C6379D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 08:58:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409CB20B80
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 08:58:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kwA3NJWl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OiW6Gzvm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409CB20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CQWDz2sWRZEEi23iiUsEwCGpJHKOQzevMHCZCBsRwTI=; b=kwA3NJWl3+TMchgjgg0q6KTPG
	/MgBYikz0P0ey1csqGYxWBFPcja3MPGumxxoB1pyeEFhWsJN6g1KGmtv8nC1EGQqv8BKQyUsXSQsK
	MJBVugwrtfrTqHTNIiIjzvwU1jpmndKVDICzrqQGpxH+Fmeg+4UajjJCVffIceZ5tJ6Kyvk7xLuCi
	hpXNtIrZ6EWtj9cUpxQYXNLRmoyCFXa25ttDq/Qyem7SMzfKK5XUFNnfnfnkaQqmE4P6tnFqAz2zd
	F4pCnx1X9r09W1nSbg/psbhV61MFkxj+VCDffE+H1ctpbwYxgPGflWynOkV6qznnx5+qMB4ZHV3jV
	ScO8tBWlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiD5l-0004Cj-Bb; Thu, 26 Nov 2020 08:57:29 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiD5i-0004Bv-G1
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 08:57:27 +0000
Received: by mail-pf1-x443.google.com with SMTP id n137so1078598pfd.3
 for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2020 00:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aMxUrmRGx+y3NjZPjFrWddmFD+gsX++Ce0FYPnjlkxg=;
 b=OiW6GzvmiuKkoLaqQWM9z1gn+0abOqn1aNE+dGD4U8KlXEput0gbHsFwlMHRTDMZSc
 Ejm8oxWCB34DrtOcfOS21SvZZteasv5ThHqDdmZoCxteBq6L28Zhs4mnzTbQSTswkQVQ
 2JFglFvMzV5j38qKkatgudRvvub7zJl73Kjy2AanZxjcxwXFm7PqHztUNecoEqgs8jNk
 1gowIElSJeUNQ0kQKvLvHdYpOjDhEhNykhr/uhmFDRImVZ6rK3R+31DtIHd1DIjnP86F
 OiG7W8bbNh5yZSYjU5kKwp0vlOswI/Gt4XkKKSj5P3qcYrRC6gULiwOKwos3k1rgb4xg
 t69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aMxUrmRGx+y3NjZPjFrWddmFD+gsX++Ce0FYPnjlkxg=;
 b=DwNQ502hig46ehCEeMj/c+b+Tk4kcfRfHxw6aEi3ovLhyOWyj/z8Nt1WYPJvyK9/bB
 solUBer5CA4cu4uyB/FBc7p7G/l88H45NK3YJZwCZ0cxkPzQ7g7+HbgKhvpQNVAK7+OJ
 D5tNYA1J+CWD8CUSzCnRANjqJq7djZS0LPWMQIZxCDCvTNKvJTELYMImPABbvxeX95f7
 Kn90T3/bDAorx18L6ceq/Q/j1EFLZtdTq3OKeSPcqlAGNkQq93WxuEtD327sP1ASPz9r
 qY8Af6EeT9CkOxdTTR0U9EqcBZYZu5nAU+S0nXFJxzf82CIbfD12zxZadkK7CBiF6nqx
 X+wg==
X-Gm-Message-State: AOAM531t4yciTtGSSC2xn+aYd6w64u7TeejWDDtePeVYJPfkcvrGLO4Y
 fDnL31TmUOdpTriLZ2b/dap7
X-Google-Smtp-Source: ABdhPJxYOrYdgbhzUl+CCPWqsQZhcQ6M1BDB6k4vk0lPomfm+IUwdVrGTdkh6Eym3uZYklFC/U9SgQ==
X-Received: by 2002:aa7:972b:0:b029:18b:89f:df0 with SMTP id
 k11-20020aa7972b0000b029018b089f0df0mr1893902pfg.39.1606381044561; 
 Thu, 26 Nov 2020 00:57:24 -0800 (PST)
Received: from localhost.localdomain ([2409:4072:6e95:f2a:3996:9d7f:e389:7f7d])
 by smtp.gmail.com with ESMTPSA id e29sm4025603pgl.58.2020.11.26.00.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 00:57:23 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 1/2] dt-bindings: qcom_nandc: Add SDX55 QPIC NAND documentation
Date: Thu, 26 Nov 2020 14:27:04 +0530
Message-Id: <20201126085705.48399-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
References: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_035726_652398_3D3BAF4E 
X-CRM114-Status: GOOD (  12.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-mtd@lists.infradead.org, sivaprak@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Qualcomm SDX55 uses QPIC NAND controller version 2.0.0 with BAM DMA
Engine.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 5c2fba4b30fe..a971db361678 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -8,6 +8,8 @@ Required properties:
                             IPQ4019 SoC and it uses BAM DMA
     * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
                             IPQ8074 SoC and it uses BAM DMA
+    * "qcom,sdx55-nand"   - for QPIC NAND controller v2.0.0 being used in
+                            SDX55 SoC and it uses BAM DMA
 
 - reg:			MMIO address range
 - clocks:		must contain core clock and always on clock
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
