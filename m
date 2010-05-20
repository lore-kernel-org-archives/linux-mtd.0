Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OF6pi-0002IY-H2
	for linux-mtd@lists.infradead.org; Thu, 20 May 2010 14:34:47 +0000
Received: by pwj1 with SMTP id 1so800691pwj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 May 2010 07:34:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B030D991ECA@dbde02.ent.ti.com>
References: <s-ghorai@ti.com>
	<1274181389-7488-1-git-send-email-s-ghorai@ti.com>
	<1274181389-7488-2-git-send-email-s-ghorai@ti.com>
	<AANLkTikFxtzDpiJvJjnuonM2urMJR1LDLafx5JtpC_bS@mail.gmail.com>
	<1274284094.6286.17.camel@thunk>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D991D50@dbde02.ent.ti.com>
	<AANLkTikK4ISAsLFS-l5fXGxCppv98F2qqb8OBnZ7OTHd@mail.gmail.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B030D991ECA@dbde02.ent.ti.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 20 May 2010 20:04:23 +0530
Message-ID: <AANLkTikc0eClJmG37KNaApEVOyumT9gWRiDslFBKWehB@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] omap3 gpmc: functionality enhancement
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"tony@atomide.com" <tony@atomide.com>,
	"sakoman@gmail.com" <sakoman@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"peter.barada@gmail.com" <peter.barada@gmail.com>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 20, 2010 at 11:08 AM, Ghorai, Sukumar <s-ghorai@ti.com> wrote:
> Vimal,
>
>> -----Original Message-----
>> From: Vimal Singh [mailto:vimal.newwork@gmail.com]
>> Sent: 2010-05-20 00:01
>> To: Ghorai, Sukumar
>> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org;
>> tony@atomide.com; sakoman@gmail.com; mike@compulab.co.il;
>> Artem.Bityutskiy@nokia.com; peter.barada@gmail.com
>> Subject: Re: [PATCH v3 1/3] omap3 gpmc: functionality enhancement
>>
>> On Wed, May 19, 2010 at 11:34 PM, Ghorai, Sukumar <s-ghorai@ti.com> wrot=
e:
>> >> > > +
>> >> > > + =A0 =A0 =A0 case GPMC_CONFIG_RDY_BSY:
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regval =A0=3D gpmc_cs_read_reg(cs, =
GPMC_CS_CONFIG1);
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 regval |=3D WR_RD_PIN_MONITORING;
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_cs_write_reg(cs, GPMC_CS_CONFI=
G1, regval);
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> >> >
>> >> > IIRC, at least in OMAP2/3, ready/busy pin is not in use (not
>> connected).
>> >>
>> >> On the Logic OMAP3530 LV SOM and Torpedo modules, the R/B# pin of the
>> >> NAND in the Micron mt29c2g4maklajg-6it POP part is connected to the
>> >> WAIT0 pin on the OMAP3530 and I'm looking to use it to speed up NAND
>> >> accesses
>> > [Ghorai] So better keep this feature,
>>
>> Yes, looks like there are some boards which can still take advantage of
>> this.
>>
>> >>
>> [...]
>> >> > > @@ -456,13 +572,20 @@ EXPORT_SYMBOL(gpmc_prefetch_enable);
>> >> > > =A0/**
>> >> > > =A0* gpmc_prefetch_reset - disables and stops the prefetch engine
>> >> > > =A0*/
>> >> > > -void gpmc_prefetch_reset(void)
>> >> > > +int gpmc_prefetch_reset(int cs)
>> >> > > =A0{
>> >> > > + =A0 =A0 =A0 if (gpmc_pref_used =3D=3D cs)
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_pref_used =3D -EINVAL;
>> >> > > + =A0 =A0 =A0 else
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>> >> > > +
>> >> >
>> >> > This is also not required. As, this function will be called only if
>> >> > prefetch was used.
>> > [Ghorai] Agree. Can you see this input too?
>> > http://www.mail-archive.com/linux-omap@vger.kernel.org/msg28520.html
>>
>> Exactly, this is what I am telling here. Enable prefetch engine call
>> is already being check for *busy* or not.
>>
>> >
>> [...]
>> >> > > +int gpmc_ecc_init(int cs, int ecc_size)
>> >> > > +{
>> >> > > + =A0 =A0 =A0 unsigned int val =3D 0x0;
>> >> > > +
>> >> > > + =A0 =A0 =A0 /* check if ecc engine already by another cs */
>> >> > > + =A0 =A0 =A0 if (gpmc_ecc_used =3D=3D -EINVAL)
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpmc_ecc_used =3D cs;
>> >> > > + =A0 =A0 =A0 else
>> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBUSY;
>> >> > Here few things need be to consider:
>> >> > 1. 'init' is supposed to done once for every instance of driver
>> during
>> >> probe
>> >> > 2. But ECC engine, too, have only one instance at a time, So
>> >> > 3. As long as all NAND chip are supposed to use same ECC machenism,
>> we
>> >> > can go for only one time 'init' for all drivers, perhaps in
>> >> > gpmc_nand.c.
>> >> > 4. But in case, different instances of driver (or NAND chip) requir=
es
>> >> > different ECC machenism (for ex. Hamming or BCH, or even with
>> >> > different capabilities of error correction),
>> >> > this will no longer vailid. Then rather we should have something li=
ke
>> >> > 'gpmc_ecc_config' call to configer ECC engine for everytime a drive=
r
>> >> > needs it (something like as it is done for prefetch engine).
>> > [Ghorai]
>> > a. do you think it will reduce the throughput?
>> No. But in current implementation it will be called for each instance
>> driver. (see my 3rd point)
>>
>> > b. Moreover I think we will take this as 5th patch as cleanup/
>> improvemnt.
>> > c. And how to know that ECC engine is in used other driver should not
>> use it? Any bit to know that ecc engine is busy, as we check for prefetc=
h?
>> Do not really remember config registers. Perhaps there is no way.
>> But I guess you should check into register GPMC_ECC_CONFIG at bit 1.
>> This is the bit we are setting to enable ECC calculation, IIRC.
>>
>> > d. any further input on http://www.mail-archive.com/linux-
>> omap@vger.kernel.org/msg28520.html
>> And this what I was suggesting in my point 4. In my example
>> 'gpmc_ecc_config' is analogy to 'gpmc_ecc_request'.
>> I said *config*, since in such scenario you need to configer HW
>> ECCconfig register everytime as well, rather just checking
>> availability and enabling.
> [Ghorai] still I feel we should not mix this patch with cleanup. And yes =
if possible this will be the 5th one as cleanup.
> 4th one - prefetch cleanup
> 5th one - ecc cleanup.
> Do you think still missing anything for this patch?

As long as you take care of current comments, I do not have any
further comment for now.


--=20
Regards,
Vimal Singh
