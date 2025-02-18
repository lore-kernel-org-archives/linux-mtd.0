Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FBE5C021AB
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 00:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ipTvYfIr/2uEnE+phEFnWcuT9C2TwyHkaD0fyQPmKfU=; b=T7/XjKhZHTnfUg
	xZFEovMfl/Z0Qj6WdtDJD0Uwv3+WdfpnJVszsHyOjYoqRnEmH4508U+578GTPnt+aqbSpycwFN0c/
	w4MAlzp5DbIJ2uIVd9zjGFFOVn4NDmJ/zLBIcNZYd+xqztVtvXnWtHQ799rbq7ORr85+mc9cht347
	kCjyT5iXOks9/Up+7KpB+ShaF5VIHhxTRBAJ7MPWaFsuq6DwXuPdHtkYO2nNrQlsHtPy/gDkeZ8gV
	W+GT/asHxdA1KkRinweBZ10AKLpmci7X7TR744CLipUCe5uehj0Btdwc6tUk3AeHe2IdJo2jcdiUX
	bQt6BbMXxMbn11wWp5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBH1-00000006JQc-2pcS;
	Tue, 18 Feb 2025 00:15:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkBGw-00000006JQ3-38g0
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 00:15:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-220d601886fso62999325ad.1
        for <linux-mtd@lists.infradead.org>; Mon, 17 Feb 2025 16:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739837734; x=1740442534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JN2iutZ9oiUNnJz1tfQzMPgQIU4lazAQ3TONTUiQbUk=;
        b=bvKAuG7BvQfOMXc//uVuolSZD56/kfFGfNJEENgGKG4w+glBaFbuf7aYJtZNFVsV4b
         OPvZw7sUm7kWhL6fhj5L0oA4S+chH/q/Uk2Hqq13qRicZbp8FyD47CTSeNynDAlH4TNG
         T/gdX5zsEkMSG5aKk92OB9RMiYJuCTnrx9e/ZbHkVA8H1uhCxHboyUhRCQzIUf20yzLE
         8g967SdwK4RK1/pip9+5wawWbFgMvhVcVQjEkgpdgtXfFeYwSIyGODIWargBYNEjjV9q
         YcQobIbIqqz0BMQgBpO13xVRmApz5E22d949mPn1ca+lkQm6oAPgtUfSI0e6R3zB1y44
         1Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739837734; x=1740442534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JN2iutZ9oiUNnJz1tfQzMPgQIU4lazAQ3TONTUiQbUk=;
        b=tZnJPDfyI126UbrqqVU92O0HzoZgumZ3FJVvo/3HyCrjYjmrViVuz2e6jYnvBMcsuw
         e1lNruoD5ykvu01o7GadDCnK8BrDv++fxN4pu/85p32rVJB6opqJQBsY9hx5yPFI/qUT
         6F0RhYPjjazj57rEH6BBD3wDflmQEWLsUuj0oUz7vUp2fzcMZDtLS50PyvWzsjbpdepU
         Udqd/ZdvFSifnsVra+9rgqlkYYjNeZb4b1AzD3Dkp32X8GVxmcZrwmC0Cy4Jj6bmGJ1e
         V+xpWXCFVmGGiigu1rDMGR5AdyBKrC7JEYvoRoKqxPI35IffTKF4efFhegKq9q3MYBXe
         4eig==
X-Forwarded-Encrypted: i=1; AJvYcCXnpPSpebQS8ZGjh+QBtPfcHs1c/WYhOYyAfDW9uetaMSmHcDwIO6PUlDy94Mgu60uvXMMjaiGqrBs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkXrdGmT1BBRq4t1ZFKiypFfwMQDvaYMjj7mgLLxLwIUBU0tYU
	VkpebuTqd1JDcvAPS89DZn98bYK5loebmf7vJ9ogK2h5B9i+SQbX
X-Gm-Gg: ASbGncv6X3fgaOAkabkthqln3P2D2BzZEXeHDU98TlGGhH//QfCB//WGwTwW5Dm7umb
	7XL1JYgacyBHixzLgpN74P0L2ksT4Pk0xNhFyFrwtcolweaAf3X80C/Kv5EoHYVuDHSLux9YIYP
	KjYTB6Di3a1AJa5x5tyPOXO0PkdFkfpGZtOGr/EHTuhiCh9zxUf8focXDL8JxjwvL2DFrVrQw1a
	Qh+laPrlFcpYP1NJWuP8syyVn83VtJvAgcvyx1dYM1dJO3980Jx/DXM89ozlqYtEcp/63/gvVmS
	PkDsgQZOM+axtqP2kda0cT3JJu3YXw==
X-Google-Smtp-Source: AGHT+IG4a96ll76IStBIwsrJIWaw1tpNUwrcuxKvaJD3ZM8Q1rZY5TWARY+GIfJvqTT+Fhf0VPs0kg==
X-Received: by 2002:a05:6a00:1707:b0:732:5276:4ac9 with SMTP id d2e1a72fcca58-7326179e943mr17566832b3a.9.1739837733689;
        Mon, 17 Feb 2025 16:15:33 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:e94a:c6e7:6507:f007])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7327eb20b98sm2554519b3a.147.2025.02.17.16.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 16:15:33 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH mtd-utils 1/5] ubifs-utils: defs.h: Include <fcntl.h>
Date: Mon, 17 Feb 2025 21:15:08 -0300
Message-Id: <20250218001512.1862030-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_161534_796177_DAA57A83 
X-CRM114-Status: UNSURE (   9.20  )
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

Include the <fcntl.h> header file to fix the following build error
when building with musl:

| In file included from ../git/ubifs-utils/common/defs.h:18,
|                  from ../git/ubifs-utils/common/bitops.c:7:
| ../git/ubifs-utils/libubifs/ubifs.h:313:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
|   313 |         loff_t ui_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1341:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
|  1341 |         loff_t i_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1342:9: error: unknown type name 'loff_t'; did you mean 'off_t'?
|  1342 |         loff_t d_size;
|       |         ^~~~~~
|       |         off_t
| ../git/ubifs-utils/libubifs/ubifs.h:1899:44: error: unknown type name 'loff_t'; did you mean 'off_t'?
|  1899 |                              int deletion, loff_t new_size);
|       |                                            ^~~~~~
|       |                                            off_t
| make: *** [Makefile:4822: ubifs-utils/common/mkfs_ubifs-bitops.o] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 ubifs-utils/common/defs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/common/defs.h b/ubifs-utils/common/defs.h
index 7ff1771674d9..2cea4993e15a 100644
--- a/ubifs-utils/common/defs.h
+++ b/ubifs-utils/common/defs.h
@@ -6,6 +6,7 @@
 #ifndef __UBIFS_DEFS_H__
 #define __UBIFS_DEFS_H__
 
+#include <fcntl.h>
 #include <stdlib.h>
 #include <stdio.h>
 #include <unistd.h>
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
