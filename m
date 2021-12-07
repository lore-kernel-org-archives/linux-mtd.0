Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8DDC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Dec 2021 15:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j1np49M8iikVmj6wJiG39MYnOoOgeszGY52IwJ1enc=; b=fprxVLaAinJ/rQ
	4B2pgycBqcgBi0GSOJKmxCXhKJ7XhnVJDDsgfqM+fk9AUSYTEFSaUwmsSjWEjDTVA65L0xrFfGWQE
	RZyFdbz4q/HZJtwQxSR90qCcuQ0l5RTkGES9i2oyMS7KcbSNzEfRJBkISN/LyufHLG9OmyyVXnCMK
	AZkojAkEueRBZAeNLZGjzWYz/8G7G3N17zCY4a1iRWPPyjEl66+ncviPGN2IVghe1O7veUFYegOmp
	7doXPB6gFf6b0qWBmvd3RvaEAmLONkoZqSENeUVMvOoeLmexf7RSNV+YFommcsQy2b4yY1chYlc24
	QVDvlbwxGIS4wBn5EJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucIN-009BPU-5Y; Tue, 07 Dec 2021 15:22:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muc3y-0096Fi-Nx; Tue, 07 Dec 2021 15:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638889646; x=1670425646;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aPUVF9P8wnihcFhrqkcrIYLMnTOunQ3P4F1aJ2PY2KI=;
 b=R946cmhEve2OlrTOT+WftS2cpmQd+20QREHTwoXtlYdS3zDJFaGWaiTV
 Ey1sEAkvUSMuBruefFnFIXftgWPX8OBJ/443GqBFsIxkZTz1Qx4/wa/3S
 CCoHxAsxyqD8c4K4h5eDpuB2wF2mWSh3RNzG4o9/mp4RCPhC5r2EDJhLF
 cDjPDW2f3UG7/ZeNonmg70j/7nOuF/3tjWgf/wKvECtAbUgdivuxOIPPX
 J14UzZRjK+/8+4ixzA/sK3oHfDe+yfhVvfVOR2fbmqjAae3oHWOz/4vdQ
 UBVoFyK3xzXTv5wQO6sO57rcPo1pzMIyXwGdex5ZXYys8veAh5AjAcIAT g==;
IronPort-SDR: zaPBexrMeY4fn3LZ53A0lUPEGna+mEar6F+uRvMhcNTbYljcYdR3CrKAot7d+IDD7TH49SOzv+
 vXsHucKwZHmJzq1riNdPKWnaFzsD0mafGR2U9UFUiiD9ltwSFcYxwna1I+VaZDnM156edTNrMF
 YmXGQv9JigSUbrxNfSHor7k/I3QC32OY+BfjoK/C1iXA9X1W82LWvOvxJpvpMnIhAqKCV2oZR7
 ObSDMWH+dsWjtQEpjsy4mhzzCcq4/rC4mdo3ABR/i86HTJmDse363PYIBfMXnludcs9ato0o2J
 BRlVQARvtYLQSmmp5ezVEgwy
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="138963619"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2021 08:07:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 7 Dec 2021 08:07:24 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 7 Dec 2021 08:07:20 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, <p.yadav@ti.com>,
 <michael@walle.cc>
CC: <linux@rasmusvillemoes.dk>, <richard@nod.at>, <sr@denx.de>,
 <nicolas.ferre@microchip.com>, <code@reto-schneider.ch>,
 <zhengxunli@mxic.com.tw>, <linux-mtd@lists.infradead.org>,
 <heiko.thiery@gmail.com>, <jaimeliao@mxic.com.tw>, <vigneshr@ti.com>,
 <macromorgan@hotmail.com>, <mail@david-bauer.net>, <esben@geanix.com>,
 <miquel.raynal@bootlin.com>, <knaerzche@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 00/14] mtd: spi-nor: Clean params init
Date: Tue, 7 Dec 2021 17:07:18 +0200
Message-ID: <163888959028.96416.1421320551492363456.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207140254.87681-1-tudor.ambarus@microchip.com>
References: <20211207140254.87681-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_070726_914185_5C769839 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, 7 Dec 2021 16:02:40 +0200, Tudor Ambarus wrote:
> Clean spi_nor_scan() and the flash parameters initialization code.
> Reworked how the flags are handled for the flash_info entries.
> Tested all the flashes from patch set.
> 
> Changes in v6:
> patch 2/14: drop Fixes tag
> patch 6/14: fix alignment of flash declarations in micron-st,
>             spansion, and sst drivers
> patch 9/14:
> - fix missing variable in if condition in spi_nor_init_params_deprecated()
> - call spi_nor_no_sfdp_init_params() if(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP)
> - remove redundant !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) check
> in spi_nor_init_params_deprecated()
> - update description of spi_nor_init_params() with spi_nor_no_sfdp_init_params()
> - add Pratyush's R-b tag
> patches 11, 12, 13, 14: dump jedec_id, manufacturer partname and sfdp (including
> sfdp sha1sum)
> 
> [...]

Applied to spi-nor/next, thanks!

[01/14] mtd: spi-nor: Fix mtd size for s3an flashes
        https://git.kernel.org/mtd/c/f656b419d41a
[02/14] mtd: spi-nor: core: Don't use mtd_info in the NOR's probe sequence of calls
        https://git.kernel.org/mtd/c/eb726c322020
[03/14] mtd: spi-nor: Introduce spi_nor_set_mtd_info()
        https://git.kernel.org/mtd/c/ff67592cbdfc
[04/14] mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is defined
        https://git.kernel.org/mtd/c/5273cc6df984
[05/14] mtd: spi-nor: core: Introduce flash_info mfr_flags
        https://git.kernel.org/mtd/c/7683b39d6030
[06/14] mtd: spi-nor: Rework the flash_info flags
        https://git.kernel.org/mtd/c/ec1c0e996035
[07/14] mtd: spi-nor: Introduce spi_nor_init_flags()
        https://git.kernel.org/mtd/c/5429300db98c
[08/14] mtd: spi-nor: Introduce spi_nor_init_fixup_flags()
        https://git.kernel.org/mtd/c/a1ede1cce493
[09/14] mtd: spi-nor: core: Init all flash parameters based on SFDP where possible
        https://git.kernel.org/mtd/c/5dabf5770f7d
[10/14] mtd: spi-nor: core: Move spi_nor_set_addr_width() in spi_nor_setup()
        https://git.kernel.org/mtd/c/b7ed1a3731a9
[11/14] mtd: spi-nor: winbond: w25q256jvm: Init flash based on SFDP
        https://git.kernel.org/mtd/c/1c513c986b0a
[12/14] mtd: spi-nor: spansion: s25fl256s0: Skip SFDP parsing
        https://git.kernel.org/mtd/c/5eefc2dc0319
[13/14] mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP
        https://git.kernel.org/mtd/c/047275f7de18
[14/14] mtd: spi-nor: issi: is25lp256: Init flash based on SFDP
        https://git.kernel.org/mtd/c/22bfe94528d7

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
