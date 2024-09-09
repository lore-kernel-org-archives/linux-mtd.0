Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2EEE6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=928dmCH6o8q3L2TD9qb9F5Pk0BIiM8N/38zHQ3+8RRI=; b=pHxGW3ZK/3nFQ7
	z8yw3BucdfweiO2zmLzueNL2jO3Xw3UmbhSSLd41E7yW34UFoKegSuxs6M1Dq1B2M/20TT/KE+uen
	cR9hDYYXLRsgwBfdDgUJS+smBTsPJMMZuCs9r9RX3CSwP3AjgMikNH72tpSNk0R0BeO+OYyAjloBJ
	WFTO5YinnX2jbj+TcJGDf31vJjc8YheNhGcAopaSLu4tiW46fqiuPo//YZ6bpmKZqKRu1kM+1KFYD
	5LPayzu4z83/ZW4QqIDIGPz306oTbQ5iHk0nlyHufnBKOixAaSD4wnb7Kq6QHMHNoDwCpw78PnOuB
	su5i/TW/V/c3OY5HOU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZH7-00000000wac-1bd7;
	Mon, 09 Sep 2024 07:57:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGo-00000000wHV-2aXY
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=; b=IK4HtQbiBSMgyOvyUgnprXwD4w
	ZuXfRqwwP1WqcCPf80no0/MyM56kba+tG/fQUdenxP9YLHAicUhVCWgmCi42ErM7o6cyI8UQkL4kd
	juE8PvnJXfYVVFuhJwuf2glLwbaEG4zUXOUWmsGRqxCvFZnbkpyXHNGMrBACOdV0nKA7BmWd0PVJ3
	GifOQ3NxlCvUlmh9oTv+iS3ZCyz0NgpbtAAUVEZ78MsjZTyVAUELPYWrB4iVuQufGPiFxI7xm1diw
	2+I/mVVIpf1koYN3GTqBHhVEJEES67W1UzAx5tcN8pulju41ui70tzG5hLrgrSEP7rMaWdoIN7s6l
	qVsIENyg==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snZGl-00000000LTE-2Llu
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:09 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cba8340beso1091325e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868626; x=1726473426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
        b=lvSB+iPbrpracNPpuOOWSRjra09ulyt+m3Kt/KOlLjjDHxrYNLdqbtK5lcUqldHi+C
         oyMmvt+BsmApJTGkj7vrI4VfIXT0FZMWORa0z+fhXFZ4y92Nq6ncvtOYQz4Vi7zTx3AR
         Ai6J+4uH3sxbaYJk2tPrAdtQXuSHQaYCZur7vVr8jnT7icaJGtukSEgjPO41qcbJcon7
         CraeaVfUxjydUnfW3z+KZodzhI1UWRrq9ht582NxADNA4XGfVsvLOWzoa4MdiIvTx9cg
         3771Au5w6a7V6FSMcvuVtmPekkzDM9C3vadPBSS9A00VsKGH1RW2BinTRvQQ8EbPI1ks
         EhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868626; x=1726473426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KT+qqbFYGAtbtTrUYL5Ww6m96yHmU9B4q+0V5LkESPY=;
        b=lBYN3IOvxANMoflvke2/Ws6l7D8m0htoFlarvKhy0RpHAc8ml5zPD7zs55ydFH+Jxu
         vFPU6WO8qH37XtaUQ9R+3hSBJxunbbVq3hcaPuBp7ZIhn/gnZFRmrR96P4DMjLKeao8d
         K9sVw8viiy1EUlsFGF/pICrV7IttnSDTEqvNOILkGtMFoKI5SGs5EhWOG9nLbZdDYG5R
         zZxSMsNpNZu2I+U1HimF9UyS9iMFH1l0SiDQmUzCesdaNOVE4bbhAN7oFYHMt0kzVxYc
         2k9DBtVYqe79Ic4NoKq8nHOvOVHE8SXCwD6kLlb1bz3BQwXtL8d1BH5xDEialWPRYKrw
         sMXg==
X-Forwarded-Encrypted: i=1; AJvYcCUetMwIvKFfMQICVLrDKEosNHw9q1o1qp/hLs4o/Sh7DF0wg+wjYSy4VF5HRxUm5SIypEjumX2oKyk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywk+jl8M2eh7azEMeRrMLppRTwJjpcltygoiREsOQhGf422nqxk
	Sp3Fb/cVfS+g31YhvwnaKSLAwGgSG6DUYfPIDRdBKhCS12k2E5zg
X-Google-Smtp-Source: AGHT+IFPgZJXpjY5OiDYTjI08iQ6tSwI+j2L4W948bn3btzf96vyOqo41buC3MxpwztDunJSgtrhpQ==
X-Received: by 2002:adf:a395:0:b0:374:adf1:9232 with SMTP id ffacd0b85a97d-378885f1a1bmr5455621f8f.19.1725868625748;
        Mon, 09 Sep 2024 00:57:05 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:04 -0700 (PDT)
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
Subject: [PATCH RESEND v2 12/19] random32: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:55 +0200
Message-ID: <20240909075641.258968-13-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_085707_719316_ED5D8EEE 
X-CRM114-Status: GOOD (  12.40  )
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
