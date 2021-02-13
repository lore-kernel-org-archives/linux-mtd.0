Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A990C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A51C64E3C
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A51C64E3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DqE0emXx/szQ8Vw1jrciiWFxo3cVFOHtxxJM0Unmw3c=; b=U3rbJZ+M4Bm58cN6UxhTG312/
	Y821tdFtcPT32SEFNxG99qlnLUyUF9A2VjoathUlEmXAj8DPq0qhjePz/2M7oePXL3eWPtj1Sfm/6
	1pnmijpiB/Qs6h+QFqCVxQXGaci8VbgOQOGc7OYImuuYXa2kKzUxnmHUhCTLJLlhJdxLz4xEqImfe
	L7MMiZGtwAcu1w38BdHczNX0PGdbauoxMr9HroqpQrDLYRxyAs4G0MCVqE8EXIA56zVi+rqg4Mq4N
	GVhd4LJ+2HvEYbAHEt8bkwZpsAKVbY/PwPWn0Y3cY1bQBizXlYnV7xziXwbHDmBNoQNZUi6Omg/lw
	LsHFjdJjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy4R-0004q3-17; Sat, 13 Feb 2021 16:46:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4O-0004pL-Gi
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:46:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id k13so1527749pfh.13
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BfmzqMjdUtEQ0m0SGfMEZGmDtfwGnZKPpB8xw0rX8N4=;
 b=vYZJYp7+EwWHOWg5oVcaALOO2pm6+Im7QYneBYejiC6LkA1X1G+tRmP1PjeRD44E2p
 wXQlwEgfGZEB4WZemo4eN4mXemBIzJREal4zteg9j8W3LDCTOld/jBhwHTYYcOI4GZll
 UuBv25MoV5JvUnV1prVMko+4EmoV6OZCnpD+4ouawv23aWuR7EGpc5iypwVvLuYLrIZu
 RkwGXZjLcg/EswAbHNQt5E51pxvAqxw2u3UKaJOt0jcyenxbz1tDBz9FYlnO+qpHAdwH
 XwSCyjy13Q1w/sp/iX96pvqGdaxhRHz8eyZ6noAzxoJyExIGQCHEzreUxTY9+uizGDi/
 rsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BfmzqMjdUtEQ0m0SGfMEZGmDtfwGnZKPpB8xw0rX8N4=;
 b=W66nwfetBNgG/3kgG86uWgxNB/JEilb0R3leQBlLqb0MToDNFBJg3C4x64viRAvjao
 XR8BGKtoy9/CEVC2vJcN276INmMXiEz3vzdqFF7sHEEgJ2q0kXoADdS1ivpdto4Pf66o
 ainO1cF+GbE1hM7Pz6TAsY+o3n7iIi2vgna23n+Ka1FKSCQVuOUXjAMNeZDY346Bb4Zp
 hVCM4c7rr3XkNRO8/4eYlcdunLc5RMqRAuJAIgSJ3qEgjUkpIsTuvVt65sADYe1PaH2y
 J1x91re6+aBoJXEWaoaG8UnnvMNQx3aEouNAybdylZJoegK4/z5eEgdTMySBb08g2Fgs
 h0Mg==
X-Gm-Message-State: AOAM531Sjy5JhNspI2Hrcx4Ub2s4344dabcLLub6G730tROZgWCfVArH
 C6q8iU48oVbsQ9pqodnYF7U=
X-Google-Smtp-Source: ABdhPJyPHW0mtP9lwfKRcZBcDtyrmJTBOmtEMDzI14i1bvOzj9cEDBvIED0rKdKG138JH0jRMNVjaw==
X-Received: by 2002:a62:8cd7:0:b029:1d9:447c:e21a with SMTP id
 m206-20020a628cd70000b02901d9447ce21amr8181346pfd.2.1613234814511; 
 Sat, 13 Feb 2021 08:46:54 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id 25sm12814475pfh.199.2021.02.13.08.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:46:54 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 3/8] mtd: inftlcore: Use module_mtd_blktrans to
 register driver
Date: Sun, 14 Feb 2021 00:45:55 +0800
Message-Id: <20210213164600.409061-4-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114656_594940_FD615C16 
X-CRM114-Status: GOOD (  11.94  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Removing some boilerplate by using module_mtd_blktrans instead of calling
register and unregister in the otherwise empty init/exit functions.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/mtd/inftlcore.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index a0d6c00e7b85..6b48397c750c 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -937,18 +937,7 @@ static struct mtd_blktrans_ops inftl_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init init_inftl(void)
-{
-	return register_mtd_blktrans(&inftl_tr);
-}
-
-static void __exit cleanup_inftl(void)
-{
-	deregister_mtd_blktrans(&inftl_tr);
-}
-
-module_init(init_inftl);
-module_exit(cleanup_inftl);
+module_mtd_blktrans(inftl_tr);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Greg Ungerer <gerg@snapgear.com>, David Woodhouse <dwmw2@infradead.org>, Fabrice Bellard <fabrice.bellard@netgem.com> et al.");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
