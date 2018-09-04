Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxBSb-0002Y1-5Z
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 13:33:42 +0000
Received: by mail-oi0-f65.google.com with SMTP id l82-v6so6630999oih.11
 for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2018 06:33:26 -0700 (PDT)
Message-ID: <5b8e89a4.1c69fb81.48305.1677@mx.google.com>
Date: Tue, 04 Sep 2018 08:33:23 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mtd: describe the simple BCM963XX NOR
 flash layout
References: <20180828111944.5956-1-jonas.gorski@gmail.com>
 <20180828111944.5956-2-jonas.gorski@gmail.com>
In-Reply-To: <20180828111944.5956-2-jonas.gorski@gmail.com>
Cc: linux-mtd@lists.infradead.org, 	devicetree@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, ,
 Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Aug 2018 13:19:40 +0200, Jonas Gorski wrote:
> Add binding documentation for the standard CFE based BCM963XX flash
> layout, found in most devices using a BCM63XX SoC with NOR flash.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../brcm,bcm963xx-cfe-nor-partitions.txt           | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm963xx-cfe-nor-partitions.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
