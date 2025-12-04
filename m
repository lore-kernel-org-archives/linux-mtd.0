Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E0BD2A545
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Dec 2025 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LWtc0eB5drHlHHGHSD/T8MMIxzLE9LkNYfmNft86YU=; b=3Eho/7/Kt/cs3B
	Cx9IjiEoAnLEbHJFQTP7LNHY4yFXzonXw9zgHTpKpjTLlOqqQ7hLZIlQqtVDSMfsn5mF2wdozBIoa
	fm8EGc4j2zZY8lx1HQ7FYVKlwnUzj//j13q0qCl1N7vlCyVGH2d/FrlnAzC9oUpnNMH5YyyxBOnd8
	NOYC3L+YWF5OsJhp+qF8Rl42hrOlYL2AOaF+QDLsUDHMihro2hYBzKH9YFwS5biUvHPnJHhBLwFBR
	9PCVrZ2nHncV4ZOy8G4psSe8nfThldSVwsyf4wbUjXovH/puay/0wAL/kh0LMITauco5KEAdTGl8R
	qF8MSqWJzKvZQhsMQ8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRH0Q-00000008gTb-49Jt;
	Thu, 04 Dec 2025 21:36:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRH0Q-00000008gTI-0stq
	for linux-mtd@lists.infradead.org;
	Thu, 04 Dec 2025 21:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A02EB60200;
	Thu,  4 Dec 2025 21:36:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACB7C4CEFB;
	Thu,  4 Dec 2025 21:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764884213;
	bh=+4kEbHTDl/a+jM3AYdv1IGNG5rDWJIRvBYh0wo1LCrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cab9U9dZqYBpk8WQf9DBBGQkLmo65iDOOtsc9lCNtaiUDMaB+Z8T0HHUcCfXLw+cL
	 B3w3PwdS8wHo9UiiA02/zZBMbN+3+PoTfTczCigy/j2iik1W0XPr9WbWh2TWdtbpMA
	 MnoZvlrgNBgiNgmgumKfBwbcrwpsQ4cLpp0rOc8ZmFVQvbOpentpdiBiPJsRewWwdx
	 pQKvD3BSQn3eivZklZRo2M7F2fO/apZXGpreM6f3LBwTYMNjcG7xpaNGOdxJYO4uy/
	 y/5joaeb57tT63X83cBP+tuizLz2JTkot+D9FXL2aANaBnvOmKjA23LeYwiI3QBy/K
	 p0MasW8FSVTmg==
Date: Thu, 4 Dec 2025 15:36:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Cc: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	dmaengine@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: dma: snps,dw-axi-dmac: add
 dma-coherent property
Message-ID: <176488420978.2206697.11201292177123636920.robh@kernel.org>
References: <cover.1764717960.git.khairul.anuar.romli@altera.com>
 <025381792a014844a1e7121f11836ab1010cba89.1764717960.git.khairul.anuar.romli@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <025381792a014844a1e7121f11836ab1010cba89.1764717960.git.khairul.anuar.romli@altera.com>
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


On Wed, 03 Dec 2025 07:47:34 +0800, Khairul Anuar Romli wrote:
> The Synopsys DesignWare AXI DMA Controller on Agilex5, the controller
> operates on a cache-coherent AXI interface, where DMA transactions are
> automatically kept coherent with the CPU caches. In previous generations
> SoC (Stratix10 and Agilex) the interconnect was non-coherent, hence there
> is no need for dma-coherent property to be presence. In Agilex 5, the
> architecture has changed. It  introduced a coherent interconnect that
> supports cache-coherent DMA.
> 
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> ---
> Changes in v2:
>         - Rephrase commit message to describe why the property is needed now
>           and was not needed previously.
>         - Remove redundant statement.
> ---
>  Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
