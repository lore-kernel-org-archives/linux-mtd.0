Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat
 Linux)) id 1Xnolc-0008T5-6p
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 13:12:25 +0000
From: Juergen Borleis <jbe@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: Re: [RFC/PATCH 0/5 v2] mtd:ubi: Read disturb and Data retention
 handling
Date: Mon, 10 Nov 2014 14:12:58 +0100
References: <201411101307.03225.jbe@pengutronix.de> <5460B10E.9060501@nod.at>
In-Reply-To: <5460B10E.9060501@nod.at>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_anLYUWlCpyFBGbj"
Message-Id: <201411101412.58159.jbe@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, jlauruhn@micron.com,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Boundary-00=_anLYUWlCpyFBGbj
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Richard,

On Monday 10 November 2014 13:35:26 Richard Weinberger wrote:
[...]
> Can you share your test program? I'd like to run it also on one of my
> boards.

Please find the patch attached. Its intended for the Barebox bootloader and=
 can=20
be applied to its current git. The "-c" option seems currently somehow brok=
en.=20
I have to talk to Sascha first.=20

jbe

=2D-=20
Pengutronix e.K. =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| Juergen Borleis =A0 =A0 =A0 =A0 =A0 =A0 |
Industrial Linux Solutions               =A0 =A0 =A0| Phone: +49-5121-20691=
7-5128 |
Peiner Str. 6-8, 31137 Hildesheim, Germany =A0 =A0| Fax: =A0 +49-5121-20691=
7-5555 |
Amtsgericht Hildesheim, HRA 2686 =A0 =A0 =A0 =A0 =A0 =A0 =A0| http://www.pe=
ngutronix.de/ =A0|

--Boundary-00=_anLYUWlCpyFBGbj
Content-Type: text/x-diff;
  charset="iso-8859-15";
  name="nand_test_command.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="nand_test_command.patch"

commit f3deffa6abf6ab563eaa1842fa3836351d867f30
Author: Sascha Hauer <s.hauer@pengutronix.de>
Date:   Thu Jul 24 10:32:52 2014 +0200

    Commands: Add a nand-read-test command
    
    NAND flashes suffer from read disturbance. This means that if a page
    is read often enough there will be bitflips. This test tool continuously
    reads a bunch of pages and shows a statistic over the number of bitfips
    occured after which read iteration. This can be used to test a NAND flash
    but also to test a NAND driver. The page reads are optionally compared
    to the initial read of the page. If there is a difference, but the driver
    has not reported an error the driver is buggy.
    
    Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

diff --git a/commands/Kconfig b/commands/Kconfig
index d73a393885e9..e1d4fba6bc08 100644
--- a/commands/Kconfig
+++ b/commands/Kconfig
@@ -1800,6 +1800,11 @@ config CMD_NANDTEST
 		  -o OFFS	start offset on flash
 		  -l LEN	length of flash to test
 
+config CMD_NAND_READ_TEST
+	tristate
+	depends on NAND
+	prompt "nand read test"
+
 config CMD_POWEROFF
 	tristate
 	depends on HAS_POWEROFF
diff --git a/commands/Makefile b/commands/Makefile
index b1cdf331c441..66d63c8c869a 100644
--- a/commands/Makefile
+++ b/commands/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_CMD_SAVEENV)	+= saveenv.o
 obj-$(CONFIG_CMD_LOADENV)	+= loadenv.o
 obj-$(CONFIG_CMD_NAND)		+= nand.o
 obj-$(CONFIG_CMD_NANDTEST)	+= nandtest.o
+obj-$(CONFIG_CMD_NAND_READ_TEST) += nand-read-test.o
 obj-$(CONFIG_CMD_MEMTEST)	+= memtest.o
 obj-$(CONFIG_CMD_TRUE)		+= true.o
 obj-$(CONFIG_CMD_FALSE)		+= false.o
