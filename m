Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57E33C79FAA
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j94HNOeRiWm86C1AKLNypMSEu+7N/sBELGdtPcnDLIQ=; b=d1camQk5fyPBPx
	QSNC/Y1/UgYlXLj7uoAF9Fsol8k3h1xMjgonSMsnuY6KHSTd4W9JhgqJMzTL2fNpDIP39Vz05lpfb
	VCk7XZlSA2OW9wydT2aVuAh0/yg3GLRHDzdk7Scdd7dEcYu6pH5iYWnAmCUABDYGyxb5ZF4xUdxOR
	JHym/UhefyXiiXTGdF7dMrq3IX8aq8jwikGoyUxqRYhMlNc99HOWWq3hv9DxtUACMOKNx/aBmY7Q6
	vqUAq2te21OoPEg6S1wLgNuAo1QWkgVllsD5mb6xl8owsTrH6+x4Lq7NW9Lpm+9lUUISJhYx62HT5
	/rfKVncMA/pTtZ/pUphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C0i-0000000AufW-2vmH;
	Wed, 09 Sep 2026 06:42:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4C0f-0000000Auev-3iEf
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 06:42:19 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso79720475e9.2
        for <linux-mtd@lists.infradead.org>; Tue, 08 Sep 2026 23:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936136; x=1789540936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6tvZNI4t5/tOb8RX49yOghwxoZpFGQ6EqhK2cKUEWg=;
        b=c466qb/4B0mbyL2vt3ZWXPg8f7EYcm+0GBTi1z13cdcfkTF92AjLMVf2khPXjSkZXQ
         OkakOVmslcUDqamcf3tEgZTD7wE9BQb2NDWcY2/LFk1AXn6dnJkx9OCtlQxeAcOm69D3
         oH7vBZrUDpxM82ZxbvdlmswTTSGvW6Bv3d6RE95EO7QbsUAZbfvkBhsfU7CPXDKO29oQ
         BIdkEE91uEWsK2MUnv7RCatuT4nYUox612ycCvEZxEGuuDnNkVaHYtN8+WL3SLEHTFq4
         NkUnjaeWqyq1WVhkZim/KUtwNSlaxhqstum+9LBg/B3IDYOtEgHckpsdRqV7faeV/+l0
         s+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936136; x=1789540936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6tvZNI4t5/tOb8RX49yOghwxoZpFGQ6EqhK2cKUEWg=;
        b=qUr0H/7dJj8yk0vRnX52rlNzEgjYGtoo9/MRuxaxZ+MMU94HaKo+Pk7hGmT7x4yqaa
         NXrStEq1ZDljOU/nmD71vAyYR0Be8wFg4RJyrlpLq2Y4b39iqTjHusA66EhnLJJZk98d
         lkl7pFfcDSlRfCO2yRxFapwn2ppCGK6SdexqFuYAJzkty/4ietQx0gJ+PX+iin3vu555
         zGrkc+g/7PDgF/TzGE7k023t7l3JW7FQGn/YrdsSt1yX/NU/zEvx03vn9n6HlIIY8ngH
         duVMJF5Tr98Ms4GhUAYxj26aQT5nuAhtgvdOG3qTyJY5gRinIlL6SMD7ZXTiZ0KLiD+L
         uc0w==
X-Forwarded-Encrypted: i=1; AKwUvBxkwc9WxPdxoDfQRm6DdeTuT6BlLPaztzcKpij3wuXpoIClRwcXjkhPB3bZ7SwMNsjXCqcW3LfJCD4=@lists.infradead.org
X-Gm-Message-State: AFuF++lLdZVPXTIx+/VfBl17A/Z+hKR/1kS/YcNaooJrSTZuVfcH77tr
	xgO9UNx1zThQQxaSBIehjkWPzL3Gird4caqMEcNExW/22e600viWWxHh
X-Gm-Gg: AYBFou1JJG0WlleWeMFt2ZKwXPpkjrnr0oizB8bjqBmB2JE2uzLC2JKCO6i8Zi/U45g
	XtN6YEJb7mJEocLTHBhsrm/Z6i0PZxc6zaRl/h4KYwZ+nqGAYdyiXHMGLFMkQCiLOZ7gfbRD08z
	flJ+BjGe41CbF+4kU2r4WQJBQIZcJamgUDVwtyCLOnaVcFP4n/XXGXX5wjXtsT9UCQ8BWoIYGT8
	x1tzjNAve3dgo5mLd05n4sny9/y6uYNAse6KQAgux693Lb1Kaxp3Idlo6KyF3SJGizO94+gzpxY
	IgEVwniurKomnzxjmm2N3ScR8tnmhzHs7WHyuPWEl0oD4aZH8EeVTnpFXajmuidIEPTq3rXa/lX
	4o5Cw5C3OCMgPpXgKivW3WGYJO8bs0XHT6st0X963JfwDZF7tvkyr1hL0gsxlpwoXK+/zLrVg1d
	F6qT1VxEKuNYZnyFn2vK3xAm6uDd8UBUhywLkLzIke0Lj1o3TVJhTNlzxS0YbVbr5zaTPhVlRaV
	IWXFBJywbN7gPIuRs7/HLWZ2nXixuZJHtISkQFEd9zQxi+DTlWC+3ARjMpI/+9qS6ppUGOsWdt1
	z5YJ9RVp3CXxlB+F/xUlxTYRtXMudfby12ROo2eMePynhBHUSclJCzcsz4jFtQAC
X-Received: by 2002:a05:600c:358a:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-49cf82070famr332881865e9.2.1788936135696;
        Tue, 08 Sep 2026 23:42:15 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-114-212-219.95.114.pool.telefonica.de. [95.114.212.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm600953625e9.5.2026.09.08.23.42.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 23:42:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Peter Pan <peterpandong@micron.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spinand: Fix spinand_manufacturer_ops kernel-doc
Date: Wed,  9 Sep 2026 08:40:55 +0200
Message-Id: <20260909064055.90235-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_234217_931701_46F773F1 
X-CRM114-Status: GOOD (  11.27  )
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

The kernel-doc heading for struct spinand_manufacturer_ops misspells
and truncates its name as manufacurer_ops. As a result, kernel-doc cannot
match the comment to the structure declaration.

Use the structure's actual name.

Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/mtd/spinand.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..0bd3f30ea57e 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -399,7 +399,7 @@ struct spinand_devid {
 };
 
 /**
- * struct manufacurer_ops - SPI NAND manufacturer specific operations
+ * struct spinand_manufacturer_ops - SPI NAND manufacturer specific operations
  * @init: initialize a SPI NAND device
  * @cleanup: cleanup a SPI NAND device
  *

base-commit: 893e11787f78e43b534e252249ac3fff4d1333f8
-- 
2.53.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
