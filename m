Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C07CEBF82
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2024 21:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IRdTrPfy8NMucWDSuKMgtja9OMFgePqApWDLmCJEfWM=; b=g7jejBjUXXdnVS
	N3aP0m/YSXl5OCgNMI6FKFZ4PdkGxE4Fws6xtCWEeZBkiwb6CMZQQ6TmVqhdIPJqeB2urQwQB8nSw
	S63e7b7C4iPLEWADpqYfax8dPCbo1ClLV8AZNBLa7cZ3MMoc8Yts2FCfHvS5e5n4SmWEo0MG+T3zG
	nGrz0qWYdyw1VHxiA9Fcd5447XRR+MH2dncSgBYvYuVnDAAvUa2KM4ZgOQjgIcMj4fYMfBPT9zWf5
	mapGWs7QbgpSXk4nB8z6yWayxaIVKkYs2TIf2EbX9sMweJUucZa8ecp28aEGICG89oF3jOAkpNi1p
	uJBkGUId141HF7ss6kqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suII2-0000000C7sG-3jJH;
	Fri, 27 Sep 2024 21:14:14 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suII0-0000000C7rk-2CIi
	for linux-mtd@lists.infradead.org;
	Fri, 27 Sep 2024 21:14:13 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7db908c9c83so1635035a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2024 14:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727471651; x=1728076451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XP4LzL4IeCpLDQjoepaMUdGnz+CdY644MQkaaILCoGM=;
        b=UM11PXLvepYtxolxzPtZ0ft9k/hAgnghJt6tu1RJYNFhL18HrYAn/6+16W/BRDaoFj
         MOI4w07U0UAteTU1YKa2CjKS0MGcuZDtoeISp2qGRvSr9S9ZF+K4e2gZIOasEvP4mF5R
         YDtuev8E+I4VoOAsnzKj+gT2lzU6oSZl9Oxcm0qbEWwyTIUaC7unlh9BJ4B2jrEpcwjn
         XN8JZutPVz5RC8OoYwK+mInO0VhZg/MU90nij+PqujMFdEo+NGnbB2gfAbBWHhm+x6xM
         +CPcWGHsarlw/RlPP4vzUpbfgpz1DiDzKex4mmJSWhdXJHcqXiJFgjdHrzqnz7rCMkgR
         m1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727471651; x=1728076451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XP4LzL4IeCpLDQjoepaMUdGnz+CdY644MQkaaILCoGM=;
        b=q4Fhm7u1kWkHzfqXDy42rihEtMG0pDYFXWt8+noDDkgIWSGo4F2OMZa4QU7UgO+34X
         R/BPD55ZgYwbzueyAAxYk7cHcMy+1zotJvshqogcXH/03VjzrHvr0VG03w4j9JpN8dt5
         tWilUyCYwuntiMeEFaFMMrE8tBYsidMmKOTUSEcwIzh0QEO2e+jzq0WecV7NdAMKn9Qz
         Ca1Mv1R/6sM1+t7NNqrYaChTrDXpuwPbu0YsfrNaCqdSUxywwfQMI6R7nWSjyF/Z90xr
         gvYCwGPP2J71RIooPWC1bVvEXE/2px1aPzEgEAb8e01sJFbDfQXBBTDpdT7uYDg/4PRn
         ebSQ==
X-Gm-Message-State: AOJu0YwKP2wcOHwpxl07BYlWwupL3hzfwTAorOuwRA9c0LyRielBYWhL
	iGoGJekzowaH4nrFbFSw+lU2HHyrMqraXaIe9L5Tzu48PTJTorkQrFTfmg==
X-Google-Smtp-Source: AGHT+IGVMMTIpYHD0JsA1Jn1IdEBRctR1DqQuqGkvplNuJHk79XSdBzMFnLw0Ccy9wACElg79nlKzg==
X-Received: by 2002:a17:90a:644f:b0:2c9:9643:98f4 with SMTP id 98e67ed59e1d1-2e0b89ac7a2mr5340915a91.5.1727471650666;
        Fri, 27 Sep 2024 14:14:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e147c3sm2572471a91.38.2024.09.27.14.14.10
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:14:10 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mkfs.jffs2: fix segfault when parsing dev table
Date: Fri, 27 Sep 2024 14:14:08 -0700
Message-ID: <20240927211409.874433-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240927_141412_585684_360D940F 
X-CRM114-Status: GOOD (  11.45  )
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

Make sure that all 10 items are parsed correctly. One issue otherwise is
a null pointer dereference when the first item is not found.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 jffsX-utils/mkfs.jffs2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index b9dd96b..63dac1c 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -428,7 +428,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 
 	if (sscanf (line, "%" SCANF_PREFIX "s %c %lo %lu %lu %lu %lu %lu %lu %lu",
 				SCANF_STRING(name), &type, &mode, &uid, &gid, &major, &minor,
-				&start, &increment, &count) < 0)
+				&start, &increment, &count) < 10)
 	{
 		return 1;
 	}
-- 
2.46.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
