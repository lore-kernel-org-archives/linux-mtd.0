Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BA7C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 21:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EFD6103E
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 21:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1EFD6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLsjke9EhO5dC4UFbjwJcpL9thV0mCQOpClJOoOagPY=; b=gJyezF4Yptwf4tTO6Ll4kk9mXX
	VNrFErdTT30PEvUOimXJYM7dVS986aqvXrGr5OPcLQ0DCG3XrutWL/nYBj8MZhW+8dl7+zuXBn94t
	6lE+If8KkpSjnFEVJt82JMg504ffdPACF8cRw9+Kur45x5YPe0g3UXDmw5/AaabNjJbStOYeq0V3g
	stxQfWsDl4C8Jw+UL+0KZzUa+HZ0/C86Okt/3a9BNB+rQ+UoerE9WA184YRj+VMnDizzHe7Z3RNin
	b+yycjWVvfRlqZxngt6/0pwNqnYbl/nvpn1U1vb5RQl/ZVblYlLBa4JpanI9KBfzQaFAe4GQi065T
	eGALSsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mORwY-00Az6j-Kc; Thu, 09 Sep 2021 21:50:50 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mORwJ-00Az52-U0; Thu, 09 Sep 2021 21:50:38 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 05FE622236;
 Thu,  9 Sep 2021 23:50:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631224234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKzduOIDtFT3hD2U9IZsNTaGBBR6PbBpvC0FXweeQ54=;
 b=Iq/3Fqy9MvlrelLHzuS3OSRualKaPNYpTw29kD8EsHgf8Od7dE14M4o9E50QkGBer2Ir6s
 Omx+svu1GLhj7vFFHBfCqsUnjRSy53Kz0Pct1UnbfMw1w+xbLJLaV1AAsehqnvG2stIOHR
 SQdqihhP5AHd0ax/V+J04eF3uUaaQQE=
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 23:50:33 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, macromorgan@hotmail.com,
 vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 11/35] mtd: spi-nor: winbond: Use manufacturer
 late_init() for OTP ops
In-Reply-To: <20210816191744.k6ufbgrrwh6whhnc@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-12-tudor.ambarus@microchip.com>
 <20210816191744.k6ufbgrrwh6whhnc@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a8e4b2d96b13c862e242e8009c7c6861@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_145036_181584_620E09C3 
X-CRM114-Status: GOOD (  13.39  )
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

Am 2021-08-16 21:17, schrieb Pratyush Yadav:
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> OTP info is not yet discoverable via SFDP, use late_init() to init
>> the OTP ops.
> 
> What do you mean by the "yet"? Does it mean that OTP info is planned to
> be added to the next SFDP version? Or does it mean that it is possible
> to discover it via SFDP but we just don't support it yet?

I've seen a bit (again in the XTX SFDP) which indicates it supports
OTP. But thats all. It doesn't mention _how_ you can actually use it.
And there are at least two different variants.

-michael

> If it is neither and it just means "SFDP does not mention OTP at all",
> like it is for locking, then you should just drop the "yet". I know 
> this
> is very nitpicky but it just caught my eye.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
