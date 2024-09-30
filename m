Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AA7CE8344
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmYsGfv/hsG8/fIrvAb7PrpcjN8MjNM1B2UTNjPS17g=; b=I6lCq1nzETwWc5
	YqC3DWatngrWF8Yv20GU2XgweH2iQFn1u+7c2piuIc5YEqBnahHTD0PNCgo5o3yFw6gD+KhkNfiJP
	pCmYWZEEDqPWkOnTEKPubixLiukCroMe1hekgTIsbsYQy8XYpfbLNxtT3RYGFIzlIavoUwFRbSI7N
	eEELRk+sb+UIKnSNmexRB2506xIfYsYN2EtHH1BwmT12+8iLqvEPW96pLoaC7ICqqyhJ/VwoX7tSQ
	0JFLIlQeGVMTzj8G50H4upFT5jvGIKWyuZnAehLFf91sw4xuvYORIeY/WDpZOzo/MjV/l+O0uK5f3
	4UQY15Wgf+TqCJxxGGFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGAz-0000000HDei-1dv6;
	Mon, 30 Sep 2024 13:10:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeL-0000000H4m5-0lE7
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42cae4eb026so41709475e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699832; x=1728304632; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6G4Ex/yEG0PawIZnX5kHSAD3j0oy1BU4Shaq5r1xaw=;
        b=La+WwPow7GA7xxW6Vm58MbaEyVTQmqEwtxboHMqJ9xHvp016gBPs66ykwVHYxXGGZG
         1zFm0IM6Y8V4x+FwQ1iwidpBTDBnzadSI1SbBLx6G0uQ/aRNE7tnjCFq7G43SuG+fQoB
         Wvvd4POOjoBzsSDl5johyCdzbBQ9fhBdAgWisCTlRj8rsPeqgcwuztcBpAvBifCqygey
         jXtW0pIEgaHR25ha5KzVAqNNW7qSs2re+ta+oYfJulfvRzhLeyEhUYPcG+PVuertDH6d
         G1Y79sbaZla3u2Rsc3OjQwqSIQ0cEDeNZGL21hPUq8RUvQwYsTbEq+Syf/32VFDgrsOj
         VJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699832; x=1728304632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6G4Ex/yEG0PawIZnX5kHSAD3j0oy1BU4Shaq5r1xaw=;
        b=OMPx+WA4tXc637edXWZE1xalN3nTGshLBerSRkb0ZwGnJzd06Hvc+qN6dZca5fp5mv
         d1Jmjtx3kUF46vstblFeAJqq/NLpe9jiS+NgNTtvHgQmmZRf/xhZ1mlbUHShXPiJ9hmZ
         kn9o99rqV/NdTLt595CZ3y2KGXQ+DDACfZYxoDL+F3AqzzY80WQbIOV7UlZwEcVxxgaO
         TFTKUobt9leb+gWgmXcE7clzT+HE5sQDoKL8oVhGbnUR6OtgdO5ThXr2KPGcyonv5ZdL
         PLspSqMPySTswREnJk5sZQuGKR2b4rNLX8CNaTLLMr3VVZjp9m+35YDYuEk6Zf0uUiKE
         TyLg==
X-Forwarded-Encrypted: i=1; AJvYcCVlg7XyWydsV5aTnJmmBSphLjXLyBCV66kssjR/p8YWQeFO4PjPCKYtDMHumpvQjqRjjJONgVQdrbs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSy8vpOc6a5w1xzNRjZicFeB/GZMXXS1zCmiKYzp9aBA0MlBzt
	UBl4w3EdptnWWa0bahcuV3aIYyK1lxhpxxgsT8+0zTPDPjN2ut0G
X-Google-Smtp-Source: AGHT+IFB6/hHEmYYfhNOCdbJlS8GC1KGQPWBaBcyFYt3K3bCumyRmpa2UpR9z404TFq/hhpGQgYEVQ==
X-Received: by 2002:adf:cc84:0:b0:37c:ccdf:a2e3 with SMTP id ffacd0b85a97d-37cd5ad92e3mr6377920f8f.33.1727699831651;
        Mon, 30 Sep 2024 05:37:11 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:11 -0700 (PDT)
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
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 02/19] crypto: testmgr: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:13 +0200
Message-ID: <20240930123702.803617-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053713_278463_2C4DE154 
X-CRM114-Status: GOOD (  11.77  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
---
 crypto/testmgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index ee8da628e9da..43472e79533c 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -23,7 +23,7 @@
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/once.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
