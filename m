Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD12C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 10:32:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD23611C0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 10:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFD23611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3JPhL4rMN5GzVu8jNjb+fzuw50NchDSakMG8lvV2+k=; b=zb+7LrLCtY8bicoU0I95zkPnI5
	Fc14MR8LJ2dtWIG889csjyBQoX44FR6Gp0yStDlzAPv5KpzoornnmMNd94UC5Ossa2QKmvy6ZCrYx
	8BoSwHwNpdHUMXsOq+LVPKGBBtb+Acx9k8GWJheo3dnRadnkAXgTT2+oPF/rn3/VdNwHkfTsm5xt/
	k9lrjG2BLzbh+jBzqNGdwrPrc3n7quiOLtcPcUZj592b90Lso/st3H64btBjCZ9ea3qWg5/xw3LAy
	CJ2Rcclxa03WBoaInr8N9pc+91uWDrpJ+VB/2QEqiAAGbSPvGt3YE2m7XQtojUfeOcS7e75/cBkdI
	DIx6b2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk1wc-00G4RX-3A; Mon, 08 Nov 2021 10:32:06 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk1wK-00G4KF-Km; Mon, 08 Nov 2021 10:31:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 88D9E22246;
 Mon,  8 Nov 2021 11:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636367503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shtm3IYMlZclrxv6IEMa3o5J1TwnuLrh44nqqFiSZs4=;
 b=r8IVbv9dy8mGT/GmFJjLvkivrkU7OfAnAJZgW4itxpwU8l33tr8eLROr8LPH4H1po+urzz
 PM8m4G8gpv97eKvcrB84FtEVTfEF7NCbImcvn7+7FmxoMipAl37lYwMwTKd2V9PLxDxTKj
 0WN6WCPWfZP3Sgwv9/BDv5Ik9TvoVUE=
MIME-Version: 1.0
Date: Mon, 08 Nov 2021 11:31:41 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 00/25] mtd: spi-nor: Clean params init
In-Reply-To: <7de434d9-0d40-1514-5a7f-5d179497d1c7@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <7de434d9-0d40-1514-5a7f-5d179497d1c7@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e7b5fd882ff7e11e121ce56f6c63092b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_023149_049546_EAD50ED0 
X-CRM114-Status: GOOD (  24.34  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-11-08 11:15, schrieb Tudor.Ambarus@microchip.com:
> Hi,
> 
> On 10/29/21 8:26 PM, Tudor Ambarus wrote:
>> Clean spi_nor_scan() and the flash parameters initialization code.
>> Tested all the flashes from patch set. If someone can test the
>> locking ops on few flashes would be great. It seems that my flashes
>> have the non volatile bits weared out.
>> 
>> This patch set is split from:
>> https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/
>> The ID collision series will be set in a dedicated patch set that will
>> depend on this one.
>> 
>> Changes in v3:
>> - move late_init() in struct spi_nor_fixups and update patches 
>> accordingly.
>> R-b tags were dropped.
>> - new patch "mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag"
>> moves manufacturer specific flag out of the core.
>> - update methods description to make it clear who sets when
>> - introduce flash_info flag masks to make it clear when one should be 
>> set.
>> - rework "parse SFDP first idea".
>> 
>> Tudor Ambarus (25):
>>   mtd: spi-nor: core: Fix spi_nor_flash_parameter otp description
>>   mtd: spi-nor: core: Use container_of to get the pointer to struct
>>     spi_nor
>>   mtd: spi-nor: Introduce spi_nor_set_mtd_info()
>>   mtd: spi-nor: Get rid of nor->page_size
>>   mtd: spi-nor: core: Introduce the late_init() hook
>>   mtd: spi-nor: atmel: Use flash late_init() for locking
>>   mtd: spi-nor: sst: Use flash late_init() for locking
>>   mtd: spi-nor: winbond: Use manufacturer late_init() for OTP ops
>>   mtd: spi-nor: xilinx: Use manufacturer late_init() to set setup 
>> method
>>   mtd: spi-nor: sst: Use manufacturer late_init() to set _write()
>>   mtd: spi-nor: spansion: Use manufacturer late_init()
>>   mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP 
>> is
>>     defined
>>   mtd: spi-nor: sst: Get rid of SST_WRITE flash_info flag
>>   mtd: spi-nor: Introduce flash_info flags masks
>>   mtd: spi-nor: Introduce spi_nor_nonsfdp_init_flags()
>>   mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
>>   mtd: spi-nor: core: Introduce SPI_NOR_PARSE_SFDP
>>   mtd: spi-nor: core: Init flash params based on SFDP first for new
>>     flash additions
>>   mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
>>   mtd: spi-nor: sst: sst26vf064b: Init flash based on SFDP
>>   mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
>>   mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
>>   mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
>>   mtd: spi-nor: issi: is25lp256: Init flash based on SFDP
>>   mtd: spi-nor: macronix: mx25l25635e: Init flash based on SFDP
>> 
>>  drivers/mtd/spi-nor/atmel.c      |   8 +-
>>  drivers/mtd/spi-nor/core.c       | 480 
>> +++++++++++++++++--------------
>>  drivers/mtd/spi-nor/core.h       | 106 ++++---
>>  drivers/mtd/spi-nor/gigadevice.c |   7 +-
>>  drivers/mtd/spi-nor/issi.c       |   6 +-
>>  drivers/mtd/spi-nor/macronix.c   |  15 +-
>>  drivers/mtd/spi-nor/micron-st.c  |  20 +-
>>  drivers/mtd/spi-nor/otp.c        |   2 +-
>>  drivers/mtd/spi-nor/spansion.c   |  15 +-
>>  drivers/mtd/spi-nor/sst.c        | 105 ++++---
>>  drivers/mtd/spi-nor/swp.c        |   2 +-
>>  drivers/mtd/spi-nor/winbond.c    |   7 +-
>>  drivers/mtd/spi-nor/xilinx.c     |  21 +-
>>  include/linux/mtd/spi-nor.h      |   2 -
>>  14 files changed, 460 insertions(+), 336 deletions(-)
>> 
> 
> I would like to apply this when -rc1 is out. Can some of you run some 
> tests
> and check if everything is ok? I have done few tests on the flashes 
> that I
> mentioned in the cover letter, all should be ok. I'm particularly 
> interested
> in the locking support. I can test the unlock_all on sst26vf064b 
> validating
> the locking part, but it would be good if locking is tested on other 
> flash
> too.
> 

FWIW, I've quickly tested the series on a W25Q32JW (OTP only) and 
W25Q128 (OTP
and locking, OTP patch is not upstream).

Tested-by: Michael Walle <michael@walle.cc> #on w25q32jw and w25q128fw

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
