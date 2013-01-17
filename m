Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvodt-0004F2-JB
 for linux-mtd@lists.infradead.org; Thu, 17 Jan 2013 12:32:26 +0000
Message-ID: <1358426023.2731.243.camel@sauron.fi.intel.com>
Subject: Re: Booting stops at UBI Scan/UBIFS recovery needed
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Vankam, Rajasekhar" <Rajasekhar.Vankam@spx.com>
Date: Thu, 17 Jan 2013 14:33:43 +0200
In-Reply-To: <E842BDED18DFB64CA7154362C91840E0019AE7E0@SPX-EXCMB-PRD4.GLOBAL.SPX.COM>
References: <E842BDED18DFB64CA7154362C91840E0019AE7E0@SPX-EXCMB-PRD4.GLOBAL.SPX.COM>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-1RhuoQXRwH3VtNW5dlNy"
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


--=-1RhuoQXRwH3VtNW5dlNy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2013-01-07 at 19:59 +0000, Vankam, Rajasekhar wrote:
> Hi,
>=20
> =20
>=20
> We are facing an issue of fail in booting at UBI/UBIFS during kernel
> boot but it will happen after several boots but not immediate second
> boot.
>=20
> Booting gets stuck sometimes at UBI scan and sometimes after UBIFS
> Recovery needed and it stays forever. Below are the log snippets where
> it exactly stuck.

If the kernel gets stuck, you need to find where exactly it gets stuck.
Probably by using printks. Please, run mtd-tests for your flash as well:

http://www.linux-mtd.infradead.org/doc/general.html#L_mtd_tests

--=20
Best Regards,
Artem Bityutskiy

--=-1RhuoQXRwH3VtNW5dlNy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9++nAAoJECmIfjd9wqK02PIP/juYfR1taztBlc5vUbhXSoFw
yUaBbnrJ8XnMjBWrGBxdb10+Bae/1tn8lTUtqvD5bbAAvxzFxzQ1G5OGxJowfGLz
txvagstVuPoKNLhvI3u7MOZ/ncm2bU4ErRJ9fxlnnELZ+R5aqlNCv9b7JVBZiksf
LdI+ik4ceCimtUS3CifFHv9dILKc3tMiO2pPC6WWlb/o47Du/IhRVQqBYI/NpOQY
C2lGBgHuPqXqF87qqeUePDLXWjuaifv/nJjygg/m4mYOyVFD9c8ybMB89yF7/ALI
+vI98k3vmRyMP5FEU9Qh7jXAZL6dXEDi267R2EBoUodotzGN523RrSgHwlGMv3HP
mK8lOVWFMCDP4u66nb0Szye/g6hTPepM2qoE7m1pROBUtnhCYfz+l/FwjVKqqM5H
qJyT4VVLe+NwGwpmR7U6vxXQOnXmbLjksoZl6GnVgpS689uYyTABhYSK9RJee8ME
zOn16D/j0ZZR86+ECiHouUmFaRzuiShRgdlaqEXaIle4ua2kgtMDl1QWHJsZqy5g
oVMfCRRbtDO+PZFqaiAC9iKBtOCdtAIUVzF97TufUEX/TDGepVOUQSbB9X19PWoX
ght3acfPbGY2IuTGDLlBtmRNtng0kiekVWVABa+H3ar93v8S/gWB0xOhbTSmSapv
YPNE9wT0Nf8VmpdVRQOM
=WB7v
-----END PGP SIGNATURE-----

--=-1RhuoQXRwH3VtNW5dlNy--
