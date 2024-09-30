Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01928CE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpre6KIDO4e9c78pu7+qJvtehrhAYFDyd1qet2RGGnk=; b=O8vLgjvoG0XRyh
	rbotgmhUppSOG155y1fGFIvvzHijxLsAubr874u/Bq7X2dM9LhLLP3nVPd8VaRCQr0LURmpeL6IhX
	DquvCwAOELs2K+hAs8HXBKf+91OTIbEuU3Nk6HO0oLSNq5rfSTdVddfN2pv6aWUC2yVtbERsRVLKH
	BRCoqDfJK30H8DbBajEX5aIVt8ThIKDgiyzB0QPPFlEW51ZOaxR33XjdUZ2hOQglR/DXfV9eAw+A7
	dNfM4ZamQPhzkhfRbCi/i3mY9i8WQBYjrMozdc0po5/JZlyT68ncRsxefvRdcLZdSilo6Q/1Unols
	teNIzmyKlNLEdfQzWr4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB8-0000000HDlW-3zn1;
	Mon, 30 Sep 2024 13:11:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeW-0000000H4w7-2A9L
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so39875675e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699842; x=1728304642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqCZlFa0k9WmJz/BFH863M+r457tyeztRr2WseZe9PM=;
        b=Vsb+JoHZlniQsr036hkN/J9iTZGtp3pvbtfIYLqXhkDbrYiJKTkT3jabGus6RwtSnG
         0VyUnn/1hfa/V1kl93b8dk8p8BuGUfVkJrr+IwThrNO9j3VAGeddG9D3t/qUYduG5i33
         H0uYvkQ3TemaM6KU9Xh1t407nlkW8FgSxhdxZBD4VAQAhjXj1E2BbqOlVHyV6SMKv79I
         7eSHaljOGO/vxBbomiN8MjU0PXDZEUyNOVWFycdDQSyiXrtJ1+z7uOGOlHOUzaElJbck
         GzcmHZko3Q/+6VOrBq9jDc+LrkeRsyH4Y7nelQKEA0L1D9vl2/ST8nvZkyFGCSe66BYk
         bvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699842; x=1728304642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqCZlFa0k9WmJz/BFH863M+r457tyeztRr2WseZe9PM=;
        b=ucXWox46Akve+mm030W3z8IzQTbanxhukOL6U1i5kDM9vcWHoIHzKm9xY2jKsRDWl1
         kdURgykEOjBZ0lT41UPdnYhIsxSIq2F6iDww/cOL3fyD/TSoKi/HgLd9/bIcsDsYZ38o
         HnLhso2WQTToh6NnHJj0J8rbOnlaABw/bVvKlBemGWbBOCYo0hZmLEzAnKZFdMs0S5Ia
         70xLRDWWhPY7pqtoiOri3Q+oMqpTcLxB969i0Z4z8I+G6Nq/yj0ATOPTtpWeygHlkrze
         x9htzeOCZFXUIYvL2tLAZx18+61Xd2g1nhOX9oqOl86ng0GF2TKBfMJbODZxMMfC21sV
         xPzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnkjuKFpbBmSzN6LIDl/DveIFeL5QIsePOd7dsP1HxhUfVZmft/d75pYQ34Nf60vy9lbW1Iq2QWas=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxriv1AbbICcunJv3BXswohq/gkXgxwRrWaMk34iHMxXBmA7zEk
	U2KUuiLHx6eVE8xzcOCtfBDPk2dt/GJIdAeg1qFMNNZcXIKexZ+tv91VgTd3KEw=
X-Google-Smtp-Source: AGHT+IHDSczxlpNlMjqYJQ/J5lvvp+MGxNHf3VyEwPU2HocH3ahQJeDUV9edXRytld8Js+EVeXOtyQ==
X-Received: by 2002:a05:600c:350a:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-42f584a2da9mr83108865e9.32.1727699841971;
        Mon, 30 Sep 2024 05:37:21 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:21 -0700 (PDT)
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
Subject: [PATCH v3 10/19] lib/interval_tree_test.c: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:21 +0200
Message-ID: <20240930123702.803617-11-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053724_662668_A10EC668 
X-CRM114-Status: GOOD (  11.72  )
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
 lib/interval_tree_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/interval_tree_test.c b/lib/interval_tree_test.c
index f37f4d44faa9..837064b83a6c 100644
--- a/lib/interval_tree_test.c
+++ b/lib/interval_tree_test.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/interval_tree.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <asm/timex.h>
 
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
