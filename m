Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57D6C021B3
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oAx0mPkIcDCoPSmuhhDLomCWOAbnqE7bsWCDwJU72yw=; b=uc5BAmH6S/N52s
	cVe+cnTX4FGrfmW0KH/hnOaYKTvYBDxGfp4Ld2c4Ko6lPJvYTBJG+Fbdk1dcneTetHVzkMSTLBoB0
	DD9O1cdRh/qw/tAzuSKLkWjuvr+I+Z8Luhr97hrl7k1zwRq6pHua6Zyi5G4wckvqyl43gAdBx7PrF
	sra100+nE+H/bR8aEafX3YdSFMXbbq2mZMU9n0y30eNlwJDsNKiYY3Sw5vNlYhx5z5i7Cm4LOQokP
	oxO9LYLeobD4cP07Muue2q3uonBJkU7b18wuCyI3nkVFj05wJSE4DG1TbcRGRJCpA6uKDy1eEnlvm
	stIxFXbf0fEQ+d7Ct7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSZc-0000000CW8A-2XSh;
	Mon, 24 Feb 2025 07:08:16 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmSZZ-0000000CW7F-1Efl
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 07:08:14 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fcc940bb14so5883143a91.3
        for <linux-mtd@lists.infradead.org>; Sun, 23 Feb 2025 23:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740380892; x=1740985692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qxr0BX9H2rSmbWDcp3ROXus3wNk/eFLtrEBXawMvsMk=;
        b=UD3dd15ah9qxyFWgxVu7FjhHF6rjPV1F7R82xNpv1mbFa1OWdC1Ejg08BuWqYaxSG+
         D6iwfUtXnzByyr4B3ClP4tCV75v86Ca2T1egXP0CkoTW/KG/jAFydCTxNrVoKy6rRqXn
         P24gQUzzT+y2n+kSHFyyJ3Wyt4Y+Ch0bK4kprwdfqjJ6ESOZDgycY8c7+DLVFpa+jp0u
         K8/YycRSJgq9s1qLWQDGqCIoOf0dyD5nK5ZKCdJ+HoqAOb1LTGb1HzoczliyzgYITtDl
         rKqdbyUasxywOJ4u5fMryV32sTxOw7nwxIv3pkrtq8PH0kBy8xUFNBC7lZXBUMvY2cix
         8qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740380892; x=1740985692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qxr0BX9H2rSmbWDcp3ROXus3wNk/eFLtrEBXawMvsMk=;
        b=OlJ7F0+XlNaFSupH5r3veGK+iReoe+eO+viWsjvLjNDvBW9uJujKtq3wwNxWGwFJj1
         fbvV9sXEW7qDtQgv+6pU5xtZwbWo3T4ct9v8pdc4RT1ZqWMFy+Ee4GhHPFh+sE0rX2zu
         /AqgvHWMk5Ge+G/9e+ufUtLT8K4RS86tBwd5VwK9TRxvIasV92i/YWXRTmL/y1KEPIM0
         cGrwMIy8vZYKoxy6jfkSmpLpDV8Xyaaa4u8NxQoExQGD8K2FGemcBlrIfc1yJyu3wecn
         oY8g9nVrd3IXMWGlXIHFz9uP5VHAW1Lih89Mydx1E0Dl67BpQz0rtCNpCs3+iNC7yZ2E
         eCvA==
X-Forwarded-Encrypted: i=1; AJvYcCVld33q3lLfqmRoNuyxlDC04vhXC0OncSwQ0J9DhsJ5QafLKzcPsiTudnFLxplwmsichugzxEX8mXs=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfqJusducWXa4dc7wLFj2YnBecAv7hMcuWN3J23gnAQPAz82pu
	8s/8gHy3OfgHp6lWh7eNPsX6I1VHxlxgbUzBE5kdaOroE/6ZrjSQ
X-Gm-Gg: ASbGncvvNiuBU+xmcRDg304ZAfPalGznt4BeugeiCf/EfsvbFBF7ugKX6pINp+BXE+I
	VMpuPeIi0WppA33tGDDQMdXcnZqLTuNViVbWsTRaz2rfeDQORtiwjMil0Rq+GyqG+FWUeW/1Acm
	xWmWT09rfCwGda6JiYeEBvfWQcJlSudEVZKtoOVwUgGOVydNZ92RCuLaXQSKjdPIv/WAg8dvZ7O
	/+F6Lb2fYKGg0Qx8mGwNtdw32BVM3vL/By5VCgh//CJryO/zVc9NDJHovD725Tm9dTAFiAt8X1E
	eqlg2V8DXgYZsDfsbN4Oa8a9dziers3NeTK3WPDMy73VnYJK6A==
X-Google-Smtp-Source: AGHT+IE12ag80ZRwCsA8RWfy0RerhyEUSGbdICvUoSLmgC26GQaUksr40TeMICBEdVbulyqrGW+PGA==
X-Received: by 2002:a17:90b:1f8c:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-2fce75de292mr24578360a91.0.1740380892356;
        Sun, 23 Feb 2025 23:08:12 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb05109dsm5741070a91.15.2025.02.23.23.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 23:08:11 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id A2E84800D4;
	Mon, 24 Feb 2025 15:18:18 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v5 0/2] Add support for read retry
Date: Mon, 24 Feb 2025 15:03:47 +0800
Message-Id: <20250224070349.446739-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_230813_343045_A91385B8 
X-CRM114-Status: UNSURE (   8.96  )
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

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

When the host ECC fails to correct the data error of NAND device,
there's a special read for data recovery method which can be setup
by the host for the next read. There are several retry levels that
can be attempted until the lost data is recovered or definitely
assumed lost.

For more detailed information, please refer to the link below:
Link: https://www.macronix.com/Lists/Datasheet/Attachments/9034/MX35LF1G24AD,%203V,%201Gb,%20v1.4.pdf

v5:
* rebase on nand/next

v4:
* If set_read_retry fails, it should back to read_retry level 0

v3:
* If set_read_retry fails, it should return an error

v2:
* Remove fixups
* Remove the function of init_read_retry

Cheng Ming Lin (2):
  mtd: spi-nand: Add read retry support
  mtd: spi-nand: macronix: Add support for read retry

 drivers/mtd/nand/spi/core.c     | 35 ++++++++++++++-
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     | 15 +++++++
 3 files changed, 112 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
