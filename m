Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AACAC369D3
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Apr 2025 18:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w2cif38q4xWAsG5pUj2eZVdpjiDRDm1PGLY2O3/j2YA=; b=KLSyM6M2kE2rQ4
	0a9yfF3dQE25xU+5yKXI1IlV3ixf3e8ovIcFlyLcm9k5kjdXyhzb46ikUYJOZxZCNuw2mYNt6a575
	U5JGZ0rEF498ScrxYoVDqCPS1Cwkt6fD48s0hEdG8fstM9GqwS2cl+7dXEk3na6YJ0f6P1wQ6d9F3
	yLZlz7V8NHOmRA6StV/eAPkM7lwRUboqPTnGiewzf8WKSF0WhGDOowutgm9e/91dgTn+WGaRJUQrl
	hKS1xOlIYYYcK+JYxb/H7z2emuRVXXLUaJONhsNThaNJR89kMDwUiqPlb+YI/ab4H6H9r1mvWR0Co
	ESXUWwZxz47Gy12ocZ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vyJ-00000004vMD-1kKa;
	Mon, 21 Apr 2025 18:34:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vw8-00000004v8i-06DF
	for linux-mtd@lists.infradead.org;
	Mon, 21 Apr 2025 18:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 594DA61154;
	Mon, 21 Apr 2025 18:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE48DC4CEE4;
	Mon, 21 Apr 2025 18:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745260327;
	bh=MSwfIUdh67VlXODh5jeQ8Hf4YamBkvYNgv34xQPDdNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L0CUXXPyvat9Ny6XB4ukzq55rF6L5X4/PFZ7mwObD0qSZ/zz+kaYmGTc/m2KolGkq
	 16qMxvhdx0QFz06hPAeSvaV7sPOAT2zO4I0pNy930pJD9fpZoAynHJ4XJo/yemwsl+
	 sjwLwKFfl0djDMStpwoq9Ln6MAnoWBian2lM+EOYhLOQcpv/PEAeX2LmuTGB9w6cqx
	 wWzUfRkaF5yTPap0FcGq6pkdHA7TWriPFSbeZvZ0r4oRbNDvo5cp8Gw2gLpzTueThq
	 2WjdeS7n7UkxkgqXtoM8UPFBIbZsqasfjXmJ7eCMHNuoj8iGLPvJ0NN6RAYzy/e3RZ
	 8RbvWqUi8vk1g==
Date: Mon, 21 Apr 2025 13:32:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, krzk+dt@kernel.org,
	linux-mtd@lists.infradead.org, andersson@kernel.org,
	miquel.raynal@bootlin.com, agross@kernel.org, richard@nod.at,
	vigneshr@ti.com, vkoul@kernel.org, konradybcio@kernel.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: dma: qcom,bam: Document dma-coherent
 property
Message-ID: <174526032446.2585027.3719839146163780221.robh@kernel.org>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
 <20250415072756.20046-3-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250415072756.20046-3-quic_kaushalk@quicinc.com>
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


On Tue, 15 Apr 2025 12:57:53 +0530, Kaushal Kumar wrote:
> Qualcomm BAM DMA controller has DMA-coherent support so define it in the
> properties section.
> 
> Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
> ---
>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
