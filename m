Return-Path: <SRS0=/+zL=6W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A87ADC38A2A
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:43:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B31B20735
	for <linux-mtd@archiver.kernel.org>; Fri,  8 May 2020 06:43:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRVZ6KFl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i8ZcQCpA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B31B20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NLNCGLcbu1s6NsJok0yAtH4l+iLnPQmAqdsC8pwVY4=; b=PRVZ6KFl9Q2xJ4
	jRNaFDWg0JIBJ3mOUQVOqnXAq4yorhteQw3f/sCtNx4qhMB3nFcoToTj9CLxJNJfjexspoXSeglhw
	7G72sRx4GlH24Yz53iWPlRkMtsxV/l0tZOEYTNrWqBHbu/LyizMMLPQ1krBJGiQe7Q6AqBmUGWNIV
	+Pl15U2YzHwZBJjVDnLrbVuVXdUWRUpuUGwHZgvBS0Bsx19a6/nhUftDF1yfZVoYsuBGlJaS3F4ro
	I3Eo4n6QVn2pQEoAj3bVc5p0bcrVf3Jz4tgiS49TMV7HyYYbZWRXW6Vzl/RqGHL75uiXL3WeAziuF
	WllZ4ooazkCqw/ikjt4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWwj1-0002DQ-Rr; Fri, 08 May 2020 06:43:11 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWwgI-0008J5-Sb
 for linux-mtd@lists.infradead.org; Fri, 08 May 2020 06:40:27 +0000
Received: by mail-pg1-x543.google.com with SMTP id b8so415322pgi.11
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 23:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKID/Cl4tUQxiQJpuetvI2JFoStwB5HzL1GiVfb5+cA=;
 b=i8ZcQCpAllHeEr1aHeWq2vIRYm4Xx5t0+HHrz3Z7O3f+6+t5f9E5knP3XB7ZroAzRR
 F45r9mSaTdqojAf8TmM34xYOd17MdlRZnRVelUlCL1DDpbqNepvGzwzmDPBuPL88PVZl
 UHun6+gAU4XsV8S5FEMS1Dvb5xTg4rIdPyKbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKID/Cl4tUQxiQJpuetvI2JFoStwB5HzL1GiVfb5+cA=;
 b=NmnV1StdvEjGOAVqwNDqUEYWVmgZmbd9ornmzQo3Fip/SpvBCV8PvFR32NR9E3Xi2H
 vSnxll5Ynq/IPdEZzlZVQat51cJxOGkSBzR+q+xbZSLvxLgh3ED7BNHE7YD0uN/tQ5iE
 h6XWPphRStpbXMuurLcTtrtDFl18xtYee60RDlGY1opicw3ihF78QyIOOFPrJ6UwpqiX
 JkKPAJCzhqQI61cT5yVCZwMygsCsnkYahA5lRo6Uyl9nhiddbQgL3dc2kZEo/u1UdA2D
 j95w2RN0GrEj1YJZ7yawCEWOZEggg5SumN3U58XBKopGzSUUcCaOCe3VT+vn3Yi66J3O
 aWvA==
X-Gm-Message-State: AGi0PubtjScp0FhSkO5i9a/vW5QflYiMzWr+fPpnpOMthxM4aOkjfAl3
 FRGLTSVnG3b8jLP1m2H/omikzQ==
X-Google-Smtp-Source: APiQypLfMwSWfqyHjhWWcMDEtuWVrnUuoVlaew9c4twdZv4OpDw51QuFRDD2qG1PeuMABCCofJYkAw==
X-Received: by 2002:a63:ad08:: with SMTP id g8mr973395pgf.40.1588920021542;
 Thu, 07 May 2020 23:40:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id e11sm632749pgs.41.2020.05.07.23.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:40:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v4 10/12] pstore/blk: Provide way to query pstore configuration
Date: Thu,  7 May 2020 23:40:02 -0700
Message-Id: <20200508064004.57898-11-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200508064004.57898-1-keescook@chromium.org>
References: <20200508064004.57898-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_234022_974949_673AD8D2 
X-CRM114-Status: GOOD (  11.57  )
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
 Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
 Anton Vorontsov <anton@enomsg.org>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

In order to configure itself, the MTD backend needs to be able to query
the current pstore configuration. Introduce pstore_blk_usr_info() for
this purpose.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-10-git-send-email-liaoweixiong@allwinnertech.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c            | 37 ++++++++++++++++++++++++++++++-------
 include/linux/pstore_blk.h | 10 ++++++++++
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index e33e58afd4cb..c6d99d5dcd7f 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -86,6 +86,17 @@ static struct bdev_info {
 	sector_t start_sect;
 } g_bdev_info;
 
+#define check_size(name, alignsize) ({				\
+	long _##name_ = (name);					\
+	_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
+	if (_##name_ & ((alignsize) - 1)) {			\
+		pr_info(#name " must align to %d\n",		\
+				(alignsize));			\
+		_##name_ = ALIGN(name, (alignsize));		\
+	}							\
+	_##name_;						\
+})
+
 /**
  * struct psblk_device - back-end pstore/blk driver structure.
  *
@@ -140,13 +151,11 @@ static int psblk_register_do(struct psblk_device *dev)
 	if (!dev->flags)
 		dev->flags = UINT_MAX;
 #define verify_size(name, alignsize, enable) {				\
-		long _##name_ = (enable) ? (name) : 0;			\
-		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
-		if (_##name_ & ((alignsize) - 1)) {			\
-			pr_info(#name " must align to %d\n",		\
-					(alignsize));			\
-			_##name_ = ALIGN(name, (alignsize));		\
-		}							\
+		long _##name_;						\
+		if (enable)						\
+			_##name_ = check_size(name, alignsize);		\
+		else							\
+			_##name_ = 0;					\
 		name = _##name_ / 1024;					\
 		pstore_zone_info->name = _##name_;				\
 	}
@@ -465,6 +474,20 @@ int psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect)
 }
 EXPORT_SYMBOL_GPL(psblk_blkdev_info);
 
+/* get information of pstore/blk */
+int pstore_blk_usr_info(struct pstore_blk_info *info)
+{
+	strncpy(info->device, blkdev, 80);
+	info->max_reason = max_reason;
+	info->kmsg_size = check_size(kmsg_size, 4096);
+	info->pmsg_size = check_size(pmsg_size, 4096);
+	info->ftrace_size = check_size(ftrace_size, 4096);
+	info->console_size = check_size(console_size, 4096);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pstore_blk_usr_info);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("WeiXiong Liao <liaoweixiong@allwinnertech.com>");
 MODULE_DESCRIPTION("pstore backend for block devices");
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index 828b0763d477..dd5213044e21 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -27,4 +27,14 @@ int  psblk_register_blkdev(unsigned int major, unsigned int flags,
 void psblk_unregister_blkdev(unsigned int major);
 int  psblk_blkdev_info(dev_t *devt, sector_t *nr_sects, sector_t *start_sect);
 
+struct pstore_blk_info {
+	char device[80];
+	enum kmsg_dump_reason max_reason;
+	unsigned long kmsg_size;
+	unsigned long pmsg_size;
+	unsigned long console_size;
+	unsigned long ftrace_size;
+};
+int pstore_blk_usr_info(struct pstore_blk_info *info);
+
 #endif
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
