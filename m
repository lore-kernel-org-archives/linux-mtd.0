Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19DoDX-00012l-PO
	for <linux-mtd@lists.infradead.org>; Thu, 08 May 2003 17:26:00 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1052408387.23135.9.camel@passion.cambridge.redhat.com>
References: <1052408387.23135.9.camel@passion.cambridge.redhat.com>
Message-Id: <1052411170.1171.16124.camel@tubarao>
Mime-Version: 1.0
Date: 08 May 2003 10:26:10 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-PB1zTznEmsXXuJzYX1HT"
cc: Axel Ludszuweit <alu@keymile.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: [Fwd: helper routines for flash chip probing, search sequence]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PB1zTznEmsXXuJzYX1HT
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

> From: Axel Ludszuweit <alu@keymile.com>

> > From: David Woodhouse <dwmw2@infradead.org>
> > At first glance, you seem to be right -- you'll not get false matches
> > for 4x interleave when in fact the interleave is 2x, so we should check
> > for 4x first.=20

I also agree - although I haven't put much thought into it.

> I have a question, concerning the flash chip helper
> routines
>       linux/drivers/mtd/chips/gen_probe.c
>=20
> In my opinion, the searching sequence, to find the
> flash geometry, (cfi->device_type and cfi->interleave)
> must be reversed, to prevent wrong decisions.
> If the buswidth is given, the search should begin=20
> with the highest meaningfull interleave and the lowest
> device type.

Sounds correct - haven't tried the patch.

> With the current searching order I get the following
> effect.
>=20
> I have 4 8bit flashes working on a 32 bit data bus.
> The Manufacture ID is 0x89, the Device ID 0xAA.
> The flash type is SHARP LH28F016SCT-L95

Uhhh, something isn't correct here:

from jedec_probe.c:
#define MANUFACTURER_INTEL	0x0089
#define I28F016S3	0x00aa

Does Sharp mimic Intel?

I just checked the data sheets for both chips and both claim the same
manufacturer and part identifiers.  Did one license the others design?=20
This is just _pure_evil_!  I don't care if they are supposed to be
compatible (they look similar at first glance), they need to have
different ID's.

> The correct values, which should be detected are:
>=20
> - cfi->device_type =3D  1   CFI_DEVICETYPE_X8
> - cfi->interleave  =3D  4   CFIDEV_INTERLEAVE_4
>=20
> but the probing detected=20
>=20
>   cfi->interleave  =3D CFIDEV_INTERLEAVE_2=20
>   cfi->device_type =3D CFI_DEVICETYPE_X16.

This should be fixed in the current version (1.26) of jedec_probe.c - it
doesn't allow the matching of output data widths that aren't supported
by the chip. See the following lines in jedec_match():


	uaddr =3D finfo_uaddr(finfo, cfi->device_type);
	if ( MTD_UADDR_NOT_SUPPORTED ) {
		goto match_done;
	}

If the part data width doesn't match what is probed then it is
unsupported and the match fails.

This, however, doesn't mean that changing the probe order in
gen_probe.c: genprobe_new_chip() - I think that is needed _as_well_.

> as valid, so that the test with the correct values, following later,
> will not be done.
> The identifier codes of this SHARP flashes can be read at offset
> 0 and 1 after writing 0x90 at any arbitrary address in the flash space.
> The unlock sequence=20
>   0xaa at cfi->addr_unlock1 =3D 0x555 and=20
>   0x55 at cfi->addr_unlock2 =3D 0x2aa
> seems not to be neccessary.

Fixing this is slowly creeping into the code.  Right now we have the
unlock addresses enumerated.  It's just one more evolutionary step to
use that list when searching for chips and finding matches.  I had a few
concerns about how I was going to make the change and therefor I didn't
- now I don't remember what my concerns were . . ..  I have several
changes queued up that I want to make so that probes are more correct
and chips can be better configured.  Maybe one day I'll get a round
tuit.

> The flashes 0 and 2 are unlocked by 0x00900090, flashes 1 and 4 not,
> so that 0 and 2 answers with th correct ID and 1 and 3 with 0x00.
>=20
> If the search order is reversed, the test with the correct values is made
> before the test with wrong parameters.

Sounds sane - once again, I haven't looked too closely.

> I have attached a patch, which should prevent such wrong decisions, if
> the flashes are not correctly designed.

Thanks for the work.

> Does anyone know reasons, that the search order should not be reversed?

I'll do some further investigation soon - hopefully today.

--=20
Thayne Harbaugh
Linux Networx

--=-PB1zTznEmsXXuJzYX1HT
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+uoUifsBPTKE6HMkRArhTAJ4+vuBDX8wKJhlQ34CSv4AhtNGvmgCfcYNM
dGMSe6T8jlWlSWRALeirbYo=
=Q/2B
-----END PGP SIGNATURE-----

--=-PB1zTznEmsXXuJzYX1HT--
