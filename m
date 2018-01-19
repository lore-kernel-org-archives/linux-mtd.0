Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eceT8-0002BR-RG
 for linux-mtd@lists.infradead.org; Fri, 19 Jan 2018 21:45:04 +0000
Received: by mail-oi0-f67.google.com with SMTP id t8so2102857oie.6
 for <linux-mtd@lists.infradead.org>; Fri, 19 Jan 2018 13:44:52 -0800 (PST)
Date: Fri, 19 Jan 2018 15:44:50 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: document Broadcom's BCM47xx
 partitions
Message-ID: <20180119214450.vhctphu5d4kagwkv@rob-hp-laptop>
References: <20180112093354.17593-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180112093354.17593-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 12, 2018 at 10:33:53AM +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom based home router devices use partitions which have to be
> discovered in a specific non-standard way. As there is no partition
> table this commit adds and describes a new custom binding.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 46 +++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
> index 36f3b769a626..b201d497b618 100644
> --- a/Documentation/devicetree/bindings/mtd/partition.txt
> +++ b/Documentation/devicetree/bindings/mtd/partition.txt
> @@ -14,8 +14,6 @@ method is used for a given flash device. To describe the method there should be
>  a subnode of the flash device that is named 'partitions'. It must have a
>  'compatible' property, which is used to identify the method to use.
>  
> -We currently only document a binding for fixed layouts.
> -
>  
>  Fixed Partitions
>  ================
> @@ -109,3 +107,47 @@ flash@2 {
>  		};
>  	};
>  };
> +
> +
> +Broadcom BCM47xx Partitions
> +===========================
> +
> +Broadcom is one of hardware manufacturers providing SoCs (BCM47xx) used in
> +home routers. Their BCM947xx boards using CFE bootloader have several partitions
> +without any on-flash partition table. On some devices their sizes and/or
> +meanings can also vary so fixed partitioning can't be used.
> +
> +Discovering partitions on these devices is possible thanks to having a special
> +header and/or magic signature at the beginning of each of them. They are also
> +block aligned which is important for determinig a size.
> +
> +Most of partitions use ASCII text based magic for determining a type. More
> +complex partitions (like TRX with its HDR0 magic) may include extra header
> +containing some details, including a length.
> +
> +A list of supported partitions includes:
> +1) Bootloader with Broadcom's CFE (Common Firmware Environment)
> +2) NVRAM with configuration/calibration data
> +3) Device manufacturer's data with some default values (e.g. SSIDs)
> +4) TRX firmware container which can hold up to 4 subpartitions
> +5) Backup TRX firmware used after failed upgrade
> +
> +As mentioned earlier, role of some partitions may depend on extra configuration.
> +For example both: main firmware and backup firmware use the same TRX format with
> +the same header. To distinguish currently used firmware a CFE's environment
> +variable "bootpartition" is used.
> +
> +
> +Devices using Broadcom partitions described above should should have flash node
> +with a subnode named "partitions" using following properties:
> +
> +Required properties:
> +- compatible : (required) must be "brcm,bcm947xx-cfe-partitions"

So you can't discover you have CFE partitions, but you can discover 
everything else like where partitions start? 

Why doesn't the kernel just probe for the partition table?

Rob
