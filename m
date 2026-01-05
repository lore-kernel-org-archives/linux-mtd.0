Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883DFCD0414
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jan 2026 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYgCeVEuaMGTDl9WJMJ6n+t9LBJf6WtyNwA6+hTIqtM=; b=UFP7YUrrCxJMS0
	XeHk1J4acfPTHOcZND4w9ozuuyck2pJ20ZlJF76dLZQykzVd0J/Rx7oGdDSGzERO0DyMBwSSiqf95
	/WOV0110S3Kk5dfqLV4lgU81chDVE77AYmBBWaArTvKQYNktT6lNp6UnjbHV+awkie6ycqT/IInrP
	uyEoaqsGYHZ8erQ4RjtWxYtWa2+ARRzcRibeBqOk0w7jYnpTQlw5pvXs7eWeDVfupRLene3IYKvDZ
	f6NY8+m5s0McjRNbSOOsH7RCbBaXavwj9jL1dx4/UIQKPqDYC2hF/900chmzR8AZlbMEuyBpWsfvc
	lWR+97HyqOdONWB/449g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsal-0000000C8lG-1nzi;
	Mon, 05 Jan 2026 21:58:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcsaj-0000000C8ks-0pDO
	for linux-mtd@lists.infradead.org;
	Mon, 05 Jan 2026 21:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77F9A406C1;
	Mon,  5 Jan 2026 21:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C931C116D0;
	Mon,  5 Jan 2026 21:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767650300;
	bh=iEw+W7eYpml0+ut1H65CELRyHgaqnq0z2gPAIWzmZ/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BQENB4zbTdWIHNQka6uoWjzsVoD8hGLZLzKiVCdNW9Lxo+pqcT7KTv9OxvQhULNbA
	 BK9IapF5VDdAEJ2/LFVQufoNksK48JMpZ3y69u18t6E4agT/TdMndWiDHbUxVhoxQq
	 jBvxlPH6JdmBCNcyEP72p3cpv13dydQeSJM4i3kPFINpvU0+ImNLdjtlszc5h3pnEk
	 xirHpXOuzDzKj7345LyomYxy+hzYoB3Ag2jtZWs/8LoTeEEfGWTRDvrx45K6FHSrEv
	 sAaUzGvSFx39F6FbHEtORGEKV0iuA7BunnD9zB4DbXJsZVFKEITUJc2MIO4uuF26Fm
	 YiHZdKSe3BFYA==
Date: Mon, 5 Jan 2026 15:58:19 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	Lucas Stach <dev@lynxeye.de>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Weinberger <richard@nod.at>, Stefan Agner <stefan@agner.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5] dt-bindings: mtd: nvidia,tegra20-nand: convert to DT
 schema
Message-ID: <176765029770.3496261.3882475061714506998.robh@kernel.org>
References: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260104-nvidia-nand-v5-1-0e147e416b4b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_135821_283335_19B116F8 
X-CRM114-Status: GOOD (  14.55  )
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


On Sun, 04 Jan 2026 11:23:04 +0000, Charan Pedumuru wrote:
> Convert NVIDIA Tegra NAND Flash Controller binding to YAML format.
> Changes during Conversion:
> - Define new properties `power-domains` and `operating-points-v2`
>   because the existing in tree DTS uses them.
> - Modify MAINTAINERS references to point the created YAML file.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
> Changes in v5:
> - Modify MAINTAINERS references to point YAML instead of TEXT file.
> - Link to v4: https://lore.kernel.org/r/20260103-nvidia-nand-v4-1-3156f46f3a5e@gmail.com
> 
> Changes in v4:
> - Changed the the reg property for nand child node.
> - Link to v3: https://lore.kernel.org/r/20251231-nvidia-nand-v3-1-2e67664d3674@gmail.com
> 
> Changes in v3:
> - Removed pattern properties for partition.
> - Used single quotes for nand string in pattern properties.
> - Modified maxItems value and added minItems to reg property under nand child node.
> - Link to v2: https://lore.kernel.org/r/20251229-nvidia-nand-v2-1-b697d9724b0b@gmail.com
> 
> Changes in v2:
> - Edited the commit description to match the updated changes.
> - Modified the description for the YAML.
> - Removed all the duplicated properties, defined a proper ref for both parent
>   and child nodes.
> - Removed unnecessary properties from the required following the old
>   text binding.
> - Link to v1: https://lore.kernel.org/r/20251030-nvidia-nand-v1-1-7614e1428292@gmail.com
> ---
>  .../bindings/mtd/nvidia,tegra20-nand.yaml          | 102 +++++++++++++++++++++
>  .../bindings/mtd/nvidia-tegra20-nand.txt           |  64 -------------
>  MAINTAINERS                                        |   2 +-
>  3 files changed, 103 insertions(+), 65 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
