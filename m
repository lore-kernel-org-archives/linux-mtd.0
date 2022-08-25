Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89513C28D13
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Aug 2022 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=37HTqPOhXUiuA/wPR0Op9kAEo85ivJDuVZz6IST6V9I=; b=TRm+ZuvmH9CYBG
	Mg0jw+QKCZxI9yRXEgXUHsWhF7FAtaicLyMIfzAx1IR5Jj1RBViXXdKUNC1+B7gPOUDCJ5IFDF7IK
	NCxiJbJ+oim4/TdAd4ZHwhxhHwTrBEwkKXUS8FoeONxfyHKTjzMtVzmQVkX2r5xIlZYNoLxI7kTQk
	QlzSVMZwMeS36dmbvXu33Jvw1yVvwH5mQKz9/gwNzUgbpzglLAS32/goxdqtyGWZsdwl2CLYpJ0rU
	JNgwqXSUqmJCPP2L+krHoJGVTBXUxb6Ly+A/qujxprbqgSxzr2L4up7HF9CgOfSBgMio+Pc1KywOv
	dBrjFb4eO7kBGUfL2r1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7gx-009iTY-OZ; Thu, 25 Aug 2022 07:54:19 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7gV-009grr-BW
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2022 07:53:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id kk26so8232182ejc.11
        for <linux-mtd@lists.infradead.org>; Thu, 25 Aug 2022 00:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=BKN6Zyi2rwotrVCG90rAlGotmp1QL2MqhKbWs/t6eMQ=;
        b=PyBp5FVtTy4KqWC8EGv5H4uvYyTBw4Zz0vvOd4ZXn1DSOJZqDcPZ0pQPDpiaaO6gK1
         mkJ1FykuER/BVZ2FX1QLlzjel9YArjkJKvjl3rczI+Q18vtX3S/xDG1WeeTmdK8HmC0q
         2CNUXv550QdktajoSgrjV7LpLDYuIvFd2WAGu6Ci6xNWV5LN5kD1cqLqQFHhHsJljHOF
         cHUn/Gab+ROCoadsgmt0uKLsLUYw8M7o7rLLSzLqnn3oXBF7/NLjlKB0XiiNEJ243ZcU
         H1Si6EgPbTm8ewwF4Phg2IHYqovXjvhtPc2ADu3IVX8QOhABq/Q5W9en4m4yz3mk20gZ
         ugHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=BKN6Zyi2rwotrVCG90rAlGotmp1QL2MqhKbWs/t6eMQ=;
        b=KEBH/1hpdTrehPBjQqbAv6v/wU4+SzpgQUDUosqNjomad85Zu2VSvyx3odW1llNxxw
         Fwc8vvdJceW/WlXNgEgJQ36oW87rKB6/MCTF6bW6UNItcVcSSHPGAJKjv+jAOjt2N5RG
         59BC4yhSpC0F5gKmqu6J1AxiZJjIQ2Tdu0DXQSCFJ34NMcM33RMIRIHTTct9Xd8ArhTj
         nPeU5NY22HShEpttziAqXIcxyvMLIsTWI7cGlXUOJH7QCjQHNuYXrcBuBiyYTYgTpMrZ
         V0ufByAGuFPXpkMzejYwXV0xP/G0seSKc71OIboAGbV06b/j1rS7veiFD43NVrZVj7in
         6pzA==
X-Gm-Message-State: ACgBeo2a/f6+7PAY60MJblZSwzPnyREi8CepMAietkbdBE2NXdb6sQxH
	Ca1bnT2m26pcRbBbBkh5pmxPEbDDLfn9D9hp
X-Google-Smtp-Source: AA6agR77na/eD/u8cTVzQFiutL4JoBnrSf2bAAgTpgYNSxU5M7xw/8FOAVeYkYKRV4xV7LugaUL5gQ==
X-Received: by 2002:a17:906:7c4a:b0:73d:9279:2c42 with SMTP id g10-20020a1709067c4a00b0073d92792c42mr1580197ejp.597.1661414019651;
        Thu, 25 Aug 2022 00:53:39 -0700 (PDT)
Received: from lb02065.fritz.box ([2001:9e8:142d:a900:eab:b5b1:a064:1d0d])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906b09600b0073dbfd33a8dsm1491736ejy.21.2022.08.25.00.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:53:39 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] mtd: rawnand: Fix dma_map_sg error check
Date: Thu, 25 Aug 2022 09:53:36 +0200
Message-Id: <20220825075338.35338-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_005351_451595_107B8390 
X-CRM114-Status: GOOD (  10.08  )
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

Hi, all,

While working on a bugfix on RTRS[1], I noticed there are quite a few other
drivers have the same problem, due to the fact dma_map_sg return 0 on error,
not like most of the cases, return negative value for error.

I "grep -A 5 dma_map_sg' in kernel tree, and audit/fix the one I feel is buggy,
hence this patchset. As suggested by Christoph Hellwig, I now send the patches per
subsystem, this is for mtd subsystem.

Thanks!

[1] https://lore.kernel.org/linux-rdma/20220818105355.110344-1-haris.iqbal@ionos.com/T/#t

Jack Wang (2):
  mtd: rawnand: stm32_fmc2: Fix dma_map_sg error check
  mtd: rawnand: marvell: Fix error handle regarding dma_map_sg

 drivers/mtd/nand/raw/marvell_nand.c    | 8 +++++++-
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 8 +++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
