Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E313FC04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 04:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U7u0s5obKZ7mw3uSQvO/hGosT8tY43P0S/FpT5EScps=; b=z9YXeLims7H0Im
	0sFHrewyUuyw6icHnoPT8r4Pad8rfBE+EeYG2dv4wqtdXuM0dhvhnQr0hK1G1ZyK6hxNb67OlR4ob
	7GQ2Lai9GqZN499eZhbRW1QLluQauJX0V3WIUwvI/7qHJZS8JsgybrQLYfkDIifhHdu/SD3e+Ukcf
	EkUeu6DQdzgogurk7CHaXiwUoLSXunskDcJ072OTAJzUiE8kwsH95WfLYDdiYT4BlqLviZ7NUyz0G
	R56BkwWH70VCP/HIL3z+pEAWwiBo1hGlTGfD7dvEU2qTCRR8RpaV8Uhq1W8gZWDzl45tCgb1ouySn
	fYD+od8pGl5keOzlVduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuuZ-0040mk-RC; Thu, 28 Jul 2022 04:14:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGuuV-0040iO-RF
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 04:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658981647; x=1690517647;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UIwrwWLYQtgE8tUtNpL9riE1222z7u5bHuWp61zlaSQ=;
  b=mVRlsvrSEoYRP5q1Pmok3kvYBQ3cVgmq0NKfP3rHR5Gg/4Rv+GJ+5nYZ
   iKvct96Tti1gNrhsqbWGuEGlyKEBzto8I629ftvcWwMu0HdtSbMgz03av
   HHc+TJlva95cszyDDuLiEeJ+9MXvoTGTsW89Kiri0qtdztbSFI9LR96An
   V/QyWDdXWC7vKNcBRuqCcEGERfuCcDJFkZdAguDOmKf6VEsaD7L+Lq+Wh
   k/s3klFbdrBdu0b5RM5knM+VzYpkyEDpGSEOwpg/DGyvDOEz7jjUJ7cyS
   dnRhuEvqbUUqCNd1/Q9x7zHnC370PzPegeYU3L8CxFXBbGFFqeUtmNWYr
   g==;
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="184070429"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 21:14:04 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 21:14:04 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 27 Jul 2022 21:14:01 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>,
	<tkuw584924@gmail.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>
Subject: [PATCH 0/2] mtd: spi-nor: manufacturers: Replace hardcoded values for addr_nbytes/addr_mode_nbytes
Date: Thu, 28 Jul 2022 07:13:57 +0300
Message-ID: <20220728041359.85468-1-tudor.ambarus@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_211407_977842_1B42F541 
X-CRM114-Status: UNSURE (   6.89  )
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

We track in the core the internal address mode of the flash. Stop using
hardcoded values for the number of bytes of address and use
nor->addr_nbytes and nor->params->addr_mode_nbytes instead.

I don't have those flashes to test the changes, so I'll need some
Tested-by tags.

Tudor Ambarus (2):
  mtd: spi-nor: spansion: Replace hardcoded values for
    addr_nbytes/addr_mode_nbytes
  mtd: spi-nor: micron-st.c: Replace hardcoded values for
    addr_nbytes/addr_mode_nbytes

 drivers/mtd/spi-nor/micron-st.c | 10 +++++++---
 drivers/mtd/spi-nor/spansion.c  | 16 +++++++++++-----
 2 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
