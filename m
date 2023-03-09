Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457BDC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 11:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxwl38Mr+I2ZEIr9mUUFO1nf0+KmRD58mH/FJzxUj8M=; b=EpmN8CrH7EjpcOF82DbO0vLSCV
	Fr48xFWeRrisT6CfVjATz1yUohmT8DncxsjystOmFlg93dtw0GbuwQvyH7jIzrkm0MZuVCPWvTAGp
	PJL3RKndGnrEgskz6qsfYDGxoUB3JQaGpCvi1ERd+Bz9jhWzHhAdrsI30LMxOhRVucwuX9J77ODXj
	IqLxzQN4W2yGbPE8lQmrRcNCpDWeaDxMnzMAxneagPoa/2Vw+dE2i+VCZeIry6TrctKdaN8VjVLBL
	raQaZ1tpBWj70zaiG2FHe47YGkCFvhwW9BupI3ZvLkY9Vs+r5XcP/6FKMzoex1XSbwyTW4P+6/QBC
	VSg6DH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paE6M-009KF3-13; Thu, 09 Mar 2023 11:06:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDx9-009GDS-To; Thu, 09 Mar 2023 10:56:57 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 02408127D;
	Thu,  9 Mar 2023 11:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678359411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/io0tiHurftvED5sx9LsxUT6zxO/u5fmUM2T3ONQg1w=;
	b=Q0KB9CqTeuqMIUSe2pVjnWRuOwcuUmKy9D5oFkhfi/+moFgjMCQ/lunzoGmezZzlumqVKC
	MrQg1kXbHWxTsyWsmj7NWDC/TENDDKHttjXm4yTCVHYePbZbHZoKkrXHx8CbxPIV34zeHU
	+jfWs5s6CLuPLu8k4bHcBAttFBHFY10zEQWk+lkFlnRP1ytW2BqgvY7WGvS5HgIoxF5D4K
	YNqzc1ck8iGX27ks548/YZDSqdK+1eYjVP2ukcLY5Va037kd8vocBPbRc52qQnq41ErkKV
	4ZcoSCVyIYjrBToOMlILYNHuHLBiYOvk6DiBaFHGE4O0o5TSwpozL9l8guW67g==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 11:56:50 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, Sergiu.Moga@microchip.com, Mark
 Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, Claudiu.Beznea@microchip.com,
 chin-ting_kuo@aspeedtech.com, clg@kaod.org, joel@jms.id.au, andrew@aj.id.au,
 kdasu.kdev@gmail.com, han.xu@nxp.com, john.garry@huawei.com,
 matthias.bgg@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, haibo.chen@nxp.com, yogeshgaur.83@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 michal.simek@xilinx.com, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_025656_153216_10F81C21 
X-CRM114-Status: GOOD (  14.84  )
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

Am 2023-03-09 11:42, schrieb Tudor Ambarus:
> On 09.03.2023 10:38, Michael Walle wrote:
>>> In an ideal world, where both the controller and the device talk 
>>> about
>>> dummy number of cycles, I would agree with you, buswidth and dtr 
>>> should
>>> not be relevant for the number of dummy cycles. But it seems that 
>>> there
>>> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, 
>>> spi-mxic.c)
>>> that support buswidths > 1 and work only with dummy nbytes, they are 
>>> not
>>> capable of specifying a smaller granularity (ncycles). Thus the older
>>> controllers would have to convert the dummy ncycles to dummy nbytes.
>>> Since mixed transfer modes are a thing (see jesd251, it talks about
>>> 4S-4D-4D), where single transfer mode (S) can be mixed with double
>>> transfer mode (D) for a command, the controller would have to guess 
>>> the
>>> buswidth and dtr of the dummy. Shall they replicate the buswidth and 
>>> dtr
>>> of the address or of the data? There's no rule for that.
>> 
>> But in the end that doesn't matter because they are just dummy clock
>> cycles and the mode will only affect the data/address/command. 
>> Therefore,
>> the controller is free to choose the mode that suits it best.
>>  > But that begs the question, is ncycles in regard to DTR or SDR? 
>> That is,
>> are you counting just one type of edges or both the falling and rising
>> edges. The smallest granularity would be ncycles in regard of DTR. To 
>> me,
>> it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we 
>> choose
>> the smallest granularty in spi-mem to be future proof and maybe 
>> provide
>> some spi-mem helper to help setting the cycles for SDR/DTR. As an 
>> example,
>> if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.
>> 
> 
> No, we can't invent our own measuring units. We have cycles and half
> cycles (regardless of the transfer mode used (STR, DTR)).

That is basically what I was saying, just using the correct term.
Ok. So we don't need the dtr property, right? I'm still not sure,
what the semper nano flash uses. Half cycles? But according to your
naming you'd specify full cylces?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
