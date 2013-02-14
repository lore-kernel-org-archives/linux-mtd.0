Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U5xZC-0000gS-9c
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2013 12:05:30 +0000
Message-ID: <511CD300.7080207@pengutronix.de>
Date: Thu, 14 Feb 2013 13:05:20 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH RFC 4/5] UBIFS: Add security.* XATTR support for the UBIFS
References: <1360750998-15191-1-git-send-email-mkl@pengutronix.de>
 <1360750998-15191-5-git-send-email-mkl@pengutronix.de>
 <1360826890.12703.158.camel@sauron.fi.intel.com>
In-Reply-To: <1360826890.12703.158.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2LJJLALTOKVWQNJUWIOCB"
Cc: linux-security-module@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 Subodh Nijsure <snijsure@grid-net.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2LJJLALTOKVWQNJUWIOCB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/14/2013 08:28 AM, Artem Bityutskiy wrote:
> On Wed, 2013-02-13 at 11:23 +0100, Marc Kleine-Budde wrote:
>> --- a/fs/ubifs/journal.c
>> +++ b/fs/ubifs/journal.c
>> @@ -553,7 +553,8 @@ int ubifs_jnl_update(struct ubifs_info *c, const s=
truct inode *dir,
>> =20
>>         dbg_jnl("ino %lu, dent '%.*s', data len %d in dir ino %lu",
>>                 inode->i_ino, nm->len, nm->name, ui->data_len, dir->i_=
ino);
>> -       ubifs_assert(dir_ui->data_len =3D=3D 0);
>> +       if (!xent)
>> +               ubifs_assert(dir_ui->data_len =3D=3D 0);
>=20
> Shouldn't this snippet be in 2/5 instead?
will do

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2LJJLALTOKVWQNJUWIOCB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlEc0wAACgkQjTAFq1RaXHObRACZAa7xadNENbmsVDz5dy4yUtMy
33wAn22eKpbjiPgud+9AwduwBcpxeF9u
=wjuM
-----END PGP SIGNATURE-----

------enig2LJJLALTOKVWQNJUWIOCB--
