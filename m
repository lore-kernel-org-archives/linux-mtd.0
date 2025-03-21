Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C6BC35FF3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Mar 2025 07:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PQHxDW/ZpevhVJtvxBlgzaYj83Ka+Y7JxewoFnuwMg=; b=FjPIJ6mYAhvryr
	qOLA/sDf6i25KbvePIb+BYICMdENB1zLDyjF3nGv2tlZFYciX1bPLW+/b/Gu+EZ7vNmHQDuI0bXNv
	AkgPWDy/sBYN8DjOwFLl3kQPKDmmt7yGtuU0f1zw/mV6mn9FQUbEETHqNYz2eHn/8+rr5T9YrkbDb
	H6OlXybTXdHRrawYWtNOmeTrWiMs8gcg0ZAGZEGgBp5HGO37gh62jUQjer0f7yN3+D7+leD4rIdDZ
	sC0c0q0W1OKLlAvW4qf8BT66FMnTfgKSMsZMj3VX6gp22SIO9J+hx3wsQ/JPdvxHodYsvNTxYC5c0
	cu3RjVja69BuxNzimhKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWX7-0000000E4FR-1vuL;
	Fri, 21 Mar 2025 07:11:09 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWX1-0000000E4F2-4AMN
	for linux-mtd@lists.infradead.org;
	Fri, 21 Mar 2025 07:11:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3914a5def6bso961214f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2025 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742541062; x=1743145862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F+k0bBxJrWknfpCCY6jrjqLCimQ9SIMuvuSKup5q//c=;
        b=em6Aa6jjvETaiPlZVsZuIm8mUdCtpkEeX9MrRSSO8uve33XOeWr2yuCwuwrIeuX1tv
         1rODLBb1X/BWc8md5CYvFJSJ76fJaTxJgL7/URfydYsh9odxftciE0fqjK3ZwJrV05pC
         6r4DveV4XEbDV7PuQX+cgpZpqkTOQOOTSGqSup16ZRYXDrtHvDbtAFDnAtK99YcVcRbj
         w6GFWHwoX1v8XoUdkbK73DJs17ul/iFoTzq36uhOI7/nned7XgiqOKy91QZtbRhGwb0B
         jcKBXj2zTuyKck7Ce42S7/UGWMS1EgHY/IGazFqzYKS13NHPx8VTOhzYwWyJxSWRun5y
         02aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742541062; x=1743145862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F+k0bBxJrWknfpCCY6jrjqLCimQ9SIMuvuSKup5q//c=;
        b=Vf75yVPO//q0KtaYObQJZecL8IRvQLG45Vgv4NTfwOJLXRfi1F+sL8GU+yjbD51tvy
         +GH8YHZXukqjJYX6+KEGV6ThSx2TUPqS2Ee846vBNlWMk27p4G82ltuOBNWbIJKs9Tdc
         e/j1EwV8xNV+gTDe+a9IW7DeRke3EIuF1+UhbVq9wVdYLI6arir/yzqkt6uHmM41nWny
         YaPeJGULCwkrHgsykz1+DErsFJIBMgRS5dgOlD6Zz++Ki3BIqFXxvT80raZMmhndAUAr
         BaHO10AAS0iIkRzPa2waV3Hir83/tDrhvWZ/J80kxIoLMKEivhhZBJH7rNYeOkA6f+bI
         YWDA==
X-Forwarded-Encrypted: i=1; AJvYcCXYlDphmKcIsHRPT+weWgY+NlU0u3dnIQEQSZvUk+CMN3iGxa1RuugBdaxoF5lDjdqcQ7hR8wRb5JU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ8TT47HSR/ul5L8rXKi3rAL6K4WniIjDHdFQssEGs2JNllqXJ
	DHDDd0iUvWiGzFsU7v1O/XVnk+x0PFLYGs9+zVE804ELtasrWVCjDd8YFo2oDhM=
X-Gm-Gg: ASbGncsM+Z09LLuPT7pc0feHOxYtlI/D4dGYdwRGphUgSQkcdQVMnqZ4pGrHXxkKmY+
	GctXxXkMtP3rDCYcEz806TtsdameVFtmnsGr6360EjqV4JXS/rHOHPyBR55NKfeqcjgnv2PXpq8
	zT28QuAGgbvRKrIyecOq9mF7GtDLmp9TnRytwStdOyiqH5JN9mxLTXE+decYCF8i2ZI47at5uoM
	4p8QW1FNZqktmMZVmzlJDqTyDNpClWabQkDaXihMD5unInSwwTnVllJ+zpNHP3hBDOdPz8yCD5q
	N1E5idftXbFsqiCW1nJhrn4hv+mmCbOoYg1ocohzLkXbJrJIcQjngi9UBX24eO+l
