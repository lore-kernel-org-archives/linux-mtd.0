Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA48CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:33:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1D661216
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C1D661216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCbmC176IHmY9B6j4x741oLa9bFaNMZqkJ0yAA2MNXM=; b=HxLX712sF+C3cm
	ZvQKUvMm3FClgi7bXXl1dXh38DeXTtrfamhjfg2tPRCAumK20TyfF6Ak9t7b37hioYSjH3jiiLaj+
	Ce3Z3ta/r9pfazlFt/+oIQD0UAFIC1LK3caplOPrwxn8oLQs7FdRA1alPgaaa9irPQlmDJ9QqRmlL
	x2/rWltcn874xZRKAYzYozsSrjphptn6u56zY/Bnzi/c7k7sS8bFjV2dHoYVk+RQ3Fpms5Wdog13N
	z96Y8i8tWmxW2NHfXz71PAYtKPEkeoL9AHnlyapP8iT2B02X8/0/3tmfWb2SXiSuVW5ZgJjK9AKh2
	usFxcU1SRW6kxfqLI8aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8hT-00BHmc-9x; Fri, 19 Nov 2021 18:33:27 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8hQ-00BHlK-Cz
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:33:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8DFF0200004;
 Fri, 19 Nov 2021 18:33:17 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] mtd: dataflash: Add device-tree SPI IDs
Date: Fri, 19 Nov 2021 19:33:16 +0100
Message-Id: <20211119183316.1329089-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211115113655.237785-1-jonathanh@nvidia.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b5ceec8074eb6dc015a8d5fa04706bc4c3cbbe55'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103324_615784_ABE739A3 
X-CRM114-Status: GOOD (  10.27  )
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

On Mon, 2021-11-15 at 11:36:55 UTC, Jon Hunter wrote:
> Commit 5fa6863ba692 ("spi: Check we have a spi_device_id for each DT
> compatible") added a test to check that every SPI driver has a
> spi_device_id for each DT compatiable string defined by the driver
> and warns if the spi_device_id is missing. The spi_device_ids are
> missing for the dataflash driver and the following warnings are now
> seen.
> 
>  WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,at45
>  WARNING KERN SPI driver mtd_dataflash has no spi_device_id for atmel,dataflash
> 
> Fix this by adding the necessary spi_device_ids.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
