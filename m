Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CC6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 09:28:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C6A63222
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 09:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E8C6A63222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6YFP2hh6K7Z7B28JYogkYVpNNzHPGFksRUeX4NccPuw=; b=SHYT5+8Zd5dngdNQ2kFPq5K55t
	6hhF54+38alzAY2UEmkkOMoZqqeBHgDd1qEuSc2+iJ/Y+zjdAfEDzj1DtNnw5q0w+qWPOIAbM5/Pj
	zdhmX4CV28rGIwtHw2lHGrHUHHPJVS5rra4RycgSb1QDmMkX9fsYjum1QD8STWXQ3dsD3pFFx7plH
	wvmTABgwbOTZxF77P3pKqahTg6eNwcNTpVfNWXrpAuT4l1DkuOI2DhDQ+62f49TwbDrqSMv2fGJtJ
	EUIj0aprmOVKlKgaJZbIkAxwqD901GN8A0RgNDwZDz4Bj2wRRf+hdI5boWeSHwwwoSI6TXpqfWLg4
	7D5ecglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHEH-004F25-Ct; Wed, 17 Nov 2021 09:27:45 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHAb-004DHR-EH
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 09:23:59 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2092000pjb.0
 for <linux-mtd@lists.infradead.org>; Wed, 17 Nov 2021 01:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GVDZumbLhZnMj+r2ZednEyDcqlrfyStyBV1tNbpDxmc=;
 b=htkV/WIpjuTgLtxconUebXBVp5neitOW6xJZodMFGLX8ddnpx4LuljurXt42CQvIx4
 t5LAeCrI2QHRZQaS8+uDFLWltnivKY8eRwaONMxd8EM5qlWyznPvFN/LxKB9beAoIhXH
 1qkMFmJSKUc9PNYKeHEYJNjXuWodyv1Z8gZjv8fQ1ySznDNrcjrEHMIXeOyxM+dI6Ovc
 t+UDN0TyyNS9ovB6gLHwKeWpok2HZyGQhnVaE9Er+X2Roo08FQqQ7KZLjL/HME3v5g8b
 ZkDdEwY1d990aTY7LtnI4nSlukRnMXEl4e7oQ3J/Cd2q8fdtgLrCMktvZ7IrQxUzoG6D
 FPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GVDZumbLhZnMj+r2ZednEyDcqlrfyStyBV1tNbpDxmc=;
 b=ZzBj3QNIUPMHjwJaGjEW9mcw8A7pppw+IH/BtrfWd4z1fpMLovZXfjBmm2OzH+e6Ls
 ERO8RtIeot3S+zgoEqaZuWAx6R0JnQKPkTPdzz0mL3i0U1t7rh3P2mwWRpBWNOqR3tCZ
 tjMYnAen0qnQ3nZnyCTaDUftU4IFZhSr9KdGJ+TbJncDvJsgMHVjiI2Q2/hUTilKCJHj
 OmuPHXNudRgLOPPDCV0q5HWmTkVNXmNUl/2HvroTnpuPSY6wTBZsy1cyYrMFWVVrsewd
 jEuhoa6iiIh4zvtuPq8WZt3GckYfIxperp8aSG2tzLTmhga7Af50eyYNmIeEO+DNqJ6S
 KBMQ==
X-Gm-Message-State: AOAM533eT5DSNIvC77XE0zzSE3oOIgrGCi8qcP2rgyufvJfOrDbF79eo
 HJDrDQdyu6g1XyzOz8mXigw=
X-Google-Smtp-Source: ABdhPJzXWDt8Zo6kQNasj73XvCtX6kEzMmCcEZ/x0jZPAThzeaknvGzCOI8GQINBrv4h3hyhaSbTPg==
X-Received: by 2002:a17:90a:c398:: with SMTP id
 h24mr7718335pjt.73.1637141035586; 
 Wed, 17 Nov 2021 01:23:55 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 mp12sm4724688pjb.39.2021.11.17.01.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 01:23:55 -0800 (PST)
Subject: Re: [PATCH v7 0/3] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <d2503b2f-3190-7c0a-47dc-6ebf2f6e74ba@gmail.com>
Date: Wed, 17 Nov 2021 18:23:52 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <cover.1626677855.git.Takahiro.Kuwano@infineon.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_012357_590963_23DF0C98 
X-CRM114-Status: GOOD (  17.18  )
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

Hello,

Any feedback on this series of patches?

