Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26D1CCF9E5
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Oct 2025 20:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYWbsOF/JrJV/xeyin4U2XQeMnfSFvoZ+NMT0i2b2uE=; b=M9DSk05kxHDQ8V
	dwD6y4OXF+BOoHn8E0t/DTh9pRz0dSkTOi52cqfYzJvSHg30lagv6BOLROmZfkOCMUmqbrdwOzLqK
	ZOPNaHlPCK1dt3R5HZWoGcDHRtqCwqWAtfgQWl/6wtX6xlw0Sl+RcuoFGVbngJWIwTDIV9//GNp8z
	2+LLFdp0SY2SkujXZSgL70/RNTI8gLRiDyUghAXB6gaWrIw4XeWzoleEHcWTrrTL3V9Uf1ziM3Zld
	fWmt6m3MpmnMaYncpnJlCTnFaGcR/l5vlDQj/BVFwMGu4O1rBNhAl9gQ3izVPbHh09XSnzBiqMfz4
	BRy4WPSUsCy0V66xFcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vM-0000000Cgo6-1crW;
	Sun, 26 Oct 2025 20:01:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vJ-0000000Cgn0-2Tqy
	for linux-mtd@lists.infradead.org;
	Sun, 26 Oct 2025 20:01:06 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so57975075ad.2
        for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2025 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508864; x=1762113664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoS377A3kfiWpyc9gBmtbjpbvbq07/XQKtO+ycC4TJQ=;
        b=MG7E+YPu5BTshTzEK4Er0iTQkOkAvPscdRapuM5+iaii274/GAFG54ZNRLPk4OVVl0
         O3NoEW3pRh8D+YL+EIQHOU367VyXouDIZH5wR8AyFLFkC21KwvM9Y0svMKwfz34pFYqR
         c7/7kLR3tAbzMn4vGr/kkwjlZD/0aHKjhPezRBIx5CS2BFf62scSx7rvy6mU/5KpPguC
         GsGcDN5eLKJNfSbDKA5jP9/lUCo9fV6utYRszt6FfzKCxXfY9uGfj+yoYTKt2l2wfsZJ
         L7I5nVm7SSRfmdO61RvdsIswLhUceRHziT4ZgxHCGU3WZo7PFBpN44S9VV7pmg44uDsq
         96sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508864; x=1762113664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DoS377A3kfiWpyc9gBmtbjpbvbq07/XQKtO+ycC4TJQ=;
        b=dhP3zCB4C+aj/SU/lq3zAHEL2n/i1rSuwSmvSnvu/XBnl1Hl7814mDNs0iQhvZTnpq
         LKcCUaFHQIttT7jPtl0JGYkK4bygwfdrI6d78Xj7aQl9ScqxittApw15buJDpb8Z7kEz
         sCXpj3eVts6cADm8TUSPfyCNeaLIP63k5X2G8JHYlKngvpXITRuCJfQtrELboxWqDYs4
         u+H44spbsc11vNgcgNIJp3P02nCTpO9EshMCc3bTedoEXBQsaVyUOUKprgH0fSpJ8Vq2
         6m9M3hF8SxGF4RGuvncdeB6Fie1LuxV77Liz7yp+0W05gMvVR8fXvY+A64+14O0einYk
         Pc5A==
X-Gm-Message-State: AOJu0YwdOIvUn9IJCpoii7+9ocG6FDHpJBCtiuXA5R9L+EUmrnVY5HaF
	MWXGMgMLX2YrkONuE0Fuav7cw8KfSctTTE5D4gUgXAJutHsiktSj4DYaVsn++w==
X-Gm-Gg: ASbGncuX1qmgT/v3mehGyQ1GYYyJ8VEANC0ZjSgbHblf6SSyIgrCV1ICqyHQGx+Amrf
	Y1t6MdTChsatrz5oAzB1RexWI0H2skNqn1obFQY7KCxAyO5FL/Pi/BO8H840izHHDRjlCZ4VHAS
	F2hBLJv5BgsvM6gebjyQNRWnlpA3p12MGNm/pnjucT4ip/ZNUPXMvMldoPCu81jk6IFl5nKnPbR
	0sDf/rpgnA2PreMWL0tQykXDHX07MblIHqUo/wPXMO3qxOE/0DqwHEMXXGoRaIWrRux6zJc09KM
	HHVuMHqojr3ni4jbt5/jhibusREG/aAuwOse/mWA8UQANCRqe3CXgiUEnLWrDEXFGKHgQwnVx1a
	L3/VwTl/aanu20NxXHE09V3yuxaEeB+n1HW2YZVQOOvXJycQ0BfPLEQNw3g==
X-Google-Smtp-Source: AGHT+IH5PUqY9Aiqk/AFXfc/Op1gVzNadsTx3hKe21NXQr5TjsnLj4MNO22aVSoE6yBxosnUlVwAAA==
X-Received: by 2002:a17:903:15ce:b0:290:b53b:7456 with SMTP id d9443c01a7336-290c9c93d46mr413233495ad.5.1761508864557;
        Sun, 26 Oct 2025 13:01:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf352esm56444675ad.17.2025.10.26.13.01.03
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:01:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/5] mtd-utils: rbtree: just include stddef.h
Date: Sun, 26 Oct 2025 13:00:46 -0700
Message-ID: <20251026200049.25152-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026200049.25152-1-rosenp@gmail.com>
References: <20251026200049.25152-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_130105_628289_1F5064CE 
X-CRM114-Status: UNSURE (   9.00  )
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

There's nothing specific in the linux headers that's needed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/rbtree.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/rbtree.h b/include/rbtree.h
index 89926e7..e4a215d 100644
--- a/include/rbtree.h
+++ b/include/rbtree.h
@@ -94,8 +94,7 @@ static inline struct page * rb_insert_page_cache(struct inode * inode,
 #ifndef	_LINUX_RBTREE_H
 #define	_LINUX_RBTREE_H
 
-#include <linux/kernel.h>
-#include <linux/stddef.h>
+#include <stddef.h>
 
 struct rb_node
 {
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
