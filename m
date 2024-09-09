Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A100ECE581
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K0TEpQo1T/2EQV7/plAHpPZfcTBXCW1Z3yaw/LV47Qs=; b=Vy8bLwGYP5ST6z
	J3taFLwgDmON1K7sOnWGF26FwDwHbmH6YtCcQNaj0LP1T0LdF/7fnvGSOjspCeSRVrOAHx1MNLNJ6
	5uQKwJXdtbWuUnpqo6cDxm3Pvxcg/94QzBmBcCr6NOZLq/DxOmVp8nu4UNtTwjWt2yjPc0dtELIfL
	mDOhBvXjnrfeMcH7K9+zr1hU7at3J0rE229ZdZLktRhPSMyuBCZ6RnE/yDZ+e+ZIoL/aKHVS41J6T
	tUQwfqK4YhX1Nh5uqex8hp5BeC4dDSO/wTUpnQXwa0SuXwmyC1WmbFm0UYKKufIV9jk6x3FzdcuSZ
	WJM96+fsfrt9N/KP+03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZYP-000000011lf-2yWz;
	Mon, 09 Sep 2024 08:15:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYVu-00000000jlm-0jrT
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=; b=BolgS8peLB3uyvqp4ev/9uGMdP
	F+qhf8QTYZmGzMpjb8he5CcXQueYC9ak7ot2//eRInjp8zUzOvbze62YsWgq2G27g7/yrvUR8s0/m
	bCkHnKLqlLmxBQ+ZnfK1VlcsF97u3qMk6N/Fel9clPP/hH2dZFWnI8WeYLPHupjyBMGYLAMNC/ZgE
	SEpI3IBCgRcZZqnli+MHAvD/ajPGMbrTovcSiDzP/xZKmVgaPGUAgEcYj2UzGkh9kdXvzQc7+LacW
	vZl64sQjc57+gCuULn78xGfbFb86luPUnYps56aM/rsDoZyK3NBVBVxA6hxqCm2kib3gFrvPkpAIG
	IQ73mniw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYVo-00000000Kaf-2Bf0
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:08:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-374bb08d011so2262515f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725865713; x=1726470513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
        b=QSeAum6s8Zzi6xtD8nzzFgKY+kaeoc5uBqbYEjJ57NMr2RKfv3/acU+rZHThIbydMI
         Kvr6B22NJIA9N5vJLpzW2nKiytSfsNo/3Acj9DcqLD2c7v0Mw76KoSukT4FUc0YnOaT2
         WUPp67JRf8O7VSPiyzPUZ8ktP1qEPs4dfDcEwMS4O7QUgw/mvf+KB1SY0CtfQ2IFcBkD
         /FLqCEFMwqZ+txfCbd5IOLy/CSOpFXYsjwQP5xQIQ3BcCNxkOGEsgl3x4T1RWIjCbq6W
         vM+UVG0O5A2dCqKqIgxShQZoFvmolmBoa8+if2zAc5Cl/a3z9+qfe9fC9PCFPhXKBP4W
         x88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725865713; x=1726470513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aK7oAHt19v4bPo2zqG0Ykp0jbeXdGIHNkoqennHtifs=;
        b=Vgh89MJFarKyFFnyQ7swqEM0kfPCq1q5g9JPGRrAPD87R/VOkYuXWMaI6IcuMNVizo
         OXRShOGpSu2Kdl/2Aa6yJTjc8TFX6I5AoRdgB4g8ruaMhfnY9vEV5fdXPcUqtj0baW2T
         wMbs3zUe25FJZNWYNEcODcQODXfOD6LYwtQY2jw/5RQcax0T+U1iDEAcOxkUMMRBdK3g
         dEcoubkntBY+wD36ufbg2cWMa/4zscOqrgGT9RamydzKXZkD0LY7/mNHbCx2Fn+sYiVX
         O8+LmnE7pv0xpfWBfUXKV0uF6dmZ09AU4RISCBeRngNVh7H4tBhXT3yaGZ27KBFo+p2/
         x0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjUBjTbOb2oQSCu2pkuZ7uSjQ/5Om9KXi4YAIJXEMCWV2B7+5RaVNq6BEBavQEgnYeNYEERYeWuGU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLlxfzMKP2wRg8bFIazYoiM0YojTx/erVVMLQUoEBOrpxw9iHG
	xNKgBeBZ2Br7HwMoT7cUIWojW21cB2BeLzNrUPex3LzR70Wxfs4R
X-Google-Smtp-Source: AGHT+IFi67K8QB4r8x5dBm9y5325f1H3SNjB1ndU/CGDMv41P1K19WzeQTZI+70hfCKm0xevGHxxxA==
X-Received: by 2002:a05:6000:1143:b0:371:87d4:8f12 with SMTP id ffacd0b85a97d-378895ca2e1mr6475478f8f.17.1725865713228;
        Mon, 09 Sep 2024 00:08:33 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:08:31 -0700 (PDT)
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
Subject: [PATCH v2 10/19] lib/interval_tree_test.c: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:24 +0200
Message-ID: <20240909070742.75425-11-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_080836_731769_E5C67716 
X-CRM114-Status: GOOD (  11.60  )
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
