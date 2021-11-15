Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C9AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:13:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F47A630EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 10:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F47A630EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POAp4b9vIhIYHUON7dcVxq3h14IEN1whEf+9JJQ+oP0=; b=fysxo+RLDfUsw0
	j6uPOYrs32Qs6I9QDlsaJojuMgc5wUHFb95EyIBvwNLzS3EEjpso0+Cb1euTxO2rz2b1+MLQQZaYc
	R/iUP4GUdffy6qkAfWc7gR9euV3PVjnK6J5k9lHzxpE4wb75gatqzx9H4oKyKcanFTCa0+TygT6HD
	tE6aaMbjz3dcBdzbTXJuNaL/7Lj6DUpMzytha3zvI0PUwGcQrhKm4qkmHs7SHMGYCGbJejSqvISYS
	nbEnZ7QbEyaQ+4X06fUZIpWw1e4TZG2MM4Qb6KZgKU89323GCLcL4ChPLd8hQJl2cVtCh744QkF/H
	dKhjSbxj+ctTR5Ww3rVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYzE-00F7cU-Ug; Mon, 15 Nov 2021 10:13:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYiO-00F2HN-T0; Mon, 15 Nov 2021 09:55:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30E7861BF8;
 Mon, 15 Nov 2021 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636970151;
 bh=zO8rrj1Vi14Uipx7unEIoASJvIGIajWvOMxp9QEDdrg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pS0ejTv+o5S0A78mbmJ7yuvuLRvB9d4xUmNuDZkoNE6OFFDakUf4rUvAzBprhdror
 c/bShp5CLYeQozZylztfdFxkqVWVq+5ygYNbn+4A0s2ze6/IhIUKtVg/V7FX57xSK9
 o+TBkdXts4C2lwVOyzZSJbu6XtvG/R75Me0SQNeR4Q87t1+Qhokvme1DEyAn+zBc7+
 nJMjetgrrqNxHehwqI7KLrMF3IzGgf4PNgOkpTsytZe7548iWlWgbHxmlfyaqoC8CS
 sUf/B2fdljsPIZbKzs7tinYeZ8/8ttY26uNUOwdT55UgKOo0wK/ocgfuCEg3N311BC
 phUkTUj1HGMig==
Message-ID: <b04bb9803d59d26e4f32adc9518d0ec1a9456273.camel@kernel.org>
Subject: Re: [PATCH 03/11] mmc: bcm2835: stop setting chan_config->slave_id
From: nicolas saenz julienne <nsaenz@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Baolin Wang
 <baolin.wang7@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav
 Kysela <perex@perex.cz>,  Jon Hunter <jonathanh@nvidia.com>, Lars-Peter
 Clausen <lars@metafoo.de>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Laxman Dewangan
 <ldewangan@nvidia.com>,  Manivannan Sadhasivam <mani@kernel.org>, Mark
 Brown <broonie@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Orson
 Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Scott
 Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>, Thierry
 Reding <thierry.reding@gmail.com>,  alsa-devel@alsa-project.org,
 bcm-kernel-feedback-list@broadcom.com,  dmaengine@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org,  linux-mtd@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,  linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org,  linux-staging@lists.linux.dev,
 linux-tegra@vger.kernel.org
Date: Mon, 15 Nov 2021 10:55:42 +0100
In-Reply-To: <20211115085403.360194-4-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-4-arnd@kernel.org>
User-Agent: Evolution 3.42.1 (3.42.1-1.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_015553_016493_6BB47AFE 
X-CRM114-Status: UNSURE (   7.67  )
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

On Mon, 2021-11-15 at 09:53 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The field is not interpreted by the DMA engine driver, as all the data
> is passed from devicetree instead. Remove the assignment so the field
> can eventually be deleted.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Nicolas Saenz Julienne <nsaenz@kernel.org>

Regards,
Nicolas


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
