Return-Path: <SRS0=RcjP=YD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9B5C4360C
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 13:58:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F454208C3
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 13:58:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oxag9ftw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC/XV+18"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F454208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+DHurrpa0bwj61OlGq/2lERHH07jQW7gVzzY+1JOq60=; b=oxa
	g9ftwPTtmasbGHNlaVIdzivAPiVlbZJv+W3LFfUekU8rDXB/WXVbLd/wuEML0j7K6pIIU2KyIuYUD
	26j5B1R8Rctw0t9D/lpo1GVas88VF4Z9fx11rxMPw47LvlmMcDb02RpB4CKYHTQlS26a/SqAGrpA6
	5lbWhGZ9CTYv3xISjVu8RyAhKbI1fPq+P6t3KFWvl/evJ33MXI5rOJAMA36EdzL3b3jLj2w1GzZPC
	L0gtzxJ6H3ITmHVlhXzF+51K5kH+XdfsmVFLHrFNPZm09EltxRt9kHh34xzUlXPUv/A43A3SgbPQU
	iJRV6PILdD5Ikfz3ItRhw8TPz6SDl+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iIYxc-00039q-Js; Thu, 10 Oct 2019 13:58:32 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iIYxZ-00039G-PQ
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2019 13:58:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id z12so3728013pgp.9
 for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2019 06:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lYhH0LhqbaaCqPvzQECTErqO/n6x+8fxYPTtkfuF5nc=;
 b=BC/XV+18pfXBfiKPMugpZLBYfkXW6VdNQ5qg6f4xeK3k3Pkoi6UYM7UNl5zmS1Zhaf
 9UdOf/5lKg5VzuBn+2C3LSlgQiQz7OIxyV0xpvFiIDNZCDve9eNp5m91zCK0krGIFSw1
 x33b/ClbyCOK8kbQ0f4suVrNLIwD0T9IdjGGqLxiJ1+ISE1fLw2tfr3Tnd6zn6k1ylXN
 5GH8YcMcIT0s/XPJpR+ARfDynztK5wVJSm4e/WR57vmm4NgpQ0hAE8CeuI0BcQ9fO9M8
 mZ0ofIOB4+hpppkniBAzkVPzj5Bl4hPntSu6i9OjT6e/GOomRBctmf0GzzgpxQG1Hzsc
 BRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lYhH0LhqbaaCqPvzQECTErqO/n6x+8fxYPTtkfuF5nc=;
 b=PiaL03DsO2w4E+tWudcOBiuXoYqbuodCxoO05GeIwWu44Um3IT8jRv74MRugf+LfCZ
 3pO4iQ7YcEt9Fv6bPuA1qVz1nIonndk03Uc5fvee4FHx0fvAcH6EU61ogMDXh8TB+IWd
 OaD9z7HUJm6lzNTYLhxItCdbswPLi3Or8wtqxCmo5V5AnpfekIO02uiybZVTOtsrFcU0
 5Z17VwRA3GHwtdb0/tQ6TY0nkchewoK+2AEZJt+LgvuH8hL13YzeFaMlemszewuPQiZB
 bq8FIrLrRybshvnfQuSj5lMTAd5YUa9gQe+tgsG13btdKoMXBhS1Z2e/6yNdmLikB4lO
 AyNA==
X-Gm-Message-State: APjAAAVobBLg3WRR3xHB7/3ho4mNjNkeb69sqynKwPhWUaDTxYR7eKPy
 HWlZLaGloxsM5yJ1u6tZhME=
X-Google-Smtp-Source: APXvYqyR8QeCaeGE//rK0N9nzobokZvJPylfXCJvsurrYX8lFWpSqUDVdPzmgNZe+IVX99thk2ifOw==
X-Received: by 2002:a17:90a:2ec5:: with SMTP id
 h5mr11689675pjs.87.1570715909114; 
 Thu, 10 Oct 2019 06:58:29 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id b14sm6040303pfi.95.2019.10.10.06.58.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:58:28 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v3] mtd: maps: l440gx: Avoid printing address to dmesg
Date: Thu, 10 Oct 2019 21:58:09 +0800
Message-Id: <20191010135809.11932-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_065829_826132_4F2E03B1 
X-CRM114-Status: GOOD (  14.58  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Avoid printing the address of l440gx_map.virt every time l440gx init.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v3:
  -- use pr_debug instead of printk(KERN_DEBUG)

 drivers/mtd/maps/l440gx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/l440gx.c b/drivers/mtd/maps/l440gx.c
index 876f12f40018..0eeadfeb620d 100644
--- a/drivers/mtd/maps/l440gx.c
+++ b/drivers/mtd/maps/l440gx.c
@@ -86,7 +86,7 @@ static int __init init_l440gx(void)
 		return -ENOMEM;
 	}
 	simple_map_init(&l440gx_map);
-	printk(KERN_NOTICE "window_addr = 0x%08lx\n", (unsigned long)l440gx_map.virt);
+	pr_debug("window_addr = %p\n", l440gx_map.virt);
 
 	/* Setup the pm iobase resource
 	 * This code should move into some kind of generic bridge
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
