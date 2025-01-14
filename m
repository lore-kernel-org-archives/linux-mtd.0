Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB9DE77188
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NU5MPv0rkwTcg4pWYGl8MYLAJiXUDZvhHbsJIRq5GTI=; b=0eDBJ9msWJnev/
	3Ry0QPhTG8OpLsfnrSmmWIQFTBe+DXTO7LJW8kR0Yf4/s5kZRyfCqAbg2cod/ItoRnpSKiXGZT96l
	McUKzFmzFuUx4egVYrMTAGHUjXJ/1JMWAoraV14fXVDVWPFq80IrrzImRfFavQA2cAgrc/QGz0BD+
	GdArBH3rBZTNhd/GB5xNb6A03wYxA8/j9mAnQM7bFDjDNnWyf5ofXyfWW/RYlLKWSEz9TnulW+5Y6
	IjFk/fGyTkD/apT+Nqum1eFfWm9rfxjVP42vaX83ew/bBpMNKtKtqDmTqdy5XEX4+5psHyTU/fdIc
	ctm7LHsgONzaSKBUmVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgwY-00000008WHp-2EX7;
	Tue, 14 Jan 2025 13:26:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXgwW-00000008WGL-0WDN
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 13:26:53 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so9165902a12.1
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2025 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736861210; x=1737466010; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SwP1fWlfGGErtp8bBZm5i5ifr1nN44Oj3Q18CXqmO5A=;
        b=TbbCf1Pd9EFzBurAzbLFIFggYH+gJOx6X39WV7YHaIO0usbjLuwh2gmL/bL2p53ty0
         EiUsmN5XV242dE12KdGyjCqDOaPy+PWQBpHU0uKaU2i8B6m7z9L8seAJkDfyPkosTsEE
         MVuyKtYY1FICUJXppDovySqwcVtoMCCi/uX+PH8VH4SHfJ8F2oD+YYa2zW1coOMafRu/
         jEeDZDQwh8WwHCRRSX3cvrjASGKR8Ee60CuPkZJUnyj9j08NfBnwDXi1KGpZ8yXjcaZa
         8oHJkce+bscPP2GKmWNzRGnj5k6BGkLt7YCKqh9kKpn3EPztrTBKcgWVI+3pvM3bA2hG
         wKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736861210; x=1737466010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwP1fWlfGGErtp8bBZm5i5ifr1nN44Oj3Q18CXqmO5A=;
        b=VzNW04faMUqcXlTcNb8FESJ2muhKn+2WgKBOrPqlXaYzQwgWfqFi0VXM3i5R8uVeIH
         tywYyNc5Hastt4+yYViaUJhZFXx+F5G3vdWbWVG565EkUkT//bao1D5JyBkxaRtnMT8c
         DNLcq7WrIr0i1qB/272+GFr2i+/ubR65roMn3LJHA+b17Vz1T5dfZCo/sWZ3ZOU+eHbD
         IfyqkVdWROKd2EPBAlymxjso+beCBe73zp8JLRc7ru7SYOOhxw9gEGTu2PAd5PvHiuy1
         A/MwHAbYfz7Jion6pCh4R9o/rcfo1gPzO3nb6bshYu+6hPrWclGlfJ9pwTanAVq2KHbJ
         CoPw==
X-Forwarded-Encrypted: i=1; AJvYcCUrCVHJVK7S3h/BtGWET8h/kwJKoYxeO+51Wl3oNRiuHqj949GHFl+lqB3K7UgDuwbOM9p8c3lBlCw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEKuZPFHo3dlz9tGBDd3UjHd10SBA6m+5fnng4BoRVbXFeMM9M
	PFqlzWrbsfVN1PZ+U50WEV3QV6pRdZKtCPPlydPpWi392Z9gwhbdhwMT1nNw8Cw=
X-Gm-Gg: ASbGncs/Wj4L5rvYBGUVFj49FM3FmpnA1w09YXvEi4kYzcXO7lmsDhgQWcMU78rOUT6
	5S0lQQpcDPD3ZzQkhxpRaywFRuJ4H5iyppgy8Hr/Q4VAt0/O5/+5YExeJTSPpijwPJKDLqTaQqR
	XKGehZIIVdO5OWhnVVK7W/8T5LvAPHfZCxiiqOdjw1cQOctZpEw5Yr4etlOafobOmX85ZMxh39M
	13bs719YSfMpfmaAmJs6Iv8P2ZSMhMfPg0/dQgN7lXn6FXdN6UywRS5a05nJc6k4Q==
X-Google-Smtp-Source: AGHT+IHiyC46xplGJdklMtXND7RjzCQWOyPJKK3BjZRR0yKKUaFCWD64tUVUuhFaBnEGxcCpqnwQ7w==
X-Received: by 2002:a05:6402:5187:b0:5d9:adb:4692 with SMTP id 4fb4d7f45d1cf-5d972e06b4cmr23050698a12.9.1736861209943;
        Tue, 14 Jan 2025 05:26:49 -0800 (PST)
