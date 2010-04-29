Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O7RBR-0003ar-CQ
	for linux-mtd@lists.infradead.org; Thu, 29 Apr 2010 10:41:30 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Thu, 29 Apr 2010 12:41:04 +0200
Message-Id: <1272537664-21603-1-git-send-email-mkl@pengutronix.de>
Subject: [PATCH] ubi: init even if mtd device cannot be attached,
	if built into kernel
Cc: Dmitry Pervushin <dpervushin@embeddedalley.com>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Roel Kluin <roel.kluin@gmail.com>, linux-kernel@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ubi can be built into the kernel or be compiled as a kernel module.
Further on the command line one can specify mtd devices to be attach to
ubi while loading. In the current implementation the ubi driver refuses
to load if one of the mtd devices cannot be attached.

Consider:
1) ubi compiled into the kernel and
2) a mtd device specified on the command line and
3) this mtd device contains bogus data (for whatever reason).

During init ubi tries to attach the mtd device is this fails the whole
ubi subsystem isn't initialized. Later the userspace cannot attach any
mtd to ubi because ubi isn't loaded.

This patch keeps the current behaviour: if ubi is compiled as a module
and a mtd device cannot be attached the ubi module cannot be loaded,
but changes it for the ubi-is-built-into-the-kernel usecase.

If ubi is builtin, a not attachable mtd device doen't stop ubi from
initializing. This slightly modifies the behaviour if multiple mtd
devices are specified on the command line. Now every mtd device is
probed and, if possible, attached, i.e. a faulty mtd device doesn't
stop the others from being attached.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/mtd/ubi/build.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 14cec04..2f6f09f 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -123,6 +123,12 @@ static struct device_attribute dev_bgt_enabled =
 static struct device_attribute dev_mtd_num =
 	__ATTR(mtd_num, S_IRUGO, dev_attribute_show, NULL);
 
+#ifdef CONFIG_MTD_UBI_MODULE
+static inline int ubi_is_module(void) { return 1; }
+#else
+static inline int ubi_is_module(void) { return 0; }
+#endif
+
 /**
  * ubi_volume_notify - send a volume change notification.
  * @ubi: UBI device description object
@@ -1200,9 +1206,11 @@ static int __init ubi_init(void)
 					 p->vid_hdr_offs);
 		mutex_unlock(&ubi_devices_mutex);
 		if (err < 0) {
-			put_mtd_device(mtd);
 			ubi_err("cannot attach mtd%d", mtd->index);
-			goto out_detach;
+			if (ubi_is_module()) {
+				put_mtd_device(mtd);
+				goto out_detach;
+			}
 		}
 	}
 
-- 
1.7.1
