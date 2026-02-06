Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A44DEE6B45
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 17:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CpsBr7ZxBR+WNdvxsuSH1FOhOkg63W2usELqSiECqaI=; b=nfReHcV1z09/TM
	xHYWcPL+EnriEPvcZrWBLSVMklpqt4nOW8JnR6Av7T1t7GKbSuGUyhLVy52jjXhDBFISuzAcLXx6d
	esTGiivM8WHUReEGTA9wic8vOfC12A4uszO9PN3zjsQCiddFvhUyRUkdOlfFxbvluUCnTBF4P9FgL
	8mKWaKnPEPC7u6RkOvkypzHdd9Tfd5gZ+TAHnaMv6qKJwfIeYFiHyvvB0kVIvr4wM/6Qy9bW/BpN/
	wKWIq52mWrL92cybvUF3b2f64BqI5mung52wcsx5DqqR61yQRgVJ7TGK4agLcK/LksbMv2Tnq6tuj
	mew6QxUQsUbDYvAPB3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQ3r-0000000Bdva-3fNC;
	Fri, 06 Feb 2026 17:56:07 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voQ3p-0000000BdvH-048w
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 17:56:06 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-382f0732612so6428581fa.1
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 09:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770400562; cv=none;
        d=google.com; s=arc-20240605;
        b=R3OD49FwzwckzxoxpuYfbRF1IjYjsWj7WVN1mn6cTCAudd328JPZ61Z9ncGoIZ1cGZ
         NpeyzslSS7jTsS3sL9m7QAbnEKC+bGAnm7V6BhfT6oPtHg63diXw+wzl9T09CoHeea85
         xwbEZZy+IjGg1U0Gpg99yf5JxTtClaCHidjbHeFk/vDHaUJvJ5qxx+c+DPL3ihYXbVeh
         s09rex0Xs+U4quM2SWuk2cNbntAlXhX3QGtawaK12lJVxmzDFVhKI7cQqas6mT/upBBc
         D+WTqHcMS23nthSoQM9nCnGVvUiawRnEst+bD3cJbM2gi+74l82pQZzGQtP9Plb76YWl
         /Jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=q8kxVDUGhiSlFDsGsGtilgcUfUBCSynTPCrH5G1wS5c=;
        fh=TFov4JuW4s4MeZmKQvhzKfADMpRVOFqx1Ag4LFLut38=;
        b=EWXlVm2la1eo8fG7yZ57z43qTqaC5V7jq4U3Z3csYcRhfY8HcSKdmrrVyemgIqD+dC
         KtP37x+w1MYCFGCpRL8cU6d+xCWqYZTZ+3KAZOyOtylH7Lwe+Ii3fh9hYrH6dJ3wz3xY
         alPk4qxGWJCrb8rKN6cXUYm3OE/Apalg2631RaJWSs3UMjmFbwTTzB5miSSI7rWKvDGa
         rqoYwZ6ZH2EeWZmISTcdHDuBg4r+w4okFaChCT0m+DzKzmudQeIOEdDi322zTzULXJuB
         BjkvarodVydZnis2C3UhGfPD33ip5Ec+zCX5H26kUqMv6gand0uakUXoTnxBV+VWG+8Z
         lbGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770400562; x=1771005362; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q8kxVDUGhiSlFDsGsGtilgcUfUBCSynTPCrH5G1wS5c=;
        b=JFmoPla5fca/QHAaACcRV+MYOyaDAbKl2G2PdedEKPs3PMhujfWnttseppSdt7d4Yn
         KvDwPJGyrTPMmgGO+6s3hgAHy/nV64TQ3eCBQop2vPqwuft1WxWWsbqQmcGKPB/+jxbW
         DvAYkz2oyph0horp/KcY9dFc0+bYNZW+UID9C79HWX2bzVAusvfvSv87DsrJeYyB62n8
         Akb7p8eL0hinhWQgBYpO/udl+UfkKwYjUTRum3Iusywf8ZmxGNb+dHJ0gjTmvTyxUk7N
         idARhxKB0LxQkPUQxsywZRxdwPd6Y9UDsl+cFhNbZ2YdwhgWvXsv6Y87LqLUmL0VRXs+
         tNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770400562; x=1771005362;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q8kxVDUGhiSlFDsGsGtilgcUfUBCSynTPCrH5G1wS5c=;
        b=o53uvY7xb45XZuGDJzJ3fbbMKVxJSHa7mwQVZePmyKK14MnSXln+h3WKPtSDBFTINR
         ok+UtiAmTpYicVItdSKb72Pjw4hd2i0CRo091fUnK+0mhu2Z3tti84jLbQgxP7xav+8B
         nDTVthwpdUE+huj9iPCnmyxrxqaOhQKQtwLkOMeasLx6hXTOadzRXEsdXj+qqMN27wpq
         oq3riGqkOw5kupSbjtyjk4xBZKPEauTJENVTwUUG9/Hy6Nj8XYnszFK6FtaVsXJHjj2d
         pi9hiJR0v6zOT7S4Pb7GWCtQOQdIzQxFvLNG51reWgSIVWBAjqdFioy4LVPAu5pYHy99
         vfUA==
