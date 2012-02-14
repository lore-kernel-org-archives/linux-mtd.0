Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] MTD: atmel_nand: Update driver to support Programmable HW
 ECC controller
Date: Tue, 14 Feb 2012 09:10:29 +0800
Message-ID: <4C79549CB6F772498162A641D92D5328045B5ADE@penmb01.corp.atmel.com>
In-Reply-To: <1329134891.22240.116.camel@sauron.fi.intel.com>
References: <1329117469-23637-1-git-send-email-hong.xu@atmel.com>
 <1329134891.22240.116.camel@sauron.fi.intel.com>
From: "Xu, Hong" <Hong.Xu@atmel.com>
To: <dedekind1@gmail.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI Artem,

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Monday, February 13, 2012 8:08 PM
> To: Xu, Hong
> Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH] MTD: atmel_nand: Update driver to support
Programmable
> HW ECC controller
>=20
> On Mon, 2012-02-13 at 15:17 +0800, Hong Xu wrote:
> > The Programmable Hardware ECC (PMECC) controller is a programmable
binary
> > BCH(Bose, Chaudhuri and Hocquenghem) encoder and decoder. This
controller
> > can be used to support both SLC and MLC NAND Flash devices. It
supports to
> > generate ECC to correct 2, 4, 8, 12 or 24 bits of error per sector
of data.
> >
> > To use this driver, the user needs to pass in the correction
capability and
> > the sector size.
> >
> > This driver has been tested on AT91SAM9X5-EK and AT91SAM9N12-EK with
JFFS2,
> > YAFFS2, UBIFS and mtd-utils.
> >
> > Signed-off-by: Hong Xu <hong.xu@atmel.com>
>=20
> Please, do not forget to fix the following warnings as well:
>=20
> Sparse:
> +drivers/mtd/nand/atmel_nand.c:1446:52: warning: Using plain integer
as NULL
> pointer [sparse]
>=20
> gcc:
> +drivers/mtd/nand/atmel_nand.c: In function 'atmel_nand_probe':
> +drivers/mtd/nand/atmel_nand.c:1451:1: warning: label 'err' defined
but not
> used [-Wunused-label]
>=20

OK, I'll also check with `sparse' as well. Thanks.

BR,
Eric

> --
> Best Regards,
> Artem Bityutskiy
