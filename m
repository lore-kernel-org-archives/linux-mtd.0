Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E869C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B506103D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 12:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15B506103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gbivjk+aAM0KTzI/5gzskiExGY7Iou3tP1UXP4E6/GU=; b=OYnUPR1eCwVDsMOBQqU2SW/Da4
	ey7Tvbw25mbG4rSGyCKIBmtsM6nSySqHxWvf11xh3cFYIvkyMDuvSokpu9tG8/h3oGASMU1hscKX5
	LFi3Q/L8Y06AVi8HSCZqumX4+d00LfO+A9sKF2OwrrdGbtW6ywxA75jnyudXKaKVcAFEaQBSSwxJK
	6BLvaUhNzv5KKcw/ZPxnP438R6WwlnXeq+gpnkTwJ2sChwyX/txUSA5pipHRRBsNw3HXClL5Ts5jD
	TZfTg8SzFQn9/IUHfq+iYEkBfARPOzd78v2jD4UCzZslLD58MBQ4yghKvjGOKx3ml4Juveln/05ot
	K+nnBZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQC8-0021L3-US; Tue, 09 Nov 2021 12:25:45 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQBt-0021IG-8R; Tue, 09 Nov 2021 12:25:30 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 47F5622246;
 Tue,  9 Nov 2021 13:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636460727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBmpyEa1HTd9rKT9sGA0gJ2MLqxIi0T8Fs0+BqV2xyY=;
 b=ULPJMZBgpjkvzTj7w6JCFdWDvDcSMAWXfEAUWpjtB5y1ziPt6jWNyeUDTWZEVfReGKKxd3
 YCb2jcAr0yN2MYyRqYuoEPC19vlFMbt/oGmYmsi9HInPYWynML6J7mg7aTk2tiFFu4st8E
 2b5hXY5yf9cRAxcxhPMx8emKNgCF6F4=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 13:25:27 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 20/25] mtd: spi-nor: sst: sst26vf064b: Init flash based
 on SFDP
In-Reply-To: <11ac4016-94ad-39ce-e845-0324543065fa@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-21-tudor.ambarus@microchip.com>
 <11ac4016-94ad-39ce-e845-0324543065fa@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <feebb504a3d6f27061a1e2faadec8fe9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_042529_496389_6FBD76F6 
X-CRM114-Status: UNSURE (   8.41  )
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

Am 2021-10-29 19:31, schrieb Tudor.Ambarus@microchip.com:
> On 10/29/21 8:26 PM, Tudor Ambarus wrote:
>> Get rid of the static initialization of the flash parameters and
>> init them when parsing SFDP.
>> Generated a 256 Kbyte random data and did an erase, write, read back
>> and compare test. The flash uses for reads SPINOR_OP_READ_1_4_4 0xeb,
>> for erases SPINOR_OP_BE_4K 0x20, and for writes SPINOR_OP_PP 0x02.
>> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
> 
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> bf2643
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> sst
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/partname
> sst26vf064b
> root@sama5d2-xplained:~# cat
> /sys/devices/platform/ahb/ahb:apb/f0020000.spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > sst26vf064b-sfdp
> root@sama5d2-xplained:~# hexdump sst26vf064b-sfdp

xxd please, and md5sum or sha256sum or really any
checksum is missing.

same goes for the other flashes.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
