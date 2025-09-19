Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6400CAC592
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Sep 2025 14:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w9M3tDQ4kfewfYIvZeN5Sn2Tx6EwrtnxFe0DUDGxyA=; b=g2wmxMowjgpJOg
	fWjw1Ljc7dInLoNvv4PD3oiYIeTG3vFDUIqMDP2Ow21bcZwbDPKGS4SLr7nEkodqhIobn5QjEH0FU
	Qxw7EwsizflONOSmFnIdij3jpmT5Zj9ppgTQexB5yERLBi+hTwXZjugSzmMaqPJiWPf6Vzam8ghIu
	X774cJXpSzZyeEnWDQCyIcqU/jSMIUQUgPV76E9eU1va44n3/ZZXPYypFIWNtUrgrJ1vRGuVQ5lqs
	jbhs1M0ivR8j5i1tssvBrydfs++CfnMZV3BvxepWCaECSBff+qpaJH4YHF8REQCq3JQ3KmBPnru0u
	KApPU6NIQ1WL5b5o+AZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcKs-00000003Brc-2nWV;
	Fri, 19 Sep 2025 14:43:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcKr-00000003Bqo-3l8T
	for linux-mtd@lists.infradead.org;
	Fri, 19 Sep 2025 14:43:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EEEC6013A;
	Fri, 19 Sep 2025 14:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EA2C4CEF0;
	Fri, 19 Sep 2025 14:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758293021;
	bh=GRWvbLVJoCRvQy1pyW+E11G+20xo+6FXxHxhCH7vm2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cAE8oEAXO2SokxMv8QENAiFM9e6YXxmWGbKCjAX65ddnuDthoABkFaYR3kInIQty/
	 yvj3PV+3Vo+RD10ffFn7qSpXXAB9XZonxTqWIVlfpDuzExU1A/6xN5TEgCorYma4qp
	 qSirgsPtyjQL7/2rV0sgYqirruH9uTABkJ+qqGBeipdCwmT4nTDSZJZqN+XxvjUCdy
	 tMBNoWxjbuawQ1jr/po83GsRI4hUB/bF3hRWDFsKziCjMFuOB2zO8f+7XDSrsIRWY8
	 RHAfz81zk1ZkMSyh4Yq1KeHzrDMjCL9hLL9te6WNzXiX+vo87aElDWSAhiMGoW7/58
	 6Zn5ifF3wz4xg==
Date: Fri, 19 Sep 2025 09:43:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, linux-mtd@lists.infradead.org, richard@nod.at,
	krzk+dt@kernel.org, vigneshr@ti.com, miquel.raynal@bootlin.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: Add realtek,rtl9301-ecc
Message-ID: <175829301902.882885.6356641284141772860.robh@kernel.org>
References: <20250919075201.4177901-1-markus.stockhausen@gmx.de>
 <20250919075201.4177901-2-markus.stockhausen@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250919075201.4177901-2-markus.stockhausen@gmx.de>
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


On Fri, 19 Sep 2025 03:52:00 -0400, Markus Stockhausen wrote:
> Add a dtschema for the ECC engine on the Realtek RTL93xx SoCs.
> The engine supports BCH6 and BCH12 parity for 512 byte blocks.
> 
> The hardware can make use of interrupts but this is not yet
> supported by the driver. From the known datasheets it is
> connected to the LXB (lexra bus) and propably depends on its
> clock. Provide an optional clock property that can describe
> the relation.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> ---
> Changes in v3:
> - add optional properties clocks and interrupts.
> 
> Changes in v2:
> - change cells from 2 to 1 (only 32 bit hardware)
> ---
>  .../bindings/mtd/realtek,rtl9301-ecc.yaml     | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
