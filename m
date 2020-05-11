Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE6FC54E4A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D084206CC
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpPEvsgX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TA638fRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D084206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XCB2KxSYaoh+Il+1FJOjdBk1FUkU124zsG5D4zB6OhI=; b=VpPEvsgXxODqDh
	bTkAWvj9keJTI/RPoEHr3XOYnlO/wVOx7fsb85riE4OuSHYDFQaQTOfSPhiFUvo9mTSB9OsQYjgBn
	z34NusA1m0NScf72NR12oDk+HdyJGlboyqxcJmyckIG4qSKd7yOHF0/Cd7zHpAUmB8dzKgwtmADzk
	Gzyx5s9X93+b3p18RSu6cyLrkL4HEtm6xudPdqYnmJL+TPZCHRztTTmaW1SGIjFTMPDAPnrYFCU2Y
	LuWW1BzfHNyP4HDgDyCDXotUgivNTK2SDsYT2psXaNtEuQ+Rvy/6OnvBv5ldBZ90ARgvojKnJqvdu
	se0JAytao3pTdT+rRCiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHvg-0003KT-3x; Mon, 11 May 2020 23:33:48 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHuY-0002FL-BW
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:32:40 +0000
Received: by mail-pf1-x441.google.com with SMTP id 18so5457125pfv.8
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=up5YLynN/0wgy5FnxIIi/GoPnmSYw4UconoozjrfHTM=;
 b=TA638fRTRspNQHa6ZRPlPqnJ7kHnQX8LkUTZ6e+sNVAwzBtYrrXpbl19Y4WD38udvW
 ZvZpfmGRyuj77IMbwJQ4fpjI6fcDmGKhhDeBUFmdtDeQpcmEXNSHhaQQl87/w85J/UnN
 vFFRnSGPxnDdtl4aXi1QiFFilhD7kEhPb0KVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=up5YLynN/0wgy5FnxIIi/GoPnmSYw4UconoozjrfHTM=;
 b=cmhQnTSCD7zR44yx0pc+zcV07dbXKRENjdpU7lR0ReDuNUJ3PlKeeCpOHvTyzUutEu
 YT4zGW4zoSbRDyPRhAGSDvqChlcq7JcKLnad1VwtMM0U5E+DjudXi+ZqOAX9HJKeSQbh
 DCTOCZHdhg1KhPNlI+zD0luteDFAzNS8zLDk6SZmvkKEf0q6H76SXqUqR+JllJZXgbTz
 V+4MNkp+T3RQ9pgPqFF5q5UZLQQvVb2ZVAto1SVgzYhOpPF31YeCOy0fmMNxTNDe65pl
 JDmuqwwbpCfm80+yCoaXX5KxSCKJxpGEXQT2FKwtHA4Rc0h8r/zoePNyuNuETVjN6dOI
 4/OQ==
X-Gm-Message-State: AGi0PuZ+2iVDxf8ABmGiBnfT6j93KckJmFK5sFg0T7bS351CEXc1jM2R
 nGpXaiQieiH9lRT+9UIGyCAyzw==
X-Google-Smtp-Source: APiQypJkb6jHb758mGKvTWOFgTGdpxWAvBuyyJ6rv4NbyvJBoOkYAuP18aIVkbSPEH/AsGoH+x2YGQ==
X-Received: by 2002:a63:211d:: with SMTP id h29mr16662828pgh.231.1589239957178; 
 Mon, 11 May 2020 16:32:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w1sm8895930pgh.53.2020.05.11.16.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:32:35 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v8 08/11] pstore/blk: Provide way to query pstore configuration
Date: Mon, 11 May 2020 16:32:26 -0700
Message-Id: <20200511233229.27745-9-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511233229.27745-1-keescook@chromium.org>
References: <20200511233229.27745-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_163238_410755_0E2EDC9B 
X-CRM114-Status: GOOD (  13.66  )
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

From: WeiXiong Liao <liaoweixiong@allwinnertech.com>

In order to configure itself, the MTD backend needs to be able to query
the current pstore configuration. Introduce pstore_blk_get_config() for
this purpose.

Signed-off-by: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Link: https://lore.kernel.org/r/1585126506-18635-10-git-send-email-liaoweixiong@allwinnertech.com
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c            | 37 ++++++++++++++++++++++++++++++-------
 include/linux/pstore_blk.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 7 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 8c78eb9906fb..95436cff8976 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -94,6 +94,17 @@ struct bdev_info {
 	sector_t start_sect;
 };
 
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
  * struct pstore_device_info - back-end pstore/blk driver structure.
  *
@@ -149,13 +160,11 @@ static int psblk_register_do(struct pstore_device_info *dev)
 		dev->flags = UINT_MAX;
 
 #define verify_size(name, alignsize, enabled) {				\
-		long _##name_ = (enabled) ? (name) : 0;			\
-		_##name_ = _##name_ <= 0 ? 0 : (_##name_ * 1024);	\
-		if (_##name_ & ((alignsize) - 1)) {			\
-			pr_info(#name " must align to %d\n",		\
-					(alignsize));			\
-			_##name_ = ALIGN(name, (alignsize));		\
-		}							\
+		long _##name_;						\
+		if (enabled)						\
+			_##name_ = check_size(name, alignsize);		\
+		else							\
+			_##name_ = 0;					\
 		name = _##name_ / 1024;					\
 		pstore_zone_info->name = _##name_;			\
 	}
@@ -456,6 +465,20 @@ void unregister_pstore_blk(unsigned int major)
 }
 EXPORT_SYMBOL_GPL(unregister_pstore_blk);
 
+/* get information of pstore/blk */
+int pstore_blk_get_config(struct pstore_blk_config *info)
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
+EXPORT_SYMBOL_GPL(pstore_blk_get_config);
+
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
diff --git a/include/linux/pstore_blk.h b/include/linux/pstore_blk.h
index ccba8c068752..0c40774e71e0 100644
--- a/include/linux/pstore_blk.h
+++ b/include/linux/pstore_blk.h
@@ -49,4 +49,32 @@ struct pstore_blk_info {
 int  register_pstore_blk(struct pstore_blk_info *info);
 void unregister_pstore_blk(unsigned int major);
 
+/**
+ * struct pstore_blk_config - the pstore_blk backend configuration
+ *
+ * @device:		Name of the desired block device
+ * @max_reason:		Maximum kmsg dump reason to store to block device
+ * @kmsg_size:		Total size of for kmsg dumps
+ * @pmsg_size:		Total size of the pmsg storage area
+ * @console_size:	Total size of the console storage area
+ * @ftrace_size:	Total size for ftrace logging data (for all CPUs)
+ */
+struct pstore_blk_config {
+	char device[80];
+	enum kmsg_dump_reason max_reason;
+	unsigned long kmsg_size;
+	unsigned long pmsg_size;
+	unsigned long console_size;
+	unsigned long ftrace_size;
+};
+
+/**
+ * pstore_blk_get_config - get a copy of the pstore_blk backend configuration
+ *
+ * @info:	The sturct pstore_blk_config to be filled in
+ *
+ * Failure returns negative error code, and success returns 0.
+ */
+int pstore_blk_get_config(struct pstore_blk_config *info);
+
 #endif
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
