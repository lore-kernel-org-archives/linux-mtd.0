Return-Path: <SRS0=DRVm=PC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338A6C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 18:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED70F60F36
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 18:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED70F60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wjwZq2LKu+RVEmB8xPWunQMoQTAPLtIXQHPWk2VkMo=; b=Ia4KfzHYZRehUO
	cfG4/LmpYay0hCzrRXJlwgduabOFmW1gIOe4KOB9ZRoq0i+mUP3GWens5DHs6Oln+7JIQ5c60cwdY
	chDEY5y6MLZcugMOwAh2QTjnrbEWKQVHqOVPIFZRJuYbnY1apKKzSN6Kt0Jl2GlJHnJ0Ej+nXWic3
	45EMaKTjbwSz8XbddHD1+X1OfuNa+692g+Ag1hpnae4fabGVZq3nCaputLrQyTZA1kDzP0BnEioK6
	TppjUneiodwpPpAQYMfiSD1vZ1Bta6FOn3uKaq3XlUySqt0KFSifCFKAhX68e63RM9j3VAPzaJc52
	wUexaVp7tTdE01H/M1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb5s2-004AZz-Pl; Thu, 14 Oct 2021 18:54:26 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb5rz-004AYf-3O
 for linux-mtd@lists.infradead.org; Thu, 14 Oct 2021 18:54:25 +0000
Received: by mail-ua1-x931.google.com with SMTP id q13so13325165uaq.2
 for <linux-mtd@lists.infradead.org>; Thu, 14 Oct 2021 11:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BKHCFm948WtIFO9qw+GGuKUrAJivRhq00DHQ7qnJVjk=;
 b=fgnpRd6OfQgfHMq4ohqOGPeSvsSvoFWgvlaSSL/paEL7InAdCmgZ7NP+GOp7rhVt+p
 cnq53zu1gKXqLTD9lDm8aQkeB0hxZ1R6kU2IM2DWkyCNbfXQ0BH5SJu5FpSIclqk/9Aq
 1zo34WGPCCjtLMfEejBr/8YWTGCScckTYKIeSNQKkggwzCeJ7yyX60A94F+iK4o2lMgd
 f+EZhJCoXx+YIbtk+hpY6G5+PRnMa4oTSBhwqXsdxPjSxXowtRnyHd3MyyF2AE+NERDP
 H+OQCPfmTFOksXUmbwcXg4puv6Js2N2aBCVVGuGQveYX3oc0Bg8wWj397DwjZaTiuo+Z
 VESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BKHCFm948WtIFO9qw+GGuKUrAJivRhq00DHQ7qnJVjk=;
 b=ScDUEZbDLKcft2hcoYAxcyQCn8sKPLL3UdR7EXM3AfrVpAu9N1koLiFbwqCkgRmLIb
 ivcZViU6/CLPxLLxD6+uIqC3Mp/xGVgrm2c3R1Ii16EYpDA+UYX1mSb+InlxJt4Jo5n5
 F39hgldwU+PFMkHPjST3Fg/3G7FVku8OjUaGj4pYu8lj8BfeVnZ0wRzDG97vKyJGaCI8
 SocdKqPtjKq0YNjcbe1yn/7dcE5plxUS72hm+Ie4EhddekSpciONKzhgrLKeQL4LppYT
 t0peh6FDP6bgrawlRU8+L624D5wYS43ZTvRSe4T58I4OMdRzu4cGw63/5mPWk6UlPqfg
 6eRg==
X-Gm-Message-State: AOAM532G5b1qm+8peS7qK3m9VcdBvrCw9E+FSvbB+NBwPo3L6qXp2MR7
 D9BLapXkb6QPDire2gr3ZZRWUWhq309sxlRtkVyfvQ==
X-Google-Smtp-Source: ABdhPJyvXh03CxCEy+LdwAXkQlUKABzoDdH9ppCwO0gJTK6hoU2+XCA13Y+kVzH4eWro7VAOLT1nAfcg/Okb6KHptmI=
X-Received: by 2002:a05:6102:54aa:: with SMTP id
 bk42mr5784202vsb.61.1634237660914; 
 Thu, 14 Oct 2021 11:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211013114432.31352-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20211013114432.31352-1-mika.westerberg@linux.intel.com>
From: Mauro Lima <mauro.lima@eclypsium.com>
Date: Thu, 14 Oct 2021 15:54:09 -0300
Message-ID: <CAArk9MOscFASjen3=6VmUwkMZooPJ3RqrenNiQ4QVmp_rEoL2Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to SPI
 MEM
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee.jones@linaro.org>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <p.yadav@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, 
 Alexander Sverdlin <alexander.sverdlin@nokia.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_115423_204480_313D6D76 
X-CRM114-Status: GOOD (  29.86  )
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

Hi all,

