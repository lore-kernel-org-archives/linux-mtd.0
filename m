Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3E3C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 06:24:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2396764E12
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 06:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2396764E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ebc7i3ky8wKu/IsxcvGdF1UGPTFwZeqzJzrZjE4YPyw=; b=nnIz46cwX5cthosnkkKddeE1Z
	S3uNG1RW+ayp9lX7aZlHEEd6DQJcy54mBOuQWPlBZp2WIXxbO0I4jiTOepz1TA9uv17kh/lKUs1j9
	hmRIsXZ2P7VkpqCA05aLluzEXxTg/vuVSdYJc1NAnvtUILkg63Csv0F7Q6WbGG6xYl9vz0IOatoAJ
	4wYmyDBJLoRwrBkUq0AfvDJQvhRjvmlLFUahv5PsvxPpv2aGwUpfRKkV84EiV+RZjTIDkt80LjrzD
	4JBU8GtI4h1KubuYaAvBvz3bmm7TDkXpL7szAMwocRwrgao9P6cVp45K6MuPwtPnuE2X9Ef60sRGG
	kfH4kEPww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLgdw-00F1mI-KD; Mon, 15 Mar 2021 06:23:56 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLgdq-00F1le-RX
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 06:23:54 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12F6Nisw111892;
 Mon, 15 Mar 2021 01:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615789424;
 bh=+xpVIqXBMlQSCgMDub+F48I456GSb3TAm140SRUSPpE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=I2U9/tFAjwr4SGj3+eW0Wkh1QHAjSnSho3Vv0eeXT3RQLHhdKuD16sSw6qNT7ddcr
 XClmfYTOOmQZi4q/KpmoUGFD7A3vndZof6Jg7WYC2nP2zRs3QCOx+L4aKjH8kWZilj
 DB64b3VJT2n9eWU9x0uVwi9xLneuby5K2b2zrjv0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12F6NiBl045707
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Mar 2021 01:23:44 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 15
 Mar 2021 01:23:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 15 Mar 2021 01:23:43 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12F6NfFt122635;
 Mon, 15 Mar 2021 01:23:42 -0500
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
To: <Tudor.Ambarus@microchip.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
 <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
Date: Mon, 15 Mar 2021 11:53:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_062351_367507_BC9E79B8 
X-CRM114-Status: GOOD (  16.39  )
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



On 3/9/21 12:58 PM, Tudor.Ambarus@microchip.com wrote:
> On 3/8/21 7:28 PM, Vignesh Raghavendra wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 3/6/21 3:20 PM, Tudor Ambarus wrote:
>>> It makes the core file a bit smaller and provides better separation
>>> between the Software Write Protection features and the core logic.
>>> All the next generic software write protection features (e.g. Individual
>>> Block Protection) will reside in swp.c.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>>  drivers/mtd/spi-nor/Makefile |   2 +-
>>>  drivers/mtd/spi-nor/core.c   | 407 +---------------------------------
>>>  drivers/mtd/spi-nor/core.h   |   4 +
>>>  drivers/mtd/spi-nor/swp.c    | 419 +++++++++++++++++++++++++++++++++++
>>
>> Hmmm, name swp.c does not seem intuitive to me. How about expanding it a
>> bit:
>>
>> soft-wr-protect.c or software-write-protect.c ?
>>
> 
> I thought about the SWP configs that we have.
> 
> How about keeping swp.c and rename configs to:
> s/MTD_SPI_NOR_SWP_DISABLE/MTD_SPI_NOR_DISABLE_BOOT_SWP
> s/MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE/MTD_SPI_DISABLE_BOOT_SWP_ON_VOLATILE
> s/MTD_SPI_NOR_SWP_KEEP/MTD_SPI_NOR_KEEP_BOOT_SWP
> 
> The renamed configs should better indicate that the software write protection
> is disabled just at boot time, while the locking support is still enabled.
> Otherwise one may think that with a MTD_SPI_NOR_SWP_DISABLE, all the
> software write protection features are stripped/not available.
> 

I am not a fan of renaming Kconfig options as it breaks make
olddefconfig flow which many developers rely on.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
