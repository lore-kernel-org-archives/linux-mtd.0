Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6517FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jul 2022 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wZIf+wRf8vI9DXicTyl/0MM+1KTxVPjCKMtTzVvvpbM=; b=O7ye45dKjYSYY2
	ouILwRQSAFc0aEEy09xMjr7OGHmapM8mjoCRH8s/RklfRLSQqaYqMYNGrr24K/ZulgYB3NU8XqEjK
	bUa7SdQnOWMpCZhoyTPd4OSQH27ae5PSlGdl93AgmPLyjU7OsPKEpbsEYTsKP6RSPPqwGea+DCVh8
	6HWRyY1+pbVlsfZjBR5n2k9CrAr2qYDdtRGtjOBgRW9Az+BVORo6HGK5P3h0zM71/cop6T9TVnqJm
	3eLa/AHE1W3epv3WfZhlP68+FlkOT8J3fZJa0ou/GqG0461MLF5iYR/+Lpwp8ZpQ7nZJc8v0U9+PH
	LdhUPcOTKgX+BHSsAhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIv2-00CujY-4s; Tue, 12 Jul 2022 16:39:28 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBIuD-00CuBq-JU
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2022 16:38:39 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l42so4977165wms.5
        for <linux-mtd@lists.infradead.org>; Tue, 12 Jul 2022 09:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8lmaZ4yA3N+2Tr9olz+V+wBzdb6zjpc/4YMVJzfPW4=;
        b=P0DNVxXKag6AgXtprOy4l7YJS+89wlkyKE8K5SVwi923xmsQEAFaRQ536opF/PriyL
         dMbDPB26jWtM2oJpBaHUDyqNMhoTHZebb1fke2X6jIHihDjY5vCBlDylOQ9cdK11lqvX
         krikO6mEqD4tBQJXEucsgXFDvcrnAiHhvoaFU54BiW350VmkfsaPpltXivRzagOWtr6m
         Lr/vy87lmAxMrxn5D2TFgX9XWKvu8ltd4V1zt0q4sJ05MHUyfpbQ4pvHYM+n3cjay5UC
         /hoEfRJgit4UnZtjaoWdmkmXgMfkxF2Z8L2Hkib/PK/CwYjwDlJDrC6QdtJ78CzenIpY
         JhSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8lmaZ4yA3N+2Tr9olz+V+wBzdb6zjpc/4YMVJzfPW4=;
        b=Gu77PhHSSIhhnhgFMO3AJqEGPm56gkuhRi33f3N3Ed1Mpoh2u0OkarslPajai2q+oC
         O04riUk0UV7DvlfqgUz+mv9mYQde+hcJQ9Uw+woO3IMbNQ9D1IVNFU80acJl4FwV0k4Z
         aV65pl45ggfHpDGhjbgG30z5EiXGuizv2xyS8TTO3sHOOyXT/eEurrJFVPrRZnt9zqze
         viPAhCbsMks1EGekTfkNL9+LWirWa+spc53TFt+q8K7d7gRQkErJMCeystbfWDjjL0Ub
         xMESf/Ikag366G7Uwo+Flq920E8tSLGBUXp+Ln+zQbE4xLEqp4CbxmbBIzYX0uQ/xRaJ
         Flcw==
X-Gm-Message-State: AJIora9143FL1I/0VyMIlR/YAIghG8mV/qsiyBuS0rD38HneMbMz4ejR
	tE0Z5XIx3UWvST7nTuObA2zLPA==
X-Google-Smtp-Source: AGRyM1vvLeGSg1PfQa4JuYMksqO5aPjsbFbmxqBm+Y4FiwMSJVxequXnCmAnrqvUh3WpMx/2snJuLA==
X-Received: by 2002:a05:600c:1993:b0:3a1:918d:671b with SMTP id t19-20020a05600c199300b003a1918d671bmr4688804wmq.14.1657643910288;
        Tue, 12 Jul 2022 09:38:30 -0700 (PDT)
Received: from localhost.localdomain (host-78-150-47-22.as13285.net. [78.150.47.22])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d424e000000b0021d4d6355efsm8623751wrr.109.2022.07.12.09.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:38:29 -0700 (PDT)
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: greentime.hu@sifive.com,
	jude.onyenegecha@sifive.com,
	william.salmon@sifive.com,
	adnan.chowdhury@sifive.com,
	ben.dooks@sifive.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>
Subject: [PATCH 0/3] Add Quad Input Page Program to chips with no SFDP table
Date: Tue, 12 Jul 2022 17:38:20 +0100
Message-Id: <20220712163823.428126-1-sudip.mukherjee@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_093837_808529_3000D070 
X-CRM114-Status: UNSURE (   9.31  )
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

Some flash chips which do not have a SFDP table supports Quad Input
Page Program. One of those chips is is25wp256, and this series has been
tested with that chip. If the spi controller supports quad mode then the
chip can use Quad Input Page Program to give a much better performance.

Sudip Mukherjee (3):
  mtd: spi-nor: extend no_sfdp_flags to use u16
  mtd: spi-nor: add support for Quad Page Program to no_sfdp_flags
  mtd: spi-nor: issi: is25wp256: Enable Quad Input Page Program

 drivers/mtd/spi-nor/core.c | 7 ++++++-
 drivers/mtd/spi-nor/core.h | 4 +++-
 drivers/mtd/spi-nor/issi.c | 3 ++-
 3 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
