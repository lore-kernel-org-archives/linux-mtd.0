Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D5CC982CD
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Jan 2026 15:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmtZZ7GhOgTN19Cs1WFb4rVHgQrlah5BRG9RM8gRkMo=; b=hRD2bG2atGaafD
	1ftFCS8iWGWP5DR0Tt+u9FIwB/ILtjxAzZhnYdA/IoZDgyG4GoM6m412VrvMeGCDKnk0FoQsVPSCU
	WjNlBhV13N0RK1BNeGzpglSia3f39colGFT/A2djCaYAbD/zFRx8DsC9VzVYGp8LoxY9Z18KT9nN8
	JVO7ma1V25BFhxMivhrdbKGY7To834caODfg5oE52IqyQMEIQEdqu47aoCQ2xwSLs8Ld1gb+AZsnB
	LxWovczIkGa/APgnIU3fW8RIhrmmmU11Z2ap6kuWqrLPPR1QleJMp4vs2RQteSHrj99KOLmvS+uZa
	MMtmYZijZC0Xy6jT4GdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglRN-0000000EJtO-249c;
	Fri, 16 Jan 2026 15:08:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglRK-0000000EJrt-1sOM;
	Fri, 16 Jan 2026 15:08:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A93FC4342E;
	Fri, 16 Jan 2026 15:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60600C116C6;
	Fri, 16 Jan 2026 15:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768576121;
	bh=GsDoofD9Db2+ABthdz0H2fcd39DOVi6IJIg7YdoRj8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVy8+kY7ZWBm2uJM1aPcj6Se4PHtz7GAXz4wHdMyGVhlhemIZzP9df1+u1DnzKyds
	 ksyaEv0+Bq5NpSZIvTBFguO/zUpvHpZzl9EFrLjQRH4VbY1T1dWk+K2gub43Awo052
	 1qCUQMmvRmhvZT37qXm5NREEYSGMTEwgAto0d81wJIil7TMVuslj4lFh38sgmVPrRP
	 hbxWJHYTAjrnXlWg5zrL8vivybNTm9fP7DGDkSO4V0vi/dOYERuucSUXATODdfhwsH
	 xLfVKus6wrbYIDbIBetj6BOSpHUofKtyqhUdz30yJMWPWfdrevgJ7nQYR7cIFVylgr
	 4yTinFtN6iMrQ==
Date: Fri, 16 Jan 2026 09:08:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, julien.massot@collabora.com,
	linux-sound@vger.kernel.org, pratyush@kernel.org,
	tudor.ambarus@linaro.org, devicetree@vger.kernel.org,
	shane.chien@mediatek.com, richard@nod.at, krzk+dt@kernel.org,
	lgirdwood@gmail.com, conor+dt@kernel.org,
	linux-mtd@lists.infradead.org, jiaxin.yu@mediatek.com,
	broonie@kernel.org, vigneshr@ti.com, matthias.bgg@gmail.com,
	eugen.hristev@linaro.org, linux-arm-kernel@lists.infradead.org,
	miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org,
	mwalle@kernel.org, kernel@collabora.com
Subject: Re: [PATCH 3/4] dt-bindings: arm: mediatek: audsys: Support
 mt8192-audsys variant
Message-ID: <176857611991.1604366.11152222679883744313.robh@kernel.org>
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
 <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115125624.73598-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_070842_505385_409EDAF6 
X-CRM114-Status: UNSURE (   8.39  )
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


On Thu, 15 Jan 2026 13:56:23 +0100, AngeloGioacchino Del Regno wrote:
> Add support for the mediatek,mt8192-audsys compatible, which uses
> a different audio controller (mt8192-afe-pcm) compared to mt8183
> and mt2701.
> 
> This resolves a dtbs_check warning on all MT8192 devicetrees.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../arm/mediatek/mediatek,audsys.yaml         | 46 +++++++++++++------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
