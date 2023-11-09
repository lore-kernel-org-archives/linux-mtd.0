Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1268C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DXvZg7wYtmKrTN/hwVrxBGh8kRSWt9fr3P8yvka3GaM=; b=em8YtCNGv/vDEj
	G2bZO9+EI61uziQ0hWF4WAPEKecrW2ez7mRSaOqmM4UXUTfgNmNDCcw+mA2+eU3iwu7mWr3hNfJrF
	PYDFDJE4YHmI2oQGbg5u5KrYfQBdjGY19WRge/HHlPD3ZAN30V8QB8OUI3Vzz0Yor9kWrIa0FiRKy
	a8VY/erOHpovc7RR9gSiA5s4BUACAMsHPRKrPsfhibFKUCY/hMLtX4C31c4d+bcNhFYysHopmA+OL
	A2mplvvlbIFfhs6/gb0F47WNU0vuPURwDgBOlEZaUarYnse9nUbLUr/uQJIdj0ijedBXotyX8c1gr
	LX9c2sbubJUM2fOdHm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AB-0063WG-2A;
	Thu, 09 Nov 2023 11:25:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13A8-0063TR-1z
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:25:29 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso1491343b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 03:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699529123; x=1700133923; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJDXs5O5dxMnttBYU3ejWsPC88fUBbmC3UhvKcYXXMU=;
        b=Qcjt70UCT/x8G9iTe/AIIpd3VKABqqpWvBi4Da2MGHz9qceszzP5CQ8mGrlkC6PMQ0
         B8Yiq0LiRgHNP4yZt35PfCQlbMgGUQPqIxqxq+vtz4oHP7Tqa88I4IQXUd+ojWWboay/
         VkVVFsc9mvkuiheTNYgyhSKtssP2UHd7gQJnDQ04jLXc7e2C91ZQI3QMIyBeKgBZRprd
         eHS7elVxyIyF+hUz7pKWy5o18PgEWhpITm9aSenyF58VumR+RHqUKeCL7TJjkG81PX47
         RCJ+SxSDj6QREIHr3blrYL8nN+8JcNF56AGHkq+Rz3YviWym5KzJgUOVEvRR1dvJynzM
         zxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529123; x=1700133923;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJDXs5O5dxMnttBYU3ejWsPC88fUBbmC3UhvKcYXXMU=;
        b=SX9hXNNAmjuUH9l6lujcL6au4AOaYk6RCA/mdJImagTvBohw6yJC5VJsIBgz1znMTQ
         dBhzjNXXBkyPT+suYtdNTIPuf4Uhxeseq1xOMo/NZlXYBgr5rYDVi6PaBLW6KCCF3Irs
         hfOK8+Q6YJEReSZflZgDVBckqGWxJIAviEsDvGbitYWr1ysJkk0UHi/riwBCu8AN22T/
         BDd1YJjLrGGET7NKsUL33VOhmIijE72+eMpa3q6h0vEltreH4NlGdzB/2zFSgOjos8xZ
         Du1La842YUe4Fls2Q4AEIvwsfSQc2ouiHGsdUVnm8cHQ5Sf5OlxODrzj3D6qjWQrPmnw
         Thgw==
X-Gm-Message-State: AOJu0YzP2Rmltz11cVQ6bq0No2LmdMJ8tmtBLQ5kgFnjBHQxiz0Kb62z
	mvw9TldF0nPSX9CgonyQXNb02DAGoRQ=
X-Google-Smtp-Source: AGHT+IH+C5zxA9h+U3GsFXKr1c0km8dBObDPnTNof8SuTw8vTizEtrcaRO+6dxGQgyyEsh1Lk6jz3A==
X-Received: by 2002:a05:6a20:8f18:b0:15e:4084:6480 with SMTP id b24-20020a056a208f1800b0015e40846480mr6346109pzk.27.1699529118539;
        Thu, 09 Nov 2023 03:25:18 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id y36-20020a056a00182400b0068790c41ca2sm10455953pfa.27.2023.11.09.03.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:25:18 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v3 0/5] mtd: spinand: Add continuous read mode support
Date: Thu,  9 Nov 2023 19:24:55 +0800
Message-Id: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032528_656990_7231CB99 
X-CRM114-Status: UNSURE (   9.46  )
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

v3:
  add method for chcking controller limitation

v2:
  correct typos
  change error handle when continuous read error

JaimeLiao (5):
  Add clk wizard and mxic host controller driver
  mtd: spinand: Add support continuous read mode
  mtd: spinand: Add continuous read state
  mtd: spinand: Add support continuous read operation
  mtd: spinand: macronix: Add continuous read support for Macronix Flash

 arch/arm/boot/dts/xilinx/zynq-7000.dtsi       |   4 +-
 .../dts/xilinx/zynq-mxic-picozed.spi-nand.dts | 141 ++++++
 .../zynq-mxic-picozed.spi-nand_manual.dts     | 141 ++++++
 .../dts/xilinx/zynq-mxic-picozed.spi-nor.dts  | 142 ++++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/zynq/Kconfig                      |   6 +
 drivers/clk/zynq/Makefile                     |   1 +
 drivers/clk/zynq/clk-wizard.c                 | 409 ++++++++++++++++++
 drivers/mtd/nand/spi/core.c                   | 135 ++++++
 drivers/mtd/nand/spi/macronix.c               |  14 +-
 drivers/spi/spi-mxic.c                        |  84 ++--
 include/linux/mtd/spinand.h                   |   4 +
 12 files changed, 1031 insertions(+), 51 deletions(-)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand.dts
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand_manual.dts
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nor.dts
 create mode 100644 drivers/clk/zynq/Kconfig
 create mode 100644 drivers/clk/zynq/clk-wizard.c

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
