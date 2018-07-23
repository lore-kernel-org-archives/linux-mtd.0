Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fhcvx-0007Gu-CF
 for linux-mtd@lists.infradead.org; Mon, 23 Jul 2018 15:39:38 +0000
Date: Mon, 23 Jul 2018 09:39:24 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: linux-mtd@lists.infradead.org, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, H Hartley Sweeten
 <hsweeten@visionengravers.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Boris
 Brezillon <boris.brezillon@bootlin.com>, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH] mtd: nand: fix spelling in driver api documentation
Message-ID: <20180723093924.04af0e2f@lwn.net>
In-Reply-To: <20180720075334.24254-1-marcel@ziswiler.com>
References: <20180720075334.24254-1-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 20 Jul 2018 09:53:33 +0200
Marcel Ziswiler <marcel@ziswiler.com> wrote:

> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes some spelling mistakes.

So I hate to complain about a documentation improvement, but...

> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
>  Documentation/driver-api/mtdnand.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
> index dcd63599f700..c55a6034c397 100644
> --- a/Documentation/driver-api/mtdnand.rst
> +++ b/Documentation/driver-api/mtdnand.rst
> @@ -374,7 +374,7 @@ The nand driver supports three different types of hardware ECC.
>  
>  -  NAND_ECC_HW8_512
>  
> -   Hardware ECC generator providing 6 bytes ECC per 512 byte.
> +   Hardware ECC generator providing 8 bytes ECC per 512 byte.

That's not a spelling mistake, that's a factual change.  I'll apply the
patch since it appears to be correct, but will be tweaking the changelog.

Thanks,

jon
