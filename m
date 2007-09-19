Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IXztD-0007iq-QS
	for linux-mtd@lists.infradead.org; Wed, 19 Sep 2007 09:46:55 -0400
Received: from esebh105.NOE.Nokia.com (esebh105.ntc.nokia.com [172.21.138.211])
	by mgw-ext12.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l8JDkYAw009899
	for <linux-mtd@lists.infradead.org>; Wed, 19 Sep 2007 16:46:46 +0300
Subject: [PATCH] MTD: nandsim: bugfix in initialization
From: Artem Bityutskiy <dedekind@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Sep 2007 16:46:35 +0300
Message-Id: <1190209596.14370.163.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <dedekind@infradead.org>
Reply-To: dedekind@infradead.org
To: David Woodhouse <dwmw2@infradead.org>
Cc: bhsong <bhsong@augustatek.com>
Subject: [PATCH] MTD: nandsim: bugfix in initialization
Date: Wed, 19 Sep 2007 16:23:22 +0300

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Wed, 19 Sep 2007 17:56:47 +0300
Subject: [PATCH] MTD: nandsim: bugfix in initialization

NAND of > 32MiB in size use 4 bytes in address cycle, not 3.

Reported-by: bhsong <bhsong@augustatek.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/nand/nandsim.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index 0b1823c..9685f8a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -511,7 +511,7 @@ static int init_nandsim(struct mtd_info *mtd)
 	}
=20
 	if (ns->options & OPT_SMALLPAGE) {
-		if (ns->geom.totsz < (64 << 20)) {
+		if (ns->geom.totsz < (32 << 20)) {
 			ns->geom.pgaddrbytes  =3D 3;
 			ns->geom.secaddrbytes =3D 2;
 		} else {
--=20
1.5.0.6

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
