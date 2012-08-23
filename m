Message-ID: <1345725459.2848.238.camel@sauron.fi.intel.com>
Subject: Re: JFFS2 issue with v3.5.x and later on Atmel chips at least
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: "ludovic.desroches" <ludovic.desroches@atmel.com>
Date: Thu, 23 Aug 2012 15:37:39 +0300
In-Reply-To: <5035F266.2040909@atmel.com>
References: <5034B45A.5060107@atmel.com> <5034F3F8.9080802@atmel.com>
 <1345707689.2848.203.camel@sauron.fi.intel.com>
 <5035F266.2040909@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-NKqctdvarn3rrrpHr4wR"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-NKqctdvarn3rrrpHr4wR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-08-23 at 11:05 +0200, ludovic.desroches wrote:
>=20
> Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>=20

Thanks, pushed to l2-mtd.git tree a bit modified patch. Will ping dwmw2
about merging it to Linus.

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Thu, 23 Aug 2012 10:10:07 +0300
Subject: [PATCH] JFFS2: fix unmount regression

This patch fixes regression introduced by
"8bdc81c jffs2: get rid of jffs2_sync_super". We submit a delayed work in o=
rder
to make sure the write-buffer is synchronized at some point. But we do not
flush it when we unmount, which causes an oops when we unmount the file-sys=
tem
and then the delayed work is executed.

This patch fixes the issue by adding a "cancel_delayed_work_sync()" infocat=
ion
in the '->sync_fs()' handler. This will make sure the delayed work is cance=
led
on sync, unmount and re-mount. And because VFS always callse 'sync_fs()' be=
fore
unmounting or remounting, this fixes the issue.

Reported-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: stable@vger.kernel.org [3.5+]
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
---
 fs/jffs2/super.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
index 61ea413..1224d6b 100644
--- a/fs/jffs2/super.c
+++ b/fs/jffs2/super.c
@@ -100,6 +100,10 @@ static int jffs2_sync_fs(struct super_block *sb, int w=
ait)
 {
 	struct jffs2_sb_info *c =3D JFFS2_SB_INFO(sb);
=20
+#ifdef CONFIG_JFFS2_FS_WRITEBUFFER
+	cancel_delayed_work_sync(&c->wbuf_dwork);
+#endif
+
 	mutex_lock(&c->alloc_sem);
 	jffs2_flush_wbuf_pad(c);
 	mutex_unlock(&c->alloc_sem);
--=20
1.7.10.4


--=20
Best Regards,
Artem Bityutskiy

--=-NKqctdvarn3rrrpHr4wR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNiQTAAoJECmIfjd9wqK0IYYP/jj2A+YDjzZ2LeyXuyglDLsO
N06W9VF2F5QLiSQiVWW9fgTKl3j7kJ2qKIXBwNc2SHscYOWcxzjhXEH/OAspzW2i
8O9X4ygkLj6lMqUs8btOYnA58rSm0PT3DoUq0TIcwqcx8oTR8zuuV4pcA04G3lUr
fxEo237poeI1DxsCV/x6ezOvM8pmy9jjlXwpOT0yHn5EqPOsyQBdmeHUy+NfJuSv
U68A50Ha4nvCY4gi1dxqGgljXma5pgrEGbG6O+Z4oec3QmbFbBsUUzMFqQOO1Hpr
a3FRh+9P8aFdl7ufefH9D0g9thY6Voqc5v1k4Jeu4W9YteyhGqUdMjC8mcClPZtR
tv3pID00zMlM6vd13Tt+jfBily6rOJQUR5JuNOixZ8aFHW5vnkZzP7FShun1l6ix
A2IqAGEwGdSuampROTCWPUsPge2xMcJPWHOOqwdbVbATqcbcI6rBdBdqSCE8VcYe
U54N5bRYvrTcP6kPPZnORM+rMOV8l8PrcyOydtlJA2gcIerb1a3SlR8eNcUNX4LV
bJv31Ey1nrUFnYxm4H6PugqpIwbvj81Umpv9/b9wvk7gaddVq09pZqJnM136ruxw
h2tOYDBalePs5WcvtwWUbxeZsGfVpuJO0X1laH9vuKWZtxwKpJ1Qxp7dLTA9ZfCw
rsdwdWtRQ2SMFhy/KCTm
=s9s3
-----END PGP SIGNATURE-----

--=-NKqctdvarn3rrrpHr4wR--
