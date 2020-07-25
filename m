Return-Path: <SRS0=DDtA=BE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A7AC433E0
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 05:57:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 245E9206D8
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Jul 2020 05:57:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jwfF0GQq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ts8zMM8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 245E9206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BBy1//3dsQs7ZercQZmdllzi/ZLc2cL5n8kaemYmfkI=; b=jwfF0GQq3L+W8n+3oGto0vsjF
	gbSfjwNgGbkSxCnNadecGS2c+KhrJzidxpoFcP+Dk/j/xh/8qL0LLHa2i0HwgPQVa32eCN8R/6Iji
	zEwS4Vv7ifihW5epzxAvwVIL8RFdb0cPcpxNTa34gCwhstUzXRNS2BvWPAZFw8WiRifyBN58Dk8Yo
	yei7n19TpvZ9ySnwW/VvBhhtgVMdD/JwLSOukFAGGl7/YS9Qyzw4Pkx7vWH8w8fcPgkP7guTM4TU4
	vin2O5I4kBiMvKyvXZgSl4GmwP0ygNdHjBiwFNsGTrjEsNuHzqV3hM2EvzHF7SDBRcdehnU7TU+nP
	OqK/EGi1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzDAy-0006nF-4A; Sat, 25 Jul 2020 05:56:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzDAv-0006ms-OI
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2020 05:56:51 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32E45206D8;
 Sat, 25 Jul 2020 05:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595656608;
 bh=lQhz2ZepJuKrQE6NHOi5RHfNha5MRdXWgWs0MBUaets=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ts8zMM8p72miir5GvC28+VIQ0mLvr9mVzE62fON6hzD2PGrz0uIGan2mZ9pJhiee6
 1m+kOyHkfHShDhA9JXPdXufKS52nM7bzVjmoTUSSzJ4RS0MIqQsq/pw0+bLr0nzXpD
 O3Fzz2P/CsmxYuZROgyNTtQwQAEQAEGB7j9r/Um0=
Date: Sat, 25 Jul 2020 07:56:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Gutson <daniel.gutson@eclypsium.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci
 attempts to turn the SPI flash chip writeable
Message-ID: <20200725055649.GA1047853@kroah.com>
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_015650_092783_41B0ECAF 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Alex Bazhaniuk <alex@eclypsium.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 24, 2020 at 06:28:53PM -0300, Daniel Gutson wrote:
> Currently, intel-spi has a module argument that controls whether the driver
> attempts to turn the SPI flash chip writeable. The default value
> is FALSE (don't try to make it writeable).
> However, this flag applies only for a number of devices, coming from the
> platform driver, whereas the devices detected through the PCI driver
> (intel-spi-pci) are not subject to this check since the configuration
> takes place in intel-spi-pci which doesn't have an argument.
> 
> That's why I propose this patch to add such argument to intel-spi-pci,
> so the user can control whether the driver tries to make the chip
> writeable or not, being the default FALSE as is the argument of
> intel-spi.
> 
> Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi-pci.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> index 81329f680bec..77e57450f166 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi-pci.c
> @@ -24,6 +24,10 @@ static const struct intel_spi_boardinfo cnl_info = {
>  	.type = INTEL_SPI_CNL,
>  };
>  
> +static bool writeable;
> +module_param(writeable, bool, 0);
> +MODULE_PARM_DESC(writeable, "Enable write access to SPI flash chip (default=0)");

Ick, this isn't the 1990's, please do not add new module parameters,
they are a major pain to work with and only work on a global basis, not
on a per-device basis.

No user will remember how to use this, as it isn't documented anywhere
either.  Can you make this a sysfs attribute or something, or better
yet, make it "just work" depending on the device type?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
