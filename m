Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C91CC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EO84ktl5rux8W0gQK+MhsrMlicj+YpV9iUVIWovc0x4=; b=LgqIP0ZwGYP8Kt4aRv9AW1x9Us
	DtdMcupPtyE8kknvM3tXikfWsADMZtcHsHoQ5lbSmnkPGYtdETSvAdcUQfcpM9rXX/NkXTj/g1aAN
	HU1KBT2zJZ8UEcSN4tChOOmhw5Ec6fYCgVL+Y8Z7tin2fjMtuQxMWxF4q0vRTZ3UBiNXh13HuPdYC
	M7f7lr52uOZXj7YNGKD0h12pf04ROFGsCq7KUZ9myMyJ5mz4hOF5T36rPrjI1cr3laFVsyD3sVc2p
	qXc5ouvf/gLSfmkzkZcuHJfrhZ8QDrUS7OLL1NYWDu+YVilzzTagdMudaki5zvejMY48qBp6ketJw
	Tl64LAJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qytJt-00BPIB-1m;
	Fri, 03 Nov 2023 12:30:37 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qytJn-00BPHA-26;
	Fri, 03 Nov 2023 12:30:35 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 14BD587105;
	Fri,  3 Nov 2023 13:30:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1699014627;
	bh=ZCGeLRC56ppC3WmAwZPSDkOuCsWY5YtyKFL5uayBo38=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Rv+lU+QaXP/q+CFIlOuzY6JvvcxGCvHXWWepDOrn2oKTGPRFSHG8Jc9MXlF9rYdY7
	 kgYSP5u8V/BaI5Z3LPsXrAkAuWKk+CPkwoTgvXhoqLbvjgmXKLXnUO5gSfj6vBHolB
	 KAtfQdtw+yeC51umo5/mshVFv72ytd0wT2KWwvjmZdcn879APoQA5Wura3iVLV6tNN
	 WS4tvsIpw2i7GHmZoSSYLsdpu/N73X9JwBz9WhFUBaXzm/xVMKMLBL/CqY3iMEPpmU
	 7K1lTr6cvOg+64/ML8P3HlV+SMn5pQCySGt4JW+EaVY8mJMdxFujtgVt96WKsStjZJ
	 DB1Dzf4Wc1X9w==
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 09:30:27 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
Message-ID: <e665266fc1565f9d346c95215df39f12@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_053032_172948_528CAB39 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi Tudor,

On 03/11/2023 08:47, Tudor Ambarus wrote:

> I think I know what happens with your flash. Please try the debug patch
> from https://github.com/ambarus/linux-0day.git
> spi-nor/next-die-erase-v2-debug.
> 
> I assume your flash works in 3-byte mode. The die erase cmd needs an
> extended register in 3-byte mode otherwise is ignored. Please try the
> patch and let me know if it works.

Progress: with this one, I see that the whole flash was erased:

~# flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 --  0 [   39.865773] spi-nor spi0.0: ***** 
nor->reg_proto = 0x00010101
% complete [   39.874441] spi-nor spi0.0: *****
[   39.878712] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[   39.883983] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[   39.889402] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[   39.894648] spi-nor spi0.0: *****
[   39.897979] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[   39.903309] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[   39.908810] spi-nor spi0.0: ***** op.addr.buswidth = 0x0
[   39.914226] spi-nor spi0.0: *****
[   39.917558] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[   39.922981] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[   39.928570] spi-nor spi0.0: *****
[   39.931905] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[   39.937403] spi-nor spi0.0: ***** op.data.nbytes = 0

[  157.398677] spi-nor spi0.0: ***** nor->reg_proto = 0x00010101
[  157.404543] spi-nor spi0.0: *****
[  157.407878] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[  157.413133] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[  157.418549] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[  157.423799] spi-nor spi0.0: *****
[  157.427130] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[  157.432461] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[  157.437963] spi-nor spi0.0: ***** op.addr.buswidth = 0x4000000
[  157.443900] spi-nor spi0.0: *****
[  157.447229] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[  157.452648] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[  157.458239] spi-nor spi0.0: *****
[  157.461558] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[  157.467066] spi-nor spi0.0: ***** op.data.nbytes = 0
Erasing 131072 Kibyte @ 0 -- 100 % complete

~# hexdump /dev/mtd0
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
8000000

The problem I see is that the erase operation was super slow.

Please see the timestamps to get an idea.

Is this slow-erase behavior expected? Please note that the
SPI controller on the i.MX8MP does not have DMA support at the moment.

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
