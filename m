Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YLeQE-00035f-4v
 for linux-mtd@lists.infradead.org; Wed, 11 Feb 2015 21:02:10 +0000
Date: Wed, 11 Feb 2015 22:01:40 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] mtd: nand: sunxi: fix generic nand binding reference
Message-ID: <20150211220140.71eb9804@bbrezillon>
In-Reply-To: <302c93d229b98702db0c96bca0216a3c948fe092.1423666867.git.baruch@tkos.co.il>
References: <302c93d229b98702db0c96bca0216a3c948fe092.1423666867.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 11 Feb 2015 17:01:07 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  Documentation/devicetree/bindings/mtd/sunxi-nand.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> index 0273adb8638c..086d6f44c4b9 100644
> --- a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
> @@ -21,7 +21,7 @@ Optional properties:
>  - nand-ecc-mode : one of the supported ECC modes ("hw", "hw_syndrome", "soft",
>    "soft_bch" or "none")
>  
> -see Documentation/devicetree/mtd/nand.txt for generic bindings.
> +see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
>  
>  
>  Examples:



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
