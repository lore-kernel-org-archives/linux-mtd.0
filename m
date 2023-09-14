Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B54EDE9A8
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Sep 2023 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4JdKWG+HmvWoSRJ6PV+XKwTNkhQwCSYsEfnQ7mqR6I=; b=lZEsEnJ3A8PMexwBinQBiPsoId
	QWo+jSbAJmdOcRxM/dyijfwq7Ro1gcSc7X3Q2lC3mdp2CfPj0a/0zswFA5CBzAREXmrjn/+s3Z+ll
	Ys03EBWo8D3AraaBmeB9El83ZFPBXfbG8f0K7Z7yxvtVCWGzkx4HLIADLTzL28rkp0M+QGMjeQUcp
	uVvlFAY3Z2cTQ6E6BZGBCwCDvjgXaBiOvjHuiwU3dvmTBTXqjWL+99Xo2TVE2npnz7tHWsKW7J16T
	g/5kmswPh8u7g9ssDEMJVRuiZnmpniuAIDqIizthoq6f2sIxGFrO5aaoFc6H437vh5D70iDA4/XlX
	I5X+gD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkVJ-008Em9-21;
	Thu, 14 Sep 2023 11:27:25 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgkVH-008EiO-1X
	for linux-mtd@lists.infradead.org;
	Thu, 14 Sep 2023 11:27:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5ADBCA06;
	Thu, 14 Sep 2023 13:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1694690833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwUtK0YqmeM4OoxgSY/5NQIv3Bs9GND70zEJZLkjSUY=;
	b=aw/UHpm63t01H3Lctv9vKQJvRaY1dqg1TEt9fscY6tXnMX5z7kCpR6M2ixPKJFltb78f5j
	Dyjmbxu50gopGOxKXbomX1jyz4gA0TlQcla7j4zNDstWeNr1LxDrq54Q0Xxd7ZXo+EjUEO
	zGxDfKSXoBi4CCKiO39C8QfY2lg3DRyVk/Hcg1CXLNjL6wPabTZNbFK6dGMK9Yxi/M5kIy
	uuEVoGjctCo5Tc2CFy3olgza17TglfDuLbXdbR0PsvGs9E7GhOOnXbrVmoAQOAjjJMEpJx
	RRDqnuF+jad5cnCxU8XDV8JtBCEA0DxwLyM2Ldv6p44W6BjpIaJv4aJTmwjpVA==
MIME-Version: 1.0
Date: Thu, 14 Sep 2023 13:27:13 +0200
From: Michael Walle <michael@walle.cc>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>, linux-spi
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] memory: renesas-rpc-if: Fix IO state based on flash type
In-Reply-To: <CAMuHMdUA23VxkK-8CebyqiF=Oe81QZgpEmWmMrMGVd_+BXfsLA@mail.gmail.com>
References: <20230830145835.296690-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV1qvypo1XmHBXV5Q1SHEhksMN3SxgweYxPu+=ZeDmg1A@mail.gmail.com>
 <TYCPR01MB5933571F06789BFF27A8FCC786E6A@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <502336e9-2455-f3f6-57d1-807bc4b71f7f@linaro.org>
 <CAMuHMdWO8EdbxXetmc9-2jhZWeX1b_J74O0exo1Q85X9Gbc_SA@mail.gmail.com>
 <20230914105937.4af00bf2@xps-13>
 <CAMuHMdX8Vg2M2K3U_sbAtVk+6VDvL+GNYtbs5FTTRZzRvVGPCQ@mail.gmail.com>
 <20230914111200.6e6832ca@xps-13>
 <CAMuHMdVryt5bTk8HeFMS3NU-4EpQdU3Tf6LiGmGQQ5bVD-Emsg@mail.gmail.com>
 <OS0PR01MB5922B4BF11D1954DFBE2976F86F7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdUA23VxkK-8CebyqiF=Oe81QZgpEmWmMrMGVd_+BXfsLA@mail.gmail.com>
Message-ID: <737c6865703b8e294601d86a911691da@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_042723_752453_4AFB1CF5 
X-CRM114-Status: GOOD (  13.52  )
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

>> > I'm not sure we can do that, as this code is part of the hardware
>> > initialization during probing.
>> > Biju: is this needed that early, or can it be done later, after the
>> > connected device has been identified?
>> 
>> I need to check that.
>> 
>> You mean patch drivers/spi/spi-rpc-if.c
>> to identify the flash type from sfdp info and pass as a parameter to 
>> rpcif_hw_init??
> 
> Something like that.
> 
> That configuration should be saved somewhere, as rpcif_hw_init() is
> also called from rpcif_resume(), and when recovering from an error
> in rpcif_manual_xfer().

I'm not sure I follow everything here, but apparently you want to
set the mode of the I/O pins of the controller, right? Shouldn't
that depend on the spi-mem mode, i.e. the buswidth? Certainly
not on the type of flash which is connected to the spi controller.
What about dual mode?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
