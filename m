Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9ZnW-0002M0-Fv
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 08:17:39 +0000
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: dedekind1@gmail.com
Date: Wed,  5 May 2010 10:17:25 +0200
Message-Id: <1273047445-23411-1-git-send-email-mkl@pengutronix.de>
Subject: [PATCH V2] ubi: init even if mtd device cannot be attached,
	if built into kernel
Cc: Andi Kleen <ak@linux.intel.com>,
	Dmitry Pervushin <dpervushin@embeddedalley.com>,
	Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
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

V2: integrated comments from Artem Bityutskiy:
    use defines instead of static inline functions

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/mtd/ubi/build.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index fad40aa..d0447a5 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -49,6 +49,12 @@
 /* Maximum length of the 'mtd=' parameter */
 #define MTD_PARAM_LEN_MAX 64
 
+#ifdef CONFIG_MTD_UBI_MODULE
+#define ubi_is_module() 1
+#else
+#define ubi_is_module() 0
+#endif
+
 /**
  * struct mtd_dev_param - MTD device parameter description data structure.
  * @name: MTD character device node path, MTD device name, or MTD device number
@@ -1240,9 +1246,11 @@ static int __init ubi_init(void)
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
