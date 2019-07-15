Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872F9C76191
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 10:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BDFA2064B
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 10:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KipgckFT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ZYyigqqf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BDFA2064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrVSv/GD7myOmGGFtX4/P2cvmmooLmATzEGj+uXuTEk=; b=KipgckFTsTXUGl
	JublR3OqROb+FAyKOBhWEKTkejK5derNIZ4YZDrVF/DhqTzZOd/NsazQ4WGSTdl94p+627bC6NTB6
	gAy/Qqf8eosQS3DOyw8uhhyDt+nybde7ghV3QjLIpSmg4+lOJcEAPdrXe02nDWjLUa+jyliPYN6LG
	BIVPeImP/0RSGqPCk/P4cpdxLqK/14uUpYDlb5bxvmaq2vK/dQwjLceN+RJ2jP8dXE9pVn+QyHNmD
	hUU3IBe+s1iyAGbZiB/5XyE7+7abbrUJGtINMcdgv10VUWcsuDlBbmNLouf8gfzlHbJG+s8AWg20T
	ZUC/ejDi0TB2lu9mghyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hmyUS-0000zc-3h; Mon, 15 Jul 2019 10:45:52 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hmyUI-0000x7-LG
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 10:45:44 +0000
Received: by mail-vs1-xe43.google.com with SMTP id v6so11029613vsq.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m69Q++mc12a2NdGKc1ehjmZg7I2gwJhoO4eDVouumsY=;
 b=ZYyigqqfTJL1M1v1PbJny8OLbsPkDjGGDBR3VfZY/RXWLHKEl/KQK4jlw/2hFoYUKJ
 BAP7IlQ/rIebx9O3QXfuOYQN9KRgO1XiV0DM0I2Bx9ikTXL/ZBHnq6buUTFkqSYJO+QM
 ft1o2d3BU8wCUYObg0hqi8NMhO0JQg7UV0gvYWRwi5PyBZ8Gu6U9xNg21yqzjkn5kTbF
 Qlu1lat0RJHOrtbuqmUcKEaALrFCygdwVlOMfGPSXgYU/2JZvkwPpsA5eNn0jce3B/1p
 Q26PJ8z4nPqekv7aJdmpDaH4dMquwbydPLnX+VH32cUhVqZMk9jzNkSstcvxlq6wcpZ9
 +c3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m69Q++mc12a2NdGKc1ehjmZg7I2gwJhoO4eDVouumsY=;
 b=Hv/H6GGSy8DzFfZvYQ5DRtgAdgVot5qghvtnVmYRqnIojnpNU2U90Dp6GdXlFnG6nr
 mhxno+02Mq5ePrGC3c962lKqk0qfJoDoJ0aMy2L1CVyu1bKwTLkRPLTqMylBeYkAnEuY
 cPaPh3bHDRvP/5I84P0wz41jKaFucDBanT/m64XPUobKp/3jAUa6lWHwqccN7wtd+9K6
 2buJ/i8nGN/qHRZLwLSulKTWsuEsYn8SlFGu2zgt1i8W/kiA836aQFRbwai+xM4ybdD7
 cTQ/oHUjgXXkWdLHrBQr6FyIB4sC2da8Dp4Ca4gJ5yUdpg7ybJkQf2xvTz+5nGAj7t57
 ojBw==
X-Gm-Message-State: APjAAAUrLiY7B5DetT/kr89dbuOuSshWyGw9aXB1BwFIcB45yJV1yT3C
 WymDNenHzxqadqs79yI92pBy2/OOPkT0ZT0hoAGBhQ==
X-Google-Smtp-Source: APXvYqzUK7SwMuPo4ZL3JjgvyDVZtw0Ap9WNDsf6lO/m0M9uas49McrkrvqykfTKIOeehCC4Vj9JKrLUnWGRNxkLDYA=
X-Received: by 2002:a67:7c92:: with SMTP id
 x140mr16783284vsc.229.1563187541125; 
 Mon, 15 Jul 2019 03:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
In-Reply-To: <1562092745-11541-1-git-send-email-sagar.kadam@sifive.com>
From: Sagar Kadam <sagar.kadam@sifive.com>
Date: Mon, 15 Jul 2019 16:15:29 +0530
Message-ID: <CAARK3HkMz3AdcVyrteGmqczCaMDTYS1h9uALspm75RFE9c6jFQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] mtd: spi-nor: add support for is25wp256 spi-nor
 flash
To: marek.vasut@gmail.com, tudor.ambarus@microchip.com, dwmw2@infradead.org, 
 computersforpeace@gmail.com, miquel.raynal@bootlin.com, richard@nod.at, 
 Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_034542_762348_93430CC9 
