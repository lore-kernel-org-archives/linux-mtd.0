Return-Path: <SRS0=JbbF=6Y=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7715DC54E49
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:25:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 391E6206F5
	for <linux-mtd@archiver.kernel.org>; Sun, 10 May 2020 20:25:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PdkUdl8e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oUPw6/i/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 391E6206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvAeTaIsijMQHv0UqQ7Lua20/DPVKHklnMBgOzo2qaA=; b=PdkUdl8eEnbQqd
	vYQ+S05Q4fqbXGGAVDw2DKustNC4AtmzdxgvSZNSyIeVKDedwtRZYxXNl/Q5zYbMqFcryGZAc0AKm
	5xefB9UZ6NNBdjdwLg4M5MYemKVzRtrQ6Gf8N+G9tf3/X4kUeBBeLxMx8dH4/pg9z7Qu74nUIWOkO
	Al3cMFmghwL4t+PmoiTVOO6/qLPZR4Hs2QgjIpX2qXIISE1GSZ9MFvrlpbAq/JmU7qe5eiUUSGxQH
	HDUYwlPhAlufU25H6NrZ+rP/y18qrVyhOpxgJn/RzB7DPBzyUZkA1hlb8f56N1mH7nVKPBqTlC1qg
	zNcvOuxf9qtrWUzH79rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXsVt-0005NK-S5; Sun, 10 May 2020 20:25:29 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXsVA-0002Qi-NA
 for linux-mtd@lists.infradead.org; Sun, 10 May 2020 20:24:46 +0000
Received: by mail-pl1-x644.google.com with SMTP id s20so3026570plp.6
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 13:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
 b=oUPw6/i/iSWSLQ8qEZxi/iwEj2X96+Bexnha6PPFG6//+4Z23RGHmmMvuexJ/VamdF
 F19pZKmlabTzyoj+NUGRdBPzFwPSXEqx8bNuJLoNAp7GF8uWqV30AiPPU5cGHI9R0Wqb
 Pny9vkYjK7rac58pWP4vQRqVTW6M4MKmJ4k2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vvhNGN1Tx7s0Ij5sTylqbBedyOwoifzYhuoj8ucg/Ng=;
 b=jS0cP77Cu5ruhJSfYF8e6u0nmIzwQIgb7n7qdgv/zF/kJuGAqgFQ37kG1RTBYIgPb8
 TBNJT1SHMJeb1d8eaXGy1rOld6GvPo1Mu8+gdas+qTQ/uzQtbdx+nN+aSwXAnIl9T0w8
 cZBTFxuGXkKwBjjQb1nxWw9kMu/fwVeY5nDwxCxGHxWV06jfEY+m3QXRawvxqK1IzfCt
 Ibf/x+o924hUoZupruO5anOolr746bCnBlXShrN/HATOTYCtXFC1RvJRRAFNAZ5wprFt
 pcTBY0XWZ81DPXzv43N6LNPCSMH1UVpBqe1ZRjlomHeD4RRbK1X3UguLhoW/Sm3H4y4/
 w6vw==
X-Gm-Message-State: AGi0PuaoB4LymMWeOyy2kYklZmKl4b3O2xR4fdrEQn4D2vakHbTSsuq0
 huMH2rkMA8BnoZ8VY0+uALQThA==
X-Google-Smtp-Source: APiQypI0peMuCdpjAI6Jjbk4+g7PSZ9VEw2TUInRV5/MACLXB5MTMLkkWXhKvUdHeRCsFkKmImLJjQ==
X-Received: by 2002:a17:90a:22e8:: with SMTP id
 s95mr18281973pjc.219.1589142284157; 
 Sun, 10 May 2020 13:24:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 128sm7284042pfy.5.2020.05.10.13.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 13:24:41 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: [PATCH v7 03/18] pstore/platform: Move module params after
 declarations
Date: Sun, 10 May 2020 13:24:21 -0700
Message-Id: <20200510202436.63222-4-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510202436.63222-1-keescook@chromium.org>
References: <20200510202436.63222-1-keescook@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_132444_749744_EF9C6B42 
X-CRM114-Status: UNSURE (   9.59  )
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
