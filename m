Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0DC7618E
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Mar 2023 06:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tO1b6KC5TrmISnxA5jJTT1xkyAbMLvV+gBquBgK8s/o=; b=G4TAK12QEElJ49
	3HyYhqM1cHSUzOI754u44E+u9ZRX2SOuQaWVcQH2vMHA6eIOLw00HiJUYKHHBz6Hy2zcMIYIlWoKP
	zgRFGpbfvBZeYT5qkbZNC8MaAY2/hxGWszJR6XbFNvw6/YrYAQWZ4SR3OVXv4x0C4pwy3t2umctpR
	BpCFuwNKGXVEZ05+jW6EQfcH8QXCX1EpLZ2+L/PVmZ1+8e3mJoM4/WufnVm7A66VP4wXnf0fzcJRR
	fDviBTw4g+pqqrzvkhhAmpAp6iLPDx2s07c0IxAsdZIbZKIi+IumjOc3hLrTH3Ak6FD+tma/Ndp/V
	Q2iGeugzgLOlPLHjAI4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKj9-00CXjD-0Y;
	Wed, 15 Mar 2023 06:35:11 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKj6-00CXiT-1M
	for linux-mtd@lists.infradead.org;
	Wed, 15 Mar 2023 06:35:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id k2so11121999pll.8
        for <linux-mtd@lists.infradead.org>; Tue, 14 Mar 2023 23:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678862107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPX4ASD5Or/wFLdivO42U5JfAA/ONNJEvtDsk0GEx4E=;
        b=i76fRSn70Q9guW5JMI4L9qlXKdzYHnWbMuozjaxjmkEIn16TVp65rbnNcuQjC9k6iR
         yyoDFNP3Eeqn8TElwEs7L5TrQerBd89YWDJt8y1pT583/+wttHCT0e3K18AIh7Rrb4jf
         TbZ6owznRXZF/TNBPcO9bjMy46JPJs5gxaHw84wWe305GbWgt9DgOToOMjxiFOHhbZxF
         TpoocqmP2lsLr2+4wknxNa5KHqEPGJ35x3wrbqMjoAyu2zZdPz2bnKNP1T3CugUKjDYK
         LmIuECl6MpL+o8oOkSKLDw9vIgQgtYT2dGwYwXEsB+TwJw8jdKotc+6/PAHsfxGACKKU
         1qfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPX4ASD5Or/wFLdivO42U5JfAA/ONNJEvtDsk0GEx4E=;
        b=ZKZAbmZsH++ClBhERRkHrrtmupX2rIcNADAdWx+JTNcwDdTI37bn/93cySxO1Bmy+x
         /V3vwGPkF/3hW7ZyKN3oaGsjTbH5Jnllqw2wtdzyft1jh6dnQkF2LS9OEAFiYc8y2AtF
         WmUm/QmnQc9AQJg8ecmWcaULEHeSYAyrd4dHlHRlkgMgRFjbgZNHyvu7BI4Fmrv+WXvu
         EKXLq0QDwcXgtlyNGjSCsXxMWjJHBafmaI1WtmKQqYjWwHoB8DTY5DUWezIemfSKU8iE
         Z6OPBVAlGRGsLhAh/jLU9H1pVy/yDjF72LnBYfPgObcc3c321qEP4dsA782czPJH7Sue
         /IGQ==
X-Gm-Message-State: AO0yUKU+CphESJO/O4uqFQzww6wpdhTuCMtKbRh/Y+1hwPm3sCFj+mXJ
	PMITNmH+5f+8fD9dNF8IwjSYCcIr91+2Bg==
X-Google-Smtp-Source: AK7set9mRGJFtOjIx9Id6AyptSNzAELEjwBMrpy0jG0iBtaHzobD7DwDAWlctETE6YZo2t34Gn+kMA==
X-Received: by 2002:a17:903:112:b0:19f:30be:e9fb with SMTP id y18-20020a170903011200b0019f30bee9fbmr1218788plc.19.1678862106684;
        Tue, 14 Mar 2023 23:35:06 -0700 (PDT)
Received: from ISCN5CG2520RPD.infineon.com (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id jk19-20020a170903331300b00199536fbc6fsm61114plb.280.2023.03.14.23.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:35:06 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	d-gole@ti.com,
	tkuw584924@gmail.com,
	Bacem.Daassi@infineon.com,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: [PATCH 0/2] mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon SEMPER flash
Date: Wed, 15 Mar 2023 15:34:55 +0900
Message-Id: <cover.1678858206.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_233508_514778_312AAFDA 
X-CRM114-Status: UNSURE (   6.49  )
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

This series changes mtd.flag handling to activate JFFS2 write buffer mode
for Infineon SEMPER Flash family that has on-die ECC.

Takahiro Kuwano (2):
  mtd: spi-nor: core: Allow manufacturer fixups to set nor->mtd.flags
  mtd: spi-nor: spansion: Add a helper for ECC related initialization

 drivers/mtd/spi-nor/core.c     |  3 ++-
 drivers/mtd/spi-nor/spansion.c | 33 ++++++++++++++++++++-------------
 2 files changed, 22 insertions(+), 14 deletions(-)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
