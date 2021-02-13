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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78929C433E6
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368A261494
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368A261494
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lKnA528aqH5PWuqCQzBYy2CHJJPXcPhSS3+xomQ9vs=; b=acgL5ytYugxy1s+55rgKH5TlL
	AuMQRyVq174fu8WS8BLYL1wfsaZsSlt8BYkDWtz1Pedsuqae9gOjNB5pApDBvtzaSGPtp49xw6FDN
	IhgArS52QZiePvrLjsQYlEVTXBLLnAggiPc6P+C8/o9Y+miDYt6glpmvR5j2tfmyWPXCvP7SzwtJe
	deozjTeuhAasAe8l6PLqpmun2BW7AMchbuNcQpQcz8jPRKhQKdjZGVys/1o05Ai2L3CNlxMk6kq7i
	TiTMoJWZulvKeRkrUUpAenf2/cNBNyF7M8VR7fCbDl+ByBzu+ZJnvL/IDi/H2Z1CJK4MUd7MZsBVx
	rUF43vIJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy4c-0004rv-NL; Sat, 13 Feb 2021 16:47:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4a-0004rJ-Qv
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:47:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id z68so1713676pgz.0
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hd0XeNcDl34Bc3bSJsO4EUPKljKLsAj3/6PQiNsgU6E=;
 b=p9HYM9P0+l3KL3Iy6Ya7fPNHzAfYI1cc22dSsIUoszUtQP984ZBMaCzFgB8my8CpqK
 0HDzjsKw2x/j/4BurkPP3F+ICE0RtblzncPim57aaD2rA3si3ahrAqDnguLJE9IeCmSS
 gYl/gdxDqc24OUjlF1gCHifSJmVbBDdQJTES7Celv3V0sF9XCkJeICFHkmqzKXgs/4H+
 Gpn/WDfOIo1SWoINIO/p/W7p3td6+aH1P5KEd2TaRIW0VT26hW17lG8F2ST6kXKAwwgd
 T7IIOjXBsUd2k1B3qYSnlD6mFg4HMwqZkS/rZkikKRQi6i5q7ZyjYkjPct0rg3rt2zGy
 wMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hd0XeNcDl34Bc3bSJsO4EUPKljKLsAj3/6PQiNsgU6E=;
 b=bGCfKR+tHV83UzHgFoL/kgH8GJ/kH9qdNssEPimab1uMBIJunAoVzRFpLBNk8TKDuF
 t/Hdj6EUyNw3up6WKPEg8H18GthS39XjEv4RX/nqHCFH5x1r2r/mi4DjqWKsAyGdQPhF
 hE4OOS8EjYwmFBSoUtLtBy8IdaD1YlZGVzYE7F7Uu0pLOr4vs6HyF6zQ3CylBWgv2u2V
 bdmdtcq00R14dJRJuPgI7o4HApOYQ3TmA6MLvowWTnk5bbLt1760Q1y8snf/VnkEtQom
 vB5LOsHTIUH9ZdS7Hu6MdbhYluwWVHnJrWZcsWtfeU4ECBIodmoOvTBRaxt3vC9cXbLt
 xEmQ==
X-Gm-Message-State: AOAM531RbDNdIyih90sK9VzHsdZaFPems31i7fw+7WxVuMIGhvn8xUeu
 49eFNBiBejXdQLoCTWtrbYg=
X-Google-Smtp-Source: ABdhPJx/juqQWWNmEy194K6ggF8hqEloAQt1XRk/1ChVGfjBVKZNgG2nkPowP7oXney+1gc9y4uFZw==
X-Received: by 2002:a63:555b:: with SMTP id f27mr7996694pgm.365.1613234827142; 
 Sat, 13 Feb 2021 08:47:07 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id 137sm6890590pgb.80.2021.02.13.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:47:06 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 5/8] mtd: mtdblock_ro: Use module_mtd_blktrans to
 register driver
Date: Sun, 14 Feb 2021 00:45:57 +0800
Message-Id: <20210213164600.409061-6-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114708_918115_28CB2601 
X-CRM114-Status: GOOD (  11.62  )
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
 drivers/mtd/mtdblock_ro.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mtd/mtdblock_ro.c b/drivers/mtd/mtdblock_ro.c
index 7fcf29ef2bdc..d92914f73d52 100644
--- a/drivers/mtd/mtdblock_ro.c
+++ b/drivers/mtd/mtdblock_ro.c
@@ -67,18 +67,7 @@ static struct mtd_blktrans_ops mtdblock_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init mtdblock_init(void)
-{
-	return register_mtd_blktrans(&mtdblock_tr);
-}
-
-static void __exit mtdblock_exit(void)
-{
-	deregister_mtd_blktrans(&mtdblock_tr);
-}
-
-module_init(mtdblock_init);
-module_exit(mtdblock_exit);
+module_mtd_blktrans(mtdblock_tr);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
