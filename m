Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47C3C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 01:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FoSssJlkbXZ9fIn5MekbeGQPyJ4SFuxTKsw2hydyyF0=; b=t8aTpJ5y7wqh9i
	zibZuS/VK/Cn6QSF5MeaEmaCuAC45FRj9jqIbGpDK04ARIjF0OHrniUh60o4COOL6hpt7X0hdpdPu
	EK06zUAVTyPp/hfVaZnAQFlOA0CwZYgUKWqKZKdGISBJomPsnhh0DXsC8CS7boxh9FvxsefMOpsRk
	Lyl9ad4gy16t/yjpZM7J8H+5/JfKc35RbJ2sOCZ4BmHcncEUUfinGLmv2ypd7T/s/4GZZXBfeo17r
	v+16W2t+W+cm9nklBtOlDCpl+jObGI7zh9X1pKz8JrqPwVUezm6UNbGKv3Ma8RuUlQ8EMu2I/uJRC
	sAo/ay+CycjVnvcBukBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOR4d-00000003E1V-2yk0;
	Mon, 09 Jun 2025 01:13:15 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOR4b-00000003E18-3NtR
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 01:13:14 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-73972a54919so3138452b3a.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Jun 2025 18:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749431593; x=1750036393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Zzv2Z32HyhBbevN9sWOTHP2DeH7U5lczNhzolLKy40k=;
        b=Q6MIYAjdIAVKCshSMz9/GPttuleqyLrpmkcrC2qpBzz93d42mktjHzUf21V+XHv7D+
         ULURSRODuMvfoNmZo7T/CO+dPEd+AFnVE9RbNgg1chkF7B0N7Uta2tKYm1kJNgw5O5wd
         7pgWZKZbGsP1KuRRV9UwXznTllGukAaPVX0XYTftAlMVHQGYg7v7rXQZzeTyv/aIg5MK
         RLcY07ntdP9ISUNrg1Hr5XJZkoXufk6Ya32IrrAcZeESpt+tlQzSOCwJM6IWlxV6Plhs
         ne6mHWR3tqDN45u1uCYaTEY+ivnth7VXVuEVOsXHQHqAsBa/iGd7QBnB0FhXHa1bBcqQ
         WNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749431593; x=1750036393;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zzv2Z32HyhBbevN9sWOTHP2DeH7U5lczNhzolLKy40k=;
        b=kt9AEiOiq+UBo9PXbo5MFtvR2hUkwWKVg1C4tS1TMgM2eoodvr6WEQi+/GBfVNzoZ9
         VaD6neE+8AJYAwYljyOl26Mbfa+78QcHiMTwQE4KTrp2VfuEbGVE8Ed1JhfpIKzdPTyL
         zXvOcz3uZ2h9vtwsdLCq3oeJVy1y6GOUWZyEdJwSiIQ2pjpLonM8anAJnBky9HeU+lAe
         peAL872Fmd9Iiw5k/ulcODEDkjErIE8UUtPcx8F9GhLI98LbxUNLyX7sB/ICnCVEK1zj
         CvHzdBAbmUXaFygb18HkdExblluqPWfVetK8xSi7sBVEiJqkZ6SxL3T3qRhv+xoIHxaw
         6QQw==
X-Forwarded-Encrypted: i=1; AJvYcCUjwRLNzxPc/pDqGP2tRkEWE9e2RijJPwtXDaTRa9UuHvypkwWoENIh9GFo25iw5i4WggjHoIMLrhQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLtdkINXQWElFo+0HhtjcSQqhAI2glwkIuQK18MHU7LYNPNa5G
	G/kaTljq2O+9L+8hMBIZrmrfaZvY4PVEB4+N9afhuE2NOavXRBe2anVJ
