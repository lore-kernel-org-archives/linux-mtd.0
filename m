Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34A1C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 07:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rL9W7bg24dajQn5V+6X35p0xTi8r6cjPvwhtMSEjvc8=; b=A6ZZOeLP3u8z/s
	/Mfm7W+XtfDkmdzlsrb9LOlF8tb7aIbGQMa6v/N0rdeycGy6tmy5G56QK7wzOUEsWCTvVKvw58hQO
	an7aNPVFE5875zTZOx1KPNHADdivR4+eQOpfWp8R0M9Xc0d7LwMvJS+dS69bzATMttAKuhvLhwftb
	6hyHMfQ1hNtT+uF1ROg/9cXIb3Wlrefnt7ce3dXdVIZjQBI+3WOaoD6CsqiApLDUfhfA/Om1TobkP
	gXYsTmthNiwZJuXjs5KFcZLF1cQCnHqk4IH8pHXmVcoWy7vva8xshIwSCa9GXqxbuTDjDagCLzBNZ
	STdDLDT77Apr51eBnChw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpy-0000000DP0o-0EAr;
	Fri, 07 Mar 2025 07:09:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqRpv-0000000DOyZ-0h98
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 07:09:36 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e52c1c3599so2350409a12.2
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 23:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741331374; x=1741936174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wniv4E+WoHofg2EefaZIUI7wXURdu3G5MTws6unhcqg=;
        b=oP21jH48ipL3N13J22SeYt+hKYfaDigtoT5GwqwEimwppWeF1ujKOmmfdCl0VJ0m0A
         4waQyUOiU4ZO0KKz9eew9/l+1HyK3U7g3S/NE5zK6EEWaNIc1bREg40FUIkk/qEfUl7c
         sMS3x5wWkoiIzDOr9KqExktshxv1pMXcrM6YabYYusEyxWrjo6XbevUX8+DyIHYnWPI2
         sbRiR77KqNcxUNwqfI97P56F3jx1Xlkes8oTLJ8CEaEUHIIUwX+TFoiOKZ6IF/R2JNtW
         IwLU1WvE78lC0hqKIvNE/eCtkXVH7LJIgbM0zzzaTivkaoIZU6SwqwzBkp+ogaJZLKiw
         XbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741331374; x=1741936174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wniv4E+WoHofg2EefaZIUI7wXURdu3G5MTws6unhcqg=;
        b=t7gDO3jr4HW6Ezoiu5L136kMz016I566ZpRYpugOWix4Yu8cXcPTDGSfnIuCDXFIFW
         bRvj+Y6P3DjP5xRaqmzWCZ7u0Oh60QJ156KQEOESgJr8s3IPiBRws+0Vbn6M6BpuEtWP
         juAEmfT0hrNXFx86mnc9ztd4Fw+LnzRV/TFsHyEfl7v5Z8agOALum00BSLqe0VH0ag+Y
         SI0OER+ga49EmtVnuvdldMOM9b7qoFtXxEWj7h8OG8+AvOoNpopBwlH8NWBnO6k0ATBl
         doLo+X2QH1/ckwkHroASgqxMSIcGmhpiypwXzVU0lzD/fUoIVbI6H+PbYuKEweiyGXby
         edpg==
X-Gm-Message-State: AOJu0YxqkOHiXu/ubBiVgEan9Sn2Yvj6dRAJj9MV2V+MPxAy6nnNi8Qb
	AzmOcpCsCP6WrXimhbrXnIionj7a+qaUaGZnjh5e9y4KtBRxxrxnLBFDDbdrX+w=
X-Gm-Gg: ASbGncvVLU7byZZOLXa7fIwF8PDnUw48w3moLt9r6wlDbgphV70+8/knsKgmkld/Wbv
	lsd+LWLvhuZmqcN5OuR4wopDXNFfm4lv2jPn1rYP3Xc7w2pLNlPvI7bbxttsIEpDa0yc+5ZLzML
	nMT3ZRbsqwoNlgMkBc2nOzQSJoPN70DP3dmz55k0vvkPRAK/AEMMpmBIYWzKMAjN/C2Jb+GrSo1
	rDBErwgr3FAvYByDUTsW4IADb9iba3U99rC2RWIY1LMNg/uKUmEH6/YYQ3QtSLrfgxYFW8zvGzS
	bK9viJBjFyeTdr9D/buaAAPB1NB6dIMn/1l2+T4EURkuebE=
X-Google-Smtp-Source: AGHT+IF0KaGKoKQ0ZmXZEsOFxWg8sSpp1Vsw9yIcHJ+SGaPMD8IAbrnteni9h/1sI362IMHH/z2chw==
X-Received: by 2002:a17:907:3e8f:b0:ac1:f5a4:6db3 with SMTP id a640c23a62f3a-ac252b59b7fmr256783766b.33.1741331373859;
        Thu, 06 Mar 2025 23:09:33 -0800 (PST)
Received: from [0.0.0.1] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac239735b58sm223243366b.117.2025.03.06.23.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:09:32 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 07 Mar 2025 09:09:07 +0200
Subject: [PATCH 3/3] mtd: spi-nor: drop unused <linux/of_platform.h>
MIME-Version: 1.0
Message-Id: <20250307-spi-nor-headers-cleanup-v1-3-c186a9511c1e@linaro.org>
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=722;
 i=tudor.ambarus@linaro.org; h=from:subject:message-id;
 bh=pd0N8OHSlq4OJlDzwaqlGUrXS61Bisz7SbjdJpuUGOY=;
 b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnypukKVNCvkCFmlP5mhPK7ENR68JcZ+kMslmWE
 eLWKFOZxdyJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZ8qbpAAKCRBLVU9HpY0U
 6ZX8B/9zgXYPJVYRJk/KxLCVN9dnyt0VEJFakZJkE06vVuH5s9g7bkF3XBQr/4TnnpAYr8dS/eQ
 jFci5ZsvacZMoTwAVsomvqvoSW3SQjlhooXECygfCHI2Eewr/0Grdy6gC2mrWrUdy8WYZoZYvcJ
 VimAPb2CIb7KPIreyWmeVSfLb9QZIaV6D6LO8kqgzEbjWd7laU36pdGuOKcFkJGQ1Zxg/Xd7K5J
 sqOlHW3nQPTt17g/sBfTbC4W4ipHUFWali6/FnqLK1DlQV3/Z8moY1Hbc7jVxAZB4HAl+yeHaoO
 9Clb2+o0PKiQfrLLXmx8MPrIJ/NGSA8DcvWxsLNY8mIgw4PL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp;
 fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_230935_210395_0C76184A 
X-CRM114-Status: UNSURE (   8.76  )
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

There's nothing used in the SPI NOR core from <linux/of_platform.h>,
drop the header inclusion.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ec298a285f820383b2c1d9ef4462a000d1b3b861..deb284e95dbe37fee275fd6bbfcb3ae04e163edc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -19,7 +19,6 @@
 #include <linux/mtd/spi-nor.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched/task_stack.h>
 #include <linux/sizes.h>

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
