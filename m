Return-Path: <SRS0=+yQj=7O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5268DC433E4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 18:42:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22219206A4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2020 18:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="doVQhzyf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CIB42k/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22219206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gksAjVVzhRZ/J9KxcBFtzPhOP6JkHlUlqHtCNBlpFaM=; b=doVQhzyfu5KD7D
	dG7O8e+ZhF2jC7GGP3JpcwbvuM5qt/T6v1CDQeG1T7j2/Tj38HZokE5LpMu5uXdxmWPGWlSzzSUJ+
	SC7URAGtAM1m4kHIjcuIOC3L7cUzGnKcro3vlFUgEdFC7/amqGwxz43T8pv7Cuq75oN93B6w1Rg+/
	4F6kVpBloDN/L4Z3TBlf6ma3Fs2fpQ8GTv6a0aVsoLdpbX/LIFzjhHIc6y49iHJI/hRd594IvsNxj
	xImpEkY3Fr7c5399b0l4UfbTXiwDNmZuVS7jSvqkWplGN+bcCQLXWTQJFIXmptLgcCTCptRnJLvhk
	rqtjixLTFAqrZj3nJRYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpNg-00041g-LU; Mon, 01 Jun 2020 18:41:52 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpNd-00040s-VO
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2020 18:41:51 +0000
Received: by mail-qk1-x743.google.com with SMTP id n11so10065002qkn.8
 for <linux-mtd@lists.infradead.org>; Mon, 01 Jun 2020 11:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FikAMKI4o/xw8RG90T18ptci7RxQ7GU/gGOd0A1sjQo=;
 b=CIB42k/jf7R+meICbACbqkicfidwEMwROqz7aj1pRKURsTX2QHYKXeaghSJlIxLK/E
 kesT4NuHLaLpUcwTqnqiJhilMrsWYFZmLAlE+CzWVfDiME3kcebCsCu2RwK6StVfNyqi
 jGzAuZmmWoIN467rlt16CEaTUTjDdphcaZ9QGT6I0Q80fEnMEjtOb/Yml3JRy6ZamzMa
 R/PnCOVrSQJdI1sTfHscNIJLsbBOaDka0XPynGC3F/z0VinXVNBm0K6Oj5SyKfksK+WB
 2rlKjsxv1ZXSqnMnzhQ5kwFWR5opLxcnxVCWJIsVCGUXbaZGAKhon6ehxxzBcHnxudxr
 1sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FikAMKI4o/xw8RG90T18ptci7RxQ7GU/gGOd0A1sjQo=;
 b=JNDUczgDf/w4EoCEjsis1KGhUS4nWpdUpT3K+D4rdfVCEvsDdHIanF/0rbl2QlbLrQ
 XwYfR1Q3HKkr8dZZbUoro2EhUtUqJx+ccGEpUaG4/kYzSC61Ol/RLS98f/SM/H2FKUDk
 r4KjrJyI0cclPWW0oGAL0vxv92o8MLjTHPuJW7nUvfQTSC+9/+8J2TLN6IiyXtVygdzq
 hzosp5dQABkrife4b0TR/qhfZt0myHAOt3HeCgoMswI+X8kET4Ry3pxWN7HweyemsRz3
 6I73VOVwUaWLZ/1zhtlVi7Bv+tXZYBGg7CyByg554ZAaVwBhwVoQ9IRY4jMf5Om1mDUn
 dVrA==
X-Gm-Message-State: AOAM531fq7yvKjVWr/D52LtZEiAvskTtL/nAW7MV/KL93amWDp7wfYLD
 n7XI4s4zECka0S4sBCzDdGbW7k242iwbkMSWsYRZrg==
X-Google-Smtp-Source: ABdhPJzj5zduDXm1Cb1ZyIq4qvILe/C1fKOh+oNZEb4+oAEx9C1rK+ilP80tAV3pVIMSIfvjZ+gLIvqGQ5vH3LZaP+s=
X-Received: by 2002:a05:620a:15f4:: with SMTP id
 p20mr19989459qkm.283.1591036908515; 
 Mon, 01 Jun 2020 11:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <1826007.xKk83PxPNM@192.168.0.120>
