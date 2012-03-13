Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S7QPs-00069e-8U
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 12:01:24 +0000
Message-ID: <1331640228.3595.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/4] MTD: Change meaning of -EUCLEAN return code on reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Dunn <mikedunn@newsguy.com>
Date: Tue, 13 Mar 2012 14:03:48 +0200
In-Reply-To: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
References: <1331500873-9792-1-git-send-email-mikedunn@newsguy.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-nDfRcaYjO0uavCNowryB"
Mime-Version: 1.0
Cc: Ivan Djelic <ivan.djelic@parrot.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-nDfRcaYjO0uavCNowryB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, 2012-03-11 at 14:21 -0700, Mike Dunn wrote:
> This problem was discussed a while back [1][2][3], and a consensus of sor=
ts was
> reached for a solution, which these patches implement.  The recent additi=
on of
> the mtd api entry functions now make this solution practical (thanks Arte=
m!).  A
> quick description of each patch will provide a synopsis of the patchset:
>=20
> (1) The element 'ecc_strength' is added to struct mtd_info, which will st=
ore the
>     maximum number of bit errors that can be corrected in one writesize r=
egion.

I think this attribute should be exported via sysfs as R/O.

> (2) Drivers set ecc_strength during initialization.
>=20
> (3) The element 'euclean_threshold' is added to struct mtd_info.  If the =
driver
>     leaves this uninitialized, mtd sets it to ecc_strength when the devic=
e or
>     partition is registered.  This element is also exposed for reading an=
d
>     writing from userspace through sysfs.

Would you please rename it to bitflip_threshold. It is bearable when it
is just a  'struct mtd_info' member, but you also export
'euclean_threshold' sysfs file which is really confusing from user
perspective, I think.

> (4) The drivers' read methods, absent an error, return a non-negative int=
eger
>     indicating the maximum number of bit errors that were corrected in an=
y one
>     writesize region.  MTD returns -EUCLEAN if this is >=3D euclean_thres=
hold, 0
>     otherwise.
>=20
> So basically, the meaning of -EUCLEAN is changed from "one or more bit er=
rors
> were corrected over the entire read operation", to "a dangerously high nu=
mber of
> bit errors were corrected on one or more writesize regions".  By default,
> "dangerously high" is interpreted as the maximum number of correctible bi=
t
> errors per writesize.  Drivers can specify a different value, and the use=
r can
> override it if more or less caution regarding data integrity is desired.

Please, make sure we have a good comment like this in the mtd.h file as
well. I think the one you added is not verbose enough.

Otherwise looks good!

> Patch #2 touches a lot of files, but they are small changes in most cases=
.  If
> you can verify the correctness of the device's ecc strength, an ACK would=
 be
> much appreciated!

I'd be pro-active and just CC'ed maintainers/possibly relevant people.
scripts/get_maintainer.pl would give you the ones, I think. Just spend a
little time and come up with a list of people and CC them.

--=20
Best Regards,
Artem Bityutskiy

--=-nDfRcaYjO0uavCNowryB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPXzekAAoJECmIfjd9wqK0BV4P/1I0Y3zeRIZWbweq/XzrZkp0
RB/lQXjpE5KtkcG+qgQ5UldBg36tGb+MFB9U1bBNJIr+ypP8hyYtDy7nBo1h4Fva
sPU25ekWz1FGSR7aCdJF2d5rbxM0vGhDSzjdf7HFDbgdOJ7s9IpQQxrgXatDMxeK
RlWPxP17hta7t1qcil555tdnlz1gSCYi5cpwGDb2ttMjzrwop6aJbSXL2OHrjlrp
l0R/IKJ7MKv00mndzm7VRZ10Is7ndNqOKzkh1mu0pUiHJZaRqvolWEdEiOp/+fKJ
mXEsMd+z17ifGYm46BXChb4X5MEkW4CSlNsYgf5wbpgspaUob8YBRNBqeExexDhn
DpJmttGji+TBbzFDDZ9f/my6ZIvRqPbnfjJvk/zaAdpY9nODsw+1Q45iTg11s4Hs
L7Dka1j98432iRT8T1ACe/jphJdy/FZyOuKJDnLPMoCNUx1s/TAFkVDP10F9Yipg
WKJGD/6pfdR1N38scN21dS3iyy7QgWv4fJA6oWveQjAj6oIPV6mCJrv8iTbd/ogJ
vp6cga6wKKJUXp2at3Tq/4H+Oq+GA9Q5dEzDe2ql3Q+Kg62qGJyK1SLbKgP+6ujk
EP5H+ghakFX/wANbONnGk8iyysAgI52qfhVaAJkVuHfLEHs9KBQVnjGBZCh9z/w/
1E/PvU74zMySDUfbCAu1
=lWtd
-----END PGP SIGNATURE-----

--=-nDfRcaYjO0uavCNowryB--
