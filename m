Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDE7C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E51207F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 11:06:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uyon06ps";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NiqotQB7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E51207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T6bk80waDpFTurFBkeztH5D2ZM7E6jui1NOrqCNU20=; b=Uyon06psWdjtG+
	I2py9vPdU3Nuov+ufUupPee7Elx5HclEVrh6d3S8/5a+Qe8x6mx7GsEyhznBRAUDuY4G6i/BTTycs
	1z4ulb8K3gSPpH1UsYnYjOsrHOGZW1C4niiMKEyPur7spIjM55kAY5rY+o6yuNsFh1xFi6DiMkpd8
	arduI68UVzpERCm5DWWW0ROz4YfhOofNfSTjGrhwnFduna+Dy+CvR0rtV6O7fWIa1Q8qq+WoZgTyJ
	1XJ5CRQdTihr72u1NsquWSGuuII7HUJgE579Mu2iewQomzWJpp8Tp4zvh1pT5pK/oAhtWzAxm2ElR
	rhtC3GA+6Gvv6pAs3IpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeGMR-0001sS-AS; Thu, 28 May 2020 11:06:07 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeGMO-0001s5-Cq
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 11:06:05 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SB5nUL009390;
 Thu, 28 May 2020 06:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590663949;
 bh=J3vobVhX0S2zC8e0Jy18S3skJ48i2SWhuRNZO/B02J4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NiqotQB7h6vnrjmmo1nMatkMpaXQdoBKOhDD5qJfbCZps5Gdur9RuaXkTWG3pix+8
 eVZZ/TsJ1x8Y87tJmmFQaKtu121s2necSi0WSH0gCBKZItp0q14DYZMjMqoDS6xNPU
 FRKUSIMEQPLALnS7BdTqmOoPJzOOxYdf1an/4xOs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SB5nJt085127
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 May 2020 06:05:49 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 06:05:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 06:05:48 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SB5gY5020766;
 Thu, 28 May 2020 06:05:43 -0500
Subject: Re: [PATCH RESEND v2] mtd: physmap: Add Baikal-T1 physically mapped
 ROMs support
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
References: <20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru>
 <5f5fc883-1cf0-f0b8-11bb-a60b45d135cd@ti.com>
 <20200528104245.jurucbblufluyjut@mobilestation>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0a9160b6-f915-2a2b-582f-3e6d657ca7df@ti.com>
Date: Thu, 28 May 2020 16:35:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528104245.jurucbblufluyjut@mobilestation>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_040604_514789_4E8EBB8A 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
 Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
 Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
 Arnd Bergmann <arnd@arndb.de>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 28/05/20 4:12 pm, Serge Semin wrote:
[...]
>>> +
>>> +static map_word __xipram bt1_rom_dummy_read(struct map_info *map,
>>> +					  unsigned long ofs)
>>> +{
>>> +	map_word ret;
>>> +
>>> +	ret.x[0] = 0xFF;
>>> +
>>> +	return ret;
>>> +}
>> Why define dummy_io for "baikal,bt1-boot-rom"? I don't see any use of
>> adding a driver that always reads 0xFFs
> This is supposed to be temporary solution for the baikal,bt1-boot-rom ROM.
> The Boot ROM mirror might reflect either an embedded firmware or the SPI flash
> directly mapped into the memory. In former case there is no problem, we can
> freely read from the Boot ROM region. But in the later case the mirrored region
> (memory mapped SPI flash) is not always accessible. If normal Boot SPI
> controller is enabled, then the SPI flash mapping isn't accessible (any attempt
> will cause a bus-error). In order to fix this we'd need a mutual exclusive lock,
> which would disable the SPI controller while the mirrored memory mapped SPI flash
> region needs to be accessed. Such mechanism isn't currently implemented, but it
> will in be in the framework of my patch created for the SPI subsystem.
> 
> My idea was to just provide a dummy callback for now and replace it with normal
> IO-methods with mutual exclusive lock-unlocks when the corresponding SPI driver
> is accepted.
> 

Yes I understand, but I don't see any advantage for end user by
providing dummy calls... So please don't add the callbacks until they
implement proper functionality

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
