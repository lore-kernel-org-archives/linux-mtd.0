Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190djj-0001u7-39
	for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2003 09:36:48 +0100
Received: from ash.lnxi.com ([207.88.130.242])
	by phoenix.infradead.org with smtp (Exim 4.10)
	id 190PJs-0005Wr-00
	for linux-mtd@lists.infradead.org; Tue, 01 Apr 2003 18:13:09 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: Stefan Roese <stefan.roese@esd-electronics.com>
In-Reply-To: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
References: <EFEAIMDCOOOHIEPHDNFJAEECFEAA.stefan.roese@esd-electronics.com>
Message-Id: <1049216388.25992.91.camel@tubarao>
Mime-Version: 1.0
Date: 01 Apr 2003 09:59:49 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-BThTQneA7vm4upTXv676"
cc: linux-mtd@lists.infradead.org
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-BThTQneA7vm4upTXv676
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-04-01 at 07:18, Stefan Roese wrote:
> Hi!
>=20
> I am trying to use "jedec_probe.c" on our ppc based board to support two
> different flash types (AMD AM29VL160xT and SSTI SST39LF160). Both are use=
d
> in 16bit mode. Since the SST flash is not really CFI compliant, I have to
> use jedec_probe, right?
>=20
> Two problems:
> 1) 16bit support for the AM29LV160 device.
> The simple solution is to add the 16bit part as new device. Works here fi=
ne.

Looks good.  I figured this would be a reasonable way for handling these
16bit devices.  I guess I should go back and fix all of the FIXME's.

> 2) Support for the ST39LF160 device.
> The ID-check in every block doesn't work on this device, since it's block
> size is smaller that it's unlock addresses.

Somehow I don't understand what "block size smaller than unlock
addresses" means.

>  Therefore the ID-check in every
> block has to disabled for SST devices.

I was somewhat uncertain about this method - thought it would be enough
to check just the first block.  The "check ID in every block" method was
suggested by David Woodhouse.  I implemented it because it worked for
the selection of devices I have access to - including an SST49LF040.

Should just the first block be checked for the ID for _all_ devices or
should we have "if" statements to disable it for certain devices?  I
don't like having a bunch of special cases, but I also prefer things to
work.

> Please find attached a patch for these two problems (against the current =
cvs
> version). Any comments? Could this be commited?

I'll likely commit the 16bit devices today.  I also want to do some
cleanup with unlock addresses - the addresses listed in jedec_table[]
should be used in more places (I don't like the hard-coded magic numbers
that appear in various sections of the code).

> Best regards,
> Stefan.
>=20

<old context snipped>

--=20
Thayne Harbaugh
Linux Networx

--=-BThTQneA7vm4upTXv676
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+icWEfsBPTKE6HMkRAl6HAJ43YDYGVLKNIvkmcnXbxEfJAgqFWACfQqyy
KMYGmwtbOHSz1EyBPgNi8iI=
=Zr2a
-----END PGP SIGNATURE-----

--=-BThTQneA7vm4upTXv676--
