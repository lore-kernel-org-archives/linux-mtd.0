Received: from fastmail.fm ([209.61.183.86] helo=www.fastmail.fm)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189LGa-0002Dl-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 08:10:24 +0000
Content-Transfer-Encoding: 7bit
Content-Type: multipart/mixed; boundary="_----------=_103657203842501"
MIME-Version: 1.0
Date: Wed, 6 Nov 2002 08:40:38 UT
From: "Jeffrey Lim" <jfsworld@fastmail.fm>
To: Dave@imladris.demon.co.uk
Cc: "linux-mtd list" <linux-mtd@lists.infradead.org>,
	jfsworld@fastmail.fm
Subject: Re: [PATCH] patches/patchin.sh (was Re: MTD CVS: missing JFFS2?)
Message-Id: <20021106084038.3FEDF2FD15@server4.fastmail.fm>
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

This is a multi-part message in MIME format.

--_----------=_103657203842501
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="ISO-8859-1"

Sorry there - here's the missing patch (attached)

-jf

On Wed, 6 Nov 2002 02:09:32 UT, "Jeffrey Lim" <jfsworld@fastmail.fm>
said:
> Hi David,
>=20
> referencing the email below, this is a simple patch to patches/patchin.sh
> (dated in the CVS Wed Apr 25 12:10:23 2001) to "patch in" the jffs2 code
> as well. Currently patchin.sh only patches in the latest mtd code, and
> jffs, but not jffs*2*)=20
>=20
> Would you mind looking over the diff to see if i missed out anything that
> should be patched in as well?
> Thanks.
>=20
> -jf
>=20
> On Tue, 5 Nov 2002 20:27:22 +0100, "J=F6rn Engel"
> <joern@wohnheim.fh-wedel.de> said:
> > On Tue, 5 November 2002 17:21:24 +0000, Jeffrey Lim wrote:
> > >=20
> > > I assume David Woodhouse is the person to whom i should submit the pa=
tch
> > > to patchin.sh to? (oh boy).
> >=20
> > Correct. It would be nice, if you cc'd the mailinglist as well.
> >=20
> > > I'll have a patch ready first thing i get to work later.
> >=20
> > Cool!
> >=20
> > J=F6rn
> >=20
> > --=20
> > ticks =3D jiffies;
> > while (ticks =3D=3D jiffies);
> > ticks =3D jiffies;
> > -- /usr/src/linux/init/main.c
> >=20
>=20
>=20=20
> --
>   "It's an extraordinary world!" - jfsworld <at> fastmail.fm
>=20=20
>=20=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20

=20
--
  "It's an extraordinary world!" - jfsworld <at> fastmail.fm
=20
=20

--_----------=_103657203842501
Content-Disposition: attachment; filename="patchin.sh.diff"
Content-Transfer-Encoding: base64
Content-Type: application/unknown; name="patchin.sh.diff"

NDdhNDgsNTMKPiAjCShKZWZmcmV5IExpbSkgaW5jbHVkZSBzeW1saW5rcyBm
b3IgamZmczIgY29kZSBhcyB3ZWxsCj4gIwo+IGxuIC1zZiAkVE9QRElSL2Zz
L2pmZnMyLyouW2NoXSBmcy9qZmZzMgo+IGxuIC1zZiAkVE9QRElSL2ZzL2pm
ZnMyLypha2VmaWxlIGZzL2pmZnMyCj4gbG4gLXNmICRUT1BESVIvaW5jbHVk
ZS9saW51eC9qZmZzMiogaW5jbHVkZS9saW51eC9qZmZzMioKPiAK

--_----------=_103657203842501--
