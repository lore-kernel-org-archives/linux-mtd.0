Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6BDFC54E49
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D8E206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:26:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TogZr5em";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y/sBPsqX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D8E206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAVYStSO/BMhuosF3VqRaHuix/oHeJ52HihBsAA0DF4=; b=TogZr5emIVUYF7
	iTl8ZLT92Ot/67i2k+hh4Wi6RDa1p714C9iBKV6L8YrJOro6BqLK4k9R3wHyfRn8jfUDne4Ab99HD
	e+k51c14PGOZQV32ymSiasKC0jlxAc5mckrT8VDEwKTWjqTwQQ9Wqipdbad/DYRnZpEcpHxiLo4Tl
	rQjJf9pHt+qTjsRCSQCZuyKVQsyHir2Fa1MGCpalpLXg58+Tk3iPHc2TbnYCN9rIeNNlX2DbF24nb
	UDcG6AsCE6ccn0k9W1nH3Z7IPKZnwUVWixXoL3pY1Mtvck9oK0CYNTjiixHSCDkC2bG9JOxN9OkC9
	7sAPBEze981ccYlou2bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsWz-0006Pr-LQ; Sun, 10 May 2020 20:26:37 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsVE-0002TG-HO
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:24:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id n11so3542154pgl.9
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 13:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktEJvuLjRdGObd9XB4X6c1FTgen2GQ5GeA/f/mZmo1s=;
 b=Y/sBPsqX3MXZ9SIaNFNXmIdsJ3hVH9j0QIs/ZWile2giWgHsi0SikYyILcF9vk3GX2
 ubDac1MgzJ2xuFzRSepzs0eQUPCFYIxpGN1trlcxmhG3QmQUnUEyRJVdGeFnc/kcCcS5
 giZ9wkrUJX1JeOKrlBYauH00e0HPsaTkbRGDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktEJvuLjRdGObd9XB4X6c1FTgen2GQ5GeA/f/mZmo1s=;
 b=Gzc4I4PQOfALXJvdndtdTN3IujHakGVCesx7XPFvsxCLGHSK/xuKHFY8VGXkhFP574
 tXSs8JeqXV+E71xtiyxohApRqEU9UA4cQ5PsZL8PJHJYqrP/h/mT2RFmf0BAbcQWVkJ6
 CHz1j41oL7+Z28yFT1+WSqi7ReXTIk9drxHKuERphV04I9SjOBPpwAcVeZFvokXPf3S6
 7WveKKJCwvubLdsXIh8gOUGqrbb+U9zzAMWgcryJfjVl7lfSUDvUTtEH2w8MS1HU9LKw
 9XgMfFTYbVS2dk0d3b5YYaijB/f8SRao88384Mb0IxudbG6LK6HRSBcPUEt4OuSsIojG
 /sbA==
X-Gm-Message-State: AGi0PuZTGwKGDoJvJ4Qww72IE0Rle01WUFdpgXUaHaIXRlq7ZV4xqCHc
 Lue8+svjADHEleMUhVYL40GPEA==
X-Google-Smtp-Source: APiQypLp/RqzTPiImN8RnELw3dvc46eWFYba4R0+hMF6+nxXnghgmI0h46ibCRZWsSMjsf1wcUokbg==
X-Received: by 2002:aa7:9546:: with SMTP id w6mr12944921pfq.114.1589142287716; 
 Sun, 10 May 2020 13:24:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q14sm6250746pgq.60.2020.05.10.13.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 13:24:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v7 06/18] pstore/ftrace: Provide ftrace log merging routine
Date: Sun, 10 May 2020 13:24:24 -0700
Message-Id: <20200510202436.63222-7-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_132448_597119_3FAE6F9C 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Move the ftrace log merging logic out of pstore/ram into pstore/ftrace
so other backends can use it, like pstore/zone.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/ftrace.c   | 54 +++++++++++++++++++++++++++++++++++++++++
 fs/pstore/internal.h |  9 +++++++
 fs/pstore/ram.c      | 57 +++-----------------------------------------
 3 files changed, 66 insertions(+), 54 deletions(-)

diff --git a/fs/pstore/ftrace.c b/fs/pstore/ftrace.c
index bfbfc2698070..5c0450701293 100644
--- a/fs/pstore/ftrace.c
+++ b/fs/pstore/ftrace.c
@@ -16,6 +16,7 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/cache.h>
+#include <linux/slab.h>
 #include <asm/barrier.h>
 #include "internal.h"
 
@@ -132,3 +133,56 @@ void pstore_unregister_ftrace(void)
 
 	debugfs_remove_recursive(pstore_ftrace_dir);
 }
