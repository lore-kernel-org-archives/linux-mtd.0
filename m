Received: from mail-yb0-f193.google.com ([209.85.213.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLB7n-0006Yc-6y
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 17:31:04 +0000
Received: by mail-yb0-f193.google.com with SMTP id v12-v6so6613843ybl.10
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2018 10:30:52 -0700 (PDT)
Date: Tue, 22 May 2018 12:30:50 -0500
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
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: document Broadcom's BCM47xx
 partitions
Message-ID: <20180522173050.GA9245@rob-hp-laptop>
References: <20180509081729.28347-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180509081729.28347-1-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 09, 2018 at 10:17:28AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Broadcom based home router devices use partitions which have to be
> discovered in a specific way. They are not fixed and there is not any
> standard partition table. This commit adds and describes a new custom
> binding for such devices.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> This commit documents a new binding for describing partitions. Just as a
> reminder: we agreed to use "compatible" for that purpose to avoid
> /guessing/. There are too many cases, devices and /formats/ to just
> blindly try every possible parser.
> 
> This was e.g. described by Boris in his patchset 2+ years ago:
> [RFC PATCH 0/7] mtd: partitions: add of_match_table support
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064076.html
> 
> Quote:
> >  (2) we can't just scan for all supported parsers (like the block system does), since
> >      there is a wide diversity of "formats" (no standardization), and it is not
> >      always safe or efficient to attempt to do so, particularly since many of
> >      them allow their data structures to be placed anywhere on the flash, and
> >      so require scanning the entire flash device to find them.
> 
> I believe this solution was also acked back then by Rob:
> [RFC PATCH 3/7] doc: dt: mtd: partition: add on-flash format binding
> http://lists.infradead.org/pipermail/linux-mtd/2015-December/064100.html
> 
> V2: Move documentation to the new brcm,bcm947xx-cfe-partitions.txt file
>     as suggested by Rob (we don't want to bloat partition.txt).
>     Slightly update commit message.
> ---
>  .../devicetree/bindings/mtd/partition.txt          |  2 +-
>  .../partitions/brcm,bcm947xx-cfe-partitions.txt    | 42 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/brcm,bcm947xx-cfe-partitions.txt

Reviewed-by: Rob Herring <robh@kernel.org>
