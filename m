Return-Path: <SRS0=PqFb=NH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FFCC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 13:22:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E37600D4
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Aug 2021 13:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2E37600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xP4rJ61O7iVsVyjp0i+N37y3cP2U5NI3AVX3gpyl5x8=; b=UGPQCdNm2tjb8L
	gmkVBwaFndkt/67QQ6YfpoBLXxH5PtxXxN+VCI2rteQnq+/kfrXLaCVd740cc8UL+0w8fM4VLealI
	O1lvetWnZ0Ok92p4TTuMTPppVGszgDZx3+POBj6MJHCAjEbFKmgH9Ay4cYpnVvpjJu3X+fKogXcPq
	k8T09a6mL+LzVd/j4bZCxysnZxnQDagYX5dMZ6hXQ9W+4gN3NZXsjFYCE2gHMqe50wF5OoxPTgsGD
	gc5mIy0YFVRNwcnfpbkLjsbiKageL9Bo/zDNEEg3BaZ7U0jWLx2wV4gaubirj6dMY+E2hrLvtCxsh
	3GshultfJeOJbtHuQi4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFcYa-00H4yR-95; Mon, 16 Aug 2021 13:21:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFcYL-00H4vG-U6
 for linux-mtd@lists.infradead.org; Mon, 16 Aug 2021 13:21:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so17021906pjb.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Aug 2021 06:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=nqswQeTKBdoB8+HWsKks7xsdGz/hptfCErNSORUc7uo=;
 b=VHzrgvDGOVrlrN37FikkFHvWtdbr6Bue5xlwDNlcoW8Puzo/yxEbbGkFRB0ZNl6N/h
 Wj+D2spNRlGrZVkxHDyoDyiGc1Dj+op49koAgnuLrpMkiWhQ4FIhTyHH+xtmd/hNlB5s
 9flDOU4f6824o3ASGpzn1zKN10Waeqv18jMd9uK4hSomJjl1o6gpBEtmzR4SmPgssG+y
 mglaZ0Jy45pG4WEvaDdxpwTIOgkGWyIX3kNKOTzDvUde/beCapfK7iT1397b9X8cbn1K
 F+LzVhUogrjmjiCukSjMxFxHuc+m/gDuYXUuGYW0rpckQmfKGLtf3mBFl6J2ix1dQw47
 QSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nqswQeTKBdoB8+HWsKks7xsdGz/hptfCErNSORUc7uo=;
 b=VuG8M5IlKYwN0KMZ5XufNyZpyKkT7YvzM4m4F2Mt5+9gweHdB5WBr6TKjObaMOqBB2
 yPQWKLYXnRWjnqYa2YluzF6QmQ5PbXTsm5NkOMGC/FeteRKNJgZdr+wfUuxOQXpZDg+l
 9yG9J/lIr7MS6+hwMOiVNjP+3IsfXzPxRe5Aao8Hp4i0fB6eX+KVyWpX8HOj7jKf5Ud+
 PWRclhrZZbrvSRu2zAcNM7YoZocNbsepIllX2wp1xbPvnJSIBSlHSMPk3OPZcmV8yktM
 7sWVgUDTt+WeMlM/t7csIhPTMJabTmfIvdbn5nGLWQRZ8C55qzyiHDUjHzdNPIWKntVt
 jX2Q==
X-Gm-Message-State: AOAM532f8k/+iccZud0sCKgrsYqgQFOwIsFxlUVsIA2nMPjnPApX40uT
 dSpHCpl9vzZj875aWnDWiF+4Qwwd/qztaQ==
X-Google-Smtp-Source: ABdhPJzvPrV+/W3q8pmf9RsHRKBcuN5/TUbBqeJhRDQURx0sqpRNDO/bjUaAafeiCcwPJkKA6CCYOg==
X-Received: by 2002:a17:902:848c:b029:12c:daf3:94f1 with SMTP id
 c12-20020a170902848cb029012cdaf394f1mr13232789plo.50.1629120079334; 
 Mon, 16 Aug 2021 06:21:19 -0700 (PDT)
Received: from diego-VirtualBox.fibertel.com.ar
 (host199.190-139-51.telecom.net.ar. [190.139.51.199])
 by smtp.googlemail.com with ESMTPSA id y64sm13697736pgy.32.2021.08.16.06.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 06:21:18 -0700 (PDT)
