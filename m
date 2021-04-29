Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC79C433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 21:55:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03EE26141C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 21:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03EE26141C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SF0zH0BMEW+uZi0OzYOCNLvN0XCDRpZNrdZlpQlDuMA=; b=Fc0IZk/HbZwXoqO7UIH4kVZ/o
	XrKcV/UnKFA3+6rOM9gKWGU7kKpdhAaZYUg/G0JZ+beskJazVbuuZha5S6P8TV+4OU1BabUQpNtDS
	qf3VETnJytBIN+hHgLtSE3kFUl4pZoviar6GTDR4mos3lQcki1FofZ/x7lMhyohtXT4NjlPoRpRJb
	p98jBYMtnSWddoJeaC5fxRZj5mFzLJaX5kpxcswITEdppJRGexsu5mHH6dvPJyBcFOMAAPwauqI3Z
	r9eMSlOc1vlhzrmTlb4FL7/8FUYkzlwytocXMyT2X7rEESq0NB8oEJfellD40lPMY6nNobHur13wX
	Zlypxf5Lw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcEcD-006bKx-HY; Thu, 29 Apr 2021 21:54:33 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEcA-006bKG-3U
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 21:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=oXpSnLEeC6oBxENRxivNH8jCYJ0/yDWPA3cKpHsHYfg=; b=MVdrG7ap+UbMEcnFSYLXa01iXw
 /l223e6voZpoct9BZH1ydlLeZQ4/FNsVms4nDS5AqmvD8EmP83u0E0IQqss0l/82/TVh/rMNArMjU
 Z5xVSNpbyOKCCyLdbcbJPn/pX4wntdrDdL6Zf0uwOqzDPP4wIXTElokCHGhCXVvhVaaUi+/Aqw1qk
 2HpaX2diWW+HD7fvrDQvpUj1l4DKkbK25aHhOxvBc42+kS2gKKzB1qSAmcEDO/TODqXy5Fibc7vYS
 Vh0BPyVcjNVp/RjOnT0Gc6c/2VohC5pp3D5rd/Y39pLTNfaNeMM0OrKvCkM0IhFXItVFTgLui7ODW
 xo2rtSpg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcEbw-000zsy-VI
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 21:54:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0095422239;
 Thu, 29 Apr 2021 23:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619733249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXpSnLEeC6oBxENRxivNH8jCYJ0/yDWPA3cKpHsHYfg=;
 b=EmJMl/fsFTxs///d3O5Gi3qqqp/AHduNDC7pyIXWbA58TDTERUMHTnkAZm0/Yjx0Uxxsx/
 UMJTjhYdIqhTEfADtYye0AI7fvEXeZnqJwGWzWcsApaR0KfjUv+m9UiIt389RbPPeHfyXg
 DQ04jGPd9dMfewO7FgWvLPuenoz3RTY=
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 23:54:08 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Williams <awill@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Yicong Yang
 <yangyicong@hisilicon.com>, Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add initial sysfs support
In-Reply-To: <CACqsJN9283nSmgdDTz+LhfiQwfi4ZmrSJEP+0JJ24-KZ7isMEA@mail.gmail.com>
References: <20210429155713.28808-1-michael@walle.cc>
 <20210429155713.28808-3-michael@walle.cc>
 <CACqsJN9283nSmgdDTz+LhfiQwfi4ZmrSJEP+0JJ24-KZ7isMEA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ceae5479c5146e09a945a89da7d99b10@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_145417_188202_EB5E5E90 
X-CRM114-Status: GOOD (  15.62  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-04-29 23:34, schrieb Alexander Williams:
> On Thu, Apr 29, 2021 at 8:57 AM Michael Walle <michael@walle.cc> wrote:
>> 
>> Add support to show the manufacturer, the partname and JEDEC 
>> identifier
>> as well as to dump the SFDP table. Not all flashes list their SFDP 
>> table
>> contents in their datasheet. So having that is useful. It might also 
>> be
>> helpful in bug reports from users.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> Pratyush, Heiko, I've dropped your Acked and Tested-by because there
>> were some changes.
>> 
>>  .../ABI/testing/sysfs-bus-spi-devices-spi-nor | 31 +++++++
>>  drivers/mtd/spi-nor/Makefile                  |  2 +-
>>  drivers/mtd/spi-nor/core.c                    |  1 +
>>  drivers/mtd/spi-nor/core.h                    |  2 +
>>  drivers/mtd/spi-nor/sysfs.c                   | 92 
>> +++++++++++++++++++
>>  5 files changed, 127 insertions(+), 1 deletion(-)
>>  create mode 100644 
>> Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
>>  create mode 100644 drivers/mtd/spi-nor/sysfs.c
>> 
>> diff --git a/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor 
>> b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
>> new file mode 100644
>> index 000000000000..4c88307759e2
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-spi-devices-spi-nor
>> @@ -0,0 +1,31 @@
>> +What:          /sys/bus/spi/devices/.../jedec_id
> 
> Since mtd/spi-nor doesn't own this device (belongs to the spi 
> subsystem), should
> we put its attributes under a named subdirectory? Perhaps something 
> like
> /sys/bus/spi/devices/.../spi_nor/jedec_id ?
> 
> I'm just thinking about avoiding any potential for namespace clashes.

Good idea! Will change that in the next version.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
