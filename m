Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAMvi-0003qO-G1
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 20:49:24 +0000
Date: Mon, 15 May 2017 22:48:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] mtd: nand: samsung: warn about un-parseable ECC info
Message-ID: <20170515224850.215a85a6@bbrezillon>
In-Reply-To: <20170502000455.13240-6-computersforpeace@gmail.com>
References: <20170502000455.13240-1-computersforpeace@gmail.com>
 <20170502000455.13240-6-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon,  1 May 2017 17:04:55 -0700
Brian Norris <computersforpeace@gmail.com> wrote:

> We don't handle cases larger than 7. We probably shouldn't pretend we
> know the ECC step size in this case, and it's probably also good to
> WARN() like we do in many other similar cases.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Fixes: 8fc82d456e40 ("mtd: nand: samsung: Retrieve ECC requirements from extended ID")
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Applied to nand/fixes.

Thanks,

Boris

> ---
> Compile tested only
> 
>  drivers/mtd/nand/nand_samsung.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
> index 9cfc4035a420..1e0755997762 100644
> --- a/drivers/mtd/nand/nand_samsung.c
> +++ b/drivers/mtd/nand/nand_samsung.c
> @@ -84,6 +84,9 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
>  			case 7:
>  				chip->ecc_strength_ds = 60;
>  				break;
> +			default:
> +				WARN(1, "Could not decode ECC info");
> +				chip->ecc_step_ds = 0;
>  			}
>  		}
>  	} else {
