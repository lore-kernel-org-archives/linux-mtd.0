Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B55C61D97
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Nov 2023 19:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GMz1b0W9+GfWQiAFL5FwkUtMpKwwkEbmvk9g9LpGUQ=; b=0EgI+yVjfwOJYg
	52UZg6f2+0+/LaPZnnZlimQ2D+mblf68xQamlf5vahGNAeMrub1p7otyrt0EOVEaHY4HF5cbZJRIc
	sfF9I23gVp9ODyHkD+K/k/ho4S0FEgWMtSttpSLNfkNa/7xSKmeZj6rRi3LyrM9mbThmNGHpFHBiU
	hKCCmOcxHXI/Am1PoqN0IfOIMz19tFCA65/5MiaArAsdwZUYPrHo68W/9CygqgFbyoqJOpKXJjHHB
	Z10lNhIxFFwsaXm4IEpSrIGsfMIgzj9qw0pIMj1KuUXsEFt9nNt8DW1yOWslaUDX7RrRcBRxaGqJr
	9o89Q+4bgmOj5TmEs7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6cFW-007ygE-1f;
	Fri, 24 Nov 2023 19:54:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6cFT-007yfm-1K
	for linux-mtd@lists.infradead.org;
	Fri, 24 Nov 2023 19:54:01 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54a95657df3so3343317a12.0
        for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2023 11:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700855636; x=1701460436; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=akxw437hH7pv9R9a7Z4VdJ7EFr4IKHM7FwBvILtqxGE=;
        b=fxWtqGmidGImiDOuW+FLN5JD0zes1yNcMuXw1yXVIFjBC/9n10BoWUpEFNhfe2lYUm
         xbvL2TTFdT3gGVTjBtnSi94rczGDtGetD5tImKtktlQyNLhWErvwQlPufkW5/MHO7nqR
         eVGS57fRtBgxS2AmUuxhDISBh0vxfcME6K3sxnEpjkP4AguNG4OAFEnrJhi/fIGN73ry
         gQd4vSvI1WvRXHKJGimP5YC3mhwQrjsNZFLDLTQVfEJSQUl8QwUlmvzHttLUNMyuJPPY
         bnwpij/QiGQELzD42ZYtbHrrzxrRScydmBChKfDWCqCvv7141PovVxFmxC4bCb/3fdIv
         Uc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700855636; x=1701460436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=akxw437hH7pv9R9a7Z4VdJ7EFr4IKHM7FwBvILtqxGE=;
        b=EBpxPr0RkOI0MkU/KyAg3IQ8dWwFKgnJVbFyBu6d3iGrYmn2oo+f1rR+iuHiDP6Vtu
         WSGdGl8XzanEeJkdlr8hqWSf6EaPF4JXiMXSI+9ZsA8fwLgA6vbfViNiSLN9v0IKta4u
         rcT+Ignu7JkZUR3+aoMg/LbOwNbQ23aPjUKPLZab/aYUcoJAKFWttU3M05oVfIoZLwaY
         tpMimEY4jXSVERw7RQxuVJatptkOZHMRzcud5DZ4FZhPNrltZWlkA4lGgoMjxGhCSCrK
         gcgH6tq67vuWhLJymkvmHc2GiVgAl1UuJ+msTLZmEukSWT8Fznxd/WQgIFGlY3F1LII8
         6ZkQ==
X-Gm-Message-State: AOJu0YweuyOyrK+jgG2/U6zgvAYir3rYoh242TVw1vGls+ANq8XP/QyV
	YkMPj1t5lwP+BfmgIMKgVTYKFw==
X-Google-Smtp-Source: AGHT+IF9A1fX43xCXs6oYY++234A06E7jGHzgfWUKypH/RSJLy3jbfomkr/OxJCgLD9RNycCET/UUg==
X-Received: by 2002:a05:6402:22e8:b0:54b:1a4c:8719 with SMTP id dn8-20020a05640222e800b0054b1a4c8719mr83838edb.9.1700855636302;
        Fri, 24 Nov 2023 11:53:56 -0800 (PST)
Received: from [192.168.0.174] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id z15-20020aa7d40f000000b005488bf98309sm2131071edq.56.2023.11.24.11.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 11:53:55 -0800 (PST)
Message-ID: <0abce5f8-2688-451d-8c70-8fc32c73f8be@linaro.org>
Date: Fri, 24 Nov 2023 21:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] docs: mtd: spi-nor: add sections about flash
 additions and testing
