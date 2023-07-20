Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961D6EB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xAKUOSV8HwXimdX2NCkUPbes/9eI1vIML2Edm+il1g=; b=jUT8WWt4KWjEBh
	xa966w69OqIjgLYKn6iCYCwODAZnPEaHSGZ4YURMiad1aU4DwFeRH0TRXUKFMY4La1aTB+yApF2va
	QpFkrlZ13dRD2bZ0I8YKtWN8/RYP8iPfKEBqI1pKG/YVTA8NZbzfr7r1YieC3jHq7L629WMkF8v9D
	v+lyQSpJcaYsb25DLOmfHZSONxCngcsX17jFhgdauXC0bsunwibto2G0hqMXDqwtbeJxYs1Rjx7bZ
	CMKZzt5wAfOs7kda+6zB0cLWZSol+551JQKqYlSvEFucnuwlSdePjrgXlqZzy0UzTY01t+UE+OvT8
	ePl0xMnynnGQPns4lLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOUZ-00ABPj-0f;
	Thu, 20 Jul 2023 07:54:31 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOUV-00ABNa-0u
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:54:29 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-55ba5bb0bf3so377844a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jul 2023 00:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689839664; x=1690444464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDhEraggWrbFmWechRXDgCvoXLX+RLzflF0BIXa0ekM=;
        b=OOPyAWxlzYp9b1QvdwRx0bzHxcfXwOmi89Fe6+UPziKmC3ZZfwnv1587k/Rs1x1DYH
         rx4zT2t1mihxjF0PQGvXkYIGtTPJJ3sdrKCwseiTEcR6VYRUcNuC8VVGLXxWUR9kDvFW
         FJ0sqtNnijHodRapEc8Wy57seECWrxroB/5Z74Zq3YF0hCUUZjZWmuxBDzjdLdnQL+un
         YG1Ypq9qm2JYMI+4B4szJB9HO20ryA9BatjbyrlLqe3C70q+jm2yDMK2XAhjN9a+NC/f
         DPVgrjvIghZZwWMb2yANFV9Yr6j7AC+l9AmEhGSkPCD5N5l8OwADEPRAbbAFgbTorspd
         Vz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689839664; x=1690444464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDhEraggWrbFmWechRXDgCvoXLX+RLzflF0BIXa0ekM=;
        b=cZjKFGJNJ+r2FscIpGAS2Vi2A66Kismrg/oM9nvgwERC2+SmxjS+uw1goXb38c+3cv
         ZDjZ0YD0n8HsHmfDgJHkz/NaMNRl8NQHoAA0K/aSK1okQLxSVonlWsifYiMdeix/NSBO
         cLYqQaxyEV1Mj2vuk3A3eFWzGkY+B1bCrpeQzDagOSEdNdYfrHIg7tcDlz1MUUhMhvQm
         HnOaUXuPn0uzwRoEJDwr6Qm1ZfXCayqEdUp76YyaL5pRVVRD0J0nEC5exRiqdZ7gMtHh
         xUph3stKinds06blmNPhrEvxvCRiTbGXf1LWB9D638P6UfelFtI8dP0pkIwNW8czfk6g
         rlvw==
X-Gm-Message-State: ABy/qLaMkEwv1U8agSNNAtnjTHOyBepBi6enueFTQWBYABJ67eXchZ2u
	eCL+XJNojODAq4wtpXyq/9vno6jSXxU=
X-Google-Smtp-Source: APBJJlGTSkiss02AdHugbDQ2nJGcB+9BKBkO7BUFh7FsdXvinmJbvao68C46AJmdK7IWyBXdt/5nEQ==
X-Received: by 2002:a17:90a:5987:b0:263:7d8:4a with SMTP id l7-20020a17090a598700b0026307d8004amr6407180pji.18.1689839664166;
        Thu, 20 Jul 2023 00:54:24 -0700 (PDT)
Received: from [192.168.0.11] (KD106168128197.ppp-bb.dion.ne.jp. [106.168.128.197])
        by smtp.gmail.com with ESMTPSA id 22-20020a17090a019600b0026309d57724sm2334734pjc.39.2023.07.20.00.54.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 00:54:23 -0700 (PDT)
