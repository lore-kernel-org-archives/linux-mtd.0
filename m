Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sjpve-00018N-LF
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2012 10:56:59 +0000
Message-ID: <1340794858.29342.55.camel@sauron.fi.intel.com>
Subject: Re: Loosed files after umount/mount
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andreas Friesen <ndrs.frsn@googlemail.com>
Date: Wed, 27 Jun 2012 14:00:58 +0300
In-Reply-To: <CAMU=cjyiX2KnntUFYYa-fwi0QAKX-Um1gE8tpNLwNiNsbj8O1Q@mail.gmail.com>
References: <CAMU=cjyiX2KnntUFYYa-fwi0QAKX-Um1gE8tpNLwNiNsbj8O1Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-R94n54fDz5g4KHmiT0aA"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-R94n54fDz5g4KHmiT0aA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-06-18 at 22:29 +0200, Andreas Friesen wrote:
> Hello,
>=20
> I'm experiencing a strange problem with JFFS2 using Linux
> 3.1.5, 3.4 from kernel.org.git on PowerPC. After unmounting and
> remounting the filesystem,
> directory is empty.

So is it 3.4 or 3.1.5?

> $ flash_erase /dev/mtd2
> $ reboot
> $ mount mtd:storage /storage -t jffs2
> $ scp root@server:/tmp/settings/*.xml /storage
If you add "sleep 20" here - does it help?
> $ sync
> $ umount /storage
> $ mount mtd:storage /storage -t jffs2
> $ ls /storage
> ... empty ?????
>=20
> Any Hints?

Is it NOR or NAND? My first guess is that the write-buffer is not
synced. Or there are issues with the driver, try to run mtd tests.

--=20
Best Regards,
Artem Bityutskiy

--=-R94n54fDz5g4KHmiT0aA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6ufqAAoJECmIfjd9wqK0E3sP/RiUtVZgLPjUJ0rZfcYmaHam
Z9HrvuYrjZhVDm3PR6KcOOw1lpqVnaqNMDAA9aXOZzVPS5EN/fgSUwFWfkSs6nTh
qfpQihFJhZoCfwM0Wd3qwZS1jY/wSIm0g2Ez0NSgDPsO0iOXmNNFzLtGZ5cIEiRz
q2LN1ueaHtjl3zSQp1eVMC6T1t+yPRs2EXaaEwGMADWlA4v42RwN1U8Jx4BC48RJ
mEiSkt3tcpLYFfTZ81wSqhit/HDR4zQwg6cxKNQDFcOLm1osWyXIO61KNjYmWU/+
NIFPv6jnu97oaji4AcdZIkf4IOUoWOyinMZcbgB+pIhvrNCPChTOAO7VHBxSyv6Q
TsQGACdyBH7qlpNqkN4BF0ztpXlDEZrnhn0lsApI0Geu4DPvWr5ULTW/ASVYTuBr
W8DUfkWxtFGQkzRs2JdyAoIbntLAVDJhtSt1dP4YgrQc87gGWhvbhlf5Wf4Lw5hl
rT9Pv9O3fJFNgA/XHIphZgVu8gaT2FpNNIYyZtC06ggrVAmwELqAnbabxhtzA6wK
bY0D3afg4G0Fx1qPyYMVgktv1ubuF3RK+O5SgGkiDaI5gAKkXEmZJglptEh3Md3I
DW+kcDhYmgjiLScF8drnmhD9VRXGIu3zVAbCROYX40qwAkNPKKhoPWZTVtWApTK0
Lp2lhtW4nUDmtTsfYvVA
=2vHR
-----END PGP SIGNATURE-----

--=-R94n54fDz5g4KHmiT0aA--
