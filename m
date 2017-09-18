Received: from mail-io0-f195.google.com ([209.85.223.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1du3Eb-0000Ky-Km
 for linux-mtd@lists.infradead.org; Mon, 18 Sep 2017 21:05:43 +0000
Received: by mail-io0-f195.google.com with SMTP id g32so2469467ioj.1
 for <linux-mtd@lists.infradead.org>; Mon, 18 Sep 2017 14:05:21 -0700 (PDT)
Date: Mon, 18 Sep 2017 16:05:19 -0500
From: Rob Herring <robh@kernel.org>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] doc: dt: mtd: Add sst25vf016b to the list of supported
 chip names
Message-ID: <20170918210519.jz5gffcvjefcujxn@rob-hp-laptop>
References: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1505118928-3987-1-git-send-email-fabrizio.castro@bp.renesas.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 11, 2017 at 09:35:28AM +0100, Fabrizio Castro wrote:
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

"dt-bindings: mtd: " for the subject prefix and you need a changelog.

> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt | 1 +
>  1 file changed, 1 insertion(+)

With that fixed,

Acked-by: Rob Herring <robh@kernel.org>
