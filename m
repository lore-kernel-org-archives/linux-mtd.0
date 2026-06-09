Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAB2CD8CA7
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 07:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xXU+lPUigu8B8assasRkEo57j9p2peJY/dpr00Tdi0=; b=BfkmEwbCPcSzlu
	G2KLN6Wd0ZCFZm7tL03/aNNyxNzgGmTQs4FVYrwcvnTwU6KHiSCrhoeh9z/2TMG2yclfbhqJU8904
	Tp7jeYlEjpD2YWeSWfYVJdHPAdD/Skv2TL13seStdELZO5rxv024m098EuUKJ3Xo/+g+3vGE3gdpG
	NvrzmSX7mbXT0n59vVaZCWYbqks5/oiojphs7iuccrkmKpDZzsQ8v7K4UpWcx4Amu6sB7I6DM3i9x
	wc1mwzlH5LMmG8lChBea93Mg2ZPjlvkYPBoSNuiQLBvpIP2XYK5CBu7O7wnf9Bb+2Vfbr80xYMG3/
	/LYC3WTLQ7i5ZY4djrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqkh-00000004xGi-0S2K;
	Tue, 09 Jun 2026 07:19:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqkd-00000004xGS-3qkD
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 07:19:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 010F6600AE;
	Tue,  9 Jun 2026 07:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F9461F00893;
	Tue,  9 Jun 2026 07:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989594;
	bh=vkCP6b4OrlIW/YPpqmN4QaEIE1n3u/k0VTYfSKF2ZnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIZwfDlPg3B9O2qcn8pvuJoYYZDDkHh7O8GNeGzBiTJnjH/yVPNoc7eWWj97Jnlyh
	 mLPUFa8qLI96o3vljxZFwRA+BpRStZ+n5txbmcsvdNd9XrbIv469K+HVo2K1heivFI
	 29w3gdD2fn9O97509HVK9VeN9owj77n3O1PTtusxa0TV7y7+YvsqaFOtbXWic3LHeC
	 spluMgxeGaAFCoVy6Lar+Du9AQ0usBmYmcuKgmdCB3jN4cWmzOn95NMlPiBy639CRn
	 nUPVbeI+VTdjgmuz1HTGXlTbbPy/tzoaMBGH9+GRewJkg+/jYWu3JOHN4nh6c9bRWu
	 DhaVi/Qgb2LIg==
Date: Tue, 9 Jun 2026 09:19:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mtd: qcom,nandc: Add MDM9607 QPIC NAND
 controller
Message-ID: <20260609-quirky-rat-of-criticism-aea1fe@quoll>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
 <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-1-4639a0492274@linaro.org>
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

On Mon, Jun 08, 2026 at 03:20:22PM +0200, Stephan Gerhold wrote:
> Add the qcom,mdm9607-nand compatible for the QPIC NAND controller used
> inside the MDM9607 SoC.
> 
> On MDM9607, there is only a single controllable clock for the NAND
> controller (RPM_SMD_QPIC_CLK). The same situation also applies e.g. for
> qcom,sdx55-nand, but the corresponding device tree (qcom-sdx55.dtsi) works
> around that by assigning a dummy clock (&nand_clk_dummy) to the second
> clock ("aon") that is required by the dt-bindings. This is not really
> useful, so avoid doing that for new platforms by excluding the second "aon"
> clock entry in the dt-bindings.
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>  .../devicetree/bindings/mtd/qcom,nandc.yaml        | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
