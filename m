Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955B1C04FE0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=04r4Mbfg/bD5w74xhLgqXhFoz6BXpQGbgb3juz3zah4=; b=O8JXbzj8Z0aUEn
	HB2olOI3cp2qlm8Rn9QneVR70tCe/83wmSoKBtM3+cllfleGxhd5YgHdwjDhzbo/MOTBEHpdgB/nJ
	5NDYt3JZdWhnm3FrAtFz3EC63TsHp8fqhKh/dYqWFiof3AWutsgiDs8bbO9VpAg9BONdBPQTUOkj8
	DLL3TpgeGznr67jX2WNyKXHDXUKcFGEvK6S1h709LnEwYaHqIU4JMtAu0aXCZPsPjtAPazpb0ItT8
	6zV6KoHReHRDfo/d7hmJqDip6DV2Mx+Oe9S6bQXbhQzGhvAVEegE9DWUOMYun2PRpwAQUsbMmxdBP
	AtrA+XCxaDqLUz1PIAtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx76-00CoMY-1R;
	Thu, 27 Jul 2023 09:16:52 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOx73-00CoJ8-0l
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 09:16:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bb2468257fso3998595ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jul 2023 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690449406; x=1691054206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfM2KVgtIE0p1I+yFb3TOpuciDHJt1KHzwaELiAtl88=;
        b=AxDjU+eYNUmzWCPT3769J4hqJC5XuOejs4kPswu6PtfoDLaZqHpnCOPOcTZDL2RZtD
         vDltU2xkpmC9yVCZU2AHbFErVuHj8ojPRlacXDFRhdcmpmCMXxtuG3I2At1KGQlCwXIX
         NuB79piU4E66I6swHP6iF8XiOKBp5uyj64kdGnmhAsXglk73GoqyEXR8u2LbtH01Tfhl
         GUCp3h2wxY399RZ/BMkOElslDZYLZvSK0Ju/OEUMkI3PgIFnsxJU6z8KZOIn4Eh5HlCM
         +30JHOMlci1c4faMUv3J+kZt6PwbdUrAF9as9oCQcbpidn1nrc+9wtZlAIw2sFULjKL+
         oOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449406; x=1691054206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfM2KVgtIE0p1I+yFb3TOpuciDHJt1KHzwaELiAtl88=;
        b=HqG0AtxmwEDTR+JHLSg7GnrCwp3Y83LhCqCLvxpOSqGAvXoOxRIo7kYcV5fOi5Tu9D
         oIAz3Gt3DzAgb4phaYyzGyyK3l2jMmEaNY7qTTKf49HRrrftWmf8m5IRMA5oU67ZboQN
         l2ECtOOWbY0fEV24fYFAeE6AT7E+jtXhfOtiNqWRCoydEYX7/LyhhQRAMTI6fLbtjmoG
         7udSR8EFeIxfLUE+9bmxhk8HF3DGYfxEg/wERp1H22pU7zWVHjKuIt6yVopZ7lLrzbLO
         P2bXwGDSaWqG1qBP0N98GW6+Q7GoIXaXv7WeqyKdcWz+vwxaeye7URcXIgLSSD+vprxY
         I5sQ==
X-Gm-Message-State: ABy/qLbLFveev/12TJfnZOLLiszS/e2BtPC1RXww4QKpDknQhKEkT8jF
	DWldk6JaFG2PAOkNnGNaOVs=
X-Google-Smtp-Source: APBJJlHJep+VhG2NCDdjYO8sW8EnPiVlE0s61G34kSOoS+jEXcxsKhLspIiTG2A7Pl/c4Hpo/ZrtXQ==
X-Received: by 2002:a17:903:1247:b0:1b3:d4ed:8306 with SMTP id u7-20020a170903124700b001b3d4ed8306mr3859535plh.19.1690449406291;
        Thu, 27 Jul 2023 02:16:46 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id jj6-20020a170903048600b001ab39cd875csm1093115plb.133.2023.07.27.02.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 02:16:45 -0700 (PDT)
Received: from linux-patcher.mp600.macronix.com (linux-patcher [172.17.236.35])
	by twhmp6px (Postfix) with ESMTPS id 74B41806E5;
	Thu, 27 Jul 2023 17:15:46 +0800 (CST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	michael@walle.cc,
	miquel.raynal@bootlin.com
Cc: leoyu@mxic.com.tw,
	JaimeLiao <jaimeliao@mxic.com.tw>
Subject: [PATCH v2 0/2]  Add octal DTR support for Macronix flash
Date: Thu, 27 Jul 2023 17:16:08 +0800
Message-Id: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_021649_285907_B4BD0A3D 
X-CRM114-Status: UNSURE (   7.65  )
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

From: JaimeLiao <jaimeliao@mxic.com.tw>

This series add method for Macronix Octal DTR Eable/Disable
and add Macronix Octal flash support.

v2:
  Following exsting rules to re-create Macronix specify Octal DTR method.
  change signature to jaimeliao@mxic.com.tw
  Clear sector size information in flash INFO.

JaimeLiao (2):
  mtd: spi-nor: add Octal DTR support for Macronix flash
  mtd: spi-nor: add support for Macronix Octal flash

 drivers/mtd/spi-nor/macronix.c | 123 ++++++++++++++++++++++++++++++++-
 1 file changed, 121 insertions(+), 2 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
