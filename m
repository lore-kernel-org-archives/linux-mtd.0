Received: from mail.kernel.org ([198.145.29.136])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajSsa-0002pd-EN
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2016 14:38:25 +0000
Date: Fri, 25 Mar 2016 09:37:59 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@opensource.altera.com>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Kumar Gala <galak@codeaurora.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] mtd: nand: denali: allow to override max_banks from DT
 property
Message-ID: <20160325143759.GA24596@rob-hp-laptop>
References: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1458822277-31428-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 24, 2016 at 09:24:37PM +0900, Masahiro Yamada wrote:
> Commit 271707b1d817 ("mtd: nand: denali: max_banks calculation
> changed in revision 5.1") supported the new encoding of the "n_banks"
> bits of the "features" register, but there is an unfortunate case
> that is not covered by that commit.
> 
> Panasonic (its System LSI division is now Socionext) bought several
> versions of this IP.  The IP released for Panasonic around Feb. 2012
> is revision 5 and uses the old encoding for n_banks (2 << n_banks).
> While the one released around Nov. 2012 is also revision 5, but it
> uses the new encoding (1 << n_banks).
> 
> The revision register cannot distinguish these two incompatible
> hardware.  I guess this IP series is not well-organized.  I could not
> find any alternative but giving max_banks from DT property.
> 
> This commit works around the problem by allowing DT to set the
> max_banks forcibly.  Of course, this DT property can be optional if
> the auto detection based on the hardware registers works well.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt | 4 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/denali.c                             | 3 ++-
>  drivers/mtd/nand/denali_dt.c                          | 3 +++
>  3 files changed, 9 insertions(+), 1 deletion(-)
