Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZwnL-00063s-CM
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 10:42:45 +0000
Date: Fri, 12 Jan 2018 11:42:31 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr,
 richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 2/2] mtd: nand: always request data transfer for
 parameter page
Message-ID: <20180112114231.51960fd3@bbrezillon>
In-Reply-To: <20180111235037.10912-2-stefan@agner.ch>
References: <20180111235037.10912-1-stefan@agner.ch>
 <20180111235037.10912-2-stefan@agner.ch>
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

On Fri, 12 Jan 2018 00:50:37 +0100
Stefan Agner <stefan@agner.ch> wrote:

> To make sure the controller actually transfers data add a
> DATA_IN op even if len is 0.

Nope, this is wrong. You should patch the caller of
nand_read_param_page_op() to always pass a valid buffer and
len != 0 instead.

> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/mtd/nand/nand_base.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 96c97588e1ba..26bbf54e125b 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -1510,10 +1510,6 @@ static int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
>  		};
>  		struct nand_operation op = NAND_OPERATION(instrs);
>  
> -		/* Drop the DATA_IN instruction if len is set to 0. */
> -		if (!len)
> -			op.ninstrs--;
> -
>  		return nand_exec_op(chip, &op);
>  	}
>  
