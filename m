Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qja25-0006hl-GI
	for linux-mtd@lists.infradead.org; Wed, 20 Jul 2011 16:54:02 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 1/2] mtd: tests: fix '&&' and '||' warning
Date: Wed, 20 Jul 2011 09:53:41 -0700
Message-ID: <1311180822-6226-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit 3db343a094c876efc64a267a6968cfd5a6f93965
("mtd: tests: ignore corrected bitflips in OOB on mtd_readtest")
introduces a compiler warning:

  CC [M]  drivers/mtd/tests/mtd_readtest.o
  drivers/mtd/tests/mtd_readtest.c: In function =E2=80=98read_eraseblock_by=
_page=E2=80=99:
  drivers/mtd/tests/mtd_readtest.c:79: warning: suggest parentheses around =
=E2=80=98&&=E2=80=99 within =E2=80=98||=E2=80=99

[Note: the commit hash above is only valid if l2-mtd-2.6 is not rebased
too much. You can just squash this patch into the commit that produced
this warning if you'd like.]

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/tests/mtd_readtest.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readt=
est.c
index de23e8e..836792d 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -75,7 +75,7 @@ static int read_eraseblock_by_page(int ebnum)
 			ops.datbuf    =3D NULL;
 			ops.oobbuf    =3D oobbuf;
 			ret =3D mtd->read_oob(mtd, addr, &ops);
-			if (ret && ret !=3D -EUCLEAN ||
+			if ((ret && ret !=3D -EUCLEAN) ||
 					ops.oobretlen !=3D mtd->oobsize) {
 				printk(PRINT_PREF "error: read oob failed at "
 						  "%#llx\n", (long long)addr);
--=20
1.7.0.4
