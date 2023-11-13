Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC864C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 15:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90SYeyQ8BEXkLsT4Jy/bzbzeTSVK3LZNJuCJc9CdUaY=; b=YYSo5icRdmHLrPrkrs9JxrLR6X
	ku+v/GTgqWu5mFwAjJmB3EQcQt/c3PXmyXnlKAQSAyB4ppBxKwvls7E4RbGT3EyRFASBHnteetDX6
	Ct+dy9o0sUanHHrVmWNFoiddPUi1XurpOteTvzRcv+0BeM0+rPqdoZtqoxOVj4p22EbttqkpMVuTS
	KFTq8mhBRkKCfwAgzk9T+1ZamXhE0Fw26ZUUXrhogNcMrs/Yh8oO+AAzfBik0nFRU43ptrO3whNfu
	2dWbbAp5HG6egV/QG3SyJGD9nJqJW+fQ+qOrHt8OtI/kBnWvNEN5Zm+l9Vreh22eaq1m7RlE3O1Dp
	qENWr5Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YaT-00ED87-21;
	Mon, 13 Nov 2023 15:10:53 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YaP-00ED5q-0Z
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 15:10:50 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 41711A55;
	Mon, 13 Nov 2023 16:10:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699888244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53QSCJBmrUzUetZ9PQLwNLOxibqvKBRGPoj01mizcWI=;
	b=xTZEDIhnkH67/mfsh3zhJy2ctJMNRIUcr1g9wqJw8GV69hgEJ+g1Oea4T02u5Zu0Jm+OzN
	WgQ3Qlbng2ni/CVphvcYflITLEV77w7QRnbazMPkSHOHtf1FRRuyq5HNkTb+viSW99LpHb
	zQlP/tTeT9q+cUJT2In/j+fZ6JkJRZrVYXHc5CKy75LEbS60lyWbE+mOYxfu/sQGe1OHLb
	RODIt8qEJFuSCcSSSTd6emPVo3BOP4vuGmrF8sWxrWA0d1nIhBhoAwKOPMOYNATSt51Fsa
	ZRgsc7EWOtTvFu1H5Ma0xYYhZ8TU/NG8d+Gr2xB7jhpwk0i1H6P9Xnt9iOVCsA==
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 16:10:44 +0100
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
In-Reply-To: <TYVPR01MB112794AD059F78FEE41FAE03686B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
 <TYCPR01MB11269C639CB7AA480E388360B86AEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB1126988E1A0741B99DB8DE59C86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <3a9184e1e91689757a5b680e699ce02d@walle.cc>
 <TYVPR01MB11279DF8A78E6C15CB0E6209E86B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <c0928bb386aa3d8ad8d1966fa5060efa@walle.cc>
 <TYVPR01MB112794AD059F78FEE41FAE03686B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Message-ID: <b3a322973f8969713a732587c73ca215@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_071049_364911_0F6615F4 
X-CRM114-Status: GOOD (  12.45  )
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

Hi Biju,

>> > After that I will send a patch using IOFV {3,3,3,3} for both micron
>> > and Adesto flash.
>> 
>> Just to be clear, that will just touch the spi controller as a global
>> default, right?
> 
> Yes, it is in SoC specific bus controller 
> driver(driver/memory/renesas-rpc-if.c)
> 
>> That shouldn't go through spi-nor. Otherwise I'd prefer to use fix (2)
>> from my previous mail.
> 
> Agreed. Fix(2) won't work as renesas-rpc-if probe which sets {3,3,3,3} 
> is called before flash detection.
> and that will make flash detection to fail. So we cannot use fixup. The 
> only way (2) to work
> is to like patch[1].

Ohh I see. Makes sense. Can you ask your SoC engineers, why they
choose the IO3 default to high? I'd guess because it's usually
shared with HOLD# or RESET#. But that really begs the question
why the Atmel flash isn't working with that setting. I suspect
some problems during the turn around of the direction of IO3.
You'd really have to probe with an oscilloscope though.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
