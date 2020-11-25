Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E085AC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 07:13:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3068820857
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 07:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pWU2ZvY/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3068820857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HkX6zxg1m10LKNz18cuH92rxdgq+0kKsric45pBcV7s=; b=pWU2ZvY/rEMNDfJMWvq5iV2d7R
	yE9XZjjYGO6T9rm+MrpWQIJOqmpuCLfkl2IMpAwFGxr2gZa+CjKjtkakcZBIvFdPyrD9troOGT7jh
	hOGCCs8QbbPE3ngzRaIULxQR/6+Ogz25+ckL2sOEd7ggIpxq/pGrEUS8QGHqP3tbrpAwwPlOGf2tV
	e/u6KERr5ti4cP5ouEVfyFYZcbXWBv34U20kFHFh4opD1nd899bZv10BA4u2h77ro1QCK2DEtA2n8
	mG/BfbqDq/9CPMy3cIFWbVO6E/QItZlLoMN+ML8ykIr8oydM+cSK3omZw0CP6SwW5S38eovuvnYgH
	EYwalU4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khoy8-0005fS-8g; Wed, 25 Nov 2020 07:12:00 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khoy4-0005eG-4Y
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 07:11:59 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CgsWK6J12zhgy5;
 Wed, 25 Nov 2020 15:11:25 +0800 (CST)
Received: from DESKTOP-8N3QUD5.china.huawei.com (10.67.101.227) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 15:11:35 +0800
From: Guohua Zhong <zhongguohua1@huawei.com>
To: <patrick@baymotion.com>, <joern@lazybastard.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: [PATCH v2] phram: Allow the user to set the erase page size.
Date: Wed, 25 Nov 2020 15:11:32 +0800
Message-ID: <20201125071132.39988-1-zhongguohua1@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.67.101.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_021158_330829_3EEB90E9 
X-CRM114-Status: GOOD (  18.41  )
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
Cc: nixiaoming@huawei.com, wangle6@huawei.com, young.liuyang@huawei.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Permit the user to specify the erase page size as a parameter.
This solves two problems:

- phram can access images made by mkfs.jffs2.  mkfs.jffs2 won't
create images with erase sizes less than 8KiB; many architectures
define PAGE_SIZE as 4KiB.

- Allows more effective use of small capacity devices.  JFFS2
needs somewhere between 2 and 5 empty pages for garbage collection;
and for an NVRAM part with only 32KiB of space, a smaller erase page
allows much better utilization in applications where garbage collection
is important.

Signed-off-by: Patrick O'Grady <patrick@baymotion.com>
Reviewed-by: Joern Engel <joern@logfs.org>
Link: https://lore.kernel.org/lkml/CAJ7m5OqYv_=JB9NhHsqBsa8YU0DFRoP7C+W10PY22wonAGJK=A@mail.gmail.com/
[Guohua Zhong: fix token array index out of bounds and update patch for kernel master branch]
Signed-off-by: Guohua Zhong <zhongguohua1@huawei.com>
Reported-by: kernel test robot <lkp@intel.com>

-------
v2:
 fix build error which is reported by kernel test robot

v1: https://lore.kernel.org/lkml/20201124061053.10812-1-zhongguohua1@huawei.com/
 1.fix token array index out of bounds
 2.update patch for kernel master branch
---
 drivers/mtd/devices/phram.c | 52 +++++++++++++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index 087b5e86d1bf..1729b94b2abf 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -6,14 +6,14 @@
  * Usage:
  *
  * one commend line parameter per device, each in the form:
- *   phram=<name>,<start>,<len>
+ *   phram=<name>,<start>,<len>[,<erasesize>]
  * <name> may be up to 63 characters.
- * <start> and <len> can be octal, decimal or hexadecimal.  If followed
+ * <start>, <len>, and <erasesize> can be octal, decimal or hexadecimal.  If followed
  * by "ki", "Mi" or "Gi", the numbers will be interpreted as kilo, mega or
- * gigabytes.
+ * gigabytes. <erasesize> is optional and defaults to PAGE_SIZE.
  *
  * Example:
