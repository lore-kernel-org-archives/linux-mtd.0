Received: from service87.mimecast.com ([91.220.42.44])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U0V34-00021A-NS
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2013 10:37:48 +0000
From: Pawel Moll <pawel.moll@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: physmap_of: Fix map name when "linux, mtd-name" is absent
Date: Wed, 30 Jan 2013 10:37:36 +0000
Message-Id: <1359542256-19135-1-git-send-email-pawel.moll@arm.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Pawel Moll <pawel.moll@arm.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Commit d68cbdd4fb04d2b756ad53c22f36943167b16340 "mtd: physmap_of:
allow to specify the mtd name for retro compatiblity" introduced
a "linux,mtd-name" property to override map names, but when
this property is absent (so of_property_read_string() returns
value !=3D 0) an uninitialized value is used (as mtd_name is not
set). This may lead to kernel oopses when the name is
derefernced, eg:

Unable to handle kernel NULL pointer dereference at virtual address 0000000=
1
pgd =3D 80004000
[00000001] *pgd=3D00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in:
CPU: 3    Not tainted  (3.8.0-rc5+ #644)
PC is at strcmp+0x4/0x30
LR is at parse_cmdline_partitions+0x54/0x2f8

Fixed by initializing the variable to NULL.

Signed-off-by: Pawel Moll <pawel.moll@arm.com>
---
 drivers/mtd/maps/physmap_of.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 67cc73c..7901d72 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -170,7 +170,7 @@ static int of_flash_probe(struct platform_device *dev)
 =09resource_size_t res_size;
 =09struct mtd_part_parser_data ppdata;
 =09bool map_indirect;
-=09const char *mtd_name;
+=09const char *mtd_name =3D NULL;
=20
 =09match =3D of_match_device(of_flash_match, &dev->dev);
 =09if (!match)
--=20
1.7.10.4
