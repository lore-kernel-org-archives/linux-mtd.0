Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BFDC4167B
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6XJUKmMYUgSwRUiSNwJBFKxc6CqPH8WTz5at869e2M=; b=A8pkapYUcqa603BBpoPVUpE5Vm
	tPi+qiYDKeaqDHCZnwtEV+8qIY8yG9MhrUBornstNT7qYyw6gVYD9zlnm8tzgiL0vOMbB2fjvYsaf
	byJ03JDV0E0m5WRlWgsRBIOsM7g56nW0x4Hlg1ECRugt5nUnNuiSlzj+6c+Murl1yvHtFm5ncXKlX
	W1SoIYAMEM4VkSUKwP1Bo4XgocRQCt6GjS6LGfbXwFSyEG+sti86+IjJHpwVLCpMNJ4Y0TqKBT0rU
	tpMkTiOSjWnzbw0TOtDGTlqBnyltZczKOK75Rgq0UhWmMhcynLsuq2FRJFiazOuHfeWMFEVG+h5jy
	hjDBYMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qytfk-00BR3U-2y;
	Fri, 03 Nov 2023 12:53:12 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qytff-00BR2L-06;
	Fri, 03 Nov 2023 12:53:11 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4E1D48720C;
	Fri,  3 Nov 2023 13:53:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1699015985;
	bh=qrzgJ/nHpBYFW2HmH2Bv1JkPgy/GkRnNcGY3PAU6WCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PNtkqwcaUDutrtDi9Y+EhUhdZLMSbSk4ZTEx0ffNE16vThYy9nKZXQsf1qKa0EOIP
	 giahxkPQIEZzGanZEo/IaAE74mY0FS0r+sOEurAICivn8n1/mQxwMOt+wjnibs898N
	 3dOYcwHWCPUPw9QadH/pUTH2C8eIrX5H3WHddUyNEthpphjTbeQPfw6PfRcuJdI3Xb
	 CsnIADJkVQjl2LJlQEIhKdCqYGyWEJmC4q+blvYmqP98MDrUrmzwEwg87HIHa0AYMA
	 HX1+O4zBaqJSRwwy7jPE6+iouYCdvuMdZMm9QrzGGTKzHsV6IybFtxvn2wOKuyqdcu
	 aU8dMjCyfklow==
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 09:53:05 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <e665266fc1565f9d346c95215df39f12@denx.de>
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
 <e665266fc1565f9d346c95215df39f12@denx.de>
Message-ID: <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_055307_363860_EE212912 
X-CRM114-Status: UNSURE (   9.36  )
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

On 03/11/2023 09:30, Fabio Estevam wrote:

> The problem I see is that the erase operation was super slow.
> 
> Please see the timestamps to get an idea.
> 
> Is this slow-erase behavior expected? Please note that the
> SPI controller on the i.MX8MP does not have DMA support at the moment.

Measuring the time it takes to erase the whole flash:

root@mcde3000a:~# time flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 --  0 [ 1502.857687] spi-nor spi0.0: ***** 
nor->reg_proto = 0x00010101
% complete [ 1502.866354] spi-nor spi0.0: *****
[ 1502.870631] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[ 1502.875891] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[ 1502.881311] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[ 1502.886559] spi-nor spi0.0: *****
[ 1502.889888] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[ 1502.895220] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[ 1502.900724] spi-nor spi0.0: ***** op.addr.buswidth = 0x0
[ 1502.906141] spi-nor spi0.0: *****
[ 1502.909474] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[ 1502.914899] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[ 1502.920489] spi-nor spi0.0: *****
[ 1502.923823] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[ 1502.929323] spi-nor spi0.0: ***** op.data.nbytes = 0
[ 1620.329673] spi-nor spi0.0: ***** nor->reg_proto = 0x00010101
[ 1620.335538] spi-nor spi0.0: *****
[ 1620.338869] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[ 1620.344127] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[ 1620.349543] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[ 1620.354791] spi-nor spi0.0: *****
[ 1620.358123] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[ 1620.363452] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[ 1620.368953] spi-nor spi0.0: ***** op.addr.buswidth = 0x4000000
[ 1620.374890] spi-nor spi0.0: *****
[ 1620.378229] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[ 1620.383646] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[ 1620.389234] spi-nor spi0.0: *****
[ 1620.392566] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[ 1620.398068] spi-nor spi0.0: ***** op.data.nbytes = 0
Erasing 131072 Kibyte @ 0 -- 100 % complete

real	3m56.795s
user	0m0.001s
sys	3m15.840s

Originally, I was also getting around 4 minutes to erase the whole 
flash,
so the erase-die performance is comparable to the erase one sector at 
time.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
