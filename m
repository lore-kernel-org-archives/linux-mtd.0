From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 18 Mar 2003 10:22:49 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <20030318105100.N1745@brecis.com>
References: <20030312102735.U1745@brecis.com>
 <002701c2e8ba$8690e8c0$1200a8c0@JOHNB> <20030312154316.X1745@brecis.com>
 <1047916461.11517.85.camel@tubarao> <20030317101928.J1745@brecis.com>
 <1047925661.11512.213.camel@tubarao>  <20030318105100.N1745@brecis.com>
Message-ID: <1048008169.11517.1619.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-WR4q0zDjS2E9vaYtdMRV
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-03-18 at 09:51, Steve Wahl wrote:
> On Mon, Mar 17, 2003 at 11:27:41AM -0700, Thayne Harbaugh wrote:
> > On Mon, 2003-03-17 at 09:19, Steve Wahl wrote:
> > > On Mon, Mar 17, 2003 at 08:54:21AM -0700, Thayne Harbaugh wrote:
> >=20
> > <snip>
> >=20
> > > > I do know, however, that several
> > > > manufactures recommend that the final status should be checked an
> > > > additional two times before a success is reported.
> >=20
> >=20
> > > I'd be interested
> > > to see specific data sheets or application notes that do this.
> >=20
> > What I stated is not completely accurate.  Here is what SST states on
> > page 14 of _4_Mbit_LPC_Flash_SST49LF040_ in the Write Operation Status
> > Detection section:
> >=20
> > The actual completion of the nonvolatile write is asynchronous with the
> > system; therefore, either a Data# Palling or Toggle Bit read may be
> > simultaneous with the completion of the Write cycle.  If this occurs,
> > the system may possibly get an erroneous result, i.e., valid data may
> > appear to conflict with either DQ7 or DQ6.  In order to prevent spuriou=
s
> > rejection, if an erroneous result occurs, the software routine should
> > include a loop to read the accessed location an additional two (2)
> > times.  If both reads are valid, then the device has completed the Writ=
e
> > cycle, otherwise the rejection is valid.
>=20
> Ahh.  If I read this correctly, if you are about to report an error
> you should read two more times to make sure it's still there.
>=20
> So your original wording should be "the final status should be checked
> an additional two times before a *failure* is reported."  You could
> legally / reasonably report success the instant you detect it.
>=20
> Do you agree?

Yes, that's exactly how I interpret it after re-reading it.  I have seen
this statement in more than one vendor's documentation.  This is also
the way I am writing my AMD simplified command set driver.

The part that I still scratch my head about is why it needs to read
correctly on _both_ reads.  Why is it not good enough to have success on
the last read?

> It is somewhat funny that if this was followed, I wouldn't have run
> into the "DQ5 detected, but things seem OK" warning (can't remember
> the original wording, sorry).=20

Yes, that would have eliminated the error.

>=20
> --> Steve
--=20
Thayne Harbaugh
Linux Networx

--=-WR4q0zDjS2E9vaYtdMRV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+d1XpfsBPTKE6HMkRAuNKAJ9QKThjRWAbE7yrOqbSS9ojRPUA9wCfSvOl
uxoA+QJng3T5UgutVXIem2c=
=r7zg
-----END PGP SIGNATURE-----

--=-WR4q0zDjS2E9vaYtdMRV--
