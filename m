Received: from mail-yw0-f193.google.com ([209.85.161.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ff7kZ-0005Ah-R7
 for linux-mtd@lists.infradead.org; Mon, 16 Jul 2018 17:57:33 +0000
Received: by mail-yw0-f193.google.com with SMTP id j68-v6so14498174ywg.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2018 10:57:20 -0700 (PDT)
Date: Mon, 16 Jul 2018 11:57:17 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: explicitly document nesting
 partitions descriptions
Message-ID: <20180716175717.GA14348@rob-hp-laptop>
References: <20180713143221.8474-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180713143221.8474-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 13, 2018 at 04:32:20PM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Documentation was already saying that fixed and dynamic partitioning can
> be mixed but was missing a clear description and examples. This commit
> adds a proper documentation of how descriptions can be nested and how
> layouts can be mixed.
> 
> This addition is important for partitions that contain subpartitions.
> In such cases partitions have to be properly described in order to let
> system handle them correctly.
> 
> Depending on situation, nesting descriptions may provide more accurate
> logic/structure and/or allow mixing partitioning types (various
> "compatible" values).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: Rewrote example: I can include "brcm,trx" now as its Documentation
>     has been pushed into mtd git tree.
>     Updated commit message.
> ---
>  .../devicetree/bindings/mtd/partition.txt          | 46 ++++++++++++++++++++++
>  1 file changed, 46 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
