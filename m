Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OEngb-0006nQ-UD
	for linux-mtd@lists.infradead.org; Wed, 19 May 2010 18:08:07 +0000
Received: by pvg11 with SMTP id 11so386088pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 May 2010 11:08:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B030D991D43@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1274181389-7488-1-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-2-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-3-git-send-email-s-ghorai@ti.com>
	<AANLkTinEaP9cN5A24K9Zwd4L9Fq4pzxQqqY44r7NSl4-@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D991D43@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 19 May 2010 23:37:44 +0530
Message-ID: <AANLkTikh1c3tgtO5TvOnNzJKXz7oTnna1WfLiWU67C_5@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] omap3 nand: cleanup virtual address usages
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"tony@atomide.com" <tony@atomide.com>,
	"sakoman@gmail.com" <sakoman@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 19, 2010 at 10:54 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
>> > =A0 =A0 =A0 =A0/* take care of subpage reads */
>> > =A0 =A0 =A0 =A0for (; len % 4 !=3D 0; ) {
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*buf++ =3D __raw_readb(info->nand.IO_AD=
DR_R);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len--;
>> > =A0 =A0 =A0 =A0}
>> > - =A0 =A0 =A0 p =3D (u32 *) buf;
>>
>> Above code had an issue, which was fixed by this commit:
>> http://git.infradead.org/mtd-
>> 2.6.git/commitdiff/c3341d0ceb4de1680572024f50233403c6a8b10d
>>
>> I would suggest you to prepare your patch on MTD tree.
> [Ghorai] Patches started posting on lo. And lets continue the same.

Not sure about this. Its your/Tony's call.

>>
>> >
>> > =A0 =A0 =A0 =A0/* configure and start prefetch transfer */
>> > =A0 =A0 =A0 =A0ret =3D gpmc_prefetch_enable(info->gpmc_cs, 0x0, len, 0=
x0);
>> > @@ -307,17 +265,18 @@ static void omap_read_buf_pref(struct mtd_info
>> *mtd, u_char *buf, int len)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_read_buf8(mtd, buf=
, len);
>> > =A0 =A0 =A0 =A0} else {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u32 *) buf;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0do {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pfpw_status =3D gpmc_pre=
fetch_status();
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r_count =3D ((pfpw_statu=
s >> 24) & 0x7F) >> 2;
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ioread32_rep(info->nand_=
pref_fifo_add, p,
>> r_count);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpm=
c_cs,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_PRE=
FETCH_FIFO_CNT, 0, 0, &r_count);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 r_count =3D r_count >> 2=
;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ioread32_rep(info->nand.=
IO_ADDR_R, p, r_count);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p +=3D r_count;
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D r_count << 2;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 len -=3D (r_count << 2);
>>
>> Braces are not required here.
> [Ghorai] thanks
>>
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} while (len);
>> > -
>>
>> After call to 'gpmc_prefetch_enable', next line are:
>> =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* PFPW engine is busy, u=
se cpu copy method */
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (info->nand.options & =
NAND_BUSWIDTH_16)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0...
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* disable and stop the PFPW engine */
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);
>> > =A0 =A0 =A0 =A0}
>>
>> So, if above 'if' fails, driver will not get prefetch engine (it was
>> already busy). Then it doesn't makes sense to call for __reset__.
> [Ghorai] I will take this clean up as 4th patch. As its not matching with=
 patch description.
