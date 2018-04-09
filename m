Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5bh7-0005jT-Dm
 for linux-mtd@lists.infradead.org; Mon, 09 Apr 2018 18:39:10 +0000
Received: by mail-oi0-f68.google.com with SMTP id e123-v6so8612456oih.13
 for <linux-mtd@lists.infradead.org>; Mon, 09 Apr 2018 11:38:58 -0700 (PDT)
Date: Mon, 9 Apr 2018 13:38:56 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: sunxi: Remove support for GPIO-based
 Ready/Busy polling
Message-ID: <20180409183856.sq3qk5lqkquutrem@rob-hp-laptop>
References: <20180327070614.3288-1-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180327070614.3288-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 27, 2018 at 09:06:14AM +0200, Boris Brezillon wrote:
> None of the existing platforms connect the R/B pin to a GPIO (they all
> use one of the dedicated R/B pin).
> Anyway, if we ever get short of native R/B pins, it's probably better
> to fallback to STATUS reg polling than trying to poll a GPIO.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/mtd/sunxi-nand.txt         |  2 -

Reviewed-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/raw/sunxi_nand.c                  | 91 ++++------------------
>  2 files changed, 15 insertions(+), 78 deletions(-)
