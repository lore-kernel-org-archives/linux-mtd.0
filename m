Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aufna-00034z-1E
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 12:39:34 +0000
Date: Mon, 25 Apr 2016 07:39:07 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] mtd: nand: add support for "nand-ecc-algo" DT property
Message-ID: <20160425123907.GA26373@rob-hp-laptop>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 22, 2016 at 01:23:13PM +0200, Rafał Miłecki wrote:
> So far it was only possible to specify ECC algorithm using "soft" and
> "soft_bch" values of nand-ecc-mode prop. There wasn't a way to specify
> it for a hardware ECC mode.
> 
> Now that we have independent field in NAND subsystem for storing info
> about ECC algorithm we may also add support for this new DT property.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/nand.txt |  2 ++
>  drivers/mtd/nand/nand_base.c                   | 20 +++++++++++++-------
>  2 files changed, 15 insertions(+), 7 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