In-Reply-To: <1826007.xKk83PxPNM@192.168.0.120>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 1 Jun 2020 20:41:37 +0200
Message-ID: <CAFLxGvz-nHLSS7Ja=stqG75v30DqjZCEjh_aS_NNWkHbC6z5yw@mail.gmail.com>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.8
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_114150_059180_38FF71F4 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jun 1, 2020 at 1:27 PM <Tudor.Ambarus@microchip.com> wrote:
>
> Hi, Richard,
>
> This is the SPI NOR PR for 5.8. Small changes, nothing outstanding.
>
> Cheers,
> ta
>
> The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
>
>   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
>
> are available in the Git repository at:
>
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/
> spi-nor/for-5.8

This should be a git:// URL. In this case no big deal since I do have
ssh access to this repo.
But this is not always the case.

> for you to fetch changes up to e8aec15dd5842b5b11b0e621a2293348d3574a61:
>
>   mtd: spi-nor: winbond: Fix 4-byte opcode support for w25q256 (2020-05-31
> 08:34:16 +0300)
>
> ----------------------------------------------------------------
> SPI NOR core changes:
> - add, update support and fix few flashes
> - prepare BFPT parsing for JESD216 rev D
> - kernel doc fixes
>
> ----------------------------------------------------------------
> Jungseung Lee (1):
>       mtd: spi-nor: micron-st: Enable locking for n25q00
>
> Mantas Pucka (1):
>       mtd: spi-nor: winbond: Fix 4-byte opcode support for w25q256
>
> Mason Yang (2):
>       mtd: spi-nor: macronix: Add support for mx25l51245g
>       mtd: spi-nor: macronix: Add support for mx25u51245g
>
> Pratyush Yadav (2):
>       mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths
>       mtd: spi-nor: sfdp: prepare BFPT parsing for JESD216 rev D
>
> Sascha Hauer (1):
>       mtd: spi-nor: Add support for Cypress cy15x104q
>
> Sergei Shtylyov (10):
>       mtd: spi-nor: move #define SPINOR_OP_WRDI
>       mtd: spi-nor: fix kernel-doc for 'struct spi_nor'
>       mtd: spi-nor: fix kernel-doc for spi_nor::mtd
>       mtd: spi-nor: fix kernel-doc for spi_nor::reg_proto
>       mtd: spi-nor: fix kernel-doc for spi_nor::info
>       mtd: spi-nor: fix kernel-doc for spi_nor::spimem
>       mtd: spi-nor: core: fix kernel-doc typo for
> spi_nor_manufacturer_init_params()
>       mtd: spi-nor: core: fix kernel-doc typo for spi_nor_[{info|sfdp}
> _]init_params()
>       mtd: spi-nor: spansion: fix writes on S25FS512S
>       mtd: spi-nor: sfdp: add/use local variable in spi_nor_parse_bfpt()
>
> Takahiro Kuwano (1):
>       mtd: spi-nor: spansion: Enable dual and quad read for s25fl256s0
>
> Tudor Ambarus (4):
>       mtd: spi-nor: Uniformize the return value in spi_nor_*_ready()
>       mtd: spi-nor: Fix description of the sr_ready() return value
>       mtd: spi-nor: spansion: Differentiate between s25fl256s and s25fs256s
>       mtd: spi-nor: Fix SPI NOR acronym
>
> Xiang Chen (1):
>       mtd: spi-nor: Enable locking for n25q128a11
>
> Yicong Yang (1):
>       mtd: spi-nor: Add support for s25fs128s1
>
>  drivers/mtd/spi-nor/Kconfig                  |  4 ++--
>  drivers/mtd/spi-nor/controllers/Kconfig      |  4 ++--
>  drivers/mtd/spi-nor/controllers/aspeed-smc.c |  2 +-
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c   |  2 +-
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c  |  2 +-
>  drivers/mtd/spi-nor/core.c                   | 22 +++++++++++-----------
>  drivers/mtd/spi-nor/macronix.c               |  6 ++++++
>  drivers/mtd/spi-nor/micron-st.c              |  6 +++++-
>  drivers/mtd/spi-nor/sfdp.c                   | 34 +++++++++++++++++
> +----------------
>  drivers/mtd/spi-nor/sfdp.h                   | 11 +++++++++--
>  drivers/mtd/spi-nor/spansion.c               | 44 +++++++++++++++++++++++++++
> ++++++++++++-----
>  drivers/mtd/spi-nor/winbond.c                | 29 ++++++++++++++++++++++++++
> +--
>  include/linux/mtd/spi-nor.h                  | 24 ++++++++++++------------
>  13 files changed, 134 insertions(+), 56 deletions(-)

Pulled, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
