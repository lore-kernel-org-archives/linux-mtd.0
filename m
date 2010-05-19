Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OElE2-0003Zy-Nh
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 15:30:27 +0000
Received: by pxi1 with SMTP id 1so3795952pxi.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 May 2010 08:30:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1274181389-7488-3-git-send-email-s-ghorai@ti.com>
References: <s-ghorai@ti.com>
	<1274181389-7488-1-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-2-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-3-git-send-email-s-ghorai@ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 19 May 2010 21:00:04 +0530
Message-ID: <AANLkTinEaP9cN5A24K9Zwd4L9Fq4pzxQqqY44r7NSl4-@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] omap3 nand: cleanup virtual address usages
To: Sukumar Ghorai <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, tony@atomide.com, sakoman@gmail.com,
	linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 18, 2010 at 4:46 PM, Sukumar Ghorai <s-ghorai@ti.com> wrote:
> This patch removes direct reference of gpmc address from generic nand pla=
tform code.
> Nand platform code now uses wrapper functions which are implemented in gp=
mc module.
>
> Signed-off-by: Sukumar Ghorai <s-ghorai@ti.com>
[...]

>
> @@ -287,16 +246,15 @@ static void omap_read_buf_pref(struct mtd_info *mtd=
, u_char *buf, int len)
> =A0{
> =A0 =A0 =A0 =A0struct omap_nand_info *info =3D container_of(mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0struct omap_nand_info, mtd);
> - =A0 =A0 =A0 uint32_t pfpw_status =3D 0, r_count =3D 0;
> + =A0 =A0 =A0 u32 r_count =3D 0;
> =A0 =A0 =A0 =A0int ret =3D 0;
> - =A0 =A0 =A0 u32 *p =3D (u32 *)buf;
> + =A0 =A0 =A0 u32 *p;
>
> =A0 =A0 =A0 =A0/* take care of subpage reads */
> =A0 =A0 =A0 =A0for (; len % 4 !=3D 0; ) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*buf++ =3D __raw_readb(info->nand.IO_ADDR_=
R);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len--;
> =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 p =3D (u32 *) buf;

Above code had an issue, which was fixed by this commit:
http://git.infradead.org/mtd-2.6.git/commitdiff/c3341d0ceb4de1680572024f502=
33403c6a8b10d

I would suggest you to prepare your patch on MTD tree.

>
> =A0 =A0 =A0 =A0/* configure and start prefetch transfer */
> =A0 =A0 =A0 =A0ret =3D gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0x0)=
;
> @@ -307,17 +265,18 @@ static void omap_read_buf_pref(struct mtd_info *mtd=
, u_char *buf, int len)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_read_buf8(mtd, buf, l=
en);
> =A0 =A0 =A0 =A0} else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u32 *) buf;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0do {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pfpw_status =3D gpmc_prefet=
ch_status();
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r_count =3D ((pfpw_status >=
> 24) & 0x7F) >> 2;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ioread32_rep(info->nand_pre=
f_fifo_add, p, r_count);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpmc_c=
s,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_PREFET=
CH_FIFO_CNT, 0, 0, &r_count);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r_count =3D r_count >> 2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ioread32_rep(info->nand.IO_=
ADDR_R, p, r_count);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D r_count;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D r_count << 2;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D (r_count << 2);

Braces are not required here.

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} while (len);
> -

After call to 'gpmc_prefetch_enable', next line are:
           if (ret) {
                       /* PFPW engine is busy, use cpu copy method */
                       if (info->nand.options & NAND_BUSWIDTH_16)
                       ...
                       ...
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* disable and stop the PFPW engine */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);
> =A0 =A0 =A0 =A0}

So, if above 'if' fails, driver will not get prefetch engine (it was
already busy). Then it doesn't makes sense to call for __reset__.

> + =A0 =A0 =A0 /* disable and stop the PFPW engine */
> + =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);

(Also see my comments on your other patch.)

> =A0}
>
> =A0/**
> @@ -331,13 +290,13 @@ static void omap_write_buf_pref(struct mtd_info *mt=
d,
> =A0{
> =A0 =A0 =A0 =A0struct omap_nand_info *info =3D container_of(mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0struct omap_nand_info, mtd);
> - =A0 =A0 =A0 uint32_t pfpw_status =3D 0, w_count =3D 0;
> + =A0 =A0 =A0 uint32_t pref_count =3D 0, w_count =3D 0;
> =A0 =A0 =A0 =A0int i =3D 0, ret =3D 0;
> - =A0 =A0 =A0 u16 *p =3D (u16 *) buf;
> + =A0 =A0 =A0 u16 *p;
>
> =A0 =A0 =A0 =A0/* take care of subpage writes */
> =A0 =A0 =A0 =A0if (len % 2 !=3D 0) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(*buf, info->nand.IO_ADDR_R);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(*buf, info->nand.IO_ADDR_W);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p =3D (u16 *)(buf + 1);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len--;
> =A0 =A0 =A0 =A0}
> @@ -351,17 +310,22 @@ static void omap_write_buf_pref(struct mtd_info *mt=
d,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_write_buf8(mtd, buf, =
len);
> =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pfpw_status =3D gpmc_prefetch_status();
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (pfpw_status & 0x3FFF) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 w_count =3D ((pfpw_status >=
> 24) & 0x7F) >> 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u16 *) buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (len) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpmc_c=
s,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 GPMC_PREFETCH_FIFO_CNT, 0, 0, &w_count);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 w_count =3D w_count >> 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; (i < w_count=
) && len; i++, len -=3D 2)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iowrite16(*=
p++, info->nand_pref_fifo_add);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pfpw_status =3D gpmc_prefet=
ch_status();
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iowrite16(*=
p++, info->nand.IO_ADDR_W);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> -
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* disable and stop the PFPW engine */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* wait for data to flushed-out before rese=
t the prefetch */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpmc_c=
s,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_PREFET=
CH_COUNT, 0, 0, &pref_count);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (pref_count);
> =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 /* disable and stop the PFPW engine */
> + =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);

Same as above.


> =A0}
>
> =A0#ifdef CONFIG_MTD_NAND_OMAP_PREFETCH_DMA
> @@ -448,8 +412,10 @@ static inline int omap_nand_dma_transfer(struct mtd_=
info *mtd, void *addr,
> =A0 =A0 =A0 =A0/* setup and start DMA using dma_addr */
> =A0 =A0 =A0 =A0wait_for_completion(&info->comp);
>
> - =A0 =A0 =A0 while (0x3fff & (prefetch_status =3D gpmc_prefetch_status()=
))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;
> + =A0 =A0 =A0 do {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpmc_cs,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_PREFET=
CH_COUNT, 0, 0, &prefetch_status);
> + =A0 =A0 =A0 } while (prefetch_status);
> =A0 =A0 =A0 =A0/* disable and stop the PFPW engine */
> =A0 =A0 =A0 =A0gpmc_prefetch_reset();
>
> @@ -502,7 +468,7 @@ static void omap_write_buf_dma_pref(struct mtd_info *=
mtd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_write_buf_pref(mtd, buf, len);
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* start transfer in DMA mode */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, buf, len, 0x1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, (u_char *) buf,=
 len, 0x1);

This is already fixed. See commit:
http://git.infradead.org/mtd-2.6.git/commitdiff/bdaefc41627b6f2815ef7aa476d=
fa4ebb3ad499f


Rest, patches looks good. It is a good clean-up all together.

--=20
Regards,
Vimal Singh
