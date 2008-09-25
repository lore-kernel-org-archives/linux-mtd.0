Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KisHH-0005jf-7h
	for linux-mtd@lists.infradead.org; Thu, 25 Sep 2008 14:57:11 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0K7R00HNMAV0KQ20@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 25 Sep 2008 10:57:00 -0400 (EDT)
Date: Thu, 25 Sep 2008 10:57:00 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Alexander Belyakov <abelyako@mail.ru>
Subject: Re: [PATCH] mtd: fix cfi_cmdset_0001 FL_SYNCING race (take 2)
In-reply-to: <E1KirHY-0009gF-00.abelyako-mail-ru@f144.mail.ru>
Message-id: <alpine.LFD.2.00.0809251053450.3635@xanadu.home>
References: <E1KirHY-0009gF-00.abelyako-mail-ru@f144.mail.ru>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alexander Belyakov <abelyako@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 25 Sep 2008, Alexander Belyakov wrote:

> The patch fixes CFI issue with multipartitional devices leading to the set of errors or even deadlock. The problem is CFI FL_SYNCING state race with flash operations (e.g. erase suspend). It is reproduced by running intensive writes on one JFFS2 partition and simultaneously performing mount/unmount cycle on another partition of the same chip.
> 
> 
> ---
> Signed-off-by: Alexander Belyakov <abelyako@googlemail.com>

You should put your Signed-off-by line above the 3 dashes.  Everything 
below the 3 dashes is ignored for the commit log.

Acked-by: Nicolas Pitre <nico@cam.org> otherwise.


> 
> diff -uNrp a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c	2008-09-08 21:40:20.000000000 +0400
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2008-09-19 10:47:34.000000000 +0400
> @@ -701,6 +701,10 @@ static int chip_ready (struct map_info *
>  	struct cfi_pri_intelext *cfip = cfi->cmdset_priv;
>  	unsigned long timeo = jiffies + HZ;
>  
> +	/* Prevent setting state FL_SYNCING for chip in suspended state. */
> +	if (mode == FL_SYNCING && chip->oldstate != FL_READY)
> +		goto sleep;
> +
>  	switch (chip->state) {
>  
>  	case FL_STATUS:
> @@ -806,8 +810,9 @@ static int get_chip(struct map_info *map
>  	DECLARE_WAITQUEUE(wait, current);
>  
>   retry:
> -	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING
> -			   || mode == FL_OTP_WRITE || mode == FL_SHUTDOWN)) {
> +	if (chip->priv &&
> +	    (mode == FL_WRITING || mode == FL_ERASING || mode == FL_OTP_WRITE
> +	    || mode == FL_SHUTDOWN) && chip->state != FL_SYNCING) {
>  		/*
>  		 * OK. We have possibility for contention on the write/erase
>  		 * operations which are global to the real chip and not per
> @@ -857,6 +862,14 @@ static int get_chip(struct map_info *map
>  				return ret;
>  			}
>  			spin_lock(&shared->lock);
> +
> +			/* We should not own chip if it is already
> +			 * in FL_SYNCING state. Put contender and retry. */
> +			if (chip->state == FL_SYNCING) {
> +				put_chip(map, contender, contender->start);
> +				spin_unlock(contender->mutex);
> +				goto retry;
> +			}
>  			spin_unlock(contender->mutex);
>  		}
>  
> 


Nicolas
