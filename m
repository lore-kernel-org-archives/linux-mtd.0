Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29A8CDD1BA
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 15:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ewXcv/2XPBRYAnPfdFql8YlkvEqZYy2o1lXvILS/Otk=; b=U3hWQydt/cxtQE
	GIFZW6x7rl13TR7TPgYUN/e9XsBaxjNWpUqXcCJuQC/XS0dc+z23gexPMOp48uW76Ne2rcV4y9ZXz
	dQKy0Wrv6gSJHGZPdn84o9w2jNEwEkvoqXyjCHhJG/r0ZiIPQAIT1sai97E+SPRHLZvhyHS7nnSCR
	EW3zCkIvzhzs8PUfpxiGmSn0ubZPDLdaynLfbZgDG2f+dXQP3ZekzjR/V36N5J+kthwpa2g/9JR+p
	y2GhGSEYPh6LTEcpGbm8t5QYoJVdrMPuwuL4quuSo25yGUpvihDUvYlzvca2c1ETNp1Hd4sTJ76mM
	nFaP/yk7wmH5HbhX049w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suCSd-0000000BXm9-2BZr;
	Fri, 27 Sep 2024 15:00:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suCRA-0000000BXOb-0aeI
	for linux-mtd@lists.infradead.org;
	Fri, 27 Sep 2024 14:59:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37ccd50faafso1477893f8f.3
        for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2024 07:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727449154; x=1728053954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rvr+aAeqYc0TS+uRT5fh8X+vEgn01CkzNarTSi6yaX0=;
        b=gUyQsfxY11kR/sXS/ZrD+z5Eb54kvF9ZQNkeWrAW5hFV31KQJUiX84RIR+lTzZaAWL
         f+loYcYEqcVs1tjBAGb8qh2TsNVZgVIxG42K5QYVph0f4pCdsztuR3hlt+Fq6XKcf2sa
         ifswHqTU73SiLo+J4FwxzxgpTFtQL362cNdxhhNJfPHorr4knfFPkRgUaZ/Ptu6wxPjs
         SfDHpCJBjylcpU308BRhAPgbEnYB/c9RsnPkk7zCvup+h3rj6hv0MX3hVzt5ZEitSJV2
         f9As91VbKHG5H3S/BK5d8kcT1/mxEy5TNYyFhXkXN8t/jFAbVpm49YojYwUGpatVi8wA
         cIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727449154; x=1728053954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rvr+aAeqYc0TS+uRT5fh8X+vEgn01CkzNarTSi6yaX0=;
        b=Ixu6Anal8nSx0OK5V0NOTcM5hAv84KFVqvoMRWNYV5bCSr/bzSNeEV0gRB3Tqk0aLM
         Sksff00Tm2idF17WTg7mo/yceKdmezQIIGT1EIuu/kr2zPN6AmXWHFXGmYdsmRK8GI7U
         9WCBS3p9Gx5ZtsVy57zgz6LdS9rryEAVS4s7DoCNELWwP1hiWH238JQGtkoto/kSParC
         hKdONgWro8bp17oJ2+if5y72fzrJIffD7/L9U0BVRkpKPxrIUKbKqJvVYJYlRyUAKBc9
         Qjj5ecnZn/v/44iHRYsxmmQdrXoawUlUUw6IsZGcHQmOoTCEy+bVQkOIljjxKolqJbXX
         l42Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbT7OObarlm+dysMkDf08L/Nb4+ZW0A49HRF1I47kAiuL9Q1l29zzEBFNbNSdfoS2PIeQC1vjcQyI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy441sdLwoZEJzCJCZoTBaa9TRxv3fg9iCj9jLfLCyFmSWQAGGQ
	NMAPv0gW4p0/8IeMFIyturLsqtC0i6wHq6/SgQNzVdN+cW5YcES/
X-Google-Smtp-Source: AGHT+IG9q2laExEP0nsChGhvAMrYqjDALDI9tG5cQ+2Watn0OQHwMhGGs32p7wB6IkqKrPQQjaahxw==
X-Received: by 2002:adf:e589:0:b0:371:8e0d:b0fc with SMTP id ffacd0b85a97d-37cd5aec227mr2291360f8f.35.1727449153857;
        Fri, 27 Sep 2024 07:59:13 -0700 (PDT)
Received: from WTFRLVSE288987LL.home ([2a01:cb15:8444:4a00:ec33:69ba:5260:d1ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd57424cesm2668397f8f.91.2024.09.27.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 07:59:13 -0700 (PDT)
From: pascal.eberhard@gmail.com
To: Richard Weinberger <richard@nod.at>
Cc: miquel.raynal@bootlin.com,
	Pascal Eberhard <pascal.eberhard@se.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ubifs: xattr: remove unused anonymous enum
Date: Fri, 27 Sep 2024 16:57:56 +0200
Message-ID: <20240927145757.347630-1-pascal.eberhard@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_075916_206555_264E8C5C 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Pascal Eberhard <pascal.eberhard@se.com>

commit 2b88fc21cae9 ("ubifs: Switch to generic xattr handlers") removes
usage of this anonymous enum. Delete the enum as well.

Signed-off-by: Pascal Eberhard <pascal.eberhard@se.com>
---
 fs/ubifs/xattr.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
index 3db8486e3725..32927bf98306 100644
--- a/fs/ubifs/xattr.c
+++ b/fs/ubifs/xattr.c
@@ -48,19 +48,6 @@
 #include <linux/slab.h>
 #include <linux/xattr.h>
 
-/*
- * Extended attribute type constants.
- *
- * USER_XATTR: user extended attribute ("user.*")
- * TRUSTED_XATTR: trusted extended attribute ("trusted.*)
- * SECURITY_XATTR: security extended attribute ("security.*")
- */
-enum {
-	USER_XATTR,
-	TRUSTED_XATTR,
-	SECURITY_XATTR,
-};
-
 static const struct inode_operations empty_iops;
 static const struct file_operations empty_fops;
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
