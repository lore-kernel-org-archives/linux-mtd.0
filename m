Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2C0C11F64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 10:03:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1760561260
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 10:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1760561260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLmgpyr3574QRP3F1t4QzRgzlYOyv40QZTvIkTYLBl8=; b=oKGrRO5YStwCQct7rGbfGgVJ27
	u6tD3KX5SNpLbsTWM1NdYUsleV5058OFZWPy7NWN7T+Qy/4tr/OYmIMLl5lCBEKAG01apU+94a6Do
	q5DaJfDPnfR4+d4k3+43OpmEnnGqgtHzuYIGuzUisi+QpFpjrfoK9TZhnM4eHkAhBE2AjAigeqVjd
	p9LKm6h9gIOGLDtSJIkHPE9O8Jx3sdY2xFzuCjXIKWfseJp6kfSooUQCGBgJV5jhSR62XIK6UeaQi
	TvD8fvp+QeEffmd9ftxF3D1WomjbjN/bhzVFhuS9JpngFiTWSXk0cMDKUy4kkHv+h/2FirH3w2IzA
	1dCJMj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lytX0-00GsD4-To; Thu, 01 Jul 2021 10:02:50 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lytWx-00GsBp-NG
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 10:02:49 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A15C42224E;
 Thu,  1 Jul 2021 12:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625133763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7fswWsAdWP8NO1tagWuHhgH26LxBv6WQkfSB6mnL3W0=;
 b=HkZixNnZCm6DHD3JEs/RExo3oEr7zRrqkoS3wbZW8DfG4z57UIQ+4eFWgnSYmg/yCs/4G1
 P+d0nuYFTvUpk8rQWQViMXPEQtwgw79yBuR5Uj6rovbkTKX7A5KNNEFEQ9W4sgl12/D7Wg
 AJYWwzMo8bNOzNMl5kQleKUTzXA7Apc=
MIME-Version: 1.0
Date: Thu, 01 Jul 2021 12:02:42 +0200
From: Michael Walle <michael@walle.cc>
To: Hongwei Zhang <hongweiz@ami.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
In-Reply-To: <20210630182059.29699-1-hongweiz@ami.com>
References: <20210629150846.21547-1-hongweiz@ami.com>
 <20210630182059.29699-1-hongweiz@ami.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <ea2db205a600f66ed3ec7224723a3e82@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_030247_960401_1B6D363B 
X-CRM114-Status: GOOD (  13.05  )
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

Hi Hongwei,

Am 2021-06-30 20:20, schrieb Hongwei Zhang:
>> Am 2021-06-29 17:08, schrieb Hongwei Zhang:
>>> Add some Micron M45PEx flash memeories into the IDs table.
>> 
>> Did you test all these flashes?
>> 
> No, the patch was added in porting drivers related to AST2600 EVB.

Please note, that all flashes which are added must be tested.

>>> Fixes: dd1e9367157f900616f (ARM: dts: everest: Add phase corrections
>>> for
>>> eMMC)
>> 
>> Bogus Fixes tag. First, I cannot find this commit id, which tree is
>> that? Secondly, adding new flash ids don't fix anything, esp not
>> something related to eMMC.
>> 
> Sorry for the confusion, I thought Fixes tag could be also used for 
> referencing
> the revision base for the patch to aplly on.
> I used dev-5.10 branch from https://github.com/openbmc/linux.git , 
> should I
> use a different repository?

AFAIK commits in fixes tags must be relative to Linus Torvalds' tree
(or a subtree must not rebase, like the networking trees, which means
they will end up in Torvalds' tree).

Anyway, this is not a fix and therefore there must be no Fixes: tag.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
