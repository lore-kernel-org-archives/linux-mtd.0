Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43KY-00028R-VD
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 07:27:20 +0000
Message-ID: <53BA4B98.1080000@huawei.com>
Date: Mon, 7 Jul 2014 15:26:16 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH 6/7] New utility ubidump
References: <53BA491E.8060502@huawei.com>
In-Reply-To: <53BA491E.8060502@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This utility is referred to ubiupdatevol.

I think I should move 'dump_header()' in this file to other
place but I don't know where.

This utility don't support dump binary date because I didn't
find a useful helper function like 'print_dump_hex()' in
kernel and kernel may dump the data which is corrupted so I
think no need to dump them here.


Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 ubi-utils/ubidump.c | 287 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 287 insertions(+)
 create mode 100644 ubi-utils/ubidump.c

diff --git a/ubi-utils/ubidump.c b/ubi-utils/ubidump.c
new file mode 100644
index 0000000..70808a5
--- /dev/null
+++ b/ubi-utils/ubidump.c
@@ -0,0 +1,287 @@
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
+ * the GNU General Public License for more details.
+ */
+
+/*
+ * An utility to dump UBI/UBIFS format data in eraseblock
+ *
+ * Author: Hu Jianyang <hujianyang@huawei.com>
+ */
+
+#define PROGRAM_NAME	"ubidump"
+
+#include <stdlib.h>
+#include <getopt.h>
+
+#include <libubi.h>
+#include <libubifs.h>
+#include <libmtd.h>
+#include <mtd_swab.h>
+#include "common.h"
+#include "ubiutils-common.h"
+
+/* The variables below are set by command line arguments */
+struct args {
+	const char *vol;
+	int lnum;
+	int info:1;
+	int header:1;
+	int node:1;
+};
+
+static struct args args =
+{
+	.vol	= NULL,
+	.lnum	= -1,
+	.info	= 0,
+	.header = 0,
+	.node   = 0,
+};
+
+static const char doc[] = PROGRAM_NAME " version " VERSION
+		" - an utility to dump UBI/UBIFS format data in eraseblock";
+
+static const char optionsstr[] =
+"-h, --help		print help message\n"
+"-n, --lnum		logic eraseblock num to dump\n"
+"-i, --info		show explicit information about NODEs\n"
+"-H, --header		show only header information\n"
+"-N, --node		show only NODEs information\n"
+"-V, --version		print program version";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <UBI volume node file name> [-l <lnum>] [-i]\n"
+"\t\t\t[--help] [--version]\n\n"
+"Example 1: " PROGRAM_NAME " /dev/ubi0_1 -n 2 - dump leb 2 in volume 1\n"
+"Example 2: " PROGRAM_NAME " /dev/ubi0_0 -n 1234 -i - dump leb 1234 with explicit info\n";
+
+static const struct option long_options[] = {
+	{ .name = "help",    .has_arg = 0, .flag = NULL, .val = 'h' },
+	{ .name = "lnum",    .has_arg = 1, .flag = NULL, .val = 'n' },
+	{ .name = "info",    .has_arg = 0, .flag = NULL, .val = 'i' },
+	{ .name = "header",  .has_arg = 0, .flag = NULL, .val = 'H' },
+	{ .name = "node",    .has_arg = 0, .flag = NULL, .val = 'N' },
+	{ .name = "version", .has_arg = 0, .flag = NULL, .val = 's' },
+	{ NULL, 0, NULL, 0}
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+	while (1) {
+		int key, error = 0;
+
+		key = getopt_long(argc, argv, "h?in:HN", long_options, NULL);
+		if (key == -1)
+			break;
+
+		switch (key) {
+		case 'n':
+			args.lnum = simple_strtoul(optarg, &error);
+			if (error || args.lnum < 0)
+				return errmsg("bad lnum: \"%s\"", optarg);
+			break;
+
+		case 'i':
+			args.info = 1;
+			break;
+
+		case 'H':
+			args.header = 1;
+			break;
+
+		case 'N':
+			args.node = 1;
+			break;
+
+		case 'h':
+		case '?':
+			printf("%s\n\n", doc);
+			printf("%s\n\n", usage);
+			printf("%s\n", optionsstr);
+			exit(EXIT_SUCCESS);
+
+		case 'V':
+			common_print_version();
+			exit(EXIT_SUCCESS);
+
+		case ':':
+			return errmsg("parameter is missing");
+
+		default:
+			fprintf(stderr, "Use -h for help\n");
+			return -1;
+		}
+	}
+	if (optind == argc)
+		return errmsg("UBI device name was not specified (use -h for help)");
+	else if (optind != argc - 1)
+		return errmsg("more then one UBI device specified (use -h for help)");
+
+	args.vol = argv[optind];
+
+	if (args.lnum < 0)
+		return errmsg("lnum was not specified (use -h for help)");
+	if (args.header && (args.info || args.node))
+		return errmsg("cannot specify -H with -i or -N");
+
+	return 0;
+}
+
+static void dump_header(struct ubi_ebdump_req *header)
+{
+	struct ubi_ec_hdr *ec_hdr = (struct ubi_ec_hdr *)header->ec_hdr;
+	struct ubi_vid_hdr *vid_hdr = (struct ubi_vid_hdr *)header->vid_hdr;
+
+	printf("lnum %d is mapped to pnum %d\n", header->lnum, header->pnum);
+
+	printf("Erase counter header dump:\n");
+	printf("\tmagic          %#08x\n", be32_to_cpu(ec_hdr->magic));
+	printf("\tversion        %d\n", (int)ec_hdr->version);
+	printf("\tec             %llu\n", (long long)be64_to_cpu(ec_hdr->ec));
+	printf("\tvid_hdr_offset %d\n", be32_to_cpu(ec_hdr->vid_hdr_offset));
+	printf("\tdata_offset    %d\n", be32_to_cpu(ec_hdr->data_offset));
+	printf("\timage_seq      %d\n", be32_to_cpu(ec_hdr->image_seq));
+	printf("\thdr_crc        %#08x\n", be32_to_cpu(ec_hdr->hdr_crc));
+
+	printf("Volume identifier header dump:\n");
+	printf("\tmagic     %08x\n", be32_to_cpu(vid_hdr->magic));
+	printf("\tversion   %d\n",  (int)vid_hdr->version);
+	printf("\tvol_type  %d\n",  (int)vid_hdr->vol_type);
+	printf("\tcopy_flag %d\n",  (int)vid_hdr->copy_flag);
+	printf("\tcompat    %d\n",  (int)vid_hdr->compat);
+	printf("\tvol_id    %d\n",  be32_to_cpu(vid_hdr->vol_id));
+	printf("\tlnum      %d\n",  be32_to_cpu(vid_hdr->lnum));
+	printf("\tdata_size %d\n",  be32_to_cpu(vid_hdr->data_size));
+	printf("\tused_ebs  %d\n",  be32_to_cpu(vid_hdr->used_ebs));
+	printf("\tdata_pad  %d\n",  be32_to_cpu(vid_hdr->data_pad));
+	printf("\tsqnum     %llu\n",
+		(unsigned long long)be64_to_cpu(vid_hdr->sqnum));
+	printf("\thdr_crc   %08x\n", be32_to_cpu(vid_hdr->hdr_crc));
+}
+
+static int dump_leb(libubi_t libubi, int fd, struct ubi_vol_info *vol_info)
+{
+	int ret, leb_size, lnum;
+	char *buf;
+
+	leb_size = vol_info->leb_size;
+	lnum = args.lnum;
+
+	ret = ubi_is_mapped(fd, lnum);
+	if (ret == 0) {
+		errmsg("lnum %d is not mapped", lnum);
+		goto out;
+	} else if (ret < 0) {
+		sys_errmsg("ubi_is_mapped() failed");
+		goto out;
+	}
+
+	/* dump peb header */
+	if (!args.node) {
+		struct ubi_ebdump_req request;
+
+		memset(&request, 0, sizeof(struct ubi_ebdump_req));
+		request.lnum = lnum;
+		request.pnum = -1;
+		ret = ubi_leb_dump_header(libubi, fd, &request);
+		if (ret < 0) {
+			sys_errmsg("cannot dump header of lnum %d", lnum);
+			goto out;
+		} else if (request.pnum == -1) {
+			errmsg("lnum %d is not mapped", lnum);
+			goto out;
+		}
+
+		dump_header(&request);
+	}
+
+	/* dump NODEs */
+	if (!args.header) {
+		off_t offs = lnum * leb_size;
+
+		buf = malloc(leb_size);
+		if (!buf)
+			return errmsg("cannot allocate %d bytes of memory",
+				      leb_size);
+
+		ret = pread(fd, buf, leb_size, offs);
+		if (ret != leb_size) {
+			errmsg("cannot read %d bytes at lnum %d, read %d",
+			       leb_size, lnum, ret);
+			goto out_free;
+		}
+		ubifs_scan(lnum, buf, leb_size, 0, args.info);
+	}
+
+out_free:
+	free(buf);
+out:
+	return ret;
+}
+
+int main(int argc, char * const argv[])
+{
+	int err, fd;
+	libubi_t libubi;
+	struct ubi_vol_info vol_info;
+
+	err = parse_opt(argc, argv);
+	if (err)
+		return -1;
+
+	libubi = libubi_open();
+	if (!libubi) {
+		if (errno == 0)
+			errmsg("UBI is not present in the system");
+		else
+			sys_errmsg("cannot open libubi");
+		goto out_libubi;
+	}
+
+	err = ubi_probe_node(libubi, args.vol);
+	if (err == 1) {
+		errmsg("\"%s\" is an UBI device node, not an UBI volume node",
+		       args.vol);
+		goto out_libubi;
+	} else if (err < 0) {
+		if (errno == ENODEV)
+			errmsg("\"%s\" is not an UBI volume node", args.vol);
+		else
+			sys_errmsg("error while probing \"%s\"", args.vol);
+		goto out_libubi;
+	}
+
+	err = ubi_get_vol_info(libubi, args.vol, &vol_info);
+	if (err) {
+		sys_errmsg("cannot get information about UBI volume \"%s\"",
+			   args.vol);
+		goto out_libubi;
+	}
+
+	fd = open(args.vol, O_RDONLY);
+	if (fd == -1) {
+		sys_errmsg("cannot open UBI volume \"%s\"", args.vol);
+		goto out_libubi;
+	}
+	err = dump_leb(libubi, fd, &vol_info);
+	if (err)
+		goto out_fd;
+
+	close(fd);
+	libubi_close(libubi);
+	return 0;
+
+out_fd:
+	close(fd);
+out_libubi:
+	libubi_close(libubi);
+	return -1;
+}
-- 
1.8.1.4
