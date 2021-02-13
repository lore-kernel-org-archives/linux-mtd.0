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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B0DC433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4669F64E3C
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4669F64E3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9zNhcH5cvGZGCiAZdSJGlCQfOKvQ5CKvImfru+TTYNg=; b=ofE7ekiiIAB4P4r0rhfv6P3jj
	SpVCM1iY2Xnm72TQU5PARpuwWC3pAm/RzlmcfclIOiTDsK3BkzLs+OGSVUYMf5QzXzJCAHMSFpzY7
	AYqrs1ytqXC2YFqBB2FkZCsKR5FfkWGX9pdJjEsKKEGpp0SvQrnrP+FaMnEUvUzxY4pMpLuZKolxT
	+AW1wAfzR7239hg3AFbqmHeVBkolysbV/pu0S3k/Jm5s1w17IjuYToDvGDdYEN5FIFcu4CIrppuxW
	4L1zAf1CmtCZ05oTpqFvqdf7teftjPvwY2i8fNNS5Hp2NKQem00ArVBpBhL5xUc64FojCcMRdxTmz
	ZRAU9Iu2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy4v-0004yV-7Q; Sat, 13 Feb 2021 16:47:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4k-0004to-Qj
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:47:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id g20so1454968plo.2
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i3UdIVSSuURDI57tdd0BCH+jV4GtgWbV5jFchWdmFUY=;
 b=l8ErE7wl4pOLqd/yR9n0JH/jrUbN0WFdooPPosXNLr4kOAEVFjlXwge/9IUlJ6bsT7
 lfq3LyH41GDI80QwF2atjbh3vYUGHQFp2G+eIAYsgMyJ8XORvRCB+eGlSps7/OaoLTaZ
 QCQbot6cCppQJD19DIeP9EpZvInbdINfWfbKwMJOqdl8ybBEg9NqPcpQaYVhTuJloyeX
 5QfQw5kuy0cDddzLzyiai31QxZs6t4GIrv5deoB9SItIq1AI1AIxhp7EVREjl7FHYm/4
 +h1Bt1DMWZem1mntQKaXJLSjxUoONLS1paHC8J43ql/XgkSMcdrlsYO+izIcMHD157bj
 mzKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i3UdIVSSuURDI57tdd0BCH+jV4GtgWbV5jFchWdmFUY=;
 b=fM8fcTAD6UQMrp0d2d9iO0YdFQkWL1KMQzd5RO76Y32bJ33ZnKDPYAZ/QpJ1Zh/zIF
 T+NisgZs10vgdBKvNvYC+xlJk+1SP4Yq/XyuWzRKgIHx+oRPzBte4Cs9H1MIQgr9CZHx
 WVZdOBkH5zfMcuCDC20qB0dWHScSuvczjkNZL+U1Cmj+4S5ep1goCa1NI7u5R8sQ9tpR
 ANz1s/cE45gSqSJ7ZFEVHPD0BtxWUy/eZGmo84T1QnKpMH23d3BINWWEHeLe2Q8BG04P
 LX9yQK1oXb2KPjlnI7Lui1FA7R28so7Z9QqmF/uOk7Qmr101XbStMvYxlpX+MfAk+O5n
 eYLA==
X-Gm-Message-State: AOAM530h/1nrqDJEXfOkf7UJeE6UMfuyrr0PBNn/fYl8K35NMFwpoGjv
 SVL45XdeeYR1AESJbk44ze0=
X-Google-Smtp-Source: ABdhPJwaCSDXVDctDI9DD2i3tzfva2SfC/2na5lwwDGCjtlL1wCzvrHDiVlDkjy9Ehs9o4hM1Icvjw==
X-Received: by 2002:a17:902:8548:b029:e2:ecb5:3e4 with SMTP id
 d8-20020a1709028548b02900e2ecb503e4mr7446861plo.79.1613234836830; 
 Sat, 13 Feb 2021 08:47:16 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id 68sm13132805pfg.90.2021.02.13.08.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:47:16 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 6/8] mtd: mtdswap: Use module_mtd_blktrans to
 register driver
Date: Sun, 14 Feb 2021 00:45:58 +0800
Message-Id: <20210213164600.409061-7-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114718_943097_55B7DB1A 
X-CRM114-Status: GOOD (  11.50  )
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
 drivers/mtd/mtdswap.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 795dec4483c2..7e309270ddd4 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -1484,19 +1484,7 @@ static struct mtd_blktrans_ops mtdswap_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init mtdswap_modinit(void)
-{
-	return register_mtd_blktrans(&mtdswap_ops);
-}
-
-static void __exit mtdswap_modexit(void)
-{
-	deregister_mtd_blktrans(&mtdswap_ops);
-}
-
-module_init(mtdswap_modinit);
-module_exit(mtdswap_modexit);
-
+module_mtd_blktrans(mtdswap_ops);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jarkko Lavinen <jarkko.lavinen@nokia.com>");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
