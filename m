Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DDEC43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 22:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119C8213A2
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 22:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+PT9H3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gateworks-com.20150623.gappssmtp.com header.i=@gateworks-com.20150623.gappssmtp.com header.b="vILPzd5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119C8213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gateworks.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tv4eL5xNXwW7Xhz/vsDh6Xvy3tPVBshkQj/3g4gROfs=; b=a+PT9H3lXwZZOr
	ASAjrYxI5wcPw4xq8uOeBw57cHlIqTN+uUuTND4SWh6hEwvfyIjsB7Tv4TgEm6X2FM6LmeQ7rDbPF
	d8j82l/bYxE62nSDm6jA3xG+bNPwZtD3Zqf8G75/ESM/jFZlLiVyrprMFFLc+ttL32zz5+XmbSLJR
	4QajqdcXyA3dLSFnxlk2R30re73jK+hHPVvex8o4hb0Xf3fuRGQozXxjRbcmWmx/Ie9MgeIzOdp7/
	2JwsfeQCAwhLPz/Ws0ZTfd/SRlyew8MY8He+UMubcnsTNCoJ0Iw9/VYz8dvYOVcbd1f4M5ZknL99o
	+RQVGoZ5oHANl7/MgUNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz7vJ-0004M4-Ny; Wed, 27 Feb 2019 22:43:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz7vG-0004Le-J1
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 22:43:32 +0000
Received: by mail-wr1-x430.google.com with SMTP id t18so19832804wrx.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2019 14:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqzjZvLUyXqvRqbTMRDVySvJWas55s/Xrrg35KeLrGs=;
 b=vILPzd5G+J4cOjZJv0VjLSsdU9yFHG2lJlEm6+NZwMGmSNRU2y5iMbamTiRXbvefkO
 HuhQmm9aUIoF6JMY7e/zxKG+aS+pSN/i2Toi0Z1oXZ0rh3tpNWcUTgO2guNaYAK8+LJA
 e8WAEsS/hLL5vAyxAJm/C4YUBtYmcv0bVSb55jioFajqFo4rHOPXOUbMdQhu/oOwXe8E
 /ZJqbqfn8aR9k3hW7dmuMn48hWib5Hs1J1Wr3mc/U3cQbrYTiYNbxMUV+wdeq0bk6b4J
 OxDc0GJAyn4P6rRpcIs5vF7eo6EYNWM7FKRRmjsgw7wR8z+mCBoPi5gAMVBw5owqVRfu
 HWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqzjZvLUyXqvRqbTMRDVySvJWas55s/Xrrg35KeLrGs=;
 b=n9VF8UCs34hYvLPM/wdT5w2WrpATemyLZyvg4SxK4R1OXlJ/b0HiBL3ct58BEwVimd
 /RH2LkCOqbfuiYwunkAp++XwVPBK9S36IlYj+AIAOIJth11PsfnguWg3Dx66gmYYo7k3
 2EQqq4BjT18nWG0w1byqWlUemmvdKlq9Ls30JRntXy+TS6ga4D2KVxJAeLybjhdoFGGy
 Me4V7Q5qM4jzmehrZyt14ojd0AhugoQ8qEuDeGxcBNs4jZL7VvVcLZIge4ROZ6ju4+3y
 k100mc7AlKuaLZIuwSIAK2SQIyEO+A7q0/njIJkmxffIP3ywP6xR8afve5yC8nrawX3D
 V3yw==
X-Gm-Message-State: APjAAAXdGTlfu364PRCT7EKe8JDFH8GuGf7OP01j+xRau/8JnyjEF/Vt
 cET2Z6wbOd9OWGh6gHEVByqY75qaWZmA/XLQOTZ0mg==
X-Google-Smtp-Source: APXvYqzIMloDVSzJfIZEsh5hLbGL48vGosHLXPGZkXUOCBwjVCnrGqfVsYQHi1WwQg4CjBczRVobbZAbTWk91D6qE+w=
X-Received: by 2002:a5d:6846:: with SMTP id o6mr3897487wrw.160.1551307408240; 
 Wed, 27 Feb 2019 14:43:28 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
 <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
