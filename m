Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FDFC02198
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1g0JPKoUYPV1HDLRXG73PhBrGm//0/J6U8m/Eveyl+s=; b=fL+5NROSVySxtW
	E8Fr5cFInfjfSrJc/CtxKNdd3W2/Xv21e2S7rjzAKyZfIphr3UoASM3fzjRhiObiNcTWBgUSq5U9W
	uXfjKZMBaJU6Nk0jJ9ArI501jCSGeEXgtW8JjqHYBYX6BN7XN0KgJWqf5bQTiOQ+B0CAGrH4RJhif
	cQSZ/vsE2SicX0MSBTFWlveDMiAjBxrcuKezfEeinnChhKk5cpRHjk6zrmPtx7SHlrR2QbKOqFDLn
	7EVmEQErfB4E5ILVrsZ21iQzM0+p6i+4W6iBH9SNhpZyXNlQr52XrYxWacS11pR19WgImmVMTToJZ
	pPyzg7YicX54fBcz8Epg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMBx-000000082VN-36ho;
	Tue, 18 Feb 2025 11:55:09 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLpC-00000007yJw-3nZa
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 11:31:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2fc4418c0e1so4015512a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 18 Feb 2025 03:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739878298; x=1740483098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izp3IHnW9epb2JwIeUosdnjtyTFepP51CV0pISfTHPQ=;
        b=lVQ1kz3agKJWwDfRseI5sALkmk4WZCphEOodX75DlciSiVQ0Irc4pEG2VcL1yUXp0V
         yDSugW/VkcdJhK+vrtVkxQvnG3cER4NL+eH86mfAB1M37Fi87AVkfsDxkgX0Z3nk9vmK
         6NZHWFRuMhtvLZHfUZxuN96khSM3afa8PkNnYs8Pf1E9WCs9uXFjl71tU9HMA5el1v/h
         ZQv9tcwdwSIbNlgBa59zWC0xnMbVOABVXMq+fLaD7SEX/gl0zrBjbeHk4/TWaN81hTp3
         o1RVuThnSqmB3MMnPzUD15LDMEHNVrWNBMQzmwpIyU0xfHxRcbwO8rhd6xE56ws1m5Ir
         uAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878298; x=1740483098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izp3IHnW9epb2JwIeUosdnjtyTFepP51CV0pISfTHPQ=;
        b=ZqhAJCYvwi4DLB803etp/InhmqE/Z0mHyFLHOXe7klrOq7N/u6nCKDpyITeqgAwmTE
         6NkZgkIioOm9TyZ/tG9xwLt4qp2DDbfGjqmQ2S4mvDaBx2FIhxulrtmwjRk1LMI4awD/
         RLEmUez1VOajUJal4+lmCkYW4vayT4+g/YW/CJbR+xva6aO6JLGY7bF5joWhnrZfefd+
         MNv4Fze+alINlvvxrz6FcODCKS20lI0SQ0bV/PH0Gfx36NrjCS5rYTvUzqaavXlk/wYJ
         jQ3yUfXbSLub1sKZ4ha45rBI/c/mZx9dadu5AU8gAuK1gV5e7SVWAbAgPmHJ7smYpB3H
         yXnw==
X-Forwarded-Encrypted: i=1; AJvYcCVbaITK+hT3goO+Z9mlC6mcQQmMiFn22A97Emjqe3o96QEhl+o93gEoBVvTKHy4YXe5+bCctTI6fOs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjzDyB1aH0pTvheyFjzaUDnqfrf3fGZqtI9QSudvWxM49/RsJS
	8B+3jm7fDs5TPNYyjw/U1zPGtMf4AT4ehJVqpoQA5+WGVa/hieXt
X-Gm-Gg: ASbGncse0Yezm/d0ZQNhOh8Q0cesX0R4BiQgbPGBDU1Me9+W0EPyPQiLr9JGw5KwJhy
	JBNvCaIf52Nur28PimuoV7j8A4uO7dIANEmbYzYkZ5+r53n4VdRUfL9wGvgGCmwZW2u8r96ADBW
	xDTySSIR+m/vB13ffmUqYcPa08vkP2GggLIWX3PtFwLBx138wL7NFw1/FbXqiZuWSpQaC86/ybu
	CWodtfw1x1693S45IlxA0eGV2uoPw6aKs7Ap3PM5nxKzn+V8NLSYwTF7PEHbgdbYAikcA3y7hRj
	d9fEZeGqHc0d21RSdRRQsKr95z7BFQ==
X-Google-Smtp-Source: AGHT+IGJT8VKBxQHN+ClHaDosUxf9I65taRKhrexk7OAfQP27J148rw4wbQE6vHdBdFWSQDasmCKqQ==
X-Received: by 2002:a05:6a00:3392:b0:730:9637:b2ff with SMTP id d2e1a72fcca58-73262200aaamr17190749b3a.7.1739878297952;
        Tue, 18 Feb 2025 03:31:37 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546835sm9876661b3a.35.2025.02.18.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:31:37 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 mtd-utils 2/4] ubifs-utils: journal: Include <sys/stat.h>
Date: Tue, 18 Feb 2025 08:31:21 -0300
Message-Id: <20250218113123.1956575-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250218113123.1956575-1-festevam@gmail.com>
References: <20250218113123.1956575-1-festevam@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_033138_949047_D97420F5 
X-CRM114-Status: GOOD (  12.68  )
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

Include the <sys/stat.h> header file to fix the following error
when building with musl:

| ../git/ubifs-utils/libubifs/journal.c: In function 'ubifs_get_dent_type':
| ../git/ubifs-utils/libubifs/journal.c:414:24: error: 'S_IFMT' undeclared (first use in this function)
|   414 |         switch (mode & S_IFMT) {
|       |                        ^~~~~~
| ../git/ubifs-utils/libubifs/journal.c:414:24: note: each undeclared identifier is reported only once for each function it appears in
| ../git/ubifs-utils/libubifs/journal.c:415:14: error: 'S_IFREG' undeclared (first use in this function)
|   415 |         case S_IFREG:

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- None.

 ubifs-utils/libubifs/journal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/libubifs/journal.c b/ubifs-utils/libubifs/journal.c
index e78ea14f3e69..45d82fd54bdb 100644
--- a/ubifs-utils/libubifs/journal.c
+++ b/ubifs-utils/libubifs/journal.c
@@ -46,6 +46,7 @@
  * all the nodes.
  */
 
+#include <sys/stat.h>
 #include "bitops.h"
 #include "kmem.h"
 #include "ubifs.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
