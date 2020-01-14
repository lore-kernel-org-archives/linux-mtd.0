Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32EAC33CA9
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4502214AF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 00:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0uEC8Dv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4502214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJJMq7tEdX5H3nc1UfSDVn2bRIWo7CnR7gUq/3vVpLs=; b=k0uEC8Dv/cCszH
	VQ3OjI/lf9Q7LL9+YU6TcmRotPdfxeCfpstze1tEnSDl+0uoJsC5FRREN/8RQIPO47r0C/eZq8ThN
	ZJLtP+XuiKVyZEEdkRBmkZ2B0bcQ9MwiVRwWuUQ2x3Ws1zGLYxwt8lQ0vVMfhHJLlV0astXR0NRr/
	MfnT+6pImP4i4b2b2c3wUPbYHxG/pTjsIvYVJ7/u/KBFPc6/T0gwhgDeD2+9GZzdH8PMT2Ca3U1VC
	Py6NXvdSSCnODCW3E0wmRvtdZFvDtk8nPmVMjVcJDboOZXZ9w8uBvWQ/ku27H56xMrzkU0ZWRWxBf
	Ucr4yexlwTM1+buJiOMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir9wf-0002q0-Sh; Tue, 14 Jan 2020 00:20:33 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir9wd-0002p2-Ci
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 00:20:32 +0000
Received: by mail-ot1-f65.google.com with SMTP id 77so10853274oty.6
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 16:20:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E6IJAm/G2BZsEtWssBpYlld99L9pgrhy2OUvTYO1Gu4=;
 b=RTTPmdoCKPzp/428LSDt0/r/bwoE21O6erjswnNbEvR9947nmrNefbM0PxdapKzx0w
 /uiLM7kKLctVidysh4LekgMcpzWvxQ+S45XjwSTDfdvSYj8roiH2wJnwohdxOTdsrnMV
 Y1tcQOErFrkhf419b0Ru4ZDn8nUMaN3QrxKPGBT3kueym2IVF5wwiPh4Ru+OtU4gGHp5
 phFxHUInLb+VkkCT+Ha/nAVjI6pCZP9i1rZpke6RWo2EWpPTwC5jKgywrO79/xwtefdM
 qSF5QkbH+hNvTBqYYPMffXdqVw5sDechTAL4BkZk7ypqx2NTniQdrD72gF7zXhan40cL
 PMng==
X-Gm-Message-State: APjAAAVC7q/MPa71bj66qixs+HyW13IYShBmsCs9MZo+zeBOtQSNLUlj
 fII49wdVQYnRwTp90SmhlibrfVPCzA==
X-Google-Smtp-Source: APXvYqy/IeqKjrIkw9rTcH9cC+53Udg0S+CeeKT7LkdT3tSWCHehLnzuGUbl/Z+Mq7cleOh3KKB4eg==
X-Received: by 2002:a9d:774e:: with SMTP id t14mr14608009otl.358.1578961230556; 
 Mon, 13 Jan 2020 16:20:30 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w27sm4736852oti.65.2020.01.13.16.20.29
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 16:20:30 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 22198d
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 18:16:27 -0600
Date: Mon, 13 Jan 2020 18:16:27 -0600
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 06/17] dt-bindings: at91-sama5d2_adc: add
 microchip,sam9x60-adc
Message-ID: <20200114001627.GA10411@bogus>
References: <1578673089-3484-1-git-send-email-claudiu.beznea@microchip.com>
 <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1578673089-3484-7-git-send-email-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_162031_431303_A2E42B4F 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, vigneshr@ti.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, pmeerw@pmeerw.net, miquel.raynal@bootlin.com,
 lee.jones@linaro.org, linux-rtc@vger.kernel.org, lars@metafoo.de,
 richard@nod.at, ludovic.desroches@microchip.com, wg@grandegger.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 tudor.ambarus@microchip.com, radu_nicolae.pirea@upb.ro,
 linux-can@vger.kernel.org, robh+dt@kernel.org, mkl@pengutronix.de,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it,
 richard.genoud@gmail.com, nicolas.ferre@microchip.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, knaack.h@gmx.de,
 dmaengine@vger.kernel.org, eugen.hristev@microchip.com,
 Claudiu Beznea <claudiu.beznea@microchip.com>, jic23@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jan 2020 18:17:58 +0200, Claudiu Beznea wrote:
> Add microchip,sam9x60-adc to DT bindings documentation.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/at91-sama5d2_adc.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
