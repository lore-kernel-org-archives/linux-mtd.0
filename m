Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7047AC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:35:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A0E206CC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sbgrepuu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j5MDUIJ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A0E206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOseoGd0Tk0bRf01XAKdzI5qUHNu83kyCWkBtY+xnyA=; b=Sbgrepuu9Bxmyy
	OLBTHLcGbv71SnjT66jXSB09xT0tiCyuiEiCGFwkdcdAVfJKnxeH/G0Dmvv3nnHqhYFgnxJkrtDWY
	64nlXMxjl7uoxFo8VEhq1d5iWpu+atskCJtChm7Opz3A7WWowUibFcxMs5DVrsskrIMRvv6mWsgCG
	Ke90FELQNu4h+pLyWD6WfS3BmJGZaNh3WQ9JMSZJ+lmZACr3Jgd0Pr6zSBCaMlN9MD4hwFrl+pBgf
	PGaGThaz2ipA97hKpFuT5ChKs5rIo9Bnlg1blcSCmVc/Bn3k8FGznijSG9xAzSV74Gjrh/QWuEswG
	4FGaKEKbto2EKGuDCSQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHx2-0005Xo-TV; Mon, 11 May 2020 23:35:13 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHuc-0002Jt-LD
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:32:44 +0000
Received: by mail-pf1-x444.google.com with SMTP id r14so5467791pfg.2
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PH+Lgq2PDxQGasQrINJJUArPMyAqt1Bu550VMx9KhTM=;
 b=j5MDUIJ57Zb1XMPHrvgMGx/+NPr8bHDEO2bG4ZiPGcMzfH94HkqBHKr8M2/V4xIYiU
 BiLuPzcO/L8cllSMOGWudertUXZcW5VpV7+5sVr9B+sNj38x8i6CpvlNyLwk9yT1+ZMJ
 hqC3QlGT30FSrfmGBpVD7dEF1ERoGLxJe7bDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PH+Lgq2PDxQGasQrINJJUArPMyAqt1Bu550VMx9KhTM=;
 b=oJzfDnSv3hc29I2OjZ8G22AuxDUJaSEQHkbGMS2CGFvwY8HfzAoB+5gWXlsQQZUGCX
 w1asKuqhMo2szBdhevRztD6+ZJijbHKB44Tb4pPNoONZMOnoTSOJj8Bstcx1XtVbC0OB
 Xh56/mK16xlG3RySYKwoRWz1UjBJQxI0arjX5KUIbi4zypdYrhxEq10gKDle+3vQEWZ2
 VZ204DklPi7EcUrAgAq+klgC/tLxwOW8U0nGD8+WXddKQ3SjjULAzKPk48bCiKWNA7Ct
 2h61BZRwCjwtEM6rhdVbRxfqLl74NuBCOFtAp4PDPtNF8fKZQI4tpZeg0bMYiUDoKbCP
 NWmg==
X-Gm-Message-State: AGi0PuZVTfYKCgrZHvuP1ySX+dYcjVUQSuN0cScbN+ZB4z0GAPC7JN2T
 upBcX7wjc8rLf/Pqz9/cTp9L+g==
X-Google-Smtp-Source: APiQypICx+ruy2OmXqybOfijHEnitIe0QnR1AxpP3stz09rJYnTQHfeE4j8jAEYs7JzXimY/e1a4bQ==
X-Received: by 2002:a63:5b1f:: with SMTP id p31mr17466913pgb.335.1589239961627; 
 Mon, 11 May 2020 16:32:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 10sm10195129pfn.204.2020.05.11.16.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:32:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v8 11/11] pstore/blk: Introduce "best_effort" mode
Date: Mon, 11 May 2020 16:32:29 -0700
Message-Id: <20200511233229.27745-12-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511233229.27745-1-keescook@chromium.org>
References: <20200511233229.27745-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_163242_827881_8C9E39B0 
X-CRM114-Status: GOOD (  13.45  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In order to use arbitrary block devices as a pstore backend, provide a
new module param named "best_effort", which will allow using any block
device, even if it has not provided a panic_write callback.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index a1bd7c1fdfa0..9000d2e9f1c5 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -51,6 +51,10 @@ static long ftrace_size = -1;
 module_param(ftrace_size, long, 0400);
 MODULE_PARM_DESC(ftrace_size, "ftrace size in kbytes");
 
+static bool best_effort;
+module_param(best_effort, bool, 0400);
+MODULE_PARM_DESC(best_effort, "use best effort to write (i.e. do not require storage driver pstore support, default: off)");
+
 /*
  * blkdev - the block device to use for pstore storage
  *
@@ -378,7 +382,8 @@ static int __register_pstore_blk(struct pstore_blk_info *info)
 	}
 
 	/* only allow driver matching the @blkdev */
-	if (!binfo.devt || MAJOR(binfo.devt) != info->major) {
+	if (!binfo.devt || (!best_effort &&
+			    MAJOR(binfo.devt) != info->major)) {
 		pr_debug("invalid major %u (expect %u)\n",
 				info->major, MAJOR(binfo.devt));
 		ret = -ENODEV;
@@ -480,6 +485,20 @@ int pstore_blk_get_config(struct pstore_blk_config *info)
 }
 EXPORT_SYMBOL_GPL(pstore_blk_get_config);
 
+static int __init pstore_blk_init(void)
+{
+	struct pstore_blk_info info = { };
+	int ret = 0;
+
+	mutex_lock(&pstore_blk_lock);
+	if (!pstore_zone_info && best_effort && blkdev[0])
+		ret = __register_pstore_blk(&info);
+	mutex_unlock(&pstore_blk_lock);
+
+	return ret;
+}
+late_initcall(pstore_blk_init);
+
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