+
+ssize_t pstore_ftrace_combine_log(char **dest_log, size_t *dest_log_size,
+				  const char *src_log, size_t src_log_size)
+{
+	size_t dest_size, src_size, total, dest_off, src_off;
+	size_t dest_idx = 0, src_idx = 0, merged_idx = 0;
+	void *merged_buf;
+	struct pstore_ftrace_record *drec, *srec, *mrec;
+	size_t record_size = sizeof(struct pstore_ftrace_record);
+
+	dest_off = *dest_log_size % record_size;
+	dest_size = *dest_log_size - dest_off;
+
+	src_off = src_log_size % record_size;
+	src_size = src_log_size - src_off;
+
+	total = dest_size + src_size;
+	merged_buf = kmalloc(total, GFP_KERNEL);
+	if (!merged_buf)
+		return -ENOMEM;
+
+	drec = (struct pstore_ftrace_record *)(*dest_log + dest_off);
+	srec = (struct pstore_ftrace_record *)(src_log + src_off);
+	mrec = (struct pstore_ftrace_record *)(merged_buf);
+
+	while (dest_size > 0 && src_size > 0) {
+		if (pstore_ftrace_read_timestamp(&drec[dest_idx]) <
+		    pstore_ftrace_read_timestamp(&srec[src_idx])) {
+			mrec[merged_idx++] = drec[dest_idx++];
+			dest_size -= record_size;
+		} else {
+			mrec[merged_idx++] = srec[src_idx++];
+			src_size -= record_size;
+		}
+	}
+
+	while (dest_size > 0) {
+		mrec[merged_idx++] = drec[dest_idx++];
+		dest_size -= record_size;
+	}
+
+	while (src_size > 0) {
+		mrec[merged_idx++] = srec[src_idx++];
+		src_size -= record_size;
+	}
+
+	kfree(*dest_log);
+	*dest_log = merged_buf;
+	*dest_log_size = total;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pstore_ftrace_combine_log);
diff --git a/fs/pstore/internal.h b/fs/pstore/internal.h
index 8efd72d93b10..7fb219042f13 100644
--- a/fs/pstore/internal.h
+++ b/fs/pstore/internal.h
@@ -12,9 +12,18 @@ extern unsigned long kmsg_bytes;
 #ifdef CONFIG_PSTORE_FTRACE
 extern void pstore_register_ftrace(void);
 extern void pstore_unregister_ftrace(void);
+ssize_t pstore_ftrace_combine_log(char **dest_log, size_t *dest_log_size,
+				  const char *src_log, size_t src_log_size);
 #else
 static inline void pstore_register_ftrace(void) {}
 static inline void pstore_unregister_ftrace(void) {}
+static inline ssize_t
+pstore_ftrace_combine_log(char **dest_log, size_t *dest_log_size,
+			  const char *src_log, size_t src_log_size)
+{
+	*dest_log_size = 0;
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_PSTORE_PMSG
diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 672ad80646c5..b7929fdc0c72 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -21,6 +21,7 @@
 #include <linux/pstore_ram.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include "internal.h"
 
 #define RAMOOPS_KERNMSG_HDR "===="
 #define MIN_MEM_SIZE 4096UL
@@ -172,59 +173,6 @@ static bool prz_ok(struct persistent_ram_zone *prz)
 			   persistent_ram_ecc_string(prz, NULL, 0));
 }
 
-static
-ssize_t ftrace_log_combine(char **dest_log, size_t *dest_log_size,
-			   const char *src_log, size_t src_log_size)
-{
-	size_t dest_size, src_size, total, dest_off, src_off;
-	size_t dest_idx = 0, src_idx = 0, merged_idx = 0;
-	void *merged_buf;
-	struct pstore_ftrace_record *drec, *srec, *mrec;
-	size_t record_size = sizeof(struct pstore_ftrace_record);
-
-	dest_off = *dest_log_size % record_size;
-	dest_size = *dest_log_size - dest_off;
-
-	src_off = src_log_size % record_size;
-	src_size = src_log_size - src_off;
-
-	total = dest_size + src_size;
-	merged_buf = kmalloc(total, GFP_KERNEL);
-	if (!merged_buf)
-		return -ENOMEM;
-
-	drec = (struct pstore_ftrace_record *)(*dest_log + dest_off);
-	srec = (struct pstore_ftrace_record *)(src_log + src_off);
-	mrec = (struct pstore_ftrace_record *)(merged_buf);
-
-	while (dest_size > 0 && src_size > 0) {
-		if (pstore_ftrace_read_timestamp(&drec[dest_idx]) <
-		    pstore_ftrace_read_timestamp(&srec[src_idx])) {
-			mrec[merged_idx++] = drec[dest_idx++];
-			dest_size -= record_size;
-		} else {
-			mrec[merged_idx++] = srec[src_idx++];
-			src_size -= record_size;
-		}
-	}
-
-	while (dest_size > 0) {
-		mrec[merged_idx++] = drec[dest_idx++];
-		dest_size -= record_size;
-	}
-
-	while (src_size > 0) {
-		mrec[merged_idx++] = srec[src_idx++];
-		src_size -= record_size;
-	}
-
-	kfree(*dest_log);
-	*dest_log = merged_buf;
-	*dest_log_size = total;
-
-	return 0;
-}
-
 static ssize_t ramoops_pstore_read(struct pstore_record *record)
 {
 	ssize_t size = 0;
@@ -297,7 +245,8 @@ static ssize_t ramoops_pstore_read(struct pstore_record *record)
 						prz_next->corrected_bytes;
 				tmp_prz->bad_blocks += prz_next->bad_blocks;
 
-				size = ftrace_log_combine(&tmp_prz->old_log,
+				size = pstore_ftrace_combine_log(
+						&tmp_prz->old_log,
 						&tmp_prz->old_log_size,
 						prz_next->old_log,
 						prz_next->old_log_size);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
