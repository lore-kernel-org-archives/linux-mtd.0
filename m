Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A135C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 17:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eAp7EJzDNBXMkm1fP/Yugao+9LadiPk2lZR8M1mDDnQ=; b=Nk20IaXmMXyUjE
	hjCQ/qiMoHGSqMkIuvfrnYyXT4+2CXke2bUeJbsoHY4FcF42C6c3q60LjfLL4nR5jNtGA2toweTh/
	3QnmcxvBhTrUn7UxibM3EzjYBhcdw9raoNVirgJNajLxwSjAM81saX4nilgFRrsK4pAs9EfRGcjOF
	JxFL4sFKS69SaCero3yHbWGf3FDlP/M5Q/SFQYg+CtFyvysvj/6SDAQpk+FKW/nQDYxJ2zQ9tDHVW
	eSaoX4RNoqNu53lfzv6bWLCufsvo1kzTyNxBCtCi7xYqTftnXesuHyNdR+yrKbKmkJ6a6YAw5dxkv
	AvshXWHuZhSlDI77TJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6ycu-00CbOP-5n; Mon, 10 Jan 2022 17:38:36 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6ycq-00CbMf-CM
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 17:38:33 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id e198so17348401ybf.7
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2022 09:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Pn6vNul4e8iM8CW/s9gLrUxSfmYfz22osJ3AQncpgc=;
 b=dYKHIkrcNLqV7aZ5YS2d0PD7VjHHEGH8HDRv9QyfT5dn+VCNyEcsW2FxN6Vmk0NMTf
 bcXskwMcgp7C8CIj99r8+LrXobvEIY19i80LN6AuCDpX89pf2S2gvaHXtRlwdJvzLoYC
 /ye74Evk/XKaQiHWGGykaQkyiEzGDQT55tc2NaFeqj5pFGnMrp3n2N6qW2oG9SjsiSSY
 aJRNYFTa7EBx3DZwxw1/waiUF74t9ATkYpmwHD5IgAKFRoZ7BAch8tO9/yTBh2ljMOSN
 1PyIrijWdjE4LtCR4zaWhrwO+Kk5ZMIkEHWvPLznZSDVHBnBkxBfqwETQ8Q7YtN0TDdz
 uI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Pn6vNul4e8iM8CW/s9gLrUxSfmYfz22osJ3AQncpgc=;
 b=h30hahXxemYAfERAevsfiJKAsES+u09OisW/ZgzwbKwuWNZpgYbUJD3IZS/IAP5Eyq
 LZkirdI5Pfy2kcAcSFPUWTugiLkuGEakviwMfpPCGiLDhIlyYtYOn0dnv1F91xnXDYBh
 EK0zq1PnytQvkpIebTnT6s4GA7MgAhzjVKsW2I2XiPFZ1K+VrhzyFLOcECEJqv6dx474
 76BpgAfmXHxp3W6NG4KIGpxeWxUh2AucAJSq3dUAo0y/811kmYvqrxZHESHleYre4HKN
 HUnteAY0mKEFG+sRF68s7/nmR1LCj2rx5j/uDunQGbybGPYw6/ODM2+N2nkX4MBzntg2
 k97w==
X-Gm-Message-State: AOAM532wLiwGcmBUFuHMF9YqFYK67M0IFW6J8kxxDgVAKAIfHzXQzUP4
 A0pu63J8Qdw3sdUr6aF3hi51jxXji9Mhfc59uEU=
X-Google-Smtp-Source: ABdhPJwcUSh0xH7r+hddfZUIZH6eKPebjm73mmFFYO2yTdvDNeKVFMfghW3SvqjRYFJPTH8P/2ccW96yDptlmUnXVLo=
X-Received: by 2002:a25:4153:: with SMTP id o80mr834176yba.147.1641836310214; 
 Mon, 10 Jan 2022 09:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20220107184614.2670254-1-f.fainelli@gmail.com>
