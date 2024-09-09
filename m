Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25236E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqt7Zu56FhUZMG55ZK55WS1MXKkzNJTwmJ0zpKjn/HY=; b=RwvQ+wBjOwnrm9
	T7zYhDym+dlLK88bzM+a/Kp8sk0uzQh31up9TT5nRw+7XbWx+r4NMP0juhJFoqIAVC67SeZMjwbqY
	DjBYz5IvUihWt5VGMMukatCUVmr0z6J9sDW2hRtNNFjVYXtnrW0j5dZ+mKQBnotjDuGhnZPqG8iCh
	Hc0ygx785X8Ddrx51zZ7yhWMx6CSFrVSElQNl3F/MRT6x2cGlhWwbZNOuC80/zMBNxkBxdQwC8Wn3
	bGLgDqfVgVnuyzFaPNcnOgVjpCgNg9//yLz4BrsV7Svq6anaAmvTmswBSfiJE6PkSmMGME75bBvf4
	5OoawAdToFnIVPsYpjDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHi-00000000x6z-0Bb8;
	Mon, 09 Sep 2024 07:58:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGu-00000000wNR-3iPX
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374ba78f192so2351023f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868635; x=1726473435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
        b=RrZxJQ2CF/VEI72fwDWp8eIHdPgf0flrjanBvDXuT0/M7GPQeOlOjeg8gC96G1imfh
         DIDYF6tg3pCWtjfPU2PpDoC7VNNpLfA+pcRatmSx5SUdN+/PkqYi20510ECi4tZg3lAL
         LVcFUpqTftBCzhjIsh5UMINl3N5vzRVuUOUhxD0bUI3DnfXXawMmD2CsxrN3bW7GMjTQ
         xEXhCb849T2qpjHeSxp6qqcS+1ShKnYM+MIZ99+8Gfd/nAR3bNrxa/YdNRlkyEj6gta5
         l8b7qBn2veHPnTskJdVAzO81lxeqXbkLq5vg/BwvOuSPizcS++wJ+iz7gHounqFScOXk
         Kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868635; x=1726473435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BivEb0WMZmwNev7ojy/Ht/ekf32lny20AzsfLsOF+vY=;
        b=RfiIqKI9UiRtk88G7awSS2U41qCqHK5mP2AVU3BdROkPU+3nGHvp27rauBpqwmBPW0
         FvwkKdcqtQ6sa64QUpxZye266oyq6fP+r37pLtjDJ9KmzCvdSYMJ9hqIyNNeTJBsfY4P
         opvU1XWoq7Fnc0sCzzUWd+XesQ48SmJOLA7ZQnJPltIjMtMneAP8gXooaAWvnBSAqrhO
         +rw7GzMD3LCsOkwB9l6XtdU6UHaRJIoA3LqP6IpiAMOTuRqTYbVEiBjmM1/G4xT5AkEt
         RlZYc9S+BlO2xGwpGsyKB/9U+KiGpx24zDiPpiMVuKKuVWE8+pezISPgDUX3HzsN+Ek+
         5JSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNP8I+WCb51YpMT1KkHwU3M5uq7N5wWFrKBJcVqT4ubKBIA602ZE8X9g3aGoH75VvkCKXTtNFgjlI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwyjVqYIzdfFVuuP3lx8N0H6gIabOxHu4w/ZblI5dcag7G18GgZ
	S3NEya/MYL64Aj/5csLcL2TcQ902kT2pmSbnRz3aVvLP5ZfJv6s/
X-Google-Smtp-Source: AGHT+IGFn7bjhhziiFk7ZlVWXk6e2N6wsS1IlnWqQqC142aEHDE+lRu2u+3J5phDWkNcaysihDjQtA==
X-Received: by 2002:a5d:4101:0:b0:374:cbdd:480d with SMTP id ffacd0b85a97d-37889654c77mr5657546f8f.36.1725868634534;
        Mon, 09 Sep 2024 00:57:14 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:13 -0700 (PDT)
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
	"Theodore Ts'o" <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH RESEND v2 18/19] random: Do not include <linux/prandom.h> in <linux/random.h>
Date: Mon,  9 Sep 2024 09:54:01 +0200
Message-ID: <20240909075641.258968-19-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005717_373880_8ED94E22 
X-CRM114-Status: GOOD (  10.12  )
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

Files that use prandom infrastructure are now converted to
use <linux/prandom.h> header instead of <linux/random.h>.
Remove the legacy inclusion of <linux/prandom.h> from
<linux/random.h>.

This is the "nice cleanup" part, wished in c0842fbc1b18.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Fixes: c0842fbc1b18 ("random32: move the pseudo-random 32-bit definitions to prandom.h")
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
---
 include/linux/random.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/random.h b/include/linux/random.h
index b0a940af4fff..333cecfca93f 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -145,13 +145,6 @@ declare_get_random_var_wait(u64, u32)
 declare_get_random_var_wait(long, unsigned long)
 #undef declare_get_random_var
 
-/*
- * This is designed to be standalone for just prandom
- * users, but for now we include it from <linux/random.h>
- * for legacy reasons.
- */
-#include <linux/prandom.h>
-
 #ifdef CONFIG_SMP
 int random_prepare_cpu(unsigned int cpu);
 int random_online_cpu(unsigned int cpu);
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
