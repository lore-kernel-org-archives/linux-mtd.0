Return-Path: <SRS0=y1SG=VW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0BBC76190
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 20:35:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08426218EA
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jul 2019 20:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lvx8T0PK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08426218EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Jwsla8HiPiqnI1vdLOLDIRzu95Gvu0J+zxQd8ropVgQ=; b=lvx
	8T0PKAJP1ReD1/XlF1HOK/dJ4MEHnM5mZcFVHusNbT890eNqqrsSl9JPTKJKzmBEnjT23aK9LUU9K
	mTOAMA2wTNJzVPnSS+JuBaHbB9FXPDDT0i9IyffOqcU72+jqvvZNuwNtNA0J6+XQnftmOPYp+N5nu
	TjpMB3ApQjGBPfeDFSmvDhJ82O8h1GRSLAlJs1IQayrh+n7jHwg8YX8zM7qytEudvRhEJN1vME2ZK
	TF8qOHFVLRVSAoXQ2/4fAJFXy3K5B3a7/ZhGgOLOeyWho39hwmk+7FAzeteexAZP4fNSWjviJNNra
	+uCO0SCpEvnoSCWEZfnvRyfkXHyqunw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqkSL-0006wK-DL; Thu, 25 Jul 2019 20:35:17 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqkSE-0005k8-Si
 for linux-mtd@lists.infradead.org; Thu, 25 Jul 2019 20:35:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 78EEB181821E2;
 Thu, 25 Jul 2019 22:34:58 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id WWrg6vLihtml; Thu, 25 Jul 2019 22:34:55 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
 by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 3yfJVZxHbFbD; Thu, 25 Jul 2019 22:34:55 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubi-utils: Implement a ubihealthd