In-Reply-To: <20220107184614.2670254-1-f.fainelli@gmail.com>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Mon, 10 Jan 2022 12:38:19 -0500
Message-ID: <CAC=U0a3V8973MqyCU2M=hG0bkhcNZN3kSySZGaZmFHnEZeqYRA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] BCMA support for brcmnand
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Cai Huoqing <caihuoqing@baidu.com>, 
 Colin Ian King <colin.king@intel.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>, 
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_093832_486902_F71667DB 
X-CRM114-Status: GOOD (  31.18  )
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

Florian,

On Fri, Jan 7, 2022 at 1:46 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Hi all,
>
> This patch series adds support for the BRCMNAND controller revision 3.4
> embedded in MIPS-based SoCs such as 5357, typically found in the Netgear
> WNR3500L v2 and other kinds of Wi-Fi routers. The upstream platform that
> uses this controller is under arch/mips/bcm47xx/ and does not use Device
> Tree (and probably never will by now). BCMA (Broadcom AMBA) is a special
> kind of discoverable memory mapped interface which requires the use of
> special accessors to read from/write to the hardware block.
>
> The integration of brcmnand into that SoC is a bit quirky in that every
> register offering byte level data about the flash (OOB, device ID, etc.)
> requires byte swapping. The command shift should also have been 24, but
> is in fact 0, took me a while to understand why no reads were actually
> working because of that.
>
> This has been tested with Linux 5.10.82 and Linus' master with OpenWrt
> and confirmed that the squashfs + jffs2 overlay that OpenWrt creates is
> entirely functional and that written data is made persistent.
>
> Changes in v3:
>
> - fixed a few typo/grammar errors in the commit messages, mention when
>   changes are non functional changes
> - removed the stray hunk in 2 to enable the static key
>
> Changes in v2:
>
> - re-ordered the patch such that the soc variable is initialized as
>   early as possible
> - corrected bug in the conversion of brcmnand_init_cs() which
>   incorrectly used the wrong device_node variable (parent instead of
>   child)
> - took Andy's feedback to make the test for a valid interrupt to be > 0
>   while calling platform_get_irq_optional()
> - utilized static branch (disabled by default) and conditional
>   compilation and confirm with disassembly that the generated code is
>   as efficient as before if not enabling the BCMA shim and as efficient
>   as possible if enabling BCMA shim
> - updated BCMA shim driver descriptor, author and added helper function
>   to encapsulate the container_of usage
> - added comment to explain why a slightly different platform device name
>   is used for the 5357-style NAND controller
>
> Florian Fainelli (9):
>   mtd: rawnand: brcmnand: Assign soc as early as possible
>   mtd: rawnand: brcmnand: Allow SoC to provide I/O operations
>   mtd: rawnand: brcmnand: Avoid pdev in brcmnand_init_cs()
>   mtd: rawnand: brcmnand: Move OF operations out of brcmnand_init_cs()
>   mtd: rawnand: brcmnand: Allow working without interrupts
>   mtd: rawnand: brcmnand: Add platform data structure for BCMA
>   mtd: rawnand: brcmnand: Allow platform data instantation
>   mtd: rawnand: brcmnand: BCMA controller uses command shift of 0
>   mtd: rawnand: brcmnand: Add BCMA shim
>
>  MAINTAINERS                                 |   1 +
>  drivers/bcma/driver_chipcommon_nflash.c     |  20 ++-
>  drivers/mtd/nand/raw/Kconfig                |  13 ++
>  drivers/mtd/nand/raw/brcmnand/Makefile      |   2 +
>  drivers/mtd/nand/raw/brcmnand/bcma_nand.c   | 132 ++++++++++++++++
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c    | 160 +++++++++++++-------
>  drivers/mtd/nand/raw/brcmnand/brcmnand.h    |  29 ++++
>  include/linux/bcma/bcma_driver_chipcommon.h |   5 +
>  include/linux/platform_data/brcmnand.h      |  12 ++
>  9 files changed, 321 insertions(+), 53 deletions(-)
>  create mode 100644 drivers/mtd/nand/raw/brcmnand/bcma_nand.c
>  create mode 100644 include/linux/platform_data/brcmnand.h
>
> --
> 2.25.1
>

The patch series as in v3  LGTM

Kamal

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
