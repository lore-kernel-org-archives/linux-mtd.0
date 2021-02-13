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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35426C433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC77161494
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC77161494
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=++PJTSFG+btvWaBjPX1RImRvP0yvKLYNi1KQwTSOD3k=; b=0P+q6BNCZQodI4x+u8Iq0CJc9
	Fi6QuxCjfcGe1fDChYFqdjtDTT1dqvmnEtIg/njTstWkvSNWJguVleb3N45b4LS5w9xD7Bbcr+hiD
	jy3Xv6pQl8dRLPMlk1PQtVMY1SteIb6L40125oBA6Q/8XEYRIuLHOqbS2wzOtmWuGCa0quyls1LTH
	fMCgD/1heidXoT7X1SRnUr+jMH8u3/3j2FrDaI/7+8WPjCaEbiJBj65w8JU7NlFWixIT9VeBF7SmS
	e3p7w05R9zGqgA9xCIKZNV1jWhAMhmjJ7DPCJdPxiSRkYGYMEahcmZOBcRcSr06D8hj8x+HVLOXIZ
	gBCbvd34g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy4w-0004zD-V0; Sat, 13 Feb 2021 16:47:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4t-0004xH-0r
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:47:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 189so1550942pfy.6
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LuFN5JlbvcMUz61kHz7biAIAIk4OfNdAOsuO5R8F53k=;
 b=JTx47GelbxDf0iIvPQxbGaHqhr0PHAszv7IYTP5WuXTAk4OwNcD0PeY9N1TjuivKuC
 NfS6gDyVMnPiXLAkeUbfn4QpCVp+NiclipStojb/O15Z6oJfVhq+7QH94TXEH9kIvEWu
 ykTZtm+82bA2qIFY4x+EVEa+TIDuOVj2csqPT40R0sPi5kvTyK3+u0EwLVHHtq5V1MBE
 z6ZgRDDzniV21Xa3f04QTtfCi6hRoI55MX3wadZtm8mbxCoEykCLyYn+P7EKfyxvU41R
 aKMtsRPMFyrXr3jRttrErGBCR5/oEslVhFL4BEOIFRAiGHZ2cMM2e/cCeafrSAXmvOwY
 arXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LuFN5JlbvcMUz61kHz7biAIAIk4OfNdAOsuO5R8F53k=;
 b=mZ+5WpdYBtyURsC3kbPZrFgQkaUY/GM3tD4kDv0BHIKQ3gG5CwMCnYd68gon8ApIJ5
 D/8YrgvsNQw07wBxFXFX9FSBhHRz5B0OAn5GG3seNVyhPtluSqvAR/tmGOQ8bTH0CQ1d
 2d64x2j9aKLHpjdabhNp8vZSei2rRTXdmBOZCXuXzxYXzPzQGeJRtbgqXHU0lLGwyG1s
 zjNEOxbfsMeZVWauh25JWqHgsL55bN/FUrhVwdBjyFQcc37jDxnK6n/M/WY5QqYGaile
 fuyk/NrUHmq2u7vMvAYl6IHF7YHIfOmsj+ijUxobmB5IkhLSJcFwBHH6HMWxXMGj7aPd
 3pKg==
X-Gm-Message-State: AOAM531H8ftaoKlLOU3qGaZkYtJrQC0F2fBbK+M7h+4DzaViy5YVfhzN
 Hfmn4dldj8lVVvUXfCypyOU=
X-Google-Smtp-Source: ABdhPJxVsDyiEdMOsS/Msc4pi5ji7V60PGvB+WDlJVuAGPG7VUKQAVdXasVZcMD9FagvbnYrXMBjPg==
X-Received: by 2002:a63:df11:: with SMTP id u17mr7986404pgg.345.1613234845112; 
 Sat, 13 Feb 2021 08:47:25 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id m4sm12478650pgu.4.2021.02.13.08.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:47:24 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 7/8] mtd: nftlcore: Use module_mtd_blktrans to
 register driver
Date: Sun, 14 Feb 2021 00:45:59 +0800
Message-Id: <20210213164600.409061-8-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114727_131659_CF23FAA7 
X-CRM114-Status: GOOD (  11.73  )
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
 drivers/mtd/nftlcore.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mtd/nftlcore.c b/drivers/mtd/nftlcore.c
index d44641129cdb..bcd0094f172d 100644
--- a/drivers/mtd/nftlcore.c
+++ b/drivers/mtd/nftlcore.c
@@ -797,18 +797,7 @@ static struct mtd_blktrans_ops nftl_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init init_nftl(void)
-{
-	return register_mtd_blktrans(&nftl_tr);
-}
-
-static void __exit cleanup_nftl(void)
-{
-	deregister_mtd_blktrans(&nftl_tr);
-}
-
-module_init(init_nftl);
-module_exit(cleanup_nftl);
+module_mtd_blktrans(nftl_tr);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>, Fabrice Bellard <fabrice.bellard@netgem.com> et al.");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
