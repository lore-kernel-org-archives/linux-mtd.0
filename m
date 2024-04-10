Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33505CD11C2
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Apr 2024 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KyFHqj15YJuebrZhUyTxdDgRN+62/EflEuJ4MBwmFXw=; b=PAlda5E0u7bLA1
	OXlb0qyZyOKHWKnkfg12gslp2HNnZ2AFjX7fUzP4n+zNQsuO4WmJFHx1G4Term5n8ctPumpxv0s9O
	t+v1MaMQYYqnJPQD2KEG19kJDmIujSrYBUowvM5eyXuVqast2eRR9HI6q1hZ7lTI1dMYKPlQhtOWJ
	4E83WqvFlhg6GN4jLOHT970O3VJXEjFCWX2JD4PnQJk1bVa54DH646Fb7u+VKO69xscYkwrGUL7Si
	g7yHiOIi6e3dnBfTbYbuhquD1GpUa8f3IUjOiOx9kX+Y8Y0Gv6ePACvqz3eqqbgKpt5XQBjgyc5BZ
	SVkcvgxdIYExyQHe3w0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruged-00000009GtF-3RH3;
	Wed, 10 Apr 2024 22:42:55 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rugeZ-00000009Gra-3ryw
	for linux-mtd@lists.infradead.org;
	Wed, 10 Apr 2024 22:42:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-343d2b20c4bso4653650f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 10 Apr 2024 15:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1712788970; x=1713393770; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Wpmy+mmWOHJx+HC704Jg6g8mZL3xGzCPoGX3zmo7es=;
        b=PAhSSI20imVsyHT4oTY9awxwbYvdNzba5rdE1xrwMMFL8C03/f27vkPwX/Z4WOkTRq
         xuTorIWwrMCihgyQ4B7P4EbfdD2sAFPbiZi08ORTAhvG8KGgX0wOx71VylEYcs1YgYWt
         SIeKvm0uypy5dW+S8jbdqg9edbCPwFC1a8M/B4BqGYAZbg0kDMhMzkB6npj1ZTh5mRO4
         4V2CmyN0pwVOaU5055cfcp2BhelqZcXyZzaRuvBl8zhuBxzYAGv18Kxd3ra5rD0BSRCu
         BYZvAxFjUwt1O52LCvFA/2di/ATINPmFvw3CHhRoEmZ/XWG6uIJzhQ/7oVcMNGM4jO19
         GmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788970; x=1713393770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Wpmy+mmWOHJx+HC704Jg6g8mZL3xGzCPoGX3zmo7es=;
        b=F11ABw+Shtt/J6q71kvDTaNKv6yZgfBpqwriji++eUhv8UmEbpSgOvyVgqZLO9biDN
         WywE/BR5S/fZaR4vQXUvLoCl9r7YItFk6bA7KrX7nEWqZO0A6gmyCHOEw1yHGg+r2ZTd
         r0ic9ReuujZG5+K8dLlQILb9RI84SLKzSdaSXrTCMx3lWxI6mp2kxDWscfzjJ/GMaW02
         rEIuWOd0vD/NxbGh23F3EjF+bEUOTcVTI92j2xFIWUCsEzASCiGtVweZQ57eBUD7gcXd
         B5BCUbxkgy02/+tdprPvzZel7PdOOSfVpSjfx3dcq+6zfmH83Q6PjOBbheApye36urhE
         ++LA==
X-Gm-Message-State: AOJu0YwUBnAWQaLFj+0fMHOVDuJsfK7wkiS6CztZKxJyu3zHg1j/YNry
	yH3/RQZ7e8/kStapGUQfLec6Bq5RvfFHDDTqDviwmSxh+LtD6HpA/tJYNePI4vZfr1Ww1cLm//h
	n8z4=
X-Google-Smtp-Source: AGHT+IG02QKXI1UYRyg8PelNmlOXiSUGTr9Oxe6cY7hxgqz95VF+5dz+NSA/LYd8CyXb4aXjoDKtFg==
X-Received: by 2002:a5d:4b83:0:b0:343:a368:f792 with SMTP id b3-20020a5d4b83000000b00343a368f792mr2881959wrt.52.1712788969700;
        Wed, 10 Apr 2024 15:42:49 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
        by smtp.gmail.com with ESMTPSA id c10-20020a5d4cca000000b0034698307cf8sm271337wrt.15.2024.04.10.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:42:49 -0700 (PDT)
From: Ben Hutchings <ben.hutchings@mind.be>
To: linux-mtd@lists.infradead.org
Cc: Ben Hutchings <ben.hutchings@mind.be>
Subject: [PATCH 1/2] mtd: ubi: Restore missing cleanup on ubi_init() failure path
Date: Thu, 11 Apr 2024 00:42:41 +0200
Message-Id: <5cb0ea603f099d7f416aa552f37992ce14d05588.1712788087.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712788087.git.ben.hutchings@mind.be>
References: <cover.1712788087.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_154252_271329_89C75BC2 
X-CRM114-Status: GOOD (  10.27  )
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

We need to clean-up debugfs and ubiblock if we fail after initialising
them.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Fixes: 927c145208b0 ("mtd: ubi: attach from device tree")
---
 drivers/mtd/ubi/build.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index a7e3a6246c0e..50d78975b3ed 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1372,7 +1372,7 @@ static int __init ubi_init(void)
 
 		/* See comment above re-ubi_is_module(). */
 		if (ubi_is_module())
-			goto out_slab;
+			goto out_debugfs;
 	}
 
 	register_mtd_user(&ubi_mtd_notifier);
@@ -1387,6 +1387,9 @@ static int __init ubi_init(void)
 
 out_mtd_notifier:
 	unregister_mtd_user(&ubi_mtd_notifier);
+	ubiblock_exit();
+out_debugfs:
+	ubi_debugfs_exit();
 out_slab:
 	kmem_cache_destroy(ubi_wl_entry_slab);
 out_dev_unreg:
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
