Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC67107BCD1
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 23:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qyu17pWBcpmpicPYMbS/sQJg9tgM6J12IwFSWJ5SSOA=; b=UZZWX0GmbUcjZt
	WZOK8ivds2Jaz9MFLZhtmHI6EZ/J+jYf3YiD30RTLz9bQZCrqjVg1PHWDeiPzun9Cm83wCwTHVN87
	7anJc1s4f6Qa1gfw/mvfPkKuYrcXaZaHRdqy6No81hGozyRi2vZ5qcRZSWjN725FQqEpTp3NDxIwo
	sbBsdBoXQ0Ic6OvvGTi3orYuKAmofXacBkFv3a5DJ0MQIoYKDxHlq7v+tWAp42MqaKmbaszHyJm54
	lRKfpiB+2oiIAIblPt9bE4AGE3+WryEwmMfrv83h8nMJCKanuxCQtC0lrNFoLvq8nd+zayNk3JST4
	Zrgfe3BfQsxBEfAq44+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1C2o-00000001K6q-3Zr6;
	Fri, 13 Mar 2026 23:35:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1C2k-00000001K68-3h9g;
	Fri, 13 Mar 2026 23:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CA0A60008;
	Fri, 13 Mar 2026 23:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6F0C19421;
	Fri, 13 Mar 2026 23:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773444945;
	bh=xc7MjIMAXeiLgrS2X6SSXxTUrNBTb/oD67k7f8URbr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4qswcPAtRFmrMfn3/76nP5TwmCCLzz6coATiku1apP2xBcq0JVLP/kB+1TsNsa9I
	 PDhTDidpmI6dwSCwBD7itqzlgroIR4iuvAR7Fkwvk5i13LqBT2MznlOVTFNcfqFTRA
	 WxOWi+2HG2Lc4sbjauL2ohhfD/MXHGvRY6Z5LRJn3e0yNH0w8e2N0ZVmYL/Jk1f35a
	 /wvrzCsTNcz937UrWrf9ImFi5+MLS4AHv+ym95eaTV0Iw6zXymzu/JnKumDDek7rXi
	 mYAoT5Zo5xMPoZ3sI7zKOTScLJY6aR7oReDurCCbkoW3KnT+g2Sgt/SGtZGj/jLjBh
	 8XHJAGf8oDwlA==
Date: Fri, 13 Mar 2026 18:35:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: mxc-nand: add missing
 compatible string and ref to nand-controller-legacy.yaml
Message-ID: <177344494372.3644453.7349557296372406656.robh@kernel.org>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
 <20260309200351.1791162-3-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309200351.1791162-3-Frank.Li@nxp.com>
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


On Mon, 09 Mar 2026 16:03:44 -0400, Frank Li wrote:
> Add compatible string fsl,imx51-nand, fsl,imx53-nand and fsl,imx35-nand.
> 
> Add missinge properties dmas and dma-names.
> 
> Change reg's maxItems to 2 because i.MX53 have addition NAND flash internal
> buffer space.
> 
> Change ref to nand-controller-legacy.yaml allow legacy DT layout.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - use items for regs.
> ---
>  .../devicetree/bindings/mtd/mxc-nand.yaml     | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
