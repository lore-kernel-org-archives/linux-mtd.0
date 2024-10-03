Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844FCCF34D7
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 23:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fGkQEV5gYfAfOKaECaoCVVDEQNTD9foPvR4r2+1jvk4=; b=bkej3Qlo5iBtAJ7lJcC41oaops
	NmCcom2dWQEwZgtWpA6nB7i/hhgHvMGaPXcxlkDKIuXdGj1uUTtaaCpAAcTLauyE72H7cYGOEVssv
	jB3MTB0/tK47E3wnhl0pNmNezrusnoyTY2sWej1Xoe78ETR3TCf7mWxHCM61BOS5DBD2N6hNx3/AV
	8Ppi3uRsRjgA6009B8TN4jUY00I3Hu0SYvpIPsMhiQPTtTBWWcgProC+OTaJscpKS5mdSPPZ3By8t
	/lIlY6cbVD8CbK+SMgeJ3qRLySS/HC7gNS8NcJJmFgM78VCnZMF36TUofRX5F1PW6DbdrTYDQgp4s
	CEvk9nqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swVMa-0000000Ad3y-34aG;
	Thu, 03 Oct 2024 23:36:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swVLJ-0000000Acqp-14zt;
	Thu, 03 Oct 2024 23:34:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 199C5A4426B;
	Thu,  3 Oct 2024 23:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF00C4CEC7;
	Thu,  3 Oct 2024 23:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727998483;
	bh=LmLiVd8buAfyuJvGbppveG4LjHwRWKVjQEKB/WLTCow=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Q8JSdqsbFO1KItO3T5SI36nQwk3d/dDnd2mPQY2FHI5/u7jRd/KZvyVsok6pH52LF
	 m0RVdnSjpL1/b8JMp56/w0LzL3eYkJKv9zpm+SCV+U/W0PMJVpS9MWrmYzyos0jgd7
	 rIFLKwY7pMPqTPeNOJQq7ajdWB7oyo6AmGIXgRtC52GNxCwMa2cGfCX67RlzbZuYpm
	 Ho+lZKtLZOVO2GoA0kuYAYlj8X4je4U5NyuHzhvEpIbh+M2wNYyboG0DBb2C10JcAh
	 XtjKME7Bax1FoqxsvSEnUzlIByPL4jRZqpyNHcxhG3kPVVOT+AlbQa4cj/b2KQ/Ieb
	 abV2fZ0nJzz9w==
Date: Thu, 03 Oct 2024 18:34:41 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Andrew Lunn <andrew@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 linux-mtd@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Christian Marangi <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 William Zhang <william.zhang@broadcom.com>, 
 linux-mediatek@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Bjorn Andersson <andersson@kernel.org>, netdev@vger.kernel.org, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Eric Dumazet <edumazet@google.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Anand Gore <anand.gore@broadcom.com>
In-Reply-To: <20241003215746.275349-6-rosenp@gmail.com>
References: <20241003215746.275349-1-rosenp@gmail.com>
 <20241003215746.275349-6-rosenp@gmail.com>
Message-Id: <172799847928.1778189.17633670027886493277.robh@kernel.org>
Subject: Re: [PATCH 5/5] documentation: use nvmem-layout in examples
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_163445_452499_380AD7EB 
X-CRM114-Status: GOOD (  11.62  )
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


On Thu, 03 Oct 2024 14:57:46 -0700, Rosen Penev wrote:
> nvmem-cells are deprecated and replaced with nvmem-layout. For these
> examples, replace. They're not relevant to the main point of the
> document anyway.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  .../mtd/partitions/qcom,smem-part.yaml        | 19 +++++++++++--------
>  .../bindings/net/marvell,aquantia.yaml        | 13 ++++++++-----
>  2 files changed, 19 insertions(+), 13 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/net/marvell,aquantia.example.dts:59.25-26 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/net/marvell,aquantia.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241003215746.275349-6-rosenp@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
