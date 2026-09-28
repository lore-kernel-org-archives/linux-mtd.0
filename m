Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97F2CA5FA3
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/x5IvIdboSM2TKseyr0RESCOq1mhggFCZBuZXLAvpoo=; b=4TKUGS/48iW7nB
	LptlO1xFfCfYFhEpm/dUeRTaFQlaAMMRVbEWsbmNS6yLA3jL1XxmjRdkrJoC3hvpBTMbP1bCcYkuK
	Cx+pHrlIFXhihRu/jn4KINj4aqCu4+L2mBDN/Gs+6tsuFgtLLuPPi0oKVX4ezOL630wNUA5HifVfW
	/nhcjdn49WF9ys2Viw8vg3uYVaT7uPIhy1J3l7KnUJ2p7uWNs/P+xBldKXI++Oi5yDn+D/jbpG0xC
	b56Q25uXleihW02MXImSRYowJ1qiev8ZrZgShkUyZkUZEMv3/1YNAnECmr4s/VNLKiSmixkc1Frvw
	AyGfWC403lGP8m2iK9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBImK-00000001f8W-0FV8;
	Mon, 28 Sep 2026 21:20:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBImI-00000001f8P-0Lkp
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 21:20:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2BE01600D1;
	Mon, 28 Sep 2026 21:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD361F000FF;
	Mon, 28 Sep 2026 21:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790630448;
	bh=eYxD/haNIzLuR083lmQnWX3jttkXDH68DSQA7yCkl6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EvQKz6+IYGoqYv2yvmSxjPvf+Yop3XZLXxS2RFSHDUpE+ya8k4qlSNAkfsRP+C7zo
	 IGEFkBOqGXkhB48Ikg2ufieYzVAPmmP85u4cZxn/6d+mI8mD+H8/e5uYMUYEvUMyM5
	 qKY+hyWTjgYlciNPqSZeROLkHS8R/V94Ndo8pnGkaGsElJFqadXzbf1eE8t3V898BV
	 jqzKZaaeBKaHHB1r32os6mij6bV+DhsuQWFnorBFHX5N/BIzb4XlvHlZXsOQORy2UG
	 jfnL16dpkL+f3HSNI1woa1AWiy+tN9EpXXShKusmXtUIYxBup73TmIIkCuSmhtMnQ0
	 4Z+oWPIC1z1GA==
Date: Mon, 28 Sep 2026 16:20:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Message-ID: <179063044641.731990.2506893904840369119.robh@kernel.org>
References: <20260926014802.87255-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260926014802.87255-1-rosenp@gmail.com>
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


On Fri, 25 Sep 2026 18:48:02 -0700, Rosen Penev wrote:
> The NDFC NAND flash controller was only described in a legacy text file,
> so dtbs_check reported "failed to match any schema with compatible:
> ['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
> glacier, sequoia and warp device trees.
> 
> Convert the binding to the YAML format so those nodes match the generic
> nand-controller-legacy schema.  Describe the node's reg, ccr and
> bank-settings properties, along with its "nand" chip node which carries
> the legacy partition layout.
> 
> The "nand" chip node carries no unit address, so the "nand@[a-f0-9]"
> pattern of nand-controller-legacy.yaml never matches it and
> raw-nand-chip.yaml is never applied.  Describe it with mtd.yaml,
> nand-property.yaml and raw-nand-property.yaml instead, the way the
> controller level does, so that both the deprecated partition@ nodes and
> a modern "partitions" subnode are accepted.  The node name does not
> matter, the driver picks the first child of the controller node.
> 
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v4: allow modern partitions
>  v3: fix wrong regex
>  v2: fix reg value
>  .../devicetree/bindings/mtd/ibm,ndfc.txt      |  39 ------
>  .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 128 ++++++++++++++++++
>  2 files changed, 128 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
>  create mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
