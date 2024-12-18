Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922CE77187
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlM3zF71VR4WSia0XJrliPq7ybxw6dhKTQoBaMJX/8c=; b=lp74YDIoA/ZCrM
	U9hq2CSKWnYRh0xc0pgLhafX9UuZLrbtKQvHptCIUvThRbO26NbonwmZ3WwqbQ8CoEc0pWU9V1/nl
	mDePv2pFQmNxb0Xd6KAEN72R6uqvUe3l7QzGMSnzZU1jkKkxdrOdAdBE9EApIKP0FB3AvlBApxq1e
	OWo3w31N0sae81TmTlhgVQc5Mq98ZSxhMjAbfyyrq9sUZRF2cfKyPq50j10igwNL/LbSl3pGMkeNy
	JzLJQOGlgr1YvnM/JKWBoHuNJY9ryLty2mPxln/HxSZyK17P1Ybx25VD2+9DrdWMJw5suULJP/Ytr
	X730C8X0OnehP+363RIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpvs-0000000FzzT-0EVK;
	Wed, 18 Dec 2024 09:01:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNpvp-0000000Fzyl-3vMO
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 09:01:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D6C6C5C6086;
	Wed, 18 Dec 2024 09:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DEBC4CECE;
	Wed, 18 Dec 2024 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734512484;
	bh=UkhrEcQSxGpaSlOo+Yxh6CLOUTDPmvf5xbmljZZ9rKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZDImDzBuyS62sQVCVCGL9NSn5ZxxhwDnYQETEWRx1hVBVH1b8P3RATQ9CcKUF6pw
	 TAWvHC7kpuRgQ7gol2gP9GrVC371fasHgomdpUDx2ZLgq9MfrBk1hjpwYyTlDUk4Jg
	 f+eKfYkD1PdlAZ8y+Tkpe+iMRcoI6XTuE5znv4YiL8sdI+MdgcNVH719qYkuvW7b2H
	 qJqVy2WH1SK26gWnMIMr/aQOO6NmT9WwYqLTSgBQfLATRVPwydBSE0KnSvJsXClfJi
	 edmndmMTte/G+htgFvYdR2DFL+NyDoxNKzK+SniI91YyedD6rT7PwlIZCCgD82B8gZ
	 KfxW8FwfM26NQ==
Date: Wed, 18 Dec 2024 10:01:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v11 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
Message-ID: <x5hka7t2sxeac6nesr5r47s5bmbbiksyvky5hqoelkvaxcuhiy@7fsxv2y7deag>
References: <20241217-loongson1-nand-v11-0-b692c58988bb@gmail.com>
 <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217-loongson1-nand-v11-1-b692c58988bb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_010126_014883_963A0B5B 
X-CRM114-Status: UNSURE (   6.33  )
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

On Tue, Dec 17, 2024 at 06:16:49PM +0800, Keguang Zhang wrote:
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - loongson,ls1b-nand-controller
> +          - loongson,ls1c-nand-controller
> +      - items:
> +          - enum:
> +              - loongson,ls1a-nand-controller
> +          - const: loongson,ls1b-nand-controller
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: nand
> +      - const: nand-dma

Are you sure these are separate address spaces?
<0x1fe78000 0x24>, <0x1fe78040 0x4>
spacing/distance of !4 words...

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
