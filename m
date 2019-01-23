Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73252C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:29:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D71B21019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFRK02QV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnR8L0BA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D71B21019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9fuzYIWXxHewH1LxzTzoGnn38Zk3BdcSbsqQ7rmQ3I=; b=XFRK02QV/ck5YX
	O5mfACbW8sAypTBu/SgESAbL206A57+BEHp05yJcDTABEXYtCJAoDcH5I/7g/X+JDrx9CMk/AUgif
	xuFGK/SIqvteSzb32daNw1MHdadFsqOY8yishvIfJ8VjKS+cip5TeJg7u6FdSCeWw3WUH3xoxSlna
	Iiu7TEtPnrW2P/7X0URkMhDp1F94DhKm4Fc5cY/3QtCXXOaRusIqOhwgbHoeQVtFFbYVjAUIpbVdZ
	45V911Dag3R8DgadSwcBojCHzUJSW5tc1uCr66W3HFi5kECUeM7wKAHbhh1Y1oVvZ+/x52MVx9bWP
	u5Ttgp7ZUJC1Fgw85GpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmHf8-0002mD-5a; Wed, 23 Jan 2019 12:29:46 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmHep-0002Rs-Pk
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 12:29:32 +0000
Received: by mail-lf1-x142.google.com with SMTP id a8so1442642lfk.5
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2019 04:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y8A6lXVMMrUxYUjnxEQIn6BW/8PfbS8U9FqhGyx9sIk=;
 b=FnR8L0BAhw7R138hn5RBlDVCd15OqQFrpVi+z/svA2WWx4y8RgoPvuJxZ1Ron8gBHt
 vxDqy8TcuwONOS4pjdVWg7JJcGnJCp9uceGXvq/Pf4OKWfnnckqF/SpnP7Y1rHv16XjF
 yStjXfaqFzFIf3Hd13mAHk2oNII/3os2gOv4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8A6lXVMMrUxYUjnxEQIn6BW/8PfbS8U9FqhGyx9sIk=;
 b=phMEMfO0OiLKi6J3F6DuMmn02AFVA7j3LKJp+FLK+/eW90v5AQ1KtQdD12yPTWiL6v
 xXUKqYxxj+Kma/HhGeJHiNe42FAkLkpetzGEqp/Qj6y4UQz7Fh668FdU2rJjaMmCB7l3
 I+Z916Hy0ySg4GmsbcUB5LwR/ahZYmzyqLOFkyZ5rV14CgP+vIMd850SO0AoocQLdENA
 shaJtnKxWcvW86AgcYrH1sPddXTJhQa1KdjA3aOEaw77EuWqrpRyW2HdfKYVwAOXfbgU
 I3j2h2N7etbtd92Vh6yg57NeLF/Df1OkR8ycJ1dU6qokiEh0lcHZhIteeHj/c+mJUoIP
 X8AA==
X-Gm-Message-State: AJcUukfWWDh7gUG2Nk+bJCq0pB5l9x/sCoIm0QhlI7iFV9Txo3JRLpUS
 ypA/GCNL5yu2AFMvgZYZ+VOKlg==
X-Google-Smtp-Source: ALg8bN6cGC7KHSpGw/I6CXbtPHMcVPZPB1D6BQBCd+SOj3+HiL5hRiMq/8gEwdxLBmTYvk+7PKauWQ==
X-Received: by 2002:a19:9a8c:: with SMTP id c134mr1670017lfe.152.1548246565486; 
 Wed, 23 Jan 2019 04:29:25 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id q2sm475935lfa.63.2019.01.23.04.29.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Jan 2019 04:29:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] mtd: partitions: Add AFS partitions DT bindings
Date: Wed, 23 Jan 2019 13:29:09 +0100
Message-Id: <20190123122910.19024-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123122910.19024-1-linus.walleij@linaro.org>
References: <20190123122910.19024-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_042928_336213_51065BAC 
X-CRM114-Status: GOOD (  15.43  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds device tree bindings for ARM Firmware Suite
flash partitioning used in NOR flashes on ARM reference
designs.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../mtd/partitions/arm,arm-firmware-suite.txt   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt

diff --git a/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
new file mode 100644
index 000000000000..d5c5616f6db5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
@@ -0,0 +1,17 @@
+ARM AFS - ARM Firmware Suite Partitions
+=======================================
+
+The ARM Firmware Suite is a flash partitioning system found on the
+ARM reference designs: Integrator AP, Integrator CP, Versatile AB,
+Versatile PB, the RealView family, Versatile Express and Juno.
+
+Required properties:
+- compatible : (required) must be "arm,arm-firmware-suite"
+
+Example:
+
+flash@0 {
+	partitions {
+		compatible = "arm,arm-firmware-suite";
+	};
+};
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