From: Diego Ismirlian <dismirlian@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Diego Ismirlian <dismirlian@gmail.com>
Subject: [PATCH] Add ubiscan utility
Date: Mon, 16 Aug 2021 10:21:14 -0300
Message-Id: <20210816132114.13028-1-dismirlian@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_062122_040455_A7719898 
X-CRM114-Status: GOOD (  25.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ubiscan will scan the PEBs in a specific MTD device and print a summary of
the PEB erase counters and (optionally) details about each PEB's status.

Example output:

# ./ubiscan /dev/mtd6
Summary
=========================================================
mtd    : 6
type   : nand
size   : 110362624 bytes (105.2 MiB)
PEBs   : 842
min I/O: 2048 bytes

PEB erase counters
=========================================================
valid    : 834
empty    : 0
corrupted: 0
alien    : 0
bad      : 8

Histogram
=========================================================
from              to     count      min      avg      max
---------------------------------------------------------
0        ..        9:       55        1        4        9
10       ..       99:      174       10       48       99
100      ..      999:      514      103      287      987
1000     ..     9999:       91     1004     1880     2251
10000    ..    99999:        0        0        0        0
100000   ..      inf:        0        0        0        0
---------------------------------------------------------
Total               :      834        1      392     2251


If the --verbose switch is given, ubiscan will print PEB details:

# ./ubiscan --verbose /dev/mtd6

[... same output as before ...]

Details
=========================================================
PEB        0: 253
PEB        1: 1489
PEB        2: 1
PEB        3: 1
PEB        4: 1
PEB        5: 1
PEB        6: 1
PEB        7: 1
PEB        8: 1
PEB        9: 1
PEB       10: 1
...
PEB      832: 1225
PEB      833: 252
PEB      834: 111
PEB      835: 298
PEB      836: 1264
PEB      837: 11
PEB      838: EB_BAD
PEB      839: EB_BAD
PEB      840: EB_BAD
PEB      841: EB_BAD


Signed-off-by: Diego Ismirlian <dismirlian@gmail.com>
---
 ubi-utils/Makemodule.am |   5 +-
 ubi-utils/ubiscan.c     | 318 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 ubi-utils/ubiscan.c

diff --git a/ubi-utils/Makemodule.am b/ubi-utils/Makemodule.am
index 7491a8a..7183ec3 100644
--- a/ubi-utils/Makemodule.am
+++ b/ubi-utils/Makemodule.am
@@ -25,6 +25,9 @@ ubinize_LDADD = libubi.a libubigen.a libmtd.a libiniparser.a
 ubiformat_SOURCES = ubi-utils/ubiformat.c include/mtd_swab.h
 ubiformat_LDADD = libubi.a libubigen.a libmtd.a libscan.a
 
+ubiscan_SOURCES = ubi-utils/ubiscan.c include/mtd_swab.h
+ubiscan_LDADD = libubi.a libubigen.a libscan.a libmtd.a
+
 ubirename_SOURCES = ubi-utils/ubirename.c
 ubirename_LDADD = libmtd.a libubi.a
 
@@ -44,7 +47,7 @@ endif
 
 sbin_PROGRAMS += \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock ubiscan
 
 if WITH_GETRANDOM
 sbin_PROGRAMS += ubihealthd
diff --git a/ubi-utils/ubiscan.c b/ubi-utils/ubiscan.c
new file mode 100644
index 0000000..e040bab
--- /dev/null
+++ b/ubi-utils/ubiscan.c
@@ -0,0 +1,318 @@
+/*
+ * Copyright (C) 2021 Diego Ismirlian
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
+ */
+
+/*
+ * An utility to scan MTD devices.
+ *
+ * Author: Diego Ismirlian dismirlian (at) google's mail
+ */
+
+#define PROGRAM_NAME    "ubiscan"
+
+#include <sys/stat.h>
+#include <unistd.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <getopt.h>
+#include <fcntl.h>
+#include <limits.h>
+
+#include <mtd/ubi-media.h>
+#include <libubi.h>
+#include <libmtd.h>
+#include <libscan.h>
+#include "common.h"
+
+#define MAX_BINS 50
+
+/* The variables below are set by command line arguments */
+struct args {
+    int verbose;
+    const char *node;
+    int node_fd;
+    int bin_thresholds[MAX_BINS - 1];
+    int nbins;
+};
+
+static struct args args = {
+    .verbose = 0,
+    .nbins = 6,
+    .bin_thresholds = {
+        10,
+        100,
+        1000,
+        10000,
+        100000,
+    },
+};
+
+static const char doc[] = PROGRAM_NAME " version " VERSION
+        " - a tool to scan MTD devices";
+
+static const char optionsstr[] =
+"-h, -?, --help               print help message\n"
+"-H, --histrogram=<list>      comma-separated list of bin thresholds\n"
+"-v, --verbose                be verbose\n"
+"-V, --version                print program version\n";
+
+static const char usage[] =
+"Usage: " PROGRAM_NAME " <MTD device node file name> "
+"\t\t\t[--help] [--version] [--verbose] [--histogram=<list>]";
+
+static const struct option long_options[] = {
+    { .name = "help",            .has_arg = 0, .flag = NULL, .val = 'h' },
+    { .name = "histogram",       .has_arg = 1, .flag = NULL, .val = 'H' },
+    { .name = "verbose",         .has_arg = 0, .flag = NULL, .val = 'v' },
+    { .name = "version",         .has_arg = 0, .flag = NULL, .val = 'V' },
+    { NULL, 0, NULL, 0},
+};
+
+static int parse_opt(int argc, char * const argv[])
+{
+    int last_bin = 0;
+    while (1) {
+        int key;
+
+        key = getopt_long(argc, argv, "h?VvH:", long_options, NULL);
+        if (key == -1)
+            break;
+
+        switch (key) {
+        case 'v':
+            args.verbose = 1;
+            break;
+        case 'H': {
+            args.nbins = 1;
+            char *token = strtok(optarg, ",");
+            while (token) {
+                if (args.nbins == MAX_BINS)
+                    return errmsg("too many bins");
+                int th = atoi(token);
+                if (th <= last_bin)
+                    return errmsg("bad bin threshold list");
+                args.bin_thresholds[args.nbins - 1] = th;
+                last_bin = th;
+                args.nbins++;
+                token = strtok(NULL, ",");
+            }
+        }   break;
+        case 'V':
+            common_print_version();
+            exit(EXIT_SUCCESS);
+        case 'h':
+            printf("%s\n\n", doc);
+            printf("%s\n\n", usage);
+            printf("%s\n", optionsstr);
+            exit(EXIT_SUCCESS);
+        case '?':
+            printf("%s\n\n", doc);
+            printf("%s\n\n", usage);
+            printf("%s\n", optionsstr);
+            return -1;
+
+        case ':':
+            return errmsg("parameter is missing");
+
+        default:
+            fprintf(stderr, "Use -h for help\n");
+            return -1;
+        }
+    }
+
+    if (optind == argc)
+        return errmsg("MTD device name was not specified (use -h for help)");
+    else if (optind != argc - 1)
+        return errmsg("more then one MTD device specified (use -h for help)");
+
+    args.node = argv[optind];
+    return 0;
+}
+
+int main(int argc, char * const argv[])
+{
+    int err;
+    libmtd_t libmtd;
+    struct mtd_info mtd_info;
+    struct mtd_dev_info mtd;
+    struct ubi_scan_info *si;
+    int max, min;
+
+    struct {
+        int min;
+        int max;
+        int cnt;
+        uint64_t mean;
+    } bins[MAX_BINS];
+
+    err = parse_opt(argc, argv);
+    if (err)
+        return -1;
+
+    libmtd = libmtd_open();
+    if (!libmtd)
+        return errmsg("MTD subsystem is not present");
+
+    err = mtd_get_info(libmtd, &mtd_info);
+    if (err) {
+        sys_errmsg("cannot get MTD information");
+        goto out_close_mtd;
+    }
+
+    err = mtd_get_dev_info(libmtd, args.node, &mtd);
+    if (err) {
+        sys_errmsg("cannot get information about \"%s\"", args.node);
+        goto out_close_mtd;
+    }
+
+    args.node_fd = open(args.node, O_RDONLY);
+    if (args.node_fd == -1) {
+        sys_errmsg("cannot open \"%s\"", args.node);
+        goto out_close_mtd;
+    }
+
+    printf("Summary\n");
+    printf("=========================================================\n");
+    printf("mtd    : %d\n", mtd.mtd_num);
+    printf("type   : %s\n", mtd.type_str);
+    printf("size   : ");
+    util_print_bytes(mtd.size, 1);
+    printf("\n");
+    printf("PEBs   : %d\n", mtd.eb_cnt);
+    printf("min I/O: %d bytes\n", mtd.min_io_size);
+
+    printf("\n");
+    printf("PEB erase counters\n");
+    printf("=========================================================\n");
+    err = ubi_scan(&mtd, args.node_fd, &si, 0);
+    if (err) {
+        errmsg("failed to scan mtd%d (%s)", mtd.mtd_num, args.node);
+        goto out_close;
+    }
+
+    memset(bins, 0, sizeof(bins));
+
+    for (int j = 0; j < args.nbins; j++)
+        bins[j].min = INT_MAX;
+
+    min = INT_MAX;
+    max = 0;
+
+    for (int eb = 0; eb < mtd.eb_cnt; eb++) {
+        uint32_t ec = si->ec[eb];
+        switch (ec) {
+        case EB_EMPTY:
+        case EB_CORRUPTED:
+        case EB_ALIEN:
+        case EB_BAD:
+        case EC_MAX:
+            break;
+        default: {
+            int bin = 0;
+
+            if (ec > max)
+                max = ec;
+            if (ec < min)
+                min = ec;
+
+            for (int j = 0; j < args.nbins - 1 && ec >= args.bin_thresholds[j]; j++, bin++);
+
+            bins[bin].cnt++;
+            bins[bin].mean += ec;
+            if (ec < bins[bin].min)
+                bins[bin].min = ec;
+            if (ec > bins[bin].max)
+                bins[bin].max = ec;
+
+            } break;
+        }
+    }
+
+    printf("valid    : %d\n", si->ok_cnt);
+    printf("empty    : %d\n", si->empty_cnt);
+    printf("corrupted: %d\n", si->corrupted_cnt);
+    printf("alien    : %d\n", si->alien_cnt);
+    printf("bad      : %d\n", si->bad_cnt);
+
+    if (si->ok_cnt == 0)
+        min = 0;
+
+    printf("\n");
+    printf("Histogram\n");
+    printf("=========================================================\n");
+    printf("from              to     count      min      avg      max\n");
+    printf("---------------------------------------------------------\n");
+    for (int j = 0; j < args.nbins; j++) {
+        if (bins[j].cnt)
+            bins[j].mean /= bins[j].cnt;
+        else
+            bins[j].min = 0;
+
+        int from = (j == 0) ? 0 : args.bin_thresholds[j - 1];
+        if (j == args.nbins - 1)
+            printf("%-8d ..      inf: %8d %8d %8llu %8d\n",
+                from, bins[j].cnt, bins[j].min, bins[j].mean, bins[j].max);
+        else
+            printf("%-8d .. %8d: %8d %8d %8llu %8d\n",
+                from, args.bin_thresholds[j] - 1,
+                bins[j].cnt, bins[j].min, bins[j].mean, bins[j].max);
+    }
+    printf("---------------------------------------------------------\n");
+    printf("Total               : %8d %8d %8llu %8d\n", si->ok_cnt, min, si->mean_ec, max);
+
+    if (args.verbose) {
+        printf("\n");
+        printf("Details\n");
+        printf("=========================================================\n");
+        for (int eb = 0; eb < mtd.eb_cnt; eb++) {
+            printf("PEB %8d: ", eb);
+            uint32_t ec = si->ec[eb];
+            switch (ec) {
+            case EB_EMPTY:
+                printf("EB_EMPTY\n");
+                break;
+            case EB_CORRUPTED:
+                printf("EB_CORRUPTED\n");
+                break;
+            case EB_ALIEN:
+                printf("EB_ALIEN\n");
+                break;
+            case EB_BAD:
+                printf("EB_BAD\n");
+                break;
+            case EC_MAX:
+                printf("EC_MAX\n");
+                break;
+            default:
+                printf("%u\n", ec);
+                break;
+            }
+        }
+    }
+
+    ubi_scan_free(si);
+    close(args.node_fd);
+    libmtd_close(libmtd);
+    return 0;
+
+out_close:
+    close(args.node_fd);
+out_close_mtd:
+    libmtd_close(libmtd);
+    return -1;
+}
+
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
