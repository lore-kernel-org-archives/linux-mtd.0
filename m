Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYMsY-0004lc-Lm
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 10:19:45 -0400
Subject: [PATCH] MTD: OneNAND: minor print fix
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Sep 2007 17:17:34 +0300
Message-Id: <1190297854.14370.197.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 34fdb6b9c912f0be9d92f05a0dfeb47f9145b5cc Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Thu, 20 Sep 2007 17:13:34 +0300
Subject: [PATCH] MTD: OneNAND: minor print fix

Use the same printk level when printing version information.
There is no reason to print it with KERN_DEBUG when the previous
message was printed with KERN_INFO.

And it is really interesting information to print because it gives
you exact part number and the operating frequency (54MHz, 66MHz, etc).

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/onenand/onenand_base.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c
index 0a18528..bb01369 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2148,7 +2148,7 @@ static void onenand_print_device_info(int device, int=
 version)
                 (16 << density),
                 vcc ? "2.65/3.3" : "1.8",
                 device);
-	printk(KERN_DEBUG "OneNAND version =3D 0x%04x\n", version);
+	printk(KERN_INFO "OneNAND version 0x%04x\n", version);
 }
=20
 static const struct onenand_manufacturers onenand_manuf_ids[] =3D {
--=20
1.5.2.2


--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
