Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1evT3I-0003PA-Kv
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 19:24:10 +0000
Date: Mon, 12 Mar 2018 20:23:36 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, jocelyncarroue@macronix.com,
 juliensu@mxic.com.tw, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Agner <stefan@agner.ch>, linux-mtd@lists.infradead.org, Ezequiel
 Garcia <ezequiel.garcia@free-electrons.com>, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v3 13/14] mtd: rawnand: get rid of the JEDEC parameter
 page in nand_chip
Message-ID: <20180312202336.3cad89b3@bbrezillon>
In-Reply-To: <20180302142422.2543-14-miquel.raynal@bootlin.com>
References: <20180302142422.2543-1-miquel.raynal@bootlin.com>
 <20180302142422.2543-14-miquel.raynal@bootlin.com>
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

On Fri,  2 Mar 2018 15:24:21 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:
  
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index d2105352033a..965e6113f661 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1186,8 +1186,6 @@ int nand_op_parser_exec_op(struct nand_chip *chip,
>   *			non 0 if JEDEC supported.
>   * @onfi_params:	[INTERN] holds the ONFI page parameter when ONFI is
>   *			supported, 0 otherwise.

You forgot to remove the onfi_params doc in one of your previous commit.



-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
