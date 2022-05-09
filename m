Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63398C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5uQe8WIzCfIYFXMTmXKiQmIbncAdu3w5I/Q/pbstZ4=; b=OEmBo5eBB6PjKn
	5vTdH3HTtw9YYMZCk6yo2RM4o4/jJmhn9AbLryJSagIq25LOHvwHM1ayeiP76ttOaQhgcttkrHpkQ
	n+01Am4OMfPbkyJfSmP+rfFsiSC11XUEPgKHGDw2QXVzsMa+yMHybkJKU7MnR+hZZmjv/z9dyMARI
	8TxaADcoD61Go4xBGnLi9uUdqajV6Me5szcvbBvMdQ1T+rbO0zB2S9G9NgmHdHv2Kk+152tGf7U4C
	iHUjBrJGbojUedh+zTlweLw3v5u1cg6d2JEyzGITdK4b6rjNcOp2FI76vjXYfXYO+9fa9u5nLfi5i
	1b0YBa8a2URyR5RJGKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no6Ao-00FMen-BI; Mon, 09 May 2022 16:23:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no6Ai-00FMZ8-Uk
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 16:23:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C5C1B817E3;
 Mon,  9 May 2022 16:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D49C385AC;
 Mon,  9 May 2022 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652113423;
 bh=FwXO3JACkg3sY4dA/R+BvoEHsuUOyXZesgC8uLp382Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r8uSniqMZqOXFG9O7Nk2Dk2ArAW8XkksmnqlDJ+zFtLseUC0uM5wlwP6iQjVnEUtb
 GU09qu8I4chB+Kewwt7nmV0MfK05y2oikCySLw8TWXbzQr5n+xtn0KvG7XLB/bmXwj
 TkHu5PCrY6eiG+FiEAE2VTaeC+E+9FaXtfyxaWrGUAtmZP960adBkqjgORqnmAfVUz
 hXG1Rnt1WpNyLI+GVin684xH/TzgevDgdIbp1DdQ8r8T5QG7tcOcJ5rC6OV7VXjS/8
 TKGQZfVWW9yu9QzUI//IXm4wuqGyWWbGwv0Id5li44ruIR51jpCJuuWJzKhDBGmyON
 8mpI+NeW9WMXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1no6Ae-006xVX-Jf; Mon, 09 May 2022 18:23:40 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@linux.ie>,
 "Greg KH" <gregkh@linuxfoundation.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Kai Vehmanen" <kai.vehmanen@intel.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@intel.com>,
 "Takashi Iwai" <tiwai@suse.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
 mauro.chehab@linux.intel.com
Subject: [PATCH v6 3/4] module: set holders when symbol_get() is used
Date: Mon,  9 May 2022 18:23:38 +0200
Message-Id: <e8058ca7a0b84479f4075654cecff811916639ce.1652113087.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652113087.git.mchehab@kernel.org>
References: <cover.1652113087.git.mchehab@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_092345_290796_596DC510 
X-CRM114-Status: GOOD (  19.84  )
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

Some Kernel modules use symbol_get() or symbol_request() in order
to bind into other drivers. That's the case, for instance, of
media dvb drivers that hook the frontend drivers via I2C using
dvb_attach() macro.

When such bindings happen, one needs first to unload/unbind the
driver that got the symbol before being able to unload/unbind the
module that contains the needed symbol.

Add a logic to document it via /proc/modules and via lsmod.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v6 0/4] at: https://lore.kernel.org/all/cover.1652113087.git.mchehab@kernel.org/

 drivers/mtd/chips/gen_probe.c           | 4 ++--
 include/linux/module.h                  | 4 ++--
 kernel/module/main.c                    | 3 ++-
 samples/hw_breakpoint/data_breakpoint.c | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/gen_probe.c b/drivers/mtd/chips/gen_probe.c
index 4d4f97841016..f1e97633ac09 100644
--- a/drivers/mtd/chips/gen_probe.c
+++ b/drivers/mtd/chips/gen_probe.c
@@ -208,10 +208,10 @@ static inline struct mtd_info *cfi_cmdset_unknown(struct map_info *map,
 	if (!probename)
 		return NULL;
 
-	probe_function = __symbol_get(probename);
+	probe_function = __symbol_get(probename, THIS_MODULE);
 	if (!probe_function) {
 		request_module("cfi_cmdset_%4.4X", type);
-		probe_function = __symbol_get(probename);
+		probe_function = __symbol_get(probename, THIS_MODULE);
 	}
 	kfree(probename);
 
diff --git a/include/linux/module.h b/include/linux/module.h
index a66b9be92ef5..07a77c2618b5 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -298,8 +298,8 @@ struct notifier_block;
 
 extern int modules_disabled; /* for sysctl */
 /* Get/put a kernel symbol (calls must be symmetric) */
-void *__symbol_get(const char *symbol);
-#define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x))))
+void *__symbol_get(const char *symbol, struct module *this);
+#define symbol_get(x) ((typeof(&x))(__symbol_get(__stringify(x), THIS_MODULE)))
 
 /* modules using other modules: kdb wants to see this. */
 struct module_use {
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 6044aeba0f18..ec1baa67d6e7 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1259,7 +1259,7 @@ static void free_module(struct module *mod)
 #endif
 }
 
-void *__symbol_get(const char *symbol)
+void *__symbol_get(const char *symbol, struct module *this)
 {
 	struct find_symbol_arg fsa = {
 		.name	= symbol,
@@ -1273,6 +1273,7 @@ void *__symbol_get(const char *symbol)
 		return NULL;
 	}
 	preempt_enable();
+	ref_module_dependency(fsa.owner, this);
 	return (void *)kernel_symbol_value(fsa.sym);
 }
 EXPORT_SYMBOL_GPL(__symbol_get);
diff --git a/samples/hw_breakpoint/data_breakpoint.c b/samples/hw_breakpoint/data_breakpoint.c
index 418c46fe5ffc..30b3261a894b 100644
--- a/samples/hw_breakpoint/data_breakpoint.c
+++ b/samples/hw_breakpoint/data_breakpoint.c
@@ -41,7 +41,7 @@ static int __init hw_break_module_init(void)
 {
 	int ret;
 	struct perf_event_attr attr;
-	void *addr = __symbol_get(ksym_name);
+	void *addr = __symbol_get(ksym_name, THIS_MODULE);
 
 	if (!addr)
 		return -ENXIO;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
