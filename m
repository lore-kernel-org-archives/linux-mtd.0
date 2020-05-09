Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7C7C47255
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4BE4217BA
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXUPjeSV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PA3J3jqx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4BE4217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3kiE2+4AVCOi3ZPLMTXEGnf9JMiNEWyv7VVqRQt8r0=; b=QXUPjeSVYAcbGo
	IhOHquZg94LWUskVifM7Zi/lwevcdYwsz1Q3Q25LOxXItsmICtVzRfDF8vmOjgJzypkbGhF9KAcho
	2cUiOF5wpy6p7eXdCWR8OeTuBel51BHGKUGJSwggNT8bYQMi9GK5TC0gGuyFdW37AqIKQ6FoR4YO7
	WPnum1Ma9tuJNJoELX3BRu4IH7AqkSFshlxX+6iBIsbBvS1zYb8S28emxYXjzbJF+aGhmTG6MsNTy
	DGM41hpn5BfPin2LOYsvLIb/hCl+4m/xOgXl/jWrQ9C+rqckkykgPwiXDvXd5o71V7TpTngz5eCXI
	/Usw0+XrYOnzWpLuHBFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXZ6U-0001wV-Pp; Sat, 09 May 2020 23:41:58 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXZ5i-0001A3-Np
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 23:41:12 +0000
Received: by mail-pj1-x1044.google.com with SMTP id e6so5919009pjt.4
 for <linux-mtd@lists.infradead.org>; Sat, 09 May 2020 16:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
 b=PA3J3jqxZhR7QLeqwjId3MPNynQJYjylfFHuFHDO93eKIYh0iQYwhqZLfhDgt0tNPx
 NxHMmZui4QlIyuKxLjsRMXG4PNIvSBqEGu3OoFLfiibivil4eA41JBZI/UtGxAjYryLj
 xFanC6zXk4byjitJUGh5BrMI4F3rjAjk6STjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6bXV7bt3FJwO+6h7hS9wdbWbj+cKT2R8klgQdvy5V4=;
 b=nLhGH9fIR8OEPbQEN9R51qKs7Il52Cl+r7L700J1B2y4co5B5FdUKVEWPIXr2gMdpZ
 PlQ5dlf4VDMGQzZsp/st5vizckyYyVOQPUSfKNBaCyXktY0dARxJy8ODcQc8o+DekU55
 KG/rYB9wT3QWxBMKVlgwv7ODOv0H188HCK8pn/aCL2n0CSIxmZ4gLzVMeJvuFxv0z5Hy
 P0JwmWknVqmhrtiWNonxyGVnFbNx/fQoNv7FgsjdHDEi1BCe5WBv3jVJFYpziq+bYHQJ
 uQb+uBNw4et3Yvn8Z2WocOIaaQuqytFwCGVNUuechKRxW9qkbPT6UXwYB06a2APMaruY
 K7XQ==
X-Gm-Message-State: AGi0PuZZLx0/RKe1AhjpeCMTkQLBpBvkKnuSOG6m0n9BnK9t0Pbcl5tb
 cK8A6OBD5R75PfD/xz/XaOgZYw==
X-Google-Smtp-Source: APiQypIYGFFNE4CP/IEMoDRh7mGwo0o4z+2NMypaNjHCF3aRnPBRNu9ocJUCntHiguWss1r6vpDHyg==
X-Received: by 2002:a17:90a:8b82:: with SMTP id
 z2mr14034741pjn.124.1589067669999; 
 Sat, 09 May 2020 16:41:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n23sm5722167pjq.18.2020.05.09.16.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 16:41:06 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v6 02/18] pstore/platform: Switch pstore_info::name to const
Date: Sat,  9 May 2020 16:40:47 -0700
Message-Id: <20200509234103.46544-3-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_164110_771443_0A354E2F 
X-CRM114-Status: GOOD (  12.98  )
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