X-Google-Smtp-Source: AGHT+IFLLyWtNCurYN5IHsDLYjTJAeaz+9FTtagTbBiNXq0Igdg4GgDL7Yy06ujM541m3DzuhmXzAg==
X-Received: by 2002:a05:6000:184b:b0:391:3998:2660 with SMTP id ffacd0b85a97d-3997f8ee94amr1495646f8f.7.1742541062072;
        Fri, 21 Mar 2025 00:11:02 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b4ce9sm1594888f8f.53.2025.03.21.00.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 00:10:59 -0700 (PDT)
Message-ID: <3c176372-ad82-460f-979e-9bf1cf09d931@linaro.org>
Date: Fri, 21 Mar 2025 07:10:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for CY15V104QSN
To: LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: LEJEUNE Sebastien <sebastien.lejeune@thalesgroup.com>,
 LENAIN Simon <simon.lenain@thalesgroup.com>,
 RENAULT Xavier <xavier.renault@thalesgroup.com>
References: <87dbbbdfb2d54da781e4f8c5fa75851c@thalesgroup.com>
 <9ae9eaf4-bd5d-4902-9ca8-d83b9f326245@linaro.org>
 <ba593d13fad2419c9dba03fc001d599a@thalesgroup.com>
 <ceb81e52-3159-479b-9006-aae54a74fc3a@linaro.org>
 <a76c17aeb7a645b9a5adbc79c2337b16@thalesgroup.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <a76c17aeb7a645b9a5adbc79c2337b16@thalesgroup.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_001104_052743_F2B58986 
X-CRM114-Status: GOOD (  27.59  )
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



On 3/20/25 4:55 PM, LECOINTRE Philippe wrote:

>> I encounter some issue attempting to use the at25 driver.
>>> I am not able to read the flash ID with at25 driver because the chipselect
>> appear to be deselected between the RDID command and the read data. The
>> RDID command is not taken into account and the chip only reply with 0xff.
>>> With at25 driver, it use a spi_message containing two spi_transfer, one
>> spi_transfer for the command and one spi_transfer for the read data. For
>> some reason, this end up in .transfer_one() in the spi_controller driver of my
>> SoC.
>>
>> What spi controller driver, is it upstreamed?
> 
> The SoC use the upstream "snps,dw-apb-ssi" spi controller driver.
> 
>>
>>> With spi-nor driver, it use spi_mem_exec_op() which work well in my case.
>>> It appear at25 driver can currently be used with Cypress FM25 chip and
>> from some of the datasheet of this family it seems that the chipselect need
>> to be driven low during the entire RDID sequence.
>>> Am I missing something here ?
>>
>> Splitting opcode, address, dummy and data per spi_transfers shall work,
>> spi_mem_exec_op() does it too when the controller does not define
>> mem_ops.
>>
>> It probably just a bug somewhere, raising CS up between the transfers shall
>> be fine.
> 
> Using an oscilloscope with spi protocol decode, it is the big difference I can see.
> 
>>>
>>> Currently, the at25 driver assume a lot of property from the ID data
>> (manufacturer and size) which don't seems to be relevant with the
>> CY15V104QSN model.
>>> This chip is similar to cy15b104q and cy15v104q currently supported by spi-
>> nor driver.
>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/c
>>> ommit/drivers/mtd/spi-
>> nor/spansion.c?id=8a2644d5f3608822925c9204a3d19a
>>> 8e3025fd4a
>>
>> having those flashes in SPI NOR was a mistake. We can't just drop them as
>> we'll break backward compatibility.
>>
>>> Also, I don't have access to at25 spi eeprom to validate any deep
>> modifications on this driver if we need to do so according to the thread you
>> are pointing to.
>>>
>>> How can we handle this ?
>>
>> You need to figure out why your flash doesn't work as expected and fix it. Is
>> your controller spimem capable? If yes, try dropping the ctrl mem_ops and
>> see if it behaves sane using SPI NOR and the controller using spi transfers. If
>> it doesn't behave sane, then there's probably a problem into the controller
>> driver.
> 
> Good advice !
> I have commented out the dw_spi_init_mem_ops() function call in dw_spi_add_host() and I end up with the same result as at25 driver.
> spi-nor spi3.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff

Can you plugin a different flash and test?

What frequency are you running the flash? Do things improve if you run
it at 50 MHz for example?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
