Received: from mail-in-10.arcor-online.net ([151.189.21.50])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sl4Ue-0003FK-A1
 for linux-mtd@lists.infradead.org; Sat, 30 Jun 2012 20:42:13 +0000
Date: Sat, 30 Jun 2012 22:09:43 +0200
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: MPC5200b jffs2 memcpy alignment problem
To: stephan@gatzka.org
In-Reply-To: <4FEF5098.8070602@gatzka.org> (from stephan@gatzka.org on Sat
 Jun 30 21:16:40 2012)
Message-Id: <1341086991.2252.0@antares>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 protocol="application/pgp-signature"; boundary="=-jVBz458QVqbNat3+qD9u"
Cc: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-jVBz458QVqbNat3+qD9u
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephan:

Am 30.06.12 21:16 schrieb(en) Stephan Gatzka:
> I have a problem running jffs2 on an MPC5200b board. I run kernel 3.4, bu=
t older kernels like 3.1.5 are also affected. Every time I mount jffs2, pre=
viously written content gets garbled.
>=20
> The problem was nailed down to memcpy(&fd->name, rd->name, checkedlen); i=
n jffs2_scan_dirent_node in fs/jffs2/scan.c.
[snip]
> 2. use memcpy_fromio in the jffs2 code. memcpy_fromio behaves exactly in =
the way I described above. This could be also a good solution because flash=
 access via LocalPlus bus is clearly IO.

I don't recall who proposed this patch, but exactly this solution is around=
 for a longer time (mayby you search archives...).  On my board, I have a f=
lash chip attached to the LocalBus in 16-bit mode.  Based on 3.2.16, the pa=
tch is:

---8<----------------------------------------------------------------------=
------
--- linux-3.2.16-orig/fs/jffs2/scan.c   2012-04-23 00:31:32.000000000 +0200
+++ linux-3.2.16/fs/jffs2/scan.c        2012-04-27 13:23:06.000000000 +0200
@@ -509,7 +509,11 @@
                                         sumptr =3D kmalloc(sumlen, GFP_KER=
NEL);
                                         if (!sumptr)
                                                 return -ENOMEM;
+#ifdef CONFIG_PPC_MPC52xx
+                                       memcpy_fromio(sumptr + sumlen - buf=
_len, buf + buf_size - buf_len, buf_len);
+#else
                                         memcpy(sumptr + sumlen - buf_len, =
buf + buf_size - buf_len, buf_len);
+#endif
                                 }
                                 if (buf_len < sumlen) {
                                         /* Need to read more so that the e=
ntire summary node is present */
@@ -1039,7 +1043,11 @@
         if (!fd) {
                 return -ENOMEM;
         }
+#ifdef CONFIG_PPC_MPC52xx
+       memcpy_fromio(&fd->name, rd->name, checkedlen);
+#else
         memcpy(&fd->name, rd->name, checkedlen);
+#endif
         fd->name[checkedlen] =3D 0;

         crc =3D crc32(0, fd->name, rd->nsize);
---8<----------------------------------------------------------------------=
------

Works perfectly with it...

Hope this helps,
Albrecht.=

--=-jVBz458QVqbNat3+qD9u
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iD8DBQBP710Pn/9unNAn/9ERAugWAKC0lS0DqdqmBXQcv/9kpefzUj5+FACZAUY0
d+bIZjMseGMzzmCawFU8OuI=
=+MYE
-----END PGP SIGNATURE-----

--=-jVBz458QVqbNat3+qD9u--
