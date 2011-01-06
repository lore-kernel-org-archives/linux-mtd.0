Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PanP1-00024A-J0
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 10:49:08 +0000
Date: Thu, 6 Jan 2011 11:48:49 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 2/6] mtd: cfi: add writebufsize initialization
Message-ID: <20110106114849.4add9726@wker>
In-Reply-To: <AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
References: <292342500.2538.65.camel@localhost>
	<1292539339-25111-3-git-send-email-agust@denx.de>
	<AANLkTi=DHrBiBd8j3fFR5zmuX2cXC05sEFFRdF_btK3Y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 Dec 2010 17:36:57 +0100
Guillaume LECERF <glecerf@gmail.com> wrote:

> Hello.

Hello.

> 2010/12/16 Anatolij Gustschin <agust@denx.de>:
> > Initialize mtd->writebufsize to the value obtained
> > by CFI query command at probe time.
> >
> > Signed-off-by: Anatolij Gustschin <agust@denx.de>
> > ---
> > --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> > +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> > @@ -428,6 +428,10 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *=
map, int primary)
> > =A0 =A0 =A0 =A0mtd->flags =A0 =3D MTD_CAP_NORFLASH;
> > =A0 =A0 =A0 =A0mtd->name =A0 =A0=3D map->name;
> > =A0 =A0 =A0 =A0mtd->writesize =3D 1;
> > + =A0 =A0 =A0 mtd->writebufsize =3D 1 << cfi->cfiq->MaxBufWriteSize;
>=20
> What about wbufsize initialized in cfi_amdstd_write_buffers() to
> "cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize" ?
> I don't know this piece of code, but I just wanted to point it to you.

wbufsize is initialized there so that it takes into account the
chip interleaving. If we e.g. have 64 byte write buffer in each
chip and two 16-bit chips in 32-bit bank, the wbufsize will be
initialized to 128 since the cfi_interleave(cfi) will return 2 in
this case. It is really local to the cfi driver. For UBI to work
correctly we need to export the the real physical write buffer size
of one chip, nothing else. So my patch is correct.

Anatolij
