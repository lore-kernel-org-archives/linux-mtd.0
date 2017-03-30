Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctjTB-0008LO-06
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 23:27:10 +0000
Received: by mail-wr0-x243.google.com with SMTP id k6so14821870wre.3
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 16:26:48 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: mtd: document linux,part-probe property
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
 <20170330215332.32699-2-zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <74e3a663-2431-9b86-9d90-7f2fe6ce900f@gmail.com>
Date: Fri, 31 Mar 2017 01:26:45 +0200
MIME-Version: 1.0
In-Reply-To: <20170330215332.32699-2-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/30/2017 11:53 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Support for this property has been introduced in 2010 with commit
> 9d5da3a9b849 ("mtd: extend physmap_of to let the device tree specify the
> parition probe") but it was never documented. Fix this by adding a
> proper description and example.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
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

Why don't you just have partition not within partition node ? Then you
won't need this nonsense ...

>  Example:
>  
>  	flash@0 {
>  		label = "System-firmware";
> +		linux,part-probe = "cmdlinepart", "ofpart";
>  
>  		/* flash type specific properties */
>  	};
> 


-- 
Best regards,
Marek Vasut
