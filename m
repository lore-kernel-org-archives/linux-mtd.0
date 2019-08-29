Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7716C3A5A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 09:16:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA85D2073F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 09:16:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TYvmn98h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YvGeUTNl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA85D2073F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cX5zPa0sGe3TuJBXOxmwcW8o668uii1XK5RRE3K76tU=; b=TYvmn98ho8IWTl
	TUtG8aK2DGXjzYQ92LRMXlF7n7s+1EOf/VxvvCVYDOowR/LCxuOCHyXEjJ3pUcPGjcHfu807KRc1X
	3DWIvIIJzQ+z7DE9L23jePWe40QwFSQREixDE/PzYqsnWzOYBAsK+QpX2MP4DMoIC4BrTpdsmRvoV
	M/BrqOb1ZvzvcuhfSpH/zsokB7H3YOG7VT41odSCHiarKoQeTZ3gFptN5CkVSz3mU40jVhq/pjDO9
	rA0yUkTaEgEIC5AOEdFOhjyRfDxbJVxE2553YTTnAZZPi9g5YW65YeU/fZlhb1+AKJSL/Fjpws0Ko
	TEAvo4+ujNi9rk1o2+Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3GXh-0006vX-K4; Thu, 29 Aug 2019 09:16:33 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3GXd-0006ut-JD
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 09:16:31 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7T9GFpW128083;
 Thu, 29 Aug 2019 04:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1567070175;
 bh=Oh+p8OBdmPRERr5UkoRBzV5cgtRo7E+kClgmsbE1yAU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YvGeUTNlYBRIzhCzDRRudxeyMH7X12MsNcJe8y0OU6IhDoyvtp11bkupvqsKm3+zO
 z7NEXVFMmIVwtc6mL7CY2wDPF46EeleY8sJlg5tuQWwWjGFaCuhnVxvTq6ejAyk77r
 Na/sZhbaAyZw/SDkr0bRKilZ7K407DWp6DdjP5J0=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7T9GFvp008867
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 29 Aug 2019 04:16:15 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 29
 Aug 2019 04:16:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 29 Aug 2019 04:16:14 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7T9GBuq042642;
 Thu, 29 Aug 2019 04:16:12 -0500
Subject: Re: [EXT] Re: [Patch v3] drivers: mtd: spi-nor: Add flash property
 for mt25qu512a and mt35xu02g
To: <Tudor.Ambarus@microchip.com>, <ashish.kumar@nxp.com>,
 <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <1565692705-27749-1-git-send-email-Ashish.Kumar@nxp.com>
 <e55cd1f9-7359-5484-d258-1f3ea51584b6@microchip.com>
 <VI1PR04MB4015E5BA7BE9763A105AD47D95A20@VI1PR04MB4015.eurprd04.prod.outlook.com>
 <a5049dca-e00e-ca28-7853-526ec7eac281@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <33252600-3823-c41e-8818-68222ab42d62@ti.com>
Date: Thu, 29 Aug 2019 14:46:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a5049dca-e00e-ca28-7853-526ec7eac281@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_021629_721248_1C1ACBAF 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: kuldeep.singh@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 29/08/19 1:39 PM, Tudor.Ambarus@microchip.com wrote:
[...]
> 
>>>> +
>>>> +     /* Micron */
>>>> +     { "mt25qu512a", INFO6(0x20bb20, 0x104400, 64 * 1024, 1024, SECT_4K |
>>>> +                             USE_FSR | SPI_NOR_DUAL_READ |
>>>> +                             SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
>>>> + },
>>>
>>> I'm looking at the following datasheets: mt25qu512a [1] and n25q512a [2].
>>> Both flashes have the same Extended Device ID data. What will happen, is
>>> that you'll always hit the first valid entry, so "mt25qu512a", and you'll indicate
>>> a 'wrong' flash name for n25q512a. If there is nothing that differentiate
>>> between the two, maybe you can add a comment in the code that says that
>>> "n25q512a" was re-branded to "mt25qu512a" after the STM spin-off.
>>> Whatever solution will be, it will be better if you do it in a separate patch.
>> Hi Tudor,
>> Considering both are same, should I rename to mt25qu51a, and add SPI_NOR_4B_OPCODES or
>> Keep n25q512a, and comment about mt25qu51a  and add SPI_NOR_4B_OPCODES.
> 
> I see two options:
> 1/ either rename "n25q512a" to "mt25qu512a (n25q512a)" and add the
> SPI_NOR_4B_OPCODES

I would go with first option so as not to alarm the users who are used
to seeing n25q512a in kernel log. This option shows both old and new
brand names.

Regards
Vignesh

> 2/ or keep "n25q512a", add SPI_NOR_4B_OPCODES, and add a comment about
> re-branding to mt25qu512a.
> 
> Which one do you like better? What about you, Vignesh?
> 
>>
>> For separate patch comment you mean split mt25qu512a and mt35xu02g into 2 patch.
> 
> yes, send a separate patch for mt35xu02g, as the changes are not related.
>>
>>>
> 
> cut
> 
>>>> +     { "mt35xu02g",  INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>>>> +                     SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>>>> +                     SPI_NOR_4B_OPCODES) },
>>>
>>> Is there a public datasheet for this flash?
>> No,  data sheet in under NDA, I have asked micron FAE for public data sheet, will resend after the same is published. 
>>
> 
> No need to wait, I'll trust you. It was better if I could verify the info, but
> if we can't, that's it. Just send a different patch for this change.
> 
> Cheers,
> ta
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
