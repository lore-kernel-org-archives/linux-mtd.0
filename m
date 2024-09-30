Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ED0CE8340
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WAF1Qp33AGKQqdLUjI2P3VCFk1E9uCk2wS/53Vlc40=; b=f18kI+2/+5Nl30
	K+lkToAKUDHZqxn+EovmF80OAYtOQCy8uKmjmA2waMkZXqkw8sKOy9xjDXwvimglGiXWX5XoeWLkQ
	a3IpJd57OZscRNNWc+iewN/OjekwKRzCYlzLjid82qIk/utWC/SLL7JDlXqUB60370YFORagrTVj4
	ANYEkxJ6+VB//9XVlN54Hs2FbmV8R7LwjL/CIqbij5caaYfUd8hlqRzFa3M5OPjTbs8hLRJJjsUsO
	dHS2gVMzxEpiHmEsNn6soJHsCpT4LNFWkvsigilu8xjd4UszjzQDgKFj95HpyF/69wunyJDtCxDHj
	AaX7tnEH9dxVEg6KahFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGB3-0000000HDhE-3LN3;
	Mon, 30 Sep 2024 13:11:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFeR-0000000H4qp-3Y3F
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:22 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37ccebd7f0dso2146081f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699838; x=1728304638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzOLLRPC71jtL2OjNuAlvY4gjd1poR9VKDBddhyc4rA=;
        b=LFxgFWlK2tXuBrobUbtuBAvg0iOd0hBlJm602MS2nlpuLnn0br/XP3B1DdJjBrjhTI
         YW691lloJzFz3jzIa5Loul+Gzh+McBqwfNvIab0NxDOpUAM6w2aBKM1HAqjHauGxF8Fu
         9hkKjy5ll4NazC2Q6ayb+Ju2r8S+ljxJzi9q/BBFnWywgOFHDtkjBrytNQIuH0QN26Zv
         mcIgdP+fQH2q76036BNL8J8ui8zVpdXbKROUcCPGLes9LWt2GH63/Hjw1ogqZw95+Chj
         LHEASWsDczJwV1A8qzUM+pPLKtd+oz20IBORjJQmTONoJ4Pa8cS8IRm0fRVhM3ec8mPj
         e8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699838; x=1728304638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzOLLRPC71jtL2OjNuAlvY4gjd1poR9VKDBddhyc4rA=;
        b=hD1idjPZv3UJXa1CfGIYv3HiBDYbQlRAwjde7eIO0yQxnD67eYsBb73A9AmhgIZU1/
         VhQfy2bZGiyp6vH0/jttboglHuuiZmEzjyzzFI7y1fsUKZ6sjfpDGhXqphXSqATZvRBo
         pWSWHGjVHQeCh9vOogluIKHUgorqP9/AjF3DzV34Wk3ZeLUTccbixrktU4omgMDkOAZb
         TUVxQHrxvEyYDzwg223HF66amvfjgKgtQNvQz7WotHcybS01UrvGLJWBZpyUyoGT0n9D
         qi77DGXEX56rSLhi2T7YZ6vUtN5jaruDcoavIHh2K3b6kPWZVIGmt4Rsse4+Zzz+Ft4W
         Bhvg==
X-Forwarded-Encrypted: i=1; AJvYcCX5VFJkNhayLe3fTi9UzO6sFV1kvaJs0IJy5l2Mdb2gLbbR6HsB9szyU4NABQlaqDjYshkkPpBxUds=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgPPCujycletMIzE+gKj5Hb9BVKftDgFzliEkQcP6IAgzLL2qX
	FRKdyXPMbuObNrGdD7UvOtKWuAjQFG9JJzedWZCApxpDjpwiRc9R
X-Google-Smtp-Source: AGHT+IGh71qi0qyayzgI7eFDFpBLWxTr/OTyditWnrNY5k5QUB6Kmr2d+RBqzeFs+cdbH+f8p3vxFQ==
X-Received: by 2002:a05:6000:108f:b0:37c:cd0d:3437 with SMTP id ffacd0b85a97d-37cd5b09c91mr5194049f8f.58.1727699837996;
        Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
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
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [PATCH v3 07/19] fscrypt: Include <linux/once.h> in fs/crypto/keyring.c
Date: Mon, 30 Sep 2024 14:33:18 +0200
Message-ID: <20240930123702.803617-8-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053720_048382_B95495BB 
X-CRM114-Status: UNSURE (   9.16  )
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

Include <linux/once.h> header to allow the removal of legacy
inclusion of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Cc: "Theodore Y. Ts'o" <tytso@mit.edu>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
---
v2: Include <linux/once.h> instead of <linux/prandom.h>
---
 fs/crypto/keyring.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 6681a71625f0..82fcc5683649 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -22,6 +22,7 @@
 #include <crypto/skcipher.h>
 #include <linux/key-type.h>
 #include <linux/random.h>
+#include <linux/once.h>
 #include <linux/seq_file.h>
 
 #include "fscrypt_private.h"
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
