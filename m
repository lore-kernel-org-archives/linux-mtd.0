Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A38C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 16:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kFUncVl4tueeehnkqxiL/HENqnvJRU4u7Zl4ksroEY=; b=T7gT+MJVMqY8iY
	c79tmnwmUQgN2yavHFcRvRc2ZHtKTpHvbDTeUCoKgn2jJnqSTkTtYPoMztEEI2EEwD4Q0wcxkGjtR
	RwZSeulWpPD1cI0zCFdwN8dVkQs0JwrHo8ZMSlNbrWfxVHZNuWXuTQLoD8P9ZjEZ4wcJ0Kk3jafVh
	TkZ8a6QXqm2nQfRjiQ3cf/iiJ3j05Wc15fFnJftB7qnZGzifLKeB7B+8++eB5uxlrTBcweDezEfrC
	aejz01ru7xcAhPBM0WD/Iwr9NeUtpvKrKjXZGu2LnjBHtnNsvZ8S73sz2B+dGMCtQ5c/NLNLUFGhg
	qdKe9kfKRblwyXKT2k7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdJU-005sGA-Jk; Fri, 25 Feb 2022 16:19:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdJN-005sDb-O1
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 16:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645805957; x=1677341957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y+Ao6ZDvcSXXoQKTG3/aiSYOVpdfvQHBUSUKS2imXG4=;
 b=fY3STW0Ammyhc5OnR7ey22QuQzLMDUFin0kH8gcvI2iML+7l+Ma7078u
 EceRjeOF23Y65yJ1CiiX+IoNsp7lgkPag/KO9bnDFe9wj3Mt5fey0Cz67
 WHSFZZ8Rl6u8YnziSqcxUwQ0sbYzSwQGPr+zObuYyMUy/Ydj5la8TUEh2
 CarPVz2jxiU0l7fqQXr7ppSI8rEH46u2dbSwiBvlXOEdcophyUM6MiC3u
 Xhi9sK3uvDbxMVayhUSTFEZ0IYs8LAIfG6V2hMv4fmUO1AQRWpukwZNEf
 hv1k101bsK/4+qRj+3TpovjiZxA4y9Jtv1rPAByIbiALfXTkPn/sQXcTo A==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="163663043"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 09:19:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 09:19:03 -0700
Received: from ROB-ULT-M18064N.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 25 Feb 2022 09:19:00 -0700
From: Tudor Ambarus <tudor.ambarus@microchip.com>
To: Michael Walle <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Pratyush
 Yadav" <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>,
 <yaliang.wang@windriver.com>
Subject: Re: [PATCH v5 00/32] mtd: spi-nor: move vendor specific code into
 vendor modules
Date: Fri, 25 Feb 2022 18:18:59 +0200
Message-ID: <164580568515.679764.14013316693179143722.b4-ty@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220223134358.1914798-1-michael@walle.cc>
References: <20220223134358.1914798-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_081917_839224_D3D80B77 
X-CRM114-Status: GOOD (  10.80  )
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

On Wed, 23 Feb 2022 14:43:26 +0100, Michael Walle wrote:
> It turns out that most of the special status register handling is
> specific for a particular vendor. I.e. Xilinx has some different
> opcodes for the status register read, Micron has an additional FSR
> register and Spansion has these flags integrated into the SR.
> 
> Create a callback to ready() where a flash chip can register its
> own function. This will let us move all the vendor specific stuff
> out of the core into the vendor modules.
> 
> [...]

Applied to spi-nor/next, thanks!

[01/32] mtd: spi-nor: atmel: unify function names
        https://git.kernel.org/mtd/c/2394770bd6bb
[02/32] mtd: spi-nor: catalyst: unify function names
        https://git.kernel.org/mtd/c/9eb916e2523e
[03/32] mtd: spi-nor: eon: unify function names
        https://git.kernel.org/mtd/c/f5e7bd2768d7
[04/32] mtd: spi-nor: esmt: unify function names
        https://git.kernel.org/mtd/c/a7a3f09024b6
