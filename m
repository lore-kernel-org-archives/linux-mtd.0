Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6325FA3742
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 11:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkDRHf4AZAvTqs8LADnQnVS+WTKQs7NTk98lrgrYf90=; b=48+1XQmYphfveF
	hSjEqYrAiSF203a0sfbRMBFWOecS8WExmREYCyxCk2T4UHRQ3cFtKi3kIXcz8UIgZPmGj0trXivQG
	OvHLa1OQKzu/KFj9HHNIoazs1rg3OzL2k0l0L/WS61eyEsY0bwwRkQCwH4jUvdUreMxEADNxmQThN
	L28qOFu+FFWMbpHIJHtT4aM0BgWuhCch6MUSi2rscmp4OCGANb4b4CSJ/2PoBGXueynhBotImNhKv
	XtOlPNi+eSC+aBX/LfmhSGv97wOVv3Ra0PsbUz3SkGIJYRYcNeHM53Tva3fK9QaG3P2Pw69fBfQCi
	jCqdeBVrv3U3cx/BR3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1Ji-00D50A-0G; Thu, 27 Oct 2022 11:44:58 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1Jd-00D4x4-9U
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 11:44:55 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MykKn3ZSVzJn9K;
	Thu, 27 Oct 2022 19:41:49 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 19:44:36 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <zhangxiaoxu5@huawei.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <dwmw2@infradead.org>
Subject: [PATCH 1/2] jffs2: Use function instead of macro when initialize compressors
Date: Thu, 27 Oct 2022 20:49:05 +0800
Message-ID: <20221027124906.143940-2-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221027124906.143940-1-zhangxiaoxu5@huawei.com>
References: <20221027124906.143940-1-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_044453_670445_679DC762 
X-CRM114-Status: GOOD (  10.46  )
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

The initialized compressors should be released if one of them
initialize fail, this is the pre-patch for fix the problem, use
function instead of the macro in jffs2_compressors_init() to
simplify the codes, no functional change intended.

Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 fs/jffs2/compr.c | 17 +----------------
 fs/jffs2/compr.h | 26 ++++++++++++++++++++------
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index 4849a4c9a0e2..afe74c65f1e4 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -365,19 +365,12 @@ void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig)
 int __init jffs2_compressors_init(void)
 {
 /* Registering compressors */
-#ifdef CONFIG_JFFS2_ZLIB
 	jffs2_zlib_init();
-#endif
-#ifdef CONFIG_JFFS2_RTIME
 	jffs2_rtime_init();
-#endif
-#ifdef CONFIG_JFFS2_RUBIN
 	jffs2_rubinmips_init();
 	jffs2_dynrubin_init();
-#endif
-#ifdef CONFIG_JFFS2_LZO
 	jffs2_lzo_init();
-#endif
+
 /* Setting default compression mode */
 #ifdef CONFIG_JFFS2_CMODE_NONE
 	jffs2_compression_mode = JFFS2_COMPR_MODE_NONE;
@@ -401,18 +394,10 @@ int __init jffs2_compressors_init(void)
 int jffs2_compressors_exit(void)
 {
 /* Unregistering compressors */
-#ifdef CONFIG_JFFS2_LZO
 	jffs2_lzo_exit();
-#endif
-#ifdef CONFIG_JFFS2_RUBIN
 	jffs2_dynrubin_exit();
 	jffs2_rubinmips_exit();
-#endif
-#ifdef CONFIG_JFFS2_RTIME
 	jffs2_rtime_exit();
-#endif
-#ifdef CONFIG_JFFS2_ZLIB
 	jffs2_zlib_exit();
-#endif
 	return 0;
 }
diff --git a/fs/jffs2/compr.h b/fs/jffs2/compr.h
index 5e91d578f4ed..3716b6b7924c 100644
--- a/fs/jffs2/compr.h
+++ b/fs/jffs2/compr.h
@@ -88,18 +88,32 @@ int jffs2_rubinmips_init(void);
 void jffs2_rubinmips_exit(void);
 int jffs2_dynrubin_init(void);
 void jffs2_dynrubin_exit(void);
+#else
+static inline int jffs2_rubinmips_init(void) { return 0; }
+static inline void jffs2_rubinmips_exit(void) {}
+static inline int jffs2_dynrubin_init(void) { return 0; }
+static inline void jffs2_dynrubin_exit(void) {}
 #endif
 #ifdef CONFIG_JFFS2_RTIME
-int jffs2_rtime_init(void);
-void jffs2_rtime_exit(void);
+extern int jffs2_rtime_init(void);
+extern void jffs2_rtime_exit(void);
+#else
+static inline int jffs2_rtime_init(void) { return 0; }
+static inline void jffs2_rtime_exit(void) {}
 #endif
 #ifdef CONFIG_JFFS2_ZLIB
-int jffs2_zlib_init(void);
-void jffs2_zlib_exit(void);
+extern int jffs2_zlib_init(void);
+extern void jffs2_zlib_exit(void);
+#else
+static inline int jffs2_zlib_init(void) { return 0; }
+static inline void jffs2_zlib_exit(void) {}
 #endif
 #ifdef CONFIG_JFFS2_LZO
-int jffs2_lzo_init(void);
-void jffs2_lzo_exit(void);
+extern int jffs2_lzo_init(void);
+extern void jffs2_lzo_exit(void);
+#else
+static inline int jffs2_lzo_init(void) { return 0; }
+static inline void jffs2_lzo_exit(void) {}
 #endif
 
 #endif /* __JFFS2_COMPR_H__ */
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
