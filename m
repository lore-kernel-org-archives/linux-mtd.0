Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561D1CE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEcE9kuPB2j+1dx7EjxfFYd/pfGOk80whu43z9N80Wk=; b=ykKspcPwvwU5wN
	8qoJjZUNDe+aGJL1x+gJt2u8Iv3XJg7mVy4moufpFSPBOXBx70lG5BcjtEvB581pMUwwZMCwIB6uA
	Mdurc2kF1hN2uGvq8OiuO0X46Vsc7WFK7gM1q9qCIM8v5duSso/+i2dOi7lZ/fx/BKwhvGqvAED4t
	AqhVK/R8tzZl77dl1T9PWcwx6FiQ3vvqzFA3Qv1WiGB5kMf1kpXX+AFKRmRMFOtFoAnilTbxAlEMu
	9ylRHe5Cqxvdikx3HPqjPwBmChpUWnMVZVHvB+RasLZSaXPJ8Dj+hkrBvCFhL6GSIQHSMvh8QKAzO
	h0cfBZZJ7E0sOIlV4mVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBC-0000000HDpJ-3co2;
	Mon, 30 Sep 2024 13:11:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeX-0000000H4wy-0pUE
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42e5e758093so34289885e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699843; x=1728304643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfE03GoB2dUE0X7JHaqSm0tKtFoPw6ruHh5YI8xKL2k=;
        b=j7saLcwJPtP7wA+htXM1YdYwwzvv3WtrgIIzw1ofbHyWRcoV1BGf7Dy4dmMe7jedD7
         123mrkv9xBqQLzJhxRdz2UCqm3CDCfgYA/gsDvnsKtANk+zPfWYqqRsrMp0rHHgTXuDF
         H2ctdWzDUrT4ru3knO/GY+qzbaQ1Sbyu+4XQnD/ZHBsH3uRU851T5S4p8OBFgbPqYJ02
         uJ69EtkM2339JYW0OBl9gd1hDrMnbo3TH/uS4rStrnHPQIyiPoUwA8oXmNCMciLNtzf4
         SXb7is0As/p8hUCncBammeaK7dkCYLnO7ycprTp+TLt3kmGvp+Jte8vsgglJChO1XtYp
         ww2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699843; x=1728304643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfE03GoB2dUE0X7JHaqSm0tKtFoPw6ruHh5YI8xKL2k=;
        b=Jo4kw4+6VPokECJmMcQOsfKhT6lrDp7KgMfqy2wAytLlerL1nout1SKEBp6g2n2ujZ
         cSgW8emgZUMbYJatyIuCi7s55VWFEcdL0buuyk32tOFvQRZQvvPdRh2YT1KO1IadVgrb
         pfVa+PFKTo3aV3CE/tJUwJT55YJoz37xIXpzt/msx2x72jDiaEin3gQzYL2JNUE0d1x7
         q8h0xgVbv+LISW7FJgtWdxkxe1U6Rrzt7AB1rFosm0ZTIAiW+TgT7OZtXwJYefqXljcU
         8aEHerkSA2AL5iOKUar1Duz9pDllkyD3hc13XOMKUBPx+JpDKrQRRVGiAUKFmA3/LDaE
         Rvow==
X-Forwarded-Encrypted: i=1; AJvYcCXKSuueroIrm7ctn6OZHGGPoKobOyCF7D1fmYdiT1SlCSdXlGRSHwIrZRvoQvIYE2v1kN1hizzHPJs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqwB593WzAMoNde94J6IjophLiJuM29hhm+Q72oK3WH41xSWNv
	ikEDJottzsABnEuJSVKvgacg3ZxXA0c8r8F0B5mIjhfp0YWnJXDt
X-Google-Smtp-Source: AGHT+IHyexJvOjpRbo21AjAs38QcS8a1X8lQ/VRW02l+0t4b6bl/r6U8twtDvjQga2qNTvuV88EQdA==
X-Received: by 2002:a05:600c:4454:b0:42c:b58d:98ad with SMTP id 5b1f17b1804b1-42f5843312amr86700225e9.14.1727699843491;
        Mon, 30 Sep 2024 05:37:23 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:22 -0700 (PDT)
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
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Subject: [PATCH v3 11/19] kunit: string-stream-test: Include <linux/prandom.h>
Date: Mon, 30 Sep 2024 14:33:22 +0200
Message-ID: <20240930123702.803617-12-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053725_298023_AB9BD261 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

Include <linux/random.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <davidgow@google.com>
Cc: Rae Moar <rmoar@google.com>
---
 lib/kunit/string-stream-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/kunit/string-stream-test.c b/lib/kunit/string-stream-test.c
index 7511442ea98f..7734e33156f9 100644
--- a/lib/kunit/string-stream-test.c
+++ b/lib/kunit/string-stream-test.c
@@ -9,6 +9,7 @@
 #include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/ktime.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
