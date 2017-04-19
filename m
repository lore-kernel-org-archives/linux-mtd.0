Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0wLx-000796-I9
 for linux-mtd@lists.infradead.org; Wed, 19 Apr 2017 20:37:31 +0000
Received: by mail-io0-x243.google.com with SMTP id x86so7200935ioe.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 13:37:09 -0700 (PDT)
Date: Wed, 19 Apr 2017 13:37:05 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V5 1/3] dt-bindings: mtd: document linux,part-probe
 property
Message-ID: <20170419203705.GF20555@google.com>
References: <20170417182853.24281-1-zajec5@gmail.com>
 <20170417194746.10697-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170417194746.10697-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, Apr 17, 2017 at 09:47:44PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Support for this property has been introduced in 2010 with commit
> 9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
> parition probe") but it was never documented. Fix this by adding a
> proper description and example.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/mtd/common.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
> index fc068b923d7a..1ada70e718b2 100644
> --- a/Documentation/devicetree/bindings/mtd/common.txt
> +++ b/Documentation/devicetree/bindings/mtd/common.txt
> @@ -6,10 +6,17 @@ Optional properties:
>    controller based name) in order to ease flash device identification
>    and/or describe what they are used for.
>  
> +- linux,part-probe: if present, this property should contain a list of strings
> +  with partition probes to be used for the flash device. A role of partition
> +  probe (parser) is to read/construct partition table and register found
> +  partitions. Getting partition table may be platform or device specific so
> +  various devices may use various Linux drivers for this purpose.

Have you reviewed the old threads about this? I thought I already
discouraged extending this binding to be generic. Particularly, we do
*not* want to codify things like 'linux,part-probe = "bcm47xxpart"',
which doesn't follow any accepted practice about naming. And you've also
failed to document any actual strings to put here, which hides the fact
that you're opening a can of worms.

Piece of a previous thread:
http://lists.infradead.org/pipermail/linux-mtd/2015-October/062613.html
[PATCH] mtd: document linux-specific partition parser DT binding

I attempted to resolve that here, but never made time to address the few
not-so-constructive comments I received:

https://mail-archive.com/linux-kernel@vger.kernel.org/msg1035539.html
[RFC PATCH 0/7] mtd: partitions: add of_match_table support

I'd still prefer that approach to supporting this shortcut for all MTDs.

Brian

> +
>  Example:
>  
>  	flash@0 {
>  		label = "System-firmware";
> +		linux,part-probe = "cmdlinepart", "ofpart";
>  
>  		/* flash type specific properties */
>  	};
> -- 
> 2.11.0
> 
