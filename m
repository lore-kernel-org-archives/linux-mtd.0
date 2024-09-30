Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2624ACE8340
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXSPyoAj3wlstzS0WlvhGMbaYwxhlzenmWe/k7Fa9Ts=; b=n5+rjz77t71jab
	SptkY1WN2m5AVpqTKpZ+WYlT4+RbuUzXjrk9zv5WBghGTR86Oi6E28e/nESeWOZgzpnd7GF2XX3uf
	1VkgPt0eJf/ExDtTEDv98XfeL/l8gLTfQaOgln/cnxwNAISXK4o18DYFqaEFv7qalUrYs7GIjJzd6
	AgWO3mkGwj9e13rU9g3MwDaPG1NLFLWeGZea7Xk3Rn6bj3ALhJOzh4WGP7iPvBE8oRRny+hqaSnK2
	v2lfbfRVnR+FesfQfvsfkz5IZQWCvC64h4pPUAubxOFpW9epabLFirHc37oLA3evEp4Fiqv5NwOZU
	+tvQZLxLQbySH9OVietQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBL-0000000HDwm-2jet;
	Mon, 30 Sep 2024 13:11:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFea-0000000H4zD-0KNm
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42cd46f3a26so34225765e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699846; x=1728304646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=padwceDith9kH638WiD07J9lxW9cmsB/QyloZLAGT/8=;
        b=h1BFElsGcOpuvpR2q4ZG1liV15wvxpmvSqYltrFztQ7laJ4/cR7CZSlcQL0F+CagKz
         ZEBXvpCZ8uWifayAn2caYJv7ADJGeJJgNBt880MEqicGBAuz0/ZrdbJi9l01kirs7SZb
         O75MQPyoXEDSs3kwPpKyPIDXiU10Ya8MOyAKp7Ff14Lu4k7mNofioQDSfRATJIr3e59b
         JMqTKBWXMU3EJlaxjEnVHI9r//XDMJAhSNU6Zz6sx1qch85Yu0H8ZPjcftMzo+wX/tjP
         fHRChzsQD2NB/jV4bIsJuj205aSBRj57ULmUMW/TartWtOwkdWZitsMefE5nq1BmbPW2
         paSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699846; x=1728304646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=padwceDith9kH638WiD07J9lxW9cmsB/QyloZLAGT/8=;
        b=p6aQIS6tjNU2qeLu7OIDy2neaiIq+K11vtvHEhDhBMD00yrlxXMS1nIs0/OBW3TIV/
         cbeehiunKuvd93kjjf90ZSM6RIuhYkX+3ZVm/eyEhzaq6OG+CYIChPe2o61hcwEIpbWI
         WlqOzCJtPqygiJTYH/Gat4cALeOgTkHqN68HXDN0/x5UPHFZDYCqmq62yPrXxqJrj6ym
         holVwrYS0PF7k7xIB2az45tg61zaMrAYv6RMCr8CMNgNKxjFA6sJXlebsUpgYd+MlM+H
         Sc6QjmypFTKeFekC7EkNS5sSsy06dtln0vFmhVc5D3N00E5kES2Mm6L2TxLNKAW86FbU
         msnA==
X-Forwarded-Encrypted: i=1; AJvYcCXWOE5VEyauycv8nY+a2ymEFy+vSW5lphqEGMNe605ydI/loBtL/As4C+ilO+QQUo0vGVFcy7IzUXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJnaA2hI+uml2j+xyq9GovhfaV36D8sKt5WLkItxTZGVhcanPg
	fIbIQsvCd26h8MVYRCQByRoZ3FA9elJeOvpRGvUq7feZAcKXkO9stwjaiNKmdFI=
X-Google-Smtp-Source: AGHT+IHAZnkMewglqQ/9HzMtHISIRMWUmH9Pj6F7fJL+aYx8/KhkKe4NnWnDTfk2bHUTjX5xhdBmkg==
X-Received: by 2002:a05:600c:5292:b0:42c:cd88:d0f7 with SMTP id 5b1f17b1804b1-42f6df6d212mr10003285e9.10.1727699845853;
        Mon, 30 Sep 2024 05:37:25 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:25 -0700 (PDT)
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
Subject: [PATCH v3 13/19] lib/rbtree-test: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:24 +0200
Message-ID: <20240930123702.803617-14-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053728_233644_72CC8EA8 
X-CRM114-Status: GOOD (  11.81  )
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
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
