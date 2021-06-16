Return-Path: <SRS0=4SWJ=LK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9141EC48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5559A61359
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Jun 2021 16:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5559A61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JZkktmrod4mJCP+WgMTEtcPC/lLstZ0n1LkQyQVkgM=; b=Jut/alMXNDK/VF
	IR0ry/G1RYcnTbQEWYI1+n8pp8wqIak6SN1VE4g7wAXes0m3k4UwC60plK86vE35UXEGfY9/XRkou
	pToVy3E/DRAAlPClLrVYvRGDo6JTkOkleDWjARXKFEx+yFfFC3ZT7YZS2Ki3Kib48al1W8MdlEFlf
	PfK9vI4NdNhAd+iNu9D3YJJQI2XlFv0iE7V/Gtb0Kv1zgLqRiWFVbtq3ZKTAAknSCfS9ip1eSsmBM
	4eRjfL74fHY51ukebfC/wz0K2g7rLie2CsiN1+B0s16ChZu0SO2EASaT05hL97rkRNJ2+TOXs/FZA
	3k5DSgJxTsc/YXiO66Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltYbP-007C2R-UL; Wed, 16 Jun 2021 16:41:20 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltYav-007Btr-Fd
 for linux-mtd@lists.infradead.org; Wed, 16 Jun 2021 16:40:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t17so2450807pga.5
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jun 2021 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZbeP6cm14CZUAAE88Br6wxap9iGbpSZd/EkXccR0A3U=;
 b=bnktMkJeEMXaq2naBXQHHiPU9Nqu8YkQpUHyvp9e4ZqX1uHSnZ//7SWNXqUK8RVZlo
 MKblS1DawG8i0m4NFZwI88IgtFu737O+iLXY/3rBDEdGotZ20KiE6ydO7YdIYhh5OLaK
 GxQd2fJKgIpqWyi2tKPWBnNYkZlfjadHowhEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZbeP6cm14CZUAAE88Br6wxap9iGbpSZd/EkXccR0A3U=;
 b=l8cw0RFsvh47mKmeiWbjzDFW77AuqOdQA7HfPOf69Ec5N1LZlPlw/xvklvJAPM0/Ms
 ITGJ3zagxlD+rB6BU1k9MtSmN7ztoBsPjto0+/CwpKCTs0cSYN0EqF56ujgyvPETLtbD
 ilmJ8Qe86DFT/3N+4LJ8feuw4WdYnpIgMG6D0dHYp0jI0+9yVXWOrPnUqSI0WyHVR91F
 OBeqGxbcAOxu/VdK7sj8rT71f42z7taX3XOufq1qE0eWqUiY//rcNYOrTcwsYF5laBto
 +Cm6juqMCY+WSp0JVi3DoBj1ZCboRVw6b/vb7wqDASNRodWHTB2YUnqieRR4w8nmxYE4
 PUqA==
X-Gm-Message-State: AOAM533WySWbQgK9nszJDWTLwt6kg8ySrCaJ/yppAjwR9Tz1mVXyQssQ
 JDMe4Hq36ctBNlD1+lyi5+ZOWw==
X-Google-Smtp-Source: ABdhPJyoO9kfQlkov8l5Uxc1pFtGZKisJjo0wbmfUm+U2ZAPtFP25C9NSbVOCG4UMmZIEZmP/R5SqQ==
X-Received: by 2002:a62:e102:0:b029:2e9:fc9f:1199 with SMTP id
 q2-20020a62e1020000b02902e9fc9f1199mr574719pfh.33.1623861647624; 
 Wed, 16 Jun 2021 09:40:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u23sm3285017pgk.38.2021.06.16.09.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:40:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
 Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>,
 Tony Luck <tony.luck@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 2/5] pstore/blk: Move verify_size() macro out of function
