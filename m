Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWsUU-0005su-If
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 14:54:22 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: Eric Millbrandt <emillbrandt@dekaresearch.com>, "'Sean Preston'"
	<seanp@pfk.co.za>, Linux-MTD List <linux-mtd@lists.infradead.org>
Date: Thu, 8 Jul 2010 09:54:10 -0500
Subject: RE: New NAND Help
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D9F13518B@dlee01.ent.ti.com>
References: <002501cb1e9b$a28bdbb0$e7a39310$@pfk.co.za>
	<0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD325405DE5AE@dekaexchange07.deka.local>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> >
> <snip>
> >
> > Looking at the drivers/mtd/nand section of the tree I have added the ne=
w
> > chip ID to nand_ids.c  There already appears to be support for 4096 pag=
e
> > sizes and 512K block sizes.  What else would I need to check to ensure
> > that
> > the kernel is able to probe this chip and load the driver needed for it=
.
> > The driver currently being loaded is the davinci_nand driver.  I have
> > managed to get this chip working with uBoot which uses a modified
> version
> > of
> > the MTD driver.
> >
> I found that some of the newer Micron nand chips don't store information
> about the chip layout in the id block anymore.  It's all been moved to th=
e
> parameter page.  nand_get_flash_type(), in nand_base.c, relies on that
> data to correctly describe the chip layout, so you may need to hardcode
> the pagesize and eraseblock size in the nand_flash_ids table.
>=20
> Take a look at the READ ID operation section in the micron datasheet to
> see if the relevant data is still exists, otherwise you need to hardcode
> those values.
>=20
> Eric
>=20
This device is probably a ONFI device. Thus the fourth ID byte might not be=
 properly interpreted.

The best would be to just hard code the values in the device ids table
