Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N5EyF-0001Gs-Qk
	for linux-mtd@lists.infradead.org; Tue, 03 Nov 2009 08:42:36 +0000
Subject: Re: [PATCH 1/3] Fixing compilation warning for 'nand/omap2.c'
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vimal Singh <vimal.newwork@gmail.com>
In-Reply-To: <ce9ab5790911030038p31bb69cfs1ba86cd70b243e4c@mail.gmail.com>
References: <ce9ab5790910292321nf230810v353c23f9c1ce1931@mail.gmail.com>
	<ce9ab5790910300142s615c7d59h15bb2d46d4f76574@mail.gmail.com>
	<1257236323.21596.56.camel@localhost>
	<ce9ab5790911030038p31bb69cfs1ba86cd70b243e4c@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Nov 2009 10:42:08 +0200
Message-Id: <1257237728.21596.65.camel@localhost>
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

On Tue, 2009-11-03 at 14:08 +0530, Vimal Singh wrote:
> On Tue, Nov 3, 2009 at 1:48 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2009-10-30 at 14:12 +0530, Vimal Singh wrote:
> >> Looping Linux-omap mailing list.
> >>
> >>
> >> From: Vimal Singh <vimalsingh@ti.com>
> >> Date: Fri, 30 Oct 2009 11:31:34 +0530
> >> Subject: [PATCH] Fixing compilation warning for 'nand/omap2.c'
> >>
> >> Fixing below warning in compilation:
> >> drivers/mtd/nand/omap2.c: In function 'omap_write_buf_dma_pref':
> >> drivers/mtd/nand/omap2.c:508: warning: passing argument 2 of
> >> 'omap_nand_dma_transfer' discards qualifiers from pointer target type
> >>
> >> Signed-off-by: Vimal Singh <vimalsingh@ti.com>
> >> ---
> >>  drivers/mtd/nand/omap2.c |    6 ++++--
> >>  1 files changed, 4 insertions(+), 2 deletions(-)
> >
> > [dedekind@eru l2-mtd-2.6.git]$ scripts/checkpatch.pl vimal
> > ERROR: patch seems to be corrupt (line wrapped?)
> > #94: FILE: drivers/mtd/nand/omap2.c:500:
> > mtd_info *mtd, u_char *buf, int len)
> >
> > total: 1 errors, 0 warnings, 16 lines checked
> >
> > vimal has style problems, please review.  If any of these errors
> > are false positives report them to the maintainer, see
> > CHECKPATCH in MAINTAINERS.
> > [dedekind@eru l2-mtd-2.6.git]$ vim vimal
> > [dedekind@eru l2-mtd-2.6.git]$ git am vimal
> > Applying: Fixing compilation warning for 'nand/omap2.c'
> > fatal: corrupt patch at line 10
> > Patch failed at 0001 Fixing compilation warning for 'nand/omap2.c'
> > When you have resolved this problem run "git am --resolved".
> > If you would prefer to skip this patch, instead run "git am --skip".
> > To restore the original branch and stop patching run "git am --abort".
> > [dedekind@eru l2-mtd-2.6.git]$
> >
> 
> Grr... its again mailer's issue. Fixed this in below patch:
> 
> -vimal
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

git-send-email ...

> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 090ab87..92573d5 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -501,11 +501,13 @@ static void omap_read_buf_dma_pref(struct
> mtd_info *mtd, u_char

:-) It is the same again.

Try to send the e-mail to yourself, then save it and apply with git-am.
If it works, send to the mailing list.

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
> 
>  /**
-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
