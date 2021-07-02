Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24CCC11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5864D61413
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 13:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5864D61413
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wb0snZ2MjKWzuRTqXqouVoRK0okPv9zc4+0z4sSC4/0=; b=a15vtuNCLNRZ6gmvewYqcIjbYt
	lbwS5lBCRk52FfUAihsjeqLjzbAvm6oGoeMdb0pH6PGybpRwhos1WtrO9UGjQH3U2HQ8SFLbZoFJB
	+MbnV+P5+pXOFJVES21TaLXe4J5wTlgp+eCcWDiVilnjCh4SWifhRt9RlDurvWCtU56zA2e0dxQaU
	EUmo7mpHIAq+nVakGQg5TVWbztwRJFqy27bzCA+rq1QHfrP1i8I3MCy9UBcCa9mJEZ8TQ96snDt5W
	cjTJfxCa9mUpf2S48meHFikV8CcTpqNbLqG66TdEEJMknYrrft2YCA5He2IG0vzvlykGGnQ20aFat
	4EpPOglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJ3M-0035Qd-U3; Fri, 02 Jul 2021 13:17:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJ3J-0035PV-Mz
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 13:17:55 +0000
Received: by mail-ej1-x62c.google.com with SMTP id gn32so16139600ejc.2
 for <linux-mtd@lists.infradead.org>; Fri, 02 Jul 2021 06:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LnNGuurTFcfXm5aa2EG6X8kagXccnixUpuxFIcjTuz0=;
 b=edP3fyfaFDARH/bC6v6yR9Ik3v1NUo8K3ML3aozcZE1Tv9cxfAo+XRdQI3hfcZWQHY
 Iqso1SM4UFryefV1FfQkkEJngAetM3B3/ZX7j/hrVgO3Kmz7TI9wEhHAexx/eioBnljQ
 d3KwfAS5LsdPUmjTbnuElXdHKK6enm/ZA/eJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LnNGuurTFcfXm5aa2EG6X8kagXccnixUpuxFIcjTuz0=;
 b=nKaVGsKc0QjOWNyylrnVpHDx7WzrDMdNlB/UpYAbf++ZNClv9Tao+NrQ2ewqHutkhQ
 hZMIP9XA18dU4v0UEjjwgCJmIKNKYRsgPZghhsVqWcHm5RduC+bODk0DlrBRFdS1d6MP
 MSrgRtL7U/nwLMGBImCk9DD8LcET6PiXv+pHSngXOTHzhkwyPHCU7A3/oyDaAIzEBGOK
 YzbIVs9epgDfwGzKMAGVPbGInKeSabs9EqMP4utEa/Y9e+flEGFZXzFFMy/eFvserok+
 95m6RxuzG54tfgE9EJsbVlNnRam2I8NWgoVtwZhj1nlViN/Ns6tfw6ajjUhW6HDSYaX7
 27oA==
X-Gm-Message-State: AOAM530EnuPu9IGYVmxdTw0PqFeuegZEpAt2Tu98p43oGeyW13PXXP94
 gyrIk1Nw+l56zL+7KDXac5dMQA==
X-Google-Smtp-Source: ABdhPJzzd/ACmxPyjfnwAm8N8fL+x7GirV8yudNkjWzN6q3+dLWU7CtEEzo7TTobHL8NWQ33Cw8LNA==
X-Received: by 2002:a17:906:25d5:: with SMTP id
 n21mr5368482ejb.156.1625231869483; 
 Fri, 02 Jul 2021 06:17:49 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.64.110])
 by smtp.gmail.com with ESMTPSA id md14sm1053651ejb.125.2021.07.02.06.17.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jul 2021 06:17:48 -0700 (PDT)
Subject: Re: [RFC 2/3] mtd: spi-nor: core: compare JEDEC bytes to already
 found flash_info
To: Tudor.Ambarus@microchip.com, michael@walle.cc
Cc: linux-mtd@lists.infradead.org, frieder.schrempf@kontron.de,
 bbrezillon@kernel.org, p.yadav@ti.com, linux-kernel@vger.kernel.org,
 esben@geanix.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw,
 masonccyang@mxic.com.tw, ycllin@mxic.com.tw
References: <20210621152320.3811194-1-linux@rasmusvillemoes.dk>
 <20210621152320.3811194-3-linux@rasmusvillemoes.dk>
 <223232ecd0865e819477f17cd464ab08@walle.cc>
 <d43f021d-8f95-7857-b70b-91e22b0a8e2a@rasmusvillemoes.dk>
 <d1473b12-daea-e5e8-b8d5-64084bfbe11c@microchip.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <63c61200-2387-6f92-32a0-38baf7317cdf@rasmusvillemoes.dk>
Date: Fri, 2 Jul 2021 15:17:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d1473b12-daea-e5e8-b8d5-64084bfbe11c@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_061753_977949_E0FFF6DB 
X-CRM114-Status: GOOD (  32.96  )
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

On 23/06/2021 08.46, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> On 6/22/21 11:58 PM, Rasmus Villemoes wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 22/06/2021 13.57, Michael Walle wrote:
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
>>>>     { "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
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
>>> Maybe we should ask Macronix if it is safe to send the RDSFDP command.
>>> Can anyone from MXIC comment this?
>>
>> Yeah, that would be useful to know, but I don't have any hopes
>> whatsoever of Macronix engineers being able to help sort out the mess
>> they've created by reusing IDs in the first place. They don't seem to
>> understand how that can possibly be a problem.
>>
>> I, and my client, have contacted them on several occasions to ask how
>> we're supposed to deal with that. At one point, the answer was
>> "MX25L3233F support Serial Flash Discoverable Parameters (SFDP) mode,
>> MX25L3205D does not support.", but when I asked the obvious follow-up
>> ("but the MX25L3205D datasheet warns against doing RDSFDP or any other
>> not explicitly allowed command"), I got no response.
>>
>> Another response was
>>
>> "I can only comment on Linux 4.4, as that is the only version that I
>> have supporting material for. Basically we have a patch for MTD/SPI-NOR
>> (see attached). This is to allow allow the MTD subsystem to cope with
>> devices that have the same ID (see below first paragraph of application
>> note attached). Please note that the MX25L3205D had an EOL notification
>> on 14th May 2010."
>>
>> and that attached patch is a 173KB .patch file that made me taste my
>> breakfast again.
>>
>> And they keep repeating the argument that when a chip is EOL, it's OK to
>> reuse its ID (because obviously nobody have used that chip in a product
>> that would receive OS updates, so any OS released later than that EOL
>> date can just include support for the newer chip and drop the old one...).
>>
>>>> In order to support such cases, extend the logic in spi_nor_read_id()
>>>> a little so that if we already have a struct flash_info* from the name
>>>> in device tree, check the JEDEC bytes against that, and if it is a
>>>> match, accept that (device tree compatible + matching JEDEC bytes) is
>>>> stronger than merely matching JEDEC bytes.
>>>
>>> This won't help much without a proper dt schema. No in-tree devicetree
>>> could use is because the DT validation would complain.
>>
>> I can certainly extend the regexp in jedec,spi-nor.yaml to match this
>> new one. DT is supposed to describe the hardware, so I can't see how
>> that could possibly be controversial.
> 
> No, please don't go that path yet.
> 
>>
>>  So if this will
>>> go in (and the maintainers are rather hesitant to add it, I tried
>>> it myself [1]), you'd also need to add it to jedec,spi-nor.yaml and
>>> get an ack from Rob.
> 
> I'm not hesitant, I'm keeping my NACK until we're sure there isn't any other way
> to differentiate at run-time. 

It seems that we have established that by now, right?

Rasmus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
