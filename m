Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFO2p-0006vY-Nk
 for linux-mtd@lists.infradead.org; Wed, 24 Oct 2018 18:38:17 +0000
Received: by mail-oi1-f193.google.com with SMTP id j68-v6so4934262oib.7
 for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2018 11:38:04 -0700 (PDT)
Date: Wed, 24 Oct 2018 13:38:02 -0500
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
 Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 13/15] dt-binding: mtd: physmap: Document the
 addr-gpios property
Message-ID: <20181024183802.GA20794@bogus>
References: <20181019074908.13226-1-boris.brezillon@bootlin.com>
 <20181019074908.13226-14-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181019074908.13226-14-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 19 Oct 2018 09:49:06 +0200, Boris Brezillon wrote:
> From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> 
> Add documentation for the addr-gpios. This extension to the physmap
> binding allow creating flash devices that are paged using GPIOs.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v2:
> - Drop Rob's R-b (waiting for a second review)
> ---
>  Documentation/devicetree/bindings/mtd/mtd-physmap.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
