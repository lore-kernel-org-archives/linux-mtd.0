Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH V3] MTD: atmel_nand: Update driver to support Programmable
 HW ECC controller
Date: Mon, 13 Feb 2012 10:15:34 +0800
Message-ID: <4C79549CB6F772498162A641D92D5328045B52C6@penmb01.corp.atmel.com>
In-Reply-To: <1328959692.22240.103.camel@sauron.fi.intel.com>
References: <1328491977-30448-1-git-send-email-hong.xu@atmel.com>
 <1328959692.22240.103.camel@sauron.fi.intel.com>
From: "Xu, Hong" <Hong.Xu@atmel.com>
To: <dedekind1@gmail.com>,
 "linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
Cc: dwmw2@infradead.org, ivan.djelic@parrot.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,
> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Saturday, February 11, 2012 7:28 PM
> To: Xu, Hong; linux-arm-kernel
> Cc: linux-mtd@lists.infradead.org; ivan.djelic@parrot.com;
> dwmw2@infradead.org
> Subject: Re: [PATCH V3] MTD: atmel_nand: Update driver to support
Programmable
> HW ECC controller
>=20
> On Mon, 2012-02-06 at 09:32 +0800, Hong Xu wrote:
> > +static int16_t *pmecc_get_index_of(struct atmel_nand_host *host)
> > +{
> > +       int16_t *p =3D (int16_t *)host->rom_base;
>=20
> I did not really get into details, but you annotate rom_base with
> __iomem, and then you have to cast it to int16_t in several - this
does
> not look very nice.
>=20
OK, this line shall be removed actually, thanks.
The logic here is, we want to use one lookup table which sits in ROM.
ROM region is mapped into kernel space by ioremap and the VA is saved in
rom_base. The function pmecc_get_index_of and pmecc_get_alpha_to are
used to return the correct ROM offset according to SoC and PMECC
configurations.
The lookup table is of type int16.

> Could you please CC the arm list? There are much more people who can
> give this code a review.
>=20

OK, I'll resend the patch and CC the arm list.

Thanks and Br,
Eric
> --
> Best Regards,
> Artem Bityutskiy
