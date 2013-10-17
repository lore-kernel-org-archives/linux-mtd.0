Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWmuX-0003Va-03
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 12:42:42 +0000
Received: by mail-wg0-f44.google.com with SMTP id n12so2191393wgh.23
 for <linux-mtd@lists.infradead.org>; Thu, 17 Oct 2013 05:42:17 -0700 (PDT)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA27C63@DBDE04.ent.ti.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
 <1381816197-20477-8-git-send-email-pekon@ti.com>
 <20131017022237.GC23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA27C63@DBDE04.ent.ti.com>
Date: Thu, 17 Oct 2013 14:42:17 +0200
Message-ID: <CAGGh5h3PU0PR1SMa_aWUvPxccWS9A+Rxp7pm0U8u6fBnPcOvjw@mail.gmail.com>
Subject: Re: [PATCH v9 7/9] mtd: nand: omap: use drivers/mtd/nand/nand_bch.c
 wrapper for BCH ECC instead of lib/bch.c
From: jean-philippe francois <jp.francois@cynove.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/10/17 Gupta, Pekon <pekon@ti.com>:
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>> > On Tue, Oct 15, 2013 at 11:19:55AM +0530, Pekon Gupta wrote:
> [snip]
>
>> > diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
>> > index d885298..5836039 100644
>> > --- a/drivers/mtd/nand/Kconfig
>> > +++ b/drivers/mtd/nand/Kconfig
>> > @@ -96,35 +96,13 @@ config MTD_NAND_OMAP2
>> >
>> >  config MTD_NAND_OMAP_BCH
>> >     depends on MTD_NAND && MTD_NAND_OMAP2 && ARCH_OMAP3
>> > -   tristate "Enable support for hardware BCH error correction"
>> > +   tristate "Support hardware based BCH error correction"
>> >     default n
>> >     select BCH
>> > -   select BCH_CONST_PARAMS
>>
>> Do you know what will happen now if someone configures
>> BCH_CONST_PARAMS?
>> Would this cause problems?
>>
> As per comments in lib/bch.c
> ---------------------------
> * Option CONFIG_BCH_CONST_PARAMS can be used to force fixed values of
>  * parameters m and t; thus allowing extra compiler optimizations and pro=
viding
>  * better (up to 2x) encoding performance. Using this option makes sense =
when
>  * (m,t) are fixed and known in advance, e.g. when using BCH error correc=
tion
>  * on a particular NAND flash device.
> ---------------------------
> 'BCH_CONST_PARAMS' is required for optimization when BCH algorithm
> is fixed. But in omap-nand case selection of type of BCH algorithm
> (BCH4 or BCH8) comes from DT binding "ti,nand-ecc-opts".
>
> If enabled (CONFIG_BCH_CONST_PARAMS) will optimize lib/bch.c
> for BCH8 algorithm by default, so
> CASE: if BCH8 is selected by DT, then no issues
> CASE: if BCH4 is selected  then nand_bch_init() fails with following erro=
r
> + if (!info->nand.ecc.priv) {
>                 pr_err("nand: error: unable to use s/w BCH library\n");
>                 err =3D -EINVAL;
>                 goto out_release_mem_region;
> }
>
> [snip]
>
>> >  if MTD_NAND_OMAP_BCH
>> >  config BCH_CONST_M
>>
>> Do you need to to also kill of the Kconfig stuff for BCH_CONST_M and
>> BCH_CONST_T, which were tied to the MTD_NAND_OMAP_BCH4 and
>> MTD_NAND_OMAP_BCH8 configs you just removed?
>>
> Thanks, good catch. I dint really notice.
> So, the driver is now updated to separate out two flavours of BCHx scheme=
.
> (a) OMAP_ECC_BCHx_CODE_HW: which uses ELM hardware
> (b) OMAP_ECC_BCHx_CODE_HW_DETECTION_SW: which uses lib/bch.c
> These BCH_CONST_M and BCH_CONST_T now belongs to (b) family only.
> -  if MTD_NAND_OMAP_BCH
> + if MTD_NAND_ECC_BCH
>        config BCH_CONST_M
> (I'll update that)..
>
>
>> > diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> [snip]
>> > -           info->bch =3D init_bch(nand_chip->ecc.bytes,
>> > -                                   nand_chip->ecc.strength,
>> > -                                   OMAP_ECC_BCH8_POLYNOMIAL);
>> > -           if (!info->bch) {
>> > +           info->nand.ecc.priv     =3D nand_bch_init(mtd,
>> > +                                           info->nand.ecc.size,
>> > +                                           info->nand.ecc.bytes,
>> > +                                           &info->nand.ecc.layout);
>>
>> Are you sure nand_bch_init() is a proper drop-in replacement for the
>> implementation you had based on init_bch()? It looks to me like they at
>> least use a differnt polynomial value (0x201b vs. 0). Is this a problem
>> for backwards compatibility?
>>
> It's not the polynomial value =3D 0. Rather 0x201b is selected in both ca=
ses
> Refer below code.
> ---------------
> When init_bch(m,t, 0) is called from nand_bch_init() then,
> lib/bch.c @@ init_bch(int m, int t, unsigned int prim_poly)
> (a)     /* default primitive polynomials */
>         static const unsigned int prim_poly_tab[] =3D {
>                 0x25, 0x43, 0x83, 0x11d, 0x211, 0x409, 0x805, 0x1053, 0x2=
01b,
>                 0x402b, 0x8003,
>         };
> (b)     /* select a primitive polynomial for generating GF(2^m) */
>         if (prim_poly =3D=3D 0)
>                 prim_poly =3D prim_poly_tab[m-min_m];
> (c) And, const int min_m =3D 5;
>
> So, for BCH8 m=3D13, min_m=3D5; So
> prim_poly =3D prim_poly_tab[13-5] =3D prim_poly_tab[8] =3D 0x201b
> ---------------
>
> Hence, there is no change in polynomial, it's just that instead of
> hard-coding the value, polynomial selection depends on 'm' and 't'.
>
>
>
>> [...]
>>
>> A related question: do we have any current users of this driver that can
>> provide testing results for this series? Or is this work just tested
>> with new hardware?
>>
> Got a tested-by: jp.francois@cynove.com for BCH4
> But that was in May,2013 :-)
> http://lists.infradead.org/pipermail/linux-mtd/2013-May/047065.html
>
>
> with regards, pekon

Yes, but I am currently stuck on 3.10, and I need to migrate my out of tree
board file to a device tree, and I currently have no bandwidth for this, so=
 I
won't be able to test the whole serie, but may be some parts are
testable independently ?

I will take a look and tell you.

Regards,
Jean-Philippe Fran=C3=A7ois
