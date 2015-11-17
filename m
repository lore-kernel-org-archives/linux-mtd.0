Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyllt-0007Ja-KA
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 19:18:31 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id B7E6924E0002
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 20:18:07 +0100 (CET)
Received: from dw-book (80-110-107-146.cgn.dynamic.surfer.at [80.110.107.146])
 by mail.sigma-star.at (Postfix) with ESMTPSA id 3A1ED24E0001
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 20:18:06 +0100 (CET)
Date: Tue, 17 Nov 2015 20:18:01 +0100
From: Daniel Walter <dwalter@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [RFC] [PATCH] mtd: add tracepoints for mtd_read and mtd_write
Message-ID: <20151117191801.GA864@dw-nb.local>
References: <20151117191448.GA5367@dw-nb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151117191448.GA5367@dw-nb.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add tracepoints to mtd subsystem for read and write
operations. This should allow us to identify applications
which are generating too much reads/writes on a flash-device.

Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
---
 drivers/mtd/mtdcore.c      |  6 +++++-
 include/trace/events/mtd.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/mtd.h

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 8bbbb75..8f85bfb 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -43,6 +43,9 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/mtd.h>
+
 #include "mtdcore.h"
 
 static struct backing_dev_info mtd_bdi = {
@@ -882,7 +885,7 @@ int mtd_read(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 		return -EINVAL;
 	if (!len)
 		return 0;
-
+	trace_mtd_read(current, len);
 	/*
 	 * In the absence of an error, drivers return a non-negative integer
 	 * representing the maximum number of bitflips that were corrected on
@@ -907,6 +910,7 @@ int mtd_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
 		return -EROFS;
 	if (!len)
 		return 0;
+	trace_mtd_write(current, len);
 	return mtd->_write(mtd, to, len, retlen, buf);
 }
 EXPORT_SYMBOL_GPL(mtd_write);
diff --git a/include/trace/events/mtd.h b/include/trace/events/mtd.h
new file mode 100644
index 0000000..7191b72
--- /dev/null
+++ b/include/trace/events/mtd.h
@@ -0,0 +1,45 @@
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM mtd
+
+#if !defined(_TRACE_MTD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_MTD_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(mtd_read,
+	TP_PROTO(struct task_struct *task, size_t rlen),
+	TP_ARGS(task, rlen),
+	TP_STRUCT__entry(
+		__field(pid_t, pid)
+		__array(char, comm, TASK_COMM_LEN)
+		__field(size_t, rlen)
+	),
+	TP_fast_assign(
+		__entry->pid = task->pid;
+		memcpy(__entry->comm, task->comm, TASK_COMM_LEN);
+		__entry->rlen = rlen;
+	),
+	TP_printk("pid=%d comm=%s rlen=%zu",
+		__entry->pid, __entry->comm, __entry->rlen)
+);
+
+TRACE_EVENT(mtd_write,
+	TP_PROTO(struct task_struct *task, size_t wlen),
+	TP_ARGS(task, wlen),
+	TP_STRUCT__entry(
+		__field(pid_t, pid)
+		__array(char, comm, TASK_COMM_LEN)
+		__field(size_t, wlen)
+	),
+	TP_fast_assign(
+		__entry->pid = task->pid;
+		memcpy(__entry->comm, task->comm, TASK_COMM_LEN);
+		__entry->wlen = wlen;
+	),
+	TP_printk("pid=%d comm=%s wlen=%zu",
+		__entry->pid, __entry->comm, __entry->wlen)
+);
+#endif /* _TRACE_MTD_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.6.2
