Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC53CE8340
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmsBkHDMexzDK4Et4dFIxMpNs2LB0XAAMkwwJYi1O5Y=; b=WvNplc9jLqKXfr
	etqd9JHTVqYq7A60NB7PeAmH0V6Wi0aUqrPhQYQ0cWBLpIFTsb4u99j4ADZ5RdnK2TsvuYsQ0+2Bn
	rwdZ+8wHY/hdDwICUt5842J5nrYiHomzaZJS0rSLXquons5cDS48OxJL3asuHBTTB10hPaXY75xcT
	RNksvPc4d+cyZjY6NaogHBSY23XD8QOTNYRBRe/+dC4FJutqR2icBX9GRrvM13fEILFbvMJZ2GM10
	iu4jjbIwFz1j8SeXC3PG99LgQ7WSneHuK2DrUJIj0UwB5U7bj9ciBQpMqQxfWxekfjnA118F/+4vi
	e04BUCgH6le+25E1IX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBH-0000000HDtD-0iMQ;
	Mon, 30 Sep 2024 13:11:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeY-0000000H4xz-0zdC
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cc43454d5so31346245e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699845; x=1728304645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrMbRs6ImQWe+o4vD+CgIqmMsoPFPKHQYE/g1FviBLg=;
        b=DxFLhGUvIgvD2KgBrb9hxYoEYGMVXUF00LoDnItZNCGTF+atGsUpKYLvd7DjABcN1T
         jnzhlKfqTZMh8RTnTPSzvnUOqAcXGl+q674Y9Reepto/ryf+iebIIRC0kHGeO0HGCubA
         3wq8YgAZhMSkWE7OXHkHoKmzv2eItReMAJ/39p7sPB/AkVyWlBA0pkRZdcPu7iuNsToL
         JyDvFq11A7SOpw196rpsr0lRnsNgFP+GH/rnICYCmOKTSXGlAvcSxUcLLjXcqBmFTOSi
         NRRRG6/I7WswUW0toGt39Pxlo9WxAvfoEyAPCgMtkErkcFdu11MZsBPPSvInBqob+/ck
         lfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699845; x=1728304645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrMbRs6ImQWe+o4vD+CgIqmMsoPFPKHQYE/g1FviBLg=;
        b=YIBMyJgV/RME+4aB67t2JiF1Et04ohZRcFCs5Mj4shHQgAcQEBXTU+UjZ0xcd7YKCK
         5SfLqI8Aq7qZFl0R3iWZmMENFTO/TAb9FuUQcEph0vFBqpXR6VCxKpAAoRvMzgrX3M5j
         HgqKXxNwNA8bvnskV0x/dRzQbAUZj3db1NkW8Yry1f/x5eE5Pc4DeWgGvoED0vNlQj9a
         oh8aV6a6EzoiCDSspQ9J0rOiFIuVSvk+dgigRPmmUvMCbsbtJkXV4q+ufN1M7GVtoMed
         Qnv5aaZAmiGeubJE0sYqTG02+KsGYid+SXrCQfYk1kT7dHAVOuOip0O+6LMzAuvSF1Px
         nZ3A==
X-Forwarded-Encrypted: i=1; AJvYcCUl4PqCDg4wgZpI467NW4cT+NvCP+6qqB0pey8JN2VssaJzf4yfUAV0UGamhkdtudLCGuNBgPMyFj8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOGjuk2BmTKrz6SXi/auUgdi5mrMr7X6hk8JT73XTTxO7Ht7yO
	UJx5lSgDFpvo7VlHFf5joa/kCKW8C4vjJIWBMhoXgeQWTFNejD82
X-Google-Smtp-Source: AGHT+IGTpcbHJYLBsw4P9dpJsKy6t/gAtufuejfRIApDiA0V+yz1rvy5JdCXyTqQXYKOI2mgKeAbTw==
X-Received: by 2002:a05:600c:4f96:b0:426:616e:db8d with SMTP id 5b1f17b1804b1-42f6ded6a45mr9817345e9.15.1727699844581;
        Mon, 30 Sep 2024 05:37:24 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:24 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v3 12/19] random32: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:23 +0200
Message-ID: <20240930123702.803617-13-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053726_406206_0A195B99 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 lib/random32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/random32.c b/lib/random32.c
index 32060b852668..31fc2ca68856 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -36,7 +36,7 @@
 #include <linux/percpu.h>
 #include <linux/export.h>
 #include <linux/jiffies.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/sched.h>
 #include <linux/bitops.h>
 #include <linux/slab.h>
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
