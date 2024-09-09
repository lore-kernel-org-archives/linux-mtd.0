Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F0CE6FE49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZWOJ1WZEcYe5OVlxQfzLOUlNFNipBUt4rpwk5mH4lKQ=; b=CcaPbanjlr1tyb
	ysPKVnUnCeKkZRvbF61n6B8gQ5Pc9gg0DKW+yknEklRQj/J8VTmmBSvHjpvVSSyrZxRpQBr4q95NY
	8e/1/1U4Nf0Ru/5k/80K8ls58yZnNc2g0ax5qzcWAIx21TBTu5I5gkwwE47ZURsWhplSgf2a9pvd1
	+lgleNn5EJfLwAK/dUnZQYaFEj4T3CEW8cN1Ytg3x2sHiGiHUijX0sSusSPOMuJcI8unq0OnKa0Fq
	93XQQu5JSPsQ+Cx3z5Sq5NzE/orFWhYRvq0lx5KwWmS8Yd5P0TJL3U1BQI8i8UtBk1OZjGgG8C1sH
	ywIFsBPnU7cxyTVVI6zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZHa-00000000x0j-0hTx;
	Mon, 09 Sep 2024 07:57:58 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZGq-00000000wJA-2gU2
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 07:57:20 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so3047945e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 09 Sep 2024 00:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725868630; x=1726473430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
        b=ELsUfr0VHh2+E4+eJ2OAAb++BQlVtycxzBN56EuyNO2G65DEHQG3GeaQc8Xa42Oi4u
         pT2f63vrc1wRMjaW2Fza2B5010oi/0u0KuQsMRBj4hNrv2GBQPI2xgJ3MpDwzKo2/c4J
         KMfOczxactLjDsy8uLx+Vsug1AFzkjh6u61TBLwC2t6AD8D/FezIpNC4jkCWzDskPdHU
         h3XfiKIoWlrVN5s/BN63mkr2G59fjXF7mp8bTyjQ1Qfv8cD/fG9PCmDa0DSgJMD3WteD
         3KRfse+8skrwvtyN0LwZxDZr5qufRKCqIsN67+5/NIHtawAS67GJv0xxjOJLlsD76l33
         oMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725868630; x=1726473430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZ/CxQk74jojRioxhgvCcab9AFX1uIzQFXWshuJb0bA=;
        b=ekn+jh4eQBW95x6IH0nSGXfzvWTAbID6T16AgyUGP69dD508aW3/x5/7dvrvBOAnG0
         WhuhIQAeHwqJvjE010/aleTbzVws4kSDgECuWa6EQpMA4pAB93PXLJTPiRVYb7Bn9n7C
         74RlezrqmyoR2Z8rZ7aLf/ynNsA6mDJkxhJtRNEhkdKPkJM9QXcvnHpmvcNTZNAzuRlm
         LNlpMhJez2AzqQ5WhdGSZ0ZOWLAVTgLKY+ElxgDS4syqHUjSl+5whGSTkJ9q+LUA+aq+
         DF4+Sy9Z+NksCAbVHx+LM+gHCrgraHtrLxWIhbTFMAYTJBohHeZt7Km5E5+EjO74/II5
         IX2w==
X-Forwarded-Encrypted: i=1; AJvYcCVG8T5DUse7T/uQTz6vTJ18m50wa0a+gV5SJrlGGudZ19d6JF1J4Y7EZtGsmSNs2dl2s3v7mJL8EoE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqkwUHONoZrrH0SYpo2VopS139+sRfbyqYUG+4qgGm4kJNCLoH
	oNplpk3yeZvi/3WTd9kFXvCBx+ed8nATBSLH0rgdbQtkCfK6d3VE
X-Google-Smtp-Source: AGHT+IE10L70PE21eNLD25lAB8aBB8jSN0E1SHrHS6kqOQxmGH/7X/EdRl1RCvLCQcBxps/pONHtBA==
X-Received: by 2002:adf:e8c5:0:b0:374:bf62:bc91 with SMTP id ffacd0b85a97d-378895db711mr6586624f8f.25.1725868630119;
        Mon, 09 Sep 2024 00:57:10 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:57:09 -0700 (PDT)
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
Subject: [PATCH RESEND v2 15/19] lib/test_parman: Include <linux/prandom.h> instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:58 +0200
Message-ID: <20240909075641.258968-16-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_005713_087191_F2D9E5DE 
X-CRM114-Status: GOOD (  12.70  )
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
2.46.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
