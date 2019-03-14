Return-Path: <SRS0=YFz0=RR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72725C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 08:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AFB2184E
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Mar 2019 08:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqa93Os7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rTku9ekx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AFB2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rMQvSZEMdNm4ulvpT2leAzO4S1E0D3UCtdPzVt2iNTE=; b=jqa93Os7LfWQtk
	+bqTLq1v4JMin7siVGVVAf6vDPvPXOegkMfnLZySzqYjQai71y5tot8UG/Jy56Aw0fQSJN3/WJWGP
	pfLfco9uDK39YFY0cDFXuk4+Ajihnza6N5+Ep31D2UezjX2ZZ9hX+luW7kZroSvkRfrRgp9aldMw6
	QhDBUb/S8e3Q+GxfIi1K/e0nUL4uQeJ1wKCeTcBrswkKNF1lwacTYrF49Ww/pcxoAmJxOq13XYkA1
	RYpDK97v/redH6cCpFZXhVwc7ghngjgpi25wfZhP1A3foWTBbIJBXCk7SOcPtWFjF7jTJ+6mUmzRf
	TAWbRWsjmLZ57QmQRM1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4LsP-0005EG-0v; Thu, 14 Mar 2019 08:38:09 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4LsL-0005D1-5M
 for linux-mtd@lists.infradead.org; Thu, 14 Mar 2019 08:38:06 +0000
Received: by mail-pf1-x444.google.com with SMTP id r15so586970pfn.9
 for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2019 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30vebO2M7s86h+bgRozKToa38rLhn+5TImed8PXHvkA=;
 b=rTku9ekxRqeOqpFkpVZDslv9tFwbpQhuc71cG7VkVF4/FTWDXBGYLy20CpYUk61o25
 qYLUePdfe0AwTST86gRzsAgLGul6u8ZadKZO3JNxpudPg9A+i89qIdcC+6/zSlnglMKQ
 jsI2JjLC7rJ12jgG43AUDSXPjtYsNMDQDCr8pR3ZpxrN0WsKOiKdH2o3YklQgtZeT41E
 600DnOFkg2H7zDfbd9rEWP5eYxvABGpODAqBoT4oQqZ3nUdeTF/8B52flh+8pGJ4ytwZ
 54jx4gWcOuY9Wqmw+7eGu0gW9of6L6mXj7rRqz2mjGB5EjdAowgzErehONEV7UAr//2Z
 StQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=30vebO2M7s86h+bgRozKToa38rLhn+5TImed8PXHvkA=;
 b=nav60GJlT6haQ1AmXW8Tx9Cp0Vs5VJgYLrjsnTHQvejBT73EmkSs7gyXeoiKyk2Kgo
 n/GgZ2XL/7WEp1W35C1rB8LWiKh0IF8hf4E8opmyQx/PdvtheUmFsQHc+AlpBJU3yd+b
 FOLSxgTg+gwbF8drjxvCEd9uPcCHJzuzfWSI2GR0JxLf6qz/bWNcDnTwDiwH/+PmVfei
 7m/Ed4otJTsGddg1dIZ7ls3bR809ditQsTvnTirSKFzSAi8zi50QfAeRXJL+iduh1EWL
 RD3+jZqK+0t3ojD6p9BHaAaxypO+NoKMOuK4kyrfmhsIaPJ03jaDZKcyQslgHU2+Jpl7
 AH8w==
X-Gm-Message-State: APjAAAUVvcJ60+mUPmdkLHPTNaXJIaV2oxB+ZSuEfWfe3y/SNQjTVXZC
 UpBlxlcDhyeRfUxLc2lh4Z4=
X-Google-Smtp-Source: APXvYqz6L6mEkSM9vos0uXnnWgupOgEVWWz8y1Pyy7Od8UEIi7Vka7RAYKD0H0rSFh+Hp/+M9XMCnA==
X-Received: by 2002:a63:4650:: with SMTP id v16mr16281311pgk.329.1552552684200; 
 Thu, 14 Mar 2019 01:38:04 -0700 (PDT)
Received: from localhost.localdomain ([175.223.23.218])
 by smtp.gmail.com with ESMTPSA id g3sm20830999pfo.125.2019.03.14.01.38.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Mar 2019 01:38:03 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] jffs2: do not use __constant_cpu_to_xx
Date: Thu, 14 Mar 2019 17:37:57 +0900
Message-Id: <20190314083757.25039-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_013805_246980_D9097922 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

A trivial patch.

cpu_to_XX() functions are smart enough to detect and
handle __builtin_constant_p() at compile time.

So we can use cpu_to_XX() instead of __constant_cpu_to_XX().

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
---
 fs/jffs2/nodelist.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
index 0637271f3770..b1de897b3408 100644
--- a/fs/jffs2/nodelist.h
+++ b/fs/jffs2/nodelist.h
@@ -48,8 +48,8 @@
 #define cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_be32(os_to_jffs2_mode(x))})
 
-#define constant_cpu_to_je16(x) ((jint16_t){__constant_cpu_to_be16(x)})
-#define constant_cpu_to_je32(x) ((jint32_t){__constant_cpu_to_be32(x)})
+#define constant_cpu_to_je16(x) ((jint16_t){cpu_to_be16(x)})
+#define constant_cpu_to_je32(x) ((jint32_t){cpu_to_be32(x)})
 
 #define je16_to_cpu(x) (be16_to_cpu(x.v16))
 #define je32_to_cpu(x) (be32_to_cpu(x.v32))
@@ -59,8 +59,8 @@
 #define cpu_to_je32(x) ((jint32_t){cpu_to_le32(x)})
 #define cpu_to_jemode(x) ((jmode_t){cpu_to_le32(os_to_jffs2_mode(x))})
 
-#define constant_cpu_to_je16(x) ((jint16_t){__constant_cpu_to_le16(x)})
-#define constant_cpu_to_je32(x) ((jint32_t){__constant_cpu_to_le32(x)})
+#define constant_cpu_to_je16(x) ((jint16_t){cpu_to_le16(x)})
+#define constant_cpu_to_je32(x) ((jint32_t){cpu_to_le32(x)})
 
 #define je16_to_cpu(x) (le16_to_cpu(x.v16))
 #define je32_to_cpu(x) (le32_to_cpu(x.v32))
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
