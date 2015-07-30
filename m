Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKiC3-0007S0-Cs
 for linux-mtd@lists.infradead.org; Thu, 30 Jul 2015 07:23:55 +0000
Date: Thu, 30 Jul 2015 09:23:33 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sunxi@googlegroups.com
Subject: Re: [PATCH 3/4] mtd: nand: nand_get_flash_type: Print detected ECC
 strength and size
Message-ID: <20150730092333.59705873@bbrezillon>
In-Reply-To: <1438192434-18363-3-git-send-email-hdegoede@redhat.com>
References: <1438192434-18363-1-git-send-email-hdegoede@redhat.com>
 <1438192434-18363-3-git-send-email-hdegoede@redhat.com>
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

Hi Hans,

On Wed, 29 Jul 2015 19:53:53 +0200
Hans de Goede <hdegoede@redhat.com> wrote:

> Print the detected ECC strength and size from nand_get_flash_type().

Indeed, that's an interesting information.

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mtd/nand/nand_base.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index f3fefbf..e2e2690 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4433,9 +4433,10 @@ ident_done:
>  		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
>  				type->name);
>  
> -	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
> +	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC strength %d size %d\n",

How about the follwing formalism ?

	pr_info("%d MiB, type: %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC: %dbits/%dbytes\n",

or just

	pr_info("%d MiB, type: %s, erase size: %d KiB, page size: %d, OOB size: %d, ECC: %d/%d\n",

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
