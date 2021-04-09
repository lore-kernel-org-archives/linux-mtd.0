Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4949EC433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 08:51:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C769A611AF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 08:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C769A611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ekl4aQb5/zXYrxymfnsDu8k+vMGDu3TuUDrXiK5SzvI=; b=XLTxo7XXkiOm+rXiJ1FGKJzhn
	MUz9MZWO25FJJQG10nZTvtRDxi5w0T0VKV1MG+tpbEWaQK9cYvUFeBjgX6OteR5GX38NxeupLCiLL
	/KClZDhrIG62EVTfD9bnB2MZVuGpDUQKaoXguCtDhAlxKvd5n/MXDl/Np1TmHWX467XMGd3olfdAV
	frLdty1ShGCdwW94PZTruHhZBN40XPMpqRMTFeknaVUY4Tas9BJWUIimgpm5aJeUAdqyeJWeVfs3h
	xr+llmnO/sKeU82L/DD2ssA1e4HnGaLWK6IEgNzNrH3BY84xurAsojXv9LkXjHiKr360Av8pyefWj
	s/H0+L8rA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmqB-0006aI-RM; Fri, 09 Apr 2021 08:50:12 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmq6-0006ZY-B6
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 08:50:08 +0000
Received: by mail-pg1-x535.google.com with SMTP id w10so3387876pgh.5
 for <linux-mtd@lists.infradead.org>; Fri, 09 Apr 2021 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ebGfCJ3Uwy7H2YKlGcVfw+Q4GO6pMAusKNByNozcMcE=;
 b=pfMZXo9d/wlhJZyrphY0s5EOeI4YrMPYYz4NpRNUBAJzY/7olXSzNbtsQzFk4sKchy
 4NvA20RhCzAl8JkoPzQpCjisq7L7bbyNcx9nbVZxroQFnP8w0JvMsPaWum1sVCOFzsBZ
 SO/4cdlea+Lrgf/pZUUOi0fkyGaTLfOABUmdrxNKjzu2M953SKZNm+stpL+EXnoV0OcT
 dlnC0UvlFrB4K9ePCPIUHiO66PRue78lQN+PgO6zJ030g5m01TqxtZc1MGurV98prxoa
 MoSEL6vsaL9i6nbXYpB8lqZx21WKgn2k5CX5OAwkwpDewEQ0X9wPCukvgExDghYEg4EI
 FPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebGfCJ3Uwy7H2YKlGcVfw+Q4GO6pMAusKNByNozcMcE=;
 b=JplM6LZSqILWl3SauHKoXyNY/UZucyHY7sJH+M7qKScze/xidgDijQwONuQ0yVV6rz
 CQKuUz5TzLTrl1jZNadjtyRVOU+agxC7vtBtvo/Dexw5qc7FPV7lUgziFUw/rhVf/3Iz
 KzCIAZWDnjANEfoa1bFtgFJtTPR+rLmgsnX7hsZ5IEMKIthrhOHMu5b1V6MkFnzhRWyK
 KD0pl3JFv3DLdhgpaUKtfgAfBNz6uyu3avtmAjcLEkD/SEY/gt/fU6cnHF0/5iyyiELw
 TpsArmqx3FMA/6LXl0UMUy9AxDpwrNv/cyutSEFFXUpG42He0F0qswy7HQbthdoYafSu
 +1gA==
X-Gm-Message-State: AOAM531yBRa+1wVAFoaA1Om9vl5yc2nduS1qbl2vLv0qhLx657j2Mv0S
 QqQLVR2VrLi62lqoPII0W0I=
X-Google-Smtp-Source: ABdhPJzvmZpwE6SsQkhznBTwYyFXd65RjhURIvg6p4SRbPKYfj9Xs3VyM/x5DrBMN09np7ZB/H35Kw==
X-Received: by 2002:aa7:990d:0:b029:21d:7aef:c545 with SMTP id
 z13-20020aa7990d0000b029021d7aefc545mr11457969pff.77.1617958204143; 
 Fri, 09 Apr 2021 01:50:04 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id l2sm1627786pji.45.2021.04.09.01.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 01:50:03 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
