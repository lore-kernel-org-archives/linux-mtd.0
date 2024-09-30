Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94995CE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4p6M5aws8hbn6upy2WaNVS+a1H+QAFPseIrfMJ2XUU=; b=0WKERncc1Ecycf
	gsSG2Jfts+hrqSKYDhvyrm+/8cLURP29uZfPQoJLO1gHLyCpNghO/rJMz4qLKHDtVbI63sUm2X0wb
	p76a3kVRSktp7eSBmYev+zvo2HJGu7MDd+UbFW6TZo4qCxRaJr5iE/HxRWEj4bdsZoF8XprsfxVMX
	FwEQv7BFwyGitRRz7fNWOdC4gVZuCObe8jeLSCY8bEq2DplCLKMPwaWLojD5s+pJgCLf527fr6unl
	l1SvH3Dhl93g1K5kGLmFOlOR5LUMQuvn33oa/rM3iuMOAHPX8Jiwy8QJnhDtR+gt59cEzZPTCl5BK
	zqn1Nsrqm8y8BM9Nvuqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGAy-0000000HDeK-3VZV;
	Mon, 30 Sep 2024 13:10:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeK-0000000H4lT-0o72
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42e7b7bef42so34734275e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699830; x=1728304630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRI6G1zgxxf6ByUGqs3lmNwTcdt012WbdG6WrxIrfn4=;
        b=K5dNvoKNViNjBbqWIPr6crfCn0Fb5ni8093nwAFBvQHdarSRfQPS15XIvYFfnRrLpN
         5WJALhWF12VrmX2CWK9w7JNeqBLJJIEgS6OD/yRZGbCDYmVDtgIFe1xPrT8SlSVLJnhy
         O5qD6rIPuguK5f5t037bCwrMpFzDwhjMe9cuqPI8lB7Ke/Ft4IaSs2tAR1Pnfh1Fd2vM
         dvA/65jGTgDlB9D/xqjAFXmmhqi59cer5fvxCVbYbKxnkr6IkfhsdOyeS1d8PeUbsAwG
         IJSpisR8mkLdHI2kXC7CWg9hYW2G2h4URJ4liFmSgewFAbkfXAFa0AsNV8dLYvVkygfU
         ea+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699830; x=1728304630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRI6G1zgxxf6ByUGqs3lmNwTcdt012WbdG6WrxIrfn4=;
        b=vphEOcA+TNyCcvu56bbUkEeh4KxFkgpHQRgSaMfRhZwJ9wQFdLfLBirR2RCTCzdBM5
         TncKPp5gDKwMpS6lxhwiq8TDq6tKp8ErA5L6g7dwHDvBmgkxyLc879yjLtNZIhSs1hAs
         ZszjaxW8t9U4X0K3CJBQf6oZajiAe4nME3H/qu91tKC1T9wG0TKrbi26B6CcgNHZhy3e
         nRPeZHMQGSIHX5GHJbthVGSZaWt6JQZahMkpv8UCIf3I2bSxxPzSjU+6r8UHgQG5T/jF
         VW4jtWT6o4GpsJyzn/qZZN1E5k1mENdYxXE04bhlO1xlbowLvXKGxg5w3cNB2H08XBiW
         wn1w==
X-Forwarded-Encrypted: i=1; AJvYcCXKN7HjCrQBZPtHvYvLutHfUP7Ww9B2JJZMt3QCxbpKBUX2UT7Qy+VkJRa/kcWRhYj3/uYpzlo92ME=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4wQFQlf5bWNshot4WC13N/RA0hIQNv9hDraL01J5wA3c5xOdf
	r2LfnS/lc6M95Sk9WPqsM3jts4fgHXmqls0p+2VVcFoAm/EMHexmgWig4If9zvg=
X-Google-Smtp-Source: AGHT+IFu5Oiwuj+i68aKGbWWitLMicT3QOqH4yvr2CkBBlw3Y4l78E7VTBxoGWeYODKBQH4FUNaUOw==
X-Received: by 2002:a05:600c:3b17:b0:426:50e1:ea6e with SMTP id 5b1f17b1804b1-42f5844c301mr92255225e9.18.1727699830327;
        Mon, 30 Sep 2024 05:37:10 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:09 -0700 (PDT)
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
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v3 01/19] x86/kaslr: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:12 +0200
Message-ID: <20240930123702.803617-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053712_254997_D74C4BEE 
X-CRM114-Status: GOOD (  13.49  )
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
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