Date: Thu, 25 Jul 2019 22:34:42 +0200
Message-Id: <20190725203442.29795-1-richard@nod.at>
X-Mailer: git-send-email 2.16.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_133511_218164_A5DDE027 
X-CRM114-Status: GOOD (  17.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, david.oberhollenzer@sigma-star.at
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

ubihealthd is a simple daemon which scans every PEB
of an UBI device in random order.
It helps to deal with read disturb on systems which either
reboot seldom, use fastmap or read few data.

To use this daemon you need Linux >= v5.1.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 ubi-utils/Makemodule.am |   6 +-
 ubi-utils/ubihealthd.c  | 272 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 277 insertions(+), 1 deletion(-)
 create mode 100644 ubi-utils/ubihealthd.c

diff --git a/ubi-utils/Makemodule.am b/ubi-utils/Makemodule.am
index 215eac27f5a5..984e2cd79287 100644
--- a/ubi-utils/Makemodule.am
+++ b/ubi-utils/Makemodule.am
@@ -37,9 +37,13 @@ ubirsvol_LDADD = libmtd.a libubi.a
 ubiblock_SOURCES = ubi-utils/ubiblock.c
 ubiblock_LDADD = libmtd.a libubi.a
 
+ubihealthd_SOURCES = ubi-utils/ubihealthd.c
+ubihealthd_LDADD = libmtd.a libubi.a
+
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
-	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
+	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock \
+	ubihealthd
 
 UBI_MAN = \
 	ubi-utils/ubinize.8
diff --git a/ubi-utils/ubihealthd.c b/ubi-utils/ubihealthd.c
new file mode 100644
index 000000000000..3e665be455ac
--- /dev/null
+++ b/ubi-utils/ubihealthd.c
@@ -0,0 +1,272 @@
+#include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <inttypes.h>
+#include <mtd/ubi-user.h>
+#include <poll.h>
+#include <signal.h>
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <syslog.h>
+#include <sys/random.h>
+#include <sys/signalfd.h>
+#include <sys/stat.h>
+#include <sys/timerfd.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#define PROGRAM_NAME "ubihealthd"
+
+#include "libubi.h"
+#include "common.h"
+
+#ifndef UBI_IOCRPEB
+#define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, int32_t)
+#endif
+
+struct peb_state {
+	int alive;
+	int pnum;
+	int last_errno;
+};
+
+static struct peb_state **peb_state_array;
+static int peb_state_array_len;
+static int cur_pos;
+static const char *ubi_device = "/dev/ubi0";
+static int ubi_fd;
+static int interval_secs = 120;
+static int nodaemon;
+
+static const char opt_string[] = "d:i:f";
+static const struct option options[] = {
+        {
+                .name = "device",
+                .has_arg = required_argument,
+                .flag = NULL,
+                .val = 'd'
+        },
+        {
+                .name = "interval",
+                .has_arg = required_argument,
+                .flag = NULL,
+                .val = 'i'
+        },
+};
+
+static void dolog(const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	if (nodaemon)
+		vfprintf(stderr, fmt, ap);
+	else
+		vsyslog(LOG_DAEMON | LOG_WARNING, fmt, ap);
+	va_end(ap);
+}
+
+static void build_peb_list(void)
+{
+	int i, pos;
+	struct peb_state *ps;
+
+	peb_state_array = xmalloc(sizeof(ps) * peb_state_array_len);
+
+	for (i = 0; i < peb_state_array_len; i++) {
+		ps = xmalloc(sizeof(*ps));
+
+		ps->pnum = i;
+		ps->last_errno = 0;
+		ps->alive = 1;
+
+		peb_state_array[i] = ps;
+	}
+
+	/* Shuffle the list */
+	for (i = 0; i < peb_state_array_len; i++) {
+		pos = rand() % peb_state_array_len;
+
+		ps = peb_state_array[pos];
+		peb_state_array[pos] = peb_state_array[i];
+		peb_state_array[i] = ps;
+	}
+}
+
+static struct peb_state *__next_peb(void)
+{
+	struct peb_state *ps = peb_state_array[cur_pos];
+
+	cur_pos++;
+	if (cur_pos >= peb_state_array_len)
+		cur_pos = 0;
+
+	return ps;
+}
+
+static struct peb_state *next_peb(void)
+{
+	int i;
+	struct peb_state *ps;
+
+	/* Find next PEB in our list, skip bad PEBs */
+	for (i = 0; i < peb_state_array_len; i++) {
+		ps = __next_peb();
+		if (ps->alive)
+			return ps;
+	}
+
+	dolog("Fatal: All PEBs are gone?!\n");
+	exit(1);
+
+	return NULL;
+}
+
+static int process_one_peb(void)
+{
+	int rc;
+	struct peb_state *ps = next_peb();
+
+	rc = ioctl(ubi_fd, UBI_IOCRPEB, &ps->pnum);
+	if (!rc)
+		return 0;
+	else
+		rc = errno;
+
+	switch (rc) {
+	case EINVAL: {
+		dolog("Unable to check PEB %i for unknown reason!\n", ps->pnum);
+		break;
+	}
+	case ENOENT: {
+		/* UBI ignores this PEB */
+		ps->alive = 0;
+		break;
+	}
+	case EBUSY: {
+		if (ps->last_errno == rc)
+			dolog("Warning: Unable to check PEB %i\n", ps->pnum);
+		break;
+	}
+	case EAGAIN: {
+		if (ps->last_errno == rc)
+			dolog("Warning: PEB %i has bitflips, but cannot scrub!\n", ps->pnum);
+		break;
+	}
+	case EUCLEAN: {
+		/* Scrub happened */
+		break;
+	}
+	case ENOTTY: {
+		dolog("Fatal: Kernel does not support this interface. Too old kernel?\n");
+		exit(1);
+		break;
+	}
+	case ENODEV: {
+		dolog("Fatal: UBI device vanished under us.\n");
+		exit(1);
+	}
+	default:
+		dolog("Warning: Unknown return code from kernel: %i\n", rc);
+	}
+
+	ps->last_errno = rc;
+
+	return 0;
+}
+
+static int get_peb_count(void)
+{
+	libubi_t libubi = libubi_open();
+	struct ubi_dev_info dev_info;
+
+	if (!libubi) {
+		fprintf(stderr, "Unable to init libubi, is UBI present?\n");
+		exit(1);
+	}
+
+	if (ubi_get_dev_info(libubi, ubi_device, &dev_info)) {
+		fprintf(stderr, "Fatal: Could not get ubi info for %s\n", ubi_device);
+		exit(1);
+	}
+
+	libubi_close(libubi);
+
+	return dev_info.total_lebs;
+}
+
+static void init_prng(void)
+{
+	int ret, seed;
+
+	ret = getrandom(&seed, sizeof(seed), 0);
+	if (ret != sizeof(seed)) {
+		if (ret == -1)
+			fprintf(stderr, "Unable to get random seed: %m\n");
+		else
+			fprintf(stderr, "Unable to get %zi bytes random seed\n", sizeof(seed));
+
+		exit(1);
+	}
+	srand(seed);
+}
+
+int main (int argc, char *argv[])
+{
+	int c, i;
+
+	while ((c = getopt_long(argc, argv, opt_string, options, &i)) != -1) {
+		switch(c) {
+		case 'd': {
+			ubi_device = optarg;
+			break;
+		}
+		case 'i': {
+			interval_secs = atoi(optarg);
+			if (!interval_secs) {
+				fprintf(stderr, "Bad interval value! %s\n", optarg);
+				exit(1);
+			}
+			break;
+		}
+		case 'f': {
+			nodaemon = 1;
+			break;
+		}
+		case '?':
+		default:
+			fprintf(stderr, "Usage: %s [ -d UBI_DEVICE ] [-i INTERVAL_SEC ] [ -f ]\n", argv[0]);
+			exit(1);
+			break;
+		}
+	}
+
+	ubi_fd = open(ubi_device, O_RDONLY);
+	if (ubi_fd == -1) {
+		fprintf(stderr, "Fatal: Unable to open %s: %m\n", ubi_device);
+		exit(1);
+	}
+
+	init_prng();
+
+	peb_state_array_len = get_peb_count();
+	build_peb_list();
+
+	if (!nodaemon) {
+		if (daemon(0, 0) == -1) {
+			fprintf(stderr, "Unable to become a daemon: %m\n");
+			exit(1);
+		}
+	}
+
+	for (;;) {
+		process_one_peb();
+		sleep(interval_secs);
+	}
+
+	return 0;
+}
-- 
2.16.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
