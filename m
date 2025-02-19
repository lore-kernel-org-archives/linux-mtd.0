Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA021C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hOBdtjzmPWpmAHWVRJcVLY/SjvuSYyTzsqvu8QIMqZc=; b=20W9gkZi/42eJT
	FqBKd1kq/+iIxxSSIBq/jjtinI0sGnq1Jdzy4rsX9DBp2ot4hSUTZfN1wMoxRUQ/Eope97/LwCAoM
	azwPJRuVLaNxfMiRLyxN6lCXHKkLSPPqrjKik8dnxmCnZ2prTqCf/iR7fz7gsA6rw+cWk5G0M97so
	RgWOCarCXxFl4F2ZSOFka1CQqMAwDjO4n6BNB6Ksx2Pt5hQwDRUUb4xva6VMH6CMkdv/bH8Z5GtRF
	Ch16+8ujAXoFnQ/6rEpTySxpz6Ef5WzPVatuy2rOygiSMH8VPFbj8vVFwCT9Omc6lDiAwsU1Y6tsL
	LdsltL6zLHleE2d3pD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjkg-0000000CqaV-1cSv;
	Wed, 19 Feb 2025 13:04:34 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkjjA-0000000Cq6p-1YqG
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:03:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-22101839807so92651665ad.3
        for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 05:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739970179; x=1740574979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FzLUVhkaqhk5OlbWxenunmRCUkCA5f8TQQrQO1VAdtQ=;
        b=Dihll2Kj3d40Q34cT9VknF842AS2RwJdVZiJK4O0I5+7W4YXtH+5Jr5LNjEGxZlv4i
         QxeGOJlSnx0ft/bd9Z9hB986quQHvnHlYOa0Js7AYh+6s9NMmhkkJwI1sqDBhpBm1yHD
         Hr/vgwNjgF0fzI5M5XjqeyrgGkAPW2G6IRYo5IzmUQFd8Ac4DTqFch+i5nDdfmXLFHLM
         9pK1/8NhM3upyU2acwbhK95uJppGk5FxhgKwMTAFDhX/Hbrp2D4xmKeM2rHrQkmHomyL
         mBNQl1okhLsPa5rEmxzIhICREShMpruovu6clqRiC3xOeH2guWigZkrRDrhrsRuVbrac
         IWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739970179; x=1740574979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzLUVhkaqhk5OlbWxenunmRCUkCA5f8TQQrQO1VAdtQ=;
        b=Z5nJBDC7Jmz/S24N2uZj+xnKf61LGbX7kP0w2Ks7oQxso6u/4zQVB5xVzn+qbQ3uSL
         D3/fnwHjNJX/7B04mWqrz1sGJaGZWLBfhHMzXVplC3lyMaxqa+iuPgGr8uTj99AGC/Z1
         vCeX/+vJK/nJ6rrxaCyuSP0uh4lho6VK4siRHFIolQLogJCnFF4qLlUSqzUogQAxmnoT
         0fHDhChph7K6YGjqCOYtCyIlOFr44oaphehNqFdQfOprCNKRF52tmJOlbe3HQURqX4Ga
         UzJFpF/Y7D83+o1JQFSQKkq/z6RaeYu01mvkqUbx9s7KxUi6ycVvlF/ZmH6JbVE4eDxl
         SvWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWKZ8egH6JPMx7Sk8N6QduvgrPUdq3EDHDB7IWthI1g1bVKMSuI0hyOTyKDUrVD8I65hCeGgK6wIU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTD4471MmIzvmyphPptUqovI6hqetQPjfyOV58M2YIzLXvegiZ
	x0ijzZv1Ru4Z99RCvxoP6927uRXXSiy91S9cLVU6bQt8N3mmjwuNtgYLhg==
X-Gm-Gg: ASbGncsUY3ZZzFoCuG0dHd0KQOSBvpF4E4VciUfxyTlQrOLPF7Zf0sMO80xd0aW0J1u
	I4KyTQo6hzIye9MBJnaIzz5OuXzFGd6OVxJsIsNDCFfU5v+k7wig6n/8jyCp7G+dnZh7RfLLBkW
	mFHySiGU0lim4uwqOY4wAk1o2YjfEHRYXDKzdYZ++LBISVc4ZOL3sCbLI2eoGfhijJ0rDONLZKz
	ADWCOiua3atp/VHSyCCdwcHdihUX8RRXCR1kIdD0DK688NAE2go9GM8M/6dfp1OkuGdV+jAtsg9
	PwIdn8sq1kH7QNjiY5s3e+OtlyaC
X-Google-Smtp-Source: AGHT+IFejKqGs/zixIMlMectZmdIMmL8WpgewA7AmOp5UOC6WoJE61w0BnX2wyODm9E4WYU1vsVjWQ==
X-Received: by 2002:a17:902:dac2:b0:220:ff93:e12e with SMTP id d9443c01a7336-2217055f596mr65170445ad.1.1739970179182;
        Wed, 19 Feb 2025 05:02:59 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d7a5:133c:3d2:703a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22120093e41sm57503565ad.93.2025.02.19.05.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 05:02:58 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: david.oberhollenzer@sigma-star.at
Cc: chengzhihao1@huawei.com,
	raj.khem@gmail.com,
	linux-mtd@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 mtd-utils 1/4] ubifs-utils: ubifs.h: Include <fcntl.h>
Date: Wed, 19 Feb 2025 10:02:41 -0300
Message-Id: <20250219130244.2119582-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_050300_407836_1543BD61 
X-CRM114-Status: UNSURE (   9.39  )
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

Include the <fcntl.h> header file to fix the following error
when building with musl:

| In file included from ../git/ubifs-utils/common/compr.c:42:
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
| make: *** [Makefile:4878: ubifs-utils/common/mkfs_ubifs-compr.o] Error 1

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v3:
- Removed Upstream-Status tag.

 ubifs-utils/libubifs/ubifs.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ubifs-utils/libubifs/ubifs.h b/ubifs-utils/libubifs/ubifs.h
index 0908a2289208..1c7bc7bd0c80 100644
--- a/ubifs-utils/libubifs/ubifs.h
+++ b/ubifs-utils/libubifs/ubifs.h
@@ -11,6 +11,7 @@
 #ifndef __UBIFS_H__
 #define __UBIFS_H__
 
+#include <fcntl.h>
 #include <string.h>
 
 #include "linux_types.h"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
