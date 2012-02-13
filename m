Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] MTD: atmel_nand: Update driver to support Programmable HW
 ECC controller
Date: Mon, 13 Feb 2012 17:04:54 +0800
Message-ID: <4C79549CB6F772498162A641D92D5328045B582C@penmb01.corp.atmel.com>
In-Reply-To: <20120213084516.GB3378@game.jcrosoft.org>
References: <1329117469-23637-1-git-send-email-hong.xu@atmel.com>
 <20120213084516.GB3378@game.jcrosoft.org>
From: "Xu, Hong" <Hong.Xu@atmel.com>
To: "Jean-Christophe PLAGNIOL-VILLARD" <plagnioj@jcrosoft.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi JC,

> -----Original Message-----
> From: Jean-Christophe PLAGNIOL-VILLARD [mailto:plagnioj@jcrosoft.com]
> Sent: Monday, February 13, 2012 4:45 PM
> To: Xu, Hong
> Cc: dedekind1@gmail.com; linux-mtd@lists.infradead.org;
dwmw2@infradead.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH] MTD: atmel_nand: Update driver to support
Programmable
> HW ECC controller
>=20
> On 15:17 Mon 13 Feb     , Hong Xu wrote:
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
> > ---
> this patch must be based on the nand fixes and DT support
>=20
> and pass the rom code base via resoruces
>=20
> and drop the ifdef

OK no problem. I'll collect other comments, then merge and convert it
with DT support.

BR,
Eric

> Best Regards,
> J.
