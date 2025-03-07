Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7F5C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 07:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eejsrVHHI7lhd/8OlLFEwNsGjqk5Rgw9ZIhtjj1jzCk=; b=H8HrZj3QfmH9R7
	TbCEwp/EeA40RtweTIsfASxxM3hkosBBzVRg/w53goKoUVXQpSth+JMz5rGl2PeoinNuDqzdJv3xx
	p4O/tXAqPs/z/MXsVfKgLEP50y0Tr+6CpZEDAvWQC/0SF0B3Xzmg+/b0L/jdHTeeHOoOxvtm8NMWP
	gTzP75bilWQq/Iw1ItwYsQXXVjg+cg2c9WhbKJrTIHMJp2hVe2+5tTbLni1QXeYMZCuwLv2/K0Akc
	6a0dy4R+OODbSW+Gq4UhShUKVB6yMZCEEh+idrvzZMOc4kg801VouDXHzuyLHJ0ZVSRTBfsWi1N1B
	Cy3uTLTOt3GF+Ka0DP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpt-0000000DOy9-0QsQ;
	Fri, 07 Mar 2025 07:09:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpq-0000000DOx5-2Hnu
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 07:09:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so921506a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 23:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741331369; x=1741936169; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg7karDvLMJmPNzW6MxWPIC6y1838H20TbkfAL9Gibw=;
        b=RIOU9avtyxtuPTdveN18b5TIITgBx1st15q86Six6l7JNvUdT2CpSj5f90fT1mqWEr
         9r3C2kIHh6p/pocWevAD2D7p0K+fcrL/pzt0TbMc72WkKa8RjzOh4CTuDwJ5soUfm1we
         w3eEx5QwXVR0XgP4fzWfnBARRLSVPYJXgsiUSwdzPGyvsj/Szqt9/dE3nNs8L2ty5uKJ
         uGPu3shgNqcFcCCgDojKPIw/hawgULlk0AJTpLEWEfZ2QD8SJOw6YUhELpqq2TvWrwGO
         LhjrBhbive51JdigiwCnLxlQ+qqHhs+hPdmH03mgrISQfUStqV3g6wqKvrw3rj+sqDye
         Ij/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741331369; x=1741936169;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg7karDvLMJmPNzW6MxWPIC6y1838H20TbkfAL9Gibw=;
        b=XZEYudlqzBfKNYM4WGldpSSQnzHSS2opUqe58tVuOPzTIlQjVmElP63ZkdjQmLmBo1
         wCNlAd7VldCtozSg2gGkA9aGer+6pSkN04Ld6ojJdLDelJDX9n7WrRzsOEBmB/SyK9LI
         X6JYl+y22emILoUuf948I7qTAW+mawr3FeNh/bT0SeAArFfsi2zE1lFRKDcP7b6qpiD9
         /bJCqQEVniKr46b5FS+9i6i5H5c+eY9bocyy5KWUkQrI+q2N/yspjQxQJYAmH8ReyaHZ
         TqNqA7TSc4pMnFgrEw2U+VBm1JC2JfTfSDqt42579FEKhYookgHlRsOBPXx0DZN6Kfx7
         vwyg==
X-Gm-Message-State: AOJu0YzDByrZlna81XDB8LGjtN29dqKWR2mBuQyCorhpbCi4YPQMS9Ua
	U6sfcdwlWKI43x0k8T7ILr9PQz42JK5idcXg9zlie7b8b3m7RDXFtsvAwvzCn4s=
X-Gm-Gg: ASbGncuaVa9Cod0lCrQgM8TyAx8xFb9HRxqGL4lHSXlfaPyPkVBkHrrlCmaCD3dk2xF
	iyV9UJ0sQA7nGvQy8bOY2L6hFsf+29uM5jKpRNYYSk3t5vZVbeJNtjNgcg5DhUad9mE+3uGQ4GT
	konFzy/K+EP8Xc6W4cbde/SOUdG5b3FtwQzfdIg2wHgwlpXaGQBk9XEZ5oF2Gz049fPbK/Y0x9U
	+1CPWWzFL06DC1ESW3CCWIqhqIeH4i+mUPTvwx44LzopZygaaiVbEeFnkaqmXIvG2jBr8pSoYjf
	qXQYxPSK5TI5i9VaaTRkUtistIbHqIqFYNddnOfn0tkcWXE=
X-Google-Smtp-Source: AGHT+IFb45mARFX0qP0YlJsK5jevlrLSXeiATCG1e3cn4VFCzms2mMZE64ROEDh5mbg9biN6kWp28g==
X-Received: by 2002:a17:907:3e16:b0:abf:fb78:6743 with SMTP id a640c23a62f3a-ac252fa0fedmr230862666b.35.1741331368142;
        Thu, 06 Mar 2025 23:09:28 -0800 (PST)
Received: from [0.0.0.1] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239735b58sm223243366b.117.2025.03.06.23.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:09:27 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Mar 2025 09:09:05 +0200
Subject: [PATCH 1/3] mtd: spi-nor: explicitly include <linux/of.h>
MIME-Version: 1.0
Message-Id: <20250307-spi-nor-headers-cleanup-v1-1-c186a9511c1e@linaro.org>
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=tudor.ambarus@linaro.org; h=from:subject:message-id;
 bh=4gFhXFCrCygOdMKuGJHrJPlZjnoFSyXVQ1pz+gtMBG0=;
 b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnypujjrfr9giAXetmsb/ytpbqhMbjmbXMIi8d0
 t0BN1PInlSJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ8qbowAKCRBLVU9HpY0U
 6eHpB/91R+qni+lmkln2NU5TlE9N7S2KDocb0p7KLq/1c5gBDDeewQejt/L4T3ryHbDKdckzXUB
 0dEr8Xk4L+NxdWmZfFvUXLliCB+whQlpxPz8V5TYlVdtrviW985x+vR9CCzuUy7eXaY6KuhAtxu
 nDewbXrmAQUJ5fS4bN3DYFQv1irAKsLsYRfZun3hayY4/O75mp8gYoSEEsepUbqq6NY6SVx8cKD
 fjM95x872K0KhMPZB6ibqdWCZ3FBToy73SSALaJeJ4+ae4cgqu14Zrvsg7S4nE3IbiAXxLpMKh7
 /SWQGtQmHtq20MDuk3nIpJTlgJkKoyMfRprstLmOzuAtv/Sd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp;
 fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_230930_588598_E3ACFDE6 
X-CRM114-Status: UNSURE (   8.61  )
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

The core driver is using of_property_read_bool() and relies on implicit
inclusion of <linux/of.h>, which comes from <linux/mtd/mtd.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c9b970f35c6b23a962011ee3c543ee9f4df711d5..1091c83294fa33393f27f914efb254da7a7524a2 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -17,6 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
