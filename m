Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRjcI-0005w7-1a
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 12:34:10 +0000
Received: from dbdp20.itg.ti.com ([172.24.170.38])
 by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q48CY7Bx022655
 for <linux-mtd@lists.infradead.org>; Tue, 8 May 2012 07:34:08 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
 by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q48CY62H009095
 for <linux-mtd@lists.infradead.org>; Tue, 8 May 2012 18:04:07 +0530 (IST)
From: "Philip, Avinash" <avinashphilip@ti.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: mtd oob test is failing consistently at same places in NAND flash
Date: Tue, 8 May 2012 12:33:06 +0000
Message-ID: <518397C60809E147AF5323E0420B992E3E934BF1@DBDE01.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

We are having an 8-bit NAND part (MT29F2G08ABAEAWP from Micron) connected t=
o GPMC
Module (General purpose memory controller) from TI.
We have been seeing mtd_oobtest failure on a partition size of 248 MB. Most=
 of
the time, test case 2 of mtd_oobtest is failing. On debugging further it se=
ems
that bit flip is happening on the test case 2 in OOB area. It is observed t=
hat
the failure locations are consistent.=20

To verify further we had tried writing zeros to OOB area and read it back.=
=20
This test is passing and confirms that all OOB bits (that are programmable)
are not bad.

To test further I had modified the mtd_oobtest.c as follows and found this
test is passing

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtes=
t.c
index 933f7e5..9f118de 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -50,7 +50,7 @@ static unsigned long next =3D 1;

static inline unsigned int simple_rand(void)
{
-       next =3D next * 1103515245 + 12345;
+       next =3D next * 1103515244 + 12345; /* 45 -> 44. Sequence is change=
d */
        return (unsigned int)((next / 65536) % 32768);
}


Is this behavior due to bits getting corrupted on certain sequence?=20
Is this issue observed by anyone else?

Thanks & Regards
Avinash Philip
