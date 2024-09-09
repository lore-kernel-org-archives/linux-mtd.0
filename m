Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE390ECE57D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YRWE3yyoyWozvu1GDs0+WPP3WdVxrPyuWz+ZJEd3RK0=; b=Uqp4pYy5fIoLWM
	F7Jpei6EMiYxJotv7c4rk7ytE0uKpJbSzNqXDy1xAZPCETw9W5U+LxwBwiYEsMn3rKU/KguhZYMvV
	bfSLiwdepIY73hMTbw3kvDgLZiphIcOm1o8fFa1QKOIO0dmoORL1vOdaatPudy32nijWF4YJuFrW+
	9Z6IE3fr/UUeKRy7Z5j2eUNX8w3lA4YoC6twCSA7Amw9TcskOEUxYrgmrJsKlegF9djnSiRm2rCU2
	XatLTZCtXctvrzYcIMGCTRqb3vIS3rIavLNRe4UP5Hfggc16PWqLEOi0rnKwMliyJxQPTc9bGbJLv
	Vp9u1ZlCGCoNfcZFJhPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGa-00000000w3A-2dzV;
	Mon, 09 Sep 2024 07:56:56 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGU-00000000vyE-3Y1B
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:56:52 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso14486895e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868609; x=1726473409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
        b=ntTL08P+uvsRdGEX5WG2hSnu2dKRW+Y5eWL+4RvPLI2Fyrkviz9ZCaQ6SI5QkHYDNY
         WvyKCEqXxzIDBC/qwaJUD0xlkxXIX3knAv00DsqTU/ublV7xtJvdTKpielRxrJuKZyhw
         I6LdTiNegprYpjWfiVIccZHv17dCxQG1zSrb0VuTMQ4cUo0X2HxqY5MoNOJ6SI+h2VNE
         p3fNyeFU/TaFm9X1TZt4wVNBtNNC8lj6jE1XxXxiTpkndOrb+RDq9uW246bHF1A85v24
         Z46/mmvHF9msuxew0xmBQGHDAa71wFodsIV/jotj5+QXIf/RqnRnIQdA7rP9u193GrIF
         uArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868609; x=1726473409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8B7BVoErPcOoKPxSdUBz41r3SRVlI1m5+I4zzu3vMfI=;
        b=JhEqc8Fo820rCt8eLkLj4d8Noq6Y5HzBVG3Qv0LD4BVAewwirI27cK2g+HMj1MGFlW
         1JGo4X4cmbM49uCwb4Oi78TKDl1UkO0AGcRfPgIypy2Yq03q2db1Dj8+jabuggGgJJTS
         uHiWGOvcI2/OpvlouTeUC06tWjQdyluUceCCBLi4Q2deKFFIwOaIgkveRFpn+U2lrn2u
         d1MkuhePwuX2l9qbeSEu7Az6mjIpn3ZTZcE2M6ASZPy5hZIC44zNu6XoA/+iJ4XzpAm+
         gY8NzaHsbQnZdqq439Ewvh4kfAVVoA+gE9v+PCeo0Cr0BHs+b9+Tp5goItN27dI3Rzgf
         NPrA==
X-Forwarded-Encrypted: i=1; AJvYcCVRmCUcV1TW4LOcNIxDXUM3w4XontvcMRgZKCAS0P77QDl+kqdlCmhh3n1r5oyEk9OEaSz/gYgA6Jk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUS90ue0N6+vXDcRne89HxgKZkIOeheXkyYy88Nv/r7b1FoLND
	B7rNX7E7LZfcs+Sy483dBztbJMZj9TxQ0L3s4RFhi4ao+nd9pIJLPuAPn7X4tKc=
X-Google-Smtp-Source: AGHT+IHWkhCod/cUhSnjyZKEZLy/v5Es+DtTGTGYiOp483T8sPZJXqNXcFpaXCFZinKhbm5C7GjmvA==
X-Received: by 2002:a05:600c:3b20:b0:42c:b8c9:16cb with SMTP id 5b1f17b1804b1-42cb8c91953mr12858525e9.5.1725868608863;
        Mon, 09 Sep 2024 00:56:48 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:47 -0700 (PDT)
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
Subject: [PATCH RESEND v2 01/19] x86/kaslr: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:44 +0200
Message-ID: <20240909075641.258968-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005650_895152_9B1E3D18 
X-CRM114-Status: GOOD (  13.41  )
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
