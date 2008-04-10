Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jk3vR-0001tk-Md
	for linux-mtd@lists.infradead.org; Thu, 10 Apr 2008 21:03:17 +0000
From: "Joakim Tjernlund" <Joakim.Tjernlund@transmode.se>
To: =?iso-8859-1?Q?'Anders_Grafstr=F6m'?= <grfstrm@users.sourceforge.net>,
	<linux-mtd@lists.infradead.org>
References: <42739.212.247.11.1.1205350163.squirrel@webmail.sys.kth.se>
	<47FE7392.2060900@users.sourceforge.net>
In-Reply-To: <47FE7392.2060900@users.sourceforge.net>
Subject: RE: JFFS2: Return values of jffs2_block_check_erase error paths
Date: Thu, 10 Apr 2008 23:03:12 +0200
Message-ID: <019d01c89b4e$4a24f6f0$de6ee4d0$@Tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: sv
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> Of Anders Grafstr=F6m
> Sent: den 10 april 2008 22:08
> To: linux-mtd@lists.infradead.org
> Subject: Re: JFFS2: Return values of jffs2_block_check_erase error =
paths
>=20
> Anders Grafstr=F6m wrote:
> > It looks like the error paths in jffs2_block_check_erase() have =
wrong return values.
> > A block that failed to be erased never gets marked as bad.
> >
> > Any comments on this patch?
> >
> > Anders
> >
> >
> > diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
> > index a1db918..23e9dd6 100644
> > --- a/fs/jffs2/erase.c


[SNIP]

>=20
>=20
> Nobody looked at this?
> This issue caused a corrupt file system.
>=20
> /Anders

Looks good to me, but I think you should add your own signoff, write a
proper commit message and send it to Linus/Andrew as David appears busy.

Signed-off-by: Joakim Tjernlund <Joakim.Tjenrlund@transmode.se>
