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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94762C433E6
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CA764E3F
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50CA764E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7cR1tg2TLVGfjtm6KAecmxB9OF1e0PtuloIbPLWtac8=; b=ixPeSqftsYG+DgttHel7ZxyfM
	clCPd5AoFkSsfIYR334RQ3RyLZ2jRZMFazaFxzt7zb68MHRdy9/cRe9oYs7TAgTfiTK8ENA4scEiF
	nGEDc4UGIFASdh3WC5YqGEITkFKCJ6NxhUNL0nOIzbvtuKZ7uiPvkrbX4jlx42E+ytaGWVV5dX6mp
	P3N9I8Rgd2i8h1oL10/PQXiI6ntSBL2D/GzzlBz9oREg7vltrJutVEAlvpYPTW6ClKRwbNZx48Lvp
	PFx2biSHLhiGziZoasf7yyqj6bocvkSz+u3FyuwhZ0Lwpgy5yScc4/VD22g6co3B93jHGrWEF9wGr
	QvKPdSksA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy4Y-0004r0-Bq; Sat, 13 Feb 2021 16:47:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4W-0004qU-2m
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:47:04 +0000
Received: by mail-pf1-x430.google.com with SMTP id j12so1531182pfj.12
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbOaWE3/W5QAfhUbixoIolMUbq3ZGWOO1rC6q+utlJ4=;
 b=USH7zZ22TdOpZU+R2nYwU8DQ0zcE11vwvqyUhvXFiB/LhYX4hQAzZkkkYQ3mpX3e7b
 8Pg2lISkMJUnWliVap4ny5kNNrRpZPyCbx8zWIdcnyWiWIPZG0yaH33yxmx41zLqpZUr
 ma93VuXvZ9E/+nDE0VTLeWHGROKUQXWbVtFsIM95KV1OODfBUrxBTXQ+NdHJVhBDqfZp
 EEppwrZZnYZyhQ2CcT8XMJGIS3OwWGG5Qs+3XOikxhjQBna8KX64gM7yHAakNHuuCnFZ
 HxpdJav9q9z7QW4eI7qxRpJVTwAsvFqMVoEC1Ih308Ve/9+LqpsUCUnaBSXzZK5/2rvC
 H42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbOaWE3/W5QAfhUbixoIolMUbq3ZGWOO1rC6q+utlJ4=;
 b=GJiOOJ8jneHHQL1uL/SPfgbpMVrxzIWGvVxPLDdpOOz0h3RMIYRluxvmgy/ahTLoLK
 wjwm2rbg5+BCTrmu/Fskw0KBsnwimBFLswSY40rmY9KHLEMx1BMyxI53ukKCsmLGmMmo
 XSERZa45Un3XBMujbPz1RZvIpe4TCq5YERIqqthqg/eeZWyBQ4+xniJzaBmRDMCl95IX
 0v35NAlRQVtM3kp+lGUGjelUCbLKdTTZFmj3FppXKfgKpAvTDccROMq9v743dXSqSmqL
 mNrifHmUnvKTFgjSt+HzbaKjnp6fTvndA8qLaGdfOteBa6FnmEe61glv2N/RUjo80N/m
 ajDw==
X-Gm-Message-State: AOAM5308C4BJesgZIeUgQa2sKl/mQZFamWD/hXT05mdnnZeWtVq9J1v9
 wwmqLnmeadloR8E1+4pFe5c=
X-Google-Smtp-Source: ABdhPJxpKYS868siiNRtZD+2OSRs9zy+vudS7dqGQu+4t5Tyhl18+dEaQB4IKirR8ryk3CYBixYSwg==
X-Received: by 2002:a63:d304:: with SMTP id b4mr8123851pgg.299.1613234822070; 
 Sat, 13 Feb 2021 08:47:02 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id g15sm12508194pfb.30.2021.02.13.08.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:47:01 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 4/8] mtd: mtdblock: Use module_mtd_blktrans to
 register driver
Date: Sun, 14 Feb 2021 00:45:56 +0800
Message-Id: <20210213164600.409061-5-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114704_134661_33A9EAFA 
X-CRM114-Status: GOOD (  11.61  )
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
 drivers/mtd/mtdblock.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/mtd/mtdblock.c b/drivers/mtd/mtdblock.c
index 32e52d83b961..a80809543793 100644
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -346,19 +346,7 @@ static struct mtd_blktrans_ops mtdblock_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init init_mtdblock(void)
-{
-	return register_mtd_blktrans(&mtdblock_tr);
-}
-
-static void __exit cleanup_mtdblock(void)
-{
-	deregister_mtd_blktrans(&mtdblock_tr);
-}
-
-module_init(init_mtdblock);
-module_exit(cleanup_mtdblock);
-
+module_mtd_blktrans(mtdblock_tr);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Nicolas Pitre <nico@fluxnic.net> et al.");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
