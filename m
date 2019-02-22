Return-Path: <SRS0=6jNp=Q5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3EFC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 12:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4456A2075C
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Feb 2019 12:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xr6w9xyf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dd-wrt.com header.i=@dd-wrt.com header.b="VlQSJWjj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4456A2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dhAM+u8brNRcO2/bdDzCJSEsG5BEuZSHrppdewDoFVc=; b=Xr6w9xyf24aQFX
	ivGPBdoDBwxA+6mUn1eJ5x+D7vK/FPUdmLqFi2vKJieynBLZqhtTEVyasybaB8aV/zftYQqZdDy1G
	SuZ8lQY/ICP8NNNMneDMhkZGAGPuF6DBEhd7TOCvXCw4vWuXWPKwJiJJ1Sn3ohJGfpSOiOx24QRbZ
	Rw3AfSWM1RbK7VdooSUW4qslzTFUGkbAL7UkLWJzzPf+c/H2ktliqTUmWAq5MmLIT8Uc7Hpj0zRWL
	RCAqnXIwc6Lurk0+2shb0ml4GVAwK1TwHbTK8MphvqGbNXnT0iavdDzpc6kEJP14HzkYJpJlnU7RV
	dsFwZk5HBULGlCK87lsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxA09-0007Gt-71; Fri, 22 Feb 2019 12:32:25 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gx9zy-00070j-Au
 for linux-mtd@lists.infradead.org; Fri, 22 Feb 2019 12:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To:From;
 bh=2ZzPtV8iDVWJQYmMbjRTt219T5Lo+NS6U++rx8ZOZ/U=; 
 b=VlQSJWjjbvYaWc7Wlfr2dyHSfnhrOYTIE7fyV/PsjYWSuhoga3U53BWZpWxXlcEOh/EIQ0X690yQaR3otNC2T6Mb1sscCVADlk5SkLCvfIyXsCTEPHk9Js+P6nrCDAyb1AKuxJSKJhBIbq9VnFd1LDEyM/hes0qEi+FkVR+kGW8=;
From: Daniel Danzberger <daniel@dd-wrt.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 22 Feb 2019 13:32:05 +0100
Message-Id: <20190222123205.20015-1-daniel@dd-wrt.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a05:a1c7:1:b101:9989:7e12:a435:a219
X-SA-Exim-Mail-From: daniel@dd-wrt.com
Subject: [PATCH] mtdram: Add module parameter name.
X-SA-Exim-Version: 4.2.1 (built Thu, 26 May 2011 15:22:33 +0200)
X-SA-Exim-Scanned: Yes (on webmail.newmedia-net.de)
X-NMN-MailScanner-Information: Please contact the ISP for more information
X-NMN-MailScanner-ID: 1gx9zw-0002md-0u
X-NMN-MailScanner: Found to be clean
X-NMN-MailScanner-From: daniel@dd-wrt.com
X-Received: from [2a05:a1c7:1:b101:9989:7e12:a435:a219]
 (helo=lappi.newmedia-net.de)
 by webmail.newmedia-net.de with esmtpa (Exim 4.72)
 (envelope-from <daniel@dd-wrt.com>)
 id 1gx9zw-0002md-0u; Fri, 22 Feb 2019 13:32:12 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_043215_605339_2B641717 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Daniel Danzberger <daniel@dd-wrt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This parameter will overwrite the default name "mtdram test device", when set.

Signed-off-by: Daniel Danzberger <daniel@dd-wrt.com>
---
 drivers/mtd/devices/mtdram.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 46238796145f..1a8ec3756a1d 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -18,6 +18,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/mtdram.h>
 
+static char name[32] = "mtdram test device";
 static unsigned long total_size = CONFIG_MTDRAM_TOTAL_SIZE;
 static unsigned long erase_size = CONFIG_MTDRAM_ERASE_SIZE;
 static unsigned long writebuf_size = 64;
@@ -31,6 +32,8 @@ module_param(erase_size, ulong, 0);
 MODULE_PARM_DESC(erase_size, "Device erase block size in KiB");
 module_param(writebuf_size, ulong, 0);
 MODULE_PARM_DESC(writebuf_size, "Device write buf size in Bytes (Default: 64)");
+module_param_string(name, name, sizeof(name) - 1, 0);
+MODULE_PARM_DESC(name, "Device name");
 #endif
 
 // We could store these in the mtd structure, but we only support 1 device..
@@ -170,7 +173,7 @@ static int __init init_mtdram(void)
 		mtd_info = NULL;
 		return -ENOMEM;
 	}
-	err = mtdram_init_device(mtd_info, addr, MTDRAM_TOTAL_SIZE, "mtdram test device");
+	err = mtdram_init_device(mtd_info, addr, MTDRAM_TOTAL_SIZE, name);
 	if (err) {
 		vfree(addr);
 		kfree(mtd_info);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
