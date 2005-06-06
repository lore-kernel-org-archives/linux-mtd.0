Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DfHkW-0000Hy-Pk
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2005 09:34:42 -0400
Date: Mon, 6 Jun 2005 15:34:06 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
Message-ID: <20050606133406.GD31739@wohnheim.fh-wedel.de>
References: <426F719A.2000903@ipi.ac.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <426F719A.2000903@ipi.ac.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: misaligned memory access in cmdlinepart.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks for bugging again.

On Wed, 27 April 2005 15:03:54 +0400, Timofei V. Bondarenko wrote:
> 
> in mtdpart_setup_real()/newpart() command line parser
> 'this_mtd' structure can be misaligned,
> it may cause exception on some kind of CPU.
> 
> That happened because the structure allocated in a variable length area 
> and got mixed with partition names.

Your description appears to make sense (I don't use cmdlinepart).  The
patch, however, should be changed to use ALIGN() from
include/linux/kernel.h instead.

> --- cmdlinepart.c	2005-04-18 18:06:43.000000000 +0400
> +++ linux-2.6.x/drivers/mtd/cmdlinepart.c	2005-04-18 
> 18:40:02.971778640 +0400
> @@ -234,12 +234,14 @@ static int mtdpart_setup_real(char *s)
>  		 * parse one mtd. have it reserve memory for the
>  		 * struct cmdline_mtd_partition and the mtd-id string.
>  		 */
> +#define THIS_MTD_ALIGN_CONST (sizeof(void*)-1)
>  		parts = newpart(p + 1,		/* cmdline */
>  				&s,		/* out: updated cmdline ptr 
>  				*/
>  				&num_parts,	/* out: number of parts */
>  				0,		/* first partition */
>  				(unsigned char**)&this_mtd, /* out: extra 
>  				mem */
> -				mtd_id_len + 1 + sizeof(*this_mtd));
> +				mtd_id_len + 1 + sizeof(*this_mtd) +
> +                                THIS_MTD_ALIGN_CONST);
>  		if(!parts)
>  		{
>  			/*
> @@ -252,7 +254,11 @@ static int mtdpart_setup_real(char *s)
>  			 return 0;
>  		 }
> 
> -		/* enter results */	
> +		/* align this_mtd */
> +                this_mtd = (struct cmdline_mtd_partition *)
> +                  (~THIS_MTD_ALIGN_CONST &
> +                    THIS_MTD_ALIGN_CONST + (unsigned long)(char*)this_mtd);
> +		/* enter results */
>  		this_mtd->parts = parts;
>  		this_mtd->num_parts = num_parts;
>  		this_mtd->mtd_id = (char*)(this_mtd + 1);
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

Jörn

-- 
There are two ways of constructing a software design: one way is to make
it so simple that there are obviously no deficiencies, and the other is
to make it so complicated that there are no obvious deficiencies.
-- C. A. R. Hoare
