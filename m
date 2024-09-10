Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B74EE01EB
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2024 22:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQ0ZNTFm3ScEAG08ScfncvFq4Pj5NqkqaDMNtm4vPyk=; b=r9881a5cvVi/gA
	NO5rDkS6ofTGyLdr335cJwC3prjFKfi3SsDkbbOAvNrLwHNY6YRwC2nuWSy7H/MISvDuCRLZnsoz2
	gJBeyHvPRls1LdwuISvG4xVHbH5bqy1exnH4Zxjnx3ZVs4NSQK8qDjRvtagyvQheLMYSNUvmrZKCV
	uchN36itfTxqy7xYIB5q68IfTexwuUbRHz+xkAhQgIlr5iT4oQLieO0jDkoqfk2yBeIGvCqoeMQOm
	aVnUVdPxpg4ibImIoEDEH9VDbjFaD6pTg67jZ9QARsYDTGjwfd+l+e70hZdnZ3MoSOcmCzdvGUMdM
	Q0kg1aKwPNFd5JNaSXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so9Eb-00000007JDa-0Npe;
	Tue, 10 Sep 2024 22:21:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so9DW-00000007Itr-06dU;
	Tue, 10 Sep 2024 22:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABD535C054A;
	Tue, 10 Sep 2024 22:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA255C4CEC3;
	Tue, 10 Sep 2024 22:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726006808;
	bh=48YI4pbgmYlCiPT43kBVwkkPa58PT2DK2GN26WL06Zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bXvC/AMdALgzeciEYcNb3c7MPlwl1Ldpk8m3EmiuiaLfyLLWLC4BnWS4SIe+MdZa6
	 6mZMlroCrRgIPDG8EyJyzVb39LE+5OAes1gED325p1M9hGm7e8hNTrWk1oAxCuxmy9
	 iEVZo/7+4ouPBj6jySGz6RzsogWcFaGmQrpjVQchYuIJoCEY5cSdDgGO/udItb1/3t
	 MqPWOsC7+j7ZUEm8A9BmF0Es+nKRaVpzowcRgRqJMhsA0rYSK6BUJoTclK4mXQN8iV
	 dPdtSGzTqhto6BkXQMoVkYE3eQs122rcEq6o1b5I1D5+KbbY3Ry5QIsFY3f/9nVqAJ
	 /zH+eyi3rKtdA==
Date: Tue, 10 Sep 2024 17:20:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Li Zetao <lizetao1@huawei.com>, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, alsa-devel@alsa-project.org,
	Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Chancel Liu <chancel.liu@nxp.com>,
	Russell King <linux@armlinux.org.uk>, linux-sound@vger.kernel.org,
	Vladimir Zapolskiy <vz@mleia.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, Arnd Bergmann <arnd@arndb.de>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [Patch v5 02/12] dt-bindings: dma: Add lpc32xx DMA mux binding
Message-ID: <172600677256.860315.3249804427139743181.robh@kernel.org>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
 <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627150046.258795-3-piotr.wojtaszczyk@timesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_152010_151245_DC26FAB4 
X-CRM114-Status: GOOD (  12.52  )
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

On Thu, 27 Jun 2024 17:00:20 +0200, Piotr Wojtaszczyk wrote:
> LPC32XX SoCs use pl080 dma controller which have few request signals
> multiplexed between peripherals. This binding describes how devices can
> use the multiplexed request signals.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v5:
> - Corrected property order
> - Added maxItems to properties
> - Fixed example
> - Removed "N:: from the MAINTAINERS entry
> - Added Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com> to LPC32XX maintainers
> 
> Changes for v4:
> - This patch is new in v4
> 
>  .../bindings/dma/nxp,lpc3220-dmamux.yaml      | 49 +++++++++++++++++++
>  MAINTAINERS                                   |  9 ++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nxp,lpc3220-dmamux.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
