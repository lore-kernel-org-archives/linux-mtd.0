Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D231C11F67
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 22:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 628B161413
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 22:11:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 628B161413
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iuGMtlVYPaIynkiLatPDouKyBLOZH237yWrVs4nuH4=; b=y/O7og9T0jP8fmgJNlbNsG5She
	m3lAhw1IZQd4FFF+BN5W2x4/WxW+WHcYtjCTabwvfxvRhYUfzG46xm8G1kEszA1+7eZfoWXvou+f7
	kcIWESHgJlEQsItqJn4+KbMxN68BOTV9HZW0B4s1+TPzoFII/AZbaBACwGyfrnFYm7qBtowJ/p6jU
	lDsnEY9O81+MrBAr8VImmwXZOPNZ9Up1tUQCtLLqn8FUD1Dj4/ZK3F1AhKE0VNq6U8KOYMQIpliL0
	elqJFcPhYQlykOu9QzpdoupsGChmdAmp//WZMej3oCfHl61Cpd6/303kSqoPUbB2KHsDpImCFhyqR
	oGEGRVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz4tG-001Jp5-Cx; Thu, 01 Jul 2021 22:10:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz4tD-001JnM-6Q
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 22:10:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5EB632224E;
 Fri,  2 Jul 2021 00:10:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625177425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PcAxigrwwF9F3F7PPN780aqLqzi5RHsuceox244cbvk=;
 b=sd8RLE6MNUd4PQ207kQFHzYKzN1dwqULKM+tdqflqVkNAYD4Sbiq0+9BXQdNcDZuUGBlO8
 YYAqBIpBQhvIWuewtFly91fBZ726czmJk0500wclEG0REDdpSZ2qLDCujbooXCnylKM6i/
 sN82miAXk3i4vBTyJvlAcx/qwcj7wYw=
MIME-Version: 1.0
Date: Fri, 02 Jul 2021 00:10:24 +0200
From: Michael Walle <michael@walle.cc>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 5/5] mtd: core: add OTP nvmem provider support
In-Reply-To: <20210701213420.GA1131789@roeck-us.net>
References: <20210424110608.15748-1-michael@walle.cc>
 <20210424110608.15748-6-michael@walle.cc>
 <20210701213420.GA1131789@roeck-us.net>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f48661d2d54b37db395fb73af8b52359@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_151031_442670_C6AAE1FB 
X-CRM114-Status: GOOD (  22.07  )
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

Hi Guenter,

Am 2021-07-01 23:34, schrieb Guenter Roeck:
> Hi,
> 
> On Sat, Apr 24, 2021 at 01:06:08PM +0200, Michael Walle wrote:
>> Flash OTP regions can already be read via user space. Some boards have
>> their serial number or MAC addresses stored in the OTP regions. Add
>> support for them being a (read-only) nvmem provider.
>> 
>> The API to read the OTP data is already in place. It distinguishes
>> between factory and user OTP, thus there are up to two different
>> providers.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
> 
> This patch causes a boot failure with one of my qemu tests.
> With the patch in place, the flash fails to instantiate.
> 
> [    1.156578] Creating 3 MTD partitions on "physmap-flash":
> [    1.157192] 0x000000000000-0x000000040000 : "U-Boot Bootloader"
> [    1.184632] 0x000000040000-0x000000060000 : "U-Boot Environment"
> [    1.201767] 0x000000060000-0x000000800000 : "Flash"
> [    1.222320] Deleting MTD partitions on "physmap-flash":
> [    1.222744] Deleting U-Boot Bootloader MTD partition
> [    1.303597] Deleting U-Boot Environment MTD partition
> [    1.368751] Deleting Flash MTD partition
> [    1.430619] physmap-flash: probe of physmap-flash failed with error 
> -61
> 
> -61 is -ENODATA.
> 
> Other boot tests with different flash chips can still boot.
> Reverting this patch (as well as the follow-up patches) fixes
> the problem.
> 
> I do not know if this is a problem with qemu or a problem with the
> patch, but, as I mentioned, other flash chips do still instantiate.
> 
> Do you have an idea what to look for when I try to track down the 
> problem ?

I'd start by looking at the return code of mtd_otp_size() because that
should be the only function which communicates with the flash at probe
time.

Can you share how to reproduce that problem? Like the qemu commandline
and involved images?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