X-Forwarded-Encrypted: i=1; AJvYcCUzzYXsmgD4V+buDgO+nQtwHnw0qvnJEyC7+JGs7Rv28nVg28d3EAJtdlTrNjc906WZd69S/JweE0Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5eS3myJwsGfBaLIPPEEapMOO4KyEY+1Dy9y3/3GdN9mwRAW3W
	POpVm3QiN2t0ShpcfIhFHYhR6G0GLSgUEXTEn7XliwNd+EBjyMh6/RKTlaQY1nq6vWa1UdejB5l
	Sh5XvYgYcP+CITe/8G+DtfXpah2EWvO0=
X-Gm-Gg: AZuq6aIxjBr0mSA5WuDL4HblsdW907C5t9PBTaRzbSgFn+eboVl95KEcknvsn6EiHEz
	jN+OWp3uw6zR7xtevufcsQIQNS5qcSwRZU83xQh0u/2SbiYKwdPzyiBQF0BlXJB4YXZ/CAVyrzI
	0PsovySkD6yL+lo6AWzxodBVMmZlr6SiGgUrw1INcPnAbii8NS7vSUZl0lXtvzPqu95IViLntjb
	jfhrrdZUPrSECTHjJEYHlxVLbvvNPNTpIIAaGdOC2M6Vy8EOwZ/caCo4Z2wS9MPTgJEdC7jvb/W
	M+J3PakfWTvxMskjqWNaKNmo/zA=
X-Received: by 2002:a05:651c:54d:b0:384:9355:6a3c with SMTP id
 38308e7fff4ca-386b50cabe2mr11749381fa.24.1770400561931; Fri, 06 Feb 2026
 09:56:01 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 6 Feb 2026 14:55:50 -0300
X-Gm-Features: AZwV_QioU8KiIiOOC8Njw3nNJBOGL-MqyzHYdCzSGvYQJkZiGSUbEiGtfQhPhv4
Message-ID: <CAOMZO5Bdxv2ifJ8XUq-dcE=NZ=DJdDfw+du-CQ_BTUigxcKV6A@mail.gmail.com>
Subject: SPI-NAND crash on linux-next
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_095605_167234_04195F44 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
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

With kernel 6.19-rc8, the W25N02KVZEIR SPI NAND flash is correctly
detected on a Rockchip board:

[    2.012543] spi-nand spi0.0: Winbond SPI NAND was found.
[    2.018512] spi-nand spi0.0: 256 MiB, block size: 128 KiB, page
size: 2048, OOB size: 128
[    2.027874] 5 fixed-partitions partitions found on MTD device spi0.0
[    2.035035] Creating 5 MTD partitions on "spi0.0":
[    2.040387] 0x000000000000-0x000000040000 : "env"
[    2.069278] 0x000000040000-0x000000140000 : "idblock"
[    2.077356] 0x000000140000-0x000000240000 : "uboot"
[    2.085266] 0x000000240000-0x000000a40000 : "boot"
[    2.095699] 0x000000a40000-0x000010000000 : "ubi"


When I try linux-next 20260205, it crashes:

