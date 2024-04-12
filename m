Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A48EC4345F
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2024 20:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aAfDJRN4j3ORzOQRdyEuncz7fH7VqfelrEvcBUFSrbg=; b=cuZfsmIMCeTDS5
	DZVJKKVr4lAFRdLJ+H0rEsirYSxoH/zU7sE54fcTSC0gPucXYMrvXVxn9LRgApPJEOCsmTishlaSn
	cQjaC3lf8ibsUm2iaVXtVOfHJN+yNQ1pHUufo6rIOdCRON7KFvzOJrpg94R3x387Q5GzVaq0LXBNf
	QTXI5FZ9CYTvUkYq1m/dwc9hBf33QEX699QD+J27WWTW7x414RTBYzou54/Gan/bplgdNVrmxhOEw
	2mVIWUdhsUcEu53Zi2r0v8bmnCrFZUmn1eK6WkNpPjr1MM4Zyiku1UYHzfqpMN8XjxHZQJbVykM9m
	Fbne2ViOFAToalhzTd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNvg-00000001He4-2WgK;
	Fri, 12 Apr 2024 20:55:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvNvc-00000001Hd7-1yE1
	for linux-mtd@lists.infradead.org;
	Fri, 12 Apr 2024 20:55:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-417d14c3411so13166005e9.2
        for <linux-mtd@lists.infradead.org>; Fri, 12 Apr 2024 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1712955318; x=1713560118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PgcU5BGZBDzXmccvOO0FU/JUF/atSsHs99HycQT+khg=;
        b=b7ZzfgO/eKhGh0eBIb3UgTJ0aqKw0jPfnJF5zhmGKTpgpwzwgUkuIpciY7rQK+O0cD
         NpNy5prCX+6Bjk/yyPeyXcMFz1IS6ACKoz67HNT5xe8ZvJ7xYqWZLnQ/VISJ0GrfKPEf
         1qj4Y3ccCMNhSFEGfWn9yTs3Zi/pNL98tbOadPXxeXet7wqKg2xj8ikwasXR9axMF/zF
         hk3j4CPCbMrFmIb/GT/9Th68td/hNPg67Wyh7V/sGQqWMIFKQ00tMul4wFOHJY1savoo
         wvDcN4f08MCdwugkJm+KdRC9JXS69TYeTTI+7UI0CTMZk5f5p60XmsNTyPMm1Xoc9hxy
         Gtiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712955318; x=1713560118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PgcU5BGZBDzXmccvOO0FU/JUF/atSsHs99HycQT+khg=;
        b=TDzNUhMxUCkhISSnwxBdCH4QHDvP+MqOytFKxL6l35DU/Ufg8U5wKDYwzKoAyC0cij
         9YBv8mqeeecObcAejEUQaOwg0YhmPw4acatkDsSe7/vsF0CoZsrJvJzXbi4yzE2gnC9K
         TyfTFl4OcbFjrmLAwuqgbuTWWEWL6zP4bCoxWK901oB0GsKhwDuugvbZjYctatJr76M3
         P5p4iOfnRmvtreafcL79uB3bvaysPztQmBvDYwpRM2HAY2lkOuor0M7JLQGYkJgHSupm
         2yPCgqbze3rkXyO3F84Fa8pmZT5chhNvUfhjjS8aIgA9kqY5STr2tR3R+1EWEa32J1BZ
         qWuw==
X-Gm-Message-State: AOJu0Yy+mOBEmDDhZDg6M7I4TERc/G9wpYQYnLFDvleIl3V5hJSHkvj3
	aMZYD2rXG+Ot/ki15po+Y4OdmNyA9IgVbv3cElrtTBPKtC/bFqMyAiuuAqLJwPltdBPBpnGnIXI
	XWsM=
X-Google-Smtp-Source: AGHT+IGYKAEUyFyjVc5enTa5QxYFnzCIn4DJs1dVAovy/SDC1fUTKg7qeKv8d5mufd+5y0j9BlUohQ==
X-Received: by 2002:a05:600c:4f14:b0:418:1b39:bed5 with SMTP id l20-20020a05600c4f1400b004181b39bed5mr407568wmq.36.1712955318216;
        Fri, 12 Apr 2024 13:55:18 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
        by smtp.gmail.com with ESMTPSA id k15-20020a05600c1c8f00b004181303f953sm1358812wms.47.2024.04.12.13.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 13:55:17 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: linux-mtd@lists.infradead.org
Cc: Ben Hutchings <ben.hutchings@mind.be>
Subject: [PATCH] mtd-utils: fectest: Fix time formatting with _TIME_BITS=64 on 32-bit system
Date: Fri, 12 Apr 2024 22:55:05 +0200
Message-Id: <20240412205505.1283783-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_135520_813595_8A6BBC6C 
X-CRM114-Status: GOOD (  11.30  )
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

fectest.c formats a struct timeval with the assumption that time_t and
suseconds_t are aliases for long, but some 32-bit systems now define
them as long long in order to support timestamps beyond 2038.

As this is an elapsed time and not a timestamp, both fields should be
within the range of long, so cast them to long before formatting
rather than moving to long long.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 misc-utils/fectest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/fectest.c b/misc-utils/fectest.c
index eb1d33e..f560f2b 100644
--- a/misc-utils/fectest.c
+++ b/misc-utils/fectest.c
@@ -87,6 +87,6 @@ int main(void)
 		exit(1);
 	}
 
-	printf("Decoded in %ld.%06lds\n", now.tv_sec, now.tv_usec);
+	printf("Decoded in %ld.%06lds\n", (long)now.tv_sec, (long)now.tv_usec);
 	return 0;
 }
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
