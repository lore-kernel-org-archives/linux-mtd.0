Message-ID: <1350552998.5769.306.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/1] MTD: atmel_nand: use devm_xxx gpio kzalloc, gpio
 and ioremap
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Date: Thu, 18 Oct 2012 12:36:38 +0300
In-Reply-To: <1350129982-12106-1-git-send-email-plagnioj@jcrosoft.com>
References: <1350129982-12106-1-git-send-email-plagnioj@jcrosoft.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-lgiN0SgeMXO1zLpyxGK9"
Mime-Version: 1.0
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-lgiN0SgeMXO1zLpyxGK9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2012-10-13 at 14:06 +0200, Jean-Christophe PLAGNIOL-VILLARD
wrote:
> this will allow to simply the error and remove path
>=20
> Cc: linux-mtd@lists.infradead.org
> Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

$:~/git/l2-mtd$ git apply --check ~/tmp/jc.mbox
error: patch failed: drivers/mtd/nand/atmel_nand.c:1420
error: drivers/mtd/nand/atmel_nand.c: patch does not apply

Please, send an l2-mtd.git-based version.

git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

--=20
Best Regards,
Artem Bityutskiy

--=-lgiN0SgeMXO1zLpyxGK9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQf82mAAoJECmIfjd9wqK0sisP/02+xUAMA4axWqt/95oP9zn3
4b6jENCWT5UMuv+1okvIk9IJDuTeq7ferHt6JskFVYeH6PBHTHdwQxwuqPd+QAsY
3DMkIfhlcKRX3nwWh8R0q8+QbSycsA2iU45dIsR4BiC74J9u+8DnZWXEBDOETmBU
Ja/AomLVS5CtZEQRhXEVXd4Z/tM8WMHKDuym2tWdtxKNe/D4HlGDYdhd1vY4rJLn
B0RhxJaQJoQbOILVuJAb8TJyWeeCwQLfb1QSXTfWkbeK3HL4Rmmj0NnwAT7w5LAv
WDoAwi4T1SyG/JLRXovlXJ1H8yQf3y8I15qyDJ1Tn/xuq0bXgNDiYHOMYJsIpbnA
qsaYPXIj5KeTAAZFMF3Os6WTovRWW42kUKYBsqzzR8MezFxLsN+CFATxfLOomF0x
4yFjiq1z/0j1ShJmSS3SF8RGS8tXlluDlkA9CgiPMMbJ7jOhsxPbf9Voo6st2aHa
/tcgQHxZxg7D3iSyKB5+EPRC7g3wBJJxvOvRHJH6QV2i1DEyKwI4O25Wrsb7gbgw
5eTg0vHUiGuk7+wzrbRHhGU51DkTfECSfdQmtj45NtU4YEzCPrXxsb/Hnsq9MFHX
nBq+8r9xb9QVKQZmZh6GKUbYRXxbUQA2EEjWj/Rwd9atHPnZ7KWmI/8Sl2mZuIWO
q2AmuScFLhuABSeBYyr+
=iOlD
-----END PGP SIGNATURE-----

--=-lgiN0SgeMXO1zLpyxGK9--
