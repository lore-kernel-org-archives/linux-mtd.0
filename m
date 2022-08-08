Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032DEC00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 06:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StP5W3qJBNDfgKXuwMGsame1/VJreQ4VipQQ8lecnHM=; b=GACIlmd+9brLTb
	3oZCsN5QrCstfRqNK7TzFyMhPAZ/ZZNyVffTgNHl5u0uNTwWGIrVmB1nUQ9gnxmQjnRMt1RcnxJWA
	2i5VtNcBcGe1r4rRRGlkr847J9xTSUdm2mPC22LyOTUgdf+y+pRoziO1U4jJC2iVGr3ENx7Rs8B7q
	7G78OUT4wBc+3bcSXM7nYKQxX86tAz9HWFYXhh1Y1iYXe8vegiJyvsj6eaf3BZMMtb/ZI9SdzBuK6
	fPT7DgMKWT3Nyzv6jutNPCeGaEgg5MhZEg4qGrEJhFo6CP2aBA9qK3WppZoZSE/OYO9yQqHRzwbut
	e4GDoPPo0U2TzAqRzocg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwRy-00BvUO-PS; Mon, 08 Aug 2022 06:41:18 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwRu-00BvPf-3m
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 06:41:16 +0000
Received: by mail-pg1-x529.google.com with SMTP id f11so7762994pgj.7
        for <linux-mtd@lists.infradead.org>; Sun, 07 Aug 2022 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=u3u95PDhwUT482boi97uu0aMk5ihOjo1TKil/oj4YgQ=;
        b=UNmUz0243VjbTSylrNw4SbokgUqUQsUjS43GcBumG4yBIoN5ZVI+TqdZ8FHrWZpgLX
         5AMSiQmOvFOiPi9s7GXHuu8aeDwUU2JuN7f7PIcuJM68sxXWP/p1+/wt2HWk90aSvROu
         mdFoPUp9fUvNJI3CqZ/tLm2qF8GhP6/rcI12RX+9MN2g51pvSLGkVBN6VwW3/+keEoNX
         0My6dWVkwjWcSWOMV8z6JlJ0+XEg0qAHROY7z30WoxFEOpSWqNfjP1ABSVocUvPHVfgO
         PeJKkMmAsM5nB/azCXb6Bo1VhhKMUchlF+uo/muA2G77agmozFLwqT18Mduua7mlaLHA
         YIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=u3u95PDhwUT482boi97uu0aMk5ihOjo1TKil/oj4YgQ=;
        b=1KeAHMtU3sfXp1MjQEWvdoR9Sl0jn3jlfZFEmnEhFr4UP6Vkl836GBzT9/OjgnJpt+
         it3C8rP2AcqZOnOW9pqHSLd071sqQ1QX4gNMmRUAYVDQGepw+HvQnLusb/A6eSsJyLDd
         7ulpt0xafPXFGDc56/iRfdrtXHdgjanE7VoqXsnAhnIcH/QRu1bk6UpDckcZJ8MtuC4o
         BoXizKrbRaspGvHizXj/eW7ozPAtsdObVEHZy7lSFA7scAsjfMuuJV/y7XJ8xFssaMyU
         j3ddgDfxcKVECe95kobBs9pCcc9l4Xde+SUP8O2O3oVig8KTRZ79erXdTAvnPKShx6aw
         0u6w==
X-Gm-Message-State: ACgBeo1OcPp5Iz+i8ssPh7H68CFXnygUdvk1NSc0clpOK52UM6iv/CUv
	IoV4T1cN8H0wgUye0Fule4U=
X-Google-Smtp-Source: AA6agR4R1/1Ssfl30Pm4LdBgIYgd4FEivSoN/pu0vxLIb65JjZA21Lt7iaiQ60umTY7hPN2nko/+Dw==
X-Received: by 2002:a05:6a00:216b:b0:52e:522b:ba4e with SMTP id r11-20020a056a00216b00b0052e522bba4emr17060432pff.61.1659940872293;
        Sun, 07 Aug 2022 23:41:12 -0700 (PDT)
Received: from [192.168.0.10] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id v8-20020a655c48000000b0041cc1c82436sm5624731pgr.70.2022.08.07.23.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Aug 2022 23:41:12 -0700 (PDT)
Message-ID: <4a182200-cff3-94e7-12a3-379638a52560@gmail.com>
Date: Mon, 8 Aug 2022 15:41:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, Bacem.Daassi@infineon.com,
 Takahiro.Kuwano@infineon.com
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
 <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
 <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
 <80b5e707-23b3-e357-c7ae-f78b6c75f2f6@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <80b5e707-23b3-e357-c7ae-f78b6c75f2f6@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_234114_262056_981C0799 
X-CRM114-Status: GOOD (  18.47  )
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

On 8/8/2022 3:08 PM, Tudor.Ambarus@microchip.com wrote:
> On 8/8/22 08:42, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
>>> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> Hi!
>>>
>>>>
>>>> s25hl02gt and s25hs02gt
>>>>
>>>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>>>> These parts are
>>>>   - Dual-die package parts
>>>>   - Not support chip erase
>>>>   - 4-byte addressing mode by default
>>>
>>> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
>>> only the first 128 Mb of die 1 can be accessed."
>>> So there are flashes of the same family that are by default in 3 byte address
>>> mode. You added support just for a subset of them and used a generic name,
>>> which is not accurate, right?
>>>
>> We added model #15 (3-byte address mode by default) to address special
>> requirement from a customer who needs to use bootrom with 3-byte addressing.
>> Anyway, I overlooked model # difference. Thanks for pointing out this.
>>
>>> Can we instead make an algorithm to determine the current address mode?
>>>
>> I have just found that we can distinguish model # via BFPT DWORD16.
>> If Hardware reset, Software reset, or Power cycle can exit 4-byte address
>> mode, that means the device is 3-byte address mode by default.
> 
> I don't think this will help us. It doesn't matter the default mode if you
> have a non volatile register that can be updated and changes the default
> mode.
> 
> Are there any registers/data that can be read successively in 3 byte addr mode
> and then in 4 byte addr mode? We'll then compare what we receive from the flash
> with a known value and determine the mode.
> 
As we discussed before [0], if address mode in the controller and device are
different, the read data will be undetermined.

But if we really want...
Compare SR1 data read by RDSR1(05h - No Addr) and RDAR(65h - Addr 0).
In most cases (without block protection), SR1=00h. The value of 00h would be
awkward to determine if this is 'real' output from Flash or not. So, use
WREN(06h) and WRDI(04h) that flips BIT(1) in SR1.

Therefore, something like:
1) RDSR1
2) RDAR with 3-byte addr (000000h)
3) If #1 == #2
	4) WREN
	5) RDAR with 3-byte addr (000000h)
	6) BIT(1) is SR1==1?
	...

Or simply WREN -> RDAR -> WRDI -> RDAR then check if only BIT(1) is toggled.

[0] https://lore.kernel.org/all/070bfe6a-00e8-1c59-c9db-52d249dfbcfe@microchip.com/

Thanks,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