Content-Language: en-US
To: pratyush@kernel.org, michael@walle.cc, bagasdotme@gmail.com
Cc: linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org
References: <20231124184902.1194235-1-tudor.ambarus@linaro.org>
 <20231124184902.1194235-2-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231124184902.1194235-2-tudor.ambarus@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_115359_469422_2A367A43 
X-CRM114-Status: GOOD (  31.31  )
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



On 24.11.2023 20:49, Tudor Ambarus wrote:
> Add sections about how to propose a new flash addition and about the
> minimum testing requirements.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>  Documentation/driver-api/mtd/spi-nor.rst | 187 +++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 
> diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
> index c22f8c0f7950..3b2e1a6a88bf 100644
> --- a/Documentation/driver-api/mtd/spi-nor.rst
> +++ b/Documentation/driver-api/mtd/spi-nor.rst
> @@ -63,3 +63,190 @@ The main API is spi_nor_scan(). Before you call the hook, a driver should
>  initialize the necessary fields for spi_nor{}. Please see
>  drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to spi-fsl-qspi.c
>  when you want to write a new driver for a SPI NOR controller.
> +
> +How to propose a new flash addition
> +-----------------------------------
> +
> +Most SPI NOR flashes comply with the JEDEC JESD216
> +Serial Flash Discoverable Parameter (SFDP) standard. SFDP describes
> +the functional and feature capabilities of serial flash devices in a
> +standard set of internal read-only parameter tables.
> +
> +The SPI NOR driver queries the SFDP tables in order to determine the
> +flash's parameters and settings. If the flash defines the SFDP tables
> +it's likely that you won't need a flash entry at all, and instead
> +rely on the generic flash driver which probes the flash solely based
> +on its SFDP data. All one has to do is to specify the "jedec,spi-nor"
> +compatible in the device tree.
> +
> +There are cases however where you need to define an explicit flash
> +entry. This typically happens when the flash has settings or support
> +that is not covered by the SFDP tables (e.g. Block Protection), or
> +when the flash contains mangled SFDP data. If the later, one needs
> +to implement the ``spi_nor_fixups`` hooks in order to amend the SFDP
> +parameters with the correct values.
> +
> +Minimum testing requirements
> +-----------------------------
> +
> +Do all the tests from below and paste them in the commit's comments
> +section, after the ``---`` marker.
> +
> +1) Specify the controller that you used to test the flash and specify
> +   the frequency at which the flash was operated, e.g.::
> +
> +    This flash is populated on the X board and was tested at Y
> +    frequency using the Z (put compatible) SPI controller.
> +
> +2) Dump the sysfs entries and print the md5/sha1/sha256 SFDP checksum::
> +
> +    root@1:~#  cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
> +    sst26vf064b
> +    root@1:~#  cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
> +    bf2643
> +    root@1:~#  cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
> +    sst
> +    root@1:~# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> +    53464450060102ff00060110300000ff81000106000100ffbf0001180002
> +    0001fffffffffffffffffffffffffffffffffd20f1ffffffff0344eb086b
> +    083b80bbfeffffffffff00ffffff440b0c200dd80fd810d820914824806f
> +    1d81ed0f773830b030b0f7ffffff29c25cfff030c080ffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffff0004fff37f0000f57f0000f9ff
> +    7d00f57f0000f37f0000ffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +    ffffbf2643ffb95ffdff30f260f332ff0a122346ff0f19320f1919ffffff
> +    ffffffff00669938ff05013506040232b03072428de89888a585c09faf5a
> +    ffff06ec060c0003080bffffffffff07ffff0202ff060300fdfd040700fc
> +    0300fefe0202070e
> +    root@1:~# sha256sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> +    428f34d0461876f189ac97f93e68a05fa6428c6650b3b7baf736a921e5898ed1  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> +
> +   Please dump the SFDP tables using ``xxd -p``. It enables us to do
> +   the reverse operation and convert the hexdump to binary with
> +   ``xxd -rp``. Dumping the SFDP data with ``hexdump -Cv`` is accepted,
> +   but less desirable.
> +
> +3) Dump debugfs data::
> +
> +    root@1:~# cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
> +    Supported read modes by the flash
> +     1S-1S-1S
> +      opcode		0x03
> +      mode cycles	0
> +      dummy cycles	0
> +     1S-1S-1S (fast read)
> +      opcode		0x0b
> +      mode cycles	0
> +      dummy cycles	8
> +     1S-1S-2S
> +      opcode		0x3b
> +      mode cycles	0
> +      dummy cycles	8
> +     1S-2S-2S
> +      opcode		0xbb
> +      mode cycles	4
> +      dummy cycles	0
> +     1S-1S-4S
> +      opcode		0x6b
> +      mode cycles	0
> +      dummy cycles	8
> +     1S-4S-4S
> +      opcode		0xeb
> +      mode cycles	2
> +      dummy cycles	4
> +     4S-4S-4S
> +      opcode		0x0b
> +      mode cycles	2
> +      dummy cycles	4
> +
> +    Supported page program modes by the flash
> +     1S-1S-1S
> +      opcode	0x02
> +
> +    root@1:~# cat /sys/kernel/debug/spi-nor/spi0.0/params
> +    name		sst26vf064b
> +    id			bf 26 43 bf 26 43
> +    size		8.00 MiB
> +    write size		1
> +    page size		256
> +    address nbytes	3
> +    flags		HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | SWP_IS_VOLATILE
> +
> +    opcodes
> +     read		0xeb
> +      dummy cycles	6
> +     erase		0x20
> +     program		0x02
> +     8D extension	none
> +
> +    protocols
> +     read		1S-4S-4S
> +     write		1S-1S-1S
> +     register		1S-1S-1S
> +
> +    erase commands
> +     20 (4.00 KiB) [0]
> +     d8 (8.00 KiB) [1]
> +     d8 (32.0 KiB) [2]
> +     d8 (64.0 KiB) [3]
> +     c7 (8.00 MiB)
> +
> +    sector map
> +     region (in hex)   | erase mask | flags
> +     ------------------+------------+----------
> +     00000000-00007fff |     [01  ] |
> +     00008000-0000ffff |     [0 2 ] |
> +     00010000-007effff |     [0  3] |
> +     007f0000-007f7fff |     [0 2 ] |
> +     007f8000-007fffff |     [01  ] |
> +
> +4) Use `mtd-utils <https://git.infradead.org/mtd-utils.git>`__
> +   and verify that erase, read and page program operations work fine::
> +
> +    root@1:~# dd if=/dev/urandom of=./spi_test bs=1M count=2
> +    2+0 records in
> +    2+0 records out
> +    2097152 bytes (2.1 MB, 2.0 MiB) copied, 0.848566 s, 2.5 MB/s
> +
> +    root@1:~# mtd_debug erase /dev/mtd0 0 2097152
> +    Erased 2097152 bytes from address 0x00000000 in flash
> +
> +    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +
> +    root@1:~# hexdump spi_read
> +    0000000 ffff ffff ffff ffff ffff ffff ffff ffff
> +    *
> +    0200000