X-Gm-Gg: ASbGnctnHosgyNj8vmEDw/6wgpeHBbJ7wY3ziDQzyy4H8dj/r+yEZe/8oLUIevT7uBu
	2+xF2fv7/PGPaCC4dfJ3OTe+S0h82A9eR/PPMkk3r2WUwNdVlsphyF+6U+tSey6sRf8oXna1LBz
	AZ6at/V/ior0jigpdV27Ma8XJAAFG2lHRtASF+3Et9R3Q1EfLciDn9GjOvbVDzCJ7hSZtt5ZpmX
	GvkLP24ZsVwssz2ADqnbcWJSBRt09NMrwy4X5pmfiWuFY7PRyE1kS/bcvwNW0LOl9Q3rUZ33Xc/
	5KALLuQxiD44dSev3eQxfr0ZAa4XxVxH5ovMdA999bX0CGVjeJU7Ee7JBpMk2cZz3TkJdLqcZnD
	unJqPKKaLbZTjU+mR0Xy/cOLE
X-Google-Smtp-Source: AGHT+IERZXXJmLUp5a0fm5aKZrN/RHRQVF5VsEpm3yXM37V2sOYOT+DgDTx6OM4kL7Ussl4hyDFxwg==
X-Received: by 2002:a05:6a00:2e86:b0:742:a02e:dd8d with SMTP id d2e1a72fcca58-74827f36224mr16505756b3a.20.1749431592641;
        Sun, 08 Jun 2025 18:13:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0ea282sm4603052b3a.151.2025.06.08.18.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jun 2025 18:13:11 -0700 (PDT)
Message-ID: <da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
Date: Sun, 8 Jun 2025 18:13:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Cheng Ming Lin <linchengming884@gmail.com>, tudor.ambarus@linaro.org,
 mwalle@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
 <20250407075400.1113177-2-linchengming884@gmail.com>
 <d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
 <mafs05xh6pf7s.fsf@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <mafs05xh6pf7s.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_181313_867245_86B9AED2 
X-CRM114-Status: GOOD (  18.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 6/8/25 05:53, Pratyush Yadav wrote:
> On Sat, Jun 07 2025, Guenter Roeck wrote:
> 
>> Hi,
>>
>> On Mon, Apr 07, 2025 at 03:53:58PM +0800, Cheng Ming Lin wrote:
>>> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>>
>>> Many flash devices share the same ID but have different part numbers.
>>> To avoid confusion, the part number field is removed.
>>>
>>> Additionally, since SFDP already provides size information and
>>> functionality covered by no_sfdp_flags, these fields are also removed.
>>>
>>> Furthermore, when 4-byte address instruction table is available,
>>> the SPI_NOR_4B_OPCODES flag is no longer needed and is removed.
>>>
>>> Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
>>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
>> With this patch in place, some of my qemu tests no longer recognize the
>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>> this other than avoiding Macronix flash chips when working with qemu ?
> 
> Could you share some logs? Does the flash fail to detect, or does the
> SFDP-based probing fail? Since this is qemu, it would be even better if
> you can share a setup/reproduction guide. I have been meaning to set up
> qemu for SPI NOR testing for some time now, but never got around to
> figuring it out.
> 

I suspect that the SFDP data for the affected flashes is incorrect in qemu.
Since this is very likely a qemu problem, I'll just configure different flash
chips when running affected tests.

For reference, here is a sample qemu command line.

qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=n25q256a13,spi-model=n25q256a13 \
	-kernel arch/arm/boot/zImage -no-reboot -snapshot -audio none \
	-drive file=/tmp/flash,format=raw,if=mtd -nic user \
	--append "root=/dev/mtdblock0 rootwait console=ttyS4,115200 earlycon=uart8250,mmio32,0x1e784000,115200n8" \
	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
	-nographic -monitor null -serial stdio

This is with aspeed_g5_defconfig. In this example, ",fmc-model=n25q256a13,spi-model=n25q256a13"
is used to override the default flash model (MX25L25635E) because it longer works after
this patch. Normally that should not be required, but it is useful to test support
for different flash chips.

Guenter


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
