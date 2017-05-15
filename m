Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAOVc-00036q-Kk
 for linux-mtd@lists.infradead.org; Mon, 15 May 2017 22:30:34 +0000
Date: Tue, 16 May 2017 00:30:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] mtd: nand: tango: Fix incorrect use of SEQIN command
Message-ID: <20170516003001.636a9cac@bbrezillon>
In-Reply-To: <1494886224-20393-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1494886224-20393-1-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 16 May 2017 00:10:24 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> SEQIN is supposed to be used one wants to start programming a page.

			      ^ when one ...

> What we want here is just changing the column within the page, which is
> done with the RNDIN command.
> 

Forgot the following tags.

Fixes: 6956e2385a16 ("mtd: nand: add tango NAND flash controller support")
Cc: state@vger.kernel.org

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/tango_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
> index 05b6e1065203..a2150b15d4c1 100644
> --- a/drivers/mtd/nand/tango_nand.c
> +++ b/drivers/mtd/nand/tango_nand.c
> @@ -332,7 +332,7 @@ static void aux_write(struct nand_chip *chip, const u8 **buf, int len, int *pos)
>  
>  	if (!*buf) {
>  		/* skip over "len" bytes */
> -		chip->cmdfunc(mtd, NAND_CMD_SEQIN, *pos, -1);
> +		chip->cmdfunc(mtd, NAND_CMD_RNDIN, *pos, -1);
>  	} else {
>  		tango_write_buf(mtd, *buf, len);
>  		*buf += len;
