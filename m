Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EE6C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 15:01:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAD16521D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 15:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CAD16521D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2mTpRYh2a9me6NUSr/7cRHE4RQVtAfTWP1uSEVvpYRY=; b=nxtq/g9P1voegK2U1buRnltyE
	ceUVZlaT4ogm5c0qGO/WepEaxvLh0CuUAxvil5hz5Z+HrJ39qVd+9UCxe1WEgRmz295je1AR7WGJL
	m1FYxyS0eCe7SNfpFTeGeTX7USTYELNRE48L1hXvDmjOhHwxFV+pjchrZT3L5fMpmowAZ+vwDjMqB
	btXh3O9QJvDTri+ZY/eE/GYN0DMuDzd0vrt2mgTKMjoR6QVl4G9VQhO3QounM2fvvBKUv/oaE4zr2
	T48XNjv+WIjfoJH4Xq/nJhciJmOkfiDryGinRwUiiiFsDX+lln+WC4JTi9gu20wMYCPNV3qOJyTu7
	GGC7fo3ng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJHNB-000Okc-PE; Mon, 08 Mar 2021 15:00:41 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJHN4-000Ohr-3x
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 15:00:36 +0000
Received: by mail-ej1-x636.google.com with SMTP id p8so20956417ejb.10
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VBV23lr09CUJD6sRdr392J5f1NhLIA2gkIbk4UNm5BQ=;
 b=Ug8zQ4Mf36Y1JnLQ3tteJ2lhEQVFei5ha60BwxAPk2EfUyHV5FshfOHNnSfO76s0zq
 n4biQLXPfO4DY6Do+GuPZwyi8lo/PMdMf4NYJNmlEr4MEk9jbvEXjk0U9RmAgfULhvvy
 1I9vCB7Urf5FnWTGFiWlyyHNuIRzT4CLj/IUZv/XDmcRKqQ4vA7svj0b+7zje7YE4hvA
 22xu09PRGqualfIyk1gruApVGvEJ2qX2Fe63TnW3BiKWNbd8EPPjI8qsWUkZOLwg6V03
 3GsWQIwmsEf5c1hOCZE0vcQuAOKVyTzbAI60CupWfFzg/EEYEp2CtBrPa98yiTe67LZJ
 MuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VBV23lr09CUJD6sRdr392J5f1NhLIA2gkIbk4UNm5BQ=;
 b=ArG5IWyzX1CM2wjvJ8O0HytkfPS0LLKEMeIzL2c+kF08AtldAxL/VgpEtiAsmFN6D2
 7AvY7Xpzg8XSCPglB1ZYsArObmBCYS2DTTkLfzP7hbNO/IXTHAip61V50JIDrtWFYzgT
 yCnP+sicKpSzNseoemxmiBLj00bafJLnJQDUUb9gSk7XTniOqjVevkmHbk4iaKEsJLi8
 tztKpvIqOHJ01oAvcYcUbr3+BylZEBzbQKufIo67oI7b1R+4XfVy4/AMq9bJ4S39Afsn
 adwy3h+SVraM0Np/+ENdeEFV12DCO/h/YuIVF9qVU+RmVcqO5pzcllojnf1AkScXqhkK
 u/8A==
X-Gm-Message-State: AOAM530OVQc3oRD3f0/N0Z24yc5H6COXgGkwK1me6/9e2b5SJof1TaN8
 NuuzAsq3FsEyO/UOmnGm6LgY+ciIf3UCaw==
X-Google-Smtp-Source: ABdhPJx2GkSj3IxcoTf3dx1c5ZMlKBzYZFFb3JYTSYY8YiUn3pcjoyKEqcuXGuwBcoAlssj0W6ICTQ==
X-Received: by 2002:a17:906:c45a:: with SMTP id
 ck26mr15193619ejb.125.1615215626949; 
 Mon, 08 Mar 2021 07:00:26 -0800 (PST)
Received: from seven.fritz.box
 (p200300d37f017f0052c48f3822e3043d.dip0.t-ipconnect.de.
 [2003:d3:7f01:7f00:52c4:8f38:22e3:43d])
 by smtp.gmail.com with ESMTPSA id i10sm6651415ejv.106.2021.03.08.07.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 07:00:26 -0800 (PST)
From: Henri Roosen <henriroosen@gmail.com>
X-Google-Original-From: Henri Roosen <henri.roosen@ginzinger.com>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at,
	Henri Roosen <henri.roosen@ginzinger.com>
Subject: [PATCH v2] mkfs.ubifs: Fix runtime assertions when running without
 crypto
Date: Mon,  8 Mar 2021 15:57:10 +0100
Message-Id: <20210308145710.6203-1-henri.roosen@ginzinger.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <358533793.61694.1615208954869.JavaMail.zimbra@nod.at>
References: <358533793.61694.1615208954869.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_150034_869076_521C50BA 
X-CRM114-Status: GOOD (  13.07  )
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

Running mkfs.ubifs which was build without crypto triggered the
following assertion:

mkfs.ubifs: ubifs-utils/mkfs.ubifs/fscrypt.h:166:
inherit_fscrypt_context: Assertion `0' failed.

A previous commit-cc4c5e295f54 ("mkfs.ubifs: Enable support for building
without crypto") added a check for an existing fscrypt context before calling
functions inherit_fscrypt_context() and free_fscrypt_context(),
however did not properly do this for each call to these functions.

Fixes: cc4c5e295f54 ("mkfs.ubifs: Enable support for building without crypto")
Signed-off-by: Henri Roosen <henri.roosen@ginzinger.com>
---
Changes since v1:
 - instead of patching every call site, allow inline functions
   inherit_fscrypt_context() and free_fscrypt_context() to be called with NULL
   fscrypt context.

 ubifs-utils/mkfs.ubifs/fscrypt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubifs-utils/mkfs.ubifs/fscrypt.h b/ubifs-utils/mkfs.ubifs/fscrypt.h
index 34b799c..ff3d326 100644
--- a/ubifs-utils/mkfs.ubifs/fscrypt.h
+++ b/ubifs-utils/mkfs.ubifs/fscrypt.h
@@ -131,7 +131,7 @@ static inline void free_fscrypt_context(struct fscrypt_context *fctx)
 {
 	(void)fctx;
 
-	assert(0);
+	assert(!fctx);
 }
 
 static inline int encrypt_path(void **outbuf, void *data, unsigned int data_len,
@@ -163,7 +163,7 @@ static inline struct fscrypt_context *inherit_fscrypt_context(struct fscrypt_con
 {
 	(void)fctx;
 
-	assert(0);
+	assert(!fctx);
 	return NULL;
 }
 #endif /* WITH_CRYPTO */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
