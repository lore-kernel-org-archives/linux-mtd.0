From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 05 Mar 2003 09:39:18 -0700
Subject: Wacky JEDEC probes
In-Reply-To: <1046724149.2666.627.camel@tubarao>
References: <1045671999.2672.28.camel@tubarao>
 <1045758752.27290.9.camel@passion.cambridge.redhat.com>
 <1046724149.2666.627.camel@tubarao>
Message-ID: <1046882358.2672.667.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-lWW7X99OYNp+afMfy+0g
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I have not received any feedback on this yet.  I'm tempted to commit the
patch since "it works for me" and I can't see that any of it is a bad
thing.

I need to get to work on a loadable module that allows the device
parameters to be manually set rather than probed or taken from the
jedec_table[].  This will make it so that devices that refuse to probe
correctly can still be used.  Any suggestions on how this module should
be written?


On Mon, 2003-03-03 at 13:42, Thayne Harbaugh wrote:
> I never committed my previous patch that improved jedec probes: I wasn't
> sure if Dave did not like it or if he just wanted more checks.  I have
> revised my previous patch and added the extra checks Dave suggested and
> I intend to commit this patch if there are not any concerns.
>=20
> On Thu, 2003-02-20 at 09:32, David Woodhouse wrote:
> > On Wed, 2003-02-19 at 16:26, Thayne Harbaugh wrote:
>=20
> <snip>
>=20
> > > The obvious problem is that there is no way to challenge a device and
> > > discover if it truly is in ID mode.  Because of this one must assume
> > > that sending the unlock sequence was correct and really worked.
> >=20
> > Some devices don't _have_ an unlock sequence though.
>=20
> Devices that don't have an unlock sequence are marked with
> MTD_UADDR_UNNECESSARY.
>=20
> >  I'm more inclined
> > to follow the route of taking the chip _out_ of ident mode and checking
> > the contents change. Bear in mind that (IIRC) we should get the correct
> > ident from offset 0 and 1 in _every_ erase block, shouldn't we?
> >=20
> > After finding an ident, we put the chip back in read mode and check for
> > the ident again. If it hasn't changed (i.e. the data matches the ident
> > we think we saw) then go back to ident mode and check for the ids in th=
e
> > _next_ eraseblock instead. Or something like that ;)
>=20
> I added a jedec_match() function that is responsible for this now.=20
> jedec_match() has the following sequence:
>=20
> 1) checks that the ID's match
>=20
> 2) checks if the device has an unlock sequence and that the unlock
> addresses match
>=20
> 3) checks for the ID in every block
>=20
> 4) takes the chip out of ID mode and checks for the ID in the first
> block
>=20
> If and only if all of the above checks succeed then the match is
> successful.
>=20
> I don't feel that it is necessary to check for a change in any but the
> first block.  This is ultra conservative.  The intention is that if the
> probe does not have obvious success then it might be dangerous to
> proceed.
>=20
> For the case where the probe fails, but there really is a device then
> there should be a module that can be loaded that takes all the device
> parameters from the command line.  That way the user can deal with
> bizarre behavior.
>=20
> > > - Some devices have 8 bit and 16 bit modes and have unique unlock
> > > addresses for each.  I'm not sure which ones should be used - that's =
why
> > > these cases are labeled as "FIXME."
> >=20
> > The one you use depends on the mode the chip is in -- you'd probably en=
d
> > up wanting two separate entries for these chips, or depending on which
> > mode we're in.
>=20
> Will add this later if the current patch is acceptable.
>=20
> > > - It appears that some CFI devices are in the jedec_table[] - I'm not
> > > sure if this is desirable.
> >=20
> > Possibly not. Who added them and when? (cvs annotate :)
>=20
> Have not followed through on this - yet.
>=20
> > > - The unlock_addrs[] array enumerates the known unlock addresses.  I
> > > have noticed that these address pairs can be x555/x2aa, x555/xaaa,
> > > x5555/x2aaa, x5555/xaaaa, x0/x0.  Some of these pairs are not current=
ly
> > > listed because they are used for 8 bit mode on 16 bit devices.  Now t=
hat
> > > these addresses are enumerated it might be better to iterate over the
> > > list instead of keep state while shifting and or'ing.
> >=20
> > That's a sane idea and entirely orthogonal to the original change, I
> > suppose.
>=20
> Have not follewed through on this either.
--=20
Thayne Harbaugh
Linux Networx

--=-lWW7X99OYNp+afMfy+0g
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+Zig2fsBPTKE6HMkRAmsQAJ9JmnuBdDBgFBGywMmhKrzKLDDQfwCcCB8t
3yZWqYR8suW+zm95R5Vq5wE=
=QhFO
-----END PGP SIGNATURE-----

--=-lWW7X99OYNp+afMfy+0g--
