Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64423C54E49
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:47:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C1E21775
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Iq/i8/Hh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hEl6rWsg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C1E21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=grwJ7cPafiy0lVZ1nD/r76+LXFEu86AOYmOTzgs5/EI=; b=Iq/i8/Hh/oKT/8
	WytbdgPe0/V3dPm1KbUEimDRFwfJOqJiIrWnUvSuaEQicRn8O+IfCnNLBKCSXOrdIv6oQcn9PPNec
	8p25e2WW2M7hiyWsGj5JMy7F4N5/9dMEn4yVCLAZhtXulY+pv4yduAVO05I2jsF5LrrVQjcY6KgI1
	CsrHriIaKVb0Vs7hSuUMKCvdAyzGDZKvPEqIpH7e83tYTlXQkXJG+vgipeUkc458bV+gcCgv2L+KV
	5PiBSnkZrLIxF9YpwhpebwH75P47NRc89iEDnFVgj05Zoy+fiLbvjs5fsclxj8G9vih7vHkIVP48a
	Xj9KYP1aTm2mhZZWSRsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXZBE-0007uf-PD; Sat, 09 May 2020 23:46:52 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXZBC-0007tk-7R
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 23:46:51 +0000
Received: by mail-pl1-x643.google.com with SMTP id s10so2311172plr.1
 for <linux-mtd@lists.infradead.org>; Sat, 09 May 2020 16:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/OyM5xWMsCxGKhpd57n8B6pYDT/bbNCXahzUEHyQHM=;
 b=hEl6rWsgGI5gElw0aUE/odwxzL2ZvqGO33b/PnrzxDJf5pz8m4nE6cMvPg9O3eZw4v
 kWwXWbwTpba7DXwtb3X8PVyVu/ms5Pc5MB7DdYKfPzYZ+cqI4rSynBUUaRpok34yeHug
 /OTMMd3FIF38Pv/p/ZggrIcEarV7883a3JO38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/OyM5xWMsCxGKhpd57n8B6pYDT/bbNCXahzUEHyQHM=;
 b=iiamrG6bmL00UJjBPAy5IjrNimlH7M+A2dqfqp0BGtDqZxrb4wnjLfpbhSKbrl9NQ0
 C8PGH5l6ie6/EdEMUUy/ze+M89R5WdIEuwEDnjKlUkc55lHmgD8Lq96OaepIe4ZpPjp9
 MblDrs71x6PaUFnY9mzN+urX/dRq+zFYj7YoAbUJcC/pb4YztpyEEvX1bCsmpeiFkpce
 xbdQ0Zz1D5a5S30XlPebq/tX7i8w2zEnInjBW3cI6phyLTUQIRAiFHT/Usl1JUXp91LN
 OSqMJN8nS8cYksFWNFrBNEkTT+eVTEt7lcGlKFu9Inay23b3BDDy6kuZiwzFjkLo4zzj
 AZMQ==
X-Gm-Message-State: AGi0PubxM2MhVAZyH8PIKx2+cBEhNSrxjJZz1rORhNLjsN2tu8N7dhJo
 sl00flY2ngu9BzlVZ6hNknDnwQ==
X-Google-Smtp-Source: APiQypKMTk+Db8R/TljPB2LFy2Oe3CFdrjNzI1wijISitcrWhwLAUAgNunD98TF1maMmXEhKS0COGw==
X-Received: by 2002:a17:90b:246:: with SMTP id
 fz6mr14475254pjb.138.1589068009793; 
 Sat, 09 May 2020 16:46:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 13sm5534768pfv.95.2020.05.09.16.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 16:46:49 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v6 18/18] pstore/blk: Introduce "best_effort" mode
Date: Sat,  9 May 2020 16:41:03 -0700
Message-Id: <20200509234103.46544-19-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_164650_288297_F77AD8D0 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Rob Herring <robh@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In order to use arbitrary block devices as a pstore backend, provide a
new module param named "best_effort", which will allow using any block
device, even if it has not provided a panic_write callback.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 3e67bd4557ea..b7c33ef4c646 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -51,6 +51,10 @@ static long ftrace_size = -1;
 module_param(ftrace_size, long, 0400);
 MODULE_PARM_DESC(ftrace_size, "ftrace size in kbytes");
 
+static bool best_effort;
+module_param(best_effort, bool, 0400);
+MODULE_PARM_DESC(best_effort, "use best effort to write (i.e. do not require storage driver pstore support, default: off)");
+
 /*
  * blkdev - the block device to use for pstore storage
  *
@@ -388,7 +392,7 @@ static int __register_pstore_blk(unsigned int major, unsigned int flags,
 		return PTR_ERR(binfo);
 
 	/* only allow driver matching the @blkdev */
-	if (!binfo->devt || MAJOR(binfo->devt) != major) {
+	if (!binfo->devt || (!best_effort && MAJOR(binfo->devt) != major)) {
 		pr_debug("invalid major %u (expect %u)\n",
 				major, MAJOR(binfo->devt));
 		return -ENODEV;
@@ -532,6 +536,19 @@ int pstore_blk_usr_info(struct pstore_blk_info *info)
 }
 EXPORT_SYMBOL_GPL(pstore_blk_usr_info);
 
+static int __init pstore_blk_init(void)
+{
+	int ret = 0;
+
+	mutex_lock(&pstore_blk_lock);
+	if (!pstore_zone_info && best_effort && blkdev[0])
+		ret = __register_pstore_blk(0, 0, NULL);
+	mutex_unlock(&pstore_blk_lock);
+
+	return ret;
+}
+late_initcall(pstore_blk_init);
+
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
