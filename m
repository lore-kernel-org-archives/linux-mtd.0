Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2NSP-0000q3-At
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 14:23:26 +0000
Message-ID: <1345213644.27859.94.camel@sauron.fi.intel.com>
Subject: Re: UBI problems on 2nd mount
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Fri, 17 Aug 2012 17:27:24 +0300
In-Reply-To: <20120817141216.GC2232@pengutronix.de>
References: <20120816105445.GV2232@pengutronix.de>
 <20120817141216.GC2232@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-6Ver84LSXeULaRD9OXTs"
Mime-Version: 1.0
Cc: James Nute <newten82@gmail.com>,
 Iwo Mergler <Iwo.Mergler@netcommwireless.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-6Ver84LSXeULaRD9OXTs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-17 at 16:12 +0200, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Thu, Aug 16, 2012 at 12:54:45PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > I'm on v3.6-rc1 with a few patches, but all unrelated to ubi/ubifs.
> > I'm experiencing a very similar problem to the one James Nute and Iwo
> > Mergler reported which resulted in commit c6727932c (included in
> > v3.6-rc1).
> >=20
> > The first boot looks ok, but on the second boot it fails with=20
> >=20
> > 	[   14.843501] UBIFS error (pid 1): replay_log_leb: first CS node at L=
EB 3:0 has wrong commit number 0 expected 1
> > 	[   14.853626] UBIFS error (pid 1): replay_log_leb: log error detected=
 while replaying the log at LEB 3:0
> >=20
> > It doesn't reproduce 100%, I only saw it after issuing $(poweroff) and
> > then only if that resulted in the error
> >=20
> > 	[  173.019073] UBI error: ubi_io_write: error -5 while writing 64 byte=
s to PEB 30:0, written 0 bytes
> >=20
> > $(reboot) and just switching off + reenabling the power supply don't
> > yield this problem.
> >=20
> > The same happes if I don't use -F (space_fixup) for mkfs.ubifs.
> > (Then the two ubifs_assert(!c->space_fixup); in ubifs_write_node are no=
t
> > hit which I think are a seperate problem.) The kernel panic after power
> > off is a seperate problem that is triggered because poweroff doesn't
> > stop the cpu.
> While bisecting I noticed that doing poweroff after the machine is up
> for some time the issue doesn't occur. Bisection yielded commit
>=20
> commit d51f17ea0a3afe11fb4c4ad6635877e24df2758f
> Author: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
> Date:   Sat Jul 14 20:52:58 2012 +0300

Thanks Uwe. I think this patch will fix the issue:

=46rom e9d7e9731df27b4ef5190f919f9f96334439a36c Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Fri, 17 Aug 2012 17:21:14 +0300
Subject: [PATCH] UBIFS: fix regression

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 fs/ubifs/replay.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index eba46d4..57ca44d 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -1026,7 +1026,6 @@ int ubifs_replay_journal(struct ubifs_info *c)
 	c->replaying =3D 1;
 	lnum =3D c->ltail_lnum =3D c->lhead_lnum;
=20
-	lnum =3D UBIFS_LOG_LNUM;
 	do {
 		err =3D replay_log_leb(c, lnum, 0, c->sbuf);
 		if (err =3D=3D 1)
--=20
1.7.10.4

--=20
Best Regards,
Artem Bityutskiy

--=-6Ver84LSXeULaRD9OXTs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLlTMAAoJECmIfjd9wqK0sPcQAI26Ux4A7uNumAkLoIAchYYY
may+C6zekyHzb/jeYZdd7q/bOjrzZL/S8+Jlsux9hFA6EUpYYtgr0yAeovDuU4nG
X+GAovOIKfTXiMj4fkhLcPpY7IcS1j2D1y2Vpt/+xk9nJv6kNLfYFyQ3CVNkujdh
rQg/EM4foYM2WbDd9syKOWm6dzT5TCbcsiQhpN5ck0ezu8nTTLN99zrYoLmbnYBB
8V5dvlonvZ6xgUgMUaUTEX4dyNfC9/ecnrf+hUjeLnkz1BjPOLA9Gv4cl6G7Iv1r
nza1o8d5NHMDKfHjbuoAnMXmMkixW+CbxR2dfAQP6KVEM7JTF7koTJOWouncX37d
4z2ezzLLNBvZTPo7c99Yw5jM3YZyoJZW616ibxq9V5GIig2+dIR7kswKDGE0ik4u
44p9kc9MgZ6ADuNJNPEPtHKyHpg/619W5XaLHR9PvCaPB2tAx9cks0oDQPeQPTKn
JngJd6skIqsla13qlMHtyHV1Mi1vF30EfdleTU9W+OCYEfnsWt57qfpPRmSylswC
Rd73d3LX5Yzyh+iijopEuHTsSU4SRaQZk1Kt+U8sKqRUJxFh5naS6qAau2ItZZzA
b611uBfnWrZapqWsb582mjaj04QJnDiqszANAOdKM+8YXDGmflZIQyvFNrIi1Dqo
wcmsQuQaYAQleLHvvrMI
=Aa6r
-----END PGP SIGNATURE-----

--=-6Ver84LSXeULaRD9OXTs--
