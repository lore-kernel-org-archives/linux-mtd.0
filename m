From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 17 Mar 2003 11:27:41 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <20030317101928.J1745@brecis.com>
References: <20030312102735.U1745@brecis.com>
 <002701c2e8ba$8690e8c0$1200a8c0@JOHNB> <20030312154316.X1745@brecis.com>
 <1047916461.11517.85.camel@tubarao>  <20030317101928.J1745@brecis.com>
Message-ID: <1047925661.11512.213.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-EvrZnUndJESZ8BzsyWWf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-03-17 at 09:19, Steve Wahl wrote:
> On Mon, Mar 17, 2003 at 08:54:21AM -0700, Thayne Harbaugh wrote:

<snip>

> > I do know, however, that several
> > manufactures recommend that the final status should be checked an
> > additional two times before a success is reported.


> I'd be interested
> to see specific data sheets or application notes that do this.

What I stated is not completely accurate.  Here is what SST states on
page 14 of _4_Mbit_LPC_Flash_SST49LF040_ in the Write Operation Status
Detection section:

The actual completion of the nonvolatile write is asynchronous with the
system; therefore, either a Data# Palling or Toggle Bit read may be
simultaneous with the completion of the Write cycle.  If this occurs,
the system may possibly get an erroneous result, i.e., valid data may
appear to conflict with either DQ7 or DQ6.  In order to prevent spurious
rejection, if an erroneous result occurs, the software routine should
include a loop to read the accessed location an additional two (2)
times.  If both reads are valid, then the device has completed the Write
cycle, otherwise the rejection is valid.



>=20
>=20
> --> Steve
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--=20
Thayne Harbaugh
Linux Networx

--=-EvrZnUndJESZ8BzsyWWf
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+dhOdfsBPTKE6HMkRAs74AJ9ehcvP2+OOFJETNselB5iIHK0fjwCdE2Z9
J0NvOYO2El7enuc/AoHNxA0=
=wDoQ
-----END PGP SIGNATURE-----

--=-EvrZnUndJESZ8BzsyWWf--
