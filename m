Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18C0C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:50:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEF146186A
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEF146186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VAeOkR0fAv8juZhoeUFvKQFOZDmzreIhETYu10BczLM=; b=RXTXebpMX1MT9AanPz+giHkuI
	qE3huqBSFEhZJXNEt1tQahdrszVjQ5cA/kAxZLHD79LUttLU0mdWh9bZxX0/zs7cDy8OZPZze3faD
	AsRhxN2V4dtqrtuCmaqb5LFupxaXKbjX5vrgeAL5FOmn56rt1abGbJbaKd73f2dEOc4cB12xj1qCX
	5t9H6/G4ZtdqHrGVZGiWiJpj1roiqJ0S+yTnS3cMde9X/mzZP8xai1zNqyurzjbLNIB3Yk6uEhvxB
	biYB/ruSgMh9TrZc2UGq+5enQnfBerEAK0/pNeNeFVsfgyGPLix8UIijUr58m/Z3NXsW0zcupHF17
	L5nwB9Ccg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTko-005Skt-3q; Wed, 03 Mar 2021 15:49:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSk3-005CMD-9u
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=mTtVJwCrMEqy04BVWxGgfe8sOuG6CbjO06VOyD60coI=; b=hJ8KDxc8S8Jc52qejdlX4pf2e5
 5vnfW1hxe3D66aHON+wA5LYKQ+hFLMQVR3q20S8whGbL0OLXXAL64ZPo1acwY+J6Cfpp8zkDzUwzy
 2XJINAlifvlR40PJli9EJFh1uUtUkfBj15CTgF1zdc3JTPHTRIWDT1Tm/rnX1zoXyDer3GHpfh75e
 Y5B8bHtJKCHcNqUBUJHuRvCF2hD9ZwINwi4S5QQ54KN9ikEOJXlH/Rpk4jywYjaqBt3dkFezPuA5T
 Gartv1HCH2c/I2BQoP/DcK3ON71nQ3h2V2ScPCUklKwsIJdtwxcqzlxyBQDPyctBMS72Gt2FSH5Ys
 5le0g//g==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH4jT-00H9S7-1H
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 13:06:36 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E185F2223E;
 Tue,  2 Mar 2021 14:06:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614690394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTtVJwCrMEqy04BVWxGgfe8sOuG6CbjO06VOyD60coI=;
 b=N1jbqwuLG9dlRICo7gv/InhS3T3Z95hbPGXGxPecFPDxLjOzwAI+8oh76X1nIWpyGQ2wmh
 OjSHejnJe9fVnQlH2KmDVlcC0agYzilguPEGV3Cdql6nJfCD+mnu+UXiMaR8uX6lTzbNV1
 ihERZ3CaUUAkTDmpjPY6Im1R8EIIm9o=
MIME-Version: 1.0
Date: Tue, 02 Mar 2021 14:06:33 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor.Ambarus@microchip.com
Subject: Re: [RFC PATCH] mtd: add OTP (one-time-programmable) erase ioctl
In-Reply-To: <20210302134617.5aa78cc4@xps13>
References: <20210302110927.6520-1-michael@walle.cc>
 <20210302134617.5aa78cc4@xps13>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <05c255e6d9d8d12e8e6af59d9c153981@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_130636_900550_D52F4DFD 
X-CRM114-Status: GOOD (  15.50  )
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

Hi,

Am 2021-03-02 13:46, schrieb Miquel Raynal:
> Michael Walle <michael@walle.cc> wrote on Tue,  2 Mar 2021 12:09:27
> +0100:
> 
>> This may sound like a contradiction but some SPI-NOR flashes really
>> support erasing their OTP region until it is finally locked. Having 
>> the
>> possibility to erase an OTP region might come in handy during
>> development.
>> 
>> The ioctl argument follows the OTPLOCK style.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>> OTP support for SPI-NOR flashes may be merged soon:
>> https://lore.kernel.org/linux-mtd/20210216162807.13509-1-michael@walle.cc/
>> 
>> Tudor suggested to add support for the OTP erase operation most 
>> SPI-NOR
>> flashes have:
>> https://lore.kernel.org/linux-mtd/d4f74b1b-fa1b-97ec-858c-d807fe1f9e57@microchip.com/
>> 
>> Therefore, this is an RFC to get some feedback on the MTD side, once 
>> this
>> is finished, I can post a patch for mtd-utils. Then we'll have a 
>> foundation
>> to add the support to SPI-NOR.
>> 

[..]

>> +int mtd_erase_user_prot_reg(struct mtd_info *mtd, loff_t from, size_t 
>> len)
>> +{
>> +	struct mtd_info *master = mtd_get_master(mtd);
>> +
>> +	if (!master->_erase_user_prot_reg)
>> +		return -EOPNOTSUPP;
>> +	if (!len)
>> +		return 0;
> 
> Should we add a sanity check enforcing that we don't try to access
> beyond the end of the OTP area?

This is checked in the op itself, as it is done for all the
other OTP read/write/lock ops.

Right at the moment, I don't see how this could be achieved in
an elegant way. Without additional changes, you'd have to call
mtd_get_user_prot_info() and iterate over the returned values
and figure out whether from and len are valid.

[..]

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