In-Reply-To: <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 27 Feb 2019 14:43:17 -0800
Message-ID: <CAJ+vNU1xtj3f7GefcyY=s7RmNxtBjFpefaG57Xmeq80w0=monQ@mail.gmail.com>
Subject: Re: ubi/ubifs performance comparison on two NAND devices
To: Richard Weinberger <richard.weinberger@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_144330_774513_B95612CA 
X-CRM114-Status: GOOD (  19.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 27, 2019 at 2:13 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Wed, Feb 27, 2019 at 9:39 PM Tim Harvey <tharvey@gateworks.com> wrote:
> >
> > Greetings,
> >
> > I've got two embedded boards (IMX6 using gpmi-nand driver) that are
> > identical except for the NAND FLASH and am trying to understand why
> > I'm seeing a massive performance difference when it comes to ubi and
> > ubifs (in particular ubi scanning and UBIFS resizing).
> >
> > Micron MT29F16G08ADACAH4:
> > - page size: 4320 bytes (4096 + 224 bytes)
> > - block size: 64 pages (256K + 14K bytes)
> > - device size: 16Gb
> > - 30ns per-block read
> > - 300us per-block program
> > - 2.0ms per-block erase
> >
> > Cypress S34ML16G202BHI000
> > - page size: 2176 bytes (2048+128)
> > - block size: 64 pages (128K + 8K)
> > - device size: 16Gb
> > - 25ns per-block read
> > - 300us per-block program
> > - 3.5ms per-block erase
> >
> > The parts are relatively close in per-block performance but because
> > the Micron has twice the block size I think of it being twice as fast
> > on a per-byte basis compared to the Cypress and I do see this relative
> > performance when testing read/write/erase both in modern U-Boot and
> > latest Linux. What doesn't add up is that the Cypress part takes about
> > 7x longer to complete the ubi attach (between 'attaching mtd' and
> > 'scanning is finished' and about 100x longer to complete the UBIFS
> > free space fixup (between 'start fixing up free space' and 'free space
> > fixup complete') performed on the first mount of a ubifs filesystem
> > that was created with auto-resize enabled.
> >
> > Both parts are 2GiB and the ubi scanning on attach in the kernel goes
> > from ~4s on Micron to ~28s on Cypress and the UBIFS free space fixup
> > goes from 0.5s on Micron to a whopping 56s on Cypress.
> >
> > Any ideas why would I be seeing this kind of performance difference
> > when the raw erase/read/write performance is (both datasheet and Linux
> > tests) only 2x slower? Anywhere I can look to improve performance of
> > the Cypress part?
>
> Let's focus as first step on UBI attach by scanning. Here UBI reads
> the first two
> (sub)pages of each block.
>
> Please figure whether in both setup subpages are used or not. Then
> measure how long
> it takes to read a single page.
> Given this numbers we can start with the detective work.
>

Hi Richard,

I suppose I should have provided:

[    6.438793] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xd5
[    6.445240] nand: Micron MT29F16G08ADACAH4
[    6.449362] nand: 2048 MiB, SLC, erase size: 256 KiB, page size:
4096, OOB size: 224
[    6.459037] Scanning device for bad blocks
[    8.784007] 3 fixed-partitions partitions found on MTD device gpmi-nand
[    8.790716] Creating 3 MTD partitions on "gpmi-nand":
[    8.795823] 0x000000000000-0x000001000000 : "uboot"
[    8.810841] 0x000001000000-0x000001100000 : "env"
[    8.819356] 0x000001100000-0x000080000000 : "rootfs"
[    9.355834] gpmi-nand 112000.gpmi-nand: driver registered.

and

[    6.014529] nand: device found, Manufacturer ID: 0x01, Chip ID: 0xd5
[    6.020907] nand: AMD/Spansion S34ML16G2
[    6.024917] nand: 2048 MiB, SLC, erase size: 128 KiB, page size:
2048, OOB size: 128
[    6.033385] Scanning device for bad blocks
[   10.689345] 3 fixed-partitions partitions found on MTD device gpmi-nand
[   10.696056] Creating 3 MTD partitions on "gpmi-nand":
[   10.701143] 0x000000000000-0x000001000000 : "uboot"
[   10.720392] 0x000001000000-0x000001100000 : "env"
[   10.729253] 0x000001100000-0x000080000000 : "rootfs"
[   11.793715] gpmi-nand 112000.gpmi-nand: driver registered.

So its taking 2.3s to scan the Micron and 5.4s to scan the Cypress
which is what I would expect (Micron 2x faster as it has similar read
time per block but half as many blocks)

> Did you also check what timings both NANDs are using?

No, where would I see these? Would this be something that can be
provided in device-tree or a nand chip-specific driver?

Currently I'm just relying on CFI... the 4.20 kernel I'm testing with
has the following enabled:
CONFIG_MTD_CFI=y
CONFIG_MTD_JEDECPROBE=y
CONFIG_MTD_GEN_PROBE=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_CFI_STAA=y
CONFIG_MTD_CFI_UTIL=y
CONFIG_MTD_PHYSMAP_OF=y
CONFIG_MTD_DATAFLASH=y
CONFIG_MTD_M25P80=m
CONFIG_MTD_SST25L=y
CONFIG_MTD_NAND_CORE=m
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND=y
CONFIG_MTD_NAND_GPMI_NAND=y
CONFIG_MTD_SPI_NAND=m
CONFIG_MTD_SPI_NOR=m
CONFIG_MTD_MT81xx_NOR=m
CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=y
CONFIG_SPI_FSL_QUADSPI=m
CONFIG_MTD_UBI=y
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_BLOCK=y

Thanks,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
