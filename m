Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52060C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DC961371
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 22:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16DC961371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7s2AXuKaMzb4O+IF3/Cjw/JBE287va/cgRKyNbwjmsE=; b=QvgQ9BoJ2m5dbz8aKxNjDhpqqj
	y0C575MKRyYmWh4C6F4VCvxFgHbDJrdQshOXkPLOcnkhsZdTuqRhqa+JAdrEVLcKt4RGYGQg4omRs
	zMt3H2ShR+7Db3qHPo5XUOD0z16Ar3B+3mrz/fU4G6BZfQxZIfkJMPfL6rVXsJxfA0o2RfpH6ryR+
	jtSnz80FhCRwtCVRdl/FGFuokUisW4ikbq1HUzxTDPFyP+68ol8bsV4z8AxRdfGfAUmw9ahzAb0uy
	uReVqgADW5I3nD7M0hneJud/nvHXU7zzUgat588HQB5EQdp3Z+UOYOg70tAwblmUm8wdfhzKaKkro
	p/wltUdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIIUn-000rSm-Ab; Mon, 23 Aug 2021 22:32:45 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIIUX-000rRC-9m; Mon, 23 Aug 2021 22:32:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3893E22205;
 Tue, 24 Aug 2021 00:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1629757947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zuS5gIpSBppo+ccLJAq/E8EQAxAJLw08zOrGMRgzPKM=;
 b=gWK6ZoRM7JQ7oA/wntJqEsUF4xElCMLNdGqXj7ASB8t/lylp6fmqKUv3ZciPAa+OjDO7Vm
 q34FFATTRv7dT19ot+T5brIQBKZt77ZRt5ag0WS0UYLL/3ObEDUs8pm+UxDtSuvm1b/2AW
 Z0S4tKxDsokHU3hAecjGkfui3AH2SWI=
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 00:32:27 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v2 02/35] mtd: spi-nor: core: Report correct name in case
 of ID collisions
In-Reply-To: <20210804082345.ztciqvdeljvyx5by@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-3-tudor.ambarus@microchip.com>
 <20210804082345.ztciqvdeljvyx5by@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <2bf49b90095c96316fe4cec584ce0a0a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_153229_548852_709C0702 
X-CRM114-Status: GOOD (  11.29  )
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

Am 2021-08-04 10:23, schrieb Pratyush Yadav:
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> Provide a way to report the correct flash name in case of ID 
>> collisions.
>> There will be a single flash_info entry when flash IDs collide, and 
>> the
>> differentiation between the flash types will be made at runtime
>> if possible.
> 
> I have the same comments as last time around. I am not convinced that
> this approach is better than having multiple entries, one for each
> colliding flash. I wonder how you will handle different fixups for the
> colliding flashes for example, since nor->info is const.

I thought of multple entries in xx_parts[], too. But how would you 
choose
between those? The flash id is the same, only the name would be 
different.
Searching by name seems cumbersome. Also, the fixup of the first match
will change the pointer (or maybe an additional pointer, so we still
have the original match), and thus also changes the pointer to the fixup
itself.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
