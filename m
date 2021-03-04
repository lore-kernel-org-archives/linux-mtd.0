Return-Path: <SRS0=6kki=IC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1582C433DB
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 07:03:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B01964EE4
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Mar 2021 07:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B01964EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WPbKnHIlWkm9zmDCX3SA64/IiPcMm6kcWIrKlLQuI+o=; b=FMSuib3Spo7dI203S9ZNCzvBI
	ljpyW43YKMzxFfynhSbVOA4PGRsklnq61JGxB+OiUMDdPWaRf8odHIeMAqXR8QE5JU9uLB9ye8HPr
	CNd2tbMVRaw2qcJAKHXsCzRbRlP2jCtHuQt8BGj2uhhisr1vWYoIfRGzMbrlT72t9SVfhNeWhsBY0
	vMFTs0DGLiKOootZBtQWP6h50bkTjSFgUtvb34lHdvjYQ7yDEHww0U3dePvC6vcO4wHlW8rKK6p/n
	zx/yvBaTWH7kTDwUlF/HTsBTcuQRuzfYSLuggCBnVpIDrDrg/X49X9bGmiGkFGHV5aDM8StYYPMjF
	xZQLK555Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHi0Y-007zqQ-Qp; Thu, 04 Mar 2021 07:02:51 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHi02-007zmu-1V
 for linux-mtd@lists.infradead.org; Thu, 04 Mar 2021 07:02:24 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12472CJF023575;
 Thu, 4 Mar 2021 01:02:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1614841332;
 bh=5FovmJMntTYMMXjRDoen+EG4HIB7aRnzpvDvQ0TqzU4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=HiSlkUkJzN2gL7zq0d4F9m91lq1PlFbeLX0zdAYTG/S0TJ5AJZG/g4qCKyjjb/1F0
 fzsEezBTj1NCsaVWCjahujRc3p0/mf4uQxhmYteBpVcD6QRZmZh3wbwEv0BjtIlAzR
 9UmotV22yWEuNzU4WOTQF4Ta+oBQ2KwCPGba8mvo=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12472CW4050344
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 4 Mar 2021 01:02:12 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 4 Mar
 2021 01:02:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 4 Mar 2021 01:02:12 -0600
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 124728P9021715;
 Thu, 4 Mar 2021 01:02:09 -0600
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Heiko Thiery <heiko.thiery@gmail.com>
CC: <Tudor.Ambarus@microchip.com>, Michael Walle <michael@walle.cc>,
 <p.yadav@ti.com>, <ycllin@mxic.com.tw>, <zhengxunli@mxic.com.tw>,
 <juliensu@mxic.com.tw>, <linux-mtd@lists.infradead.org>
References: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
 <CAEyMn7bY9CisxoWcpF=zR+DYJpW+=EeWLGE_gAB3WK9hvkcuJQ@mail.gmail.com>
 <9263ef4d-7944-00bb-8e2f-b7d33e5aab87@ti.com>
 <e1901135-0433-d693-56c9-3a9fdaca1d55@microchip.com>
 <20210301133618.rzs4amh5ujwys277@ti.com>
 <99f92851b9ee95d01564ae01c56085eb@walle.cc>
 <beaf17ed-d200-4470-f726-e4a71d9565fb@microchip.com>
 <729a56daea261808db672472e47d8c20@walle.cc>
 <116efdb0-8b82-914d-2389-d73e2ea2e89a@microchip.com>
 <c4db1916-18fe-5167-31c1-6bc652bb6212@ti.com>
 <CAEyMn7Z0mYTrtd6TwKJqL6He9g-6o0yYJ2H78oG8gZy9mxXETw@mail.gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5ea9c0cb-3281-7bfd-e2b1-8217eff94c20@ti.com>
Date: Thu, 4 Mar 2021 12:32:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAEyMn7Z0mYTrtd6TwKJqL6He9g-6o0yYJ2H78oG8gZy9mxXETw@mail.gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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



On 3/3/21 7:14 PM, Heiko Thiery wrote:
> Hi Vignesh,
> 
[...]
>>>>>
>>>>> How about naming them something like "updated-flash-name ||
>>>>> first-name".
>>>>> Anyway, these are just workarounds. Manufacturers shouldn't use the
>>>>> same
>>>>> JEDEC ID for new flashes. They should at least add an extended ID.
>>>>
>>>> Mh, what about a list of names? I mean yes it is a workaround, but
>>>> there is actual hardware doing this, so IMHO linux has to deal with
>>>> it in some way. OTOH that list might be long and doesn't look good
>>>> in dmesg (or wherever that string might be used).
>>>>
>>>> It might come in handy to have a mechanism in place if someone
>>>> really cares about it though.
>>>>
>>>
>>> A list of names with differentiation at run-time, where possible,
>>> sounds good. Otherwise we'll stick to a default name, whatever that
>>> will be. Do you care to scratch a patch for the list of names idea?
>>>
>>> We'll still have a single flash entry, with a list of names, and we
>>> still need to either do the SFDP detection first, or to trigger the
>>> SFDP detection with an explicit flash info flag. I'll follow Pratyush's
>>> steps and evaluate the "detect SFDP first" idea.
>>>
>>
>> If we do go down the road of "detect SFDP first", we should add
>> SPI_NOR_SKIP_SFDP to flashes that currently don't claim DUAL/QUAD/OCTAL
>> capability currently in order to avoid any surprises due to wrong values
>> in the table.
> 
> Does this mean that all entries that have DUAL/QUAD/OCTAL defined can
> have them removed And the correct values will be detected/set by SFDP?
> 

No, not all Dual/Quad/Octal SPI flashes have SFDP tables populated.
Removing DUAL/QUAD/OCTAL capabilities for a flash that does not have
SFDP tables populated (or has wrong values) will cause regression as
code may fallback to legacy SPI mode.


Regards
Vignesh


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
