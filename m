Received: from mail1.bemta23.messagelabs.com ([67.219.246.2])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZt58-0002TT-2v
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2018 07:17:13 +0000
From: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: PACKHAM Chris <chris.packham@alliedtelesis.co.nz>, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Boris
 Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>
Subject: RE: [PATCH 1/4] mtd: cfi_cmdset_0002: Change write buffer to check
 correct value
Date: Mon, 2 Jul 2018 07:16:47 +0000
Message-ID: <TY1PR01MB095431D99EEBB4D53459354BDC430@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180702025045.29896-1-ikegami@allied-telesis.co.jp>
 <20180702025045.29896-2-ikegami@allied-telesis.co.jp>
 <20180702061929.GA7611@kroah.com>
In-Reply-To: <20180702061929.GA7611@kroah.com>
Content-Language: ja-JP
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

Hi Greg-san,

The commit IDs on mainline are below.

  1. dfeae1073583 mtd: cfi_cmdset_0002: Change write buffer to check correc=
t value
  2. 85a82e28b023 mtd: cfi_cmdset_0002: Change definition naming to retry w=
rite operation
  3. 45f75b8a919a mtd: cfi_cmdset_0002: Change erase functions to retry for=
 error
  4. 79ca484b6130 mtd: cfi_cmdset_0002: Change erase functions to check chi=
p good only

Note:
  The patches just sent today as revised are only existing with commit IDs =
on my local environment.
  Also the patches are existing on the Linux MTD development patchwork as b=
elow but the commit IDs are not assigned.
    <https://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D53133>

  If those revised patches should be applied anywhere to have commit IDs at=
 first please let me know.
  Probably it should be consulted with the MTD maintainer Boris-san.

Regards,
Ikegami

> -----Original Message-----
> From: Greg Kroah-Hartman [mailto:gregkh@linuxfoundation.org]
> Sent: Monday, July 02, 2018 3:19 PM
> To: IKEGAMI Tokunori
> Cc: PACKHAM Chris; Brian Norris; David Woodhouse; Boris Brezillon; Marek
> Vasut; Richard Weinberger; Cyrille Pitchen;
> linux-mtd@lists.infradead.org; stable@vger.kernel.org; Boris
> Brezillon
> Subject: Re: [PATCH 1/4] mtd: cfi_cmdset_0002: Change write buffer to
> check correct value
>=20
> On Mon, Jul 02, 2018 at 11:50:42AM +0900, Tokunori Ikegami wrote:
> > For the word write it is checked if the chip has the correct value.
> > But it is not checked for the write buffer as only checked if ready.
> > To make sure for the write buffer change to check the value.
> >
> > It is enough as this patch is only checking the last written word.
> > Since it is described by data sheets to check the operation status.
> >
> > Signed-off-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
> > Reviewed-by: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> > Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> > Cc: linux-mtd@lists.infradead.org
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> >  drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> What are the git commit ids for all of these patches, and what stable
> tree do they need to go to?
>=20
> thanks,
>=20
> greg k-h
