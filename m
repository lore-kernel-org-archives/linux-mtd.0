Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19C4C54E8A
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A971F206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tVulOBYn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vu8u0y3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A971F206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3kiE2+4AVCOi3ZPLMTXEGnf9JMiNEWyv7VVqRQt8r0=; b=tVulOBYntXt0Ry
	ioTb+UYj7uhQPmwHUJ3aYlx55hIDvfgTZd714MHqW1OoZVf5HT6Al/k77lIlL+bb6o8eha7Qgbgdq
	ZPNoFZWE9seKZ7+zhyVxseDX0KL/W3I1WfS33uJF6NJw3MH4/wmnVsPO7+HtQqeiT49JDys86S63d
	UXLtIbBiAsyEVVBrhRz40WOv7fCrKOiCHyHDA5AXuHJqAxMZQEXqXLNPIRLVMUb1Vm/vZBZmTQlwC
	ZOsDjRpFx3I9JzyZrmLFD1CAjzv6bri7VoFHJ04sGIPacGfmFR5X93hK2HyHNspkIcWHMKCKSIGki
	i9WRV0L1STsgxx+0ypjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsVV-0002lG-Qz; Sun, 10 May 2020 20:25:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsVA-0002QC-8c
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:24:45 +0000
Received: by mail-pl1-x643.google.com with SMTP id k19so3018955pll.9
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 13:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
 b=Vu8u0y3g/EsMOqGf92rFyvezCvoeKBq6M4OIMjHDXZQuVY5ATlo2kh28eB6tVdSW2u
 HeG9wciptveXO5MHRNtJSHj4Ogkp9s7OktTbZhn/Vvp42lUU1KrIa9rIQ0bGpNOCOKeO
 EC9TBt8Z9Lh9M/kLz05YI4DHvIcGjrjtQpGgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
 b=scamXIdJqtt2MMUTEwFItXLKmNn+h2LPPKO31mAp2LgbZwgDb33CUYpVR6IoXr1z/L
 apblwthpV3/O8+6aFGUw5sS84tzZWURGSKRuk1Nfdl4wQclh5t98V1+rli7htbn+NvRR
 M9kd/+e8Ups/mnCSwZDfZvKb8PLz34Lh51zUeUUqdzdHDZAYO58+FuxVjg9Yy3nLhXe7
 uHVorAt2VHGw/LDYu40YNfYtm5GB1lgAS2RKXa1fMF/l6PsmtQuXg3yloT8bmGZGXPd2
 j2XraNRQIyMC0GaSeOLqSFs42a9C6wTk3MusoPstoi8pVsYghW1kJ+K2T2dzsNoPUTtd
 484A==
X-Gm-Message-State: AGi0PubzktYvy6T8n5XMEhf1d4ImU+t98x87qf6EUzR4M6OaL976G0mL
 NT7IFlccXOUfUKoVIYQeFtk1/w==
X-Google-Smtp-Source: APiQypL4ftL5PXuI6WbPG1D/aF+OyzdmBrwXgZqbvh107ELfxtW4oGZxzd33g34wmpY9M28zk4hvsQ==
X-Received: by 2002:a17:90b:374e:: with SMTP id
 ne14mr17664828pjb.145.1589142283365; 
 Sun, 10 May 2020 13:24:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id y6sm7866882pjw.15.2020.05.10.13.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 13:24:41 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v7 02/18] pstore/platform: Switch pstore_info::name to const
Date: Sun, 10 May 2020 13:24:20 -0700
Message-Id: <20200510202436.63222-3-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_132444_300778_35AC4606 
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

In order to more cleanly pass around backend names, make the "name" member
const. This means the module param needs to be dynamic (technically, it
was before, so this actually cleans up a minor memory leak if a backend
was specified and then gets unloaded.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c   | 3 ++-
 include/linux/pstore.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index b882919b8784..e7bf22f01928 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -626,7 +626,7 @@ int pstore_register(struct pstore_info *psi)
 	 * Update the module parameter backend, so it is visible
 	 * through /sys/module/pstore/parameters/backend
 	 */
-	backend = psi->name;
+	backend = kstrdup(psi->name, GFP_KERNEL);
 
 	pr_info("Registered %s as persistent store backend\n", psi->name);
 
@@ -669,6 +669,7 @@ void pstore_unregister(struct pstore_info *psi)
 	free_buf_for_compression();
 
 	psinfo = NULL;
+	kfree(backend);
 	backend = NULL;
 	mutex_unlock(&psinfo_lock);
 }
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index 16a1fdafc167..eb93a54cff31 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -176,7 +176,7 @@ struct pstore_record {
  */
 struct pstore_info {
 	struct module	*owner;
-	char		*name;
+	const char	*name;
 
 	struct semaphore buf_lock;
 	char		*buf;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
