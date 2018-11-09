Received: from kirsty.vergenet.net ([202.4.237.240])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gL3gI-0001Ku-RH
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 10:06:28 +0000
Date: Fri, 9 Nov 2018 11:06:07 +0100
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: iwg23s-sbc: Add QSPI flash support
Message-ID: <20181109100607.3axbfrfizs5dqtxk@verge.net.au>
References: <1541696684-21235-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541696684-21235-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541696684-21235-4-git-send-email-fabrizio.castro@bp.renesas.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 08, 2018 at 05:04:43PM +0000, Fabrizio Castro wrote:
> This commit adds QSPI flash support to the iwg23s board specific
> device tree.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