Subject: Re: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <561ec6a4-5e64-8a82-043e-9e825aa00a3f@microchip.com>
 <50b9d6c9-c501-bc08-7f39-5e49b9e76782@gmail.com>
 <b7e1a323-ab9d-5892-ae6e-7cf420e2885b@microchip.com>
Message-ID: <909e592f-40be-d644-e311-e9c0eb6d35a1@gmail.com>
Date: Fri, 9 Apr 2021 17:50:00 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b7e1a323-ab9d-5892-ae6e-7cf420e2885b@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_095006_446981_A0C7686E 
X-CRM114-Status: GOOD (  26.97  )
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

On 4/8/2021 2:35 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/2/21 10:13 AM, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Tudor,
> 
> Hi!
> 
>>
>> On 4/1/2021 3:09 PM, Tudor.Ambarus@microchip.com wrote:
>>> Hi,
>>>
>>> On 3/19/21 8:51 AM, tkuw584924@gmail.com wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>
>>>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>>>
>>>> The summary datasheets can be found in the following links.
>>>> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
>>>> https://www.cypress.com/file/499246/download (2Gb/4Gb, dual/quad die)
>>>>
>>>> The full version can be found in the following links (registration
>>>> required).
>>>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
>>>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-2Gb-MCP-Semper-Flash-with-Quad-SPI/ta-p/260823?attachment-id=29503
>>>
>>> Takahiro, looks like I can't access the dual/quad die full datasheet, not enough rights,
>>> even after creating an account.
>>>
>> My colleague helped on this. I hope you could access the datasheet.
> 
> Takahiro, I can now access the datasheet, thanks! I see that Erase Chip
> requires an address. Is the erase chip with address common to other
> manufacturers? We'll have to update the core so that these flashe
> benefit of the erase chip opcode. Otherwise we'll have to set
> SNOR_F_NO_OP_CHIP_ERASE at flash declaration, which I don't really favor.
> 
I overlooked the erase chip for multi-die package parts. Thank you for
pointing this out. I checked Micron MT25QL02GCBB datasheet and found the
part supports DIE ERASE (C4h) instead of standard CHIP ERASE.
https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_l_02g_cbb_0.pdf?rev=43f7f66fc8da4d7d901b35fa51284c8f

To support die erase, the core needs to know die size. That will initiate
a discussion about overall support for multi-die package devices. I think
it's better to create another series of patches for that. In this series,
I would set SNOR_F_NO_OP_CHIP_ERASE as a temporary solution.

>>
>>> How are multi die ops handled when crossing a die boundary?
>>>
>> The existing erase/write ops are done by sector/page size alignment and
>> never cross a die boundary. The read ops does not care about die boundary
> 
> What do you mean? What will happen if I request to erase 512K starting from
> offset (die0 - 256K)?
> 
I meant the erase and write requests are split into multiple ops based on
sector or page size. So, if you request to erase 512K starting from there,
two erase ops will be performed. One is for the last sector in die0 and
another is for the first sector in die1.

>> but still works because the Semper dual/quad die parts continue to output
>> data from next die when crossing a die boundary.
> 
> cool
> 
>>
>>>>
>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>
>>> Have you tried to erase/read/write multiple dies with a single request?
>>>
>> Yes, I did 'mtd_debug erase/write/read' with address ranges that involve
>> two dies. You can find errata info in the datasheet about cross-die read.
>> My test does not cover the trigger condition of the failure actually.
>> I will submit another patch that work around the issue as needed.
>>
> 
> How will you differentiate between silicon revisions?
> 
No way to differentiate. So, if I apply a workaround like splitting a read
request into two read ops, that is performed for newer silicon even though
it is not needed. I would like to implement the workaround once I find it
is a real issue on many systems.

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
