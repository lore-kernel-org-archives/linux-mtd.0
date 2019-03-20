Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87591C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 21:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C462184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 21:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UVoDy7ki";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="p0vZDPvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C462184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y82y33TZc1fHdTeWrrLQZeIiHjeDfC+AICBQpBV7/dc=; b=UVoDy7kifDDqrV+kIG6Srd6Gr
	oyUmYHB1FDeEKQYdZkL3mE5A+TYTEalOTRWQM5qVKZ5BNaZxUHhHG0YYbMd+mWjOenIhn3G6NOS+B
	r5bRI3wc9aTFBD1+oNNEnqKkvbs9RpKbmvIUpJ7mc1VE6zj7a/9tDgRgAgxpG58CTD/jd1DCP81WV
	5494UcMvza7UcdrT/w2oHzos316OE4agxr9sLEFPyZcr5W0Vw0VM2zpnEyXIML+PuJUjq87c+Yaen
	9Yb9t85RV8DwFL4O/Xr6JVdstvZQaoUAXheORLcV/sPXPSGRsSKBpe3f/Ug264DQVAEF0zC5N+7nV
	wToAww7JA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6iPE-0005uA-RK; Wed, 20 Mar 2019 21:05:48 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6iPB-0005tr-M5
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 21:05:47 +0000
Received: by mail-lf1-x141.google.com with SMTP id 5so2968637lft.12
 for <linux-mtd@lists.infradead.org>; Wed, 20 Mar 2019 14:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XoE6Kpx33BqCfQnWE3kpMpwtx5uN/1bJvOuPbrqTjdI=;
 b=p0vZDPvqnwyaYVp2KO/RnHylB7TdhxNnfHyn4jL43vcYmP6RSPdlL+VVcfaFTmyi7w
 2AbJUuQ/E3M+06K0omEkIvuqTIAfRlTrsbdwBEHXaRnfanF7FlAt/AAJGTymMDCHw2/7
 2EJ+NYC1pp6rKaRBKHWXbehWjrvLX8M6ZK4Xa77TL9Dq0CxXJjOeleDcscS5x4a4ReEz
 AGxrIfWDS/YYEdEyfAJvQLL1i3M1xAnDQN72DxlR8MfqHH7nGz4SXzkakw5A5li+ZaxC
 R/VxHEMf30uwdyEAiXXZmD4c7D6Yhw2yIxmi+wFNH3bqb1sfRNy0CK4ltFqlpOIB9Nqc
 1aHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XoE6Kpx33BqCfQnWE3kpMpwtx5uN/1bJvOuPbrqTjdI=;
 b=lyioh0sdjYTovQK6dDJ4eCjPGhBVYr8KunX68mYcf7xOjvOiWkhvpMoG4mPpPofRcy
 HNhJdu5rv0QrB/HXerrQGJ0sW2/dDuIyZ7QhSKhCI6CKb1zWaXJtGK7eA/2jWGzIMFlf
 QsBJnoNGxRkxBW1RxzWARzKtotQlMG1ytDG+IhB5I4xvluZ3vbCyywO0nQJA//EN9OfD
 W5nGyKLLS0vjqmG0Ibq5BM7Ez2555uvDB/5cOa+flKCg2hSyO0Ur7NodlfaTcmCuIJjV
 /b8EbupdytkkazgZEqJfBVfsLktHWHq/bwL6zOdaL0TL1Jl2xEA4bgzETIBn5V6dOF9S
 ijaA==
X-Gm-Message-State: APjAAAUcFrvwqmMDleOHty4FA1sJLYe12cdJlmP+x3OYfkg3fRAi3ZAm
 /qMiR3LzV4624mKr7LnEEtHZ+g==
X-Google-Smtp-Source: APXvYqwmEAcBff4WORv/3kSBmT89ZcylWAjLdmLvWsv+7swhZNe5kFeQF0XMDG1sORFoAz2s4iDE4A==
X-Received: by 2002:a19:6b14:: with SMTP id d20mr16799631lfa.152.1553115942813; 
 Wed, 20 Mar 2019 14:05:42 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id
 w26sm571117lfe.5.2019.03.20.14.05.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 14:05:41 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
