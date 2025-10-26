Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C0CCCF9EF
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Oct 2025 20:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01oSnSC1jMEmIENA7aI3gLnn9VdPePjYWr2k8u6IT0E=; b=H6L8IRE+jLEVjp
	dG8uGcZ3PviBvNrUWrw+NAGScemhsvh6/ABDWNGPMVEx3dOWCm94SD4pmJNTVH/BVUzwTWT5GRvl+
	HUNaBAtcXoyEdseX+GkFJiAhuee3NK4U95JKzjmDyzIAnDe31uIYJuRCYdQJ9lpM4g9BtrW/m+c9V
	6R1owFwRmFS7AZLABmOpoZnCkrWn3zG2LTIXbetwTIr/UUz+458CKbGieMJRpucyyaUtuwPAk414l
	Ki9ASW6670mSae5I0psX5smue3BOBOWWlY49UOIpwzV3RIsIBTbZq5RbQ3as0VRCtOzYXDLZODJFF
	AjJUUfeRZAwyoflZor/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vN-0000000Cgog-41Y5;
	Sun, 26 Oct 2025 20:01:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD6vL-0000000Cgne-2RG5
	for linux-mtd@lists.infradead.org;
	Sun, 26 Oct 2025 20:01:08 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso2479618a12.3
        for <linux-mtd@lists.infradead.org>; Sun, 26 Oct 2025 13:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761508866; x=1762113666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etrI6vij4Dur/W3PZRvQA1i3IVvIQG6eAfK1FoPu2r0=;
        b=BfMaSol3Yn+CGrf7msrBqKf3bMgIBB00uOi2cAqvdsvKvSGsEe62RHhAyOlC1H9MZf
         t3aHcSseWMyAYUsfM8RAaoEQ6VtJFcNc2OlLj9BWUONZ7owTUOg3GITPP64RLIpthsgb
         3ChEPfnKpzkvz+TtNgF1aKf03D/02cxM5i5P2a3SNmlF5I1ud0UB+0poUgHrBw7VFU9D
         jE0/EqtmXZ4Ys3Fs/EsP4csIY/Sth00BpJr9VTpCsyWUtbV4ICz6oTsqvy4MhxU8/XkX
         /vbzn7Au72vk83JvoeFxzCrVJsiTXiCyaThxx7zH77nntBevPt2YRAjsT0uvLwE2IpFh
         08sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761508866; x=1762113666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etrI6vij4Dur/W3PZRvQA1i3IVvIQG6eAfK1FoPu2r0=;
        b=pIpE2cfWynuNiQ+flQTko7JC8iaQ/9qyM+tQIYAokWc2lxKhR2bTh03Eu2FPwddRK5
         YyZ33+jn80azJe0/Yqw4KdrnpBLOXeuHiJVytM9KDpNIz+X4BAU/Ww5YYOJXsj0Ib2iU
         t8FRazC0KhGov45YUfG6NIbKQCIp8z+8+kPv6FGTwkWmYu8wGXWs0y0Nfzw313tqJoYd
         RW8Jvbu/wOxNmngLGNtyUf4UNQg1WiuO+ZpYqcd9RxbYotYCiUXvQgte7J34/cFQIEd5
         rJDRFc2CS0q2dcRGx3KHdzFKo/d1z/LYSPrPRob5xzWZVcICnq8Aosk0TNnN1+aP2Ahq
         ISFQ==
X-Gm-Message-State: AOJu0YwVL+TcMRMsushZTo9O8qN8oD+xj2fC5msI/XP+P6YXu6LFFLJH
	H8n2XLcWpkTJUJsBv6rSA9jDjoTW/gUpo7eHB2GubcUSlnEJCZ0qXwnHB0kSlA==
X-Gm-Gg: ASbGncs4guFjZC7adBnqBdMJH53//ElKypXBxU1KBp2JahiCIT9vh9ZMZ11+rIP7dy/
	HGyWV/RTPHMgquAw3ko5Vp+8iy0ofzbLvW9hoHC5MR71u8/uzqcUZyXw63aRliPV1jaAnCt3qp2
	Nux+TdQOz2e2uLrn+bDxCY8m0GeyqTWJh/m9IT2nEaCUVZlihFcaaH/lVoH0n/0dTqWypOcOFE9
	oCO9Ql8JLlBzxljDztX9o5XzG61d3b/AVVaieC1LaVQBRPV8LaBt7rcEgTn0pAFgEJDNFDiX9m/
	XTIBVAWfhZ4ueNhQa9OQJxCDJ27DwK5qPJNBbaaNRFM2bXnU0RYvDQd5oJb/IpJD0RpeLfVJuZs
	g9iTdUFivzjm8l9LTo34ajJr8sUxpriV1kZL5Jx5ng0oG6pBuJr15+Z1tBQ==
X-Google-Smtp-Source: AGHT+IHpkagE55J5A87qvQnvhSHcjhCLA1vs5yhKzxJDy0YuGq9oCAJtMDvHsjP01sCU7JMoQMgYXQ==
X-Received: by 2002:a17:902:e5cc:b0:267:95ad:8cb8 with SMTP id d9443c01a7336-290cb079f2dmr478251225ad.44.1761508866399;
        Sun, 26 Oct 2025 13:01:06 -0700 (PDT)
Received: from ryzen ([2601:644:8000:8e26::ea0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf352esm56444675ad.17.2025.10.26.13.01.05
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:01:06 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/5] mtd-utils: serve_image: fix _POSIX_C_SOURCE
Date: Sun, 26 Oct 2025 13:00:48 -0700
Message-ID: <20251026200049.25152-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026200049.25152-1-rosenp@gmail.com>
References: <20251026200049.25152-1-rosenp@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_130107_616035_6E32DEE2 
X-CRM114-Status: GOOD (  10.80  )
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

200809 is needed for pread/pwrite

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 misc-utils/serve_image.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/misc-utils/serve_image.c b/misc-utils/serve_image.c
index 6c8c8fb..ec2090f 100644
--- a/misc-utils/serve_image.c
+++ b/misc-utils/serve_image.c
@@ -1,5 +1,5 @@
 #define PROGRAM_NAME "serve_image"
-#define _POSIX_C_SOURCE 200112L
+#define _POSIX_C_SOURCE 200809L
 
 #include <time.h>
 #include <errno.h>
-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