X-CRM114-Status: GOOD (  22.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jul 3, 2019 at 12:10 AM Sagar Shrikant Kadam
<sagar.kadam@sifive.com> wrote:
>
> The patch series adds support for 32MiB spi-nor is25wp256 present on HiFive
> Unleashed A00 board. The flash device gets BFPT_DWORD1_ADDRESS_BYTES_3_ONLY
> from BFPT table for address width, whereas the flash can support 4 byte
> address width, so the address width is configured by using the post bfpt
> fixup hook as done for is25lp256 device in
> commit cf580a924005 ("mtd: spi-nor: fix nor->addr_width when its value
> configured from SFDP does not match the actual width") queued in
> spi-nor/next branch [1].
>
> Patches 1 and 3 are based on original work done by Wesley Terpstra and/or
> Palmer Dabbelt:
> https://github.com/riscv/riscv-linux/commit/c94e267766d62bc9a669611c3d0c8ed5ea26569b
>
> Erase/Read/Write operations are verified on HiFive Unleashed board using  mtd and
> flash utils (v1.5.2):
> 1. mtd_debug    : Options available are : erase/read/write.
> 2. flashcp      : Single utility that erases flash, writes a file to flash and verifies the data back.
> 3. flash_unlock : Unlock flash memory blocks. Arguments: are offset and number of blocks.
> 3. flash_lock   : Lock flash memory blocks. Arguments: are offset and number of blocks.
>
> The Unlock scheme clears the protection bits of all blocks in the Status register.
>
> Lock scheme:
> A basic implementation based on the stm_lock scheme and is validated for a different
> number of blocks passed to flash_lock. ISSI devices have top/bottom area selection
> in function register which is OTP memory. so we are not updating the OTP section
> of function register.
>
> The changes along are available under branch v5.2-rc1-mtd-spi-nor/next at:
> https://github.com/sagsifive/riscv-linux-hifive
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/log/?h=spi-nor/next
>
> Revision history:
> V6<->V7:
> -Incorporated review comments from Vignesh.
> -Used post bfpt fixup hook as suggested by Vignesh.
> -Introduce SPI_NOR_HAS_BP3 to identify whether the flash has 4th bit protect bit.
> -Prefix generic flash access functions with spi_nor_xxxx.
>
> V5<->V6:
> -Incorporated review comments from Vignesh.
> -Set addr width based on device size and if SPI_NOR_4B_OPCODES is set.
> -Added 4th block protect identifier (SPI_NOR_HAS_BP3) to flash_info structure
> -Changed flash_info: flag from u16 to u32 to accommodate SPI_NOR_HAS_BP3
> -Prefix newly added function with spi_nor_xxx.
> -Dropped write_fr function, as updating OTP bit's present in function register doesn't seem to be a good idea.
> -Set lock/unlock schemes based on whether the ISSI device has locking support and  BP3 bit present.
>
> V4<->V5:
> -Rebased to linux version v5.2-rc1.
> -Updated heading of this cover letter with sub-system, instead of just plain "add support for is25wp256..."
>
> V3<->V4:
> -Extracted comman code and renamed few stm functions so that it can be reused for issi lock implementation.
> -Added function's to read and write FR register, for selecting Top/Bottom area.
>
> V2<->V3:
> -Rebased patch to mainline v5.1 from earlier v5.1-rc5.
> -Updated commit messages, and cover letter with reference to git URL and author information.
> -Deferred flash_lock mechanism and can go as separate patch.
>
> V1<-> V2:
> -Incorporated changes suggested by reviewers regarding patch/cover letter versioning, references of patch.
> -Updated cover letter with description for flash operations verified with these changes.
> -Add support for unlocking is25xxxxxx device.
> -Add support for locking is25xxxxxx device.
>
> v1:
> -Add support for is25wp256 device.
>
> Sagar Shrikant Kadam (4):
>   mtd: spi-nor: add support for is25wp256
>   mtd: spi-nor: fix nor->addr_width for is25wp256
>   mtd: spi-nor: add support to unlock the flash device
>   mtd: spi-nor: add locking support for is25wp256 device
>
>  drivers/mtd/spi-nor/spi-nor.c | 343 +++++++++++++++++++++++++++++++++++-------
>  include/linux/mtd/spi-nor.h   |   8 +
>  2 files changed, 300 insertions(+), 51 deletions(-)
>
> --
> 1.9.1
>

Hi All,

Any comments on this series?

BR,
Sagar Kadam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
