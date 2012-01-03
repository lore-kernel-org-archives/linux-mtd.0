Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri4pr-0004CD-TO
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 13:55:28 +0000
Message-ID: <1325599040.8917.23.camel@sauron.fi.intel.com>
Subject: re: mtd: introduce mtd_put_device interface
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jan 2012 15:57:20 +0200
In-Reply-To: <20120103134752.GB3557@mwanda>
References: <20120103134752.GB3557@mwanda>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UBVqwDsNH2fwKg90LHgA"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@logfs.org>,
 linux-mtd@lists.infradead.org, Prasad Joshi <prasadjoshi.linux@gmail.com>,
 logfs@logfs.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UBVqwDsNH2fwKg90LHgA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-03 at 16:47 +0300, Dan Carpenter wrote:
> This patch is in linux-next.  The parts of this patch that touch
> logfs are completely bogus and need to be reverted.  Eggnog...
>=20
> fs/logfs/super.c:507:2: warning: passing argument 1 of =E2=80=98mtd_put_d=
evice=E2=80=99 from incompatible pointer type [enabled by default]
> fs/logfs/super.c:526:3: warning: passing argument 1 of =E2=80=98mtd_put_d=
evice=E2=80=99 from incompatible pointer type [enabled by default]
> fs/logfs/super.c:533:3: warning: passing argument 1 of =E2=80=98mtd_put_d=
evice=E2=80=99 from incompatible pointer type [enabled by default]

Yes, this was in the previous linux-next and should be fixed in the
current linux-next.

--=20
Best Regards,
Artem Bityutskiy

--=-UBVqwDsNH2fwKg90LHgA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPAwlAAAoJECmIfjd9wqK0dKEQAIvv44tE0VXCsiXXnLwRMLiC
q3AXZt21XASbi6iLfKzTaPrft6i+DLjlGEtAT0hXVtVJIzcbL/Qeg4YX9XsDYrkw
M+pV2XIhsIu20VBfilchl5pqg52sHgGCk61pMjWh6Ki+zt7r0XrSRHcpeJWk6Pc+
uLRIjXfwocz4lUAApSzfl6glqIlCtPV32mCtY+ZfTXklc9QkND8JMiT5u159gW3D
CkXV/ihBxkxppEA09n/IuXevHHcbCkz2GG3BMLoPH0UtgbxwkiNiq+uT6C0o3COU
k8AYZZAx/9YfgEK7YGGmzPwgOjRB3eMdcac50JVm/2+chgIFvSD057nc789gjdQV
hj+z6EJEdoCx+z/DfTzGWGOxIPkuuU6/OtYZmxgJ/cv0RmqaT9u4dbN+h5lCwGTH
ud7ZTyVIw1WPu1qNj7mPA1nKTHTvokMvAptf1T2J/M4fAjUN951rOO6gCd/DhhPv
2UegU7NEwTCztLNBTvBY0Ejjo03ehFCzw5NjO1gRYvlAKBYvYMYWQk2vljzRK6QB
lMSt8Sp3azk9tfSLFkxWFJrOvCW5sovmqcuRjiPiqrtCKlnPj5+ANWM+CALOUMT0
Fkj0IlPtjAfOUoETDOxrpuFFMLM0Ei42AVXUI5jWyNXi1TztQ/HCGcAc+MvSsw9C
Qmlxzd1YAK7mJKOx1e6t
=8xna
-----END PGP SIGNATURE-----

--=-UBVqwDsNH2fwKg90LHgA--
