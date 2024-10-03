Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34730CF8552
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 02:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tac6OQU2CaOsneCieVbtyl1QG3nGV/Pj49qFS1YS7Q8=; b=nIxqPLyQli0cXt
	4E7V+IdtA9PUP8WEfStBpDyNsiZZV0m605KR9Aol+DRYGf3ui3RBmIyhG+ldOEgEr41AzhZESQPLM
	XlDnMmU/JQcViNZL5kDGCWQ0xuRwhW7HVZy6u38/WkGe1ek5lei3eumujFPwbsNfG+whZZ1bReAal
	gvpYoOmZ0mMIBeSpuO55jFUvYmtVfsRrcU4qRfJuxeugrraP+aIQtoYdg6lMH+vsw4iZZHj1EKFus
	DzRYVJ/e4hMf+ZSsXnF3/NrIgnEWJmhBa4aZ1Yzohw4bZuePAbdd62qs2xGiemFh/daYn43rihtAw
	QV1hLyNM7DVdGKcpaYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swBRU-00000007zUo-0x1m;
	Thu, 03 Oct 2024 02:19:48 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swBRQ-00000007zUH-3abZ
	for linux-mtd@lists.infradead.org;
	Thu, 03 Oct 2024 02:19:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71afb729f24so370716b3a.0
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 19:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727921983; x=1728526783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fapkpedkkdCI07v0m4E9JbA2kcKwvSSQCwLzditCQxI=;
        b=ELG0bm5ZVn0WeDjzCEkQpGpUxnrXak6gFE3P7Wf9nS9UC9QaduQgKmQvcfg7RVuuk0
         w07X749XrVm4iB83O1yP6SxwhG23qhhXQRgOxj2vvco9Kx8NTnTALePyGkqXzfBUvnjR
         HKmd/io17AxlKlQcToaKHekjAqq9zYW7rqesX019TEqYGx7x/WoZVllWO2wOYQkXpR1E
         GxmJ8458bOQatwUBW2v4j3VjMa6IdDGfjK1uVrZz5874qyKdnGM7yHWRfq2Q9jyT8WBH
         44qvjV6f44Ao0Bq1oYPTiX5G78ShFcK5MU5tPb4DuQCn8+iiIshf0dMHa+iVVomklyws
         lmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727921983; x=1728526783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fapkpedkkdCI07v0m4E9JbA2kcKwvSSQCwLzditCQxI=;
        b=k70MM7l5Cw7oPw+YTvHMKsoYn5GEPtKSdhIv6jr8op+mgj75olyh5fiiBpl30zcKV7
         +gmmefwJ/5QMLyUJg0eGvNM5XuYdgWfTj+8PrJwa3Ew8+TG/e5FA4tkcR2hVu/0zc45C
         U5pMWYvhbeuLeIMUTrhuveeqLENtxv/gyAMdBMhaOII0qcdrIpm34i294V70QZozzYmY
         NPYFFzbqTu/NEkU0JzwqcA3x7Q1OLH+46utd0zACwQTN9EUFrPWfaCth75TXdOy4a50z
         z4dg//2+utUGQEa8uVk6qhB0PUQg692zVxwFZbCfiJnt9B22rD5TWwUd6PZeo8i61z+z
         WbGw==
X-Gm-Message-State: AOJu0Yxy0VNy/F9Y2l7vK1ea9BPZoRjkf/BjEmzdacQR5vBHfQi3FLPR
	6ea1gq+9BuGWUXcS6/QA4w0UzmDowPwUyHDU2UIuq2HzJi83dpdUtakpnQ==
X-Google-Smtp-Source: AGHT+IHrPZQ5oeLXItqmbZ3DupGhTKq12ObUb4G5J7jb6l8LGe80LARP3XSdrE1P22N6nXFeQC0+VA==
X-Received: by 2002:a05:6a00:8914:b0:714:157a:bfc7 with SMTP id d2e1a72fcca58-71dc5c8f1b3mr5768252b3a.15.1727921982729;
        Wed, 02 Oct 2024 19:19:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d6fc81sm203644b3a.31.2024.10.02.19.19.42
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 19:19:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2] mkfs.jffs2: fix segfault when parsing dev table
Date: Wed,  2 Oct 2024 19:19:41 -0700
Message-ID: <20241003021941.1954913-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_191944_916209_C45009D3 
X-CRM114-Status: GOOD (  12.53  )
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

Make sure that the first item is parsed correctly. One issue otherwise is
a null pointer dereference when the first item is not found.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 jffsX-utils/mkfs.jffs2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/jffsX-utils/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
index b9dd96b..da07b69 100644
--- a/jffsX-utils/mkfs.jffs2.c
+++ b/jffsX-utils/mkfs.jffs2.c
@@ -428,7 +428,7 @@ static int interpret_table_entry(struct filesystem_entry *root, char *line)
 
 	if (sscanf (line, "%" SCANF_PREFIX "s %c %lo %lu %lu %lu %lu %lu %lu %lu",
 				SCANF_STRING(name), &type, &mode, &uid, &gid, &major, &minor,
-				&start, &increment, &count) < 0)
+				&start, &increment, &count) < 2)
 	{
 		return 1;
 	}
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
