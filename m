Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C60C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Apr 2022 00:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcTEtUHjQ7Onv1LyGaX/4RlA4XUqXwhMaUuVPPEXhEk=; b=ACFnq1LaTedrub
	FZyaBrlAWhrEsj4s+qXOqfU4tAXO3AIkly+StxqCV1qVYGEbHkatijLvFRqTeUKroUzwRElK3XMDY
	vdRebSV7u8kGyiKP7Pn9r8O9HwyNpYv0htOnKxL3K6SZa6/wwsYlpl1x+W5wV3dABk4Sjmq7S/z9M
	aXVFtbbIXt3QvQ/8DorKlzUnDHoKFzXjw22hyu/I7RmVo6AEDkOScJkuEWlZV7gwiqBbWfIUA+3gk
	iTBujMykhJWyonQbvzuzjax8FyHfkbjjwscVELH0txKlv0k7iYZvGN2DD1N/JH3aZg0/b1SPr04cp
	uC3XPpYW6UvrY8b4allw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngFiz-00FBUp-NJ; Mon, 18 Apr 2022 00:58:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngFiv-00FBTz-L7
 for linux-mtd@lists.infradead.org; Mon, 18 Apr 2022 00:58:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id n8so11205236plh.1
 for <linux-mtd@lists.infradead.org>; Sun, 17 Apr 2022 17:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=APK1B1FpXZKW3P7Nakpmm+CrTLZv6+tiwJGCZswRdB4=;
 b=mCl+6iWd/rGCc70kbjQzG1ivxdQ+EEbo70YlCVj6yrC/pwQ+KECDW718pOVhOqrfTs
 avFmia2ctDREmW5+lbdLLf6sRGW4cmxUF8TP0Jf88I1IpiF5CVbFG7Rni09Bi3jUscot
 aTglaoO+7wh86oPovETk0i+0e2bn/n0DnCUb2ih7mSlYv9wXuPybPnqCpoMJWXtHQ+HE
 qfPcV804VXvBznJe1g7jm+JM/sg7ZfCBIdq8bl+B67riUtfwPPFGtlx/YMrAzvdsjWJK
 Q0fHp4iIHeNrpYGcfFBdHdACROQUoic0mNnfzsPZvuXePYpIZIyHu8TOINj7Cq79qVkn
 rGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=APK1B1FpXZKW3P7Nakpmm+CrTLZv6+tiwJGCZswRdB4=;
 b=CnFKguujkh5DG5qqfbHs9981PdPWQ1+j8zOZnPVXQ1r1pskrrGyekfMK6Iu2dOtBi6
 yQ1RdWiJdqzrFw3gv0XndLgWtQLtVBqR2TQb6Pe0CNOJnQVklFCbKWboGy/OvX+tb0SC
 u+dlNJveV4aNZhxA8ZzrrN3LUxyqhWfPTsiY9/rkIqwnbmZFDeqlVYb3vJDMCUERa5RA
 RePAlcjoIU6HewO4LUh+T801bKK5GbFNY+CvN7lZkRyhL6qaxPqUEsm+3KD55jYQ7Q1L
 9M1aa9SUWOft9NxIT3Y7mNJsAOUfw6oCt/8Vcw2WQ5LzaONa7ERWlGw+fQ5gPSOBcM0F
 dl8A==
X-Gm-Message-State: AOAM530I41mhNA372wj6T/OG7krQFBemk1G7CvxccQqp6wiqKja0B8VG
 B9FE7TBvZpcBzLfEoX9+m4XG0KH9h+o=
X-Google-Smtp-Source: ABdhPJzgIWJ/o7JorCdARt4ZsTaX0A7MJn2fh+TIt4ap6U5W6jzaPC+QX5ozblpiTgM56QUORpGkgA==
X-Received: by 2002:a17:90b:1c86:b0:1bf:2a7e:5c75 with SMTP id
 oo6-20020a17090b1c8600b001bf2a7e5c75mr10297875pjb.145.1650243514126; 
 Sun, 17 Apr 2022 17:58:34 -0700 (PDT)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 e15-20020a63ae4f000000b003995a4ce0aasm10889233pgp.22.2022.04.17.17.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 17:58:33 -0700 (PDT)
Message-ID: <77d272b8-df9e-5b1d-ba84-3a00aa86fedb@gmail.com>
Date: Mon, 18 Apr 2022 09:58:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 0/4] mtd: spi-nor: Add support for Infineon
 s25hl-t/s25hs-t
Content-Language: en-US
To: linux-mtd@lists.infradead.org
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, p.yadav@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <cover.1649641729.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220417_175837_766646_F7517BD0 
X-CRM114-Status: GOOD (  17.82  )
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

I will revise this series on top of Tudor's new series.
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490

Besides, I would withdraw patch 1/4.
Static assignment for 'nor->info->addr_width' cannot handle different
use case of addressing mode (3-byte or 4-byte at boot time).
I will revert that back to v9.

Thanks,
Takahiro


On 4/11/2022 2:23 PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
> 
> The datasheets can be found in the following link.
> https://www.infineon.com/dgdl/Infineon-S25HS256T_S25HS512T_S25HS01GT_S25HL256T_S25HL512T_S25HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Quad_SPI-DataSheet-v02_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee674b86ee3&da=t
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
> Changes in v10:
>   - Rebase to v5.18-rc1
>   - Remove dependencies on other series
>   - Use nor->info->addr_width for SMPT parse
>   - Add a local function for page size discovery
>   - Clean up volatile QE function
>   
> Changes in v9:
>   - Rebase to v5.17-rc6
>   - Rename function and macro per mwalle's series
>   - Fix some issues in ID table and fixup hook
> 
> Changes in v8:
>   - Rebase to v5.17-rc4
>   - Use spi_nor_read_reg and spi_nor_write_reg()
>   
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
> Takahiro Kuwano (4):
>   mtd: spi-nor: sfdp: Use nor->info->addr_width as address width for
>     SMPT parse
>   mtd: spi-nor: spansion: Add support for volatile QE bit
>   mtd: spi-nor: spansion: Add local function to discover page size
>   mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs and fixups
> 
>  drivers/mtd/spi-nor/sfdp.c     |   7 ++
>  drivers/mtd/spi-nor/spansion.c | 179 +++++++++++++++++++++++++++++----
>  2 files changed, 164 insertions(+), 22 deletions(-)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
