Received: from mail-oi0-f67.google.com ([209.85.218.67])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dG6cv-0004IN-JW
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 16:37:43 +0000
Received: by mail-oi0-f67.google.com with SMTP id v80so2713159oie.2
 for <linux-mtd@lists.infradead.org>; Wed, 31 May 2017 09:37:21 -0700 (PDT)
Date: Wed, 31 May 2017 11:37:19 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V3 1/4] dt-bindings: mtd: make partitions doc a bit more
 generic
Message-ID: <20170531163719.k4k55eh27ap6isv3@rob-hp-laptop>
References: <20170523053022.3251-1-zajec5@gmail.com>
 <20170523053022.3251-2-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170523053022.3251-2-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 23, 2017 at 07:30:19AM +0200, Rafał Miłecki wrote:
> From: Brian Norris <computersforpeace@gmail.com>
> 
> Currently the only documented partitioning is "fixed-partitions" but
> there are more methods in use that we may want to support in the future.
> Mention them and make it clear Fixed Partitions are just a single case.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> This is based on Brian's patch:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
> 
> V1: Dropped "Section B: On-Flash Partition Tables" with Google's FMAP as this
>     patchset doesn't add that new parser.
> V2: Add "We currently only document a binding for fixed layouts." part
> V3: Extend description of 'partitions' subnode - thanks Florian
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 32 ++++++++++++++++++----
>  1 file changed, 26 insertions(+), 6 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
