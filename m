Received: from mail-yb0-f194.google.com ([209.85.213.194])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTm5-0004mz-Kf
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 15:59:54 +0000
Received: by mail-yb0-f194.google.com with SMTP id v78so3857174ybe.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 07:59:30 -0800 (PST)
Date: Thu, 1 Dec 2016 09:59:27 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 37/39] mtd: nand: denali: support "nand-ecc-strength" DT
 property
Message-ID: <20161201155927.izgkiuniv5h6mu7h@rob-hp-laptop>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-38-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480183585-592-38-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 27, 2016 at 03:06:23AM +0900, Masahiro Yamada wrote:
> Historically, this driver tried to choose as big ECC strength as
> possible, but it would be reasonable to allow DT to set a particular
> ECC strength with "nand-ecc-strength" property.
> 
> Going forward, DT platforms should specify "nand-ecc-strength" or
> "nand-ecc-maximize" to show the ECC strength strategy explicitly.
> 
> If nothing is specified in DT, "nand-ecc-maximize" is implied since
> this was the original behavior.  It applies to PCI platforms too.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  5 ++++

I'd prefer all the DT changes be in 1 patch, but

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/denali.c                          | 27 +++++++++++++++++++++-
>  drivers/mtd/nand/denali_pci.c                      |  2 ++
>  3 files changed, 33 insertions(+), 1 deletion(-)
