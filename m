Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE463C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Dec 2021 10:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhqh6af2k1fzl1/uouN89dTv+aA6lR/GHTl4aEF54Ds=; b=hN/76CngznP+vW
	+UQxMo6R5ZejFAfC81YKuSYzTRrZNNqI3HGdzhRORtkk4be/QZzYHyCulmm5l16j+RP0los1UTVe0
	+f8+CZOw9SlZNU4HHGGqoHMfjU6WCHwNA5KuMVbX1+uqOlQ5960CafmSgInPpr0Bwf7Os+nCwNt2m
	6FNn/N3d6ArvPzC2UiM/pY8271jszqgSUATuRWq93K6ulezxY0aCi+EExncM3wvkMSpI3BeqLOxUs
	LGLirat0r6GyrISRSLQAyjB43EVfswsvQAQ0Dnh/Rag6xPf+IQHgx0syHcIoDBx91xd1lRU5rNuLo
	WKTvv7dW7A0+qCyedQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3F7Z-005uVA-J0; Fri, 31 Dec 2021 10:26:49 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3F7N-005uTW-JT; Fri, 31 Dec 2021 10:26:39 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BVAQRXS032981;
 Fri, 31 Dec 2021 04:26:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640946387;
 bh=bpUJPGgi/5Jx8j2h6g3oXESZgoh1z7lVwijB7GXIvPY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=I9dhu3YnYCdPQV5wZhyOYljCW4hQ7M3JSxn0R/O6sq2J2xXbx2ZcHqiNzlLS9Ij7z
 flBelTZNcsrNHIBW/GTR9RiIIcbJpXDj0KeAUDldhNPbd7Vq52rYRgMLdvzap4QbUx
 JxYHXmup4QljSyZRiZHqqrq0kq57+0xMFGxWlizY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BVAQR5s023694
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 31 Dec 2021 04:26:27 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 31
 Dec 2021 04:26:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 31 Dec 2021 04:26:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BVAQQ7k052825;
 Fri, 31 Dec 2021 04:26:26 -0600
Date: Fri, 31 Dec 2021 15:56:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Patrick Williams <patrick@stwcx.xyz>
CC: Joel Stanley <joel@jms.id.au>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Jeffery <andrew@aj.id.au>, Potin Lai <potin.lai@quantatw.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: aspeed-smc: improve probe resilience
Message-ID: <20211231102623.izaqlzjvracbbgmp@ti.com>
References: <20211229143334.297305-1-patrick@stwcx.xyz>
 <20211229173411.l2bipmi4x3arqjoo@ti.com>
 <Yc3Qav+ULNdF5zRT@heinlein>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yc3Qav+ULNdF5zRT@heinlein>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211231_022637_831150_DB3DC48A 
X-CRM114-Status: GOOD (  25.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Patrick,

On 30/12/21 09:29AM, Patrick Williams wrote:
> On Wed, Dec 29, 2021 at 11:04:13PM +0530, Pratyush Yadav wrote:
> > Hi,
> > 
> > On 29/12/21 08:33AM, Patrick Williams wrote:
>  
> > The patch itself looks fine to me but we no longer want to maintain 
> > drivers under drivers/mtd/spi-nor/controllers/. They should be moved to 
> > implement the SPI MEM API (under drivers/spi/).
> 
> Is the linux-aspeed community aware of this?  Are you saying you don't want to
> take fixes for their driver into the MTD tree?  Can it be pulled into the Aspeed
> tree?

I am fine with taking in bug fixes but no longer want to take in any new 
features. My main intention was to nudge you to convert it to SPI MEM 
regardless of whether this is a bug fix or a new feature, because 
eventually we want to get rid of drivers/mtd/spi-nor/controllers/ and 
the API that comes along with it.

As for your patch, I certainly don't want it to go via the aspeed tree. 
It should go via the MTD tree or not at all. I am not quite sure if this 
counts as a bug fix or a new feature though.

> 
> > Could you please volunteer to do the conversion for this driver?
> 
> I'm not personally going to be able to get to it for at least the next 3 months.
> 
> It looks like we don't have a dedicated maintainer for this driver other than
> Joel by nature of him being listed as the maintainer of "ARM/ASPEED MACHINE
> SUPPORT".  I'm not sure if Aspeed themselves are planning on doing the necessary
> refactoring here.
> 
> 
> Joel, are you aware of this driver using a deprecated implementation?  Were
> there anyone planning to do the reworks that you are aware of?  I'd like to get
> this fix at least into the OpenBMC kernel tree because I'm seeing this fail in
> the real world.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
