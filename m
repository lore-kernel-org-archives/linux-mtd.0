Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38DAC19F2A
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=25tL5VQ/EH5NRCmwgY0hC9ifiLD+RcnHkZhpTc03IFE=; b=TMmgyxdILJxqZ2
	82NqSFp1FJzkf2y3HSAF9sCwEGOzkJAnG9wINb7YHDcvhXWyb4PSkjMo+ujF0DuqR1Z1HmcZ1/3H9
	X2zhEu5dcF2f8mydWEFFaq7QvmV+W+YQEDHKyVlUUx0Xu149pDHudCNbyN0cNK9kM2YrGr89jLlN9
	3w5jx1ZPf2CKLtDZLRnsXaetkmMD6tLc5e8HFXVyph3oPTHp+M22vcqrH/sQ4FitidqVZ4sER1PQo
	t7PWisswd66XHaojDDhKs/b/af0B9ntwcbns+ly/RmzlgEnTIqRi0cs68PczWW1bvYLhbsphV6sq0
	bjm5V5aC4VOlCqHvXXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4l9-00Asik-7K; Thu, 11 Aug 2022 09:45:47 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4l6-00AscM-0o
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 09:45:45 +0000
Received: by mail-pg1-x536.google.com with SMTP id f65so16670462pgc.12
        for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2022 02:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=XfQcWoeHHvPCTOBRZqHhvxrqpQQYpozivMhbRLgkvBc=;
        b=mCDjAowBFdHL0RDA3t5hd3q9M30uwsRN3C05zzLgJrpob0khZlPVdRSXmE8QqO4ylh
         44NScB/YY8QVs0yc0wm4NHTdWLgC5uWvzEIccUTO1DV83WRG7s6/JajB8wmYUdmcjIKL
         jj2SuAR/n2vLPEUXKdyctlen4JZnd6Z2iwgR0EJUYYXDFirT8X02rJwiN4B6EX/FFDIb
         bVJUvOGlDKeIr3WMUSfj8EK3B9dQP5gJH/X5ltzjuWqJRuOE2guKoP58xnnwQ+vIejeq
         hU8Avo/x8yfgLpxrVu/fKw0ulsBRp3i9x5ktUrlmjDFzMi25DEFh9iepzIwXBefcYah6
         6aqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XfQcWoeHHvPCTOBRZqHhvxrqpQQYpozivMhbRLgkvBc=;
        b=Z42/hO/l3/YsA3aUwL2PgGd90Qldfv38WyfqVSL1e4FvxIzQVXXzTHs/ECpVxOLUR2
         xgYCcRuGoVg4K6P9P742FkwlgsOJe467hP2/Ctj1y4pPfQ4jvY9utfb+GKXyGPg0b3FS
         2NSx5kB14PVWMDMER9qfMWqKda8f9kDuQ2Qcq76+oW6nFDhL9jZvVxjZTwketjn1jlMt
         ThsJ3i5bXM/DDqfL6NcSasRMcHuG6P7sfQtxvKu27IimGBW6//VQkhZMQO9zBRvujWkp
         QHVcFvO86cotWVTy1JTGl/LiWnQaOs3YCYmsKCjvU3AbniGK3BZBLmwkGKn88Hb5T+xr
         hV7g==
X-Gm-Message-State: ACgBeo05ZZrH/PCJ7oNklhBDzISk9Npi3jFFC30f5eAlPh8ADJStmkzr
	p2VJvGv5rZLs2DkdYn5VPwOanZQUAac=
X-Google-Smtp-Source: AA6agR4JiWnmskf40Y8VW3Y+2SjAzEOWP/gyv2g6kwwZ6KX88kTLfTndZg3vOb8hOELAhbtjoD4DSQ==
X-Received: by 2002:a63:5a08:0:b0:41b:df3c:fd6c with SMTP id o8-20020a635a08000000b0041bdf3cfd6cmr26471463pgb.35.1660211141346;
        Thu, 11 Aug 2022 02:45:41 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id x14-20020aa79ace000000b0052d7606d144sm3586922pfp.74.2022.08.11.02.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:45:40 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 0/4] mtd: spinand: Add continuous read mode support
Date: Thu, 11 Aug 2022 17:45:32 +0800
Message-Id: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_024544_082291_13AB54DC 
X-CRM114-Status: UNSURE (   7.73  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series add support continuous read mode for SPI NAND.

JaimeLiao (4):
  mtd: spinand: Add support continuous read mode
  mtd: spinand: Add continuous read state
  mtd: spinand: Add support continuous read operation
  mtd: spinand: macronix: Add continuous read support for MX35LF2GE4AD

 drivers/mtd/nand/spi/core.c     | 118 ++++++++++++++++++++++++++++++++
 drivers/mtd/nand/spi/macronix.c |   2 +-
 include/linux/mtd/spinand.h     |   4 ++
 3 files changed, 123 insertions(+), 1 deletion(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
