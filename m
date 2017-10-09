Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1YbK-0000JF-EA
 for linux-mtd@lists.infradead.org; Mon, 09 Oct 2017 14:00:16 +0000
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
References: <20170626111947.17092-1-richard@nod.at>
 <e3239508-fe96-0d42-af70-d735eec78f2d@pengutronix.de>
 <13583464.gMdCSCRoQZ@blindfold>
From: Marc Kleine-Budde <mkl@pengutronix.de>
Message-ID: <897ef011-81e9-1fda-9474-6ac999ea0674@pengutronix.de>
Date: Mon, 9 Oct 2017 15:59:44 +0200
MIME-Version: 1.0
In-Reply-To: <13583464.gMdCSCRoQZ@blindfold>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="A1CWqBsXtraIEsLTDTk5Nuhgha4K8QP4u"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A1CWqBsXtraIEsLTDTk5Nuhgha4K8QP4u
Content-Type: multipart/mixed; boundary="NlNDt1uq6c2PnjXgL7fPaIEBGPl9tGfVU";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Message-ID: <897ef011-81e9-1fda-9474-6ac999ea0674@pengutronix.de>
Subject: Re: [PATCH] ubifs: replay: Detect and kill orphaned xattrs
References: <20170626111947.17092-1-richard@nod.at>
 <e3239508-fe96-0d42-af70-d735eec78f2d@pengutronix.de>
 <13583464.gMdCSCRoQZ@blindfold>
In-Reply-To: <13583464.gMdCSCRoQZ@blindfold>

--NlNDt1uq6c2PnjXgL7fPaIEBGPl9tGfVU
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 10/09/2017 03:56 PM, Richard Weinberger wrote:
> Am Montag, 9. Oktober 2017, 15:49:56 CEST schrieb Marc Kleine-Budde:
>> On 06/26/2017 01:19 PM, Richard Weinberger wrote:
>>> Creating an xattr is an independent journal transaction and the xattr=

>>> code assumes that there is always a valid host inode present when a n=
ew
>>> xattr is created. This assumption is not correct for LSM and now
>>> fscrypt, for these users UBIFS creates the xattr before the host inod=
e
>>> is created and visible to the user. Since these are two journal
>>> transactions it can happen that due to a power-cut only the xattr is
>>> present but not the host inode nor the directory entry for it. As res=
ult
>>> of this UBIFS will lose free space and can run out of space at some
>>> time.
>>> It is also not possible to create the xattr after the host inode beca=
use
>>> this would violate LSM and fscrypt model. After a power-cut we could =
end
>>> up with a inode without security context.
>>>
>>> This is an intermediate fix that can go into -stable, as long term
>>> solution we have to make sure that creating the xattr and the host in=
ode
>>> is a single journal transaction. But to achieve this the journal code=

>>> need some rework first.
>>>
>>> Cc: Subodh Nijsure <snijsure@grid-net.com>
>>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>>> Cc: Ben Shelton <ben.shelton@ni.com>
>>> Cc: Brad Mouring <brad.mouring@ni.com>
>>> Cc: Terry Wilcox <terry.wilcox@ni.com>
>>> Cc: Gratian Crisan <gratian.crisan@ni.com>
>>> Cc: stable@vger.kernel.org
>>> Fixes: d7f0b70d30ff ("UBIFS: Add security.* XATTR support for the UBI=
FS")
>>> Signed-off-by: Richard Weinberger <richard@nod.at>
>>
>> What happended to this patch? It's not on mainline (and thus not on th=
e
>> stable branches). Was there a better fix?
>=20
> Since the patch is non-trivial I hoped to get a review or tested-by.
> Therefore I didn't merge it so far.

What do you expect from proper testing?

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--NlNDt1uq6c2PnjXgL7fPaIEBGPl9tGfVU--

--A1CWqBsXtraIEsLTDTk5Nuhgha4K8QP4u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE4bay/IylYqM/npjQHv7KIOw4HPYFAlnbgNAACgkQHv7KIOw4
HPYrMwf/Wij1UTiSw/aniZCIL98XwmGTU217tQbhq8r4y3kyH+82juyXBjOyCo+M
iSKvByDR4VjuTbu94I+bPJ9vpp+MEpKSVTAbJ7DzB6Ys1jUNpJkAjS/1hbAshny4
yC3eXrhKoV08Si79eKBonvJkDBbRLQGN0lpfJT1ZtB/aakuRXgLvC65tcFrgAHYf
dLg9845NciTvluq+gp4gptzxeeCXjuqCifmwwG9VBvcfiU1FoyGERJ9QCyrlSCKw
dLsWSReCpyl+qNW9AGh+/1cRoZXWQwHYuPGGiz2kUsHzxOM+jZLck0L4zbaLMKHc
HJKyo4Yj62q8ECNSkN6qiBSQPkvejA==
=f3WM
-----END PGP SIGNATURE-----

--A1CWqBsXtraIEsLTDTk5Nuhgha4K8QP4u--
