Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21EA8C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 29 May 2022 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EgsiAmahaqsi4+MhbsoQQjoCnpJmPlBeUIdECusLdJY=; b=WujgXPZWyQE4qg
	YK/34CO+qHQCcqSbXQejvNNfmLdZz16fB0KUz+F4azI6L4n4rukwWwib5rRO11wcsJPnw4UaBWneG
	zU2wRpCXP4pNr91aLVezk+cYDDlWZa0fC8LK/lkpqtK4neMPTRadn1AZfKxPEuXZpx4vT9QmqX4Op
	zkzOgX7VbDmMNpjrmjG/pbb4VlM0x4zIrHmRUvDpk70wofk6dHeT6oulhZd+sXFhg7+8urrqEi92Z
	6P5tQH5mOfgZWZBoy7NiOuk+rb4nsR1W7nG6IH9ER9zUZyB4MJVh+RhodMLt8akfontquGLRZDs5x
	9pP792zoqaDHkTTi1Ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvGgU-003kd6-LR; Sun, 29 May 2022 11:02:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvGgP-003kcc-F9
	for linux-mtd@lists.infradead.org; Sun, 29 May 2022 11:02:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id x17so2185334wrg.6
        for <linux-mtd@lists.infradead.org>; Sun, 29 May 2022 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0B6lPr/sbtBS+5h8GOoxESv/ZQ22BbLfnRBa62Z38ZI=;
        b=QFtqQHNzFqmv5q6czfWB0xYYwp6786SUdsP5aMmzcUF8WcXftvxYSNjxJy4ZZO8tcS
         n8WrDZN4Fzffii2uwysqrQsq7AgCB76Sd2pbiUCNQYJtL6szpozFSSaw7m7ZEYsd2u+V
         +1ZWTxbZ8QDo6Cf3BjwYaVdkupHk7qCC6PNuh+qWsPKv7vqaLXF4Hu19DFM9Clr7skuR
         MpFL74Pii9ywvBrGJgaNeImOjjQziw98gziDR1qrBtyBstvmraF6DKO4QwJ3k56sQ1/I
         oWE/fwqUsd/iY/EYOTo0OWPZqXzDGwB91tbhvgdgrhZ2B4lPula6Xej6/hE9PwYPAEx1
         frvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0B6lPr/sbtBS+5h8GOoxESv/ZQ22BbLfnRBa62Z38ZI=;
        b=hEPeoe6tg2TDFTTEjTTJdRGIOxq678mzWYvsByHCgyXMUvSZF7lZzmO9t9EU/6+Trm
         r8q98kyIqo2J8uH4nEs24G5H4F/lMjLsQSsY+YLWAjF7/D5/tpUhVm4hIFKsthVDUkZd
         VaRYPVuMQrqA53BZRLjxyDVPP17uU1jjmt/mJBYRAhxMsl/SsjsYIBYjbgxsQ91Bg8a4
         V7gHtHA0VK/7gfpAEgg4576jzYHPQdetqoJIG+s7PxlHttxoTAHkHk5gffvmkcx4n5SK
         xqXjXKU14RT6ZnMdTw6y+vgNWb5LTiU9CUftUsIYP1U77MIYzkcPdTwJvzxJWOYCRXS0
         jOLg==
X-Gm-Message-State: AOAM530F/2x7J5B1IBDnZb+f0VmXm+CzCYv3ONhz9qCGciulwGHpRarQ
	0Whq0Kn9V3PzGE0WUrsE/ro=
X-Google-Smtp-Source: ABdhPJxJyBUU5tSxu9PfLLqVudqyXmJySrMbx4BMxAfDmjtAeVLBI3E552LJ1OyG0GsqcPad/VIpfQ==
X-Received: by 2002:a05:6000:783:b0:210:179b:1ff4 with SMTP id bu3-20020a056000078300b00210179b1ff4mr9409613wrb.168.1653822121112;
        Sun, 29 May 2022 04:02:01 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
        by smtp.googlemail.com with ESMTPSA id m1-20020a1c2601000000b003942a244f2fsm7503771wmm.8.2022.05.29.04.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 04:02:00 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Mikhail Zhilkin <csharper2005@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	NOGUCHI Hiroshi <drvlabo@gmail.com>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Karim <Karimdplay@gmail.com>,
	M <x1@disroot.org>
Subject: [PATCH v6 0/1] Add support for Sercomm partitions
Date: Sun, 29 May 2022 11:01:56 +0000
Message-Id: <20220529110156.189564-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_040205_563877_BC21B236 
X-CRM114-Status: GOOD (  12.18  )
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

This patch add support for Sercomm mtd partition table parser. It's used in
some Beeline, Netgear and Sercomm routers. The Sercomm partition map table
contains real partition offsets, which may differ from device to device
depending on the number and location of bad blocks on NAND. All necessary
dt bindings has already been added previously.

Changes since:
v5:
 - Fix undefined "__udivdi3" on 32-bit platforms (Reported-by: kernel test
   robot <lkp@intel.com>): limit patch scope to RALINK platform only
 - Sort variables

v4:
 - Add Acked-by to the first patch

v3:
 - Fix commit message of the first patch
 - Add Reviewed-by to the second patch

v2:
 - Fix mistakes in dt-binding
 - Add patch for new vendor prefix
 - Add vendor prefix to scpart-id property

v1:
 - Add dt-binding in a separate patch
 - Remove redundant braces and logical NOT operator
 - Define pr_fmt
 - Replace kcalloc by kzalloc
 - Use of_get_child_count() and alloc big enough array before the
   for_each_child_of_node()

Mikhail Zhilkin (1):
  mtd: parsers: add support for Sercomm partitions

 drivers/mtd/parsers/Kconfig  |   9 ++
 drivers/mtd/parsers/Makefile |   1 +
 drivers/mtd/parsers/scpart.c | 248 +++++++++++++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/mtd/parsers/scpart.c

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
