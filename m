Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C5AC54754
	for <linux-mtd@archiver.kernel.org>; Tue, 20 May 2025 02:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CbP/G8eC0M+2kRw2Seiy2ZZZdUZ/Kf/QKhXaEu5V6Q=; b=BNTMmJIRDTpOQ+
	EWQeRhBxAJ5zwaeTOlCJ2KuvZ4/cF5va0Dl1NUAUEJLFDPiy1Lewucp94oi2glilGYuYB0HLcq/rN
	DtUtGsXTbPDjhkDArOkRzVMLzxt0O8CQtJAQh0++6DCvI2xGdYJuhXMLu+/0Gx244+OIuiGJD/e5y
	7DdOKNyPnd/TvOAlNvBy0NsOX0rDs8dzJHOIgdrdvX9TCKv+NVYgaChNsG3PONLLA4N9pEyVAlO7P
	8m847+3jG8mDOxnmHt8rbjtomAJ//gdzfxaFaRuNseN9dIgSSCH+os/i8RZ8i5vFgj6FKNLDzaRSF
	uMRnjfJK3yZQhnXgIcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCZ4-0000000BJyk-1e3B;
	Tue, 20 May 2025 02:18:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHCVp-0000000BJL1-3RrU
	for linux-mtd@lists.infradead.org;
	Tue, 20 May 2025 02:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E4375C3E91;
	Tue, 20 May 2025 02:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0430AC4CEE4;
	Tue, 20 May 2025 02:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747707324;
	bh=EPiQV0+RFQ6SbjXgsSYabKbALscwJInqg1lm97yoZBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wa214EZqr7yeyORFF/dO6socO/YzFt2sqs2SSaN+xPqZA/lO8wIo+3LoJiCcVpjXz
	 dSClB5qk6rhS59EBXVhhpvg+ju/RT9GEMSa05OFHjMtCLJ/ZI5ZL1a71LZEnoDvvkk
	 bQMFCG9UTPmaZ37NPv4ynUcplOKhuvl3v/XlrIP3kWVadN6SAshYepHOqKI1+L1KOH
	 /Q6q6WpfpbAnlknhsw7RMJQ1sYA+sW/VjS6vRiImw9zgAC6zxeEhr9dY4L7rxGbbJt
	 OETprUUxa8F70bshPdD7FV8loFeSbsq/iZu8S2S1ScPG9UPmct5yZwzhfqIHjNB1kP
	 ZXpdQT9nOHogA==
From: Bjorn Andersson <andersson@kernel.org>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	manivannan.sadhasivam@linaro.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	konradybcio@kernel.org,
	agross@kernel.org,
	Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/5] Enable QPIC BAM and QPIC NAND support for SDX75
Date: Mon, 19 May 2025 21:14:51 -0500
Message-ID: <174770727729.36693.10794691902044161695.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_191525_904411_FF8199D4 
X-CRM114-Status: UNSURE (   8.45  )
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


On Tue, 15 Apr 2025 12:57:51 +0530, Kaushal Kumar wrote:
> This series adds and enables devicetree nodes for QPIC BAM and QPIC NAND
> for Qualcomm SDX75 platform.
> 
> This patch series depends on the below patches:
> https://lore.kernel.org/linux-spi/20250310120906.1577292-5-quic_mdalam@quicinc.com/T/
> 

Applied, thanks!

[3/5] arm64: dts: qcom: sdx75: Add QPIC BAM support
      commit: 5cf0ebd4800dc5b67a332c9f56d20882c41d6099
[4/5] arm64: dts: qcom: sdx75: Add QPIC NAND support
      commit: c25dcb4d42a9506d5270179bb32cf538a1a28423
[5/5] arm64: dts: qcom: sdx75-idp: Enable QPIC BAM & QPIC NAND support
      commit: d838ac6903eede0c2840bebd8788afa95a5aa0fb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
