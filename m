Return-Path: <SRS0=3Xy9=J2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26ACC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:47:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A4E611BE
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Apr 2021 15:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A4E611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CWHdjQgtKZDn6h8VJwzXrsNFPFrL0AAagNzfxec+uSw=; b=E6u1GLDVxjILA6QrunPZRr49l
	f5aIRB3bXZpVdqqFQI+0z35t9HkDgGJ+g2dVZjx5oDRvETw6bez6ulIZj8JjvkKHWag2zdkuPjxc9
	75qyEauTJLbjfArhMBFuGNlTX2qmRcpC6GvHKaKt/W3GxHn7pxXqURn3fIeoECNhp2pjCiSAU4sj3
	y5ohXkW0xJU6K/3UGAlq+jYGBzmD0AnCfeAWWvI5B/DL7BrJtiEn2pVkh9HMj2MQAFB9FIeczmygj
	ifiR/o25rptSEy5fS00wAvZXWHmgksOzugC2Y0m41n5sA8g3bv8iUNTi5/0/HR35LQr+SCjLWSF+d
	AtW/VfZZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc8sI-0060Kz-Sm; Thu, 29 Apr 2021 15:46:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8sF-0060Ks-U1
 for linux-mtd@desiato.infradead.org; Thu, 29 Apr 2021 15:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=apqOvtdROCdFE2hHJqMrA9fP9E6tUl9T38xewx2r7fM=; b=R2XVSa2f/5VzNvVuooc1N9WQdw
 S5Q66LwevGnrxr2USO2dUQ4FKCTepYRgfkLOMk3QyGk6c30FN8cmszLqP+AWHCWgrRv6uW2Ciwa0J
 IE+6Ae075THcsp4ZCZBhINojGC9CxyXKDi0+HGnzy9AadfDMov/Z9lRYGbsUfN4pyfH6RZikcLznb
 dpVumn0MhO8sE8bRks5Gfku4yRzEAF8BFXrSIJ3hpWuG8HoHKtVaP7JLL2Tk/0JCl1e/tKlLkyjhj
 g9vUOny7spdCcgdKMgPKzW8blJb6InbS/Vsn+BJszhjsnczwcSMPfonjFtIhVAAUWcPOn2PF/7L0U
 zp51kJZw==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc8sB-000jXr-9V
 for linux-mtd@lists.infradead.org; Thu, 29 Apr 2021 15:46:42 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 380082226E;
 Thu, 29 Apr 2021 17:46:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619711196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=apqOvtdROCdFE2hHJqMrA9fP9E6tUl9T38xewx2r7fM=;
 b=bNt571yoyNSvca/gE7YzhRaW01w4kAD1V7xNQdxnuVVrswjahXtxkVh9w0R2YHcIfwUJHy
 SnAuDRRHMgkz5LzcW+lvuaWfNbD2iykg5cuPqWls87Nuq+n5NOb8m7yu3x9KJroV91ngYa
 YRMJkDiGJSRq/7IFp1SnpJSpo4v9qHg=
MIME-Version: 1.0
Date: Thu, 29 Apr 2021 17:46:36 +0200
From: Michael Walle <michael@walle.cc>
To: Alexander Williams <awill@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, p.yadav@ti.com, richard@nod.at,
 tudor.ambarus@microchip.com, vigneshr@ti.com
Subject: Re: [PATCH 2/2] mtd: spi-nor: add initial sysfs support
In-Reply-To: <20210429153725.15970-1-awill@google.com>
References: <20210318092406.5340-3-michael@walle.cc>
 <20210429153725.15970-1-awill@google.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9b0f13aba55e1a25054303dd1dc719eb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_084639_950056_E6D21F79 
X-CRM114-Status: GOOD (  26.44  )
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

Am 2021-04-29 17:37, schrieb Alexander Williams:
> Hi Michael,
> 
>> On Thu, Mar 18, 2021 at 10:24 AM Michael Walle <michael@walle.cc>
>> wrote:
>> Add support to show the name and JEDEC identifier as well as to dump 
>> the
>> SFDP table. Not all flashes list their SFDP table contents in their
>> datasheet. So having that is useful. It might also be helpful in bug
>> reports from users.
>> 
>> The idea behind the sysfs module is also to have raw access to the SPI
>> NOR flash device registers, which can also be useful for debugging.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/Makefile |  2 +-
>>  drivers/mtd/spi-nor/core.c   |  5 +++
>>  drivers/mtd/spi-nor/core.h   |  3 ++
>>  drivers/mtd/spi-nor/sysfs.c  | 86 
>> ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 95 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/mtd/spi-nor/sysfs.c
>> 
>> diff --git a/drivers/mtd/spi-nor/Makefile 
>> b/drivers/mtd/spi-nor/Makefile
>> index 653923896205..aff308f75987 100644
>> --- a/drivers/mtd/spi-nor/Makefile
>> +++ b/drivers/mtd/spi-nor/Makefile
>> @@ -1,6 +1,6 @@
>>  # SPDX-License-Identifier: GPL-2.0
>> 
>> -spi-nor-objs			:= core.o sfdp.o
>> +spi-nor-objs			:= core.o sfdp.o sysfs.o
>>  spi-nor-objs			+= atmel.o
>>  spi-nor-objs			+= catalyst.o
>>  spi-nor-objs			+= eon.o
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 4a315cb1c4db..2eaf4ba8c0f3 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3707,6 +3707,10 @@ static int spi_nor_probe(struct spi_mem 
>> *spimem)
>>  	if (ret)
>>  		return ret;
>> 
>> +	ret = spi_nor_sysfs_create(nor);
> 
> This appears to be racing with user space. By the time we reach 
> probe(), the
> device embedded in the spi_device has already been registered, with the 
> uevent
> sent out, right? udev may not see the new attributes created here.
> 
> Since we reuse a preexisting device throughout spi-nor, it seems 
> awfully
> challenging to be able to safely add sysfs attributes. Would it make 
> sense to
> create a spi-nor-specific device/class? Or perhaps attach these 
> attributes to
> the device in mtd_info like I've done in
> https://lore.kernel.org/linux-mtd/20210428052725.530939-1-awill@google.com/ 
> ?

Do you encounter this problem? I'm currently working on this and dropped
the sysfs_create() and use dev_groups of the driver spi nor driver.

But I'm not sure how it will be handled anyway. Because we know the
content/size SFDP only after the probe and in any case the probe could
also fail. So I don't really understand how that is handled.

I've looked at your patch and it seems that the surpress_uevent() is
rarely used in the kernel.

I don't want to attach it to an MTD device because you might have
multiple ones which has the same SPI flash device as parent. The
SFDP is really a property of the flash device and not one of the
MTD partition.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