diff --git a/commands/nand-read-test.c b/commands/nand-read-test.c
new file mode 100644
index 000000000000..cac219178047
--- /dev/null
+++ b/commands/nand-read-test.c
@@ -0,0 +1,275 @@
+/*
+ * Copyright (c) 2014 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
+ *
+ * See file CREDITS for list of people who contributed to this
+ * project.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2
+ * as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+#include <common.h>
+#include <command.h>
+#include <fs.h>
+#include <linux/stat.h>
+#include <errno.h>
+#include <malloc.h>
+#include <getopt.h>
+#include <xfuncs.h>
+#include <init.h>
+#include <ioctl.h>
+#include <nand.h>
+#include <linux/mtd/mtd-abi.h>
+#include <fcntl.h>
+#include <libgen.h>
+#include <string.h>
+#include <clock.h>
+#include <linux/log2.h>
+#include <linux/mtd/mtd.h>
+
+#define MAXFLIPS 8
+
+/*
+ * NAND flashes suffer from read disturbance. This means that if a page
+ * is read often enough there will be bitflips. This test tool continuously
+ * reads a bunch of pages and shows a statistic over the number of bitfips
+ * occured after which read iteration. This can be used to test a NAND flash
+ * but also to test a NAND driver. The page reads are optionally compared
+ * to the initial read of the page. If there is a difference, but the driver
+ * has not reported an error the driver is buggy.
+ */
+struct status {
+	int flips[MAXFLIPS];
+	int err_it;
+	int err;
+	void *buf;
+	void *failbuf;
+};
+
+static void print_status_one(struct status *s, int page)
+{
+	int i;
+
+	printf("%-3d: ", page);
+
+	for (i = 0; i < MAXFLIPS; i++) {
+		if (s->flips[i] == -1)
+			printf("-       ");
+		else
+			printf("%-7d ", s->flips[i]);
+	}
+
+	printf("err: %d @ %d\n", s->err, s->err_it);
+}
+
+int print_status(struct status *status, int num_pages, struct mtd_info *mtd, int iteration)
+{
+	int i, ret;
+
+	printf("\nstatistic after iteration %d:\n\n", iteration);
+
+	printf("  Page no\n");
+	printf(" /    1st bitflip after iteration #\n");
+	printf("|    /        2nd bitflip after iteration #\n");
+	printf("|    |       /         3rd     4th     5th     6th     7th     8th bitflip after iteration #\n");
+	printf("|    |       |        /       /       /       /       /       /          error <errcode> @ iteration #\n");
+	printf("|    |       |       |       |       |       |       |       |          /\n");
+	printf("|    |       |       |       |       |       |       |       |          |\n");
+
+	for (i = 0; i < num_pages; i++) {
+		if (ctrlc())
+			return -EINTR;
+		print_status_one(&status[i], i);
+	}
+
+	for (i = 0; i < num_pages; i++) {
+		struct status *s = &status[i];
+
+		if (ctrlc())
+			return -EINTR;
+
+		if (s->failbuf) {
+			printf("Undetected read failure on page %d:\n", i);
+			printf("Should be:\n");
+			ret = memory_display(s->buf, i * mtd->writesize, mtd->writesize, 4, 0);
+			if (ret)
+				return ret;
+			printf("read instead:\n");
+			ret = memory_display(s->failbuf, i * mtd->writesize, mtd->writesize, 4, 0);
+			if (ret)
+				return ret;
+		}
+	}
+
+	mdelay(200);
+	if (ctrlc())
+		return -EINTR;
+
+	return 0;
+}
+
+static void nand_read_test(struct mtd_info *mtd, int num_pages, int compare)
+{
+	void *_buf;
+	uint64_t start;
+	int i = 0, j, n;
+	loff_t addr;
+	int ret;
+	struct status *status;
+	size_t read;
+	void *pagebuf;
+
+	status = xzalloc(sizeof(struct status) * num_pages);
+	pagebuf = xzalloc(mtd->writesize);
+
+	if (compare) {
+		for (n = 0; n < num_pages; n++) {
+			struct status *s = &status[n];
+
+			addr = n * mtd->writesize;
+			s->buf = malloc(mtd->writesize);
+			if (!s->buf)
+				goto out;
+
+			ret = mtd->read(mtd, addr, mtd->writesize, &read, s->buf);
+			if (ret < 0) {
+				printf("Error while reading compare buffer: %s\n",
+						strerror(-ret));
+				goto out;
+			}
+		}
+	}
+
+	for (i = 0; i < num_pages; i++) {
+		struct status *s = &status[i];
+		for (j = 0; j < MAXFLIPS; j++)
+			s->flips[j] = -1;
+	}
+
+	start = get_time_ns();
+
+	i = 0;
+	while (1) {
+		for (n = 0; n < num_pages; n++) {
+			struct status *s = &status[n];
+			addr = n * mtd->writesize;
+
+			ret = mtd->read(mtd, addr, mtd->writesize, &read, pagebuf);
+			if (ret < 0) {
+				if (!s->err) {
+					s->err_it = i;
+					s->err = ret;
+				}
+			}
+
+			if (ret > 0 && ret <= MAXFLIPS) {
+				if (s->flips[ret - 1] == -1)
+					s->flips[ret - 1] = i;
+			}
+
+			if (compare && ret >= 0 && !s->failbuf && memcmp(s->buf, pagebuf, mtd->writesize))
+				s->failbuf = memdup(pagebuf, mtd->writesize);
+
+			_buf += mtd->writesize;
+		}
+
+		if (ctrlc()) {
+			ret = print_status(status, num_pages, mtd, i);
+			if (ret)
+				goto out;
+		}
+
+		if (is_timeout(start, SECOND * 60)) {
+			printf("iteration: %d\n", i);
+			start = get_time_ns();
+		}
+
+		i++;
+	}
+out:
+	free(pagebuf);
+	for (n = 0; n < num_pages; n++) {
+		struct status *s = &status[n];
+		free(s->buf);
+		free(s->failbuf);
+	}
+
+	free(status);
+
+	return;
+}
+
+static int do_nand_read_test(int argc, char *argv[])
+{
+	int opt, ret, fd;
+	static struct mtd_info_user meminfo;
+	int verbose;
+	int num_pages = 64;
+	int compare = 0;
+
+	while ((opt = getopt(argc, argv, "vn:c")) > 0) {
+		switch (opt) {
+		case 'v':
+			verbose = 1;
+			break;
+		case 'n':
+			num_pages = simple_strtoul(optarg, NULL, 0);
+			break;
+		case 'c':
+			compare = 1;
+			break;
+		default:
+			return COMMAND_ERROR_USAGE;
+		}
+	}
+
+	if (optind >= argc)
+		return COMMAND_ERROR_USAGE;
+
+	fd = open(argv[optind], O_RDWR);
+	if (fd < 0)
+		return fd;
+
+	ret = ioctl(fd, MEMGETINFO, &meminfo);
+
+	close(fd);
+
+	if (ret)
+		return ret;
+
+	if (num_pages * meminfo.writesize > meminfo.size) {
+		num_pages = meminfo.size >> ilog2(meminfo.writesize);
+		printf("WARNING: Device too small. Limiting to %d pages\n", num_pages);
+	}
+
+	printf("Starting NAND read disturbance test on %s with %d pages\n",
+			argv[optind], num_pages);
+	printf("Hit <ctrl-c> once to show current statistics, twice to stop the test\n");
+
+	nand_read_test(meminfo.mtd, num_pages, compare);
+
+	return 0;
+}
+
+BAREBOX_CMD_HELP_START(nand_read_test)
+BAREBOX_CMD_HELP_TEXT("This test tool continuously reads a bunch of NAND pages and")
+BAREBOX_CMD_HELP_TEXT("Prints a statistic about the number of bitflips and crc errors")
+BAREBOX_CMD_HELP_TEXT("occuring on each page")
+BAREBOX_CMD_HELP_TEXT("Options:")
+BAREBOX_CMD_HELP_OPT ("-n <npages>",  "Specify number of pages to test (64)")
+BAREBOX_CMD_HELP_OPT ("-c",  "Compare each page read with the first read")
+BAREBOX_CMD_HELP_END
+
+BAREBOX_CMD_START(nand_read_test)
+	.cmd		= do_nand_read_test,
+	BAREBOX_CMD_DESC("NAND read disturbance test")
+	BAREBOX_CMD_OPTS("NANDDEV")
+	BAREBOX_CMD_GROUP(CMD_GRP_HWMANIP)
+	BAREBOX_CMD_HELP(cmd_nand_read_test_help)
+BAREBOX_CMD_END

--Boundary-00=_anLYUWlCpyFBGbj--
