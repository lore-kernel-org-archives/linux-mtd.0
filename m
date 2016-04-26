Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avAq1-0001M1-Nz
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 21:48:11 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH] Remove UDEV_SETTLE_HACK
Date: Tue, 26 Apr 2016 23:47:37 +0200
Message-Id: <1461707257-22727-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UDEV_SETTLE_HACK addresses a problem which does no longer exist on Linux.
These days we have devtmpfs. New devices will automatically created on
the kernel side and user space has no longer to wait for udev.
As udev has a hard dependency on devtmpfs we can depend on it too.
People which don't use udev nor plain devtmpfs are anyways on their own.
Android, I'm looking at you...

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 tests/ubi-tests/Makefile    |  7 +------
 tests/ubi-tests/README.udev | 25 -------------------------
 ubi-utils/libubi.c          | 29 -----------------------------
 3 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 tests/ubi-tests/README.udev

diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
index c434a6f..ce70c95 100644
--- a/tests/ubi-tests/Makefile
+++ b/tests/ubi-tests/Makefile
@@ -13,12 +13,7 @@ LDLIBS += -lpthread
 
 include ../../common.mk
 
-# Compile ubilib with the udevsettle hack
-libubi.a: $(LIBUBI_PATH)/libubi.c  $(LIBUBI_HEADER_PATH)/libubi.h  $(LIBUBI_PATH)/libubi_int.h
-	$(CC) $(CFLAGS) -I $(LIBUBI_PATH) -I../../include -DUDEV_SETTLE_HACK -c $(LIBUBI_PATH)/libubi.c -o libubi.o
-	ar cr libubi.a libubi.o
-
-$(TARGETS): $(addprefix $(BUILDDIR)/, helpers.o) libubi.a
+$(TARGETS): $(addprefix $(BUILDDIR)/, helpers.o) ../../ubi-utils/libubi.a
 
 clean::
 	rm -f libubi.a
diff --git a/tests/ubi-tests/README.udev b/tests/ubi-tests/README.udev
deleted file mode 100644
index 06e71d3..0000000
--- a/tests/ubi-tests/README.udev
+++ /dev/null
@@ -1,25 +0,0 @@
-There is a problem with udev: when a volume is created, there is a delay
-before corresponding /dev/ubiX_Y device node is created by udev, so some
-tests fail because of this. The symptom is error messages like
-"cannot open /dev/ubi0_0".
-
-One possible solution of this problem is to pre-create UBI device and volume
-nodes. There is even a script which may be used for this in ubi-utils/scripts/.
-But this is not enough because udev will still remove and re-create the nodes
-and tests will still fail. So you need to stop removing device nodes using
-the following udev rule:
-
-	KERNEL=="ubi*_*", ACTION=="remove", OPTIONS+="ignore_device"
-
-In our Ubuntu distribution we put that to new file:
-/etc/udev/rules.d/50-local.rules
-
-Another possibility is to call udevsettle utility in libubi after the volume
-has been created See src/libubi.c - the call is compiled in only if
-UDEV_SETTLE_HACK is defined. This is anyway an ugly hack, but works, although
-makes the tests slower. Suggestions are welcome.
-
-So, if you have udevsettel unility in your system, you do not have to do
-anyting, and the tests should work, because we compile libubi with
-UDEV_SETTLE_HACK. Otherwise, you should remove -D UDEV_SETTLE_HACK
-from the makefile and pre-create UBI device nodes.
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 97c0434..b1dc925 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -700,11 +700,6 @@ static int do_attach(const char *node, const struct ubi_attach_req *r)
 	if (ret == -1)
 		return -1;
 
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
 	return ret;
 }
 
@@ -850,12 +845,6 @@ int ubi_remove_dev(libubi_t desc, const char *node, int ubi_dev)
 	if (ret == -1)
 		goto out_close;
 
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
 out_close:
 	close(fd);
 	return ret;
@@ -1034,12 +1023,6 @@ int ubi_mkvol(libubi_t desc, const char *node, struct ubi_mkvol_request *req)
 	close(fd);
 	req->vol_id = r.vol_id;
 
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
 	return 0;
 }
 
@@ -1060,12 +1043,6 @@ int ubi_rmvol(libubi_t desc, const char *node, int vol_id)
 
 	close(fd);
 
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
 	return 0;
 }
 
@@ -1086,12 +1063,6 @@ int ubi_rnvols(libubi_t desc, const char *node, struct ubi_rnvol_req *rnvol)
 
 	close(fd);
 
-#ifdef UDEV_SETTLE_HACK
-//	if (system("udevsettle") == -1)
-//		return -1;
-	usleep(100000);
-#endif
-
 	return 0;
 }
 
-- 
2.7.3
