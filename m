Received: from rcsinet15.oracle.com ([148.87.113.117])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ri4i3-0002xV-1z
 for linux-mtd@lists.infradead.org; Tue, 03 Jan 2012 13:47:24 +0000
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: re: mtd: introduce mtd_put_device interface
Message-ID: <20120103134752.GB3557@mwanda>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, Joern Engel <joern@logfs.org>,
 linux-mtd@lists.infradead.org, Prasad Joshi <prasadjoshi.linux@gmail.com>,
 logfs@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Tue, 03 Jan 2012 13:47:24 -0000


--jho1yZJdad60DJr+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This patch is in linux-next.  The parts of this patch that touch
logfs are completely bogus and need to be reverted.  Eggnog...

fs/logfs/super.c:507:2: warning: passing argument 1 of =E2=80=98mtd_put_dev=
ice=E2=80=99 from incompatible pointer type [enabled by default]
fs/logfs/super.c:526:3: warning: passing argument 1 of =E2=80=98mtd_put_dev=
ice=E2=80=99 from incompatible pointer type [enabled by default]
fs/logfs/super.c:533:3: warning: passing argument 1 of =E2=80=98mtd_put_dev=
ice=E2=80=99 from incompatible pointer type [enabled by default]

regards,
dan carpenter

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPAwcIAAoJEOnZkXI/YHqR2v0P/isAkYo4sgfMmL3dsGfm9Ymh
6Jhtcvgrje0VlMsheUy4tBRTX4Yq+8Cjsie4HQIQjwWrc7A0np11RAjGtdJbtVY6
a01qIg7RVfhSli4JgPvVF2wsqqsSgkAGYgVKXe19nmnzs8nuhtw5lgyJebK1Ralq
BOLIKXBcIzEfNcbsG+XIVHLb38OXP//qV7TjS2TUPhirg2uwIppvLxu+io6CDqoT
S8J37KcVgKfCIzVmjR2rbt7i9uAyylXqPL86k1bHvf41bQddux2aq/xNhy+ML5mG
j2QjcdDPRWk39E1WLUTx/X2c0STiJd9Ylj1YR9ZorrtdtBxMqSmnU7sLEz4qj435
MYU09E8Qn+7FrgTp1zvGULI/v/H7u31/F1SY9LA/FZhtufCuW0vlpjnjKw/PmQkR
8pyHLZbfVDOczA8g/E/PZktIOJk63pOtljTRDMCYTnBR3R761JtU1hm4/WsyNYZ7
wgWOdAIws84tdNQMBq+MG3kkvcDfqMRwfSIEEiQRIyY/Y9lOrhhE1d+e8QAW/As0
lLkdmZnhNR89GR/BQPiagfGwQMk1W8LUGEzOUH3y74PiwYynaa8h6rxQcHfyPxsl
tWjpiRHJo6ZTTex6p0UQoHfEQnPHT4dH6M4iXq/3F1L3TeN2ASeM5BiTf7AGWV4+
y0gZ5SHWymyor1WtGzqi
=cnL8
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