>>
>> > + =A0 =A0 =A0 /* disable and stop the PFPW engine */
>> > + =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);
>>
>> (Also see my comments on your other patch.)
> [Ghorai] Agree and I will take this kind of cleanup as 4th patch
>>
>> > =A0}
>> >
>> > =A0/**
>> > @@ -331,13 +290,13 @@ static void omap_write_buf_pref(struct mtd_info
>> *mtd,
>> > =A0{
>> > =A0 =A0 =A0 =A0struct omap_nand_info *info =3D container_of(mtd,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0struct omap_nand_info,
>> mtd);
>> > - =A0 =A0 =A0 uint32_t pfpw_status =3D 0, w_count =3D 0;
>> > + =A0 =A0 =A0 uint32_t pref_count =3D 0, w_count =3D 0;
>> > =A0 =A0 =A0 =A0int i =3D 0, ret =3D 0;
>> > - =A0 =A0 =A0 u16 *p =3D (u16 *) buf;
>> > + =A0 =A0 =A0 u16 *p;
>> >
>> > =A0 =A0 =A0 =A0/* take care of subpage writes */
>> > =A0 =A0 =A0 =A0if (len % 2 !=3D 0) {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(*buf, info->nand.IO_ADDR_R);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(*buf, info->nand.IO_ADDR_W);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p =3D (u16 *)(buf + 1);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len--;
>> > =A0 =A0 =A0 =A0}
>> > @@ -351,17 +310,22 @@ static void omap_write_buf_pref(struct mtd_info
>> *mtd,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_write_buf8(mtd, bu=
f, len);
>> > =A0 =A0 =A0 =A0} else {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pfpw_status =3D gpmc_prefetch_status();
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (pfpw_status & 0x3FFF) {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 w_count =3D ((pfpw_statu=
s >> 24) & 0x7F) >> 1;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 p =3D (u16 *) buf;
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (len) {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpm=
c_cs,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 GPMC_PREFETCH_FIFO_CNT, 0, 0,
>> &w_count);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 w_count =3D w_count >> 1=
;
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; (i < w_co=
unt) && len; i++, len -=3D 2)
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iowrite1=
6(*p++, info-
>> >nand_pref_fifo_add);
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pfpw_status =3D gpmc_pre=
fetch_status();
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 iowrite1=
6(*p++, info->nand.IO_ADDR_W);
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>> > -
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* disable and stop the PFPW engine */
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* wait for data to flushed-out before r=
eset the
>> prefetch */
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 do {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpm=
c_cs,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_PRE=
FETCH_COUNT, 0, 0, &pref_count);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } while (pref_count);
>> > =A0 =A0 =A0 =A0}
>> > + =A0 =A0 =A0 /* disable and stop the PFPW engine */
>> > + =A0 =A0 =A0 gpmc_prefetch_reset(info->gpmc_cs);
>>
>> Same as above.
> [Ghorai] Agree and I will take this kind of cleanup as 4th patch, as its =
not matching with patch description.
>>
>>
>> > =A0}
>> >
>> > =A0#ifdef CONFIG_MTD_NAND_OMAP_PREFETCH_DMA
>> > @@ -448,8 +412,10 @@ static inline int omap_nand_dma_transfer(struct
>> mtd_info *mtd, void *addr,
>> > =A0 =A0 =A0 =A0/* setup and start DMA using dma_addr */
>> > =A0 =A0 =A0 =A0wait_for_completion(&info->comp);
>> >
>> > - =A0 =A0 =A0 while (0x3fff & (prefetch_status =3D gpmc_prefetch_statu=
s()))
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;
>> > + =A0 =A0 =A0 do {
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(info->gpmc_cs,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPMC_PRE=
FETCH_COUNT, 0, 0,
>> &prefetch_status);
>> > + =A0 =A0 =A0 } while (prefetch_status);
>> > =A0 =A0 =A0 =A0/* disable and stop the PFPW engine */
>> > =A0 =A0 =A0 =A0gpmc_prefetch_reset();
>> >
>> > @@ -502,7 +468,7 @@ static void omap_write_buf_dma_pref(struct mtd_inf=
o
>> *mtd,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0omap_write_buf_pref(mtd, buf, len);
>> > =A0 =A0 =A0 =A0else
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* start transfer in DMA mode */
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, buf, len, 0x=
1);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 omap_nand_dma_transfer(mtd, (u_char *) b=
uf, len, 0x1);
>>
>> This is already fixed. See commit:
>> http://git.infradead.org/mtd-
>> 2.6.git/commitdiff/bdaefc41627b6f2815ef7aa476dfa4ebb3ad499f
> [Ghorai] thanks I will omit this from this patch
>>
>>
>> Rest, patches looks good. It is a good clean-up all together.
> [Ghorai] Is it possible for you to check once again if you have any addit=
ional comments! This is to identify the issue if any at early stage.

Yeah, I can understand. I tried to review it fully, but can not say if
still something left and gets attention later on. Even sometimes they
will become visible when you fix current one.
As of now this is all what I had.

--=20
Regards,
Vimal Singh
