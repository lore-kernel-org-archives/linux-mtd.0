Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907A5C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Dec 2022 14:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSNzzVXbbskYSF1p+3+r+ix3YN8qfyCQwXpAbHu6pKc=; b=JrZjQyvx+/+uPn
	c61rnAAVy7U5T+f2eAPWsry/TULmPjmaqfJjxjbn+/Ul8B2KUcND9elz2IGo+aIDKIkeZU0p6UAa7
	hxK+YKNtf/8BM8uGHHFv1nfhuo+9mp5l2AOWR5vfP2ZvLQtRt7lCrWmJTlvtbUadt1uhpwxIIdfup
	Xf8fD6Pmg0GM21viE3aEEoWvfOjZlE7oHmpYiblTthZRCFvaM5zRDwWjeMkzasiGcGTBE/KOCBZE8
	r3Nu9/mXe2yN0vxE8xre+xnJ2bDHaJkGbboUiqWNgkghrbU7xnquUj/w0DGn3eqzckfnf4x+fvbnn
	e1jcHkgjYRQYUDhmXSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9oFQ-004ayz-6a; Mon, 26 Dec 2022 14:14:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9oFK-004ax2-3V
	for linux-mtd@lists.infradead.org; Mon, 26 Dec 2022 14:14:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8FF01B80CB0;
	Mon, 26 Dec 2022 14:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADCBC433EF;
	Mon, 26 Dec 2022 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672064067;
	bh=OqJdTNZqSFcUMxk64faUfp/thzIgzJb5+8PHHeIcJGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KG2wJitQe5gaw40uMwo3fJ1v8niyFjlj9xnubAteuAWKXDuzgvFvI5+iMlTs7MhDs
	 V/4Nf3gqRcmdRp375YL5PYvFYOpAfJeqN0l/LRq41Bxp9V9zfHClI8VpLrmpaevZC/
	 26xKyJMeolE5jXGrd+zg0Uay5/IdACdEsIxoSukeRsLjqYdTjJQfm1onnZmxJFMZ9k
	 KOC/sy7Q1dysK7Sza1tRzoW7DQVxd6V5BXUSO1FP9tUziRD8LuTsCgE0pJ2xnpfcTl
	 gJ135p9otm4SyHyHLZWT8mKgVx8ecIOxDEqX3B/0RV59WTYmJCuHZgFUUmN2B3Ggyo
	 oRwB1e7gwlcUw==
Date: Mon, 26 Dec 2022 15:14:24 +0100
From: Pratyush Yadav <pratyush@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>, Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] mtd: cfi: allow building spi-intel standalone
Message-ID: <20221226141424.vns7nsczcg3gfpt3@yadavpratyush.com>
References: <20221220141352.1486360-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220141352.1486360-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_061431_223145_821F22A4 
X-CRM114-Status: GOOD (  12.76  )
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

On 20/12/22 03:13PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When MTD or MTD_CFI_GEOMETRY is disabled, the spi-intel driver
> fails to build, as it includes the shared CFI header:
> 
> include/linux/mtd/cfi.h:62:2: error: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Werror=cpp]
>    62 | #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> 
> linux/mtd/spi-nor.h does not actually need to include cfi.h, so
> remove the inclusion here to fix the warning. This uncovers a
> missing #include in spi-nor/core.c so add that there to
> prevent a different build issue.
> 
> Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
