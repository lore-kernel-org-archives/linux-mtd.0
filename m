Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2134C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 20:25:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5A764F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 20:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5A764F2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=do5FGDnr36O5zuJY4kWga7sB2qK2Yrz/nNLXaNiEBq8=; b=ebJ3uTrF+jlo+F8VapwnpX2X6
	CYSOR21u5nyA5EXAxo8T4aN615HIiJLJpShLquA099atJgg+b3g8U2qlcpX9h50dhFHG0HbbiF8if
	zKqNsniaW9FkCF8hpdlS0HO4Z+qkxDrSrrpO+Oq8a/Lh141393wfmhHsmYszAsWzRzn8JELO+r3W0
	xfwX5/RM5c7vfrGtd+iFRyP6XF6frgx/l+qpEOXzDKlNyLlw9WWYpO/HhX8s2Da9WpaPh5FC8YMWD
	4MAuroUlNGYDbDHYKG+2cY7JbkncbqokA2/88fQFYyXr23jhW3uq9WFZSdNz5hGSZHHPKVyRz1bmG
	Lr/gkJVWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFNBn-0008PA-Jy; Thu, 25 Feb 2021 20:24:47 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFNBj-0008Ny-7Q
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 20:24:45 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1614284680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PsPa8qMZnWwUb4jHsmd/hQaRjESGDEH7IccbrBhwY0=;
 b=bhbU7YwMBvimdKvYGnhePinmZs38v5Eo4N8r/KTFAuEXAzI7j8AJbtEKMmFxiiBVeLkKvi
 ao6hrO4nIVYZPGehFgSe9LhMduVdiEs6r80eavZcayaQuNZs4Heq1aJzjI4fcXaY7+9fJt
 quqeyDvDgwl3UBqnGqpdE6MpygbKYh1RJz48OlX8bPQeW3KewRZNKGr2gl5VrwHrFtVfOr
 gvg0vngGmaR4Lbr/3isDqzZygjZXgE6X/a/xu25X3He0UV3WH0425UYkmafdOx804m3g02
 kF+lrIJ9T2ndSSxc1j0TR4VsD26P/wIhpUVkgGEWA7j1lkg+6Zf8oTOT2EH+SQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1614284680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PsPa8qMZnWwUb4jHsmd/hQaRjESGDEH7IccbrBhwY0=;
 b=4U2fWzVfVlarqsfvvMAFJYgi9lBy8gSF94jFIX7ke6zS6m7vc1YI39uScih1UfkS4DlJ/j
 1b4F5xB/wXjRGKCw==
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH next v3 02/15] mtd: mtdoops: synchronize kmsg_dumper
Date: Thu, 25 Feb 2021 21:24:25 +0100
Message-Id: <20210225202438.28985-3-john.ogness@linutronix.de>
In-Reply-To: <20210225202438.28985-1-john.ogness@linutronix.de>
References: <20210225202438.28985-1-john.ogness@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_152444_187453_27934C01 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The kmsg_dumper can be called from any context and CPU, possibly
from multiple CPUs simultaneously. Since the writing of the buffer
can occur from a later scheduled work queue, the oops buffer must
be protected against simultaneous dumping.

Use an atomic bit to mark when the buffer is protected. Release the
protection in between setting the buffer and the actual writing in
order for a possible panic (immediate write) to be written during
the scheduling of a previous oops (delayed write).

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 drivers/mtd/mtdoops.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 774970bfcf85..8bbfba40a554 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -52,6 +52,7 @@ static struct mtdoops_context {
 	int nextcount;
 	unsigned long *oops_page_used;
 
+	unsigned long oops_buf_busy;
 	void *oops_buf;
 } oops_cxt;
 
@@ -180,6 +181,9 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	u32 *hdr;
 	int ret;
 
+	if (test_and_set_bit(0, &cxt->oops_buf_busy))
+		return;
+
 	/* Add mtdoops header to the buffer */
 	hdr = cxt->oops_buf;
 	hdr[0] = cxt->nextcount;
@@ -190,7 +194,7 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 				      record_size, &retlen, cxt->oops_buf);
 		if (ret == -EOPNOTSUPP) {
 			printk(KERN_ERR "mtdoops: Cannot write from panic without panic_write\n");
-			return;
+			goto out;
 		}
 	} else
 		ret = mtd_write(mtd, cxt->nextpage * record_size,
@@ -203,6 +207,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	memset(cxt->oops_buf, 0xff, record_size);
 
 	mtdoops_inc_counter(cxt);
+out:
+	clear_bit(0, &cxt->oops_buf_busy);
 }
 
 static void mtdoops_workfunc_write(struct work_struct *work)
@@ -276,8 +282,11 @@ static void mtdoops_do_dump(struct kmsg_dumper *dumper,
 	if (reason == KMSG_DUMP_OOPS && !dump_oops)
 		return;
 
+	if (test_and_set_bit(0, &cxt->oops_buf_busy))
+		return;
 	kmsg_dump_get_buffer(dumper, true, cxt->oops_buf + MTDOOPS_HEADER_SIZE,
 			     record_size - MTDOOPS_HEADER_SIZE, NULL);
+	clear_bit(0, &cxt->oops_buf_busy);
 
 	if (reason != KMSG_DUMP_OOPS) {
 		/* Panics must be written immediately */
@@ -394,6 +403,7 @@ static int __init mtdoops_init(void)
 		return -ENOMEM;
 	}
 	memset(cxt->oops_buf, 0xff, record_size);
+	cxt->oops_buf_busy = 0;
 
 	INIT_WORK(&cxt->work_erase, mtdoops_workfunc_erase);
 	INIT_WORK(&cxt->work_write, mtdoops_workfunc_write);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