- *	phram=swap,64Mi,128Mi phram=test,900Mi,1Mi
+ *	phram=swap,64Mi,128Mi phram=test,900Mi,1Mi,64Ki
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -26,6 +26,7 @@
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/mtd/mtd.h>
+#include <asm/div64.h>
 
 struct phram_mtd_list {
 	struct mtd_info mtd;
@@ -88,7 +89,7 @@ static void unregister_devices(void)
 	}
 }
 
-static int register_device(char *name, phys_addr_t start, size_t len)
+static int register_device(char *name, phys_addr_t start, size_t len, uint32_t erasesize)
 {
 	struct phram_mtd_list *new;
 	int ret = -ENOMEM;
@@ -115,7 +116,7 @@ static int register_device(char *name, phys_addr_t start, size_t len)
 	new->mtd._write = phram_write;
 	new->mtd.owner = THIS_MODULE;
 	new->mtd.type = MTD_RAM;
-	new->mtd.erasesize = PAGE_SIZE;
+	new->mtd.erasesize = erasesize;
 	new->mtd.writesize = 1;
 
 	ret = -EAGAIN;
@@ -204,22 +205,23 @@ static inline void kill_final_newline(char *str)
 static int phram_init_called;
 /*
  * This shall contain the module parameter if any. It is of the form:
- * - phram=<device>,<address>,<size> for module case
- * - phram.phram=<device>,<address>,<size> for built-in case
- * We leave 64 bytes for the device name, 20 for the address and 20 for the
- * size.
- * Example: phram.phram=rootfs,0xa0000000,512Mi
+ * - phram=<device>,<address>,<size>[,<erasesize>] for module case
+ * - phram.phram=<device>,<address>,<size>[,<erasesize>] for built-in case
+ * We leave 64 bytes for the device name, 20 for the address , 20 for the
+ * size and 20 for the erasesize.
+ * Example: phram.phram=rootfs,0xa0000000,512Mi,65536
  */
-static char phram_paramline[64 + 20 + 20];
+static char phram_paramline[64 + 20 + 20 + 20];
 #endif
 
 static int phram_setup(const char *val)
 {
-	char buf[64 + 20 + 20], *str = buf;
-	char *token[3];
+	char buf[64 + 20 + 20 + 20], *str = buf;
+	char *token[4];
 	char *name;
 	uint64_t start;
 	uint64_t len;
+	uint64_t erasesize = PAGE_SIZE;
 	int i, ret;
 
 	if (strnlen(val, sizeof(buf)) >= sizeof(buf))
@@ -228,7 +230,7 @@ static int phram_setup(const char *val)
 	strcpy(str, val);
 	kill_final_newline(str);
 
-	for (i = 0; i < 3; i++)
+	for (i = 0; i < 4; i++)
 		token[i] = strsep(&str, ",");
 
 	if (str)
@@ -253,11 +255,25 @@ static int phram_setup(const char *val)
 		goto error;
 	}
 
-	ret = register_device(name, start, len);
+	if (token[3]) {
+		ret = parse_num64(&erasesize, token[3]);
+		if (ret) {
+			parse_err("illegal erasesize\n");
+			goto error;
+		}
+	}
+
+	if (len == 0 || erasesize == 0 || erasesize > len
+	    || erasesize > UINT_MAX || do_div(len, (uint32_t)erasesize) != 0) {
+		parse_err("illegal erasesize or len\n");
+		goto error;
+	}
+
+	ret = register_device(name, start, len, (uint32_t)erasesize);
 	if (ret)
 		goto error;
 
-	pr_info("%s device: %#llx at %#llx\n", name, len, start);
+	pr_info("%s device: %#llx at %#llx for erasesize %#llx\n", name, len, start, erasesize);
 	return 0;
 
 error:
@@ -298,7 +314,7 @@ static int phram_param_call(const char *val, const struct kernel_param *kp)
 }
 
 module_param_call(phram, phram_param_call, NULL, NULL, 0200);
-MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>\"");
+MODULE_PARM_DESC(phram, "Memory region to map. \"phram=<name>,<start>,<length>[,<erasesize>]\"");
 
 
 static int __init init_phram(void)
-- 
2.12.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
