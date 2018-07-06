Received: from mail1.bemta24.messagelabs.com ([67.219.250.211])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbNiX-0007jE-Uu
 for linux-mtd@lists.infradead.org; Fri, 06 Jul 2018 10:12:02 +0000
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
Date: Fri, 6 Jul 2018 10:11:39 +0000
Message-ID: <TY1PR01MB095429D459916B87806557F8DC470@TY1PR01MB0954.jpnprd01.prod.outlook.com>
References: <20180702025045.29896-1-ikegami@allied-telesis.co.jp>
 <20180702025045.29896-2-ikegami@allied-telesis.co.jp>
 <20180702061929.GA7611@kroah.com>
 <TY1PR01MB095431D99EEBB4D53459354BDC430@TY1PR01MB0954.jpnprd01.prod.outlook.com>
 <20180702072311.GA4817@kroah.com>
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

Let me confirm below.
About the patches 2, 3 and 4 below still should I prepare the commit IDs fo=
r revised version?
Or those can be added to the stable trees next time without commit IDs?

>   Patch: 2. 85a82e28b023 mtd: cfi_cmdset_0002: Change definition naming
> to retry write operation
>          3. 45f75b8a919a mtd: cfi_cmdset_0002: Change erase functions
> to retry for error
>          4. 79ca484b6130 mtd: cfi_cmdset_0002: Change erase functions
> to check chip good only
>=20
>   Note: The commit IDs are on mainline so there are not existed for
> revised version patches.

I think that the patches revised version are still existing on the linux-mt=
d Patchwork without commit IDs.
  <https://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D53133&stat=
e=3D*>

Sorry for this confirmation but I am not sure how to resolve this to apply =
these revised version patches to stable trees.

Regards,
Ikegami

> -----Original Message-----
> From: IKEGAMI Tokunori
> Sent: Monday, July 02, 2018 4:34 PM
> To: 'Greg Kroah-Hartman'
> Cc: PACKHAM Chris; Brian Norris; David Woodhouse; Boris Brezillon; Marek
> Vasut; Richard Weinberger; Cyrille Pitchen;
> linux-mtd@lists.infradead.org; stable@vger.kernel.org; Boris
> Brezillon
> Subject: RE: [PATCH 1/4] mtd: cfi_cmdset_0002: Change write buffer to
> check correct value
>=20
> The 1 patch below has been added to review into the following 5 trees.
>=20
>   Patch: 1. dfeae1073583 mtd: cfi_cmdset_0002: Change write buffer to
> check correct value
>=20
>   Tree: 1. 3.18-stable
>         2. 4.4-stable
>         3. 4.9-stable
>         4. 4.14-stable
>         5. 4.17-stable
>=20
> So please applied the remaining 3 patches below as same.
>=20
>   Patch: 2. 85a82e28b023 mtd: cfi_cmdset_0002: Change definition naming
> to retry write operation
>          3. 45f75b8a919a mtd: cfi_cmdset_0002: Change erase functions
> to retry for error
>          4. 79ca484b6130 mtd: cfi_cmdset_0002: Change erase functions
> to check chip good only
>=20
>   Note: The commit IDs are on mainline so there are not existed for
> revised version patches.
>=20
> > -----Original Message-----
> > From: Greg Kroah-Hartman [mailto:gregkh@linuxfoundation.org]
> > Sent: Monday, July 02, 2018 4:23 PM
> > To: IKEGAMI Tokunori
> > Cc: PACKHAM Chris; Brian Norris; David Woodhouse; Boris Brezillon;
> Marek
> > Vasut; Richard Weinberger; Cyrille Pitchen;
> > linux-mtd@lists.infradead.org; stable@vger.kernel.org; Boris
> > Brezillon
> > Subject: Re: [PATCH 1/4] mtd: cfi_cmdset_0002: Change write buffer to
> > check correct value
> >
> > On Mon, Jul 02, 2018 at 07:16:47AM +0000, IKEGAMI Tokunori wrote:
> > > Hi Greg-san,
> > >
> > > The commit IDs on mainline are below.
> > >
> > >   1. dfeae1073583 mtd: cfi_cmdset_0002: Change write buffer to check
> > correct value
> > >   2. 85a82e28b023 mtd: cfi_cmdset_0002: Change definition naming to
> > retry write operation
> > >   3. 45f75b8a919a mtd: cfi_cmdset_0002: Change erase functions to
> > retry for error
> > >   4. 79ca484b6130 mtd: cfi_cmdset_0002: Change erase functions to
> > check chip good only
> > >
> > > Note:
> > >   The patches just sent today as revised are only existing with commi=
t
> > IDs on my local environment.
> > >   Also the patches are existing on the Linux MTD development
> patchwork
> > as below but the commit IDs are not assigned.
> > >
> >
> <https://patchwork.ozlabs.org/project/linux-mtd/list/?series=3D53133>
> > >
> > >   If those revised patches should be applied anywhere to have commit
> > IDs at first please let me know.
> > >   Probably it should be consulted with the MTD maintainer Boris-san.
> >
> > And what stable tree(s) do you want to see these applied to?
> >
> > thanks,
> >
> > greg k-h
