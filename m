Received: from mtagate3.uk.ibm.com ([195.212.29.136])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IERld-0005bB-LB
	for linux-mtd@lists.infradead.org; Fri, 27 Jul 2007 16:30:15 +0100
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate3.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l6RFTibQ108156
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 15:29:44 GMT
Received: from d06av01.portsmouth.uk.ibm.com (d06av01.portsmouth.uk.ibm.com
	[9.149.37.212])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.4) with
	ESMTP id l6RFTihY2670616
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 16:29:44 +0100
Received: from d06av01.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av01.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l6RFTRu8030795
	for <linux-mtd@lists.infradead.org>; Fri, 27 Jul 2007 16:29:28 +0100
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/5] ubi-utils: introduction of libubi_common
Date: Fri, 27 Jul 2007 17:28:48 +0200
References: <200707271723.38987.alexs@linux.vnet.ibm.com>
In-Reply-To: <200707271723.38987.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707271728.48560.alexs@linux.vnet.ibm.com>
Cc: Frank Haverkamp <haver@linux.vnet.ibm.com>,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

libubi_common provides helper functions for ubi utils.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
---
ubi-utils/src/libubi_common.c |   93 ++++++++++++++++++++++++++++++++++++++++++
ubi-utils/src/libubi_common.h |   78 +++++++++++++++++++++++++++++++++++
2 files changed, 171 insertions(+)

--- /dev/null
+++ mtd-utils/ubi-utils/src/libubi_common.c
@@ -0,0 +1,93 @@
+/*
+ * Copyright International Business Machines Corp., 2007
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Alexander Schmidt
+ *
+ * This library provides helper functions for accessing UBI volumes.
+ * The paths to UBI device nodes is hardcoded, see below.
+ *
+ * 1.0 Initial commit
+ */
+
+#include <stdio.h>
+#include <unistd.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+
+#define DEFAULT_DEV_PATTERN    "/dev/ubi%d"
+#define DEFAULT_VOL_PATTERN    "/dev/ubi%d_%d"
+
+#define MAXPATH          1024
+
+int ubi_vol_open(int devn, int vol_id, int flags)
+{
+	char path[MAXPATH];
+	int fd;
+
+	snprintf(path, MAXPATH, DEFAULT_VOL_PATTERN, devn, vol_id);
+
+	fd = open(path, flags);
+
+	return fd;
+}
+
+int ubi_vol_close(int vol_fd)
+{
+	return close(vol_fd);
+}
+
+FILE* ubi_vol_fopen_read(int devn, int vol_id)
+{
+	FILE *fp;
+	int fd;
+
+	fd = ubi_vol_open(devn, vol_id, O_RDONLY);
+	if (fd == -1)
+		return NULL;
+
+	fp = fdopen(fd, "r");
+	if (fp == NULL)
+		ubi_vol_close(fd);
+
+	return fp;
+}
+
+int ubi_get_cdev_path(int devn, char *buf, size_t buf_size)
+{
+	int rc;
+
+	if (buf == NULL)
+		return -EINVAL;
+
+	rc = snprintf(buf, buf_size, DEFAULT_DEV_PATTERN, devn);
+
+	return rc;
+}
+
+
+int ubi_vol_get_used_bytes(int vol_fd, unsigned long long *bytes)
+{
+	off_t res;
+
+	res = lseek(vol_fd, 0, SEEK_END);
+	if (res == (off_t)-1)
+		return -1;
+	*bytes = (unsigned long long) res;
+	res = lseek(vol_fd, 0, SEEK_SET);
+	return res == (off_t)-1 ? -1 : 0;
+}
--- /dev/null
+++ mtd-utils/ubi-utils/src/libubi_common.h
@@ -0,0 +1,78 @@
+/*
+ * Copyright International Business Machines Corp., 2007
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ *
+ * Author: Alexander Schmidt
+ *
+ * This library provides helper functions for accessing UBI volumes.
+ * The paths to UBI device nodes is hardcoded.
+ *
+ * 1.0 Initial commit
+ */
+
+
+/**
+ * ubi_vol_open - open a UBI volume
+ *
+ * @devn	Number of UBI device on which to open the volume
+ * @vol_id	Number of UBI device on which to open the volume
+ * @flags	Flags to pass to open()
+ *
+ * This function opens a UBI volume on a given UBI device.  It returns
+ * the file descriptor of the opened volume device.  In case of an
+ * error %-1 is returned and errno is set appropriately.
+ */
+int ubi_vol_open(int devn, int vol_id, int flags);
+
+/**
+ * ubi_vol_close - close a UBI volume
+ *
+ * @vol_fd	file descriptor of UBI volume to close
+ *
+ * This function closes the given UBI device.
+ */
+int ubi_vol_close(int vol_fd);
+
+/**
+ * ubi_vol_fopen_read - open a volume for reading, returning a FILE *
+ * @devn	UBI device number
+ * @vol_id	volume ID to read
+ *
+ * Opens a volume for reading.  Reading itself can then be performed
+ * with fread().  The stream can be closed with fclose().  Returns a
+ * stream on success, else NULL.
+ */
+FILE *
+ubi_vol_fopen_read(int devn, uint32_t vol_id);
+
+/**
+ * ubi_get_cdev_path - get a device path for a given device number
+ *
+ * @devn	UBI device number
+ * @buf		buffer for device path
+ * @buf_size	size of buffer
+ */
+int ubi_get_cdev_path(int devn, char *buf, size_t buf_size);
+
+/**
+ * ubi_vol_get_used_bytes - determine used bytes in a UBI volume
+ * @vol_fd	File descriptor of UBI volume
+ * @bytes	Pointer to result
+ *
+ * Returns 0 on success, else error.
+ */
+int ubi_vol_get_used_bytes(int vol_fd, unsigned long long *bytes);
+
