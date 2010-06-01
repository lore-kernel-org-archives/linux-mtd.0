Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OJPpa-0007VV-OX
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 11:40:27 +0000
In-Reply-To: <1275388737.25797.89.camel@macbook.infradead.org>
References: <201005311503.42629.muehlfelder@enertex.de>	
	<1275383715.25797.14.camel@macbook.infradead.org>
	<201006011126.23862.muehlfelder@enertex.de>	
	<1275384788.25797.17.camel@macbook.infradead.org>
	<OF6BA924CE.75C9F3A4-ONC1257735.0035A313-C1257735.00360683@transmode.se>
	<1275388737.25797.89.camel@macbook.infradead.org>
Subject: Re: How stable is jffs2 summarize option?
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <OF1EBB9E60.E5975679-ONC1257735.003FC2D1-C1257735.004008A6@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 1 Jun 2010 13:39:25 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: =?ISO-8859-15?Q?Thorsten_M=FChlfelder?= <muehlfelder@enertex.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote on 2010/06/01 12:38:57:
>
> On Tue, 2010-06-01 at 11:50 +0200, Joakim Tjernlund wrote:
> > >
> > > On Tue, 2010-06-01 at 11:26 +0200, Thorsten M=FChlfelder wrote:
> > > > and what do you think about switching to yaffs2? I know it is d=
eveloped
> > > > elsewhere, but it seems to be a good alternative to jffs2+summa=
ry and
> > > > probably switching is easier than to ubifs.
> > >
> > > Why would you think that switching to something that isn't part o=
f the
> > > Linux kernel would be easier than switching to ubifs? That seems.=
.. odd.
> >
> > Yes, if ubifs doesn't fit, perhaps have a look at the recently adde=
d
> > logfs?
> >
> >     Jocke
> >
> > BTW, I once tried JFFS2 summary and it didn't make much of a differ=
ence for us.
>
> Did you use 'sumtool' after creating your images? For reasons which a=
re
> now lost in the mists of time, that support wasn't just added directl=
y
> to mkfs.jffs2.

This was some years ago but I cannot recall using 'sumtool'. Also
our NOR FS is between 128 and 64 MB so perhaps it is too small to benef=
it
from summary?=
