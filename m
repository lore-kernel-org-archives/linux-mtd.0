Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20F9C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 18:02:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 139DB652AB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 18:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 139DB652AB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=david-bauer.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nOzwNjIcHTYYNGKujEKNSB2stJ1VPiqj1PKYIGKu/e4=; b=EJyqe/FDrvrccJy/Y+ZD0nqBg
	jQ0Ac35mXv7sdytOs8IjoiZJwgevMAUnSYjoKhp4H1joi2W3aT8fdpMlr+RPXpoBX7dBqq9NWRyB5
	7ti/nBfzGK8jRQ0fMz7bxuO5qwtM6IAovtRY4ci2RLQcPFfzKnYevsWp79tgPOTv6HT5IenAns+K3
	tOFvR9aqBB4XXfYQ9q6uG4li5HVg/WIBu+Pu1clfoVV1PXH9BcqkNNGKgMRJ5h1wI1jlY+zv0rLP9
	ng6IWS5Q8jH9sSZgTdeXCpuH3QRcI0nC+lsf0s8oeDqOiEWH6//oPf2PEztxqw/LSoQ2gsZ7GiC9l
	17qoW5O1g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJKCX-001Zml-E5; Mon, 08 Mar 2021 18:01:53 +0000
Received: from mars.blocktrron.ovh ([2001:41d0:401:3000::cbd]
 helo=mail.blocktrron.ovh)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJKCS-001ZkT-EU
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 18:01:50 +0000
Received: from [IPv6:2003:e5:3f05:2d00:77cc:c84:87e:ce4f]
 (p200300e53f052d0077cc0c84087ece4f.dip0.t-ipconnect.de
 [IPv6:2003:e5:3f05:2d00:77cc:c84:87e:ce4f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.blocktrron.ovh (Postfix) with ESMTPSA id 34F4B26B31;
 Mon,  8 Mar 2021 19:01:43 +0100 (CET)
Subject: Re: [PATCH 2/2] mtd: spi-nor: use 4 bit BP for large Macronix flash
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210303094833.139221-2-mail@david-bauer.net>
 <20210308123747.26142-1-michael@walle.cc>
From: David Bauer <mail@david-bauer.net>
Message-ID: <40e3dd20-b4ed-53f0-7dbc-e2a16857dfc1@david-bauer.net>
Date: Mon, 8 Mar 2021 19:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308123747.26142-1-michael@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_180148_625735_585BBAF1 
X-CRM114-Status: GOOD (  22.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Michael,

On 3/8/21 1:37 PM, Michael Walle wrote:
> [This time with the correct message id for the reply. Sorry]
> 
> Hi David,
> 
> Thanks for your patch.
> 
>> Macronix SPI-NOR chips with 128 or more 64k blocks have 4 block
>> protection bits in their status register. Add the corresponding
>> flag in order to clear these bits when unloking the flash.
>>
>> Otherwise, the flash might not be writable depending on the state the
>> bootloader left the flash in.
>>
>> Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection functions")
> 
> Macronix didn't support locking before your patch 1/2, right?
> Therefore, this patch will just adding features.

I've had a second look and i didn't spot SNOR_F_HAS_LOCK can be set per-flash. I was under the
impression to add SNOR_F_HAS_LOCK for the entire vendor in order to use SPI_NOR_HAS_LOCK per-flash.

So 1/2 is not necessary at all.

> 
> Please limit this patch to devices which you are able to test and
> mention in the commit log on what SPI controller it was tested on.

I've checked the datasheet of all flash chips I'm adding the block protection support
for, shall i still limit myself to devices I can test even though the datasheet indicate
support?

Best
David

> 
> -michael
> 
>>
>> Signed-off-by: David Bauer <mail@david-bauer.net>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
