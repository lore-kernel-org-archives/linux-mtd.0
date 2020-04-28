Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8BCC83002
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 01:34:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FC4A206D9
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 01:34:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="moyJBEi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FC4A206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlXv+GCNqEf6DQCNJjA0cCrwdltoQc06EU/Ya02aeTU=; b=moyJBEi91iVk3b
	k29c8s/dFToVyNi91D53CyPaKCF23UiqCrMDbp0VW86jFlMJz9DG+0PKE3xURTDEJGz80gCe0B6Y1
	iL90jI6RCOmrJnoIO2MjjbmkeHMSs1tC+f3UoeeLTgMoLLpl4LfNusnofUrWtmy0t9WD560PNkH6Q
	HXkdMjY4rANvj0WfRZhv6SnLQ4uX1AXTdBS/5Xppd6bxXdK3TXiZnMbgE6CXgZd0B2TMLuycOb3fB
	PIhD7TdjRsdUtliMjlnerhNLvkGrbFGauk59jc/4ZQ9t47QbaVsQlNkytcxEVvmHRzp3412S1RZq0
	r4AWaQScK4sDSlgB4PUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTF8j-0008Ht-Sk; Tue, 28 Apr 2020 01:34:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTF8a-00089h-Gm; Tue, 28 Apr 2020 01:34:18 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id D0A9999B00C42AE7E8BD;
 Tue, 28 Apr 2020 09:34:09 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
 Tue, 28 Apr 2020 09:34:07 +0800
Subject: Re: [PATCH v4 05/16] mtd: spi-nor: default to address width of 3 for
 configurable widths
To: Pratyush Yadav <me@yadavpratyush.com>
References: <20200424184410.8578-1-p.yadav@ti.com>
 <20200424184410.8578-6-p.yadav@ti.com>
 <6b6384ad-d37a-eea6-af29-322e83924912@hisilicon.com>
 <20200427172336.ihezwq3wn75m7k3l@yadavpratyush.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <f6a593ab-8685-18e0-04c8-25edd1cab11a@hisilicon.com>
Date: Tue, 28 Apr 2020 09:34:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200427172336.ihezwq3wn75m7k3l@yadavpratyush.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_183416_722693_0F7ADA5B 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-spi@vger.kernel.org,
 Pratyush Yadav <p.yadav@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,


On 2020/4/28 1:23, Pratyush Yadav wrote:
> Hi Yicong,
>
> On 26/04/20 11:53AM, Yicong Yang wrote:
>> On 2020/4/25 2:43, Pratyush Yadav wrote:
>>> JESD216D.01 says that when the address width can be 3 or 4, it defaults
>>> to 3 and enters 4-byte mode when given the appropriate command. So, when
>>> we see a configurable width, default to 3 and let flash that default to
>>> 4 change it in a post-bfpt fixup.
>>>
>>> This fixes SMPT parsing for flashes with configurable address width. If
>>> the SMPT descriptor advertises variable address width, we use
>>> nor->addr_width as the address width. But since it was not set to any
>>> value from the SFDP table, the read command uses an address width of 0,
>>> resulting in an incorrect read being issued.
>>>
>>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>>> ---
>>>  drivers/mtd/spi-nor/sfdp.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>>> index f917631c8110..5cecc4ba2141 100644
>>> --- a/drivers/mtd/spi-nor/sfdp.c
>>> +++ b/drivers/mtd/spi-nor/sfdp.c
>>> @@ -460,6 +460,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>>  	/* Number of address bytes. */
>>>  	switch (bfpt.dwords[BFPT_DWORD(1)] & BFPT_DWORD1_ADDRESS_BYTES_MASK) {
>>>  	case BFPT_DWORD1_ADDRESS_BYTES_3_ONLY:
>>> +	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
>>>  		nor->addr_width = 3;
>>>  		break;
>> Should we also assign address width to 3 in default condition. At least we should not
>> leave it uninitialized here.
> The default condition would be taken when this field is 3. The value 3 
> is reserved, and so no current device should use this value. That said, 
> I don't see any downsides of doing so. If the value 3 means something 
> else in later revisions of the standard, this code would need to change 
> anyway. If not, we would use a relatively sane default for devices with 
> a faulty BFPT.

The purpose is to set one possible value which may be used later in parsing smpt.
In current driver, if we do nothing with the post-bfpt fixup, then the width will
be unset. Otherwise, maybe the width can also be set in spi_nor_smpt_addr_width()

    default:
   +    if (!nor->addr_width)
   +        nor->addr_width = 3;
        return nor->addr_width;

But set when parsing bfpt seems more reasonable.

> I haven't received any comments on my series so far. If end up having to
> re-roll it, I will add this change. Otherwise, I'm not sure if it is a 
> good idea to re-roll a 16-patch series for a one liner that isn't fixing 
> some major bug. In that case, maybe you can send an independent patch 
> that does this after mine is merged?

Fine. :)

Regards,
Yicong




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
