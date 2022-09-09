Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3383ECAAA1
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Sep 2022 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyKG6zi0IJ6W6zhyDMZcbACEOARciuCIhdvCyDborCQ=; b=171+5zYg+8bwTP0xd3JJKFW5KS
	Y2eHSUhbo7cFn368kStjhy8dvGrsI4rAO9FauBUQE1qALszW4PvW6zhDLx7ijxKZ6No4trgmjWK2G
	zlx9GTJGOUyjIo/3qYEPMET6MbWVlmndtxs3WRknMwzeHNKkWdk7kzfiUbVuZ1nQnXULUlA243xIQ
	RH+UoKv9oDhy6uEDjk7GfSo2IWe15cSTe3B+HFiM8SkPtq6pk0vu3nS7cWZseV0AA58AjZMaWd8de
	pzrNG3pK3EenzfeRsd1Ru91JHvkRkWM+E+N97eSsZrVDw03Ji5AVOOh4gU9UKbgEKfwAikIeMK3Wq
	4soMYLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaUc-00F6eY-26; Fri, 09 Sep 2022 09:40:10 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWaUP-00F6Rl-2u; Fri, 09 Sep 2022 09:39:58 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id BD96250F;
	Fri,  9 Sep 2022 11:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662716393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqFN//VBocQgx8w36Vgv1hz8sEP4vR/KyV4y2WX9JXI=;
	b=EgOGzGExA/SfqzDbSRML5C4thBISliNXbbDwwFf0EXuGTp4Glgq2aV+xrsmZ+Nv15BXzAX
	creOFiX4ThmrFiBfehobUSN75plXpV7TV8gN7SCcm4pkHlmIHI37YNTFN9SxGAS3moL42e
	ytba57y776C5zhreU+0fnA0jscnY5tSYEsrK7xEWQ8MMG4soO8XUDkr7cV0bmTkl+JLC2y
	mQeRISmWTB+PQxHZJPt0b1GpcP2xnmv7RnrM3Kj/kV4cDsLc/ZutGcV5A25XmYx1i27+Gl
	fLGNExbUki7cqdlPKypd4LXZf3Lvxu6GhN4TE9F+GDax3ROTyNIpV36kcuooSw==
MIME-Version: 1.0
Date: Fri, 09 Sep 2022 11:39:53 +0200
From: Michael Walle <michael@walle.cc>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Li
 Yang <leoyang.li@nxp.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Frank Rowand <frowand.list@gmail.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ahmad
 Fatoum <a.fatoum@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 13/20] nvmem: core: drop priv pointer in post process
 callback
In-Reply-To: <ccb50ec6-a0e9-e700-bd1e-220909fcc788@linaro.org>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-14-michael@walle.cc>
 <373b10aa-f5c8-28b3-88b0-f87a1a40b000@linaro.org>
 <42bc3f6796cc75baafc15c6d2c71ec92@walle.cc>
 <ccb50ec6-a0e9-e700-bd1e-220909fcc788@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d349e020cc68af7197bbb679bfa69eb2@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_023957_317145_C2F95BE8 
X-CRM114-Status: GOOD (  16.92  )
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

Am 2022-09-09 11:08, schrieb Srinivas Kandagatla:
> On 09/09/2022 09:58, Michael Walle wrote:
>> Am 2022-09-09 10:52, schrieb Srinivas Kandagatla:
>>> On 01/09/2022 23:18, Michael Walle wrote:
>>>> It doesn't make any more sense to have a opaque pointer set up by 
>>>> the
>>>> nvmem device. Usually, the layout isn't associated with a particular
>>>> nvmem device.
>>>> 
>>> This is really not a good idea to remove the context pointer, as this
>>> is the only way for callback to get context which it can make use of.
>> 
>> In which case? As I mentioned it's the priv to the nvmem driver and 
>> all
>> the "normal" callbacks can do very little with it. If there will be a
>> future need, then there should be a proper opaque pointer associated
>> with the layout and not the nvmem driver.
> 
> Yes, the opaque object here is the layout priv which I agree with, but
> removing the context totally from the callback is not a good idea.
> 
> We should have some context to callbacks to be able to allow them to
> deal with some private info.

I agree, but my thinking was this: as the old priv pointer doesn't
make any sense and no one is using it at the moment for now, we can
remove it it. If it's needed again it can easily added together with
a user.

That being said, I could leave the pointer argument and just pass NULL,
so if someone (re)adds that, we don't have to modify all the callbacks.
Because we don't have any user for now, I could only speculate who 
should
or could set that pointer.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
