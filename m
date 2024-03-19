Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908D9C54E68
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzkw4lki4Yq8zxA+XLO4vZzmiiewoIV0kSNxVwBzmAg=; b=xjjp7TKiIvYKFe
	5Ivck1T4412qPPDVheudEBWy6ti/ie5pycpQL8LU2yJTcXzYRmXEcjmhQk0HTBCOp+1vTRWiKFzo/
	+8CNvLVdzfmdAtLE7B5urLZPP58kathF2xRHmZAeSOgxTyDk2Fy8+ptHjjBtgz+oVNnc1RrtC92W+
	DJHqmOFlvmITyIi1nawVN00ugrFqQsg5XcOW4bJda0nNfL9sgSQjxiNrzkYx/tVEUCZjr7YqO8sve
	iWhsIEMcSbdCJ0VbgFCygpM+G/BaEDlLDdKKPjGhteCLTLe0Q2HoHcjDsu+YP9Mxgsw4VNFeVmKJ5
	+cWoc54SzwOBukQANvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVsx-0000000C766-10eB;
	Tue, 19 Mar 2024 09:35:55 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVsb-0000000C6ro-0lWF;
	Tue, 19 Mar 2024 09:35:35 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1dc29f1956cso31368175ad.0;
        Tue, 19 Mar 2024 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840932; x=1711445732; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e94g+9vzH11aUQZhgMcMoQcXNPU48KmdzBLfG1dsEIk=;
        b=HnzpqLePyEFWC3PPJZ5hRfareH75Wbhl/eFH/53gVisj2r1oT6Rp3392ZSdzknmLdI
         9NkgCC1P01hGZYCuDyC5e993RHuNYMhlblYZUAxtFKPBcDM2LG5Z7gYJFNmfoXgKTkQ9
         Ynr90WNf+L+92F8O8pP9wMMUIUCVvXZnM9G6tVU/MFlYNqPs8xrsyivT2qzIRQO5oEA0
         0dK2MMBSNln1xiNN/UXUq5syh1NYeXfZrk2Nx0v64vD2Kam1rVSZV32rmq4isPe9ZO6y
         /+6hDRKrt7TraEIXDI0t8cd0ypKLa9I75thcZsnjeVdNpWtbECzhI5lKB9hzxSvVK2mv
         utjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840932; x=1711445732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e94g+9vzH11aUQZhgMcMoQcXNPU48KmdzBLfG1dsEIk=;
        b=FBslhEs0Zh7HXmdK44P5ty+DGRNaPIy3KGwRR0VkyDYD4g8cW4rkXSZNn7YtZV99Wh
         0UE9r32HjdYp0JzBissNrXMh2T3ivZeq2GbhWS2lLkd/bBpGCR0Q/9xZH1aAnW7hgoob
         xh9NbzhKLB0BemNE6qTXZVoZooh4k9njB1go7wrcw5HrKIXCtw01f3DZi36bT1R3f0qg
         uM8tRie/jIT3fB8hxBf3OUzpQ1nOohCYJe+kMDlEKIm56hXkN7eWwty257aEb9hAx8OI
         0nIp1/2U2zU9wq8KPfhZ+BNxPrqdSn0anzDayFSSIsTqRxqt2TX/To1YWyxUCnMxFPIu
         K5LA==
X-Forwarded-Encrypted: i=1; AJvYcCXVveUtB1iH5y/jpM9L8xEgwGdhgrgKaPqhOLPnZgqpFpHS7VvkVM7joC1jygkErMjMUU7QVCE3IMCIf6zOyvG1Snl5VlFZeEE5VkT9wJhs6yirkv4SMBNtADUQSZG9giS0RSJ0h0bK9AwD/CosVMHH7jXA
X-Gm-Message-State: AOJu0Yw/pV6Hwmev8dKzDW7DaODr7u1PhmyzLLXbUsQXc0DVlKzvrFqc
	sD7GFpiyPgGQPhcceiHMx57w9Z8ZWjeYx+WK1tSVqB8d0MDIOSji
X-Google-Smtp-Source: AGHT+IGRQerkxhBoo9SgQmB9rahSKXo6Kh9y5bn7m0LW33X3wWAr2V/9ZSigvft5pwucY8WqXpU8Zg==
X-Received: by 2002:a17:902:ea08:b0:1db:55cc:d226 with SMTP id s8-20020a170902ea0800b001db55ccd226mr12398549plg.66.1710840932208;
        Tue, 19 Mar 2024 02:35:32 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:31 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	manojkiran.eda@gmail.com,
	jk@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 2/4] mtd: Replace module_init with subsys_initcall
Date: Tue, 19 Mar 2024 15:04:03 +0530
Message-Id: <20240319093405.39833-3-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_023533_264266_F1812864 
X-CRM114-Status: GOOD (  12.98  )
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

While engaged in development on the espi kernel device driver[1],
I noticed that the espi flash driver, utilizing the mtd subsystem,
appears to initialize before the mtdcore subsystem registers the
mtd_class. As a result, although the mtd device for espi is created,
it does not populate within the /sys/class/mtd hierarchy.

Given that mtd serves as a subsystem upon which numerous other drivers
rely for infrastructure, it appears logical to adjust the module_init()
call to an alternative priority initcall, subsys_initcall(), thereby
ensuring that the mtd core subsystem is probed prior to the drivers
utilizing its infrastructure.

Although this adjustment alters the initialization ordering, there
exists a slight risk of uncovering implicit initialization ordering
issues. However, I believe it is preferable to prioritize it reasonably
rather than having module_init() in order to maintain the exact old
ordering.

Link : [1] https://lore.kernel.org/openbmc/20240213-espi_driver-v1-1-92741c812843@gmail.com

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e451b28840d5..cc51c9fb2c1e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -2560,7 +2560,7 @@ static void __exit cleanup_mtd(void)
 	idr_destroy(&mtd_idr);
 }
 
-module_init(init_mtd);
+subsys_initcall(init_mtd);
 module_exit(cleanup_mtd);
 
 MODULE_LICENSE("GPL");
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
