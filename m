Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AA9ECAAA1
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Oct 2022 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWko/tsFGBL3I7jFbRxxofW0SP44s2C7Tni4IDNXH38=; b=yH7LcR0Uct7tA5
	1YJb5Vunk4sXf6IDmdAWuy7iNtgegc3oOw3pb08wUbCOmVHk4j5338MHjlXL0i8ELBA9prLU2dTot
	n5ufMbh9e3sZLHKDr7qSjN5AGfoYJC231DDWoaI7+odXA/6w41PB4trFRQm6xJ9k51vwftXbtkWeF
	101L1V3rGPL0jNkyu1Hbu8vfTWePCySIXOF0lk7s6UmvuedwtsCzb3oaOy0mbmI7Es8X8am4ymsid
	5HR1VVNXT1D98KIAtnsKSZMOImjc64etrs6mfrFn4VWuC5q0UTnAKoQgtzQw0/kDoVx0s/Bq5GXCt
	u39XNE2eTK88BloZMXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1Jj-00D50O-I0; Thu, 27 Oct 2022 11:44:59 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo1Je-00D4xD-FA
	for linux-mtd@lists.infradead.org; Thu, 27 Oct 2022 11:44:56 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MykK24MnJzpW4d;
	Thu, 27 Oct 2022 19:41:10 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 19:44:37 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <zhangxiaoxu5@huawei.com>, <linux-mtd@lists.infradead.org>,
	<richard@nod.at>, <dwmw2@infradead.org>
Subject: [PATCH 2/2] jffs2: Fix list_del corruption if compressors initialized failed
Date: Thu, 27 Oct 2022 20:49:06 +0800
Message-ID: <20221027124906.143940-3-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221027124906.143940-1-zhangxiaoxu5@huawei.com>
References: <20221027124906.143940-1-zhangxiaoxu5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_044454_889688_3B698ACF 
X-CRM114-Status: GOOD (  12.30  )
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

There is a list_del corruption when remove the jffs2 module:

  list_del corruption, ffffffffa0623e60->next is NULL
  WARNING: CPU: 6 PID: 6332 at lib/list_debug.c:49 __list_del_entry_valid+0x98/0x130
  Modules linked in: jffs2(-) ]
  CPU: 6 PID: 6332 Comm: rmmod Tainted: G        W          6.1.0-rc2+ #5
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-1.fc33 04/01/2014
  RIP: 0010:__list_del_entry_valid+0x98/0x130
  ...
  Call Trace:
   <TASK>
   jffs2_unregister_compressor+0x3e/0xe0 [jffs2]
   jffs2_zlib_exit+0x11/0x30 [jffs2]
   jffs2_compressors_exit+0x1e/0x30 [jffs2]
   exit_jffs2_fs+0x16/0x44f [jffs2]
   __do_sys_delete_module.constprop.0+0x244/0x370
   do_syscall_64+0x35/0x80
   entry_SYSCALL_64_after_hwframe+0x46/0xb0

If one of the compressor initialize failed, the module always insert
success since jffs2_compressors_init() always return success, then
something bad may happen during remove the module.

For this scenario, let's insmod failed.

Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 fs/jffs2/compr.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/fs/jffs2/compr.c b/fs/jffs2/compr.c
index afe74c65f1e4..764f19dec3f0 100644
--- a/fs/jffs2/compr.c
+++ b/fs/jffs2/compr.c
@@ -364,12 +364,24 @@ void jffs2_free_comprbuf(unsigned char *comprbuf, unsigned char *orig)
 
 int __init jffs2_compressors_init(void)
 {
+	int ret = 0;
 /* Registering compressors */
-	jffs2_zlib_init();
-	jffs2_rtime_init();
-	jffs2_rubinmips_init();
-	jffs2_dynrubin_init();
-	jffs2_lzo_init();
+	ret = jffs2_zlib_init();
+	if (ret)
+		goto exit;
+	ret = jffs2_rtime_init();
+	if (ret)
+		goto exit_zlib;
+	ret = jffs2_rubinmips_init();
+	if (ret)
+		goto exit_rtime;
+	ret = jffs2_dynrubin_init();
+	if (ret)
+		goto exit_runinmips;
+	ret = jffs2_lzo_init();
+	if (ret)
+		goto exit_dynrubin;
+
 
 /* Setting default compression mode */
 #ifdef CONFIG_JFFS2_CMODE_NONE
@@ -389,6 +401,17 @@ int __init jffs2_compressors_init(void)
 #endif
 #endif
 	return 0;
+
+exit_dynrubin:
+	jffs2_dynrubin_exit();
+exit_runinmips:
+	jffs2_rubinmips_exit();
+exit_rtime:
+	jffs2_rtime_exit();
+exit_zlib:
+	jffs2_zlib_exit();
+exit:
+	return ret;
 }
 
 int jffs2_compressors_exit(void)
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
