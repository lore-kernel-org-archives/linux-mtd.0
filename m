Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PnvM1-0000a3-ME
	for linux-mtd@lists.infradead.org; Fri, 11 Feb 2011 15:56:18 +0000
Received: by eyd9 with SMTP id 9so1322024eyd.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 Feb 2011 07:56:16 -0800 (PST)
Subject: Re: [PATCH] Simplify write buffer size calculation by using
	mtd->writebufsize.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
In-Reply-To: <20110211155302.25154.10206.stgit@dev.siriade.com>
References: <20110211155302.25154.10206.stgit@dev.siriade.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 11 Feb 2011 17:55:07 +0200
Message-ID: <1297439707.2760.65.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Anatolij Gustschin <agust@denx.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-11 at 16:53 +0100, Guillaume LECERF wrote:
> This patch applies on top of "[PATCH 2/2] mtd: cfi: fix writebufsize initialization" by Anatolij Gustschin <agust@denx.de>.
> 
> 
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c |   13 ++++++-------
>  drivers/mtd/chips/cfi_cmdset_0002.c |    3 +--
>  drivers/mtd/chips/cfi_cmdset_0020.c |   16 ++++++++--------
>  3 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index 178f87b..7d6a752 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -1643,23 +1643,23 @@ static int cfi_intelext_write_words (struct mtd_info *mtd, loff_t to , size_t le
>  }
>  
> 
> -static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
> +static int __xipram do_write_buffer(struct mtd_info *mtd, struct flchip *chip,
>  				    unsigned long adr, const struct kvec **pvec,
>  				    unsigned long *pvec_seek, int len)
>  {
> +	struct map_info *map = mtd->priv;
>  	struct cfi_private *cfi = map->fldrv_priv;
>  	map_word status, write_cmd, datum;
>  	unsigned long cmd_adr;
> -	int ret, wbufsize, word_gap, words;
> +	int ret, word_gap, words;
>  	const struct kvec *vec;
>  	unsigned long vec_seek;
>  	unsigned long initial_adr;
>  	int initial_len = len;
>  
> -	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
>  	adr += chip->start;
>  	initial_adr = adr;
> -	cmd_adr = adr & ~(wbufsize-1);
> +	cmd_adr = adr & ~(mtd->writebufsize - 1);

It feels like bad layering when drivers use fields like
'mtd->writesize'. I know we do this all over the place, but I think
drivers should not really rely on the contents of the "mtd->" object and
has all the needed data in private objects.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