it's not enough. If the flash comes erased by default, and erase opcode
is ignored, we won't catch it. Thus we'll need a second erase, after we
verify the write.

> +
> +    root@1:~# sha256sum spi_read
> +    4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
> +
> +    root@1:~# mtd_debug write /dev/mtd0 0 2097152 spi_test
> +    Copied 2097152 bytes from spi_test to address 0x00000000 in flash
> +
> +    root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
> +    Copied 2097152 bytes from address 0x00000000 in flash to spi_read
> +
> +    root@1:~# sha256sum spi*
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_read
> +    c444216a6ba2a4a66cccd60a0dd062bce4b865dd52b200ef5e21838c4b899ac8  spi_test

here again:
	root@1:~# mtd_debug erase /dev/mtd0 0 2097152
	root@1:~# mtd_debug read /dev/mtd0 0 2097152 spi_read
	root@1:~# sha256sum spi_read


> +
> +    root@1:~# mtd_debug info /dev/mtd0
> +    mtd.type = MTD_NORFLASH
> +    mtd.flags = MTD_CAP_NORFLASH
> +    mtd.size = 8388608 (8M)
> +    mtd.erasesize = 4096 (4K)
> +    mtd.writesize = 1
> +    mtd.oobsize = 0
> +    regions = 0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
