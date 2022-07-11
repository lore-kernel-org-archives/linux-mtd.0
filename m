Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E225C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/OCwRfHoutmfxBkfObalkeOahqYEB/rOCnZeeHaqh5Y=; b=it4EsJpEx3vARh
	CrdKnvotEBeaTGolwfHJ5pcxZhygRQuQ8D4xXu3x7DQWGZi6c05hcTeVM9XJSjYeJrUBnh2NGDG/y
	qLpmwQdpZgNDhYxBm4o/1Y96OpBh/Ry1yPuKdhIQM3JX4vELVvvE1wLhu8fUSZC8m//i3dfopIJYx
	pSTh+DU5eP0T6jVfbnpanEoiaOybD4ZvaR3DkdyxC/806c335zCW4Ozd8IVYHgnKq8JFLxrs9jzQw
	oasxGInAzq+cNt8XQEnfj+TcPsARF9m6CP4BfxfcTG3C5g6asSf0IFd1ej2TabajHiu8HfiYLUPSG
	8YAbBFtw9LIzMMhU/APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1oT-005F1e-CX; Mon, 11 Jul 2022 22:23:33 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1oQ-005EzP-O7
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 22:23:31 +0000
Received: by mail-pj1-x1036.google.com with SMTP id z12-20020a17090a7b8c00b001ef84000b8bso9661665pjc.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2022 15:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OYShG73HxmmhPcrzkwBl6WvX/YrHXz/HpRIE2FyrmQw=;
        b=e578CQSkzdn+PVgkNC9LlD7b7BywH5qghTF7HZpGoMK30sn0lwvy7XSxzIdjUJpdyQ
         71gC55S7v9DGplaKPU9XYU9CKKa9bmUKJNLgVnyzemqjtrg8UQVxXxNN8BGRbOBvhKgb
         iN4mLBhQWwDAHh7Di6xkasXAOrMJHcpBOXWX7XtZhhY9JG4CnHIjNHiape4wdArqeSeC
         fuexCf9XcXaw2aG85KUMmN63UPbSqqWf5qHHDJKxBZ/9MVW4tbT///faQGysEdGZwZB1
         BOlO9siFTK4Svf7/bCpVw/fvl0wrNo+jbq0srb2K1vT+Y5b6h/g1cCI79RFUkOwRHU9T
         yDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OYShG73HxmmhPcrzkwBl6WvX/YrHXz/HpRIE2FyrmQw=;
        b=4dUFmDKMuOapgZzlYm0RPb+5FE2phLuNfzVgy62aty9cu/YyrImImyn1kxPoIy3eyO
         QAsMg1A3Sluc81sEXbIO9LjNp2pdRhsIjgbuOeCpVP/yEhiUKPRfi8SuwL7eL7hWZv0m
         GqlVHIRnIn24ryJbDma+wGuFZVu400cqXDul8AOXU6knkzH633Rh/QKygERGU+/WNr4o
         dA4kSbDFXgsPBnM51jnNPPt6hH5MmYcW5vUZx3T0BDBs9t0p6zhwGT5NCjluUDVxw836
         PpxEBAIKuqn8sxTh95+xaKIXiQ3eQMOU5TRtKpa3h7HwpROljMVmxLW+2W3s3Y1I6EVY
         MyiA==
X-Gm-Message-State: AJIora/dVI4kl4fPy+Z2MPON75g1WCAYzlu3XNfe81tFGU4rX9XFYp9z
	GjDDjctwXWosRcGEcJHB7qewhNYg3sM=
X-Google-Smtp-Source: AGRyM1vxKtINcfJanedH2J8OjSrgSS7ccwzLzg8V0d1th0yEdXm4DulCbwpPuiE48UmBNmpBoSCOpQ==
X-Received: by 2002:a17:902:7483:b0:16b:f2d8:93f4 with SMTP id h3-20020a170902748300b0016bf2d893f4mr21223512pll.172.1657578209088;
        Mon, 11 Jul 2022 15:23:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z6-20020a170903018600b0016be5f24aaesm5274774plg.163.2022.07.11.15.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:23:28 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Roger Quadros <rogerq@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Colin Ian King <colin.king@intel.com>,
	linux-kernel@vger.kernel.org (open list),
	William Zhang <william.zhang@broadcom.com>
Subject: [PATCH 0/2] mtd: rawnand: brcmnand: Glue driver Kconfig entries
Date: Mon, 11 Jul 2022 15:23:21 -0700
Message-Id: <20220711222323.4048197-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_152330_820597_9586D1C2 
X-CRM114-Status: GOOD (  11.61  )
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

Hi all,

This patch series allows for a finer control over the BRCMNAND driver
glue driver selection such that it defaults to the various platforms
enabled in the configuration file.

Florian Fainelli (2):
  mtd: rawnand: brcmnand: Move Kconfig to driver folder
  mtd: rawnand: brcmnand: Add individual glue driver selection

 drivers/mtd/nand/raw/Kconfig           | 22 +-----------
 drivers/mtd/nand/raw/brcmnand/Kconfig  | 49 ++++++++++++++++++++++++++
 drivers/mtd/nand/raw/brcmnand/Makefile |  8 ++---
 3 files changed, 54 insertions(+), 25 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/brcmnand/Kconfig

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
