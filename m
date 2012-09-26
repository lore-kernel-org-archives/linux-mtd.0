Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGpWX-0001w4-9n
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 11:11:26 +0000
Message-ID: <1348657873.24309.68.camel@sauron.fi.intel.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Wed, 26 Sep 2012 14:11:13 +0300
In-Reply-To: <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
 <1348651795.24309.49.camel@sauron.fi.intel.com>
 <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-9Z4hMTSngmrq7Jj4SvRb"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-9Z4hMTSngmrq7Jj4SvRb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-09-26 at 12:53 +0200, Ricard Wanderlof wrote:
> On Wed, 26 Sep 2012, Artem Bityutskiy wrote:
>=20
> > On Wed, 2012-09-26 at 13:42 +0800, Jaya Kumar wrote:
> >> I think what this means is that after doing the rootfs upgrade using
> >> ubiupdatevol, I must reboot into a 3rd partition running a minimal OS
> >> to perform the ubirename of roofs_reserve and then reboot again. This
> >> step seems expensive to have to boot into a 3rd partition to do the
> >> rename operation.
> >>
> >> I see someone else also has encountered this,
> >> http://comments.gmane.org/gmane.linux.drivers.mtd/39415 and solved by
> >> having a initramfs. I guess I could do that. But still seems messy.
> >
> > Yes, the way it is currently implemented is:
> >
> > 1. ubirename /dev/ubi0 rootfs rootfs_reserve
> > 2. UBI figures out that old 'rootfs' should be removed.
> > 3. UBI changes the volume table and wipes old rootfs from there,
> >   and changes name 'rootfs_reserve' to 'rootfs'.
> >
> >   Now if you have a power cut, you will no longer see the old rootfs
> >   vloume, only the new one.
> > 4. Then UBI actually deletes the old volume from all the in-memory
> >   data structures. Obviously, you cannot use this volume at the same
> >   time.
> >
> > But this can be improved, I did not think a lot about this, but I guess
> > if you just skip step 4, it should work. The rename will succeed, but
> > you will still see the old layout. And only when you reboot, you'll hav=
e
> > the old rootfs deleted and the new one being in place.
>=20
> But the problem is that the first step fails as the system is still=20
> running, and you can't unmount / while it is up.
>=20
> > Also, I guess the rename path should not open the volume in the
> > exclusive mode.
>=20
> Yes, that would be a workable solution, if there weren't any other=20
> disadvantages (e.g. something getting confused by the volume name=20
> changing, like df).

Well, what I say is that we only do the changes in the on-flash volume
table. The in-memory data structures are not changed. So nothing should
be confused in theory, except the user :-) Something like I'll send in
the follow-up e-mail, which Jaya can probably try.

--=20
Best Regards,
Artem Bityutskiy

--=-9Z4hMTSngmrq7Jj4SvRb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQYuLRAAoJECmIfjd9wqK00q4QAIvg0aMZ4DGP308d3IHuqtfW
1PsShh6mUUgthIAVpeBBMC83Vpak3Ef5nJESLmOfvFFdUeMbxqAEmXtXDeShPX/J
1jsSsOdZXkjRCu9y8dv5ptMBHSp2rNfyq+gNG6Gjdr8gsuvtvN7j6xjn+18ItIg7
grfaRepU3qsv3VGncK6mvbQWmeBz7F6e2Nez/qVO8gpVlXXwG+R/oBvzVNoALcpq
RlfC1W6KqL66cbj534YnHSV4ughjXATn8+sxTlf9e8Y+Yx5WSpVhGcawmIux+Ekz
x3zWj1wSHIm8KnWecMusze+HsRGB88DTV50KwTu4qYvTsng+Vh4vK9iaoAgSl65U
UogUnKMK31DzQsyy+9LswXgetA4jjo0O7Lzn8kvFeef/3eOJRsmC+5/I6pknn5Bq
SWIv9vjAaCOeBMUs625zvA2A7LCb5zif66wQ8cUVEvLz6qLHwlmQHE3FvzFldFUI
AO0B+a0EaVQu9NoYTSBUsJYUTglhEkuCHfyMEJoiZkpwZwWRhvfsbAm/YkQ5O4DD
hiP7TewIYlpQJq9xkJpvBqqyrNBCK15wJcv7SQvXVtJ5S7BXMx9UsfRvVn5Nb9zA
w3ZAtM5bqgrVvVByjRi9ziwEOaUcZqUTGVZTXX0TXYNtOW3Niw6ykezsAizI2cI+
RXCWMxg98UAuomQV84hk
=e9+X
-----END PGP SIGNATURE-----

--=-9Z4hMTSngmrq7Jj4SvRb--