Received: from [192.168.0.14] ([188.26.60.120])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99008c496sm6287162a12.16.2025.01.14.05.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 05:26:49 -0800 (PST)
Message-ID: <a6a9dfce-6cac-4831-9c96-45471f5ee13a@linaro.org>
Date: Tue, 14 Jan 2025 13:26:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
To: Alexander Stein <alexander.stein@ew.tq-group.com>, pratyush@kernel.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org,
 Cheng Ming Lin <linchengming884@gmail.com>
References: <20241112075242.174010-1-linchengming884@gmail.com>
 <20241112075242.174010-2-linchengming884@gmail.com>
 <3342163.44csPzL39Z@steina-w>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <3342163.44csPzL39Z@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_052652_217576_71FC54F2 
X-CRM114-Status: GOOD (  21.50  )
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



On 1/14/25 12:57 PM, Alexander Stein wrote:
> Hello everyone,

Hi,

> 
> Am Dienstag, 12. November 2024, 08:52:42 CET schrieb Cheng Ming Lin:
>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>
>> The default dummy cycle for Macronix SPI NOR flash in Octal Output
>> Read Mode(1-1-8) is 20.
>>
>> Currently, the dummy buswidth is set according to the address bus width.
>> In the 1-1-8 mode, this means the dummy buswidth is 1. When converting
>> dummy cycles to bytes, this results in 20 x 1 / 8 = 2 bytes, causing the
>> host to read data 4 cycles too early.
>>
>> Since the protocol data buswidth is always greater than or equal to the
>> address buswidth. Setting the dummy buswidth to match the data buswidth
>> increases the likelihood that the dummy cycle-to-byte conversion will be
>> divisible, preventing the host from reading data prematurely.
>>
>> Fixes: 0e30f47232ab5 ("mtd: spi-nor: add support for DTR protocol")
>> Cc: stable@vger.kernel.org
>> Reviewd-by: Pratyush Yadav <pratyush@kernel.org>
>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>> ---
>>  drivers/mtd/spi-nor/core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f9c189ed7353..c7aceaa8a43f 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -89,7 +89,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>  		op->addr.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>>  
>>  	if (op->dummy.nbytes)
>> -		op->dummy.buswidth = spi_nor_get_protocol_addr_nbits(proto);
>> +		op->dummy.buswidth = spi_nor_get_protocol_data_nbits(proto);
>>  
>>  	if (op->data.nbytes)
>>  		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
>>
> 
> I just noticed this commit caused a regression on my i.MX8M Plus based board,
> detected using git bisect.
> DT: arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts
> Starting with this patch read is only 1S-1S-1S, before it was
> 1S-1S-4S.
> 
> before:
>> cat /sys/kernel/debug/spi-nor/spi0.0/params
>> name            mt25qu512a
>> id              20 bb 20 10 44 00
>> size            64.0 MiB
>> write size      1
>> page size       256
>> address nbytes  4
>> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP
>> | HAS_SR_BP3_BIT6 | SOFT_RESET
>>
>> opcodes
>>
>>  read           0x6c
>>  
>>   dummy cycles  8
>>  
>>  erase          0xdc
>>  program        0x12
>>  8D extension   none
>>
>> protocols
>>
>>  read           1S-1S-4S
>>  write          1S-1S-1S
>>  register       1S-1S-1S
>>
>> erase commands
>>
>>  21 (4.00 KiB) [1]
>>  dc (64.0 KiB) [3]
>>  c7 (64.0 MiB)
>>
>> sector map
>>
>>  region (in hex)   | erase mask | overlaid
>>  ------------------+------------+----------
>>  00000000-03ffffff |     [   3] | no
> 
> after:
>> cat /sys/kernel/debug/spi-nor/spi0.0/params
>> name            mt25qu512a
>> id              20 bb 20 10 44 00
>> size            64.0 MiB
>> write size      1
>> page size       256
>> address nbytes  4
>> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_4BIT_BP
>> | HAS_SR_BP3_BIT6 | SOFT_RESET
>>
>> opcodes
>>
>>  read           0x13
>>  
>>   dummy cycles  0
>>  
>>  erase          0xdc
>>  program        0x12
>>  8D extension   none
>>
>> protocols
>>
>>  read           1S-1S-1S
>>  write          1S-1S-1S
>>  register       1S-1S-1S
>>
>> erase commands
>>
>>  21 (4.00 KiB) [1]
>>  dc (64.0 KiB) [3]
>>  c7 (64.0 MiB)
>>
>> sector map
>>
>>  region (in hex)   | erase mask | overlaid
>>  ------------------+------------+----------
>>  00000000-03ffffff |     [   3] | no
> 
> AFAICT the patch seems sane, so it probably just uncovered another
> problem already lurking somewhere deeper.
> Given the HW similarity I expect imx8mn and imx8mm based platforms to be
> affected as well.
> Reverting this commit make the read to be 1S-1S-4S again.
> Any ideas ow to tackling down this problem?
> 

My guess is that 1S-1S-4S is stripped out in
spi_nor_spimem_adjust_hwcaps(). Maybe the controller has some limitation
in nxp_fspi_supports_op(). Would you add some prints, and check these
chunks of code?

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
