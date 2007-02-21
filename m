Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJsuM-000516-0W
	for linux-mtd@lists.infradead.org; Wed, 21 Feb 2007 09:58:05 -0500
Date: Wed, 21 Feb 2007 14:54:21 +0000
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Vijay Sampath <vsampath@gmail.com>
Subject: Re: [PATCH] [MTD] CHIPS: oops in cfi_amdstd_sync
Message-ID: <20070221145420.GD464@lazybastard.org>
References: <758a2bbf0702201746p3959235ele3db9b600a9f8104@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Content-Disposition: inline
In-Reply-To: <758a2bbf0702201746p3959235ele3db9b600a9f8104@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 20 February 2007 17:46:13 -0800, Vijay Sampath wrote:
>=20
> The files cfi_cmdset_0002.c and cfi_cmdset_0020.c do not initialize
> their wait queues like is done in cfi_cmdset_0001.c. This causes an
> oops when the wait queue is accessed. I have copied the code from
> cfi_cmdset_0001.c that is pertinent to initialization of the wait
> queue.

Patch looks good, but I can no longer test it.  Josh may still have
access to some commandset 20 chips.  Josh, any objections?

J=C3=B6rn

--=20
The only real mistake is the one from which we learn nothing.
-- John Powell

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFF3F0cfbqVtkXfjukRAgZ4AJ0ZhvnXphTMtxe/Nt5/0hXDe0EdxACeOwZN
+6XSKNg7CKkV1+2e5NvEtHo=
=qs7F
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
