Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8851EC4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 13:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B871613C5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 13:03:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B871613C5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cnAXGniBEh0YTEUJWgv/QVc7O4IAqSXXS5YVZVi4Y88=; b=MomqGuoJ6IXyugS7SbXb/Y3EAX
	SE5VbZHF6qNk98f9BQOCMtM9iN1hN7ntKq8NtHbaDDArV5kyBTEDitZeZMBc5o0g0Mnk+qDf7YRUc
	MInvksJZrS/mq2rORGxIzRpGZSVEca7pjXvyWiac7amue2akI0kOx3m3o0ucP/1FZHsjwgO7TcmcD
	vuDyvRCu3l4gZ1Ecc6LNg0ko3fKQGilgqPTutlu6cl4Ze2S8DoWu/kd9PlzkNuCYiMBrhSwTcIkbc
	mmg8v02avJmp9byzV+brgBwTjvZqR6vNYUCZOazv9OOYoa1UT7a0bQgcJ0x8JPuJ8MP9PS3odrZEg
	HJH/KOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo42Q-00GfKj-8e; Tue, 01 Jun 2021 13:02:30 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo42M-00GfJT-Q0
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 13:02:28 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D339A22236;
 Tue,  1 Jun 2021 15:02:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622552545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbfG+7l9lazycX8CAfFKL8/FChgR2UYhI1E57Fm9gNI=;
 b=mwZ9BlhQhiOFFA1uyVKEOxEDCGuYtVlNwmx15I48E0G4/pLXIVlJlhe2xokz2ng+zgA45R
 WRJOrr/ztnRu18YKD6o/GaulztaHvYscwrP0xsz37z+a2VQ+W0tGAUfTnMbvaZ2V5mc8Ea
 t6hQxfqJ5AhbzhaA/URWcDI3Ty7gdzM=
MIME-Version: 1.0
Date: Tue, 01 Jun 2021 15:02:24 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v4 3/4] mtd: spi-nor: otp: return -EROFS if region is
 read-only
In-Reply-To: <bf3a9cf9-fc72-8ea4-de0a-1f0e123cb644@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-4-michael@walle.cc>
 <bf3a9cf9-fc72-8ea4-de0a-1f0e123cb644@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e9a697de15dcf4f526a7f2da95b67b73@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_060227_027547_2B2140CE 
X-CRM114-Status: GOOD (  17.54  )
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

Am 2021-05-31 10:52, schrieb Tudor.Ambarus@microchip.com:
> On 5/21/21 10:40 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> SPI NOR flashes will just ignore program commands if the OTP region is
>> locked. Thus, a user might not notice that the intended write didn't 
>> end
>> up in the flash. Return -EROFS to the user in this case. From what I 
>> can
>> tell, chips/cfi_cmdset_0001.c also return this error code.
>> 
>> One could optimize spi_nor_mtd_otp_range_is_locked() to read the 
>> status
>> register only once and not for every OTP region, but for that we would
>> need some more invasive changes. Given that this is
>> one-time-programmable memory and the normal access mode is reading, we
>> just live with the small overhead.
> 
> :)
> 
> Shouldn't we change
> struct spi_nor_otp_ops {
> 	...
>         int (*lock)(struct spi_nor *nor, unsigned int region);
>         int (*is_locked)(struct spi_nor *nor, unsigned int region);
> };
> 
> to:
> struct spi_nor_otp_ops {
> 	...
>         int (*lock)(struct spi_nor *nor, loff_t addr, size_t len);
> 
>         int (*is_locked)(struct spi_nor *nor, loff_t addr, size_t len);
> };
> 
> instead?

I had that, but then
  (1) it doesn't fit the hardware (the one's I know of) and the function
      itself would need to convert to the given range
  (2) each lock()/is_locked() would need to implement the "if at least
      one region is locked everything is locked", which might lead to
      different implementations.
  (3) in what address space is addr and len? I'd presume the one of the
      device (so is orthogonal to read()/write()). So if you get lets
      say addr=0x1000 len=512, you'd need to convert that into region
      0 and 1. Thus you'd have this mapping cluttered over all functions.
      And additionally, you'd first need to convert the mtd offsets
      addr=0 len=512 to addr=0x1000 and len=512.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
