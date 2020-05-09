Return-Path: <SRS0=nfTR=6X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75590C54E8A
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BB221775
	for <linux-mtd@archiver.kernel.org>; Sat,  9 May 2020 23:41:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdL8OEEM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H0ooAmPd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45BB221775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvAeTaIsijMQHv0UqQ7Lua20/DPVKHklnMBgOzo2qaA=; b=mdL8OEEMdNXQ3W
	YGtknYfmSHtHxxL1H9fGS6QUmPLt/DcTEprKJT8rGx94PI19x9bQiF1uR2UfznbTTUa6Z4v64q5JL
	wMRNuO2IQjvxs/rAyJJ32KeLaJRVVFDXEb//LxEsw24i5TanRLmyuM0VV9w0mhHmpuXKlquVZ39fe
	x1Vsr1Pv5XxZdC/yFdkQUuDD7zMQ6cqZL2FyTBa4t3VPse+6cuiW9Xg8ka9BzYVKR6EcRrVgXS9kl
	FZYZ2d9Kzle+sSj2B4FthwiKCos3j/ij5FhLXsvl0JGKK+SqDcVDdY3b54cZ1iXET3IXCHJ98shaq
	+Be1HmUc0BQS5WsNzy1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXZ5j-0001AZ-Em; Sat, 09 May 2020 23:41:11 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXZ5h-00019J-1z
 for linux-mtd@lists.infradead.org; Sat, 09 May 2020 23:41:10 +0000
Received: by mail-pl1-x643.google.com with SMTP id s20so2301685plp.6
 for <linux-mtd@lists.infradead.org>; Sat, 09 May 2020 16:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
 b=H0ooAmPdOnapSGPHZq/JoxyQ1BBnzIg6/APNOlEOdF53LNG2ryW77WrExYmk/+cJbL
 ocPPOf/KndgfNJG6+JAci2tYH4tC2bOJci/5Lfh9vV42LoV7ItrQzyvO/egv602h4IYR
 44pWuSf0/6C1Ip/2mi66naX+2bIyxcoqS3O2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
 b=c4ybmNN+EeCmqf3Q5GRQ7ivVGpernx75ls6j692pIhNkNGkxvUomH98PgI7hUO6bs9
 Fv5Io217eXNVkG4HQUbtd0PqlYXPyj+xSMkT1qHwCEUFluGPw9j/DN9LvUs+uWKEHmoQ
 BmdjzimWdUVLFsam4EbNScBoUNYJSfehUcu7FosVdDPNvlRiUJB7y8m5JtF+aI5wHs7W
 jn4+sahHAFTpw4KWI2fsMSPpuhX4xa7DZyUMdvtCjfvRfKlq0fVXCpOkoRW9mw+F2SG8
 lEBPGhYDwsXTl4sgxWN5j7JIcIP9DeEmjO87QHTHl+MnkYapdIRf6+ZY+QpChtkNM2Vg
 hJng==
X-Gm-Message-State: AGi0PuYcGuWCi2h9zYL1K9+f4yk2aXFN28stfXo0DY2gE9LDmYicIhY3
 q0kwGKu7ScNiMzPKyioFrFrA3w==
X-Google-Smtp-Source: APiQypKUo7xwJzfdA6JNrqY2anP42ipln3vKspwjI3YKTI0dVWxv2sJ8STuGNonpxRA/NpDIUAjXyQ==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr8608904pld.73.1589067667755; 
 Sat, 09 May 2020 16:41:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l1sm5722419pjr.17.2020.05.09.16.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 16:41:06 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v6 03/18] pstore/platform: Move module params after
 declarations
Date: Sat,  9 May 2020 16:40:48 -0700
Message-Id: <20200509234103.46544-4-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200509234103.46544-1-keescook@chromium.org>
References: <20200509234103.46544-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_164109_121695_F189C2DF 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

It is easier to see how module params are used if they're near the
variables they use.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index e7bf22f01928..bf7fa7b278bd 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -77,12 +77,17 @@ static DEFINE_MUTEX(psinfo_lock);
 struct pstore_info *psinfo;
 
 static char *backend;
+module_param(backend, charp, 0444);
+MODULE_PARM_DESC(backend, "specific backend to use");
+
 static char *compress =
 #ifdef CONFIG_PSTORE_COMPRESS_DEFAULT
 		CONFIG_PSTORE_COMPRESS_DEFAULT;
 #else
 		NULL;
 #endif
+module_param(compress, charp, 0444);
+MODULE_PARM_DESC(compress, "compression to use");
 
 /* Compression parameters */
 static struct crypto_comp *tfm;
@@ -853,11 +858,5 @@ static void __exit pstore_exit(void)
 }
 module_exit(pstore_exit)
 
-module_param(compress, charp, 0444);
-MODULE_PARM_DESC(compress, "Pstore compression to use");
-
-module_param(backend, charp, 0444);
-MODULE_PARM_DESC(backend, "Pstore backend to use");
-
 MODULE_AUTHOR("Tony Luck <tony.luck@intel.com>");
 MODULE_LICENSE("GPL");
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
