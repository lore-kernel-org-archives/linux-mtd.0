Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AC1C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B91F61A6C
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B91F61A6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F44FP2uD4p1+qQRHOZ4xavUCNctHJw5Ii1Fm156Kvrs=; b=TIcT3p/dMmLkvu
	OzkC1X0kvYcVMVUbcQjZIp7Kuax2VoWKi67us6p2ys53obk2cLGPlxpXbeRqjV0W4meBhY9LYhxse
	F0G4dT6lmTJch9AzKadQteEVsVPaSUdHeVpCQoHDfrIrYhgWa1o9KGZUtIH/MFuovclyhtKVMTEIQ
	z5/482udBBQF2MJTHHrhVwuGiVt3O+Yi/dJV7IK7U0I2RIzbnENlCufR7sxLeBeJOki39e0xSzFUV
	gBV4t5rxz1VztDUN7N3n8evMFG6TrTrC0YqPmQIr8rNv384jkH1fWpsYQT4jlrv5ArS03bID3WxDS
	0JEkcZGx8jxiqWYF/ISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8YF-00BGGB-LQ; Fri, 19 Nov 2021 18:23:55 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8YB-00BGF7-Hn; Fri, 19 Nov 2021 18:23:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJINKAh066713;
 Fri, 19 Nov 2021 12:23:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637346200;
 bh=EXlR7gSTF9DEBUlGB/P52Xxj8JMMBXPHgx6hmLmTtO0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ZXMH4HvVneLOXeeIVWL05uivmYFKXYteck3GetoIU734G5MUMmLRlX24VUmYeq31r
 fOi57Hyp0oJyVxPW1KLIxInpp5juCi+j+kqNtBnU6plGkho+yZ7NwqarqRnoGq6AxK
 fOgST5O+EfsCivuwgX9barFQUdKIoSn6XKmQ6nLQ=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJINKvk112366
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 19 Nov 2021 12:23:20 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 19
 Nov 2021 12:23:19 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 19 Nov 2021 12:23:19 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJINIk8000889;
 Fri, 19 Nov 2021 12:23:19 -0600
Date: Fri, 19 Nov 2021 23:53:18 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v3 03/25] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
Message-ID: <20211119182316.vkzjpkrkssmoftlo@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-4-tudor.ambarus@microchip.com>
 <20211115185227.4b4gjnf5zi5bdw56@ti.com>
 <f55d2c76-0265-b616-93fe-9b3db8f714bc@microchip.com>
 <20211116181137.ddo4tw3cafb4ozep@ti.com>
 <6a1d942c-f020-52c1-859f-39d1d84e93bd@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a1d942c-f020-52c1-859f-39d1d84e93bd@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_102351_739176_4A1B48E4 
X-CRM114-Status: GOOD (  22.02  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 17/11/21 02:36PM, Tudor.Ambarus@microchip.com wrote:
> On 11/16/21 8:11 PM, Pratyush Yadav wrote:
> 
> >>
> >>> - spi_nor_try_unlock_all(), which is called by spi_nor_init(). I don't
> >>>   think it actually uses any values you initialize here but still worth
> >>>   pointing out.
> >>
> >> we are safe here, the pointer to mtd is used just to get the pointer to
> >> nor.
> > 
> > Yeah, but who knows if that might change some time later. I would prefer
> > we don't use a member we haven't initialized yet.
> 
> If it weren't for the SPI NOR controller drivers that use
> spi_nor_scan(), I would put the spi_nor_set_mtd_info() just
> above the mtd_device_register(). It will indicate that no mtd_info
> field is used up to that point, less things to worry about.
> spi_nor_try_unlock_all() calls
> 	spi_nor_unlock(&nor->mtd, 0, nor->params->size);
> I can't see for now if we will ever need some specific mtd_info
> parameter. I would say that we won't, we're just unlocking the full
> flash, every info we would need we can obtain from NOR. The discussion
> would be different if it were about mtd partitions, but it isn't, we're
> dealing with the entire flash.
> 
> Would you accept the place where I put spi_nor_set_mtd_info() if I add
> a comment before calling it? Something like:
> /* No mtd_info fields are used up to this point. */
> spi_nor_set_mtd_info();

I see that everything that spi_nor_set_mtd_info() needs is set by the 
time spi_nor_init_params() is finished. Everything after that is 
concerned about selecting the protocol and sending the init commands to 
the flash. So why can't you call it right after spi_nor_init_params()? 
That and updating spi_nor_spimem_check_op() and spi_nor_set_addr_width() 
to use nor->params->size instead of nor->mtd.size should do the trick.

I think that it is implied that mtd_info fields are not being used until 
they are initialized so I don't think the comment itself is of much use, 
but I don't care much about it either way.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
