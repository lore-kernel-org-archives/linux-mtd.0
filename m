Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1310C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 15:23:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E80F65105
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 15:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E80F65105
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q1pfGUiwKD3xKrJsF6ssoMinNv98c2kSURRZkimr+qI=; b=FQigO/ivYDGW1iEt3zZlyvC/q
	xfRbMC8R4/Lo+UVK+0hOXJY364LbFQIIHJkip8xcLO1cU1xCLlzcIuYz1wPVQ18p+/LhCbYa98Q1C
	mmm9X2d3Dqe+MTlR2ioD9ub/TegOPAsZh8XkVENwDntN6fwwTF4r9UQDaaQIngMTC/f/XGAVPC7Km
	8aTai0yphk4WGhOQMEzEzFf9bD3yiMZ0mbqXAEfuclqxZE03nmlNX5e4CvEgk/0S4iO7Pl7Sf9cSa
	XVYM9DqyZfouY3c12v4+Al6IMjJut7XvFmWlmpZqDBMsvy4KKZop9b09HK7Rk50F6UGUfjRrIgxBA
	BnXw94x+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJHiW-000WrE-Bp; Mon, 08 Mar 2021 15:22:44 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJHgY-000VN6-Rd
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 15:20:45 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id ED9CA22239;
 Mon,  8 Mar 2021 16:20:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615216840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5gseV75yDdwG1QVb9Uy4lYdjj6Hj7+/6C7YMvfyXIs=;
 b=OH9PxshgFC91hdtUZ8FZr0LuHPNpHyu27ePtSKlRbtlqyKfJPE/sg/UhJRvBSgCsqH3OaL
 HZtIKGNwHGJBsGBk6FXGsdLtHFkjjRWsN6P5IPqVWOAVK3B+Bi3oOYsDbFheWYSaAqCGFu
 rqNrvCsU5j9HTk1jExZatgydlN2EcU0=
MIME-Version: 1.0
Date: Mon, 08 Mar 2021 16:20:39 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: David Bauer <mail@david-bauer.net>, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: add block protection flags to macronix
In-Reply-To: <9eb05563-70b4-1653-d818-6a039f1c53ff@ti.com>
References: <20210303094833.139221-1-mail@david-bauer.net>
 <9eb05563-70b4-1653-d818-6a039f1c53ff@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <346332bf6ab0dd92b9ffd9e126b6b97c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_152043_218214_DCC32BCB 
X-CRM114-Status: GOOD (  19.47  )
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

Am 2021-03-08 15:20, schrieb Vignesh Raghavendra:
> On 3/3/21 3:18 PM, David Bauer wrote:
>> Macronix flash chips support block protection by using BP bits in the
>> read status register. Add the corresponding flag to indicate block
>> protection support.
>> 
>> Otherwise, locked blocks are not unlocked when requested.
>> 
>> Signed-off-by: David Bauer <mail@david-bauer.net>
>> ---
>>  drivers/mtd/spi-nor/macronix.c | 1 +
>>  1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/macronix.c 
>> b/drivers/mtd/spi-nor/macronix.c
>> index 9203abaac229..2d39dd32a64e 100644
>> --- a/drivers/mtd/spi-nor/macronix.c
>> +++ b/drivers/mtd/spi-nor/macronix.c
>> @@ -94,6 +94,7 @@ static const struct flash_info macronix_parts[] = {
>> 
>>  static void macronix_default_init(struct spi_nor *nor)
>>  {
>> +	nor->flags |= SNOR_F_HAS_LOCK;
> 
> We need to take into account the state of TB bit (Config Reg bit3). 
> This
> is an OTP bit and driver should not ideally change it but should
> consider the state of the bit.
> 
> Without looking at TB bit, current locking implementation would be
> incomplete.

If someone wants to dig into that, some time ago I tried it myself:
https://github.com/mwalle/linux/commit/1a56154bbe1696268d1245eea9e170a2feb7ca46
https://github.com/mwalle/linux/commit/7f3d4f7cbac87a6c5b900be7164dabb8991b0f93

I've never managed to post them to the list and they aren't tested
and they have yet another new flag.. And there was some catch with
it, I don't remember anymore right now.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