Date: Wed, 16 Jun 2021 09:40:40 -0700
Message-Id: <20210616164043.1221861-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616164043.1221861-1-keescook@chromium.org>
References: <20210616164043.1221861-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=2653a11ba7eb96c6cd268cbd6402b18f7e12a7e7;
 i=tdzQEUdv9hbSbxK6tngoJDCwzHdNjm/mAUD5mY/vv0A=;
 m=nTfn6wzbaP76t31hQfkeekCpmWlwPPU/REYfq9FPMqk=;
 p=Fkn949fV8jhBHEnW9OWz/kDi3+x9elYT1NBMFnskfo8=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDKKYkACgkQiXL039xtwCaNfQ//boE
 CcbVOKKdTErDuY+Q1oZgZCVMTLGpgfxWvFwMHLm8JG62YgnCM4UcRTaSri2g5rdP5aDylHS8Drftp
 gEelBGBUllciu6qRaKpKqwmCb+UB8HXEilK/hYzvt6u1GbezR6wzymXXYqT7+1ZODwfVPllpATV4I
 aIHs7Vf/pujpeOeBC386D+i3AOhJtIBmaschpq1MKNZn86MhA3+yqTL4g0RVC8+Ckm2yKeYNz5veV
 M9L/Z4OngJDUmmoyPY7SeeqgyPy1meyfPKnoSuzYphJcZEiFwGeVxl6nV6EaaqEaf3y3An8PILvQ3
 R34qDfPazTH+AZFr+xPumv5JwIn9rUyDzAToJMCS5Ypk+xuaZ2loAQheXgMHbjw6eWDVdZN1usoB3
 2NvJ9iahs+UGZLZE0jLaOv24fm8/MQMtp7qQTA7KrOcLnJECuQhBYyepQAy4Ov/ajbLPVXSI8pxZd
 G6qyB/dUYs07g22BU/as0XBt3iV1L5t9tM8fERcEzRo+WXu6J7yRWXyj56Dbxxq+pW1sUuVRZnR22
 kIUQUTvmyQLFWoy/mbQFNysVTnf8kaBLIPwiJpKYG3KeJ5qgEh07sBvoCYAzmVK2tntraw0xGxc16
 geVilcpUOr4MyH8UpGhSqsRZj3BOsEJWJSZ6jKAlU8MPEQOgtP9l9+KTIIaIg6as=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_094049_569004_FE457A7A 
X-CRM114-Status: GOOD (  15.35  )
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

There's no good reason for the verify_size macro to live inside the
function. Move it up with the check_size() macro and fix indenting.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index eca83820fb5d..7d8e5a1ddd5b 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -108,6 +108,17 @@ struct bdev_info {
 	_##name_;						\
 })
 
+#define verify_size(name, alignsize, enabled) {			\
+	long _##name_;						\
+	if (enabled)						\
+		_##name_ = check_size(name, alignsize);		\
+	else							\
+		_##name_ = 0;					\
+	/* Synchronize module parameters with resuls. */	\
+	name = _##name_ / 1024;					\
+	pstore_zone_info->name = _##name_;			\
+}
+
 static int __register_pstore_device(struct pstore_device_info *dev)
 {
 	int ret;
@@ -143,21 +154,10 @@ static int __register_pstore_device(struct pstore_device_info *dev)
 	if (!dev->flags)
 		dev->flags = UINT_MAX;
 
-#define verify_size(name, alignsize, enabled) {				\
-		long _##name_;						\
-		if (enabled)						\
-			_##name_ = check_size(name, alignsize);		\
-		else							\
-			_##name_ = 0;					\
-		name = _##name_ / 1024;					\
-		pstore_zone_info->name = _##name_;			\
-	}
-
 	verify_size(kmsg_size, 4096, dev->flags & PSTORE_FLAGS_DMESG);
 	verify_size(pmsg_size, 4096, dev->flags & PSTORE_FLAGS_PMSG);
 	verify_size(console_size, 4096, dev->flags & PSTORE_FLAGS_CONSOLE);
 	verify_size(ftrace_size, 4096, dev->flags & PSTORE_FLAGS_FTRACE);
-#undef verify_size
 
 	pstore_zone_info->total_size = dev->total_size;
 	pstore_zone_info->max_reason = max_reason;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
