Message-ID: <1331644149.3595.48.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 13 Mar 2012 15:09:09 +0200
In-Reply-To: <OF1F093251.0E93488C-ONC12579C0.0046E1EF-C12579C0.0046FAF5@transmode.se>
References: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
 <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
 <OF3BA4765E.16024E23-ONC12579B5.004E96D5-C12579B5.004FAAF8@transmode.se>
 <1331289909.22872.65.camel@sauron.fi.intel.com>
 <OF75BE5BF1.29391153-ONC12579C0.002D7F3D-C12579C0.002E7828@transmode.se>
 <1331642936.3595.39.camel@sauron.fi.intel.com>
 <OF1F093251.0E93488C-ONC12579C0.0046E1EF-C12579C0.0046FAF5@transmode.se>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UWT14OazFHWWtYbCkCPh"
Mime-Version: 1.0
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, philipp.zabel@gmail.com,
 Paul Parsons <lost.distance@yahoo.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UWT14OazFHWWtYbCkCPh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-03-13 at 13:55 +0100, Joakim Tjernlund wrote:
> >
> > On Tue, 2012-03-13 at 09:27 +0100, Joakim Tjernlund wrote:
> > > >
> > > > On Fri, 2012-03-02 at 15:30 +0100, Joakim Tjernlund wrote:
> > > > > yes, UBI probably has some different use. One seems that it keeps
> > > > > erasing the
> > > > > same block over and over again if the erase fails. JFFS2 doesn't =
do
> > > > > that since
> > > > > you can't trust a block that is failing erase(how can you be sure=
 that
> > > > > write will work?)
> > > > > So, IMHO, UBIFS should reconsider this policy.
> > > >
> > > > The thread is very long and I would like save my time by not going
> > > > through it. But if you could start a new thread and formulate the
> > > > problem with UBI, I could think about it a bit. I am open to change
> > > > policies if it is not too much work.  Otherwise I am open to give h=
ints
> > > > and suggestions and accept patches which change the policy. :-)
> > >
> > > I just noted from one of the logs Paul sent, it LOOKED like UBI tried
> > > to erase the same sector several times if erase failed, gave me the i=
mpression
> > > that UBI would try erasing a failing sector over and over again.
> > > I think Paul will have to provide details if this is the case or not.
> >
> > Correct, UBI does retry erasing several times, see function
> > 'do_sync_erase()' in drivers/mtd/ubi/io.c. Why would this be a problem?
>=20
> How can you trust a sector that fails to erase several times and then sud=
denly works ?

It could be a transient error, some random noise in the line, some
electrons did not want to move by an accident, something like this :-)

But I guess it does not make much sense for erase and write. For read it
does make sense to re-try. I am happy to accept a patch.

--=20
Best Regards,
Artem Bityutskiy

--=-UWT14OazFHWWtYbCkCPh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPX0b1AAoJECmIfjd9wqK0amUP/1p5L3+MW7+8jOkhmNbHt1pH
MxvWocqTLJ/CV1Y8wq8GrE75OBuFhDXiskrYuS9c8b4X3JCzHS25c5k9rzw1utL5
66PDHuC2X7ol2thcD2q2Q9Oae/N2A0r91hEVTBI71nzk1OTmGPBBR9BrjdQwFXSv
QzqrKk0fj2kWUdcD8WJhBbUgehpvaNVbRAax+JoiIcE056ToxeHxLc/yIJ6mKyAz
RaHjey/Z4OrsTQh5+WBQWz6s2dXTzjiltuep9pBun4kMdeTDArfB/SWQlAwhBfQx
CktRxXXx+BS2Zp1I4rytsQgejWGQn9v8C58rLNh+D6VfRv81kcOo4tUd5UG/kUhk
dw8x9ELM4Khph55Xe+OPHw4tjDVLRv2HCCPudcwWGJIpgoviPNav59wisgEtJDFJ
tpcaXYw8k315+tl+fAZY9Hn7MECVGLfvmVkXP1yQB6onDW+9r8VhgczYvl81zqH9
ZpMi2kNk5R2nc4UEmZ+0ppBYxWYvJvFBpLI4XD709kIKPeakHvSEfFdb+H97o2wK
Snu8wdE0Wg+eGXTAnRgi/lGTbm77mDJTOsZMNwlzyq7qknsZ3O7Q8i+T491gsJ43
U+5yUUIHaC/n/2QFPsCaaTww1R1Jyq+kNFUHlyjvLqXyjqYdC94krO9Wt9L6SRY4
xZIUVZuonz85irwxIME8
=EKZ6
-----END PGP SIGNATURE-----

--=-UWT14OazFHWWtYbCkCPh--
