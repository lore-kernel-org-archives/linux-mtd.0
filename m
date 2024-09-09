Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2CBECE57D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRWE3yyoyWozvu1GDs0+WPP3WdVxrPyuWz+ZJEd3RK0=; b=Sc+ACOIsv1Ibyv
	ivuRdMObD0uBW3HF/R+Ab1YTnBc8P5m65dA5UC4Nh09YS9UaWc1v301YjFNCqfsiMLCMzLvi04+kD
	/mmCFOASpWH5+fhxjulKuDUy8CjRcD3GdPmu2OtsKSx7BW0A5FtWFPwBluEIKX9N2FG/lu+9wIuHg
	I/53kL24RUZpgJQKpR7kUQDDEdd7HyPmscrQfkwFbxkDpIGbczt4Tsb+qCfDKZzPKClUo1ZfJ7InU
	0gnBeewj8L6CZTY6/OUoVUmOmgVI7MkWRx6a/xDR54t/xdrIXGNGvLQz+ukcHPmpJZGY5b1ZuuMMN
	GKt3n8iWrEBTzIOdlU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVa-00000000jSQ-3PP9;
	Mon, 09 Sep 2024 07:08:22 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVX-00000000jQH-1W9w
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-374c1e5fe79so2573495f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865697; x=1726470497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
        b=hwWTL58fbT690jnuONiGQk1R1oJVVrUVE32QmSKBdUff7/JhO+c5XdW2xMPWJYCbTp
         bMqZIns/zN2G2UZKgQszTKJpyRlHYzWn5KCAgiy2AuNq6jsUiEyu6mQ1Z0CcsZSar+k2
         jV5y41fyhhLqL0ERbu/z2DEbyWBBzTkICiNvxzTuUgFQqB8CMnxv2WEz15Hy9TkbNZ2n
         CnM3wHZhjRfevUrVLmDv/lE3qz8XgSKiMgjtLEc0QDnQRdmdJqGUFGLQ19blfRr5Wl8/
         Iz8GS0xWacigFEL5qNy2/ZOJes1idDztpnpk7aQALIkifNeEyxrYkqpoNh3oxxYI62Yy
         ZElA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865697; x=1726470497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
        b=XVb0Nbdr/tQb5n8l4aJWG+9jfjQC9/YZh6whDxW6dgvGPKvJsRr9CWz7feHypxPGNb
         /YxJALKB888XoSTmcIYKP29it2ptkr4LLadsck766xRFQ6LmgyuSlormSEhf4Jkt+tcV
         FdHmaxljNjd0pkpYl8EmxD3DM7UQxmp37jx8ccOoTrbQvJ1j5RloZip8P3rYGyFCcMm9
         xnSIzqtKIA34YHQ6IeHpoJKTlDH6ErudNXZ1VjwnRDPXaiB25hLUu6xpiGspsV/mglyg
         ObU5cq1oeaI/RWNV5i8ausPfpkB6ZXLHNkaYXmSWUwxbWKSvC0wmXM5TboZpkLE554fk
         sMgA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2nl5rNRZqWMFg8llIOm/vBHZ+MlFcdj2BV6PJ0MzKPDVlRTiqOECzopcyVEdxHglXsg0aNtvTAE=@lists.infradead.org
X-Gm-Message-State: AOJu0YykkSAij92Obet5I7nCjnbH9M3jwNmsBFSXBXAehAao/Hulnjtt
	18IOjYf+ikISz+15GnQ5WdSlB2xgFPrthCUAS92R048v1cG3Nd6g8mjDhpyUAo0=
X-Google-Smtp-Source: AGHT+IGYyMu3Vg6t0QKAaHpT+Zfos7iWqitbr5XWvfDWFMrJwqorNUfbV12tuLSocQgEo0BB8LI95Q==
X-Received: by 2002:adf:fe84:0:b0:371:8e3c:59 with SMTP id ffacd0b85a97d-378895c2578mr7304772f8f.5.1725865697132;
        Mon, 09 Sep 2024 00:08:17 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:16 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	linux-crypto@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 01/19] x86/kaslr: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:15 +0200
Message-ID: <20240909070742.75425-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000819_423092_EC3315C7 
X-CRM114-Status: GOOD (  13.32  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---
 arch/x86/mm/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kaslr.c b/arch/x86/mm/kaslr.c
index 230f1dee4f09..e17e6e27b7ec 100644
--- a/arch/x86/mm/kaslr.c
+++ b/arch/x86/mm/kaslr.c
@@ -22,7 +22,7 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/memblock.h>
 #include <linux/pgtable.h>
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