Message-ID: <11dc5af4-6c11-5b44-5764-88a5eb734dbd@gmail.com>
Date: Thu, 20 Jul 2023 16:54:20 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/8] mtd: spi-nor: spansion: Add support for Infineon
 S28HS02GT
Content-Language: en-US
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, michael@walle.cc,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, d-gole@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <cover.1689836065.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_005427_321277_DB835460 
X-CRM114-Status: GOOD (  13.42  )
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

Hi,

I tested with the following devices, as this series updates the code used by
other SEMPER flash devices than S28HS02GT.
 - S28HS02GT(Octal, multi-chip)
 - S28HS01GT(Octal, single-chip)
 - S25HS02GT(Quad, multi-chip)
 - S25HS01GT(Quad, single-chip)
 - S25FS256T(Quad, single-chip)

Thanks,
Takahiro

On 7/20/2023 4:09 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Infineon S28HS02GT is 2Gbit, multi-chip package, Octal SPI NOR flash. This
> series reworks octal_dtr_enable part to support MCP and then adds ID and
> fixups for S28HS02GT.
> 
> Tested on Zynq-7000 platform with Infineon SPI controller
> 
> ID, SFDP, Test logs:
> ---
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s28hs02gt
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 345b1c
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080106fe00000114000100ff84000102500100ff050001055801
> 00ff8700011c6c0100ff88000106dc0100ff81000118040200ff0a000104
> f40100ffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> fffffffffffffffffffffffffffffffff7218affffffff7f000000000000
> 0000eeffffffffff0000ffff00000c2100ff00ff12dc23faff8b82e7ffec
> ec2319497ab07ab0f766805c000000fff910c0a0000000000000bc020000
> 0000ffff7e7e41120ffe21ffffdc00ee800b7171656500b0ff9600000000
> 0c551ca20000800000000000c0ccfffb88fbfffb00650090066500b10065
> 009600650095716503d0716503d0a46bfb0290a579a20040288e0000ff00
> 0000ff0071650690716506900000000000000000716506d1716506d17165
> 0691716506910000ff000000ff00716505d5716505d50000a01500008008
> 000000080000801000000010000080180000001800000601000000008000
> 710600030600fc65ff0804008000fc65ff0402008000fc65ff0804008008
> fd65ff0402008008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8ff
> fb0ff8ff0100f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100
> f1ff0100ff0a00fff8ffff0f                                    
> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 6193b9729008b80b9a2b4bb3ce06a91d  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> zynq> test_qspi.sh
> 6+0 records in
> 6+0 records out
> 6291456 bytes (6.0MB) copied, 0.234679 seconds, 25.6MB/s
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Erased 6291456 bytes from address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0600000
> Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
> Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
> 3020d73d4d0e570449faacfbadf134e074ced30e  qspi_test
> 3020d73d4d0e570449faacfbadf134e074ced30e  qspi_read
> ---
> 
> Takahiro Kuwano (8):
>   mtd: spi-nor: spansion: use CLPEF as an alternative to CLSR
>   mtd: spi-nor: spansion: preserve CFR2V[7] when writing MEMLAT
>   mtd: spi-nor: spansion: prepare octal dtr methods for multi chip
>     support
>   mtd: spi-nor: spansion: switch set_octal_dtr method to use vreg_offset
>   mtd: spi-nor: spansion: switch h28hx's ready() to use vreg_offset
>   mtd: spi-nor: spansion: add MCP support in set_octal_dtr()
>   mtd: spi-nor: spansion: add octal DTR support in RD_ANY_REG_OP
>   mtd: spi-nor: spansion: add support for S28HS02GT
> 
>  drivers/mtd/spi-nor/atmel.c     |   8 +-
>  drivers/mtd/spi-nor/core.c      |  23 ++--
>  drivers/mtd/spi-nor/core.h      |   4 +-
>  drivers/mtd/spi-nor/issi.c      |   4 +-
>  drivers/mtd/spi-nor/macronix.c  |   4 +-
>  drivers/mtd/spi-nor/micron-st.c |   4 +-
>  drivers/mtd/spi-nor/spansion.c  | 193 ++++++++++++++++++++++++++------
>  drivers/mtd/spi-nor/sst.c       |   8 +-
>  drivers/mtd/spi-nor/winbond.c   |   4 +-
>  drivers/mtd/spi-nor/xilinx.c    |   4 +-
>  10 files changed, 201 insertions(+), 55 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
