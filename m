Received: from mail-db5eur01on0110.outbound.protection.outlook.com
 ([104.47.2.110] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehFvI-00044a-G5
 for linux-mtd@lists.infradead.org; Thu, 01 Feb 2018 14:33:15 +0000
Subject: Re: [PATCH V9 0/4] mtd: read partitions compatible prop for "ofpart"
 type
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Frank Rowand
 <frowand.list@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20180130201059.4424-1-zajec5@gmail.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <cfcb0cd2-8c9e-5834-4191-a1e82dc6dbdf@axentia.se>
Date: Thu, 1 Feb 2018 15:32:45 +0100
MIME-Version: 1.0
In-Reply-To: <20180130201059.4424-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-01-30 21:10, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This patchset provides a proper support for flash device DT node with
> "partitions" subnode using "compatible" property. It's already
> documented in the: Documentation/devicetree/bindings/mtd/partition.txt
> 
> We believed a previous version 8 was ready to go, but soon after landing
> in the linux-next we got a regression report from Peter.

I retested these four patches on-top of 4.15, and results are good.

With a faulty partition layout in the dtb, the old command-line layout
wins and things keep working, and with a good partition layout in the
dtb I can remove a bunch of command-line clutter.

Tested-by: Peter Rosin <peda@axentia.se>

No testing of the individual patches though, just the end result...

Cheers,
peda

> This version takes a safe path by:
> 1) Respecting parsers order as specified in the default/driver-provided
>    list.
> 2) Looking at "compatible" property only when "ofpart" type gets
>    speciied.
> 
> I double-checked the code and cannot think of any regression this could
> cause. I also hope this design (roughly discussed with Boris) can be
> acceptable for the mtd subsystem.
> 
> This is of course 4.17 material at best.
> 
> Brian Norris (1):
>   mtd: partitions: add of_match_table parser matching
> 
> Rafał Miłecki (3):
>   mtd: partitions: add special treating for the "ofpart" parser type
>   mtd: rename "ofpart" parser to "fixed-partitions" as it fits it better
>   mtd: ofpart: add of_match_table with "fixed-partitions"
> 
>  drivers/mtd/mtdpart.c          | 116 +++++++++++++++++++++++++++++++++++++----
>  drivers/mtd/ofpart.c           |  18 +++++--
>  include/linux/mtd/partitions.h |   1 +
>  3 files changed, 121 insertions(+), 14 deletions(-)
> 
