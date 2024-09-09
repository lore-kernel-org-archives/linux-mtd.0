Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA23AECE57B
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k41Kr415qOjgZ8QRK8w/zm9t1OLr+xKDeLKbA1PT0ts=; b=a0HuDyZbYAer0B
	tzPo1HxwvaiQ5wNZN/0EF4497sVYD2efll2i16DUOfQz/n90oQoznomfo9kAxfaG+1UGIzY3xd5JX
	eqZm97C3zVUI2MgYw1DRWdspljLbAODPtZPwTqr/PQ2Rq4lHDfeB01O9tXwJxtfjQDsdhRqJBI37T
	6XNO0Vf9aLX35Rc5unN1D2i2iqooaqzMVcKtbNxlAmqO0YXT0RW7lYMgtv90SV1oIWuSQj07RsHVM
	/sgEzMPDeBGX9rXNLVmQKFbJ+J/IvoR8iNeFd+xVgWJA3SDgKVGRBRa3ypYTF95ul5X1Io+GQq3Zo
	jbtjtcG7bUSZRKNn2G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snaFu-00000001DTK-2Ism;
	Mon, 09 Sep 2024 09:00:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGW-00000000vzA-1gwB
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:56:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso8144985e9.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868610; x=1726473410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
        b=ASNcMwGlbvQ3sPCRbUFe8/1PbshX96jigJtdb4GAOC+feSv4gZ+Z4r96WU3h1jWU9Q
         LmBgXz2ZsruTEwpi9JQFC8gg1rJmF1jmJLHNq/GvyWZon22Q1RV6H7F2gND2RTWKU0Lc
         eMF+fEhPUWa7BPFLig/PZIKwo+H6IkH++ky/DuivrXF5ACehmhIoNMgliLfXk+aNTcoK
         kbVGXDI4pvCKfFOQqaMSobQjUT7lNpqRstQIdWJk2WECAvF3Tno48GmFW++u7hhIT1Ns
         StHsAPSCGvHSfXaWaMCwg3CgEMy2lmhbOHq5xGPwnWwNXAmsooTQixZjVjQsBR33FjmV
         2hxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868610; x=1726473410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NRfmK9XiELkgvke2KZ1pLgHNaRcKS5bA/Qy7jNwAfDM=;
        b=MsT5g39lcuEOlPaaczIA15uxQHfaux54Sz9VSlG+unt9zuBYrnCTXj1oZ1e9IUB3WG
         jNnL53mNxSLLpL5tX0BDUdVrDfiL3eCPvAB5L/WC9D6rh/KNMDrdzLUz2d94c46xZ8lv
         lSnRC8ib/JjYilEFg73mWpChm18WKcIr9kQ8FcE0+/I1UBGax0y4ESZRfDBeebuJOAgZ
         /6X3e+R5GjEtp6TrzIMa5KPdBCSX9AeaZJ4I7eWZ6Lko9mJp4gUYRfx9itoDbMUdgXG+
         XOfglVxOTFunNIgrimscc2WBBBWYqPcmMMDoIdj8kL1Db6PsbKETCo4Spn/JHmSV50qT
         h2IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeguyKNa5xHYVXXGDDEgHegZ0bb1lq6lfmWXGPA4h5wM++o+1ANg+zHxS/r2kSEsPFO/phGdnwU40=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGXrFzg1V/wcTmN71k6JPyq66ZfjCAXVgiv+Wkb6DXfmxtZ1ng
	HBjTKBH2wDDi6/S1jiUlnxzvjk9Xjpx2o4iX0b1XJF+XWdNLspdo
X-Google-Smtp-Source: AGHT+IGXcCDv4DFDPdFSIqVFPwRvA3mDfJWQsySfBoGz736imUoLNDjdjo5DUMJkSdrlazNFf7whxA==
X-Received: by 2002:a05:600c:4e8d:b0:429:d43e:dbb9 with SMTP id 5b1f17b1804b1-42c9f9caa4emr65165305e9.23.1725868610286;
        Mon, 09 Sep 2024 00:56:50 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:56:49 -0700 (PDT)
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
Subject: [PATCH RESEND v2 02/19] crypto: testmgr: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:45 +0200
Message-ID: <20240909075641.258968-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005652_453372_28B506C7 
X-CRM114-Status: GOOD (  11.70  )
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
index f02cb075bd68..eeb7edd99a93 100644
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
