Received: from mail-ot0-f195.google.com ([74.125.82.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0aXb-0007OW-Je
 for linux-mtd@lists.infradead.org; Mon, 26 Mar 2018 22:24:37 +0000
Received: by mail-ot0-f195.google.com with SMTP id o9-v6so4411554otj.5
 for <linux-mtd@lists.infradead.org>; Mon, 26 Mar 2018 15:24:25 -0700 (PDT)
Date: Mon, 26 Mar 2018 17:24:23 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROME mode
Message-ID: <20180326222423.ilj3dv6jxkwtulev@rob-hp-laptop>
References: <20180321083618.18355-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180321083618.18355-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 21, 2018 at 09:36:18AM +0100, Boris Brezillon wrote:
> This mode is not used by any existing setup and should not be used
> because it overrides the BBMs. Let's just remove it before someone
> starts using it.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/sunxi-nand.txt         |   4 +-

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/sunxi_nand.c                  | 155 +++------------------
>  2 files changed, 22 insertions(+), 137 deletions(-)
