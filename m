Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C791EC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 16:58:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4507C208B8
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 16:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bibUbKIM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Xh8+aOwV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4507C208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=or1m6teYVt2ApMCDv9RGWWjPurgFsmM5jYYyMcU64GI=; b=bibUbKIM3sFN9N7jlNavid3Sl
	vLURgEnBsDv5shHqIF7XcydPiICV+4hxwTlJZRqSQpMsXwMdbXH2EHAj7CU7t/dEe6Emb2o3DaJNK
	DpUtVk2C0ptrNrgRTS74hBKFIbpgTqfo85DQJlF7ie2tQD2aiDAc33k2YPJsocZ1+6GA9vGDAYMHr
	flS2Sa+LtcO1Ixvw0pJBb4BC6M7i4MPwaKiILVnIHobDrh55L9cm4E1IhO5t4T6iFNZIUZh7WqAqM
	8gxh95tQMrG4wTtT0RqRAEVXyZwTSSNiAOIb2Gnc0KU+kQSYx0TJnJibI0bh/3YtAtLdawzOrXOWm
	FzuQYH34w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNIwt-0006yE-2J; Tue, 29 Sep 2020 16:57:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNIwn-0006wT-QT; Tue, 29 Sep 2020 16:57:50 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08TGvgCN072729;
 Tue, 29 Sep 2020 11:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601398663;
 bh=ZjsMCRxqgZfNl/B8Bnf/B0HPPXkHxOxgRdvcoJ1EHs4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Xh8+aOwVV9+lh0mvVMUcKcfgTIYokgwRlJLO/XnsYWOrTo1QISttpld+a9HZMFyYN
 zKChsbfnpxLLmI4u//ArR1Igyqvrj9UvLjii0/GwpUdzRpMljWwf2OcSqTdrOsTucW
 G6OfERD2O1pTSKTO730J+dwDfVUOJf0N5srSj2Ac=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08TGvgtu067181
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 29 Sep 2020 11:57:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 29
 Sep 2020 11:57:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 29 Sep 2020 11:57:42 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08TGvabf047655;
 Tue, 29 Sep 2020 11:57:36 -0500
Subject: Re: [PATCH v10 05/17] mtd: spi-nor: add support for DTR protocol
To: <Tudor.Ambarus@microchip.com>, <me@yadavpratyush.com>
References: <20200623183030.26591-1-p.yadav@ti.com>
 <20200623183030.26591-6-p.yadav@ti.com>
 <fbb3d7e7-75ed-dbf6-a975-2ae871bc9fbf@microchip.com>
 <20200721112951.rngfk7njubcsahzp@yadavpratyush.com>
 <f9a22bc5-35f6-9507-b0e7-dcbad51caea7@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <df262497-028e-83a7-eb4e-25c20fc7e216@ti.com>
Date: Tue, 29 Sep 2020 22:27:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f9a22bc5-35f6-9507-b0e7-dcbad51caea7@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_125749_979582_2DC1175D 
X-CRM114-Status: GOOD (  27.00  )
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
Cc: alexandre.belloni@bootlin.com, richard@nod.at, nsekhar@ti.com,
 Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 michal.simek@xilinx.com, Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 miquel.raynal@bootlin.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, p.yadav@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/29/20 9:12 PM, Tudor.Ambarus@microchip.com wrote:
> Hi, Pratyush,
> 
> I'm replying to v10 so that we continue the discussion, but this applies to v13 as well.
> 
> On 7/21/20 2:29 PM, Pratyush Yadav wrote:
> 
>>>> @@ -2368,12 +2517,16 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
>>>>         struct spi_nor_flash_parameter *params = nor->params;
>>>>         unsigned int cap;
>>>>
>>>> -       /* DTR modes are not supported yet, mask them all. */
>>>> -       *hwcaps &= ~SNOR_HWCAPS_DTR;
>>>> -
>>>>         /* X-X-X modes are not supported yet, mask them all. */
>>>>         *hwcaps &= ~SNOR_HWCAPS_X_X_X;
>>>>
>>>> +       /*
>>>> +        * If the reset line is broken, we do not want to enter a stateful
>>>> +        * mode.
>>>> +        */
>>>> +       if (nor->flags & SNOR_F_BROKEN_RESET)
>>>> +               *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
>>>
>>> A dedicated reset line is not enough for flashes that keep their state
>>> in non-volatile bits. Since we can't protect from unexpected crashes in
>>> the non volatile state case, we should enter these modes only with an
>>> explicit request, i.e. an optional DT property: "update-nonvolatile-state",
>>> or something similar.
>>
>> I wrote this patch with the assumption that we won't be supporting> non-volatile configuration as of now. In the previous discussions we
> 
> I think we have to take care of the stateful flashes now, otherwise we'll risk
> to end up with users that let their flashes in a mode from which they can't recover.
> I made some small RFC patches in reply to your v13, let me know what you think.
> 
>> came to the conclusion that it is not easy to detect the flash if it
>> boots in any mode other than 1S-1S-1S [0]. So if we update non-volatile
>> state, the flash would be useless after a reboot because we won't be
>> able to detect it in 8D mode. It doesn't matter if the reset line is
>> connected or not because it will reset the flash to the non-volatile
>> state, and we can't detect it from the non-volatile state.
> 
> correct, so a reset line for stateful modes doesn't help and the comment from the
> code should be updated. s/stateful/stateless

Entering an IO mode even using volatile bits (which gets cleared on SW
or HW reset) creates a "state" that SW needs to keep track of which is
why "stateful" term is used. I think that's what is implied here

AFAIU, Boris's original RFC[1] introducing X-X-X mode also used
"stateful mode" term in the same context .


>>
>>> For the volatile state case, we can parse the SFDP SCCR map, save if we
>>> can enter stateful modes in a volatile way, and if yes allow the entering.
>>
>> If we are not support volatile configurations, the reset line is enough
>> to take care of unexpected resets, no? I don't see any need to parse
> 
> the reset line is excellent for the stateless flashes, it guarantees that the
> volatile bits will return to their default state. Disabling the clock, waiting
> for a period and re-enabling it again should do the trick too, but probably
> a dedicated reset line is safer.
> 

I don't think disable-wait-enable sequence of clock input to flash will
trigger a reset... You have to take down the power and thus force flash
to go through power-down/power-up sequence or use HW or SW reset sequences

[1]
https://patchwork.ozlabs.org/project/linux-mtd/cover/20181012084825.23697-1-boris.brezillon@bootlin.com/

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
