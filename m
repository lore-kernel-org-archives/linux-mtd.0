Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eDyag-0000mF-87
 for linux-mtd@lists.infradead.org; Sun, 12 Nov 2017 20:10:56 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 5286024E0011
 for <linux-mtd@lists.infradead.org>; Sun, 12 Nov 2017 21:10:19 +0100 (CET)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [RFC][PATCH] mtd-utils: Add lsmtd program
Date: Sun, 12 Nov 2017 21:09:56 +0100
Message-Id: <20171112200956.6217-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds a program called "lsmtd". The program produces a pretty
printed list of the hierarchy of UBI and MTD devices on a system. It
tries to imitate the lsblk program from util-linux as closely as
possible.

A number of command line switches are available to fine tune what information
should be exposed and in what output format.

The goal is to have a simple way of displaying the complete MTD stack on
a system in a human readable form instead of piecing details together
from proc files and various UBI utilities.

As the date suggests, I had this sitting around for a while and added
pieces whenever I found some time, but then largely forgot about it
again and let it collect dust.

I recently ported it to current mtd-utils master. It should apply and build
on master but unfortunately requires some adjustments to work on top of one
of the release tarballs.

Size wise, the program binary is a little larger than most other utilities
and falls between mtdinfo and mkfs.jffs2 on my x86_64 and ARM builds.

Some features like generating JSON formatted output were only implemented to
imitate lsblk functionality and might be removed if absolutely nobody has
any use for that, possibly reducing the bloat a little.

Almost a year ago, we had a discussion on the MTD IRC channel if something
like this would be appreciated as part of mtd-utils in the first place and
it got largely positive feedback.

Since then I tested the program on pretty much every board that I got my hands
on, so I guess it should be in a stable enough state now to submit it to the
mailing list for comments and suggestions.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 .gitignore               |   1 +
 misc-utils/Makemodule.am |  11 +-
 misc-utils/lsmtd.8       | 104 ++++++++
 misc-utils/lsmtd.c       | 601 +++++++++++++++++++++++++++++++++++++++++++++++
 misc-utils/lsmtd.h       |  42 ++++
 misc-utils/lsmtd_print.c | 143 +++++++++++
 6 files changed, 900 insertions(+), 2 deletions(-)
 create mode 100644 misc-utils/lsmtd.8
 create mode 100644 misc-utils/lsmtd.c
 create mode 100644 misc-utils/lsmtd.h
 create mode 100644 misc-utils/lsmtd_print.c

diff --git a/.gitignore b/.gitignore
index 38bd04d..6c48657 100644
--- a/.gitignore
+++ b/.gitignore
@@ -64,6 +64,7 @@ mkvol_bad
 mkvol_basic
 mkvol_paral
 mtdinfo
+lsmtd
 orph
 pdfrun
 perf
diff --git a/misc-utils/Makemodule.am b/misc-utils/Makemodule.am
index ce1c385..b622886 100644
--- a/misc-utils/Makemodule.am
+++ b/misc-utils/Makemodule.am
@@ -33,11 +33,14 @@ flashcp_SOURCES = misc-utils/flashcp.c
 flash_erase_SOURCES = misc-utils/flash_erase.c
 flash_erase_LDADD = libmtd.a
 
+lsmtd_SOURCES = misc-utils/lsmtd.c misc-utils/lsmtd_print.c misc-utils/lsmtd.h
+lsmtd_LDADD = libmtd.a
+
 MISC_BINS = \
 	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
 	serve_image recv_image flash_erase flash_lock \
 	flash_unlock flash_otp_info flash_otp_dump flash_otp_lock \
-	flash_otp_write flashcp mtdpart
+	flash_otp_write flashcp mtdpart lsmtd
 
 MISC_SH = \
 	misc-utils/flash_eraseall
@@ -46,9 +49,13 @@ MISC_EXTRA = \
 	misc-utils/MAKEDEV
 
 MISC_HEADER = \
-	misc-utils/mcast_image.h
+	misc-utils/mcast_image.h misc-utils/lsmtd.h
+
+MISC_MAN8 = \
+	misc-utils/lsmtd.8
 
 EXTRA_DIST += $(MISC_HEADER) $(MISC_EXTRA) $(MISC_SH)
 
