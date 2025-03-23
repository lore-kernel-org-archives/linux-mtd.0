Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE877C28B30
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Mar 2025 04:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ksmV/XrOGaLr9ZgKxKa3expfzeMKF025RMhXjCxgTjU=; b=C9XOhEHdnHXig2
	ip3M5v1QUJhipX8aMQIOIxnLPIHV1QBKFDSXeBqdP3oZtgAxKGMDBMSOPyRA0EJcVC1Ksg0KSryAH
	u0eVowReeXAxuRvXIcT3z0bLNu2LtCjvmN68cpwVELXRo1qG3nTPiO3gk092aHLTzWCn0m2FGaS+L
	NkwsSIQlGZ2NmlhbLQmdHQJvlGEOEtMKBfq/lV4zoFQiyd/epRv8qnquKlIAeKIwqCgH1+d8+iymF
	iWtegjwzVX+nFRCZCbzFkaJFPQkd1OCA2owEGgVhK0To1NtnjQdgRJb0AetlA3e7WkYpPQgNvuqqW
	YKCd4hKiOx1zFkrXp5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twCWr-00000000cDV-0reh;
	Sun, 23 Mar 2025 04:01:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twCWn-00000000cD9-3Eqq
	for linux-mtd@lists.infradead.org;
	Sun, 23 Mar 2025 04:01:38 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-224191d92e4so61949065ad.3
        for <linux-mtd@lists.infradead.org>; Sat, 22 Mar 2025 21:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742702496; x=1743307296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=92BPY5l3IrbMiLj95RiENKXHT1oOlMO3FGK3KnXZoa4=;
        b=YSHYw4eL/+yQTJQ8fInEs5i59SZZYkEMU329yK5FKUd0Q6xqwfEiNpGnc+2qqSE9nl
         SZ3MZxK6dgKfSUHKtB7xM39HW+wWHEHq28cd9l7WdLFtTeiMRunxybmeRBBQPk9HnH2y
         frAOyA+R4TSJEiogLxbQME9q7Ww/j3R8P5Zd9s2MQ+gdlTuYEIcBsx7fE0jv3XBFM936
         +vHzxXxbZDpIkfO0Ip5D3BncFQGUPfHEczCPOaf0RS5z15pHOvDsrnjT2uXgFZ0ELrB3
         DQ/JQbiL8NnYQy8qXC91RImXSrTe/SxjPf2A+8UN5/hhaKq3Ydcznk3Dqx6Ak2hl1bdC
         EVwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742702496; x=1743307296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92BPY5l3IrbMiLj95RiENKXHT1oOlMO3FGK3KnXZoa4=;
        b=D5/Pps2VeXLLv5Q6o2WyoRaGrxvxbN3dLTqJ7FtQbCS1t/bwXPUD33jYAS0DZpEKbJ
         rY95heHrEQmbzWRl0ZDvZEwE0H2kfzqlSJXBKPdE/ZwLdOSltcaA2sFLUUYiyiwWg/Cj
         /iIekjFYiQIuY9hZ9TKF2HJ23tlQOCXT8sRZcl19X3XIwNHBosop/6KFCoD8VXmtWQhx
         jv6lMXQ6wpByeQyYyaWgzHF09kvtBdx13j2hNG8MhMMdJGfjFnc1RsjrwMBOp6Ia50mF
         BbDZw81R/BypIpYivxAPVzhjIEKfCipzEgLvHgox2DPojHLij3OdyVzkt97inuX6scG4
         TkJA==
X-Gm-Message-State: AOJu0Yx/3NRiAVNQzWg/vTmtD50XBrxJrn/497HXoDtWjZTifvaZWDBo
	hucW8vdeS95oBHhjO1ycztj0qGqWP2LM7+z2+V/p8g5dKdOnYxsSsqzGdXsL
X-Gm-Gg: ASbGnctvUOgmhFlsC9iXWXXU1V6+H102JQ8KSuRX2c5ApnwRnaYimMnhcbr19J2XTsc
	PUy+crYY21OXXmj9qVb4Ozvgn3HCm8/x6eSsFugOdnr+vN93txrZi0X7wWGH9mbJqpx2TgTjANm
	IvzviVFTSCwto8YiaR/a46YIe9sqaXlwWPQcDXvCbK0VH2x5SS/2VQAylqnm4T+N0e2hVXtRvjz
	cFXE718wRRYCZ4XPxcBMSk4TpX360JChZ8+0+98DQ0+g17TelVNDUZ0+YrNcFacsgXscf8Tymx/
	UpcKMvTTDohdp8vGSCi8fFlZ/TU7V+s1ATUC
X-Google-Smtp-Source: AGHT+IHcpieRKe8nDZqjX3wGc77r7NDpa3Z4KiuJqqXXeWbbSPE/htuDfA7LW81VICUIFPzutFn4+A==
X-Received: by 2002:a05:6a00:1492:b0:736:5438:ccc with SMTP id d2e1a72fcca58-739059669demr10210180b3a.9.1742702496010;
        Sat, 22 Mar 2025 21:01:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fab6dfsm4921720b3a.3.2025.03.22.21.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Mar 2025 21:01:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] Improve check for GCC compiler version
Date: Sat, 22 Mar 2025 21:01:32 -0700
Message-ID: <20250323040132.2297287-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_210137_812744_54A349E8 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

When using unreleased compiler has version like
15.0.1 and that test fails because __GNUC_MINOR__ < 1
becomes true, therefore check for full version string
which is more rubust.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ubifs-utils/common/atomic.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/ubifs-utils/common/atomic.h b/ubifs-utils/common/atomic.h
index f287d43..95754b2 100644
--- a/ubifs-utils/common/atomic.h
+++ b/ubifs-utils/common/atomic.h
@@ -2,8 +2,12 @@
 #ifndef __ATOMIC_H__
 #define __ATOMIC_H__
 
+#define GCC_VERSION (__GNUC__ * 10000 \
+                     + __GNUC_MINOR__ * 100 \
+                     + __GNUC_PATCHLEVEL__)
+
 /* Check GCC version, just to be safe */
-#if !defined(__GNUC__) || (__GNUC__ < 4) || (__GNUC_MINOR__ < 1)
+#if GCC_VERSION < 40100
 # error atomic.h works only with GCC newer than version 4.1
 #endif /* GNUC >= 4.1 */
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