[05/32] mtd: spi-nor: everspin: unify function names
        https://git.kernel.org/mtd/c/09ae8354c31d
[06/32] mtd: spi-nor: fujitsu: unify function names
        https://git.kernel.org/mtd/c/5410151931fa
[07/32] mtd: spi-nor: gigadevice: unify function names
        https://git.kernel.org/mtd/c/0ab828613c5a
[08/32] mtd: spi-nor: intel: unify function names
        https://git.kernel.org/mtd/c/536437aabb7a
[09/32] mtd: spi-nor: issi: unify function names
        https://git.kernel.org/mtd/c/cc5af02f6008
[10/32] mtd: spi-nor: macronix: unify function names
        https://git.kernel.org/mtd/c/0757201a1daa
[11/32] mtd: spi-nor: micron-st: unify function names
        https://git.kernel.org/mtd/c/c9d5cdf4bf9c
[12/32] mtd: spi-nor: spansion: unify function names
        https://git.kernel.org/mtd/c/fedd0cbf3e93
[13/32] mtd: spi-nor: sst: unify function names
        https://git.kernel.org/mtd/c/7e5b38ae4f23
[14/32] mtd: spi-nor: winbond: unify function names
        https://git.kernel.org/mtd/c/a7a0466f582f
[15/32] mtd: spi-nor: xilinx: unify function names
        https://git.kernel.org/mtd/c/45acce2099c5
[16/32] mtd: spi-nor: xmc: unify function names
        https://git.kernel.org/mtd/c/232e2830f525
[17/32] mtd: spi-nor: slightly refactor the spi_nor_setup()
        https://git.kernel.org/mtd/c/b44aa9ac6bb4
[18/32] mtd: spi-nor: allow a flash to define its own ready() function
        https://git.kernel.org/mtd/c/4cf1c7bdc55c
[19/32] mtd: spi-nor: export more function to be used in vendor modules
        https://git.kernel.org/mtd/c/66cf87c60014
[20/32] mtd: spi-nor: guard _page_size parameter in S3AN_INFO()
        https://git.kernel.org/mtd/c/9fb4beb1b051
[21/32] mtd: spi-nor: move all xilinx specifics into xilinx.c
        https://git.kernel.org/mtd/c/8b4195cd6dc3
[22/32] mtd: spi-nor: xilinx: rename vendor specific functions and defines
        https://git.kernel.org/mtd/c/8b7a2e00d117
[23/32] mtd: spi-nor: xilinx: correct the debug message
        https://git.kernel.org/mtd/c/56b852e8635b
[24/32] mtd: spi-nor: move all micron-st specifics into micron-st.c
        https://git.kernel.org/mtd/c/c770abe52d81
[25/32] mtd: spi-nor: micron-st: convert USE_FSR to a manufacturer flag
        https://git.kernel.org/mtd/c/8f938262a6f3
[26/32] mtd: spi-nor: micron-st: rename vendor specific functions and defines
        https://git.kernel.org/mtd/c/2b18a18ea7f8
[27/32] mtd: spi-nor: spansion: slightly rework control flow in late_init()
        https://git.kernel.org/mtd/c/6235ff040c13
[28/32] mtd: spi-nor: move all spansion specifics into spansion.c
        https://git.kernel.org/mtd/c/837d5181beef
[29/32] mtd: spi-nor: spansion: convert USE_CLSR to a manufacturer flag
        https://git.kernel.org/mtd/c/51c55506a7b1
[30/32] mtd: spi-nor: spansion: rename vendor specific functions and defines
        https://git.kernel.org/mtd/c/e8fd3b4b266b
[31/32] mtd: spi-nor: slightly change code style in spi_nor_sr_ready()
        https://git.kernel.org/mtd/c/e9d663a2a019
[32/32] mtd: spi-nor: renumber flags
        https://git.kernel.org/mtd/c/3c552889e431

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@microchip.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
