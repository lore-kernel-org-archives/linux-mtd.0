Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F243BE71092
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Sep 2023 16:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS0pUUeu4jE7JAF0RjhpsvvvfjHz5LNcqQXODe3i37w=; b=Mpl3lcB4dAdnpH/VvN1HlYyJec
	+ifMjvnQEgOFuG8FWPI0t4xO0tb7PqFZPWqfM6xFHoTHUocQLpropOVy6TOg2gpOPvMZRYLLl9M0C
	Zf4EDsJ36cBNCP7yw6BBK4qUQO2CpL7HIEyWF8gc11yFmHsXdikWY/CFrbw640CCA+vNeUJdTzRSJ
	uytwFsdjNh6Renqe3djdTotbd2iJWiRWnyAIhI/ms8zKFGdkIi9EyWlYpvelRI5zhUQkI8UimPhws
	MsA8QNExTCefhIiCDyH16GjYQ6JURt0tApaVAoLpiv648fTATiDpTxgFw9SoUlNB9O+SMTMN0xOWZ
	HUsGx6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjM7j-006SrJ-09;
	Thu, 21 Sep 2023 16:01:51 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjM7f-006Sq0-3D
	for linux-mtd@lists.infradead.org;
	Thu, 21 Sep 2023 16:01:49 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D1E68EB7;
	Thu, 21 Sep 2023 18:01:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1695312101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x+jXaho0ZIi9BmaRxov9GWSa018Ii/NEh3JmcH5ERxw=;
	b=qVyNtZ5S6BtOrh3RjVNbJiLuOOkn+zfCRAkBZlicq2gMlcAB0BFZZS5+HRIUy8ERhSunHl
	yq+Q8qXwUYyE+gU5vWBjpDItpp14+6Kw2u7OKKeHd1b4QY9VA2cLr/ftGySxI376w0C0JS
	GO57lYZJjfW45ZgV0QrADEcowxA2r8DV9bKICzSM/vr6mVWSkadgnqWDR0VGFZXEVVlyqp
	1qBgcZTEmUrd4Dziqxd7QBj9PI3Ms9xa60BvH40HLlVh/TJEgLjF9nIYZOiWf71kXmDQpK
	iLv79GMv0NUL9Q2zIMyMO4ZGPGd52Fxa1qqNJjV+Lr5c5/cRg9iETzGyQMT/1A==
MIME-Version: 1.0
Date: Thu, 21 Sep 2023 18:01:41 +0200
From: Michael Walle <michael@walle.cc>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for
 more MT25QU parts
In-Reply-To: <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
References: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
 <1503a3857107e3a4f34e0c7fb5dada39@walle.cc>
 <CAMuHMdXN+HJb=zGeG=3t=Pie9cVpnBLYuEb_qX6=oSxG8eTkAw@mail.gmail.com>
 <20221205163306.GB2012644-robh@kernel.org>
 <CAMuHMdUcrh26MNYuiqiC0_FMkeHtq1YnJrZKHEV_WQm5Dgzoaw@mail.gmail.com>
 <ee03d150-51cf-4e12-ae2c-9475a192fb6c@linaro.org>
 <CAMuHMdW_-0f8DOmEzYb28XABqU3oFL4KXf9M-qKVyyrE_Lo+jQ@mail.gmail.com>
Message-ID: <d4d998cff934328f58cec767f93a59b5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_090148_228708_B3C08700 
X-CRM114-Status: GOOD (  11.60  )
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

Hi Geert,

>> We won't break compatibility with older DTBs if we use a list of
>> compatibles. First the vendor specific one which will use some quirks,
>> and if that's not available, have as second the generic jedec,spi-nor 
>> to
>> fallback to.
> 
> Sure, you should use a list.
> 
> But the current recommended practice is to not have a list,
> but just "jedec,spi-nor" (using a list with a new FLASH part name
> causes checkpatch and dtbs_check warnings). Hence if you follow that
> recommendation, you will run into compatibility issues with older DTBs
> when you discover the quirk later, and decide to add it to the list.

The SPI NOR flashes should be auto discoverable. Why do you need a
compatible string? Quirks can be added to the flash_info database.

Also note, that one reason *not* to add a particular flash compatible
is that they are usually interchangeable and OEMs do so. So a where
today a board might have a macronix flash, tomorrow that board might
have a gigadevice one for example.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
