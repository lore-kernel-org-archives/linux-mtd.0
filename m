Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD77CE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbL0NxhpW+j98TML333TgSVMnRkT8gIt3N6lPaANv1A=; b=4MZb/yuSYN2TuX
	YvgN7TXWY/IzKxC1Lv5FjZ/aevAF8aiunEwDCZ+5cN9ioqpVLtnc0+toHOOHiK6llg3/aEQENOWak
	TWBmNXhh73AP3FvgwhvODPXiiZFowySiXCxzI8ZgPs90lISYAGX8ahstO6aM7PHTFRMAmgSBji+cw
	7ik2gNWnQYNkJZimKmvRcPWpQWZq1vzfdhbibSuYUdQki5l5qbpbdytWpouN8nPIW5EaWDYGBGSAN
	eMg8Spvp6p5BPZjNw3X1opRBu4/tIk18rAdyjDa1xiqcZ+LKDXNOh6M/zE7fmuciKPank/mbMVm3R
	BGqpNZ/+KwJ11wNLc8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYW9-00000000k0w-2HLZ;
	Mon, 09 Sep 2024 07:08:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVr-00000000jim-1awf
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-374c326c638so2945563f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865717; x=1726470517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
        b=eEH0XtBMvaMo5LLWrtLrgpbF04wPGvqe4tVOpOtux0qNvEQu3BCpVSe0P3dVJm2up3
         J7ylRwppwJ0QkvFrsRjxxgLwAI/YJswivEzmPzfWJXYUZi6ExwaGeuBOKv3ifWh+REFd
         AjBDrkkbxpKVu9yYJRjud+EQnvVUXEqWS9zsWjSiAjoW7zPps/EF40viDf3KHL78YMAK
         O4EknOQSdhp6y10eS5UenC4ZxOe9bGzEJ9yJh/l//RAeMnQ1mjze/YBg00JGcu4AViKq
         ndhHzqVvQ3u10cqTpX4tGt34KdrgpGhdEJdO+wNuN2K2S1UG8IcWMoAJQ7mnCtjDgo6M
         NOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865717; x=1726470517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqq6NzUB0QMlVgbuEigLtg4dQP3OsIeGqq5KqtK1ysk=;
        b=i+Vx5L+f5tk6WTPBP8qo0BXSnKO49+KIHvaQXkNj/gG0bCNJ7DeOorjXmctHoXPuJj
         cF3jTQ/R1nbDdAk1uEZNpJ8ENGdpTFDK3hFWfnkxpBijjLyJMYF5AW6+UYbqS8nguLzL
         P5cTwwJUmlAHGhCdTzNRTdzha64OlPcwIPTj3Kko4R/93hh9BOpe3vHDut84FIOLKGC3
         OveF7gWKGDBX/Hsb/01b4gd3/2DEXHP6jqYipZOtZqznBQp763n5StIi3j/amHYRmQKu
         UeiL7OkdSMER+XAt4ZvZowRBd6H6j2s+TzvOrDq3Scaz+qRREYy4mD3to1y/2ORXkVdZ
         4Ruw==
X-Forwarded-Encrypted: i=1; AJvYcCUesR9WMZRYEiFTAhjNlKi2WzFzbSOF1yliKTxCMxIrslz4rWZaXWIWxzx2W0FAYvo5tiAOr1dk8YU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBAWBwIsVoLnoM77CQuIPxhiCzpBzuvZDf+pvJODwSSgn1PahL
	Tj33r4w4gzlOA8H9xO2jyZQFfgyjdtKbfAykvndS/hSMhtwrr4dB
X-Google-Smtp-Source: AGHT+IGvCGyXAe+yX+BYaSRb/hI+Ilgk0idYw90HidcMT2AOiWBbY9IJ69nJCH4grLww7mZj552B4Q==
X-Received: by 2002:a05:6000:4581:b0:371:9377:975f with SMTP id ffacd0b85a97d-378895d4740mr6131926f8f.25.1725865717197;
        Mon, 09 Sep 2024 00:08:37 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:36 -0700 (PDT)
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
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 13/19] lib/rbtree-test: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:27 +0200
Message-ID: <20240909070742.75425-14-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_000839_900747_40FB0F48 
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