+dist_man8_MANS += $(MISC_MAN8)
 sbin_PROGRAMS += $(MISC_BINS)
 sbin_SCRIPTS += $(MISC_SH)
diff --git a/misc-utils/lsmtd.8 b/misc-utils/lsmtd.8
new file mode 100644
index 0000000..ec0d1b4
--- /dev/null
+++ b/misc-utils/lsmtd.8
@@ -0,0 +1,104 @@
+.TH LSMTD 8 "August 2016" "mtd-utils"
+.SH NAME
+lsmtd \- list memory technology devices
+.SH SYNOPSIS
+.B lsmtd
+[options]
+.RI [ device ...]
+.SH DESCRIPTION
+.B lsmtd
+lists information about all available or the specified mtd devices.  The
+.B lsmtd
+command reads the
+.B sysfs
+filesystem to gather information. Alternatively, the
+.B procfs
+filesystem and ioctl interfaces are used, should the sysfs filesytem not
+be available.
+.PP
+The command prints all mtd devices in a pretty-printed list format by default.
+.PP
+The default output is subject to change. So whenever possible, you should
+avoid using default outputs in your scripts. Always explicitly define expected
+columns by using
+.B \-\-output
+.I columns-list
+in environments where a stable output is required.
+.PP
+Use
+.B "lsmtd --help"
+to get a list of all available columns.
+.SH OPTIONS
+.TP
+.BR \-b , " \-\-bytes"
+Print columns with size quantities (e.g. erase block size) in bytes instead
+of a human-readable format.
+.TP
+.BR \-h , " \-\-help"
+Display a help text and exit.
+.TP
+.BR \-J , " \-\-json"
+Use JSON output format. All potentially unsafe characters in string values are
+escaped with JSON escape sequences or hex-escaped (\\u<code>).
+.TP
+.BR \-l , " \-\-list"
+Use a pretty-printed list output format (default).
+.TP
+.BR \-n , " \-\-noheadings"
+Do not print column headings when using raw or list output format.
+.TP
+.BR \-o , " \-\-output " \fIlist\fP
+Specify which output columns to print.  Use
+.B \-\-help
+to get a list of all supported columns.
+
+The default list of columns may be extended if \fIlist\fP is
+specified in the format \fI+list\fP (e.g. \fBlsmtd -o +EB-SIZE\fP).
+.TP
+.BR \-O , " \-\-output\-all "
+Output all available columns.
+.TP
+.BR \-P , " \-\-pairs"
+Produce output in the form of key="value" pairs.
+All potentially unsafe characters are hex-escaped (\\x<code>).
+.TP
+.BR \-r , " \-\-raw"
+Produce output in raw format. All potentially unsafe characters are
+hex-escaped (\\x<code>).
+.TP
+.BR \-u , " \-\-si\-units"
+Display human readable sizes as powers of ten rather than powers of two.
+.TP
+.BR \-V , " \-\-version"
+Print version information and exit.
+.TP
+.BR \-x , " \-\-sort " \fIcolumn\fP
+Sort output lines by \fIcolumn\fP.
+.SH NOTES
+If the
+.B \-\-bytes
+option is not specified, the JSON output format prints sizes as string values
+even if they do not have a suffix.
+.SH AUTHORS
+.nf
+David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+.fi
+.SH REPORTING BUGS
+Report mtd-utils bugs to the Linux mtd mailing list.
+.TP
+Linux mtd mailing list: <linux-mtd@lists.infradead.org>
+.TP
+Linux mtd home page: <http://www.linux-mtd.infradead.org/>
+.SH AVAILABILITY
+The lsmtd command is part of the mtd-utils package and is available from
+ftp://ftp.infradead.org/pub/mtd-utils/.
+.SH COPYRIGHT
+Copyright \(co 2016 David Oberhollenzer - sigma star gmbh
+.br
+License GPLv2: GNU GPL version 2 <http://gnu.org/licenses/gpl2.html>.
+.br
+This is free software: you are free to change and redistribute it.
+There is NO WARRANTY, to the extent permitted by law.
+.SH SEE ALSO
+.BR lsblk (8),
+.BR ls (1)
diff --git a/misc-utils/lsmtd.c b/misc-utils/lsmtd.c
new file mode 100644
index 0000000..9bfc8c6
--- /dev/null
+++ b/misc-utils/lsmtd.c
@@ -0,0 +1,601 @@
+/*
+ * Copyright (C) 2016 David Oberhollenzer - sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; see the file COPYING. If not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA.
+ *
+ * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+#define PROGRAM_NAME "lsmtd"
+#include <string.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <errno.h>
+
+#include <libmtd.h>
+
+#include "common.h"
+#include "xalloc.h"
+#include "lsmtd.h"
+
+
+#define TYPE_CALLBACK 0x00
+#define TYPE_INT 0x01
+#define TYPE_STRING 0x02
+#define TYPE_LONG_LONG 0x03
+#define TYPE_ATTR_SIZE 0x10
+
+
+static libmtd_t lib;
+static int sort_by = -1;
+static int print_cols = 0;
+static int list_arg = -1;
+int flags = 0;
+
+
+static int print_device(int padd, struct mtd_dev_info *dev)
+{
+	char buffer[32];
+	snprintf(buffer, sizeof(buffer) - 1, "mtd%d", dev->mtd_num);
+	buffer[sizeof(buffer) - 1] = '\0';
+	return print_string(padd, buffer);
+}
+
+static int cmp_device(const void *a, const void *b)
+{
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	return adev->mtd_num - bdev->mtd_num;
+}
+
+static int print_dev_no(int padd, struct mtd_dev_info *dev)
+{
+	if (flags & FLAG_LIST) {
+		if (flags & FLAG_DRYRUN)
+			return snprintf(NULL, 0, "%d:%d",
+					dev->major, dev->minor);
+
+		if (flags & FLAG_NO_HEADING || padd > 7) {
+			padd -= printf("%d:", dev->major);
+			return printf("%-*d", padd, dev->minor);
+		}
+
+		return printf("%3d:%-3d", dev->major, dev->minor);
+	}
+
+	if (flags & FLAG_JSON)
+		return printf("\"%d:%d\"", dev->major, dev->minor);
+
+	return printf("%d:%d", dev->major, dev->minor);
+}
+
+static int cmp_dev_no(const void *a, const void *b)
+{
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	if (adev->major == bdev->major)
+		return adev->minor - bdev->minor;
+	return adev->major - bdev->major;
+}
+
+static int print_page_count(int padd, struct mtd_dev_info *dev)
+{
+	return print_num(padd, dev->eb_size / dev->min_io_size);
+}
+
+static int cmp_page_count(const void *a, const void *b)
+{
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	int acount = adev->eb_size / adev->min_io_size;
+	int bcount = bdev->eb_size / bdev->min_io_size;
+	return acount - bcount;
+}
+
+static int print_subpage_count(int padd, struct mtd_dev_info *dev)
+{
+	return print_num(padd, dev->min_io_size / dev->subpage_size);
+}
+
+static int cmp_subpage_count(const void *a, const void *b)
+{
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	int acount = adev->min_io_size / adev->subpage_size;
+	int bcount = bdev->min_io_size / bdev->subpage_size;
+	return acount - bcount;
+}
+
+static int print_bb_allowed(int padd, struct mtd_dev_info *dev)
+{
+	return print_bool(padd, dev->bb_allowed);
+}
+
+static int cmp_bb_allowed(const void *a, const void *b)
+{
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	return adev->bb_allowed - bdev->bb_allowed;
+}
+
+static int print_dev_writable(int padd, struct mtd_dev_info *dev)
+{
+	return print_bool(padd, dev->writable);
+}
+
+static int cmp_writable(const void *a, const void *b)
+{
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	return adev->writable - bdev->writable;
+}
+
+#define INIT_FIELD(tp, name) \
+	.type = tp, .field = { .offset = offsetof(struct mtd_dev_info, name) }
+
+#define INIT_CB(print, cmp) .type = TYPE_CALLBACK, \
+	.field = { .cb = { .print_fn = print, .compare = cmp } }
+
+#define NUM_COLS (sizeof(tbl_print) / sizeof(tbl_print[0]))
+
+static struct tbl_entry_t {
+	const char *heading;
+	const char *description;
+	int position;
+	int width;
+	int type;
+	union {
+		size_t offset;
+		struct {
+			int(*print_fn)(int padd, struct mtd_dev_info *dev);
+			int(*compare)(const void *a, const void *b);
+		} cb;
+	} field;
+} tbl_print[] = {
+	{ "DEVICE", "name of the device node", .position = 0,
+		INIT_CB(print_device, cmp_device) },
+	{ "MAJ:MIN", "major:minor device number", .position = 1,
+		INIT_CB(print_dev_no, cmp_dev_no) },
+	{ "TYPE", "memory technology type", .position = 2,
+		INIT_FIELD(TYPE_STRING, type_str) },
+	{ "NAME", "name assigned to the device", .position = 3,
+		INIT_FIELD(TYPE_STRING, name) },
+	{ "SIZE", "total storage capacity", .position = 4,
+		INIT_FIELD(TYPE_LONG_LONG|TYPE_ATTR_SIZE, size) },
+	{ "EB-SIZE", "erase block size", .position = -1,
+		INIT_FIELD(TYPE_INT|TYPE_ATTR_SIZE, eb_size) },
+	{ "EB-COUNT", "number of erase blocks", .position = -1,
+		INIT_FIELD(TYPE_INT, eb_cnt) },
+	{ "REGIONS", "number of additional erase regions", .position = -1,
+		INIT_FIELD(TYPE_INT, region_cnt) },
+	{ "PAGE-SIZE", "size of read/write pages", .position = -1,
+		INIT_FIELD(TYPE_INT|TYPE_ATTR_SIZE, min_io_size) },
+	{ "PAGE-COUNT", "number of pages per erase block", .position = -1,
+		INIT_CB(print_page_count, cmp_page_count) },
+	{ "SUBPAGE-SIZE", "size of sub pages", .position = -1,
+		INIT_FIELD(TYPE_INT|TYPE_ATTR_SIZE, subpage_size) },
+	{ "SUBPAGE-COUNT", "number of sub-pages per page", .position = -1,
+		INIT_CB(print_subpage_count, cmp_subpage_count) },
+	{ "OOB-SIZE", "size of out-of-band area", .position = -1,
+		INIT_FIELD(TYPE_INT|TYPE_ATTR_SIZE, oob_size) },
+	{ "BB", "bad erase blocks allowed", .position = -1,
+		INIT_CB(print_bb_allowed, cmp_bb_allowed) },
+	{ "WR", "device writable", .position = -1,
+		INIT_CB(print_dev_writable, cmp_writable) },
+};
+
+static int cmp_tbl_entry(const void *a, const void *b)
+{
+	const struct tbl_entry_t *aent = a, *bent = b;
+	if (aent->position < 0 && bent->position < 0)
+		return 0;
+	if (aent->position < 0)
+		return 1;
+	if (bent->position < 0)
+		return -1;
+	return aent->position - bent->position;
+}
+
+static int mtd_dev_compare(const void *a, const void *b)
+{
+	const struct tbl_entry_t *ent = tbl_print + sort_by;
+	const struct mtd_dev_info *adev = a, *bdev = b;
+	long long allval, bllval;
+	const char *astr, *bstr;
+	int aival, bival;
+
+	switch (ent->type & 0x0F) {
+	case TYPE_LONG_LONG:
+		allval = *((long long *)((char *)adev + ent->field.offset));
+		bllval = *((long long *)((char *)bdev + ent->field.offset));
+		return allval < bllval ? -1 : (allval > bllval ? 1 : 0);
+	case TYPE_INT:
+		aival = *((int *)((char *)adev + ent->field.offset));
+		bival = *((int *)((char *)bdev + ent->field.offset));
+		return aival - bival;
+	case TYPE_STRING:
+		astr = (char *)adev + ent->field.offset;
+		bstr = (char *)bdev + ent->field.offset;
+		return strcmp(astr, bstr);
+	}
+
+	return ent->field.cb.compare(a, b);
+}
+
+static int print_entry(struct tbl_entry_t *ent, int padd,
+			struct mtd_dev_info *dev)
+{
+	const char *str;
+	long long llval;
+	int ival;
+
+	switch (ent->type & 0x0F) {
+	case TYPE_LONG_LONG:
+		llval = *((long long *)((char *)dev + ent->field.offset));
+
+		if (ent->type & TYPE_ATTR_SIZE)
+			return print_size(padd, llval);
+
+		return print_num(padd, llval);
+	case TYPE_INT:
+		ival = *((int *)((char *)dev + ent->field.offset));
+
+		if (ent->type & TYPE_ATTR_SIZE)
+			return print_size(padd, ival);
+
+		return print_num(padd, ival);
+	case TYPE_STRING:
+		str = (char *)dev + ent->field.offset;
+		return print_string(padd, str);
+	}
+
+	return ent->field.cb.print_fn(padd, dev);
+}
+
+static void print_list(struct mtd_dev_info *list, size_t list_len)
+{
+	int i, len;
+	size_t j;
+
+	if (flags & FLAG_LIST) {
+		flags |= FLAG_DRYRUN;
+		if (!(flags & FLAG_NO_HEADING)) {
+			for (i = 0; i < print_cols; ++i)
+				tbl_print[i].width =
+					strlen(tbl_print[i].heading);
+		}
+
+		for (j = 0; j < list_len; ++j) {
+			for (i = 0; i < print_cols; ++i) {
+				len = print_entry(tbl_print + i,
+						tbl_print[i].width, list + j);
+				if (len > tbl_print[i].width)
+					tbl_print[i].width = len;
+			}
+		}
+	}
+
+	flags &= ~FLAG_DRYRUN;
+	if (!(flags & FLAG_NO_HEADING)) {
+		for (i = 0; i < print_cols; ++i) {
+			if (i)
+				putchar(' ');
+			if (flags & FLAG_RAW) {
+				printf("%s", tbl_print[i].heading);
+			} else if ((tbl_print[i].type & 0x0F) == TYPE_INT ||
+				(tbl_print[i].type & 0x0F) == TYPE_LONG_LONG) {
+
+				printf("%*s", tbl_print[i].width,
+					tbl_print[i].heading);
+			} else {
+				printf("%-*s", tbl_print[i].width,
+					tbl_print[i].heading);
+			}
+		}
+		putchar('\n');
+	}
+
+	for (j = 0; j < list_len; ++j) {
+		for (i = 0; i < print_cols; ++i) {
+			if (i)
+				putchar(' ');
+			print_entry(tbl_print + i,
+					tbl_print[i].width, list + j);
+		}
+		putchar('\n');
+	}
+}
+
+static void print_pairs(struct mtd_dev_info *list, size_t list_len)
+{
+	size_t i, j;
+
+	for (j = 0; j < list_len; ++j) {
+		for (i = 0; i < print_cols; ++i) {
+			if (i)
+				putchar(' ');
+			printf("%s=\"", tbl_print[i].heading);
+			print_entry(tbl_print + i, 0, list + j);
+			putchar('"');
+		}
+		putchar('\n');
+	}
+}
+
+static void print_json(struct mtd_dev_info *list, size_t list_len)
+{
+	const char *heading;
+	size_t j;
+	int i;
+
+	puts("{\n\t\"mtddevices\": [{");
+
+	for (j = 0; j < list_len; ++j) {
+		if (j)
+			puts(", {");
+
+		for (i = 0; i < print_cols; ++i) {
+			if (i)
+				puts(",");
+
+			fputs("\t\t\"", stdout);
+			heading = tbl_print[i].heading;
+			while (*heading)
+				putchar(tolower(*(heading++)));
+			fputs("\": ", stdout);
+			print_entry(tbl_print + i, 0, list + j);
+		}
+		fputs("\n\t}", stdout);
+	}
+
+	puts("]\n}");
+}
+
+static const struct option long_opts[] = {
+	{ "help", no_argument, NULL, 'h' },
+	{ "version", no_argument, NULL, 'V' },
+	{ "si-units", no_argument, NULL, 'u' },
+	{ "bytes", no_argument, NULL, 'b' },
+	{ "noheadings", no_argument, NULL, 'n' },
+	{ "raw", no_argument, NULL, 'r' },
+	{ "output", required_argument, NULL, 'o' },
+	{ "output-all", no_argument, NULL, 'O' },
+	{ "pairs", no_argument, NULL, 'P' },
+	{ "list", no_argument, NULL, 'l' },
+	{ "json", no_argument, NULL, 'J' },
+	{ "sort", required_argument, NULL, 'x' },
+	{ NULL, 0, NULL, 0 },
+};
+
+static const char *short_opts = "x:o:OPJlbrunhV";
+
+static NORETURN void usage(int status)
+{
+	FILE *outstream = status == EXIT_SUCCESS ? stdout : stderr;
+	int i, len, max_len = 0;
+
+	fputs(
+"Usage: "PROGRAM_NAME" [options] [<device> ...]\n\n"
+"List information about memory technology devices.\n\n"
+"Options:\n"
+"  -u, --si-units       Scale sizes by factors of 1000 instead of 1024\n"
+"  -b, --bytes          Print sizes in bytes\n"
+"  -n, --noheadings     Don't print a heading\n"
+"  -l, --list           Use list output format (default)\n"
+"  -r, --raw            Use raw output format\n"
+"  -P, --pairs          Use key=\"value\" output format\n"
+"  -J, --json           Use JSON output format\n"
+"  -o, --output <list>  Comma seperated list of columns to print\n"
+"  -O, --output-all     Print all columns\n"
+"  -x, --sort <column>  Sort output by <column>\n"
+"\n"
+"  -h, --help           Display this help text and exit\n"
+"  -V, --version        Output version information and exit\n"
+"\n"
+"Available columns (for --output, --sort):\n",
+		outstream);
+
+	for (i = 0; i < NUM_COLS; ++i) {
+		len = strlen(tbl_print[i].heading);
+		max_len = len > max_len ? len : max_len;
+	}
+
+	for (i = 0; i < NUM_COLS; ++i) {
+		fprintf(outstream, "%*s  %s\n", max_len, tbl_print[i].heading,
+			tbl_print[i].description);
+	}
+
+	exit(status);
+}
+
+static NORETURN void version(int status)
+{
+	common_print_version();
+	fputs(
+"Copyright (C) 2016 David Oberhollenzer - sigma star gmbh\n"
+"License GPLv2: GNU GPL version 2 <http://gnu.org/licenses/gpl2.html>.\n"
+"This is free software: you are free to change and redistribute it.\n"
+"There is NO WARRANTY, to the extent permitted by law.\n",
+		stdout);
+	exit(status);
+}
+
+static int find_column(const char *name, int len)
+{
+	int i;
+	for (i = 0; i < NUM_COLS; ++i) {
+		if (strncasecmp(tbl_print[i].heading, name, len) != 0)
+			continue;
+		if (tbl_print[i].heading[len])
+			continue;
+		return i;
+	}
+	fprintf(stderr, "Unknown column \"%.*s\"\n", len, name);
+	return -1;
+}
+
+static int process_hlist(const char *list)
+{
+	int i, pos = 0, len;
+	const char *end;
+
+	if (*list == '+') {
+		for (i = 0; i < NUM_COLS; ++i) {
+			if (tbl_print[i].position > pos)
+				pos = tbl_print[i].position;
+		}
+
+		++pos;
+		++list;
+	} else {
+		for (i = 0; i < NUM_COLS; ++i)
+			tbl_print[i].position = -1;
+	}
+
+	while (*list) {
+		end = strchrnul(list, ',');
+		len = end - list;
+
+		i = find_column(list, len);
+		if (i < 0)
+			return -1;
+
+		if (tbl_print[i].position < 0)
+			tbl_print[i].position = pos++;
+
+		list = *end ? end + 1 : end;
+	}
+	return 0;
+}
+
+static void process_args(int argc, char **argv)
+{
+	size_t j;
+	int i;
+
+	while (1) {
+		i = getopt_long(argc, argv, short_opts, long_opts, NULL);
+		if (i == -1)
+			break;
+
+		switch (i) {
+		case 'x':
+			sort_by = find_column(optarg, strlen(optarg));
+			if (sort_by < 0)
+				goto fail;
+			break;
+		case 'o':
+			if (process_hlist(optarg) != 0)
+				goto fail;
+			break;
+		case 'O':
+			for (j = 0; j < NUM_COLS; ++j)
+				tbl_print[j].position = j;
+			break;
+		case 'J': flags |= FLAG_JSON; break;
+		case 'P': flags |= FLAG_PAIRS; break;
+		case 'l': flags |= FLAG_LIST; break;
+		case 'b': flags |= FLAG_BYTES; break;
+		case 'r': flags |= FLAG_RAW; break;
+		case 'u': flags |= FLAG_SI; break;
+		case 'n': flags |= FLAG_NO_HEADING; break;
+		case 'h': usage(EXIT_SUCCESS);
+		case 'V': version(EXIT_SUCCESS);
+		default: usage(EXIT_FAILURE);
+		}
+	}
+
+	i = flags & (FLAG_LIST|FLAG_PAIRS|FLAG_RAW|FLAG_JSON);
+
+	if (i & (i - 1)) {
+		fputs(PROGRAM_NAME": these options are mutually exclusive: "
+			"--list --pairs --raw --json\n", stderr);
+		goto fail;
+	} else if (!i) {
+		flags |= FLAG_LIST;
+	}
+
+	if (optind < argc)
+		list_arg = optind;
+	return;
+fail:
+	fputs("Try `"PROGRAM_NAME" --help` for more information\n\n", stderr);
+	exit(EXIT_FAILURE);
+}
+
+int main(int argc, char **argv)
+{
+	struct mtd_dev_info *list = NULL;
+	int i, ret = EXIT_FAILURE;
+	struct mtd_info info;
+	size_t list_len = 0;
+
+	process_args(argc, argv);
+
+	lib = libmtd_open();
+	if (!lib) {
+		if (errno) {
+			perror("libmtd_open");
+			return EXIT_FAILURE;
+		}
+		return EXIT_SUCCESS;
+	}
+
+	if (list_arg <= 0) {
+		if (mtd_get_info(lib, &info) != 0) {
+			if (errno == ENODEV)
+				ret = EXIT_SUCCESS;
+			goto out;
+		}
+
+		list = xcalloc(info.mtd_dev_cnt, sizeof(list[0]));
+
+		for (i = info.lowest_mtd_num; i <= info.highest_mtd_num; ++i) {
+			if (mtd_get_dev_info1(lib, i, list + list_len) != 0) {
+				if (errno == ENODEV)
+					continue;
+				goto out;
+			}
+			++list_len;
+		}
+	} else {
+		list = xcalloc(argc - list_arg, sizeof(list[0]));
+
+		for (i = list_arg; i < argc; ++i) {
+			if (mtd_get_dev_info(lib, argv[i],
+					list + list_len++) != 0) {
+				goto out;
+			}
+		}
+	}
+
+	if (sort_by >= 0)
+		qsort(list, list_len, sizeof(list[0]), mtd_dev_compare);
+
+	qsort(tbl_print, NUM_COLS, sizeof(tbl_print[0]), cmp_tbl_entry);
+
+	for (print_cols = 0; print_cols < NUM_COLS; ++print_cols) {
+		if (tbl_print[print_cols].position < 0)
+			break;
+	}
+
+	if (flags & FLAG_PAIRS) {
+		print_pairs(list, list_len);
+	} else if (flags & FLAG_JSON) {
+		print_json(list, list_len);
+	} else {
+		print_list(list, list_len);
+	}
+	ret = EXIT_SUCCESS;
+out:
+	free(list);
+	libmtd_close(lib);
+	return ret;
+}
diff --git a/misc-utils/lsmtd.h b/misc-utils/lsmtd.h
new file mode 100644
index 0000000..e1cecb1
--- /dev/null
+++ b/misc-utils/lsmtd.h
@@ -0,0 +1,42 @@
+/*
+ * Copyright (C) 2016 sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; see the file COPYING. If not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA.
+ *
+ * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+#ifndef LSMTD_H
+#define LSMTD_H
+
+
+#define FLAG_SI 0x0001
+#define FLAG_BYTES 0x0002
+#define FLAG_NO_HEADING 0x0004
+#define FLAG_RAW 0x0008
+#define FLAG_PAIRS 0x0010
+#define FLAG_LIST 0x0020
+#define FLAG_JSON 0x0040
+#define FLAG_DRYRUN 0x1000
+
+
+extern int flags;
+
+
+int print_size(int padd, long long int size);
+int print_num(int padd, int num);
+int print_string(int padd, const char *str);
+int print_bool(int padd, int value);
+
+#endif /* LSMTD_H */
+
diff --git a/misc-utils/lsmtd_print.c b/misc-utils/lsmtd_print.c
new file mode 100644
index 0000000..7ad3c29
--- /dev/null
+++ b/misc-utils/lsmtd_print.c
@@ -0,0 +1,143 @@
+/*
+ * Copyright (C) 2016 David Oberhollenzer - sigma star gmbh
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published by
+ * the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; see the file COPYING. If not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA 02110-1335, USA.
+ *
+ * Author: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
+ */
+#define PROGRAM_NAME "lsmtd"
+#include <string.h>
+#include <stdlib.h>
+#include <stdint.h>
+#include <getopt.h>
+#include <stddef.h>
+#include <stdio.h>
+#include <errno.h>
+
+#include <libmtd.h>
+
+#include "common.h"
+#include "xalloc.h"
+#include "lsmtd.h"
+
+static const char suffix[] = { 'K', 'M', 'G', 'T', 'P', 'E' };
+static const char bcdmap[] = {
+	'0', '1', '1', '2', '3', '3', '4', '4',
+	'5', '6', '6', '7', '8', '8', '9', '9'
+};
+
+int print_size(int padd, long long int size)
+{
+	int scale, idx, i, remainder, len;
+	char pre[3] = {0}, post[5] = {0};
+
+	if (!(flags & FLAG_BYTES)) {
+		scale = flags & FLAG_SI ? 1000 : 1024;
+		i = remainder = 0;
+		idx = -1;
+
+		while (size >= scale && idx < (int)sizeof(suffix)) {
+			if (remainder >= (scale / 2)) {
+				remainder = 0;
+				size = (size / scale) + 1;
+			} else {
+				remainder = size % scale;
+				size /= scale;
+			}
+			++idx;
+		}
+
+		remainder = (remainder >> 6) & 0x0F;
+		if (remainder) {
+			post[i++] = '.';
+			post[i++] = bcdmap[remainder];
+		}
+		if (idx >= 0)
+			post[i++] = suffix[idx];
+		if (flags & FLAG_JSON) {
+			pre[0] = '"';
+			post[i] = '"';
+		}
+	}
+
+	if (flags & FLAG_LIST) {
+		len = snprintf(NULL, 0, "%s%lld%s", pre, size, post);
+		if (flags & FLAG_DRYRUN)
+			return len;
+		padd -= len;
+		for (i = 0; i < padd; ++i)
+			putchar(' ');
+	}
+	return printf("%s%lld%s", pre, size, post);
+}
+
+int print_num(int padd, int num)
+{
+	if (flags & FLAG_LIST) {
+		if (flags & FLAG_DRYRUN)
+			return snprintf(NULL, 0, "%d", num);
+		return printf("%*d", padd, num);
+	}
+	return printf("%d", num);
+}
+
+int print_string(int padd, const char *str)
+{
+	const char *jsonrepl = "nrtfb", *jsonesc = "\n\r\t\f\b";
+	const char *escape = "\\\"", *ptr;
+
+	if (flags & FLAG_JSON) {
+		putchar('"');
+		for (; *str; ++str) {
+			ptr = strchr(jsonesc, *str);
+			if (ptr) {
+				putchar('\\');
+				putchar(jsonrepl[ptr - jsonesc]);
+			} else if (strchr(escape, *str)) {
+				putchar('\\');
+				putchar(*str);
+			} else if (isascii(*str) &&
+				(iscntrl(*str) || !isprint(*str))) {
+				printf("\\u%04X", *str);
+			} else {
+				putchar(*str);
+			}
+		}
+		putchar('"');
+		return 0;
+	}
+
+	if (flags & (FLAG_RAW|FLAG_PAIRS)) {
+		while (*str) {
+			if (iscntrl(*str) || !isprint(*str) ||
+				strchr(escape, *str)) {
+				printf("\\x%02X", *(str++));
+			} else {
+				putchar(*(str++));
+			}
+		}
+	}
+
+	return (flags & FLAG_DRYRUN) ? strlen(str) : printf("%-*s", padd, str);
+}
+
+int print_bool(int padd, int value)
+{
+	if (flags & FLAG_JSON) {
+		fputs(value ? "true" : "false", stdout);
+		return 0;
+	}
+
+	return print_num(padd, value);
+}
-- 
2.13.6
