Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYPH3-0004yO-Qt
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 00:24:54 +0000
Received: by mail-pd0-f180.google.com with SMTP id v10so4570568pde.11
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 17:24:28 -0700 (PDT)
Date: Thu, 10 Apr 2014 17:24:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 08/10] mtd: st_spi_fsm: replace FLACH_CMD_* with
 SPINOR_OP_*
Message-ID: <20140411002425.GQ32070@ld-irv-0074>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
 <1397157664-24405-9-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397157664-24405-9-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 10, 2014 at 12:21:02PM -0700, Brian Norris wrote:
> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
> index 2977f026f39d..b41bbbc531ff 100644
> --- a/drivers/mtd/spi-nor/fsl-quadspi.c
> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c
> @@ -294,12 +294,12 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  	lut_base = SEQID_QUAD_READ * 4;
>  
>  	if (q->nor_size <= SZ_16M) {
> -		cmd = SPINOR_OP_QUAD_READ;
> +		cmd = SPINOR_OP_READ_1_1_4;
>  		addrlen = ADDR24BIT;
>  		dummy = 8;
>  	} else {
>  		/* use the 4-byte address */
> -		cmd = SPINOR_OP_QUAD_READ;
> +		cmd = SPINOR_OP_READ_1_1_4;
>  		addrlen = ADDR32BIT;
>  		dummy = 8;
>  	}
> @@ -388,7 +388,7 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
>  static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
>  {
>  	switch (cmd) {
> -	case SPINOR_OP_QUAD_READ:
> +	case SPINOR_OP_READ_1_1_4:
>  		return SEQID_QUAD_READ;
>  	case SPINOR_OP_WREN:
>  		return SEQID_WREN;

I'm sorry, I squashed these into the wrong patch. The full result
builds, but this is not bisect clean :(

I'll send out another version once I've had a better look at everything.
Sorry for the noise.

Brian
