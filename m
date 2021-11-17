Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35208C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 13:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F29C160F9B
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 13:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F29C160F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxfWk9iOGEI4IBfKqyNdSLvd1xU9AP/QpSNYRm6/keQ=; b=fq1mvKOrh7Pa+e
	ySIcAngxN7sP7V7Y59lkgXEWxj03FmgOALyffiEx6FLTsl0DQMKY1Lw3FQCQb8lh7TTiCIaAWx+Zm
	UX/JEcPTiywbx1IFNdKR/iL39lVnHh/QMrsUIN0PwaTuFWORq3RND1kjltyAmtVwxTRN4bIFzEUHn
	EzBrn0tOZUgw8IlHXRoc7GTcCoy7TwXwnTPJser/L8zmcgrKb81WF0H5igQ7ytKoW8q3MP6W+MDFe
	thzvm+h+p3g32xXeELmhinRjo2jHyW5EoKwRvErDCjyg2eq2emzi233cnj5zrjDaam0boKVkNEwIA
	jyF+GQ72Ucao1tFE/E1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnKpW-004pBd-Er; Wed, 17 Nov 2021 13:18:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnKpF-004p9G-TK; Wed, 17 Nov 2021 13:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637155089; x=1668691089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z19VBfrdHCD8DfK3wCd0rdxj5J3Iumcjn+qIg8TiIas=;
 b=ptM112WNYxVZZOMMpBHJUrvQTS95UIKwZjEV0U5Ya34FSex4paW3qOFh
 8eSQq2ZHpgkXijjNCZHSOR2BysWVMe+3vf7GnbqxVXhj66+1AiLytY6UV
 Bqo9pF4fYt1IR8akUTc0SuGFMVUDFjICD7WONMUVWfz9vnnP0rwodLyiv
 6xrgA6GkF/iULKrBIffMnRxNmHazx3ntjmIREzoL0PRvlIz/MVjcSJ0Hy
 od2mAInjFWkeojsGCont/9b6nZ/VqipB/R2G6ZPV1T+lJUja3lU1irY8Z
 AZurh8PYxubCVXPu8v3IlmwlazUu9md9hMawbdgCusdaS6oXxqoB8gGG3 Q==;
IronPort-SDR: +GJgzXbq+C8pMSLzZswKPlEF0xsA2mTkIMM+dp36JrRb0imlAgAA/ZlKQJNA0K4J0z8bgR175y
 zGSeUSqOfPnfOw3USbDijeH3KmzPdII63zfQC8w3sKnhIchClygphAeyJE54N1NQTEcI52/CZj
 TIYc7bD9kMsEJHTo7NgerJVTfBNAMMenjsqaqt1fl0xfi1l4QhoFLdOpF6MMK0st4CtlQLaFvy
 DB+RE27nkWDVQfbzyplun/yGX1o1Uz9q4hLF86ngVefmxtHlROqcVoiWP6z0xid7OX92Nxd1k5
 +XlItrXgnA64WRxeVyqNz876
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; d="scan'208";a="136859886"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Nov 2021 06:18:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:05 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:00 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, <michael@walle.cc>
CC: <jaimeliao@mxic.com.tw>, <esben@geanix.com>, <richard@nod.at>,
 <nicolas.ferre@microchip.com>, <macromorgan@hotmail.com>,
 <zhengxunli@mxic.com.tw>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <mail@david-bauer.net>,
 <linux-arm-kernel@lists.infradead.org>, <knaerzche@gmail.com>,
 <code@reto-schneider.ch>, <linux@rasmusvillemoes.dk>, <sr@denx.de>,
 <heiko.thiery@gmail.com>
Subject: Re: (subset)[PATCH v3 00/25] mtd: spi-nor: Clean params init
Date: Wed, 17 Nov 2021 15:17:58 +0200
Message-ID: <163715355422.1507167.17491302571834390093.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_051810_075515_A0A06564 
X-CRM114-Status: GOOD (  10.46  )
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

On Fri, 29 Oct 2021 20:26:08 +0300, Tudor Ambarus wrote:
> Clean spi_nor_scan() and the flash parameters initialization code.
> Tested all the flashes from patch set. If someone can test the
> locking ops on few flashes would be great. It seems that my flashes
> have the non volatile bits weared out.
> 
> This patch set is split from:
> https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/
> The ID collision series will be set in a dedicated patch set that will
> depend on this one.
> 
> [...]

Applied to spi-nor/next, thanks!

[01/25] mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
        https://git.kernel.org/mtd/c/a360ae43217c
[02/25] mtd: spi-nor: core: Use container_of to get the pointer to struct spi_nor
        https://git.kernel.org/mtd/c/7158c86e5607
[04/25] mtd: spi-nor: Get rid of nor->page_size
        https://git.kernel.org/mtd/c/5854d4a6cc35
[05/25] mtd: spi-nor: core: Introduce the late_init() hook
        https://git.kernel.org/mtd/c/dacc8cfee493
[06/25] mtd: spi-nor: atmel: Use flash late_init() for locking
        https://git.kernel.org/mtd/c/b0fa1db7d2f6
[07/25] mtd: spi-nor: sst: Use flash late_init() for locking
        https://git.kernel.org/mtd/c/7d4ff0613fb5
[08/25] mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
        https://git.kernel.org/mtd/c/00947a964949
[09/25] mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup method
        https://git.kernel.org/mtd/c/3fdad69e7fb2
[10/25] mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
        https://git.kernel.org/mtd/c/f22a48dbd01b
[11/25] mtd: spi-nor: spansion: Use manufacturer late_init()
        https://git.kernel.org/mtd/c/d396e735ba0c

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
