Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBDBFCCF9ED
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Oct 2025 20:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+Ghz6bRjnWtkRgn0G49egrDO4/HHNkC47d7W4y3FGs=; b=O5RJ4i7nogDHJm
	jDytA8vD26rFtfEIkZDFlFwYQVJAKvEoo2UAOtzua+Bs5w7oRGqLC2T39syfuKtQsi4vfdf76EwI+
	jXKjLOTwtrMk5DZJ2e/tgokFS+cMuMMwKmsReRCI95QaDjgb+iQ4ZVUvBgh/9vPQT6WItyUHmMlfb
	W7FTvDgSl04xy3qin6foeDJIffi/cH46waBPwlp5WtbvedgmqzJcAF0rsyZNdf9buSPJbgbbkR6+M
	mwg57JgMFSCnR9kFlrOnVBY64sRxLSKrnjCiHIfwXFeKUKkJy8pPog7jO85u0XwZi6tDMseGws9bq
	RBeJP3S5Z0DtoJI/FTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vR-0000000Cgpk-19xM;
	Sun, 26 Oct 2025 20:01:13 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vN-0000000CgoP-1EGa
	for linux-mtd@lists.infradead.org;
	Sun, 26 Oct 2025 20:01:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-794e300e20dso4326867b3a.1
        for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2025 13:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508868; x=1762113668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=52s8VDINomvyfwKwDzcD3zqaKhIsozSIRMIhlu7bPvM=;
        b=Td+tWi28U5FvGK/aGU1opwe3SrZ77ZnoQNLhPZd7/XsfNBT9Ei6CTTxne3gy/XqkIT
         0zuyQgEx3T5W2Ywd5mjh5Kl4VnegospHhXkS9ifEOC6zMe2wFEFGYKTulcWndiCKtWGL
         kVliUJUq3Wxs/AZsnrxAZLGKm5SoVa0KdOS2UqpAhFfxY2gUGKlzSoWTpBZANCLUdDh8
         peZRsAKDSUyjt3jKt73J7l6SU/HrxqpLcZG195AREBv5KW5J2hMKjDKRLdpISG0kpYl2
         5pgWulUz0BRy3j0F34hdOzSbB8ZxvgmlCjBxAs6rwx8/HA456hk9I+vR2xLvQjutSAlW
         BQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508868; x=1762113668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52s8VDINomvyfwKwDzcD3zqaKhIsozSIRMIhlu7bPvM=;
        b=wFd+Tvz9vlx2Njt6jkx412pE3SzaUks/uB5Xgjf0IZ4HznFhCwmdlh8COFAH1luwgc
         smFFsFwxgdFDW0qU5X6Duj+mkN5UCEAq0WJy6ACIG3CftrGFlxhxsr9WaDARa5KxQWEp
         5dyBeXFqeACQZxC3rxryNXUn65zUvSicsLSzaLz/GBd+hw4QOkw71GMssGK+3BkU7hZM
         XfA1KLdCguMhZSFEVDndcE3Bc16p8h8FOX+vDvCO6ansjBkUhouS1HFcAnxthDQCpIhj
         XS0wehieFyLX6X0Ja+1/hIhlObDgyQDredMrxi9gBUpErdy++rnrF2uzA8tpiVbgpOgL
         VTYQ==
X-Gm-Message-State: AOJu0YzgieUYg7d/hy+bKp4QA91O1K5roZgbEEbnMMBjVMP1atUfGy1P
	/AQfY9UvjlM9gC7aF3ZOmVwya+NmNscWPZ9AbzZh5helRXD687Kj2aoqqayVHw==
