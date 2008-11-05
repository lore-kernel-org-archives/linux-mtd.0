From: Vitaliy Gusev <vgusev@openvz.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] UBI: Don't exit from ubi_thread until kthread_should_stop()
	is true
Date: Wed, 5 Nov 2008 18:27:18 +0300
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200811051827.19164.vgusev@openvz.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If ubi_thread() exits but kthread_should_stop() is not true
then kthread_stop() will never return and cleanup thread
will forever stay in "D" state.

Signed-off-by: Vitaliy Gusev <vgusev@openvz.org>

---
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index 05d7093..dcb6dac 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -1396,7 +1396,8 @@ int ubi_thread(void *u)
 				ubi_msg("%s: %d consecutive failures",
 					ubi->bgt_name, WL_MAX_FAILURES);
 				ubi_ro_mode(ubi);
-				break;
+				ubi->thread_enabled = 0;
+				continue;
 			}
 		} else
 			failures = 0;
