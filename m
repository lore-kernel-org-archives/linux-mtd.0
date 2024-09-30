Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A52CE8341
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Sep 2024 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCpvWToqYqhSNV0iMLT//x3svokQDNAUGyR5bvWEmk8=; b=RyYU1z1xo9fEG3
	Hr2BWQUx6epU9WpyWy77jhngUqlPQ7DFgEeEau7OUWEuAt3NHOWWLjAaxqasgNmMu2BEwoujWqdBw
	ZHdnJBj5YjRa1diy+3E+PHbQXzcgplZuv3DogTxq5FloA0w8nGwL9V4+SUCmBwsWnXsFUXB4Sipl2
	OMtYfQoZWVsofTzXqpcX1o6G3KPS7CzKfIKGnYaMIIUY3aeZAMlC2ikZPQ/hokuWB5j4v+qUGtF3d
	Fo5+5EPyULt6IMQXhoFreGq5y10FLtG1kSa61Kw0HkCiczV2J0pUFdNfQgVB1XVimKL6D+/HbiQFx
	29rEuOvSn0CgpALZ+m5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGBX-0000000HE7f-3FDY;
	Mon, 30 Sep 2024 13:11:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFec-0000000H51d-0fiu
	for linux-mtd@lists.infradead.org;
	Mon, 30 Sep 2024 12:37:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so33159365e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2024 05:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699849; x=1728304649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=It3uv8+V16fpn+saBfVIlpi9seKMH0hwPDwquZC7SM8=;
        b=VyXeEigRO/aU/OuqBuwIsFiO1XWdPOBRdmq/LgeHCr9m1qgptnrqHbZmvZwa2VMg4Z
         Cu9xuVobwZoKeOf0wmsvyzt/27CAN6d8WtLOMBopbW5DQolizv7tpy7Eo7DbDceJM6RC
         MJXJ7nC0XFVzLU8WY3sULqD00EHCARCXKAdchEGBQBSZPaUvCy5R/NI9i0iiHSwSBmBm
         xMNnnQub20pq+rFZFI6mSGTnu8JHob5T9F8EVJ8vVloorLYKUw/OHCqtXikwdBcMQLmb
         Fyhgzsmb3G0U02P/jLMP9FEpC4hRPgcWztakjNChRzBhmmhIHM7znpEIoND+jFGKyn4U
         kosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699849; x=1728304649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=It3uv8+V16fpn+saBfVIlpi9seKMH0hwPDwquZC7SM8=;
        b=pPHI7EyDpCyTDj3j/mU7GdDPfPZePyp6HVAGVl8qSO67FCfZNZ1EJ7dxvV/rhrPsYZ
         lquPldIegaD+kzdOq6yv9ESQM67K/+eltTWQZ4Sm61S/arTWcq2yvImPSSp4WBJusfGj
         5BIkvh00UXJsrnHAYhCEpPwMi73ZjHFuIfgF2Rsw2Ilz5v278ubvTtxYWldKIgW5DBbq
         MmT8XFgwROs97Ot+W10ruFXx1KHAt+IhFsGGzuKuokeyU12hDa+dQ+sTaFJh7ekEM0RL
         rcCA30Jp6c0RX5oF5Vsu1YPvm91I6H/R9HwHmng2GFeVac1Lio9arTH5pMyarXX00saM
         cYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXCe+XvB+d6mXnHl651E1801S0if/0RhoSzgnknSgrMiXpLPZNMwq2csx4ekaoTX2+jXqPYlBzA5w=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzVSrrChse0U5qgUCKJTYuOJGl0QcjDZWhu7mHO6B81GP10TKJ
	Fsp0dvRL7uPS32R8BlTCqc6kUcyhnriZS3gjKj6ceBvqQgtv04Wv
X-Google-Smtp-Source: AGHT+IEqfXUL1BfL9uwnKBRwxBvUK5HW+SKSYQE3kTn+gocX4MXts0u3yymxZU+7jyC+w/S3B15WBQ==
X-Received: by 2002:adf:e888:0:b0:37c:d344:8b42 with SMTP id ffacd0b85a97d-37cd5a874bdmr6237784f8f.15.1727699848530;
        Mon, 30 Sep 2024 05:37:28 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:37:27 -0700 (PDT)
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
	Jiri Pirko <jiri@resnulli.us>
Subject: [PATCH v3 15/19] lib/test_parman: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:26 +0200
Message-ID: <20240930123702.803617-16-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053730_322646_EC554E5C 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Jiri Pirko <jiri@resnulli.us>
---
 lib/test_parman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_parman.c b/lib/test_parman.c
index 35e32243693c..f9b97426a337 100644
--- a/lib/test_parman.c
+++ b/lib/test_parman.c
@@ -39,7 +39,7 @@
 #include <linux/slab.h>
 #include <linux/bitops.h>
 #include <linux/err.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/parman.h>
 
 #define TEST_PARMAN_PRIO_SHIFT 7 /* defines number of prios for testing */
-- 
2.46.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