X-Gm-Gg: ASbGncs2eEy4OgernF1avcm9PtYZsW9rueezpnseakmJBeQfXVHBfO6QnHdkZrNuvhb
	iEiVdFwsACjZjGWPvFeuha0kuw+++w1x41pF6t0HjtIOqYpUzoH/hal9rv4EE7BjyjB0vD3bAb6
	h9F5LTcR4ODaAU3uq6hdSILxCLix8rZ/rMm6Fdf+yTxDeHM7O+1jEHL4+K6nsLQ3wTG/Rit81GV
	kqLRB0kffMaNbIgZapGY5qFhqzQfYE5PIgRTJ0WAIXm1kV+U2DxeeZ1FWuBzI3bCQnTGmJTcZz+
	asx4Khgh9qhbWgWMqfgsspQH9KNWp60bOfaL0Zd+19cOgdtdnp7ftkJuf2AfheRa4QYL1WsdcLy
	LttVTg++Tiwx6mP9tMwosUWmROtqbACFE2D+To3k5tSBW1bsuqEyem4tuMQ==
X-Google-Smtp-Source: AGHT+IGcG7vPEGNzCKNAZIWwaNZOGC4x/v4opJs8pVIyEl14riAqMHwZWS/0xD65RvZtSyrMi2dbDg==
X-Received: by 2002:a17:903:4b04:b0:271:9b0e:54ca with SMTP id d9443c01a7336-29489db2210mr113905025ad.13.1761508868260;
        Sun, 26 Oct 2025 13:01:08 -0700 (PDT)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf352esm56444675ad.17.2025.10.26.13.01.06
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:01:07 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 5/5] mtd-utils: add GNU_SOURCE define to c files
Date: Sun, 26 Oct 2025 13:00:49 -0700
Message-ID: <20251026200049.25152-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026200049.25152-1-rosenp@gmail.com>
References: <20251026200049.25152-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_130109_330783_0FABC04C 
X-CRM114-Status: GOOD (  10.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Allows removing the global GNU_SOURCE define.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 jffsX-utils/mkfs.jffs2.c | 4 ++++
 lib/libmtd.c             | 6 +++++-
 lib/libmtd_legacy.c      | 5 ++++-
 misc-utils/flash_erase.c | 6 +++++-
 misc-utils/recv_image.c  | 4 ++++
 nand-utils/nandtest.c    | 4 ++++
 6 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index da07b69..b0e649c 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -49,6 +49,10 @@
 
 #define PROGRAM_NAME "mkfs.jffs2"
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE    // needed for asprintf
+#endif
+
 #include <sys/types.h>
 #include <stdio.h>
 #include <sys/stat.h>
diff --git a/lib/libmtd.c b/lib/libmtd.c
index f588e09..0489a15 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -22,12 +22,16 @@
  * MTD library.
  */
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE    // needed for loff_t
+#endif
+
+#include <fcntl.h>
 #include <limits.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
-#include <fcntl.h>
 #include <dirent.h>
 #include <sys/types.h>
 #include <sys/stat.h>
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index e0ecf49..457f330 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -23,7 +23,10 @@
  * not possible to get sub-page size.
  */
 
-#include <limits.h>
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE    // needed for loff_t
+#endif
+
 #include <fcntl.h>
 #include <unistd.h>
 #include <stdlib.h>
diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index 36f8d57..98289f4 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -21,11 +21,15 @@
 
 #define PROGRAM_NAME "flash_erase"
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE    // needed for loff_t
+#endif
+
+#include <fcntl.h>
 #include <inttypes.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <unistd.h>
-#include <fcntl.h>
 #include <stdlib.h>
 #include <errno.h>
 #include <string.h>
diff --git a/misc-utils/recv_image.c b/misc-utils/recv_image.c
index eeaa2e2..157e240 100644
--- a/misc-utils/recv_image.c
+++ b/misc-utils/recv_image.c
@@ -4,6 +4,10 @@
 #define _BSD_SOURCE	/* struct ip_mreq */
 #define _DEFAULT_SOURCE
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE     // needed for loff_t
+#endif
+
 #include <errno.h>
 #include <stdio.h>
 #include <netdb.h>
diff --git a/nand-utils/nandtest.c b/nand-utils/nandtest.c
index cac0dde..58542e5 100644
--- a/nand-utils/nandtest.c
+++ b/nand-utils/nandtest.c
@@ -1,5 +1,9 @@
 #define PROGRAM_NAME "nandtest"
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE    // needed for loff_t
+#endif
+
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
