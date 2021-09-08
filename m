Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AE3C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 23:33:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1745A6044F
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 23:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1745A6044F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXNWVxnaqOSaiwLgA+KZd+OG4Z+l1FAoHBBqy7wAS5s=; b=dkC6A9W6qQ9juBRY3zaHWEh2b8
	A1/+4Z6tgeKO7YLTRH1xYdd3GWZnOxM0lky3kKAgPY29GV5g7gvsDftMMl+FGRwPpPkq2pR7xDf92
	lWimTFYsFyaE2/uhaTt8pUp0PzGD/0rjxIGJF7aaYbn9eT9kPKoFJk/SXBNMTo3ajl5QynB/Ueicj
	ODNbGz3UQ69iVi0wi1yvXy7I3yMEd6Ij/HU17b/VhLhtCpmExrygelxcnp48k53FXlo8OaWNRMsiO
	AuKbN6jX1Zsz0Ocv+56//dGBJ27T/pC68iMS3QtmJYTzGpn/dVI09VaXBChK0CDnacz7Kxu0nxT7r
	G+JF3peA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mO73O-007nAL-Ij; Wed, 08 Sep 2021 23:32:30 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mO73L-007n8b-Cf
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 23:32:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3ABA122249;
 Thu,  9 Sep 2021 01:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631143939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ffG/Ol6e/ywr/5eaown3nyY/R52G/3XAcwLdUHesYlk=;
 b=QC70x+C5LxNufMS4bQ92Pjg7dvXPu45Tx0Uqne/XhnHmfB3c6H84+FrqwG9xhrvKdjjAE4
 Z55KhqwFwKmtIpM/2ntiQv7okm6mFObMOWSbYPTCrDZcYlxZ5PAYOJEOjlFFitKfQ/XuSV
 mwYDq7bzakzZac3XwVlFVedUl8JTHqk=
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 01:32:18 +0200
From: Michael Walle <michael@walle.cc>
To: "Barbier, Renaud" <renaud.barbier@abaco.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: S25FL512 vs S25FS512
In-Reply-To: <MN2PR16MB313511219F7BFB2692C4C8B191CD9@MN2PR16MB3135.namprd16.prod.outlook.com>
References: <MN2PR16MB313511219F7BFB2692C4C8B191CD9@MN2PR16MB3135.namprd16.prod.outlook.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a0388e5c6676b9cf4a5decc00a8da6f5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_163227_849391_AF3089A1 
X-CRM114-Status: GOOD (  16.60  )
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

Hi Renaud,

Am 2021-09-01 18:51, schrieb Barbier, Renaud:
> Hello,
> I bought a NXP ls1046ard evaluation board and saw some issues erasing
> the SPI NOR from my boot loader or ICE.
> The boot loader reported the flash as being a S25FL512 which is a
> uniform (256KiB) sector SPI NOR as per manufacturing ID 1 and device
> id 2
> 
> The eval board has in fact a S25FS512 SPI NOR which is by default a
> bottom boot flash. This can be disabled through a configuration
> register in the SPI NOR.

So you're saying the bootloader is wrong by reporting a S25FL512?

> I also see that Linux describes both the S25FL512 and S25FS512 as
> uniform sector flash:
> { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> 			      SPI_NOR_HAS_LOCK | USE_CLSR) },
> 
> { "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256,
> 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR)
> 
> 
> 
> According to Cypress PDF https://www.cypress.com/file/177971/download,
> this SPI NOR S25FL512 is indeed a uniform sector flash but with a
> device ID of 0x19.

You lost me here. According to Table 52. The device id is 02h.

> While the Spansion documentation I found
> (https://datasheetspdf.com/pdf-file/831993/SPANSION/S25FL512S/1 )
> described it with a Device ID of 0x2.

Likewise.

> The S25FS512S has Device ID 0x2 according to Cypress documentation
> https://www.cypress.com/file/216376/download  and is a bottom boot
> flash.

And also for this flash, the device id is 02h. But the family code
at offset 05h is 81h here (instead of 80h for the s25fl512s).

> Is the SPI support for S25FS512 in Linux 5.14 disabling the bottom
> boot feature? I have not found it in the code. Only something related
> to page size.

What is a bottom boot feature? Are you talking about locking?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
