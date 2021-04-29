Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0EFC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:45:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FECF6140C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 16:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FECF6140C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kxmc0HJaLdio92H+LNiOnxiPs5nZlrYAZrghElC/EGI=; b=dLEBkgZin9sbbQANXiCw4vuRn
	aqfhkafXvUq4z1OaOl5EaF4g4yCpOOeLuFCUljA4uChfG3p16f2SGl5ryz3ZsQnPvxsPI4zLbS2ym
	SKUD8ELudXMhc/OJE1t+EiD8WbhYsUbIZR1AypevYghcoC3Q240XwmeG/krNnNMX76L5bDG+0g0Gx
	hlf9QjWpQAuN+FSbW13DnFy2lGFeVqAWQjVxs5JBXUwnKikVEL7GydTlYKcZA0vYiDG/am9PhdBJo
	C0k1L7Cg4YcN8om+mnyD7U80htqLJZe5VjfrejBSPvNBre+mJFZOyw6otZoGJtQ8byx2iaOPwXy/t
	G0uYhDokQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc9mP-0064fu-R4; Thu, 29 Apr 2021 16:44:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9mN-0064fe-KH
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 16:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=lOnX55mTU7vLL2DHd0LKX5pk2bsXFmUc1Ibom8J1lfI=; b=rggIhjcQ8jNcnX1ct+sJTpxUdx
 YByPKK9x3E0xPSDdjDnHpwl9rNKGQfZEIT8T8WuBqAvR3/x6aN9sSdrMA5V1sZK8pxoZJ+XDv4STx
 jwc9fSAWnPC75LslyGjDJBxlOGQDj+1SVR0IEkhdeCR0HKRDpTSD0IGaxa1wyPJxsh79QolM/UH2G
 ldkv+p3LhEkG/XJa9hgCmpj2MaeHciW72bSQveQDmBqoKNmstj0OYlC5Z8Q8HEHopXtJiHv333d2E
 NhzSSepeqx1xmQy5FZAlDtZl3Z/WlErKzbQKe+y4OkB2x9M7O05f1GF2atJgqdJ7dU7Us1QaKM+Ni
 pmzN/c3Q==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc9mK-000mRB-JW
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 16:44:42 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 70FBA2224D;
 Thu, 29 Apr 2021 18:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619714678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOnX55mTU7vLL2DHd0LKX5pk2bsXFmUc1Ibom8J1lfI=;
 b=CcpbZ/rOaxtfl/zF/iR0A5KY0G00xotJ3hiJn2IKgCBkyUcrmgaaZxVR6FJ7GQW0C5hulI
 bqMwT4kRo4D6psH4UBHaTNJjCSEc/S/QoDcF4er8GB0dyYpOh23BS5PmouFvUWdWi7jgpN
 TxF/ft3NxxNRxZKXdNmKLQve6HB1Npk=
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 18:44:38 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Williams <awill@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Yicong Yang
 <yangyicong@hisilicon.com>, Heiko Thiery <heiko.thiery@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: add initial sysfs support
In-Reply-To: <CACqsJN8mrHUB9Ls3PG5R_B84+xUjf-2VakA=09mP_bodWnUgmw@mail.gmail.com>
References: <20210429155713.28808-1-michael@walle.cc>
 <20210429155713.28808-3-michael@walle.cc>
 <CACqsJN8mrHUB9Ls3PG5R_B84+xUjf-2VakA=09mP_bodWnUgmw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <04bc3eda0fa5a84ffff4b2f05721e2ac@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_094440_973547_148BBF3F 
X-CRM114-Status: GOOD (  24.09  )
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

Hi Alex,

Am 2021-04-29 18:23, schrieb Alexander Williams:
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
>> +Date:          April 2021
>> +KernelVersion: 5.14
>> +Contact:       linux-mtd@lists.infradead.org
>> +Description:   (RO) The JEDEC ID of the SPI NOR flash as reported by 
>> the
>> +               flash device.
>> +
>> +
>> +What:          /sys/bus/spi/devices/.../manufacturer
>> +Date:          April 2021
>> +KernelVersion: 5.14
>> +Contact:       linux-mtd@lists.infradead.org
>> +Description:   (RO) Manufacturer of the SPI NOR flash.
>> +
>> +
>> +What:          /sys/bus/spi/devices/.../partname
>> +Date:          April 2021
>> +KernelVersion: 5.14
>> +Contact:       linux-mtd@lists.infradead.org
>> +Description:   (RO) Part name of the SPI NOR flash.
>> +
>> +
>> +What:          /sys/bus/spi/devices/.../sfdp
>> +Date:          April 2021
>> +KernelVersion: 5.14
>> +Contact:       linux-mtd@lists.infradead.org
>> +Description:   (RO) This attribute is only present if the SPI NOR 
>> flash
>> +               device supports the "Read SFDP" command (5Ah).
>> +
>> +               If present, it contains the complete SFDP (serial 
>> flash
>> +               discoverable parameters) binary data of the flash.
>> diff --git a/drivers/mtd/spi-nor/Makefile 
>> b/drivers/mtd/spi-nor/Makefile
>> index 136f245c91dc..6b904e439372 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,6 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> 
>> -spi-nor-objs                   := core.o sfdp.o swp.o otp.o
>> +spi-nor-objs                   := core.o sfdp.o swp.o otp.o sysfs.o
>>  spi-nor-objs                   += atmel.o
>>  spi-nor-objs                   += catalyst.o
>>  spi-nor-objs                   += eon.o
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 20c7ee604731..57d8a4dae5fd 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3349,6 +3349,7 @@ static struct spi_mem_driver spi_nor_driver = {
>>                 .driver = {
>>                         .name = "spi-nor",
>>                         .of_match_table = spi_nor_of_table,
>> +                       .dev_groups = spi_nor_sysfs_groups,
> 
> Putting these in the driver's dev_groups does create a divergence 
> between
> different spi-nor controllers. For all the controllers supported in
> drivers/mtd/spi-nor/controllers/, would their drivers need to add the 
> same sysfs
> groups to get the same support?

Well, one supports it and one does not, no? If support is added later,
we should keep an eye on it. Unfortunately, I don't have any hardware
to see if just adding the .dev_groups to another driver will just work.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
