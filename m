Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D5E68946
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Oct 2024 02:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+fB5Y4uKCupsakjdxg85QEHvY0uiGTUBEOH6Y38bDc=; b=ULadrdM8Az7VeN
	sxSGAzKPkxrX9aGTRK9INYy7aEh3q7JtOFkxF/qEX5Eg/EGOGJr7ELf6Gwn/Ydn2vXQJNPoNnd0HL
	+9OlukrAaHaM55HeSv8vE6QInTKnB4zCp42u+7ju42+jbq4I8EtZgXy0bgMuH2uvq/7HiYwoFVW3V
	6/RodQzkfy4MTwMsflbMnB36irKoydZxLHgQimv2ORtdFoQ8yt2F18rgMnb/4oLO2UgstVmlegZ0o
	1BZnuNiQP4oDXH3XFWzrk9sjK5sfIbDT7HqN1rbZEKTOhLu2p3zi0XvyS1t7jIwu2bUHy0x3jy//q
	L5217t7jECBudgdJ0uEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kp8-00000002LLC-3Ofi;
	Thu, 31 Oct 2024 02:22:10 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Kp5-00000002LKX-3qIa
	for linux-mtd@lists.infradead.org;
	Thu, 31 Oct 2024 02:22:09 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-288642376bcso275665fac.1
        for <linux-mtd@lists.infradead.org>; Wed, 30 Oct 2024 19:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730341326; x=1730946126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=25T2348blIYuLYK8wLSHOEnOvsoRwxsc3tR3PIugSTg=;
        b=lmJpPZBtTvkG/czg7qZJ9gO2eXbtPTXyjaeZD3Eomg6Kmrd12iPpeU/+Y13ZQaKsPV
         7F5zBaHT/xFWfOzs5+upDZOAhsvqIcdDAX0SUsyYXeKnOARRxN4aQRldo8H9YlnciJ6v
         3V/JLPdYO83aXvPti0/VmAzSwHx4P7ACZrLcYE8K7xmmaoxBbA8pN8ABKECGiqQ/BIg5
         wUMLGv5WZBXN2aQLZf/y8x8UdRiOL8EIYIFnJY7lTYt8GkkYBg9gxD22TqZp9B3I2wzO
         XxCAQ1XVuVP5NDFw4gskBnbMl1SW4uwigOIvOhDoeJjv6ssCJNmKQ11Yoay2D6YaS8aa
         HT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730341326; x=1730946126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=25T2348blIYuLYK8wLSHOEnOvsoRwxsc3tR3PIugSTg=;
        b=YS2XmYhDsQeOhof84UIyLgmjNk4nHYxXV7s1Araeht5/oU9g+yqSqJuwii1q+s5H12
         XLEmJQCaB3y87ITs3IiRhu7oMumdk+hewgcH2lAoHHT4vrlia5z99wpxkQnbXZCIMCLJ
         jERlXu7LOrqb6LQTqf96OHgRzvNulUnE1sFIAfQJ0nJ4RI1LaZoi+DgJ5xX1T8HH2x9v
         8p7NZRYcNs7zJPp9uMgWW0x1ATye/zRtDJXwUa9IaasakmOn5YZYLG1oLaojZKpS2SYe
         pID6Yr5gjR+gUrTPuGptpckKGbf2xVvdpc2DH/8h4pytqTxKkt3icqe53G9RAgQDlAof
         oiyg==
X-Gm-Message-State: AOJu0YznK8TrlK+36pgw7i/3jBGRqrxsO74fEu0tu1S4EP7GayRLRV/0
	a2P8xsXh89+GbeonxDKTTiyQe3Yqd2S+2H17wbq7n5uK/SlpGLrSrZ/fQw==
X-Google-Smtp-Source: AGHT+IGxib+Fqo7a62SyyI0a0XoIyPZYUqcgNEzdJdDvbdNj2kSi4KaQeNnkOAx4P1N878kYCvzRug==
X-Received: by 2002:a05:6870:8288:b0:260:ebf7:d0e7 with SMTP id 586e51a60fabf-29051b84703mr15641423fac.15.1730341326273;
        Wed, 30 Oct 2024 19:22:06 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45a0f4e3sm269731a12.87.2024.10.30.19.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 19:22:05 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	kr.kim@skyhighmemory.com,
	zhi.feng@skyhighmemory.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/2] mtd: spinand: Add support for SkyHigh S35ML-3 family
Date: Thu, 31 Oct 2024 11:21:53 +0900
Message-Id: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_192208_000211_7EC7A271 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

This series is successor of the patch submitted by KR Kim:
https://patchwork.ozlabs.org/project/linux-mtd/patch/20240820064547.5035-1-kr.kim@skyhighmemory.com/

Takahiro Kuwano (2):
  mtd: spinand: Introduce a way to avoid raw access
  mtd: spinand: Add support for SkyHigh S35ML-3 family

 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |  13 +++
 drivers/mtd/nand/spi/skyhigh.c | 143 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   2 +
 4 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/spi/skyhigh.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
