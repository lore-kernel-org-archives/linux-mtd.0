Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DE6D637D8
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Nov 2024 02:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=738VLAfEiaw91x94SvfgAYJZuY9CsZ7NAI5xmJBH4VE=; b=FUwSA0df/xK9Qm
	r72TOevXAB1A68SanyTH0bKMBtl+xnPachUnBFDqcXgcad7ERJAtCbOPfouDfdj5jGF7J7w5iGYuK
	Oep28ApBbq/7KOndIoo6TYqXSTlI+1AedPzw6jYP3PaeyApeDET2/9D12adg6stMgQF0eKhdLZD8z
	nMwc96LcoyCmShH5M/u+AXlCKDL0EW4qXc+WiAjwDyvr84TPoRMCKrPug/L37uqkZXEobchiSnVvo
	cddF2XkQUEsS4kQQERofiFtS6gOHZkkJiwbIx994TPK8nOHIIKgn/Dtpg6mxaXJQ/CyTjmpnb8vQW
	jfubL58ZYWn158fcrddg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPie-00000008ZNM-1581;
	Thu, 14 Nov 2024 02:36:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPib-00000008ZMQ-0XuQ
	for linux-mtd@lists.infradead.org;
	Thu, 14 Nov 2024 02:36:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20ca388d242so783185ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 13 Nov 2024 18:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731551784; x=1732156584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uhwqgzUVn7pcG4MKg/BtaexQK/MTCdR7gEr/Dxxj6Xo=;
        b=ExaCNQztNsyeXEUdHmFdnabzpDPySPCHUGiLi5OkYRl7zxRLPZFFRP5sbT5KiyWhxT
         DClbqOtHKD7m+GZi0za+skAknQ5Be+bT34awGqa2PPYc8W4fBnFG1j2+xpJbbRntvuxg
         N97/kzpgc7CaXUE9hLQL4GAahZ+z4W9cBoheSa6jCL10ii5DonMc104pnUFC6wLz9MCz
         N8kArha95q65AUQVEYCPqkgm9NGp4wNhxgmHSNh10r8ELLq1zfarCL07nkt/5K5ZRJza
         uquxaxCQcIwb4Hi98CMgWPSD7QnsjI6vqNeVvlwHJ1H+MmfMGD6D2Qz8jvHW9t3ivYrK
         YpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731551784; x=1732156584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhwqgzUVn7pcG4MKg/BtaexQK/MTCdR7gEr/Dxxj6Xo=;
        b=L3kCwn5O3QgrnxyzyF7dqC8f0idb8kwfPZMVPIEt/mnAnQ2Cl1PYDKBUSYSHbTayJq
         69xcKgG+fpZ/Fc3ivq7ZepJFAM8sYssyJk/wc4fDHImHRUToX7XxAbBxSOMMp2E1qtsM
         O5EMD3rWcSY5vMI7lD2Z1x/BBWZN2h4nnMHuHdPouW7XEuC9sJS4zz+J9q4aLJsPba9u
         h3xpBvD+r866G57B29rTe87W8v4q413cKYkNqq2uciw/+cfD57ybaYM7RZ3S+t8JHTZy
         OAk3+QaWNhkrlkrMvg74qysNhfmZqj8Ue7mH5Bb3GArrOpFcqkxQX3Nh9QSfK1LtAJk+
         xyAg==
X-Forwarded-Encrypted: i=1; AJvYcCX8vxicoIfKK4Y7A2tVUyVjc2QGLhdTXQ183n3gn6yZBNUqibT7fEo3otpz+DwUw5nOnJQ8HHboADA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywre+R3qYtQK4XzD2wkhGdFuYOqHfrL/XWp4V62PLAlf0xlDNo2
	MSllaB2JG5CxGItbARwoFTo5H81ost1zDiL6hPwa1Iur1cWodZFdhKoFrw==
X-Google-Smtp-Source: AGHT+IFOKS15D7LMG7cATcxDBoEqPFsSRpp5VgwU9luVW5gGWLg0ttPwwMat9IjnpQHdcRoio0ERVg==
X-Received: by 2002:a17:903:2391:b0:20c:a1a3:5373 with SMTP id d9443c01a7336-211c50f9e59mr6220795ad.55.1731551783855;
        Wed, 13 Nov 2024 18:36:23 -0800 (PST)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211c7ce984asm480245ad.167.2024.11.13.18.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 18:36:23 -0800 (PST)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 3CF1D806A6;
	Thu, 14 Nov 2024 10:42:49 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v2 0/2] Add support for read retry
Date: Thu, 14 Nov 2024 10:35:26 +0800
Message-Id: <20241114023528.181583-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_183625_194463_4392693F 
X-CRM114-Status: UNSURE (   8.45  )
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
there's a special read for data recovery method which host executes
the Special Read for Data Recovery operation and may recover the
lost data by host ECC again.

For more detailed information, please refer to page 27 in the link below:
Link: https://www.macronix.com/Lists/Datasheet/Attachments/9034/MX35LF1G24AD,%203V,%201Gb,%20v1.4.pdf

v2:
* Remove fixups
* Remove the function of init_read_retry

Cheng Ming Lin (2):
  mtd: spi-nand: Add read retry support
  mtd: spi-nand: macronix: Add support for read retry

 drivers/mtd/nand/spi/core.c     | 35 ++++++++++++++-
 drivers/mtd/nand/spi/macronix.c | 79 ++++++++++++++++++++++++++-------
 include/linux/mtd/spinand.h     | 14 ++++++
 3 files changed, 111 insertions(+), 17 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
