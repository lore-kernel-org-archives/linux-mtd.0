Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9FBC38145
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Sep 2022 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJivEj+6F+0dmDd062JB7mai7wlkLTK7PeuiLARyhPc=; b=qInnoruybBCMMG6N/zsJX7HUZA
	Z+2t+1DjZqJR2XP5baDWe5H2re7x901OvA9dJPrk8HrhqiKVEq3GV+OItTS8dy7DGewgg+VxpRFx3
	x1W/ZR2lvLmq7aOvpyQnnDBbw9OaZirxvhNduGn40w2pF8cIKI6hrwuNE0r6kEqbAZhc5yqK5N5bI
	YgFiKs/nzC5lcEDvoY8WgERZ6CZSDc3clk7+hg1EyjHS+wXLVfnfQ3HLhP6tWBBDuro7Rx4z7ehES
	gYcurUwoG/R2xwk9pSe+dPMpx9cY5E9RKHaBOGtsvdIqQ6hs8CK27TY+8RZfKArEyrVVO4Llm7aF3
	Xv8iTAxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVuDI-0067K4-23; Wed, 07 Sep 2022 12:31:28 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVuD5-0067ES-78; Wed, 07 Sep 2022 12:31:16 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 102C711C;
	Wed,  7 Sep 2022 14:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662553873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kN857gTumoZn8Gb2kgshbbS+axSnJL0KMWhLpEISQRg=;
	b=eDJBA+01/tWF6T6Z2G/KVG87d5jG/MYtuzd03CFy4WLb3v5gd68EbnYEzede+ddjVz9Y0z
	XpZONl52PTG1qMJPBGIc2YYW3Fi/jGFvcSBG8Ihnweod8lyZXE1S1i2M3Q1au0Fu0Q8YSC
	PaHJV1fcHj2KPZ7gAn+/5Bhw4BUIzYYV62P90Qznf3YXLgYZaMFjojNL1pZtlrREphyjLo
	QrFC30QwEjt8aykM7R2FirMIopICWriYYJea+lsaPlSajzZDyRG163nqNAKCET08oTfXC5
	MO6WN+1i3i5nvaN8yjmjlg+HSCXoDozDdL6e1UmF+IWDmF26uvQNZBiM4TJQXA==
MIME-Version: 1.0
Date: Wed, 07 Sep 2022 14:31:12 +0200
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang
 <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 11/20] nvmem: imx-ocotp: replace global post processing
 with layouts
In-Reply-To: <20220901221857.2600340-12-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-12-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <42a72fc508b8f3896092a2b1d56305b1@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_053115_441550_726BA473 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

Am 2022-09-02 00:18, schrieb Michael Walle:
> In preparation of retiring the global post processing hook change this
> driver to use layouts. The layout will be supplied during registration
> and will be used to add the post processing hook to all added cells.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Complile-time tested only! Please test.

Tested-by: Michael Walle <michael@walle.cc> # on kontron-pitx-imx8m

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
