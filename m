Received: from fastmail.fm ([209.61.183.86] helo=www.fastmail.fm)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189FAI-0001WR-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 01:39:30 +0000
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
Date: Wed, 6 Nov 2002 02:09:32 UT
From: "Jeffrey Lim" <jfsworld@fastmail.fm>
To: Dave@imladris.demon.co.uk
Cc: "linux-mtd list" <linux-mtd@lists.infradead.org>
Subject: [PATCH] patches/patchin.sh (was Re: MTD CVS: missing JFFS2?)
Message-Id: <20021106020932.A463B2FD34@server4.fastmail.fm>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi David,

referencing the email below, this is a simple patch to patches/patchin.sh
(dated in the CVS Wed Apr 25 12:10:23 2001) to "patch in" the jffs2 code
as well. Currently patchin.sh only patches in the latest mtd code, and
jffs, but not jffs*2*)=20

Would you mind looking over the diff to see if i missed out anything that
should be patched in as well?
Thanks.

-jf

On Tue, 5 Nov 2002 20:27:22 +0100, "J=F6rn Engel"
<joern@wohnheim.fh-wedel.de> said:
> On Tue, 5 November 2002 17:21:24 +0000, Jeffrey Lim wrote:
> >=20
> > I assume David Woodhouse is the person to whom i should submit the patch
> > to patchin.sh to? (oh boy).
>=20
> Correct. It would be nice, if you cc'd the mailinglist as well.
>=20
> > I'll have a patch ready first thing i get to work later.
>=20
> Cool!
>=20
> J=F6rn
>=20
> --=20
> ticks =3D jiffies;
> while (ticks =3D=3D jiffies);
> ticks =3D jiffies;
> -- /usr/src/linux/init/main.c
>=20

=20
--
  "It's an extraordinary world!" - jfsworld <at> fastmail.fm
=20
=20
