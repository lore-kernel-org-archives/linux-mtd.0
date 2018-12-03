Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTvkr-0000B6-8l
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 21:27:51 +0000
Date: Mon, 3 Dec 2018 22:27:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Mathieu Malaterre <malat@debian.org>
Cc: Paul Burton <paul.burton@mips.com>, trivial@kernel.org,
 kernel-janitors@vger.kernel.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: annotate implicit fall throughs
Message-ID: <20181203222726.23e747ae@bbrezillon>
In-Reply-To: <20181203212214.8862-1-malat@debian.org>
References: <20181203212214.8862-1-malat@debian.org>
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

Hi Mathieu,

The subject prefix should be "mtd: rawnand: jz4780:" not "mips:"

Regards,

Boris

On Mon,  3 Dec 2018 22:22:13 +0100
Mathieu Malaterre <malat@debian.org> wrote:

> There is a plan to build the kernel with -Wimplicit-fallthrough and
> these places in the code produced warnings. Fix them up.
> 
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
>  drivers/mtd/nand/raw/jz4780_bch.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_bch.c b/drivers/mtd/nand/raw/jz4780_bch.c
> index 731c6051d91e..7201827809e9 100644
> --- a/drivers/mtd/nand/raw/jz4780_bch.c
> +++ b/drivers/mtd/nand/raw/jz4780_bch.c
> @@ -136,8 +136,10 @@ static void jz4780_bch_read_parity(struct jz4780_bch *bch, void *buf,
>  	switch (size8) {
>  	case 3:
>  		dest8[2] = (val >> 16) & 0xff;
> +		/* fall through */
>  	case 2:
>  		dest8[1] = (val >> 8) & 0xff;
> +		/* fall through */
>  	case 1:
>  		dest8[0] = val & 0xff;
>  		break;
