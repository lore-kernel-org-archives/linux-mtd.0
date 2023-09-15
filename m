Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD6CD37A7
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Sep 2023 20:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M7g1ua4czVg1aDOeps0XAgOO+SuanaUGEDsL7onZwzA=; b=G1gks5+sgB50dF
	GSBKyqlVyUbxuUNavYCZmuviyjZNjCLTo/m7Mbzz212yU0PFNQVyyds68EPXH5oxnimj4BNWNIO+U
	ltAI4RrwvlC6X3F/v7yMIDyzdoS7NPS6IdijDOWjOSBmmRg0aGFVnGs+Wnk4Ze1h7xgUJEqfOUxOq
	VC0YIEcHocFkox/h2h1sF9kBcXRdoBSmY0msCjzybAa1Hdc96mFXovWv3f6fH2MO34fanSM36zCto
	nwEBJo1KxsuuSUHYJ+4GtwRVMIJlO93e0EiPIOmMcC3c0dY30NtBFB8hszUzQsxviSE2jAHGnatZ5
	wD4GjY5AgORKxc7iYP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFAi-00BIdn-1W;
	Fri, 15 Sep 2023 20:12:12 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFAg-00BIdH-0E
	for linux-mtd@lists.infradead.org;
	Fri, 15 Sep 2023 20:12:11 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5780040cb81so1689408a12.1
        for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2023 13:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808728; x=1695413528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaNuUJuW11NFNseyUchCJwnKQBn96YBnagapJs4sYso=;
        b=VWWbK9wLPoIA79A0w00ekZAH95XjQ6ax8G5jibFo27D/uffZb9Ftnsv06t8SuXqE8z
         E579hVYKAe7ROoNRhAzMhBvF4Nj+Oxtd2pXEurn8vISAGpS0OMPx5y/eQCd1jlnBU5+D
         8VOJfQXRDhcoTJZcCDxoUHeV+S/Gzp1nvw29I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808728; x=1695413528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaNuUJuW11NFNseyUchCJwnKQBn96YBnagapJs4sYso=;
        b=CebgeJZm8RIJMQnTNUd+hfe5spLA70vRIRV8kEJ46mJnbfWIqTZ9ue2OQkp2sX22E+
         t3UodUXKVWoTKath/McEs4ktqe9wysqw6WshRqehRzVLSic6fcoH4bsAHOzbjAdGfJjK
         dQ2baRIRMrYjyKcePXkwOUon/6eZy6JgxgjNhlbPgIHC7J+dvRA8ehabDr+Oh9AllhSP
         /+SdZaVZCH7AhVNAsaOnVUKUIDY2pXiwv0zijTF1d9V754zHuXKz5ddn886/lRMwoIF0
         K2GB8zwlkD0dudhXUyP92byL1gkFjYnRzGCg4F857VZO15OQAl+qU3nlYiFCkKtnkRzA
         taJw==
X-Gm-Message-State: AOJu0YxGRtFYf0tDo5VcE2NXPFOD/d22hHjZomrks0D7aC8JBwYNcOzx
	p1x1FzGAjNRLOkN/LdCbv435XA==
X-Google-Smtp-Source: AGHT+IENQ+3ljrMvkLNjV5WcuTAeCHeTqiHUCoaqBNiK5cW9S7xH1rsrjHRo+U8DYzSeMzsRRNUnqw==
X-Received: by 2002:a17:90a:c981:b0:268:3ea0:7160 with SMTP id w1-20020a17090ac98100b002683ea07160mr2561819pjt.0.1694808728027;
        Fri, 15 Sep 2023 13:12:08 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id w30-20020a17090a6ba100b0025dc5749b4csm1923373pjj.21.2023.09.15.13.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:12:07 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mtd: cfi: Annotate struct cfi_private with __counted_by
Date: Fri, 15 Sep 2023 13:12:06 -0700
Message-Id: <20230915201206.never.107-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383; i=keescook@chromium.org;
 h=from:subject:message-id; bh=kJgErR26UlIfECbb6XvY8Wt1mjzpcX6fBOuJe21FNYc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLqWagQwTd4LDC+TCrz67AZZmCb7zzFJT3Wg+
 FjYR7jZxCuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS6lgAKCRCJcvTf3G3A
 JjaoD/462fmKAJmqNZoJP+mdtzZMTuK5Ftpvj1hxiYcJHGsAvHIjskTS6/QIhml3KId+AW/Z/9h
 3o9kD9vTeovneN67dHl76ayl35/i72aMm0mtq24r5wGFw0zjc+cdbDX0q4Qo6IZp/tk2+X1LvfH
 Z4ajg+xMKjB6ioDbCl8IPLC4q1syKk8Ka86gpC4n3Is24kUoPD9TEHkN0L3wCoxGpe57ipbKawn
 typcjdBmfXci+xlk8ib6bsm8MXHEd6YuvHvgmla3Ls6PMV1M7CqGDxhri7CcgGMLyj0oznNIGWn
 BeAUmpnecYm7pMfB8qGaaPdJK2JZg0cQEJiEJbydaegKkOP0LBX+ARtgEl6/YqJLRxOLqAa+lhl
 zbJfIMw73QVehDJRd5tMFpx3uo580CHgYtL9AK0jJdl2/GI0RA5QJ3EJagXbJqlEFmf3Zd4dlsB
 9T7le0v+qGBFDn8YTwH1ANVE+8ZKb+DpSmGJ49TOm8BVE5lM3IWRqyKhnARx4yFVbqfj/A+rSYR
 RaYwA1HC6rE7lNzRB8pqnCye4X5ZZvugfwxMPLqx4aN0j8KQ94DrwplD97QrMSxTED+OMOdd69R
 Z1O1uOE31Lr9YOlurQ7SC22SowmH2dFId0hd3dwkM/Y4/UV5sa4Ayld7UzlEOtMZTYHtdeuDiGq
 FI7fa3+ p30cf+Mg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_131210_110490_10A7E898 
X-CRM114-Status: GOOD (  13.82  )
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

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct cfi_private.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/mtd/cfi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index d88bb56c18e2..947410faf9e2 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -287,7 +287,7 @@ struct cfi_private {
 	unsigned long chipshift; /* Because they're of the same type */
 	const char *im_name;	 /* inter_module name for cmdset_setup */
 	unsigned long quirks;
-	struct flchip chips[];  /* per-chip data structure for each chip */
+	struct flchip chips[] __counted_by(numchips);  /* per-chip data structure for each chip */
 };
 
 uint32_t cfi_build_cmd_addr(uint32_t cmd_ofs,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
