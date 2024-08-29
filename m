Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F67C7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2024 03:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L8Q/KBOciZ5A+eXKjqBTx84phuv0OFoGtnAGqgm58fc=; b=cnCTNjWGBLVdJk
	iAyGVv7/teoyionhoYlb7XdCgpQ1t2dwPXT79q3tL9TIf30Ut8Ef8YuD8Ly2Tuk1QyklU832ZGxy/
	ML9CN7Fq1gHEgQ1Oxyqmggy0ncFDEPRiJGwVI5+7u965UViwj9h6wO9rAPlYXftZH7aLfJmadd5SR
	BUv/65ieKzLyyvJLC6oki33hd+XnR2JLQPjzl/4ijhQ4GvAtPboBcYhppcSQa8Ra9ooYMCY64voE0
	apifqBV1u4HuaBbm2mI4C+MJZduAp7QCK97TwvIglZ1Oj2DEcg3BmRcD+eac1q9jqarAk8FliFEjQ
	ve0e0+mhFAMC8ruFrJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVpR-00000000M4z-2fJG;
	Thu, 29 Aug 2024 03:28:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjVor-00000000Lko-3gIZ
	for linux-mtd@lists.infradead.org;
	Thu, 29 Aug 2024 03:27:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20223b5c1c0so1645425ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2024 20:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724902053; x=1725506853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tybh8CVhDkPj2cvU+MZ6PTR03iHRZDg5PD1f9iPVBVg=;
        b=gWAyhyKcn/wkbWhrb577WOfh2k4sqKJWbgBYcyKs4TbnsquWuJgxvJHb2JR8+bElKY
         y5xjYWEbJEsLMy+XG8pnZve7yJAD9WoCmbzqiLMB/+PRry1HhPX/Hd5iOSNg73Waq4qD
         t9HwUiHY/LLDxQn2gh3pz7ihYuMwoogk8/ih2ml0qtyiuI7XAoAYtxGD3jz3l3GAtNSE
         26LllWsj6kXJVEz1qoT86fGezL3BwWjepqR2DnCl3Gf4ZOcE9gMSeIxS4ayiw2No8wMh
         qpalMz6pMLsk8807PTKMnaDXAur3g4AkvTMjDmbJ2b9efDw9fjlO/OsOrxCUE/CN+Olq
         UORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902053; x=1725506853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tybh8CVhDkPj2cvU+MZ6PTR03iHRZDg5PD1f9iPVBVg=;
        b=RYZtHuNkDXtPQ6ECeMHiehnsoiU6DIDNGomx6wi5QAYCxcWXTMHIMkN+G58tMjefSW
         ZyN3EbXvLraXUR2v5QD8BlFx+EmCSAZPYRJoSZwOBsqP6mCvNPXEx5brbIKduRBvsJ2B
         XIsnywoASRTD223ouC9UrQ5twxDZSaUBKDZv3gdO9hmMrceKEciajXGtp4Mg89V6d/mG
         Xh+RrG1HSmfRJ/zfJTdiVlUiol3S42kIwXbz8Csvl2LiC58Q1OmvOutVe1ADBGLOMJJK
         tVNlNdSB+B+Kba6Mda/J5OwUy6WelQ/Dtcu7JKWCbR54Y2hhyyiL7dHe4/4WW0OaSffQ
         pcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWse/5/oNOVc0hvWLjPS8mzDdlouVwHZqtc5auZsCAkYf9QoHzA9OoCwzJ6NyToR9+hsKUghjGOSxU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxDLfYGfsMhWu0fRHEtq58ksHdt2Ls1WlksfFJV87Q1pA6Yw/gJ
	4qPsrMecL6aDZTG2BBpwNL1SJqhHy5wXzsFxYGda1F5J2RxoEvjC
X-Google-Smtp-Source: AGHT+IE+fXT1LArYY0xb73qOkbVg/swIDbkDa77Rnw4eTW4g7ihYlNY/Ourh4JnvkXNm2qu3Mn50bg==
X-Received: by 2002:a17:902:d4cb:b0:202:32cf:5dbe with SMTP id d9443c01a7336-2050c4a1977mr15126595ad.58.1724902052793;
        Wed, 28 Aug 2024 20:27:32 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051553703asm1947855ad.181.2024.08.28.20.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:27:32 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 33629806A6;
	Thu, 29 Aug 2024 11:36:09 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: richard@nod.at,
	alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH v4 0/2] Add support for two-plane serial NAND flash
Date: Thu, 29 Aug 2024 11:25:15 +0800
Message-Id: <20240829032517.1517198-1-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_202733_943402_A47A235D 
X-CRM114-Status: UNSURE (   8.32  )
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

Add support for Macronix serial NAND flash with a two-plane structure.

Insert the Plane Select bit during the read_from_cache and the
write_to_cache operation.

v4:
  Separate the core changes and Macronix changes

v3:
  Add flags for the Plane Select bit
  Remove fixups and corresponding function

v2:
  Squash patches 1 and 3 and come before patch 2

Cheng Ming Lin (2):
  mtd: spinand: Add support for the flag
  mtd: spinand: macronix: Use the flag in Macronix driver

 drivers/mtd/nand/spi/core.c     |  6 ++++++
 drivers/mtd/nand/spi/macronix.c | 17 ++++++++++-------
 include/linux/mtd/spinand.h     |  2 ++
 3 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
