Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241E3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Apr 2022 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9y5gpym0v74D4GmylOAidHmsH7IX6BeRFSyWI3DSDz8=; b=oniO/d9yLamdlmt09+/K0H0uIb
	1P7lpfaoqaMkQbjQpB9QzhseX/h60ILpp7wpxenSLk6FnVKrL8SAZFmcil1xKTPNeQ3M2r6XvdLv9
	CGM9cWaBZWqRgjj0FVO20u7d54hNU5ymEN3UCV/7frxvV6HE9Lv7/IKwQkcRCgyEg+tLDLVFCGqBp
	Iurbu1/DSLcwq4hPWeXcxjxz9prWIrwCPDpPsYcK2hVz4uctQPdjhAW3ASsKqOcDHzh9OB2nGJDVK
	RIwKEFVDXT97lX/paubARBbPJ60t2vyA+fxYHm1tFRGZc1CiWIYd+3UPF/mCMemwAV7TUy6gxE8aM
	0A2urmCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj1HW-00AG2y-AD; Mon, 25 Apr 2022 16:09:46 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj1HQ-00AFza-93
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2022 16:09:43 +0000
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2f7c011e3e9so60015377b3.23
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2022 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=q8a8wJvEklAmCtCpSgW2FIcat+OGKagtU2H8hFgsok4=;
 b=La2lXw+CyTzmORqrvTtza6E1VmcDhBtZSejdp92C/j6nD1VzVby+OOi9gtDlyazQiq
 o+q7tinZHsfN+YfYPjeA0tfcepEpmXSDauc46eZyT+nZTh+kTgzyShblLGYKPNv8jofB
 KkG9nyuHtIbEyLZwe13V8j63/eXJE1wqviEBwxau4ZtGI1b+P0ci9a1cyZTJZXeJ9Cz6
 XRolYviQLodpgkF6SJrjzpPTHkT//T6cq4RFBWdCzSHj94feeI8BGETpYBgMh8P/T3M8
 rhp5X7/tV4cWACImM/yc90HCjkAzGPoVt2tAp/F11BETzg5AhDhkm5mj5JFXme/FqWHz
 60tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=q8a8wJvEklAmCtCpSgW2FIcat+OGKagtU2H8hFgsok4=;
 b=RVVys74+QBhWTizJfEBFJywThyxVG7oC647v8qmOoiHzllhsjD7vVI9Oew9ag3GaG6
 dUXg+2IjssYAOehEuaCr8OZuXupZrYDnvdCqUlxZgoVtWYnR3hCqDePqwE644T6hT/5e
 89OmlmdqlK5K3zdIkx4Gr9uBo6t61gRghByhAt/N1xo2MF8eV/pLORWxOcwDjrH92TF3
 tQTor7jTCK2y+4kJwdpFkfOxHog7segnNG9HRo5YjxgvwSLKRTXrGC/i/vp5BRfKtSLD
 0O5KKFWPrtFcLgwjd3Qiq/ySkQ+58maUBG1hVg3DG3lrNXdVHy/gGBTFjvZjdI+U5YTu
 4/FQ==
X-Gm-Message-State: AOAM531vdKMLHgilJ3FztF8zPEDng4DB5G2wfnLXA+nRAjB32rqqZ7VH
 O5TGE7onoMEE/VSIe59NAs2D9x1qMZv2
X-Google-Smtp-Source: ABdhPJxLXU6NMM3kSh38aJIH/4lbhagzTjIvjo3KT34820k38yHRBMsFEiCubfGOgQGjyBUjvHo61vYWmKGW
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:cacf:5ee9:4234:3c47])
 (user=jmeurin job=sendgmr) by 2002:a25:3445:0:b0:648:3dd2:f210 with SMTP id
 b66-20020a253445000000b006483dd2f210mr8899114yba.3.1650902975700; Mon, 25 Apr
 2022 09:09:35 -0700 (PDT)
Date: Mon, 25 Apr 2022 09:09:27 -0700
In-Reply-To: <20220415001321.252848-1-jmeurin@google.com>
Message-Id: <20220425160927.3823016-1-jmeurin@google.com>
Mime-Version: 1.0
References: <20220415001321.252848-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
Subject: [PATCH v4 3/3] mtd: mtdoops: Add a timestamp to the mtdoops header.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_090940_408512_BF1F4959 
X-CRM114-Status: GOOD (  14.23  )
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

On some systems, the oops only has relative time from boot.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 186eeb01bee1..3d4a2ffb5b01 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -16,6 +16,7 @@
 #include <linux/wait.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/timekeeping.h>
 #include <linux/mtd/mtd.h>
 #include <linux/kmsg_dump.h>
 
@@ -37,11 +38,13 @@ module_param(dump_oops, int, 0600);
 MODULE_PARM_DESC(dump_oops,
 		"set to 1 to dump oopses, 0 to only dump panics (default 1)");
 
-#define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
+#define MTDOOPS_KERNMSG_MAGIC_v1 0x5d005d00  /* Original */
+#define MTDOOPS_KERNMSG_MAGIC_v2 0x5d005e00  /* Adds the timestamp */
 
 struct mtdoops_hdr {
 	u32 seq;
 	u32 magic;
+	ktime_t timestamp;
 } __packed;
 
 static struct mtdoops_context {
@@ -191,7 +194,8 @@ static void mtdoops_write(struct mtdoops_context *cxt, int panic)
 	/* Add mtdoops header to the buffer */
 	hdr = (struct mtdoops_hdr *)cxt->oops_buf;
 	hdr->seq = cxt->nextcount;
-	hdr->magic = MTDOOPS_KERNMSG_MAGIC;
+	hdr->magic = MTDOOPS_KERNMSG_MAGIC_v2;
+	hdr->timestamp = ktime_get_real();
 
 	if (panic) {
 		ret = mtd_panic_write(mtd, cxt->nextpage * record_size,
@@ -247,7 +251,9 @@ static void find_next_position(struct mtdoops_context *cxt)
 
 		if (hdr.seq == 0xffffffff && hdr.magic == 0xffffffff)
 			mark_page_unused(cxt, page);
-		if (hdr.seq == 0xffffffff || hdr.magic != MTDOOPS_KERNMSG_MAGIC)
+		if (hdr.seq == 0xffffffff ||
+		    (hdr.magic != MTDOOPS_KERNMSG_MAGIC_v1 &&
+		     hdr.magic != MTDOOPS_KERNMSG_MAGIC_v2))
 			continue;
 		if (maxcount == 0xffffffff) {
 			maxcount = hdr.seq;
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
