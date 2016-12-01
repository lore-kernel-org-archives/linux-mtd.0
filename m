Received: from mail-yw0-f196.google.com ([209.85.161.196])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCTl3-0003gr-N6
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 15:58:50 +0000
Received: by mail-yw0-f196.google.com with SMTP id s68so18992744ywg.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 07:58:29 -0800 (PST)
Date: Thu, 1 Dec 2016 09:58:26 -0600
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
Subject: Re: [PATCH 33/39] mtd: nand: denali: support 1024 byte ECC step size
Message-ID: <20161201155826.azc7i3bnbxwb5ro3@rob-hp-laptop>
References: <1480183585-592-1-git-send-email-yamada.masahiro@socionext.com>
 <1480183585-592-34-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480183585-592-34-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 27, 2016 at 03:06:19AM +0900, Masahiro Yamada wrote:
> This driver was originally written for the Intel MRST platform with
> several platform specific parameters hard-coded.  Another thing we
> need to fix is the hard-coded ECC step size.  Currently, it is
> defined as follows:
> 
>   #define ECC_SECTOR_SIZE 512
> 
> (somehow, it is defined in both denali.c and denali.h)
> 
> This must be avoided because the Denali IP supports 1024 byte ECC
> size as well.  Add a new flag DENALI_CAPS_ECC_SIZE_1024. If it is
> specified, ecc.size is set to 1024, otherwise set to 512.
> 
> We can use "nand-ecc-step-size" DT property to override the ecc.size
> if we want, but this capability flag can provide the reasonable
> default because it is associated with the DT compatible strings.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  4 ++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mtd/nand/denali.c                          | 26 +++++++++++-----------
>  drivers/mtd/nand/denali.h                          |  3 +--
>  3 files changed, 18 insertions(+), 15 deletions(-)
