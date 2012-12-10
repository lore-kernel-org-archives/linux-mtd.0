Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti3R5-0007UA-Tx
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 13:30:20 +0000
Message-ID: <1355146279.2657.32.camel@sauron.fi.intel.com>
Subject: Re: Patch to solve NULL pointer dereference in physmap_of.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
Date: Mon, 10 Dec 2012 15:31:19 +0200
In-Reply-To: <85D877DD6EE67B4A9FCA9B9C3A4865670C3AFC5168@SI-MBX14.de.bosch.com>
References: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
 <1353483740.2701.1.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AF1D4E4@SI-MBX14.de.bosch.com>
 <1354276262.30168.102.camel@sauron.fi.intel.com>
 <85D877DD6EE67B4A9FCA9B9C3A4865670C3AFC5168@SI-MBX14.de.bosch.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KwhQ1VFGjfzWD3weYf4a"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KwhQ1VFGjfzWD3weYf4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-12-03 at 08:31 +0100, Prins Anton (ST-CO/ENG1.1) wrote:
> Sorry I'm in a learning curve... now used 'git format-patch'.
> This made it working for 'git am'; so hopefully this time its fine!
>=20
> Artem, thanks for your support!

A lot better, but is still not ideal. You did not run checkpatch.pl,
otherwise you would notice this warning:

checkpatch.pl results for patch "[PATCH] mtd: maps/physmap_of.c: error chec=
king to prevent a NULL  pointer dereference"                               =
                                                                           =
  =20
                                                                           =
                                                                           =
                                                                           =
  =20
ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)                     =
                                                                           =
                                                                           =
  =20
                                                                           =
                                                                           =
                                                                           =
  =20
total: 1 errors, 0 warnings, 19 lines checked                              =
                                                                           =
                                                                           =
  =20

I've added the S-o-b line for you and pushed the patch to l2-mtd.git,
thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-KwhQ1VFGjfzWD3weYf4a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQxeQnAAoJECmIfjd9wqK02E8P+QEdMEr8Myfh3ukkMq8OrveI
iXg1QsyC0h2mZVLnXPhBi76Fppr/J12t4Uq6KdX2mV8psNPAkJIY28l9ZtZJbSNp
wUuUwaYByTyqQa3XPNhpDHw1NtIZwCRdnPgFipbPmAlanSV778tSW/J/wym/0HGI
QWuVHzJLxGszYx53mvMas4iIK4aKxMxQpyZRcwm4u4hZPTQjudtCn6PwbzXndncz
Zeog6/P4tcHcEiiYXps1v/tsjtrHuKii4AP03/m3RZgc+WeoNFBXQzIm+R81MdDa
xJpl55hOg2Gbo85YapYNb81wjmj7BDDHjHRlKJF4CqfFtezfn1TZ5RZZzG2s/heh
OAWfgw6uB4CzuB4jpgEmry+4ofqFYlEchoZfvD2+So0kuOWyu7gXfkVSBmB5YbBa
3UjLQkJ+5VrvLwBMmnrG3UdkjPu6EG2zlWSidGg+U1evCfl8Voc7pz9W4K/DnHks
5yicxKd5BB7bY3hoGEhYeuoPkvQln095zqeBeW09ugzGGvArdUozmTRYy/PAIwPU
7RsfKgIrYH4vZnQdBi+mDGpdNMR94u5ZckJYB7XtcAqhaEH4L+fpMzZSIOLIRsj0
txsaTCgYF6IvAPAJeRmAEyfavzAmdH7SyYeSQoe8NGk0Pu54Efm+3v1ZRErsf+lZ
OIQmsqpPuv4BbnYX9e0/
=/q4+
-----END PGP SIGNATURE-----

--=-KwhQ1VFGjfzWD3weYf4a--
