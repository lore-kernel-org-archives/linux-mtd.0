Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C597C10F13
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 17:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA8420863
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 17:52:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="El5C28uU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSmq5pBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA8420863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoNa7VGwQIg+StyN/tLDXLGKrIm6Kzj1EA1h/fm+YH8=; b=El5C28uU/u3nPJ
	E+BoHvKcstd8mgqGYBebYiXifP9mBKxwHIA1F2eVjR2NbAuwnRYvLaqwj533dlGI3G9Mwzd0fr+64
	YjUs1TcomnrRCyaJU/ohaYVDgN9buPxcCwJKxqiXi7cW1SiTmffYn9ch285FW7nFmflrPjkjNb66o
	aVmqkJ8+cU8YuHCLA5M8/Hu/eiU5YkYbzm+NjcJHqGNnnTUTjpF+JErve+882W9VN8mOtHcG7Scvl
	yJ+Uk8SJdI0DhX7+EMkFwCsB5DUYwDdOlblviUBfIhRwjIfWF3waALwYV9PzkVrgPQKneOkNex9Bz
	GnA32X8IOCEfEq3JP+ZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDYRA-0002KF-D3; Mon, 08 Apr 2019 17:52:04 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDYR7-0002Jt-ED
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 17:52:02 +0000
Received: by mail-pl1-x641.google.com with SMTP id cv12so7745433plb.9
 for <linux-mtd@lists.infradead.org>; Mon, 08 Apr 2019 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QNnZho9Ta1Rw1KleEbxa56brUSc+zl1ruj9gmFWgbsc=;
 b=sSmq5pBs17JU0g+09r6+HInrESTm0G7OYF3tt1Csdufe08QQWPqRXCZ0mvx3xaufBo
 yGKnDlYcGb+psgwFEmIB9lrREMgphbT1GcWto/JpHqs9AGnOhIuD0KT4Xu0GtywiBe5Y
 zKPHnK4Ez18fvQl53DBYTPPEJQUDwvqLp9sGOQGnS5UWpCWvp88jevHMCofWrGiUIFpl
 b3tvhkRIHWjFZeLVbseSvEQwI91RdTrld6Ab8i3tAERgJfgR8yA/aBGGfb9DbMlMfsb7
 ERcsnjLeQwfPKBSh9tEVT1mrNCQYiER34H4sA584cQHMdhcGc9bpsXooFJkGmwk2YayW
 R6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=QNnZho9Ta1Rw1KleEbxa56brUSc+zl1ruj9gmFWgbsc=;
 b=mhDgGrRE6q73cTrgiymtN4Zp/1htuPTwHP8xutWkP2HjG3XTCc2W9W4q3NYzzUfTVl
 E/bWpTG37cmsYGUaWr5PJKpsvyoiXPt7rKE0tr/CYxaRr0YlnFfq5yYeHrvZyc5ENDi7
 IegJqyJnQ02DXw5b45VT1QWfhMButtg4WtHvxR9wZ39MITEcjICNZkvooPG7ZAxoHV1a
 3h9/Fr0qN7GnngvOX3asz03qt4knFt3fzR1h2IMsoPPL0IFryp3tS3H0Gh23iW28j7lx
 nr3hipPuJNTyAw1eEsO5kR/i1C06awPl55vYmzZT+W7NkkhG+jQiQG7A+ipOQsxEgW6h
 G/OQ==
X-Gm-Message-State: APjAAAUjXADGrAaXSahxXz40q1Oai3hwuc+aGoqe1Ej9E6k98meICY9f
 EETcgToUQkQJ3gjbCjt7s68=
X-Google-Smtp-Source: APXvYqxZe5KlDJucvOl0aeLUiz+VQclOOyFnsg4wgvzynRSGhY4MhcDjN7hxflQ/EJtdD7ZWDdAfRw==
X-Received: by 2002:a17:902:ea0d:: with SMTP id
 cu13mr31303737plb.92.1554745920525; 
 Mon, 08 Apr 2019 10:52:00 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id s12sm49698287pgc.28.2019.04.08.10.51.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Apr 2019 10:51:59 -0700 (PDT)
Date: Mon, 8 Apr 2019 10:51:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH v2 3/3] spi: spi-mem: Add support for Zynq QSPI
 controller
Message-ID: <20190408175157.GA11988@roeck-us.net>
References: <1554105553-20207-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1554105553-20207-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_105201_491810_F60FF8D4 
X-CRM114-Status: GOOD (  15.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org, nagasuresh12@gmail.com,
 dwmw2@infradead.org, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 01, 2019 at 01:29:13PM +0530, Naga Sureshkumar Relli wrote:
> Add support for QSPI controller driver used by Xilinx Zynq SOC.
> 
> Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> ---
> Changes in v2
>  - Updated the driver to call spi_mem_default_supports_op() from
>    ctrl->supports_op()
> Changes in v1
>  - Added COMPILE_TEST macro
>  - converted MASKs to GENMASK() and BIT() macros
>  - Renamed MODEBITS to ZYNQ_QSPI_MODEBITS
>  - Removed checking buswidth() code, as it is already handled by framework
>  - Updated in comments regarding baud rate calculation
> ---
>  drivers/spi/Kconfig         |  10 +-
>  drivers/spi/Makefile        |   1 +
>  drivers/spi/spi-zynq-qspi.c | 761 ++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 771 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/spi/spi-zynq-qspi.c
> 
> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index 9f89cb1..7bf7d38 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -816,9 +816,17 @@ config SPI_XTENSA_XTFPGA
>  	  16 bit words in SPI mode 0, automatically asserting CS on transfer
>  	  start and deasserting on end.
>  
> +config SPI_ZYNQ_QSPI
> +	tristate "Xilinx Zynq QSPI controller"
> +	depends on ARCH_ZYNQ || COMPILE_TEST

This results in

drivers/spi/spi-zynq-qspi.c: In function 'zynq_qspi_write_op':
drivers/spi/spi-zynq-qspi.c:410:3: error: implicit declaration of function 'writesl'; did you mean 'writel'?

drivers/spi/spi-zynq-qspi.c: In function 'zynq_qspi_read_op':
drivers/spi/spi-zynq-qspi.c:436:3: error: implicit declaration of function 'readsl'; did you mean 'readl'?

when building allmodconfig/allyesconfig on architectures not supporting
writesl/readsl (such as alpha or parisc).

Guenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
