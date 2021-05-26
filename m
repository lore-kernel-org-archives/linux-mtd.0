Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD82EC47082
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9355B613F6
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 11:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9355B613F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ILE5lV2uTcE8WJwJy7S78RS8cU0FOn0GA/0Q3WWjUI=; b=Y5ufOGr7VaebY4H1eyE2ji1b2M
	THzeTEVP931xxKq5asGJ+uD3t1wL+XvD3/eq5+X0u70fsGgFFKzAEr2Q/lYaOff/CC+cqoaq7cYEH
	hc08A5jI9ejxu3UwWurlwJnF4S8unt+wwbQljStSnAWVENizR42WI3zaNxlbXerO21rRL3sQ9B9KL
	Kn3T6w1bb6YZi3/lVVxev13QAZOLEZCMzhLmoRFA9XdYrkjMXv90jL38ecCFaMnBH8Dfr5lT4Tqv5
	RjPcsdvf/2T3yaoXKztj4fvrFe16zHkXBWmTeF39JobYaE5nyI/qOOfA0R1iqsdHiuM8/JtYUoJ8I
	H2A3gILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llrdp-00DWZz-Ta; Wed, 26 May 2021 11:24:02 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llptS-00CuBN-Br
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:32:04 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E2A18221E6;
 Wed, 26 May 2021 11:31:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622021520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUUFLBE2DJfn5WIA3lwxFzLkVA7AxbnJEtb4B76fUfw=;
 b=p2CCfn7uGPL9QbhyBwsMC4EaCF+586CyeDZbcOj7kqdA66BZNO8ks9na5PJZp3P7nTQVUv
 yzGPXunY/Dl9yxpB9hE2UDNv9Aa/lQ84CylBNzraBbHYjfU69XN8NlisxJcNYmZ59gykwK
 vcjhjV6tXQme605Zg72cqVzcug8fYn4=
MIME-Version: 1.0
Date: Wed, 26 May 2021 11:31:58 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for second flash chip
In-Reply-To: <20210526092417.GA291593@lahna.fi.intel.com>
References: <20210525160318.35802-1-mika.westerberg@linux.intel.com>
 <20210525191414.dc45h27rzqen4dce@ti.com>
 <20210526091250.GY291593@lahna.fi.intel.com>
 <20210526092417.GA291593@lahna.fi.intel.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e82f44552d0d4284fc5ed22ee0bee85a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_023202_633655_C325A3B4 
X-CRM114-Status: GOOD (  31.60  )
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

Am 2021-05-26 11:24, schrieb Mika Westerberg:
> On Wed, May 26, 2021 at 12:12:56PM +0300, Mika Westerberg wrote:
>> Hi,
>> 
>> On Wed, May 26, 2021 at 12:44:16AM +0530, Pratyush Yadav wrote:
>> > Hi,
>> >
>> > On 25/05/21 07:03PM, Mika Westerberg wrote:
>> > > Intel SPI flash controller has been supporting two chip selects long
>> > > time already even if the most common configuration is to have single
>> > > flash chip for the BIOS and related data. This adds support for the
>> > > second chip select if we find out that there are two flash components
>> > > (this information is available in the mandatory flash descriptor on the
>> > > first chip). The second chip is exposed as is without any partition
>> > > information with name "chip1". The first chip continues work as is.
>> > >
>> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>> > > ---
>> > >  drivers/mtd/spi-nor/controllers/intel-spi.c | 208 ++++++++++++++------
>> >
>> > Aren't the drivers in controllers/ supposed to move to use SPI MEM? I
>> > don't know if this has been discussed before, but I would like all
>> > drivers in controllers/ to move to SPI MEM API at some point in the
>> > future. This would let us drop support for this "legacy" controller API
>> > from SPI NOR, cleaning up the core quite a bit. No more if (nor->spimem)
>> > needed anywhere.
>> 
>> What is SPI MEM? :) Looking at the mainline v5.13-rc3 controllers/ 
>> there
>> is no single driver "converted" to SPI MEM, at least from a quick
>> clance.
>> 
>> > I wonder what other folks think about this. I vote for freezing all new
>> > features in controllers/. If you want something new, move to SPI MEM.
>> 
>> I think at this point it is not reasonable to expect that all 
>> controller
>> drivers move to your new framework that has not even landed the
>> mainline ;-) Or did I miss something?
> 
> Oh, I see now this commit:
> 
> a314f6367787 ("mtd: spi-nor: Convert cadence-quadspi to use spi-mem 
> framework")
> 
> So "SPI MEM" means generic SPI subsystem for memory mapped devices.
> Unfortunately Intel controller at least is not capable of running
> generic SPI transactions. It only supports accessing SPI-NOR flashes 
> and
> for those there is small set of commands that supports. I don't think 
> it
> is even possible to convert the driver to generic SPI subsystem.

AFAIK it stands for SPI memory device (memory mapped is not a 
requirement).
Eg. spi-nxp-fspi doesn't support generic SPI devices either, but just 
SPI
flashes. So I'd guess SPI MEM is exactly what you are looking for.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
