Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74C6E6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbL0NxhpW+j98TML333TgSVMnRkT8gIt3N6lPaANv1A=; b=P8wNfqhtah+vxB
	k6oTTLxBGfGMfGELKv1b0o5KxJD0fZ+7F/gOuKuFYjKFKrkyOZGn57lz+LnFBKoqGcAyQKICfyPwM
	Zr6cvxEBKbO/w2yNW2AjRY2vnBNO9eX/je6VKDPRjjjiX6RHrTYFx0c09dZE4QfDxGmRjKvPHzwE6
	Us+U0DmTnFFSlWIabZGL5E2rIEHAnV+/os7kIupr25NXsRz3kdWvP4u9mTCIo05cyZcR88naOt4Cb
	gm2y2MG7cKm6aFLjMjWKesGSYEjmxCcFh1Prd26XcZbL7hNoojknAYuk2AUETpYZwcxfzDYuvB7mV
	S+LRkpqGBfm/ES98WjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHN-00000000wpI-0yLR;
	Mon, 09 Sep 2024 07:57:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGn-00000000wGK-3Adr
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:15 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37747c1d928so2510532f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868628; x=1726473428; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
        b=neh3PrGiI3NMppnZknC7JzwkcBZ5nD2YFEK5mPNSfk/Y+VQ1+3YI2NwA6WxXnnIs80
         lUppz4GPZJne3eYQBOtasIY99tCP13pGh+trmo0AKbwB8gGTJxi+PIKn6eMeCd7uYlcl
         zhkecgXgzinBY4OROeaxl5S1TagdqA3zJAOCleQ0SlcJHuH3vUB7Cqd4Mw6k3ULWZ3K9
         J4JntJptC/TKd/u1kdD3Si+iHyhkXQbuWvrhNGAIkkYfGmNzWvmet7/EmwGCQT7+dS3I
         zX/XXaNWFEeHHy3itxMUNgIHqw27+a1ED/8SBYbCjYyzv/pcoLGCHg9odJDG2qQ4efya
         dntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868628; x=1726473428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
        b=XU7EnxYrCZV3+CDZVzmdx5kg4B8Mgp/gXfKmVooKoKq9/O5AYg1VIyTtUAKDEm9jZL
         5TOBOQHFj4WPxNxokQ/f6Y4h2rDWcZIrQRtrgCEAaVRwD0hwll6HtGDcFYaJsYEwesFt
         1zZP8dGY2P+1FjjbmZdHBiaAFPXNls61xza/bncah/YSB8UBcbKv4eVQ+CflrUBTD8r0
         4y44KUNGyW+YmHIi3DczkLvSAQnubm8MeCPe3d/1dEecV5rVXJmeUHCUZCaEM0ZU17RO
         Vai3Cz5aLUZlepTnjXhEJsrlH0C/FxosuQU98or4jRBBDxClBYaC1CovIr5zJuJJnAy6
         6lPA==
X-Forwarded-Encrypted: i=1; AJvYcCV3sCcp0llPj5iw0vSkUt6A99ruP0aMAqKEZKeeAlD1zA73aocnrReWTDGWmTDLaGU1hVt4vs6M73w=@lists.infradead.org
X-Gm-Message-State: AOJu0YynRsMWlmtrcttJuNjg1LcFdJGOl50Wm5UPYUUZBjdpq2PvGH5O
	B5SUTRpuIRiybBsEJVb4JX6fGHfbb3TTSnSOJAOHu51PVmHNRa8P
X-Google-Smtp-Source: AGHT+IF890nGYevdgrqUf7UHJ87LKcir0BiPP7YH573XiCGqtakWSqkvGhsMvBroQEOSJMo347DAIA==
X-Received: by 2002:a5d:4fc7:0:b0:374:bad2:6a5e with SMTP id ffacd0b85a97d-378895d4894mr6553002f8f.28.1725868627558;
        Mon, 09 Sep 2024 00:57:07 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:06 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH RESEND v2 13/19] lib/rbtree-test: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:56 +0200
Message-ID: <20240909075641.258968-14-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005709_989638_701B6D4C 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/rbtree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rbtree_test.c b/lib/rbtree_test.c
index 41ae3c7570d3..8655a76d29a1 100644
--- a/lib/rbtree_test.c
+++ b/lib/rbtree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/rbtree_augmented.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
