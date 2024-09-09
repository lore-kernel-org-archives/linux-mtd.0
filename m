Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE976CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn4/Le8mZoCSNgTH0a9fQbfFBen4RDKi9+WGZVMKnFw=; b=q9Avda6XAwMoN1
	ISTABTA9Ma0nCbXad92VxeFNhOGzZ76OT030kbxGp1hvSBKc0dxvdVKsmGN6HIN/DnaPYRl1SsS43
	pe27ko5YGBy8BYQmH3a9jqXOunONTuurKLjO+Q9iJn83FaDrEY6aEhuCWQy9IWUEtvhlR6kNATwW2
	6sjf+XyawPNRvJy8nPXdSgIT5GouG/8F7a6uax35jDQWbOtmL3BEdEabmrgeauN2n0rgM3uKNTprb
	5hfphXHkI4IZI2hpAdoxFKM1GXaPzEvkUR7YbrCdHO3qBYMArcj8HL9atD2bKKECFlIEt/WBmwXEf
	DwDjcJv6ppOrAvuDj9xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYW6-00000000jyP-2Jdx;
	Mon, 09 Sep 2024 07:08:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVo-00000000jeO-0PXK
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:43 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42ca573fd5aso23807425e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865714; x=1726470514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
        b=fg0gZ7IE1eg9JgfcYNzMwLbzoe/X5r3fP6CqF1/9XJX9/PW1MbbnfJklY+VQlNEnp5
         Fwf2KKNjlq5glU/NINB/mJrTkSyqcprIpxE1d4BVCTXo+GfxSKTeeA4dX36BpRFsrRIB
         s0pHOoINvmvOPC+6TJrJ7WfSgEAbpZIePUeJaV0/1z8Yq85c7xMn0xOngo8KDx8A7Dk5
         SGsg0OVxR9b9huukpXAqW/LDrtrkp1Rnyc/JgcG4EZBX/lcKhyPw5p3aECC3EwhBTjh/
         yE8v5O77BM0GKJRxKZHy+wDlMDbCMVS3da8QQiGD3lL1Zgd3zh4Lh60UqF/dKncAZI4m
         aSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865714; x=1726470514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Pq3OAvpMN/C/2QwAD8pzV8PNMpLIVHwySHZrZo9G7g=;
        b=t4BeWBY+EqiFj3F0UY+2xCdSwIfKzesPJSBa1RbuJGqpdTb+GSSfDYxhS/IQYOIrM/
         jN3U1D5oS0Naxq/v6WyvRcdJktluYoBeWVHd6F+lwSA/vyTDHrdLbWgzl0ElDv58dxbc
         rORr5nLlrgg70AWlFpiIM4CHms0ZCK+agRBBHC2GLT78X0ZVzWMeJjY0UIyXox98pt64
         VbA09kU9LatNNFoKluxM1PqygCGfegS3wla1Lj9r6BKKbjFZBOjh1ZOYVE7NnFCA8fuS
         yGRWj2ZtfI1+nAVV0Bmrnk2UjoM5HaqjbSpHinnHstyKg6NdMXQimA7Xc+5PSmK0hnNH
         Qzng==
X-Forwarded-Encrypted: i=1; AJvYcCWcejYINWmqh9k0RvV6MCPDs4cAOAqm2HMgya/jLJ1XjsUyR1AfUL4gYN5R9ncnmN+SoKMEwbKA7xY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqlyHe1ItvL/K9EVBWT+6OY1Pe4kH5i/yoUNTJdJUTIAJW7DE8
	TKSTBSKtNyaCDO9t6Ci259aUSSplF5fksLtbVYyUnpLBblf5th6K
X-Google-Smtp-Source: AGHT+IGX2jPMfg9AUfAU2IcCFjSCwUfQ3UDJSxJNlu3hawnJCsbpvG54Tw49u6Zx7j4nUhAvEOwTXQ==
X-Received: by 2002:a05:600c:4446:b0:42c:ac9f:b505 with SMTP id 5b1f17b1804b1-42cac9fb8fbmr45303025e9.31.1725865714158;
        Mon, 09 Sep 2024 00:08:34 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:33 -0700 (PDT)
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
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Subject: [PATCH v2 11/19] kunit: string-stream-test: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:25 +0200
Message-ID: <20240909070742.75425-12-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000836_279864_DC3F9CFC 
X-CRM114-Status: UNSURE (   9.61  )
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
