Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dfdie-0005oz-Qn
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2005 09:02:16 -0400
Date: Tue, 7 Jun 2005 15:02:16 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
Message-ID: <20050607130216.GA4173@wohnheim.fh-wedel.de>
References: <426F719A.2000903@ipi.ac.ru>
	<20050606133406.GD31739@wohnheim.fh-wedel.de>
	<42A4572C.8020107@ipi.ac.ru>
	<20050606141453.GF31739@wohnheim.fh-wedel.de>
	<42A460BB.50800@ipi.ac.ru>
	<20050606162648.GJ31739@wohnheim.fh-wedel.de>
	<42A47E7D.2060302@ipi.ac.ru>
	<20050606174443.GA24857@wohnheim.fh-wedel.de>
	<42A55B15.8000506@ipi.ac.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42A55B15.8000506@ipi.ac.ru>
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

On Tue, 7 June 2005 12:30:13 +0400, Timofei V. Bondarenko wrote:
> 
> Ok, sorry for noise.
> Is it good enough?

Still broken.  You have some whitespace noise in it.

I could easily fix it up, but I feel like a bastard and prefer to
share the pain.  If your mail reader is screwing it up, you can send
the patch as an attachment.  Inline would be preferred, though.

> diff -u -p -r1.17 cmdlinepart.c
> --- mtd/drivers/mtd/cmdlinepart.c	26 Nov 2004 11:18:47 -0000	1.17
> +++ mtd/drivers/mtd/cmdlinepart.c	7 Jun 2005 08:02:00 -0000
> @@ -239,7 +239,8 @@ static int mtdpart_setup_real(char *s)
>  				&num_parts,	/* out: number of parts */
>  				0,		/* first partition */
>  				(unsigned char**)&this_mtd, /* out: extra 
>  				mem */
> -				mtd_id_len + 1 + sizeof(*this_mtd));
> +				mtd_id_len + 1 + sizeof(*this_mtd) +
> +                                sizeof(void*)-1 /*alignment*/);
>  		if(!parts)
>  		{
>  			/*
> @@ -252,7 +253,10 @@ static int mtdpart_setup_real(char *s)
>  			 return 0;
>  		 }
> 
> -		/* enter results */	
> +		/* align this_mtd */
> +                this_mtd = (struct cmdline_mtd_partition *)
> +                    ALIGN((unsigned long)this_mtd, sizeof(void*));
> +		/* enter results */
>  		this_mtd->parts = parts;
>  		this_mtd->num_parts = num_parts;
>  		this_mtd->mtd_id = (char*)(this_mtd + 1);
> 
> 

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
