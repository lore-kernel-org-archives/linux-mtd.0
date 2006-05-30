Received: from moutng.kundenserver.de ([212.227.126.177])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FlA0g-000695-CF
	for linux-mtd@lists.infradead.org; Tue, 30 May 2006 15:36:18 -0400
From: Johannes Niess <linux@johannes-niess.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 30 May 2006 21:35:51 +0200
References: <200605272120.19348.linux@johannes-niess.de>
	<625fc13d0605290629h4aabd512q5f53e06a5399fcf7@mail.gmail.com>
	<20060530110354.GA24129@wohnheim.fh-wedel.de>
In-Reply-To: <20060530110354.GA24129@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2211157.UbUFa29LVs";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200605302135.57963.linux@johannes-niess.de>
Subject: Re: mtd2block should not expand sparse loopback files
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart2211157.UbUFa29LVs
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Dienstag, 30. Mai 2006 13:03 schrieb J=F6rn Engel:
> On Mon, 29 May 2006 08:29:03 -0500, Josh Boyer wrote:
> > On 5/27/06, Johannes Niess <linux@johannes-niess.de> wrote:
> > >I guess that the "fill with 1's" flash strategy is taking its toll
> > > together with the "Clean" markers. Can I switch that off? Using
> > >"mkfs.jffs2 --no-cleanmarkers"  does not help, as does  --eraseblock=
=3D0.
> >
> > No you can't switch it off.  The filesystem will add them itself.
>
> For now.  I have a patch pending that removes the cleanmarker
> generation from jffs2.  Still needs some polishing, though.
>
> Basically, if the mtd can do implicit erase, like any RAM, disk or
> file-based device, there is no point in the cleanmarkers and jffs2
> doesn't write them.  There might be other cases where they can be
> omitted at well.

Hi J=F6rn,

That is great news. If your patch is still applicable to a released vanilla=
=20
kernel  (or not requiring too many other patches) I'd volunteer as beta=20
tester. I see potential of wide spread use in "compact" linux distributions=
=2E=20
It makes it very easy to use a full scale distribution in reduced space.

I'm quite sure that you have seen the difference of mtd wanting 1's all ove=
r=20
the place and a sparse file returning implicit 0's when reading in the hole=
s.=20
I've no idea whether this is relevant.

I had a quick look at the source if I could find the relevant parts and do=
=20
some very nasty hacking. Given my very limited C programming skills ("C++=20
very easy", approx. 100 pages) and using Perl if I feel the need for some=20
hobby programming, I had no chance.

=46ollowing up on Josh's hint to e2compr I had the feeling that=20
"e2compr.infradead.org" would be an address to describe the current=20
status :-)  But that stuff has patches to kernel 2.6.10 . I don't consider =
it=20
being "alive" enough to be usefull.

Thank you again for developing mtd/jffs2!

Johannes

--nextPart2211157.UbUFa29LVs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEfJ6dZ86b9aw2E+0RAtomAKCtivpdwYgOD05vdHtSSkrHeVkWIACgs6Ti
hw6YoHOF03wr8DhT7dgS3AQ=
=T8Kz
-----END PGP SIGNATURE-----

--nextPart2211157.UbUFa29LVs--
