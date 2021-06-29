Return-Path: <SRS0=bXaR=LX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEEDC11F66
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 07:43:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2507761DAC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jun 2021 07:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2507761DAC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fJ2DbTnQWvegjbo4WRCNfCKhKPmLrUImjOB0IDkTLPM=; b=ALX1voBmT4PVmBG3g7U5IMaDLd
	VXt+ArcdY+E2iIqHDZbAvN0tUUUigN/JChK1riFTjdct7N/F+pboeB0bUcW9k0GLXRNU8fFLA7yKD
	p5I9mESa9HmoxpipXLW9gaYistBXGbHg/SA61KnJ40LERCuOv/r+ZlLqtrVWpBN++F1qz5wEpHRMU
	jaMAf+6l+yoPyJWJE4oXTdJ3SPfeQbsPkfBViVnfZ2n7Q1RM9mjq39c58qx73+75v6VE+YO6pJpw0
	S7tSTljuAob9t3/nZlDwjklajwT6ACG4JsvLaw7t3irU9hAuJzV2GSLyTbqihG4u5ArIqIb9iyEmu
	vtQxIOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly8O1-00A5DA-4b; Tue, 29 Jun 2021 07:42:25 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly8Nx-00A5Az-Cd
 for linux-mtd@lists.infradead.org; Tue, 29 Jun 2021 07:42:23 +0000
Received: by mail-lf1-x12e.google.com with SMTP id q16so23615550lfr.4
 for <linux-mtd@lists.infradead.org>; Tue, 29 Jun 2021 00:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FReXYEj5Ibwbff/u+KhknD1QWDTjlXsVnChFbqLOhzY=;
 b=JYxocqHRpwAlODdbmKohYKIbIbv71wQb1E1PD3TTEuDq7X6IDLfJhT38RIp2gfV3hJ
 +K9HtXpO1GVXxKvBaYBWotimOv0iH3VVdA6U5z7IMHXT9O36/aTZl8gkoVBuy4aK0+lf
 CogXeLJKTeMX4VnH1KJOgm/Qt949H69ANb//8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FReXYEj5Ibwbff/u+KhknD1QWDTjlXsVnChFbqLOhzY=;
 b=DbpIIX1VE0VP3BfY7u4tD/vRYVyiZ5zmTPyiCVba3vd6EEW7+nc9rLKD98kVjN3wCB
 gWdggg52zyCbynKatycnapacXRo4P3bgyPtOaK0qhhzUnlsZX2iBYYUPlJcZ2o2aF/SW
 y5+VpCL1PG7nFAjyKuC3G02egh1MZGSVdVfSLSWyNyTIJwWGd/rdwZ6R2fcOTz+6xCzb
 qzKJNbGrX+4PZCHqF8rsslZufJgERtJjpPWjzyL1332c202xDRa2bv9iUr+wYDmq1r0A
 xbQs/VimaoFG/0aop+b89d58jIGoENKlRf6rxUMBvOrT1V+iqFv3eRfqoTy5xmKs5RdC
 rfpA==
X-Gm-Message-State: AOAM533uC9ovqsmeCc0J3wTnX3DYMkAJD7YrUzFTmPKrXS7Y1p8wgnKr
 xoT70cnUJwAoQbh2ChaCET5Xvw==
X-Google-Smtp-Source: ABdhPJx4K79rey9K8oNZe5ijOraDJkthIobaetoIDQkQuUqCbAIcqDNzGnf4fli1hC8Ko7Ft6nZ9Pw==
X-Received: by 2002:a05:6512:b8e:: with SMTP id
 b14mr22374104lfv.287.1624952538027; 
 Tue, 29 Jun 2021 00:42:18 -0700 (PDT)
Received: from [172.17.20.254] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id e20sm1735414ljk.67.2021.06.29.00.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 00:42:17 -0700 (PDT)
Subject: =?UTF-8?B?UmU6IOWbnuS/oTogUmU6IFtSRkMgMi8zXSBtdGQ6IHNwaS1ub3I6IGNv?=
 =?UTF-8?Q?re=3a_compare_JEDEC_bytes_to_already_found_flash=5finfo?=
To: Tudor.Ambarus@microchip.com, jaimeliao@mxic.com.tw, michael@walle.cc
Cc: bbrezillon@kernel.org, esben@geanix.com, frieder.schrempf@kontron.de,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 masonccyang@mxic.com.tw, p.yadav@ti.com, ycllin@mxic.com.tw,
 zhengxunli@mxic.com.tw
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
 <20210621152320.3811194-3-linux@rasmusvillemoes.dk>
 <223232ecd0865e819477f17cd464ab08@walle.cc>
 <OF7CD5328D.D33B2BE2-ON482586FD.0027BCF2-482586FD.00280249@mxic.com.tw>
 <dcd4e64f-348c-fadd-1044-61c7b6fa93c8@microchip.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <1767e220-b76f-a661-b274-7fec3e7dd8b5@rasmusvillemoes.dk>
Date: Tue, 29 Jun 2021 09:42:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <dcd4e64f-348c-fadd-1044-61c7b6fa93c8@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_004221_653693_E2C44F28 
X-CRM114-Status: GOOD (  14.81  )
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

On 23/06/2021 10.33, Tudor.Ambarus@microchip.com wrote:
> On 6/23/21 10:17 AM, jaimeliao@mxic.com.tw wrote:
>> You don't often get email from jaimeliao@mxic.com.tw. Learn why this is important<http://aka.ms/LearnAboutSenderIdentification>
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> Hi Michael and Rasmus
>>
>>
>>>
>>> Re: [RFC 2/3] mtd: spi-nor: core: compare JEDEC bytes to already
>>> found flash_info
>>>
>>> [+ some people from MXIC as they are ones who posted to the ML
>>> lately. Feel free to forward this mail to the corresponding people.]
>>>
>>> Am 2021-06-21 17:23, schrieb Rasmus Villemoes:
>>>> Macronix engineers, in their infinite wisdom, have a habit of reusing
>>>> JEDEC ids for different chips. There's already one
>>>> workaround (MX25L25635F v MX25L25635E), but the same problem exists
>>>> for MX25L3205D v MX25L3233F, the latter of which is not currently
>>>> supported by linux.
>>>>
>>>> AFAICT, that case cannot really be handled with any of the ->fixup
>>>> machinery: The correct entry for the MX25L3233F would read
>>>>
>>>>         { "mx25l3233f",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K |
>>>> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ ) },
>>>>
>>>> while the existing one is
>>>>
>>>>    { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
>>>>
>>>> So in spi_nor_init_params(), we won't even try reading the sfdp
>>>> info (i.e. call spi_nor_sfdp_init_params), and hence
>>>> spi_nor_post_sfdp_fixups() has no way of distinguishing the
>>>> chips.
>>>>
>>>> Replacing the existing entry with the mx25l3233f one to coerce the
>>>> core into issuing the SPINOR_OP_RDSFDP is also not really an option,
>>>> because the data sheet for the mx25l3205d explicitly says not to issue
>>>> any commands not listed ("It is not recommended to adopt any other
>>>> code not in the command definition table, which will potentially enter
>>>> the hidden mode.", whatever that means).
>>>

> Do any of these flashed define an extended ID, i.e. more that 3 bytes of ID?
> Rasmus, would you please try to read more bytes of ID?
> 

No, neither mx25l3205d nor mx25l3233f do according to their data sheets.

And when actually reading more bytes, one gets as expected just the c2
20 16 repeating all over.

Rasmus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