On Wed, Oct 13, 2021 at 8:44 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi all,
>
> Based on discussion on the patch I sent some time ago here:
>
>   http://lists.infradead.org/pipermail/linux-mtd/2021-June/086867.html
>
> it turns out that the preferred way to deal with the SPI flash controller
> drivers is through SPI MEM which is part of Linux SPI subsystem.
>
> This series does that for the intel-spi driver. This also renames the
> driver to follow the convention used in the SPI subsystem. The first patch
> improves the write protection handling to be slightly more safer. The
> following two patches do the conversion itself. Note the Intel SPI flash
> controller only allows commands such as read, write and so on and it
> internally uses whatever addressing etc. it figured from the SFDP on the
> flash device.
>
> Previous versions of the patch series can be found here:
>
>   v2: https://lore.kernel.org/linux-mtd/20211007112132.30934-1-mika.westerberg@linux.intel.com/
>   v1: https://lore.kernel.org/linux-mtd/20210930100719.2176-1-mika.westerberg@linux.intel.com/
>
> Changes from v2:
>
>   * Added tag from Andy
>   * Check buswidth in intel_spi_supports_mem_op() and return false if octal
>     mode is asked. The Intel controllers support buswidths 1-4 but this is
>     not exposed to software. It figures this itself through SFDP tables.
>   * In case of software sequencer, support same opcodes than we support with
>     the hardware sequencer if found in the opcodes table.
>
> Changes from v1:
>
>   * Arrange dependencies in Kconfig entries the same way in both glue
>     drivers.
>   * Added empty lines between different subsystem includes.
>   * dev_err() to single line
>   * Return intel_spi_sw_cycle() directly in intel_spi_erase().
>   * Drop redundant elses.
>   * Fixed typo in the commit message of the patch 3/3.
>
> Mika Westerberg (3):
>   mtd: spi-nor: intel-spi: Disable write protection only if asked
>   mtd: spi-nor: intel-spi: Convert to SPI MEM
>   Documentation / MTD: Rename the intel-spi driver
>
>  Documentation/driver-api/mtd/index.rst        |   2 +-
>  .../mtd/{intel-spi.rst => spi-intel.rst}      |   8 +-
>  drivers/mfd/lpc_ich.c                         |  59 ++-
>  drivers/mtd/spi-nor/controllers/Kconfig       |  36 --
>  drivers/mtd/spi-nor/controllers/Makefile      |   3 -
>  drivers/mtd/spi-nor/controllers/intel-spi.h   |  21 --
>  drivers/spi/Kconfig                           |  39 ++
>  drivers/spi/Makefile                          |   3 +
>  .../intel-spi-pci.c => spi/spi-intel-pci.c}   |  49 ++-
>  .../spi-intel-platform.c}                     |  21 +-
>  .../intel-spi.c => spi/spi-intel.c}           | 357 +++++++++++-------
>  drivers/spi/spi-intel.h                       |  19 +
>  include/linux/mfd/lpc_ich.h                   |   2 +-
>  .../x86/{intel-spi.h => spi-intel.h}          |  12 +-
>  14 files changed, 367 insertions(+), 264 deletions(-)
>  rename Documentation/driver-api/mtd/{intel-spi.rst => spi-intel.rst} (94%)
>  delete mode 100644 drivers/mtd/spi-nor/controllers/intel-spi.h
>  rename drivers/{mtd/spi-nor/controllers/intel-spi-pci.c => spi/spi-intel-pci.c} (84%)
>  rename drivers/{mtd/spi-nor/controllers/intel-spi-platform.c => spi/spi-intel-platform.c} (65%)
>  rename drivers/{mtd/spi-nor/controllers/intel-spi.c => spi/spi-intel.c} (77%)
>  create mode 100644 drivers/spi/spi-intel.h
>  rename include/linux/platform_data/x86/{intel-spi.h => spi-intel.h} (64%)
>
> --
> 2.33.0
>
$ ./scripts/checkpatch.pl --file --strict drivers/spi/spi-intel.c
CHECK: Alignment should match open parenthesis
#215: FILE: drivers/spi/spi-intel.c:215:
+ dev_dbg(ispi->dev, " %02d base: 0x%08x limit: 0x%08x [%c%c]\n",
+ i, base << 12, (limit << 12) | 0xfff,

CHECK: Alignment should match open parenthesis
#232: FILE: drivers/spi/spi-intel.c:232:
+ dev_dbg(ispi->dev, " %02d base: 0x%08x limit: 0x%08x\n",
+ i, base << 12, (limit << 12) | 0xfff);

CHECK: Comparison to NULL could be written "!ispi->sregs"
#378: FILE: drivers/spi/spi-intel.c:378:
+ if (ispi->sregs == NULL && (ispi->swseq_reg || ispi->swseq_erase)) {

CHECK: Blank lines aren't necessary before a close brace '}'
#534: FILE: drivers/spi/spi-intel.c:534:
+
+ }

Beside these checks,
Reviewed-by: Mauro Lima <mauro.lima@eclypsium.com>
Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
