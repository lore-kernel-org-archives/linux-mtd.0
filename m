Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECE3C47255
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B871217BA
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hD6gR3X1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BR2gb3g7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B871217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZcMZ1W0XZ/uo0FV8DOLs9W+IU3t85JRpmj7+eO3QPU=; b=hD6gR3X1OWuQDw
	OHmWqbJMFh6+0xReg8dklJw0ow+LKEyCJeIGLdLqpSKVJya+BFSWmjXI1QLqBYcCynHNDM8q3d9OK
	YyZdDJjXMR53kAPh2ywjb7s4yQM6nFXa+94WoAqGE4Ej4lxzFWEtYYKu9jVRaTIDwaY0DK/8nQkLc
	cUsEIT1Ym1IuWnMalvv+H91+CXaZhqlqiEb+SSMT3lD3vqV2Far62AMxJYXRwW4qZTH8B7AoeVzbA
	GtIeKZTJua6Tvi1g4gCklmXhmluXKhTamsHPaDvHzDKMgp08xDxhO3ECaEI5GbD1Cv8aFgek+R9IK
	DQb7uQbgN9mwwZZovzQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXZ7V-0002vR-LO; Sat, 09 May 2020 23:43:01 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXZ5l-0001C2-1x
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 23:41:14 +0000
Received: by mail-pj1-x1041.google.com with SMTP id a5so5948220pjh.2
 for <linux-mtd@lists.infradead.org>; Sat, 09 May 2020 16:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9b96+3F3UdF82FBwaSU5JLnw5ZdkMBQ4NVk3N1vy02U=;
 b=BR2gb3g7b7V4+4MgXIurtPzUewLXJbuzOVMhHXgSrlbbVBWKrf0yvnO7j/prwE/eJZ
 +TnY7bF8rZR990NDaKofxFlxmuslNYpk5fYEAZxGlk/C9/E6mgVghKET1lU76SFN4PkQ
 LlIp+O3fSRS4J/G+zUPYYKCd9qeI6kc7I69ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9b96+3F3UdF82FBwaSU5JLnw5ZdkMBQ4NVk3N1vy02U=;
 b=Bt1E8OwnY/04GQ4xTctCZlKRIvKoCxoVGAksl0Cm96K+s7W63+3J2XJBXl8vMzNMuC
 uCzlR0JueMGXOutsTo4MNBUeYeXVdzVGSskzb46lNKGloOhtcvLT7/yG8JwEvmQmMd/X
 pJKTXD3f27G56XdSB1mi9uqsnJ1GofzvT5P5EgScl5EbeTOwECV+6A7WAvl1JINJoj8b
 Oo7cS4q87mhrRMIR/wr/fZdDozSHh1Pk7J7qHoIN3kQdPg63+vYSQy/aePzbqhrggO/r
 GHAv0BfO7szH0x9pwcJSBrFjkIU7fgdKquIKmIJk7PhF3iML3YQCuVuqnFvKzScmm31U
 mVww==
X-Gm-Message-State: AGi0PuaaoVEKYlbH0LFvX0ABoEuXlcKRKkWDohZXfJG3MP1PSISy60a/
 uSx59DSgmDULqPVdgcxPd+n2VA==
X-Google-Smtp-Source: APiQypJgwi2ee+B4KoH7EDsxXkyzTzy+97Tc1ywbxQrfHFWHhOS1gVaYJjwR8QhZ6J3058IPDEvKSQ==
X-Received: by 2002:a17:90a:a893:: with SMTP id
 h19mr13650061pjq.138.1589067672623; 
 Sat, 09 May 2020 16:41:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b11sm4480434pgq.50.2020.05.09.16.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 16:41:10 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v6 05/18] pstore/ram: Refactor ftrace buffer merging
Date: Sat,  9 May 2020 16:40:50 -0700
Message-Id: <20200509234103.46544-6-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_164113_107488_E38E02E0 
X-CRM114-Status: GOOD (  12.21  )
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

This changes the ftrace record merging code to be agnostic of
pstore/ram, as the first step to making it available as a generic
routine for other backends to use, such as pstore/zone.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/ram.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 7f956053f4e5..672ad80646c5 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -172,8 +172,9 @@ static bool prz_ok(struct persistent_ram_zone *prz)
 			   persistent_ram_ecc_string(prz, NULL, 0));
 }
 
-static ssize_t ftrace_log_combine(struct persistent_ram_zone *dest,
-				  struct persistent_ram_zone *src)
+static
+ssize_t ftrace_log_combine(char **dest_log, size_t *dest_log_size,
+			   const char *src_log, size_t src_log_size)
 {
 	size_t dest_size, src_size, total, dest_off, src_off;
 	size_t dest_idx = 0, src_idx = 0, merged_idx = 0;
@@ -181,19 +182,19 @@ static ssize_t ftrace_log_combine(struct persistent_ram_zone *dest,
 	struct pstore_ftrace_record *drec, *srec, *mrec;
 	size_t record_size = sizeof(struct pstore_ftrace_record);
 
-	dest_off = dest->old_log_size % record_size;
-	dest_size = dest->old_log_size - dest_off;
+	dest_off = *dest_log_size % record_size;
+	dest_size = *dest_log_size - dest_off;
 
-	src_off = src->old_log_size % record_size;
-	src_size = src->old_log_size - src_off;
+	src_off = src_log_size % record_size;
+	src_size = src_log_size - src_off;
 
 	total = dest_size + src_size;
 	merged_buf = kmalloc(total, GFP_KERNEL);
 	if (!merged_buf)
 		return -ENOMEM;
 
-	drec = (struct pstore_ftrace_record *)(dest->old_log + dest_off);
-	srec = (struct pstore_ftrace_record *)(src->old_log + src_off);
+	drec = (struct pstore_ftrace_record *)(*dest_log + dest_off);
+	srec = (struct pstore_ftrace_record *)(src_log + src_off);
 	mrec = (struct pstore_ftrace_record *)(merged_buf);
 
 	while (dest_size > 0 && src_size > 0) {
@@ -217,9 +218,9 @@ static ssize_t ftrace_log_combine(struct persistent_ram_zone *dest,
 		src_size -= record_size;
 	}
 
-	kfree(dest->old_log);
-	dest->old_log = merged_buf;
-	dest->old_log_size = total;
+	kfree(*dest_log);
+	*dest_log = merged_buf;
+	*dest_log_size = total;
 
 	return 0;
 }
@@ -295,7 +296,11 @@ static ssize_t ramoops_pstore_read(struct pstore_record *record)
 				tmp_prz->corrected_bytes +=
 						prz_next->corrected_bytes;
 				tmp_prz->bad_blocks += prz_next->bad_blocks;
-				size = ftrace_log_combine(tmp_prz, prz_next);
+
+				size = ftrace_log_combine(&tmp_prz->old_log,
+						&tmp_prz->old_log_size,
+						prz_next->old_log,
+						prz_next->old_log_size);
 				if (size)
 					goto out;
 			}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
