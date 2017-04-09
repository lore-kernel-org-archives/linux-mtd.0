Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cx6zP-0000sj-0j
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 07:10:25 +0000
Date: Sun, 9 Apr 2017 09:09:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Leonard Crestez <leonard.crestez@nxp.com>
Subject: Re: [PATCH] fixup! mtd: nand: allocate aligned buffers if
 NAND_OWN_BUFFERS is unset
Message-ID: <20170409090947.7331df0b@bbrezillon>
In-Reply-To: <1491548798-28051-1-git-send-email-yamada.masahiro@socionext.com>
References: <1491548798-28051-1-git-send-email-yamada.masahiro@socionext.com>
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

On Fri,  7 Apr 2017 16:06:38 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> ---
> 
> Bug port: http://patchwork.ozlabs.org/patch/745136/
> Please squash into commit f6614d1b.
> (Currently, only once patch on top of that.)
> If impossible, I can re-send this with detailed log.
> 
> 
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8a2e5ff..903a678 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -4936,7 +4936,7 @@ void nand_cleanup(struct nand_chip *chip)
>  
>  	/* Free bad block table memory */
>  	kfree(chip->bbt);
> -	if (!(chip->options & NAND_OWN_BUFFERS)) {
> +	if (!(chip->options & NAND_OWN_BUFFERS) && !chip->buffers) {

You mean

	if (!(chip->options & NAND_OWN_BUFFERS) && chip->buffers) {

right?

I'll squash this change in you initial commit, but I have a comment on
where the real bug lies IMO (see my reply to "mtd: nand: allocate
aligned buffers if NAND_OWN_BUFFERS is unset").

>  		kfree(chip->buffers->databuf);
>  		kfree(chip->buffers->ecccode);
>  		kfree(chip->buffers->ecccalc);
