Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ImI1J-0006kz-GX
	for linux-mtd@lists.infradead.org; Sun, 28 Oct 2007 23:58:21 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'Jörn Engel'" <joern@logfs.org>,
	"'Jamie Lokier'" <jamie@shareable.org>
Subject: RE: getdents64 problem in 2.6.23
Date: Mon, 29 Oct 2007 00:58:09 +0100
Message-ID: <005201c819be$649f47e0$5267a8c0@Jocke>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20071028234950.GA25386@lazybastard.org>
Cc: 'Linux-MTD Mailing List' <linux-mtd@lists.infradead.org>,
	'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: J=F6rn Engel [mailto:joern@logfs.org]=20
> Sent: den 29 oktober 2007 00:50
> To: Jamie Lokier
> Cc: J=F6rn Engel; David Woodhouse; 'Linux-MTD Mailing List';=20
> Joakim Tjernlund
> Subject: Re: getdents64 problem in 2.6.23
>=20
> On Sun, 28 October 2007 18:28:36 +0000, Jamie Lokier wrote:
> >=20
> > However, I think it's fine to _overwrite_ the deletion dirents with
> > new ones.  getdentds() allows new names created during a directory
> > read to appear or not in the lsit.
>=20
> Correct.  You can delete/overwrite dentries, but you may not rearrange
> their order wrt. i_pos cookies.
>=20
> J=F6rn

David, before rewriting getdents et. all may I ask you to apply the
patch I sent today? Then we will have something that works and go
from there.

     Jocke
