Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3qLD-0003F4-M7
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 19:11:57 +0000
Date: Tue, 1 Dec 2015 20:11:33 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: nand: fix typo (t_ald -> t_adl)
Message-ID: <20151201201133.40f8f350@bbrezillon>
In-Reply-To: <1448996912-14677-1-git-send-email-computersforpeace@gmail.com>
References: <1448996912-14677-1-git-send-email-computersforpeace@gmail.com>
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

On Tue,  1 Dec 2015 11:08:32 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> It's "ADL" ("ALE to data loading" time) not "ALD".
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> Caught by inspection. Compile tested only.
> 
>  include/linux/mtd/nand.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index eaf48b5a95dd..fad634ea1685 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -283,7 +283,7 @@ struct nand_onfi_params {
>  	u8 input_pin_capacitance_max;
>  	u8 driver_strength_support;
>  	__le16 t_int_r;
> -	__le16 t_ald;
> +	__le16 t_adl;
>  	u8 reserved4[8];
>  
>  	/* vendor */
> @@ -407,7 +407,7 @@ struct nand_jedec_params {
>  	__le16 input_pin_capacitance_typ;
>  	__le16 clk_pin_capacitance_typ;
>  	u8 driver_strength_support;
> -	__le16 t_ald;
> +	__le16 t_adl;
>  	u8 reserved4[36];
>  
>  	/* ECC and endurance block */



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
