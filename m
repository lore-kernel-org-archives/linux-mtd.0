Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QfS7O-0002bW-Qj
	for linux-mtd@lists.infradead.org; Sat, 09 Jul 2011 07:38:28 +0000
From: Mikael Starvik <mikael.starvik@axis.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse
	<dwmw2@infradead.org>
Date: Sat, 9 Jul 2011 09:37:52 +0200
Subject: SV: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT
Message-ID: <4BEA3FF3CAA35E408EA55C7BE2E61D055C63955547@xmail3.se.axis.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>,
	<1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1294745619-7142-4-git-send-email-dbaryshkov@gmail.com>
Content-Language: sv-SE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Stefan Roese <sr@denx.de>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	linux-cris-kernel <linux-cris-kernel@axis.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Agreed.

Signed-off-by: Mikael Starvik starvik@axis.com

________________________________________
Fr=E5n: Dmitry Eremin-Solenikov [dbaryshkov@gmail.com]
Skickat: den 11 januari 2011 12:33
Till: David Woodhouse
Kopia: Stefan Roese; linux-mtd@lists.infradead.org; linux-cris-kernel; Arte=
m Bityutskiy
=C4mne: [PATCH 4/5] CRIS: stop checking for MTD_CONCAT

As MTD_CONCAT support is becoming an integral part of MTD core,
there is no need for it's special treatment. So stop checking for
MTD_CONCAT availability.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Stefan Roese <sr@denx.de>
Cc: linux-cris-kernel@axis.com
---
 arch/cris/Kconfig                         |    1 -
 arch/cris/arch-v10/drivers/axisflashmap.c |    6 ------
 arch/cris/arch-v32/drivers/Kconfig        |    1 -
 arch/cris/arch-v32/drivers/axisflashmap.c |    6 ------
 4 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/arch/cris/Kconfig b/arch/cris/Kconfig
index 613e628..e05bd2f 100644
--- a/arch/cris/Kconfig
+++ b/arch/cris/Kconfig
@@ -277,7 +277,6 @@ config ETRAX_AXISFLASHMAP
        select MTD_CHAR
        select MTD_BLOCK
        select MTD_PARTITIONS
-       select MTD_CONCAT
        select MTD_COMPLEX_MAPPINGS
        help
          This option enables MTD mapping of flash devices.  Needed to use
diff --git a/arch/cris/arch-v10/drivers/axisflashmap.c b/arch/cris/arch-v10=
/drivers/axisflashmap.c
index b207970..ed708e1 100644
--- a/arch/cris/arch-v10/drivers/axisflashmap.c
+++ b/arch/cris/arch-v10/drivers/axisflashmap.c
@@ -234,7 +234,6 @@ static struct mtd_info *flash_probe(void)
        }

        if (mtd_cse0 && mtd_cse1) {
-#ifdef CONFIG_MTD_CONCAT
                struct mtd_info *mtds[] =3D { mtd_cse0, mtd_cse1 };

                /* Since the concatenation layer adds a small overhead we
@@ -246,11 +245,6 @@ static struct mtd_info *flash_probe(void)
                 */
                mtd_cse =3D mtd_concat_create(mtds, ARRAY_SIZE(mtds),
                                            "cse0+cse1");
-#else
-               printk(KERN_ERR "%s and %s: Cannot concatenate due to kerne=
l "
-                      "(mis)configuration!\n", map_cse0.name, map_cse1.nam=
e);
-               mtd_cse =3D NULL;
-#endif
                if (!mtd_cse) {
                        printk(KERN_ERR "%s and %s: Concatenation failed!\n=
",
                               map_cse0.name, map_cse1.name);
diff --git a/arch/cris/arch-v32/drivers/Kconfig b/arch/cris/arch-v32/driver=
s/Kconfig
index a2dd740..1633b12 100644
--- a/arch/cris/arch-v32/drivers/Kconfig
+++ b/arch/cris/arch-v32/drivers/Kconfig
@@ -406,7 +406,6 @@ config ETRAX_AXISFLASHMAP
        select MTD_CHAR
        select MTD_BLOCK
        select MTD_PARTITIONS
-       select MTD_CONCAT
        select MTD_COMPLEX_MAPPINGS
        help
          This option enables MTD mapping of flash devices.  Needed to use
diff --git a/arch/cris/arch-v32/drivers/axisflashmap.c b/arch/cris/arch-v32=
/drivers/axisflashmap.c
index 51e1e85..3d75125 100644
--- a/arch/cris/arch-v32/drivers/axisflashmap.c
+++ b/arch/cris/arch-v32/drivers/axisflashmap.c
@@ -275,7 +275,6 @@ static struct mtd_info *flash_probe(void)
        }

        if (count > 1) {
-#ifdef CONFIG_MTD_CONCAT
                /* Since the concatenation layer adds a small overhead we
                 * could try to figure out if the chips in cse0 and cse1 ar=
e
                 * identical and reprobe the whole cse0+cse1 window. But si=
nce
@@ -284,11 +283,6 @@ static struct mtd_info *flash_probe(void)
                 * complicating the probing procedure.
                 */
                mtd_total =3D mtd_concat_create(mtds, count, "cse0+cse1");
-#else
-               printk(KERN_ERR "%s and %s: Cannot concatenate due to kerne=
l "
-                      "(mis)configuration!\n", map_cse0.name, map_cse1.nam=
e);
-               mtd_toal =3D NULL;
-#endif
                if (!mtd_total) {
                        printk(KERN_ERR "%s and %s: Concatenation failed!\n=
",
                                map_cse0.name, map_cse1.name);
--
1.7.2.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/=
