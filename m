Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C07C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 11:22:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D85560F6F
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 11:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D85560F6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4/rTAP0hnJZmS1+7FAgBdQKLj/LfCmjaX1+p4WbMP0c=; b=324scAR9kQuNbkSueJilSM/toZ
	yaYIM9oXcoo52xHMtrZH4wsz/KoJt6FHx9mhwmijvbF0mwptzO6r2GhiZftJJZL7unwkDaUTsJ34P
	gjHOywBTKkPYBdim+STXVL6qXBu83Cg4ECPWF8lb0PJHo07g/VoT/kV/+czVc0mXmTzJ3N38qjRFM
	u3sQmJ0rWPsBfP/rBZgECCIvQOZKnWgovyXTdegnENJo1QdJUu2pmpVb3pkcfgOKfh6l6DCSXnXxW
	qTzM1xm115wGwEJ5qyy6k/qlHd5bOBnTycxDysW/QnLuwUTuE2gqmaXcOiomC1D7Nb3/ieXL9HLZs
	bWWY30Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdsc8-00Acxu-CQ; Fri, 22 Oct 2021 11:21:32 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdsbu-00AcvL-PA; Fri, 22 Oct 2021 11:21:20 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5F412221E1;
 Fri, 22 Oct 2021 13:21:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634901673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4s8H0MXGNYuGQYuaL3bTcnH09R0AIz3dSDL2gHFiCoo=;
 b=XqcskfDZkcjN7alq5KJtnQSo0uDAts40Mhf2KBjfmE5y8UH9v/Qw6HRGWeGaViF+3GIXGt
 u06mU06/0KyT9cGje5SopZ4eJkGMp/0h+/eAcYLoI19uBxVKJRFEOsOBMp92Jwk4BUSlqh
 c5UYBUYHPkldmKtxfTRlEjsT4ejDMZo=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 13:21:11 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 17/35] mtd: spi-nor: Introduce
 spi_nor_nonsfdp_flags_init()
In-Reply-To: <20210817102429.kmhuef5hxumllxjj@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-18-tudor.ambarus@microchip.com>
 <20210817102429.kmhuef5hxumllxjj@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4af8b3edebbe398dff1f8ef0bb98f2bc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_042119_237648_2AD3F90B 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com,
 Tudor Ambarus <tudor.ambarus@microchip.com>, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-08-17 12:24, schrieb Pratyush Yadav:
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> Used to initialize the NOR flags for settings that are not defined
>> in the JESD216 SFDP standard, thus can not be retrieved when parsing
>> SFDP. No functional change.
> 
> I am worried if the order in which these flags are set can cause some
> subtle bugs.
> 
> I can see one instance of it with SNOR_F_HAS_LOCK.
> spi_nor_late_init_params() checks for SNOR_F_HAS_LOCK and if there are
> no locking ops specified, it sets the default locking ops. This works
> fine before this patch because the flag is set before the function is
> called. But now, the flag will be set _after_ the function is called,
> and so you will never be able to set the default flags.

Maybe we should just forbid to look at the SNOR_F_ flags in these
functions. Instead the information could also be deduced by looking at
the SPI_NOR_ flags.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
