Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B154FC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 16:15:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FAC64E83
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 16:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25FAC64E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7PBFOZA6GQepXTTqv/UIBLcPeILaNtJ4DlzjT1gq6uE=; b=CZ/Td1drAMwsORDDdshhh3Pdz
	l9OLpsQJI+QUrzkp0NMbOp0aPVRS+ruc6nX4e0NJO3dwryfkI847y1oOSzn7XBrnC0YmSP3KUYJh4
	tMw8voEX7UGdLgJOxaITHkCClj71DHb6+j0mqUPLXrZ8HeJxO7XS9ok7xIoBcpOJ79qVbZks6D5lm
	SYigmVly7uKiGjPu64x06wn9Pda2q+BFvfbK4x9zA9SOkijUCz6rLVYncjGPmxmqc1JFa4zZzsX7B
	RkA/5+99LqAdQ8mNa4HDWu5uOsbbiEdE0EqlIpqx+vaN2HsogKIxpigjJ/80ut25MH+YJrP0fsy+p
	ss8aO4cgQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMYoo-003WS5-9q; Wed, 17 Mar 2021 16:14:46 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMYof-003WO3-Ns
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 16:14:43 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12HGEWKE125773;
 Wed, 17 Mar 2021 11:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615997672;
 bh=meEMMQGzpHgES9UZrjykVhesIW4rSxb1evBkwPhp5OI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=O89t/LkZDmcjen+fsJTNlb/V0ocvKnhqkHcLBtMrP4t+kuuV7lvHkV1wiA4XFb4D1
 YDz82AYGJ6TyrU4k2OcD/i+CdNVIiE169hgH2ueVgGTbik6D1gwq1kISFm+fm0M5qF
 3ZmKlC1zeexjDS6ySdpl0Y+acMJMd/UruYr2nqbk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12HGEWPG004242
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 17 Mar 2021 11:14:32 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 11:14:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 11:14:31 -0500
Received: from [10.250.234.120] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12HGERHp013957;
 Wed, 17 Mar 2021 11:14:29 -0500
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
To: Pratyush Yadav <p.yadav@ti.com>, <Tudor.Ambarus@microchip.com>
CC: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-kernel@vger.kernel.org>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
 <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
 <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
 <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
 <20210317090504.ra3vm76xexhaqg2l@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9fd4957d-778c-966e-2756-13418d199bf6@ti.com>
Date: Wed, 17 Mar 2021 21:44:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210317090504.ra3vm76xexhaqg2l@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_161438_088458_2ADA933F 
X-CRM114-Status: GOOD (  15.47  )
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



On 3/17/21 2:35 PM, Pratyush Yadav wrote:
> On 17/03/21 06:09AM, Tudor.Ambarus@microchip.com wrote:
>> On 3/15/21 8:23 AM, Vignesh Raghavendra wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 3/9/21 12:58 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 3/8/21 7:28 PM, Vignesh Raghavendra wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>
>>>>> On 3/6/21 3:20 PM, Tudor Ambarus wrote:
>>>>>> It makes the core file a bit smaller and provides better separation
>>>>>> between the Software Write Protection features and the core logic.
>>>>>> All the next generic software write protection features (e.g. Individual
>>>>>> Block Protection) will reside in swp.c.
>>>>>>
>>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>>>> ---
>>>>>>  drivers/mtd/spi-nor/Makefile |   2 +-
>>>>>>  drivers/mtd/spi-nor/core.c   | 407 +---------------------------------
>>>>>>  drivers/mtd/spi-nor/core.h   |   4 +
>>>>>>  drivers/mtd/spi-nor/swp.c    | 419 +++++++++++++++++++++++++++++++++++
>>>>>
>>>>> Hmmm, name swp.c does not seem intuitive to me. How about expanding it a
>>>>> bit:
>>>>>
>>>>> soft-wr-protect.c or software-write-protect.c ?
>>
>> Having in mind that we have the SWP configs, I think I prefer swp.c.
>> But let's see what majority thinks, we'll do as majority prefers.
>> Michael, Pratyush?
> 
> I don't have much of an opinion on this tbh. But I usually prefer short 
> names so I'd go with swp.c here. Maybe also add a comment at the top of 
> the file mentioning the full name "Software Write Protection logic" or 
> something similar for clarification.
> 

I don't have hard objection to swp.c. As Pratyush suggested, a comment
at top of the file indicating the purpose would be good to have.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
