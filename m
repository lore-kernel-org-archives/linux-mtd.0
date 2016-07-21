Received: from mail.sonicwall.com ([67.115.118.12] helo=es8300.sonicwall.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat
 Linux)) id 1bQ3RJ-0004IU-1W
 for linux-mtd@lists.infradead.org; Thu, 21 Jul 2016 02:10:17 +0000
Received: from es8300.sonicwall.com (127.0.0.1) id hi0ngi0171sd for
 <linux-mtd@lists.infradead.org>;
 Wed, 20 Jul 2016 19:07:56 -0700 (envelope-from <iharutyunov@SonicWALL.com>)
From: Iosif Harutyunov <iharutyunov@SonicWALL.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: Iosif Harutyunov <iharutyunov@SonicWALL.com>
Subject: [PATCH] mtd: ubi: Fix race condition between ubi device creation
 and udev
Date: Thu, 21 Jul 2016 02:07:55 +0000
Message-ID: <1AA17CE09ACFBD499BB5F503A7513F5B43ADFB03@us0exc08.us.sonicwall.com>
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


While implementing udev rules for UBI device I ran into the problem when ud=
ev would
ignore UBI rules I created to process attachment of volume. Interestingly, =
when I trigger
udev ubi subsystem "change" event manually after the attachment, rules woul=
d work just fine.

I traced problem down to UBI sysfs processing, which turned out to be racin=
g condition.
See patch below to address the problem.

Thanks.
Iosif,_

Signed-off-by: Iosif Harutyunov <iharutyunov@sonicwall.com>
---
Once ubi is attached, make sure ubi_devices[] is initialized early before b=
eing
used in the dev_attribute_show().

This is to prevent race condition between udev ubi rules processing and ubi=
 device
creation, which manifests itself ignoring udev ATTR rules.

---
 drivers/mtd/ubi/build.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef36182..e6117d7 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -986,6 +986,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_nu=
m,
 		goto out_free;
 	}
=20
+	ubi_devices[ubi_num] =3D ubi;
+
 	if (ubi->autoresize_vol_id !=3D -1) {
 		err =3D autoresize(ubi, ubi->autoresize_vol_id);
 		if (err)
@@ -1036,7 +1038,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_=
num,
 	wake_up_process(ubi->bgt_thread);
 	spin_unlock(&ubi->wl_lock);
=20
-	ubi_devices[ubi_num] =3D ubi;
 	ubi_notify_all(ubi, UBI_VOLUME_ADDED, NULL);
 	return ubi_num;
=20
@@ -1047,6 +1048,7 @@ out_uif:
 	ubi_assert(ref);
 	uif_close(ubi);
 out_detach:
+	ubi_devices[ubi_num] =3D NULL;
 	ubi_wl_close(ubi);
 	ubi_free_internal_volumes(ubi);
 	vfree(ubi->vtbl);
--=20
1.7.7.6