To: Yong Qin <Yong.Qin@cypress.com>,
 "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 James Tomasetta <James.Tomasetta@cypress.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
 <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
 <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
 <9fcc328f-ae13-a294-a56c-0b5a6247b26a@norrbonn.se>
 <64b52a54-94a0-4b0b-683c-41eb07d5b09a@microchip.com>
 <37e1a622-1bb9-0104-c35d-8d7b6c6fcd73@norrbonn.se>
 <5d342253-1ca2-4673-7560-6698cc71696e@microchip.com>
 <71b64bdf-73f7-03b7-14a6-5fb2750b84a1@norrbonn.se>
 <BYAPR06MB589357713279CE756A65B3238F410@BYAPR06MB5893.namprd06.prod.outlook.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <70900b50-a772-35d0-a055-2cbced574be9@norrbonn.se>
Date: Wed, 20 Mar 2019 22:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <BYAPR06MB589357713279CE756A65B3238F410@BYAPR06MB5893.namprd06.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_140545_775535_F8D91759 
X-CRM114-Status: GOOD (  32.46  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 20/03/2019 19:56, Yong Qin wrote:
> Hi Jonas, Tudor,
> 
> I think Tudor described is a reasonable use case scenario.
> 
> BPNV bit default value is 0, which means BP0-2 bits are default Non-Volatile. In this case, BPNV bit does not need to be set. After the flash chip mounted on PCB board with WP# grounded, all need to do are: Program data into flash --> Set BP0-2 to 1 --> Set SRWD to 1, then both SRWD bit and BP0-2 bits are locked-down, unless disconnecting WP# from grounding. Reset will not change SRWD bit and BP0-2 bits since they all are Non-Volatile.

OK, my own use case is causing me to get confused over the volatility of 
these bits.

The use case I have is the following:
a)  The flash must be write-protected at power on
b)  The flash may be made writable by an authorized actor

So the idea is to do this:
i)  Set BPNV to 1 so that BP0-2 get reset to 1 at power on
ii)  WP# is asserted at power on (effectively grounded)
iii)  Authorized actor invokes action to de-assert WP#
iv)  BP0-2 bits can now be modified freely and flash is writable
v)  Authorized actor may invoke action to assert WP# but if that doesn't 
happen and the system gets restarted at least the flash will not be 
writable when it is restarted

Control of the BP bits in Linux is via stm_lock and stm_unlock.  These 
functions also set and clear SRWD.  This breaks the above use case 
because when the device is unlocked, SRWD is cleared, and then device is 
not protected after a power cycle.

Suggestions?  Can we separate the manipulation of SRWD from the 
manipulation of the BP bits without breaking existing users?

/Jonas