[    1.963763] 8<--- cut here ---
[    1.967204] Unable to handle kernel NULL pointer dereference at
virtual address 00000004 when read
[    1.977285] [00000004] *pgd=00000000
[    1.981297] Internal error: Oops: 5 [#1] SMP ARM
[    1.986460] Modules linked in:
[    1.989876] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc8-next-20260205-00011-g45de7a4ee41d #8 VOLUNTARY
[    2.001935] Hardware name: Generic DT based system
[    2.007288] PC is at spinand_match_and_init+0x13c/0x4a8
[    2.013137] LR is at 0x2
[    2.015966] pc : [<c07c9dfc>]    lr : [<00000002>]    psr: a0000053
[    2.022969] sp : d0811b50  ip : 00000000  fp : c0b66924
[    2.028808] r10: c0b66900  r9 : c195c7e4  r8 : c0b668f8
[    2.034646] r7 : c195c3cc  r6 : 00000000  r5 : c0b668b0  r4 : c195c040
[    2.041940] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : c101db48
[    2.049237] Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM
Segment none
[    2.057312] Control: 10c5387d  Table: 0000406a  DAC: 00000051
[    2.063732] Register r0 information: non-slab/vmalloc memory
[    2.070062] Register r1 information: NULL pointer
[    2.075319] Register r2 information: NULL pointer
[    2.080577] Register r3 information: NULL pointer
[    2.085835] Register r4 information: slab kmalloc-4k start c195c000
pointer offset 64 size 4096
[    2.095577] Register r5 information: non-slab/vmalloc memory
[    2.101903] Register r6 information: NULL pointer
[    2.107161] Register r7 information: slab kmalloc-4k start c195c000
pointer offset 972 size 4096
[    2.116996] Register r8 information: non-slab/vmalloc memory
[    2.123322] Register r9 information: slab kmalloc-4k start c195c000
pointer offset 2020 size 4096
[    2.133253] Register r10 information: non-slab/vmalloc memory
[    2.139676] Register r11 information: non-slab/vmalloc memory
[    2.146099] Register r12 information: NULL pointer
[    2.151452] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    2.158167] Stack: (0xd0811b50 to 0xd0812000)
[    2.163038] 1b40:                                     00000002
c0b662cc c0b6228c c195c040
[    2.172181] 1b60: 00000002 c0b62290 00000002 c195c440 c0cc2990
c07ca1c4 c195c040 00000001
[    2.181316] 1b80: 00000000 c1d4f800 c1d4f800 c07ca4e4 c191e900
c0ad7764 00000080 00000dc0
[    2.190460] 1ba0: c191e900 c02dbdb8 00000000 00000000 c1bbbf80
c1d4f800 c1d4f800 c1bbbfc0
[    2.199603] 1bc0: c1d4f9a8 c0740a98 c1bbbf80 00000053 c1d4f800
c0741204 c1d4f800 00000000
[    2.208747] 1be0: c1d4fc00 b445b6c1 c1d4f800 00000000 c101c0f4
00000000 c1998740 c1013e5c
[    2.217891] 1c00: d0811d44 c073c000 c1d4f800 c101c0f4 c1d4f800
00000000 c1998740 c073c288
[    2.227033] 1c20: 60000053 c1013e5c c10972d4 c101c0f4 c1d4f800
00000000 c1998740 c073c468
[    2.236176] 1c40: 00000001 c101c0f4 d0811c9c c1d4f800 c1998740
c073c5d0 00000000 c1998700
[    2.245318] 1c60: d0811c9c c073c53c c1998740 c073a2dc c1d4fc84
c199876c c1d67cb8 b445b6c1
[    2.254463] 1c80: d0811d44 c1d4f800 00000001 c1d4f844 c1998700
c073c944 cffceae4 c1d4f800
[    2.263597] 1ca0: 00000001 b445b6c1 c1998700 c1d4f800 c1998700
c073cb9c c1d4f800 c1d4f800
[    2.272742] 1cc0: c1998700 c073b110 c1d4f800 00000000 cffce918
c1d4fc00 00000000 c0738cb8
[    2.281885] 1ce0: c0cc2990 c07ecaa4 c1d4f800 00000000 c189a410
b445b6c1 00000000 c1d4f800
[    2.291029] 1d00: c1d4fc00 c189a410 00000000 c0cc2828 00000001
c07ef0d8 00000000 c1d4f800
[    2.300171] 1d20: cffce90c c1d4fe1c c0cc2828 c07ef984 00000000
c191e900 00000004 c1d4fc00
[    2.309315] 1d40: ffffffff 047868c0 c1d67080 00000000 c189a410
a0000053 c189a5b8 c0740a98
[    2.318457] 1d60: c1d67080 c0e966e0 c189a410 c0741010 c0cb18b0
00003e00 cffce90c b445b6c1
[    2.327602] 1d80: 00000000 c1d4fc00 00000000 cffce90c cffce970
c0cc2cbc c189a510 00003e00
[    2.336744] 1da0: c0d3fa54 c07f0114 c1d67640 0000001f c19a2b80
c189a410 ffffffff c1cb8000
[    2.345887] 1dc0: c1d4fc00 c189a410 c189a410 c1d4ff40 c189a510
00003e00 c0d3fa54 c07f03e8
[    2.355030] 1de0: c1cb8000 c1d4fc00 c189a400 c07f5db8 00000000
00000000 c1d4ff40 c06c2e28
[    2.364174] 1e00: c189a410 c101fcf4 c101fcf4 00000000 c189a40f
c0ced088 c0e5c858 c073eb74
[    2.373316] 1e20: c189a410 00000000 c101fcf4 c073c000 c189a410
c101fcf4 c189a410 00000000
[    2.382460] 1e40: c189a40f c073c288 60000053 c0ced088 c10972d4
c101fcf4 c189a410 00000000
[    2.391603] 1e60: c189a40f c073c468 c189a410 c101fcf4 c189a454
00000001 c189a40f c073c6fc
[    2.400746] 1e80: 00000000 c101fcf4 c073c644 c181df00 c1d679b8
c073a028 c181df00 c181df58
[    2.409889] 1ea0: c1982934 b445b6c1 c0e2a8dc c101fcf4 c1d67980
00000000 c181df00 c073b314
[    2.419034] 1ec0: c0cc355c 00000000 c101fcf4 c0e2a8dc c0e5c838
c191e900 00000000 c073d788
[    2.428176] 1ee0: c104ce60 c0e2a8dc c0e5c838 c01109cc 00000492
00000000 c18b5385 c18b5300
[    2.437320] 1f00: c18b5384 c01572f4 c18a290c c0cc4298 000000ea
00000000 00000000 c0e004dc
[    2.446462] 1f20: 00000006 00000006 c191e900 c18b539b c18b53a6
b445b6c1 0000001b b445b6c1
[    2.455606] 1f40: c18b5300 c0e86768 c18b5300 c0e5c838 00000007
c104ce60 c0ced088 c0e0145c
[    2.464740] 1f60: 00000006 00000006 00000000 c0e004dc 000000ea
c0e004dc c0ad3fac c0f04f80
[    2.473885] 1f80: c0ad3fac 00000000 00000000 00000000 00000000
00000000 00000000 c0ad3fc4
[    2.483026] 1fa0: 00000000 c0ad3fac 00000000 c010014c 00000000
00000000 00000000 00000000
[    2.492170] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.501312] 1fe0: 00000000 00000000 00000000 00000000 00000013
00000000 00000000 00000000
[    2.510453] Call trace:
[    2.510464]  spinand_match_and_init from spinand_manufacturer_match+0x5c/0x7c
[    2.521273]  spinand_manufacturer_match from spinand_probe+0x300/0x870
[    2.528577]  spinand_probe from really_probe+0xc8/0x2c8
[    2.534424]  really_probe from __driver_probe_device+0x88/0x1a0
[    2.541044]  __driver_probe_device from driver_probe_device+0x30/0x104
[    2.548345]  driver_probe_device from __device_attach_driver+0x94/0x108
[    2.555742]  __device_attach_driver from bus_for_each_drv+0x84/0xdc
[    2.562759]  bus_for_each_drv from __device_attach+0xac/0x1d0
[    2.569189]  __device_attach from device_initial_probe+0x3c/0x48
[    2.575907]  device_initial_probe from bus_probe_device+0x28/0x7c
[    2.582726]  bus_probe_device from device_add+0x564/0x74c
[    2.588770]  device_add from __spi_add_device+0x14c/0x21c
[    2.594808]  __spi_add_device from of_register_spi_device+0x5c0/0x970
[    2.602017]  of_register_spi_device from spi_register_controller+0x3e0/0x6a0
[    2.609908]  spi_register_controller from
devm_spi_register_controller+0x14/0x58
[    2.618177]  devm_spi_register_controller from rockchip_sfc_probe+0x2b0/0x468
[    2.626163]  rockchip_sfc_probe from platform_probe+0x5c/0x98
[    2.632591]  platform_probe from really_probe+0xc8/0x2c8
[    2.638533]  really_probe from __driver_probe_device+0x88/0x1a0
[    2.645152]  __driver_probe_device from driver_probe_device+0x30/0x104
[    2.652452]  driver_probe_device from __driver_attach+0xb8/0x1bc
[    2.659162]  __driver_attach from bus_for_each_dev+0x70/0xc4
[    2.665493]  bus_for_each_dev from bus_add_driver+0xcc/0x1ec
[    2.671821]  bus_add_driver from driver_register+0x7c/0x114
[    2.678058]  driver_register from do_one_initcall+0x48/0x2b8
[    2.684393]  do_one_initcall from kernel_init_freeable+0x1dc/0x268
[    2.691314]  kernel_init_freeable from kernel_init+0x18/0x12c
[    2.697739]  kernel_init from ret_from_fork+0x14/0x28
[    2.703390] Exception stack(0xd0811fb0 to 0xd0811ff8)
[    2.709035] 1fa0:                                     00000000
00000000 00000000 00000000
[    2.718178] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    2.727321] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.734718] Code: e3500000 0a0000d9 e58405c8 e5952064 (e5923004)
[    2.741612] ---[ end trace 0000000000000000 ]---
[    2.817296] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    2.825900] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

I haven't started bisecting yet, but just wanted to report in case
someone has any suggestions.

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
