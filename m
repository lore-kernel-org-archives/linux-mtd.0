From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 20 Feb 2003 11:07:41 -0700
Subject: Wacky JEDEC probes
In-Reply-To: <1045758752.27290.9.camel@passion.cambridge.redhat.com>
References: <1045671999.2672.28.camel@tubarao>
 <1045758752.27290.9.camel@passion.cambridge.redhat.com>
Message-ID: <1045764461.2666.249.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-JvFNgpyu86frQRjcaU5h
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-02-20 at 09:32, David Woodhouse wrote:
> On Wed, 2003-02-19 at 16:26, Thayne Harbaugh wrote:
> > I have been experiencing wacky JEDEC probes which have the following
> > symptoms:
> >=20

<snip>

> > The obvious problem is that there is no way to challenge a device and
> > discover if it truly is in ID mode.  Because of this one must assume
> > that sending the unlock sequence was correct and really worked.
>=20
> Some devices don't _have_ an unlock sequence though.

These devices I have marked with MTD_UADDR_UNNECESSARY

> I'm more inclined
> to follow the route of taking the chip _out_ of ident mode and checking
> the contents change. Bear in mind that (IIRC) we should get the correct
> ident from offset 0 and 1 in _every_ erase block, shouldn't we?

The problem I saw had the ident written to the device in every block -
it's a long story about how it happen and not likely to happen, but it
illustrates a hole in the detection process.

>=20
> After finding an ident, we put the chip back in read mode and check for
> the ident again. If it hasn't changed (i.e. the data matches the ident
> we think we saw) then go back to ident mode and check for the ids in the
> _next_ eraseblock instead. Or something like that ;)

Seems to me that this is a lot of checking that only needs to be done
for the MTD_UADDR_UNNECESSARY devices.

>=20
>=20
> > - Some devices have 8 bit and 16 bit modes and have unique unlock
> > addresses for each.  I'm not sure which ones should be used - that's wh=
y
> > these cases are labeled as "FIXME."
>=20
> The one you use depends on the mode the chip is in -- you'd probably end
> up wanting two separate entries for these chips, or depending on which
> mode we're in.

Should be doable similar to the regions member in amd_flash_info.

>=20
> > - It appears that some CFI devices are in the jedec_table[] - I'm not
> > sure if this is desirable.
>=20
> Possibly not. Who added them and when? (cvs annotate :)

Trying to get to CVS (I guess I could use anonymous CVS, but I'm waiting
to have a more personalized service :)

>=20
> > - The unlock_addrs[] array enumerates the known unlock addresses.  I
> > have noticed that these address pairs can be x555/x2aa, x555/xaaa,
> > x5555/x2aaa, x5555/xaaaa, x0/x0.  Some of these pairs are not currently
> > listed because they are used for 8 bit mode on 16 bit devices.  Now tha=
t
> > these addresses are enumerated it might be better to iterate over the
> > list instead of keep state while shifting and or'ing.
>=20
> That's a sane idea and entirely orthogonal to the original change, I
> suppose.

I'll look into changing that later - the problem is that the current
shifting solution still works for all of my needs . . .


So the question is are you opposed to the verifying of the unlock
addresses, or is it all good if I add in additional checks for the
MTD_UADDR_UNNECESSARY devices?

--=20
Thayne Harbaugh
Linux Networx

--=-JvFNgpyu86frQRjcaU5h
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+VRltfsBPTKE6HMkRAqOFAJ4zIXlrvLwr9WblE0l9T4E0VfIWCQCfRR9/
VYNyb02zvqFArSmEe6Z3rGY=
=iGrr
-----END PGP SIGNATURE-----

--=-JvFNgpyu86frQRjcaU5h--
