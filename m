Received: from martinlund.org ([173.255.130.145]
 helo=slmp-550-86.slc.westdc.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuaSE-0005Hw-DA
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 09:38:32 +0000
Received: from [79.171.149.172] (port=54702 helo=quark.gomspace.lan)
 by slmp-550-86.slc.westdc.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <malu@gomspace.com>) id 1fuZPU-00DNPI-51
 for linux-mtd@lists.infradead.org; Tue, 28 Aug 2018 02:31:36 -0600
From: Martin Lund <malu@gomspace.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH mtd-utils] ubi-tests: io_paral: Fix error handling of
 update_volume()
Date: Tue, 28 Aug 2018 10:31:13 +0200
Message-Id: <20180828083113.18198-1-malu@gomspace.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The io_paral test returns success even in case it throws e.g. the
following error message:

[io_paral] update_volume():125: written and read data are different

This patch fixes so that the io_paral application returns a non-zero
error code when an error is detected.
---
 tests/ubi-tests/io_paral.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/ubi-tests/io_paral.c b/tests/ubi-tests/io_paral.c
index b2b462e..1b6fee3 100644
--- a/tests/ubi-tests/io_paral.c
+++ b/tests/ubi-tests/io_paral.c
@@ -149,22 +149,22 @@ static void *update_thread(void *ptr)
 			if (ret) {
 				failed("ubi_rmvol");
 				errorm("cannot remove volume %d", vol_id);
-				return NULL;
+				return (void *) -1;
 			}
 			ret = ubi_mkvol(libubi, node, &reqests[vol_id]);
 			if (ret) {
 				failed("ubi_mkvol");
 				errorm("cannot create volume %d", vol_id);
-				return NULL;
+				return (void *) -1;
 			}
 		}
 
 		ret = update_volume(vol_id, bytes);
-		if (ret)
-			return NULL;
+		if (ret != 0)
+			return (void *) -1;
 	}
 
-	return NULL;
+	return (void *) 0;
 }
 
 static void *write_thread(void *ptr)
@@ -179,7 +179,7 @@ static void *write_thread(void *ptr)
 	if (fd == -1) {
 		failed("open");
 		errorm("cannot open \"%s\"\n", vol_node);
-		return NULL;
+		return (void *) -1;
 	}
 
 	ret = ubi_set_property(fd, UBI_VOL_PROP_DIRECT_WRITE, 1);
@@ -228,12 +228,12 @@ static void *write_thread(void *ptr)
 	}
 
 	close(fd);
-	return NULL;
+	return (void *) 0;
 }
 
 int main(int argc, char * const argv[])
 {
-	int i, ret;
+	int i, ret, error=false;
 	pthread_t threads[THREADS_NUM];
 
 	if (initial_check(argc, argv))
@@ -302,7 +302,14 @@ int main(int argc, char * const argv[])
 	}
 
 	for (i = 0; i < THREADS_NUM; i++)
-		pthread_join(threads[i], NULL);
+	{
+		pthread_join(threads[i], (void **) &ret);
+		if (ret != 0)
+			error = true;
+	}
+
+	if (error)
+		goto remove;
 
 	for (i = 0; i <= THREADS_NUM; i++) {
 		if (ubi_rmvol(libubi, node, i)) {
-- 
2.17.1