On 7/19/2021 5:03 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
> 
> The summary datasheets can be found in the following links.
> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
> 
> The full version can be found in the following links (registration
> required).
> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
> 
> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Device ID and SFDP dumps:
> ------------------------------------------------------------
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s25hl512t
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 342a1a0f0390
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080103ff00000114000100ff84000102500100ff81000116c801
> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffe720faffffffff1f48eb086b00ff
> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe3
> ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
> 00650090060500a10065009600650095716503d0716503d000000000b02e
> 000088a489aa716503967165039600000000000000000000000000000000
> 000000000000000000000000000000000000000000000000716505d57165
> 05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
> fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03f8ff0100f1ff
> 0100fe0104fff1ff0000f8ff0200f8fff703f8ff0200f1ff0000ff0400ff
> f8ffff03
> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 8a0aa90112e154ae3a797df2c211ef61  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> ------------------------------------------------------------
> 
> ------------------------------------------------------------
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s25hl01gt
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 342a1b0f0390
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080103ff00000114000100ff84000102500100ff81000116c801
> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffe720faffffffff3f48eb086b00ff
> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe6
> ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
> 00650090060500a10065009600650095716503d0716503d000000000b02e
> 000088a489aa716503967165039600000000000000000000000000000000
> 000000000000000000000000000000000000000000000000716505d57165
> 05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
> fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07f8ff0100f1ff
> 0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff0000ff0400ff
> f8ffff07
> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 1ad5a0d7d7e0e656986c1e678c416a7e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> ------------------------------------------------------------
> 
> ------------------------------------------------------------
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s25hs512t
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 342b1a0f0390
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080103ff00000114000100ff84000102500100ff81000116c801
> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffe720faffffffff1f48eb086b00ff
> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b91e8ffe3
> ec031c608a857a75f766805c84d6ddfff938f8a100000000000080000000
> 0000f7f5ffff7b920ffe20ffffd80000800000000000c0ffc3ebc8ffe3eb
> 00650090060500a10065009600650095716503d0716503d000000000b02e
> 000088a489aa716503967165039600000000000000000000000000000000
> 000000000000000000000000000000000000000000000000716505d57165
> 05d50000ee72fc65ff0804008000fc65ff4002008000fd65ff0402008000
> fe0002fff1ff0100f8ff0100f8fffb03fe0302fff8fffb03f8ff0100f1ff
> 0100fe0104fff1ff0100f8ff0200f8fff703f8ff0200f1ff0100ff0400ff
> f8ffff03
> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> f17d9e784602187a0933edec3688e30f  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> ------------------------------------------------------------
> 
> ------------------------------------------------------------
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> s25hs01gt
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> 342b1b0f0390
> zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> spansion
> zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 53464450080103ff00000114000100ff84000102500100ff81000116c801
> 00ff8700011c580100ffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> ffffffffffffffffffffffffffffffffe720faffffffff3f48eb086b00ff
> 88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffe6
> ec031c608a857a75f766805c8cd6ddfff938f8a1000000000000bc000000
> 0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3ebc8ffe3eb
> 00650090060500a10065009600650095716503d0716503d000000000b02e
> 000088a489aa716503967165039600000000000000000000000000000000
> 000000000000000000000000000000000000000000000000716505d57165
> 05d50000a015fc65ff0804008000fc65ff4002008000fd65ff0402008000
> fe0002fff1ff0100f8ff0100f8fffb07fe0302fff8fffb07f8ff0100f1ff
> 0100fe0104fff1ff0000f8ff0200f8fff707f8ff0200f1ff0000ff0400ff
> f8ffff07
> zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> 1ad5a0d7d7e0e656986c1e678c416a7e  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> ------------------------------------------------------------
> 
> 
> ---
> Changes in v7:
>   - Some changes were missing in v6 patch. Fix it
> 
> Changes in v6:
>   - Remove 2Gb dual die package parts and related changes to split mulit
>     die package support into another series of patches  
> 
> Changes in v5:
>   - Fix 'if (ret == 1)' to 'if (ret < 0)' in spansion_read_any_reg()
>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
> 
> Changes in v4:
>   - Reword 'legacy' to 'default'
>   - Rename spi_nor_read() to spi_nor_default_ready()
>   - Fix dummy cycle calculation in spansion_read_any_reg()
>   - Modify comment for spansion_write_any_reg()
>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
> 
> Changes in v3:
>   - Split into multiple patches
>   - Remove S25HL256T and S25HS256T
>   - Add S25HL02GT and S25HS02GT 
>   - Add support for multi-die package parts support
>   - Cleanup Read/Write Any Register implementation
>   - Remove erase_map fix for top/split sector layout
>   - Set ECC data unit size (16B) to writesize 
> 
> Changes in v2:
>   - Remove SPI_NOR_SKIP_SFDP flag and clean up related fixups
>   - Check CFR3V[4] to determine page_size instead of force 512B
>   - Depend on the patchset below to support non-uniform sector layout
>     https://lore.kernel.org/linux-mtd/cover.1601612872.git.Takahiro.Kuwano@infineon.com/
> 
> Takahiro Kuwano (3):
>   mtd: spi-nor: spansion: Add support for Read/Write Any Register
>   mtd: spi-nor: spansion: Add support for volatile QE bit
>   mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
> 
>  drivers/mtd/spi-nor/spansion.c | 291 +++++++++++++++++++++++++++++++++
>  1 file changed, 291 insertions(+)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
