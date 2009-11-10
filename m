Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N7raS-0000Xs-2t
	for linux-mtd@lists.infradead.org; Tue, 10 Nov 2009 14:20:52 +0000
Subject: Re: [PATCH 1/3] Fixing compilation warning for 'nand/omap2.c'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790911030101t256e49e8iaf26c733e6472157@mail.gmail.com>
References: <ce9ab5790910292321nf230810v353c23f9c1ce1931@mail.gmail.com>
	<ce9ab5790910300142s615c7d59h15bb2d46d4f76574@mail.gmail.com>
	<1257236323.21596.56.camel@localhost>
	<ce9ab5790911030038p31bb69cfs1ba86cd70b243e4c@mail.gmail.com>
	<1257237728.21596.65.camel@localhost>
	<ce9ab5790911030101t256e49e8iaf26c733e6472157@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 10 Nov 2009 16:20:27 +0200
Message-Id: <1257862827.21596.760.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-omap@vger.kernel.org, Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-11-03 at 14:31 +0530, Vimal Singh wrote:
> >> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> >> index 090ab87..92573d5 100644
> >> --- a/drivers/mtd/nand/omap2.c
> >> +++ b/drivers/mtd/nand/omap2.c
> >> @@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
> >> mtd_info *mtd, u_char
> >
> > :-) It is the same again.
> >
> > Try to send the e-mail to yourself, then save it and apply with git-am.
> > If it works, send to the mailing list.
> 
> Below patch applies. Sorry for noise... :(
> 
> Thanks,
> vimal
> 
> 
> From eebbd81141b196af2dc3f7a2650ce16b6b0d76ae Mon Sep 17 00:00:00 2001
> From: Vimal Singh <vimalsingh@ti.com>
> Date: Fri, 30 Oct 2009 11:31:34 +0530
> Subject: [PATCH] Fixing compilation warning for 'nand/omap2.c'
> 
> Fixing below warning in compilation:
> drivers/mtd/nand/omap2.c: In function 'omap_write_buf_dma_pref':
> drivers/mtd/nand/omap2.c:508: warning: passing argument 2 of
> 'omap_nand_dma_transfer' discards qualifiers from pointer target type
> 
> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> ---
>  drivers/mtd/nand/omap2.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 090ab87..92573d5 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
>  static void omap_write_buf_dma_pref(struct mtd_info *mtd,
>  					const u_char *buf, int len)
>  {
> +	u_char *p = (u_char *)buf;
> +
>  	if (len <= mtd->oobsize)
> -		omap_write_buf_pref(mtd, buf, len);
> +		omap_write_buf_pref(mtd, p, len);
>  	else
>  		/* start transfer in DMA mode */
> -		omap_nand_dma_transfer(mtd, buf, len, 0x1);
> +		omap_nand_dma_transfer(mtd, p, len, 0x1);
>  }

I think that you should instead remove the 'const' modifier from the
'omap_write_buf_dma_pref()' function. Indeed, if it has the 'const'
modifier, it should never change the bugger.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
