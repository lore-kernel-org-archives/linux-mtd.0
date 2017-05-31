Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG7lu-0006Im-3h
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 17:51:03 +0000
Received: by mail-oi0-f68.google.com with SMTP id h4so3042664oib.0
 for <linux-mtd@lists.infradead.org>; Wed, 31 May 2017 10:50:41 -0700 (PDT)
Date: Wed, 31 May 2017 12:50:40 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: linux-mtd@lists.infradead.org, andrew@lunn.ch,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] mtd: mchp23k256: Add OF device ID table
Message-ID: <20170531175040.n4eerwek4isjfg3m@rob-hp-laptop>
References: <20170524234916.16181-1-chris.packham@alliedtelesis.co.nz>
 <20170524234916.16181-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170524234916.16181-2-chris.packham@alliedtelesis.co.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 25, 2017 at 11:49:12AM +1200, Chris Packham wrote:
> This allows registering of this device via a Device Tree.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Changes in v2:
> - collect review/test from Andrew
> Changes in v3:
> - None
> Changes in v4:
> - None
> 
>  .../devicetree/bindings/mtd/microchip,mchp23k256.txt   | 18 ++++++++++++++++++
>  drivers/mtd/devices/mchp23k256.c                       |  8 ++++++++
>  2 files changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp23k256.txt

Acked-by: Rob Herring <robh@kernel.org>
