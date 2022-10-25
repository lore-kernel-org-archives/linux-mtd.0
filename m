Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918C4C67871
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Oct 2022 02:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryAug2MVBqcJYYmCC/Y3VllmrgDxq4s5aL8/Inj5nlk=; b=Pdt6oLsavyvE4A
	RBwCw/q69BNgmHkT5RfysOOld3vg6foNuZ0crbXkoOMahWwH31nQw2O3iKC9o/xCzaVoob3Xqm59b
	+gKyexPnxhHJESn6dXdCBJiIIKd4QigF0M4LRfchZWRgJAD0W8mWQ/3JxZhwBsMA0xkd29R+QX1HM
	TdUPf1DMDlyUtGFA+/JQN57FZAFGoUcd1tWFBOGxxucqUrrmwnAjP/NrN+9BteV4rgP7zhzLmOZc/
	Ve6Uvof6eSs9Gw8dAx1iD8TnoX3TwEhU0jG5df0LX0LyP8IpQ9qqlPxs3CVv9/nEdM27ny87T6cJJ
	xFbOLxrX1K/fjI0VEOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9km-003ceL-Uv; Tue, 25 Oct 2022 02:33:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on9kg-003ccG-1q
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2022 02:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666665193; x=1698201193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=43vSWvD73JI3o3PXy5hlZN28vuafYLGMtglCwvp9u3M=;
  b=r5STDcAPpRRukeEQpHtGoB+wJMegjjvVYxGQuSBcZKaQfHPj05y/flrk
   NjoO0ZB03vrWJLHJwrB1iDbI2yIohTm7Lc1OdLGP5oNvmlOARTSrYmBIf
   BCZD+5PPyIsIxdXLZrIlUCB1Y521G7OsvKNHUn47JDySSyB8iT/+Rx1Fr
   QpNRqrp0MfGcAKmfEkj98pY/y4hcq8jfgWlUfOzG7FWepe1/Us05KZltu
   M+5bP+nzVwLNSTJdS0XXnls3Lcc4jPdTrWH4JI98nx9ZUKH8ca9Gsl/Ru
   U6PgEieUcknKsXSHTgdZvJP0rvvvIFbLxAuBI1CkreUvlvEMv87qdrz3w
   A==;
X-IronPort-AV: E=Sophos;i="5.95,210,1661842800"; 
   d="scan'208";a="186236605"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Oct 2022 19:33:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 24 Oct 2022 19:33:13 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 24 Oct 2022 19:33:09 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>, <tkuw584924@gmail.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
	<Takahiro.Kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<Bacem.Daassi@infineon.com>, <michael@walle.cc>, <richard@nod.at>,
	<pratyush@kernel.org>, <vigneshr@ti.com>
Subject: Re: [PATCH v2 0/4] mtd: spi-nor: spansion: Add support for s28hl512t, s28hl01gt, and s28hs01gt
Date: Tue, 25 Oct 2022 05:33:00 +0300
Message-ID: <166666517333.181018.16795631058108886587.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
References: <cover.1661915569.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_193314_114325_B3893B11 
X-CRM114-Status: UNSURE (   6.99  )
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

On Wed, 31 Aug 2022 13:59:02 +0900, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> These devices are variants of s28hs512t(1.8V 512Mb) with different
> density(1Gb) and power supply voltage(3V).
> 
> Datasheet:
> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
> 
> [...]

Applied to spi-nor/next, thanks!

[1/4] mtd: spi-nor: sfdp: Update params->hwcaps.mask at xSPI profile 1.0 table parse
      https://git.kernel.org/mtd/c/d189614f2479
[2/4] mtd: spi-nor: spansion: Remove NO_SFDP_FLAGS from s28hs512t info
      https://git.kernel.org/mtd/c/db391efe765c
[3/4] mtd: spi-nor: spansion: Rename s28hs512t prefix
      https://git.kernel.org/mtd/c/06051322704b
[4/4] mtd: spi-nor: spansion: Add s28hl512t, s28hl01gt, and s28hs01gt info
      https://git.kernel.org/mtd/c/aff1fa414a85

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
