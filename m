Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDA5C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Dec 2022 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooneX/PPDn2+anQeeRV6x9RCa1Ej0G+XD1skF/ZyWXE=; b=O7K0k1AIDUpVU3
	0Z+QBRZAxA8H64Hldgtl6ulNp+6JhNakTpik31XHvbUmZkiXfBeV07Trv0eZ7vfZXU/MyrqGAuxcu
	HWmdZbPMz5P4ryMqi/hvOnBzL4ZcW+mw7SRPsuxdQkJLBGsudfLzFll/lF4Gz0TQU3GogC+0F4Pe2
	C93o7KEBhHoRUPitNf1OCDFJ63ZKG3guFTHzv1yUt/nZ0BK44ibZaBGJPq3KgetJaO98mWwFaUFm2
	4NKpyyapKEM9YHLHyRF5oEyJeuwxZj8Ipk6uVJs/ovfmyK1m5tyMmpSjz6uqG+5QxR41p9w3KjAh9
	m/zAaev4xFg6ljZeq0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7t8E-00B8Qy-6V; Wed, 21 Dec 2022 07:03:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7t8B-00B8PB-6A
	for linux-mtd@lists.infradead.org; Wed, 21 Dec 2022 07:03:12 +0000
Received: by mail-wr1-x42e.google.com with SMTP id y8so967870wrl.13
        for <linux-mtd@lists.infradead.org>; Tue, 20 Dec 2022 23:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eg0WhSchjTvqXeKP426L54VYEv3WuT9Mujc7Ng9EqQk=;
        b=B6/+mfC87WaDmrKji/kmap+UCJ13c7ySQtXVy061Q8CaXeYfrtmsV12CRBzMes/Xoj
         8jXqhRpeOSuNvQkSawR9K+F7E6Xl6YHuHXqFc+YaBaSVJJFJYL2h4SuSaxdVOfm7IRmb
         Ws644Udaa1jAlQBbJrVSqOfeBgBk4kItqV8rHKsOD8OSo/Ew/4b2hJgMftYjEAEaVrVV
         wJdNa8BBlGxLxvd/t4M9hZ5ZnqyztTY/6MqPqQMQIZDX6ebaI8dzpXbDujV+5gxOn3oQ
         K3MG2XmHV1Dv7NhQ2HsZ2FWxdc+KYPAftr4D6T0n3cxlmJkw8fRr/OJmErpOl/90UMa0
         qo8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eg0WhSchjTvqXeKP426L54VYEv3WuT9Mujc7Ng9EqQk=;
        b=dIQY19gmVdc2mdf418q92ddI4YZ6bFvC761uOSQA6lJ1JQobIbbZgIIT+xC7XexDRL
         pVRqBX6TtwcZhwuCJ1JDZzUNJrLcF1RRlyEooHk04pQWmJYkNcVdcJxGlvoQUzE0ET2f
         LBtObVNk+wuKgruJAd7dT4mSKxDChk5UZRlH0FZMfbxKgQ8y6ep3HpdU2mfbeNpV9VwZ
         jONsDmK9EhaxR1/aOjFc1oCicAPixI5nHW+2pOzmQjhQdQtIPpTcreYvZNmpYyHtYv8Z
         pwQrFDN9K99N+b66ueZA0O/5NHROzv5Y1mat5boI0Q05KnItwLJ1Br+LxODMJ/YESDfO
         MDQg==
X-Gm-Message-State: AFqh2kp6clKqtsCKBOppEg7KvL8FvOoAnj4IR8oF7VhFs7GuaeM+kQTL
	WC8xyWRlBeQDh+Mlqz9QWRefsQ==
X-Google-Smtp-Source: AMrXdXseUP2FWdrUvMZQlBwGZpeRZYjgxls4v7sX9+wuHvypLn0jbH1WS3VJaOvEpeMDbg4HMV3eRw==
X-Received: by 2002:adf:e103:0:b0:26a:6e7d:5782 with SMTP id t3-20020adfe103000000b0026a6e7d5782mr312026wrz.35.1671606188859;
        Tue, 20 Dec 2022 23:03:08 -0800 (PST)
Received: from [192.168.0.173] ([82.77.81.131])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b0024228b0b932sm17074639wrx.27.2022.12.20.23.03.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 23:03:08 -0800 (PST)
Message-ID: <96b4574d-8fe1-7662-5029-fc375f7b9ac9@linaro.org>
Date: Wed, 21 Dec 2022 09:03:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: issi: is25wp256: Init flash based on
 SFDP
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 greentime.hu@sifive.com, jude.onyenegecha@sifive.com,
 william.salmon@sifive.com, adnan.chowdhury@sifive.com, ben.dooks@sifive.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220920184808.44876-1-sudip.mukherjee@sifive.com>
 <20221221003009.GA280250@roeck-us.net>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20221221003009.GA280250@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_230311_298155_2368E3DB 
X-CRM114-Status: GOOD (  17.50  )
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



On 21.12.2022 02:30, Guenter Roeck wrote:
> Hi,

Hi, Guenter,

Thanks for the report.

> 
> On Tue, Sep 20, 2022 at 07:48:07PM +0100, Sudip Mukherjee wrote:
>> The datasheet of is25wp256 says it supports SFDP. Get rid of the static
>> initialization of the flash parameters and init them when parsing SFDP.
>>
>> Testing showed the flash using SPINOR_OP_READ_1_1_4_4B 0x6c,
>> SPINOR_OP_PP_4B 0x12 and SPINOR_OP_BE_4K_4B 0x21 before enabling SFDP.
>> After this patch, it parses the SFDP information and still uses the
>> same opcodes.
>>
>> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> 
> With this patch in place, qemu emulations with is25wp256 fail to
> instantiate the flash. Specifically, this affects the qemu sifive_u
> emulation. The resulting error message is:
> 
> spi-nor spi0.0: BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash
> spi-nor: probe of spi0.0 failed with error -22
> 
> qemu command line:
> 
> qemu-system-riscv64 -M sifive_u -m 512M \
>       -no-reboot -kernel arch/riscv/boot/Image -snapshot \
>       -drive file=flash.8Vtb7,format=raw,if=mtd -bios default \
>       -append "root=/dev/mtdblock0 mtdparts=spi0.0:- console=ttySIF0,115200 earlycon" \
>       -nographic -monitor none
> 
> Reverting this patch fixes the problem.

I need some more debug info in order to have both flavors of the flash
work correctly. Would you please revert the patch locally and do the
tests from below? Thanks!

ta

---
# dd if=/dev/urandom of=./qspi_test bs=1M count=6
6+0 records in
6+0 records out

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug erase /dev/mtd4 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*

0600000

# mtd_debug write /dev/mtd4 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash

# mtd_debug read /dev/mtd4 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read

# sha1sum qspi_test qspi_read
57f8d4fee65622104e24276e865f662844f12242  qspi_test
57f8d4fee65622104e24276e865f662844f12242  qspi_read

# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
is25wp256

# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
9d7019

# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
issi

# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110300000ff9d05010380000002ffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0f44eb086b
083b80bbfeffffffffff00ffffff44eb0c200f5210d800ff234ac90082d8
11cecccd68467a757a75f7aed55c4a422cfff030faa9ffffffffffffffff
ffffffffffffffff501950169ff9c0648fefffff

# md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
ba14818b9ec42713f24d94d66bb90ba0  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
