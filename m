Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09730D75BA3
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 02:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XTxkHLaGuuUYwzjUw7DCdGcl00uYwUDJvCGPwiEcMAk=; b=0/ui0t354zuoBa
	KpMBvADei8ngrftVmY+r6YqxM4wlvj7lBqWa0Av98WaIh9GuCl6r1UNJ8VGjg0dXvOjT8h8kKCyga
	swfeoCDTU4QXBFkDtHeRR3PnBbkOJduivcrjzJxptr2lUh6xGnajRP8cKpu+uoY4HSNeJSN/+IcK0
	wq3sTf3cBpQgToxA8V3E53QDx3XWXbphgyOEWTy68Uzoem6BiCVOWAVd3yDYx4HXev7DOCRw92Zmy
	I8N4fMfiWypuBcCudC4RdahBCOEw62cgezfX0ypu0jhb4JVbM9rgPc1zymnP2i/xwa/m9yZlf2kom
	jAYN+DNPj0RZov5cn3Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwct-0000000GZtz-3AVF;
	Thu, 21 Nov 2024 02:08:59 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDwcr-0000000GZta-105H
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 02:08:58 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso344784b3a.3
        for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2024 18:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732154936; x=1732759736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eeas2NmHkmrEFc0cuZ2i5PuFPYkwJsK2fOZAeZrKvbo=;
        b=ixNeXWYc36LvC7EJJGdHpnCdwoaZRcuMIARh9+hNdqcuV06aMz/EVytdCyrw0Qv+K5
         447xG44XszYxK+miC5zwi9sjzdK5FBNjYbBukq9HFxpRSFCuVdn925x4KlO+DHeF+1K6
         GjqZg0ifKbsqNb+Km2r/dQ+najz5aETZY2bvLji1Zdte/Pyk4zT1l7Hj5sD0Hz9suqa/
         klfT8z0aY09QE2MxS5dSou4srxkERYkickLg3DkMbvk9ImbEbvOO3MxYz/Jg3FhPHDsQ
         AYc2Equoygs9boPkycdpuW5rlkd1iLV0zbLYtICt4VBoYMRPUsMCHNEvbftBndq7bdnp
         VB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732154936; x=1732759736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeas2NmHkmrEFc0cuZ2i5PuFPYkwJsK2fOZAeZrKvbo=;
        b=ouKAq0+l3nU34hj7+1oUG1A+2skxCp3MkaK4l5InPpjajhKRIGx1RO5uYJ2s8k8ELN
         DMfp/HEVcTzPVO4TT4ECLqt5IaLgZE9Fl00EMT010WioJD5nwje2iZ8LVLUsESy3ZwxO
         CSsoDMSzlGA78uCRgMp/nMTYM5zgIbjVP3GEJz2CPYJ2eA49/l8I4uHyHRtcfHKTPKk1
         Pxq+tnhvA9R3X7FL+hx9TVfNHg9qGiRma73bkBPPapYzVo9t1bNpcmVkCfMSPh4dxQ6i
         /a4prPPKSTSly5eiifomekMLto4/ipUGzJ4C+XIzogs83zBrxGMgddNm2bqzB4JL/KcP
         DuIA==
X-Gm-Message-State: AOJu0YwLbgAHVgQJdAiftCj7lSbegcTz0Q5PQUa+zJMPu7JfKIyxP3gP
	TFlDOIFlWj/egIQgw08o/IuNM3YQ6x6eCp8yNZP+AtKTorO4DQfUn8AfkryH
X-Gm-Gg: ASbGncstnxkgZKhB9TziSvvMxIiNYALPjwpZCgPBHKMLWUGzN4OVhhrTlLLEoadpl4z
	XOSAvdpip52qEt+o+dqeoqBEhmeH9fWCBBBmU/mP7etIIBHh2QQnlZnoovwFA19nxLkD0dWruwd
	hgyf5xtKozd9wMs77kVZLyVOsf8pHqkPZTspLeSotYm5psuwk+02Dht2LZbd2OuN2/Dqb3rv/+v
	QZbSbcPOLEFZEIq/NmG/j8CknbVXYDS/JICGUSvY35EfUCJXIOf+SVwlScpwDAtKsOMw1dKQhdj
	ANJUX5XBVOuOwcXgkTLtJTOxe/UfBvSVfo1tgw==
X-Google-Smtp-Source: AGHT+IF3+JahSwqNAzaIytgFJ4U32xwIv4dNO66uBC0cWDgfCbX11xeJgeY6lglcqRkh2eF12ZXpug==
X-Received: by 2002:a17:903:8c6:b0:20c:5cdd:a9e with SMTP id d9443c01a7336-2126c118e91mr54455015ad.28.1732154935714;
        Wed, 20 Nov 2024 18:08:55 -0800 (PST)
Received: from ISCN5CG2520RPD.infineon.com (sp49-98-40-130.msd.spmode.ne.jp. [49.98.40.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212878a5d2dsm2388615ad.77.2024.11.20.18.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 18:08:55 -0800 (PST)
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
Subject: [PATCH v2 0/3] mtd: spinand: Add support for SkyHigh S35ML-3 family
Date: Thu, 21 Nov 2024 11:08:40 +0900
Message-Id: <cover.1732152768.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_180857_282704_1238B9C0 
X-CRM114-Status: GOOD (  10.39  )
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

Changes in v2:
  - Add new patch that removes redundant write enable in markbad()
  - Make ondie ECC engine ops return error in raw access case and add
    fallback mechanism in isbad() and markbad()
  - Add detailed comment about block lock register in Skyhigh driver 

Takahiro Kuwano (3):
  mtd: spinand: Remove write_enable_op() in markbad()
  mtd: spinand: Introduce a way to avoid raw access
  mtd: spinand: Add support for SkyHigh S35ML-3 family

 drivers/mtd/nand/spi/Makefile  |   2 +-
 drivers/mtd/nand/spi/core.c    |  25 ++++--
 drivers/mtd/nand/spi/skyhigh.c | 147 +++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h    |   2 +
 4 files changed, 170 insertions(+), 6 deletions(-)
 create mode 100644 drivers/mtd/nand/spi/skyhigh.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
