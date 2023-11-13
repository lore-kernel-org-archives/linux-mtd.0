Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E098AC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/fV3r8Icyn9HeSewHICnZAKlA6E530lwfxCl1Fx/0Q=; b=jlCMkcAvDJbx+YkDf92+rGKyLX
	3FHbWJZ2XU92IeirYga0qYricLdLqiU3AUcBNngn83WKCxue2Vts3sP36+viKd6SvSzVjqBIGW8H+
	wM8MXz03852lgMQj751P3+5lS4hRTWxBIUlArJtg+D6cFY0Rg43DpOAJDQ30Yx0a3NZuIVNTBQX5R
	gmPSQ/V8JjZnITnfNOaGIetzIZnLKlqvW1jGtcWTcotwU5zPwQneyxeqqiM6mgKjDuspDJikdOqln
	OfcQBDtJO1qp1mMG63iZX/6wU3LrTmRrMzmA/8kmYSO5N7u03jGnUskrpW8Io6L3CScjeaTB4ZGyy
	XprYGtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YE8-00EB18-2d;
	Mon, 13 Nov 2023 14:47:48 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YE5-00EB09-1m
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 14:47:46 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1CD08A4D;
	Mon, 13 Nov 2023 15:47:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699886861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmhwlB5vQ8e49oOV+d3Bk02ta3chZh7tmTvgbMcd6qQ=;
	b=a8D6HYdDVj3OEfupuS24Mmo9fY7lfHsWhSL7xabbh97kJZsNz6ZYbhZfMrw5PMnmeh3DdO
	SNJb9FcJsbEpl7+2tLHMZWsf4lMTL5X5YSYFATT1+RkK5iZPlM45S1hJPGeaeq4GmynkBv
	BAXqY/boq3fhjIU8NJu1uhcNC0dYMFgTjpMDNE5RBg2Ro/Kqdxr0losj/Y8y4jTRWRd619
	Zci5hOKLetVB2l1FYm7SBENo+yjZa14EJeSZpFBw/QZi/7SYt0ezv88yxBK5BaoPCbR1w7
	cyd/64g8SBSKozkPSC80Eva9P9ZFG/iVHJSTF9ClQdKHSxODLDtpsl4YcIXfvw==
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 15:47:40 +0100
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
In-Reply-To: <4c6674a6717152fc1a244d123a2db896@walle.cc>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
 <TYCPR01MB1126990A40D40D8786CABFAAA86ACA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <4c6674a6717152fc1a244d123a2db896@walle.cc>
Message-ID: <e8ed909b39b5a7de46a07d2b57c0393a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_064745_767053_4198B3F9 
X-CRM114-Status: GOOD (  10.35  )
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

> Maybe
> it will already drive IO3 high by default?! (and esp. what the bootROM 
> is doing
> if that SoC is able to load the first stage bootloader from NOR).

I just had another look at your Renesas SoC and indeed, the register 
default is
to set IO3 high if not used. Mh. I still think 3,3,3,3 is the saner 
default.
But I might be wrong. Hard to tell, as the sample size is just Micron 
and Atmel
for now. And it's still unclear to me why the Atmel isn't working with 
3,3,3,1.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