> 
> Best Regards,
> Yong
> 
> -----Original Message-----
> From: Jonas Bonn <jonas@norrbonn.se>
> Sent: Wednesday, March 20, 2019 3:40 AM
> To: Tudor.Ambarus@microchip.com; Yong Qin <Yong.Qin@cypress.com>; James Tomasetta <James.Tomasetta@cypress.com>
> Cc: bbrezillon@kernel.org; richard@nod.at; marek.vasut@gmail.com; linux-mtd@lists.infradead.org; computersforpeace@gmail.com; dwmw2@infradead.org
> Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
> 
> 
> 
> On 20/03/2019 08:33, Tudor.Ambarus@microchip.com wrote:
>>
>>
>> On 03/20/2019 09:06 AM, Jonas Bonn wrote:
>>> External E-Mail
>>>
>>>
>>>
>>> On 20/03/2019 07:33, Tudor.Ambarus@microchip.com wrote:
>>>> Jonas,
>>>>
>>>> On 03/19/2019 09:13 AM, Jonas Bonn wrote:
>>>>>
>>>>> On 19/03/2019 07:59, Tudor.Ambarus@microchip.com wrote:
>>>>>> Jonas, Yong,
>>>>>>
>>>>>> On 03/12/2019 09:27 PM, Yong Qin wrote:
>>>>>>> Hi Tudor,
>>>>>>>
>>>>>>> Good question.
>>>>>>>
>>>>>>> The WP# function is not available when the Quad mode is enabled (CR[1]=1). The WP# function is replaced by IO2 for input and output during Quad mode. With that said, if CR[1] is set to 1 (Quad mode enabled), the registers will not be protected.
>>>>>>>
>>>>>>> Technically default SRWD bit can be set as either 0 or 1. However, as most customers (applications) don't use this feature to protect registers, the default SRWD bit set to 0 might be a better choice, and reserve the option to change to 1 for the applications do need this feature.
>>>>>>
>>>>>> I think I found the reason why SRWD bit is configurable, and
>>>>>> disabled by
>>>>>> default: => to allow the installation of the flash in a system
>>>>>> with a grounded WP# pin while still enabling write to the BP bits.
>>>>>
>>>>> I think this is bogus.  Why would you ground the SRWD pin?  That's a design error.
>>>>
>>>> I've talked with Microchip hardware team, we have this feature on sst26 flashes too.
>>>>
>>>> Grounding WP would not necessarily be a design error. The intention
>>>> is that some users might choose to populate the Flash chip onto
>>>> their PCB, program the memory in-circuit, and then lock down the write protection to use the chip like a ROM.
>>>> Grounding WP allows them to do this. Since SRWD is set to '0' from
>>>> the factory, so users can program the memory, set the block
>>>> protection (BP) bits to protect the memory, and then set the SRWD
>>>> bit to enable the grounded WP input and prevent changing the BP bits.
>>>
>>> Again, this is bogus.  The SRWD bit is non-volatile so just resetting the flash clears the bit and the BP bits can be changed.  This does not magically turn the flash into a ROM.  Grounded or not, the WP# is NOT respected until the SRWD bit is set; what you've described is yet another reason to default the SRWD to set.
>>
>> SRWD is a non-volatile bit: default at power-up will be the setting
>> prior to power-down.
> 
> Ah, right you are! :)
> 
> By grounding the WP# pin, you are effectively turning the SRWD bit into an OTP bit.  Note that what you described above also requires setting the BPNV bit, otherwise protection is irrevocably reset to "unprotected"
> at reset.  The BPNV bit cannot be set from Linux so whoever is using the "grounded pin" method must be programming the board in-factory from another system than Linux.  Therefore it's OK for Linux to default SRWD to asserted, irregardless of the state of WP#.
> 
> /Jonas
> 
> 
> 
>>
>> Cheers,
>> ta
>>
>>>
>>> With the BPNV bit (see patch 3 that I posted in the v2 series), at least the flash can be made to start up write-protected; however, there is nothing preventing modification of the PROTection bits until SRWD is set AND WP# is asserted (through grounding or otherwise).  Linux currently defaults SRWD to cleared which is "unprotected", irregardless of the state of WP#.
>>>
>>>>
>>>> The grounded WP pin + SRWD bit method is an older, legacy approach
>>>> to the problem. We don't know how many users actually ground the WP
>>>> pin in this manner, but there are probably some users out there who do.
>>>
>>> If they do so, they are fooling themselves... or they are running a
>>> patched kernel! :)
>>>
>>> /Jonas
>>>
>>>
>>>
>>>
>>>>
>>>> Cheers,
>>>> ta
>>>>
>>>>>
>>>>> /Jonas
>>>>>
>>>>>>
>>>>>> Jonas, Yong, what do you think?
>>>>>>
>>>>>> Cheers,
>>>>>> ta
>>>>>>
>>>>>>>
>>>>>>> Thanks,
>>>>>>> Yong
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
>>>>>>> Sent: Tuesday, March 12, 2019 5:30 AM
>>>>>>> To: Yong Qin <Yong.Qin@cypress.com>; jonas@norrbonn.se; James
>>>>>>> Tomasetta <James.Tomasetta@cypress.com>
>>>>>>> Cc: linux-mtd@lists.infradead.org; bbrezillon@kernel.org;
>>>>>>> richard@nod.at; marek.vasut@gmail.com;
>>>>>>> computersforpeace@gmail.com; dwmw2@infradead.org
>>>>>>> Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect
>>>>>>> write-protect input
>>>>>>>
>>>>>>> Hi, Yong,
>>>>>>>
>>>>>>> Thank you for the explanation. There are still few things to clarify.
>>>>>>>
>>>>>>> On 03/11/2019 10:14 PM, Yong Qin wrote:
>>>>>>>> SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.
>>>>>>>>
>>>>>>>> By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).
>>>>>>>>
>>>>>>>> If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.
>>>>>>>
>>>>>>> Does the SRWD bit protect the Status and Configuration Register bits even when in Quad Mode? WP# function is not available in Quad mode. How can one release this protection when in Quad Mode and SRWD set to 1?
>>>>>>>
>>>>>>> If SRWD bit is ignored in Quad Mode, then why didn't Cypress enable Status and Configuration Register bits protection by default? I.e., remove SRWD bit from SR1, make BIT(7) a NOP, and consider the Status and Configuration Register bits protection enabled by default when not in Quad Mode.
>>>>>>>
>>>>>>> Cheers,
>>>>>>> ta
>>>>>>>
>>>>>>> This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
>>>>>>>
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
