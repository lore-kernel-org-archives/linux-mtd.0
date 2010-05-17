Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OE1Hi-00014g-Sm
	for linux-mtd@lists.infradead.org; Mon, 17 May 2010 14:27:11 +0000
Received: by pvg13 with SMTP id 13so121494pvg.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 May 2010 07:27:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B030D8FB75B@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1273850591-19040-1-git-send-email-s-ghorai@ti.com>
	<1273850591-19040-2-git-send-email-s-ghorai@ti.com>
	<AANLkTinGirx4-PPkpPhYEutbnN_uIPoYbA7BlUPCPnaK@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D8FB75B@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Mon, 17 May 2010 19:56:48 +0530
Message-ID: <AANLkTimHof-ZYHHWifCoyixbpJJD4h3FlIyfcZntFSXy@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] omap3 nand: cleanup for not to use GPMC virtual
	address
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "tony@atomide.com" <tony@atomide.com>,
	"Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"sakoman@gmail.com" <sakoman@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 17, 2010 at 9:52 AM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
[...]
>> > @@ -108,11 +108,27 @@ static u32 gpmc_read_reg(int idx)
>> > =A0 =A0 =A0 =A0return __raw_readl(gpmc_base + idx);
>> > =A0}
>> >
>> > +static void gpmc_cs_write_byte(int cs, int idx, u8 val)
>> > +{
>> > + =A0 =A0 =A0 void __iomem *reg_addr;
>> > +
>> > + =A0 =A0 =A0 reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_S=
IZE) +
>> idx;
>> > + =A0 =A0 =A0 __raw_writeb(val, reg_addr);
>> > +}
>> > +
>> > +static u8 gpmc_cs_read_byte(int cs, int idx)
>> > +{
>> > + =A0 =A0 =A0 void __iomem *reg_addr;
>> > +
>> > + =A0 =A0 =A0 reg_addr =3D gpmc_base + GPMC_CS0_BASE + (cs * GPMC_CS_S=
IZE) +
>> idx;
>> > + =A0 =A0 =A0 return __raw_readb(reg_addr);
>> > +}
>> > +
>>
>> I do not think we need these functions.
> [Ghorai] This is used in gpmc_hwcontrol() and to get the nand status from=
 omap2.c.

Yes, I can see that. But I think you should read complete register
(32-bits) and the manipulate them accordingly.

>
[...]
>> > @@ -229,14 +191,15 @@ static void omap_read_buf8(struct mtd_info *mtd,
>> u_char *buf, int len)
>> > =A0*/
>> > =A0static void omap_write_buf8(struct mtd_info *mtd, const u_char *buf=
,
>> int len)
>> > =A0{
>> > - =A0 =A0 =A0 struct omap_nand_info *info =3D container_of(mtd,
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 struct omap_nand_info,
>> mtd);
>> > + =A0 =A0 =A0 u32 =A0 =A0 status;
>> > + =A0 =A0 =A0 struct nand_chip *nand =3D mtd->priv;
>> > =A0 =A0 =A0 =A0u_char *p =3D (u_char *)buf;
>> >
>> > =A0 =A0 =A0 =A0while (len--) {
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 iowrite8(*p++, info->nand.IO_ADDR_W);
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (GPMC_BUF_EMPTY =3D=3D (readl(info=
->gpmc_baseaddr +
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 GPMC_STATUS) &
>> GPMC_BUF_FULL));
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iowrite8(*p++, nand->IO_ADDR_W);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_hwcontrol(0, 0, GPMC_GET_SET_STATUS=
, 0, &status);
>> If I am not mistaking, 2nd argument is 'cs', correct? And then, why
>> are you hard coding this?
>> Different boards will have NAND chip present at different 'cs'.
>> Please have a look at uses of 'gpmc_hwcontrol' elsewhere as well for thi=
s.
> [Ghorai] I agree.
>>
>> Again, say, you got '(status & GPMC_BUF_FULL) !=3D GPMC_BUF_EMPTY', then=
:
>>
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while (GPMC_BUF_EMPTY =3D=3D (status & G=
PMC_BUF_FULL))
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;
>>
>> You got in an infinite loop here?
> [Ghorai] if you see carefully this is same as existing code. Let me check=
 if any better solution.

No. Look carefully. In previous code 'gpmc status' was being read in
each loop, while in your code you read it once and then you never look
for updated value.
That's why your code is going into infinite loop


--=20
Regards,
Vimal Singh
