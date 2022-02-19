Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C18FC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Feb 2022 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1JB7OL92N+Uaa6fVQWS9IekNH2CsnjNMBXlZwRAfcLA=; b=gcSUWWOJsyEhrl
	h1uGttufGtWSscjzQcatzHiOq1vtrWgzol3P9zEO1ZvCoztuxqAnQ2CbaJ2Te+qJjpDKX+zKvGJeL
	PXUbhj0SYWiIuvUSuCE60SYwxU9ue7lFoFLc1VuMjl+dThI355kXj+TgfCYlj8EnM7qir9Y802mop
	FMRMdG/4JWKybMcZ9vfBYkahnZsUHkIfkEWw122TwHM+3vFe61QBGumC+9LFdNfSIv/lDG4ljHi7f
	UkeoKVakehihfqZkKGWw6IeawO9Wv5hnQoGdrzvdwi29+T0+qMEhgwEgytQ/G/Zi4ObLWV0N896Wm
	0HhJ/b8OXXKxc5dFDQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLRLu-00H7mw-S7; Sat, 19 Feb 2022 15:08:50 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLRLk-00H7kl-3W
 for linux-mtd@lists.infradead.org; Sat, 19 Feb 2022 15:08:45 +0000
Received: by mail-qv1-xf34.google.com with SMTP id n6so20811056qvk.13
 for <linux-mtd@lists.infradead.org>; Sat, 19 Feb 2022 07:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=k/I+1clxvE02ds3q/vpOq8sh7Fxc4ogvnxrh8xQHKuQ=;
 b=TleVrJNvlg/phE6uPMhvbmuSYGDJ5V9cN6e+Jw6Qtb8F4Job48cLov/trdCAtu5M5D
 Lt8HaV4STqMw9oOxFHVveTysmnzpfrFjATpfi6SltgTK3TD6Db7USlvYJrUsPOKe9tCt
 mKzShr9SSx4HbeU7z5b/PU02bOC427SAxsXBSK9pk+mm7MVm0VeVD34t3Jg2bXdQN7G2
 5XRSUBZ2ICErh5q0J4FwlvYe7CyvC61OQXYw054YMXU9KI8sMGYpsgrADv+R9Ij07DT3
 Fuo5uxDMYfcxilCrH2+9/NJeGG4FWYqbfg+NPP2HOvN2fvjWZgiaHVNchF/PEo25JZAe
 wp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=k/I+1clxvE02ds3q/vpOq8sh7Fxc4ogvnxrh8xQHKuQ=;
 b=a6KI39OwSWI99BmxmRYHTbhn4W88UaMYqWQxrOwPN/+CRprRmc6sVD+FpYCRgJ20RJ
 DsdFxJqCf3yHx82PyO93JEVKI/Q0NME+VIO/alvW0t9WgKQRQ73eIHTA66zff40TdfVe
 JXl/CtAs5ZYp0rDycCbs2iGKNlXq+lYUAb8ewvq4JyGiFp42uw8fjw5V333tCJJENi/U
 btcXGiji+Aiwrm7OWSPmDJ2naaRp5QRDKCjKY9AjJ6sv5pATNALI4JGnFiT2ZebMd/IR
 ok0aic2MXWC0jgRsHu+hYU+j8zFuDxE2TM2JsVRiadfbDiIUdUGq5wjVm28QNDbtYJWY
 7pmA==
X-Gm-Message-State: AOAM533a6oF7v1FdjJNqflWSy9Wo0gs2ZlfaQtq97t6XuNKeDv8lsFLy
 HZZYgHHk5EBlmWpPQQs4tnM=
X-Google-Smtp-Source: ABdhPJyameQf7qV6cY5aAnDrPxy0Mb/C7d3bYB8Zb9PsM/egWUJPaMo36d8imI5Rx3LXwRBv4FBtyw==
X-Received: by 2002:ad4:5ca5:0:b0:421:6335:89 with SMTP id
 q5-20020ad45ca5000000b0042163350089mr9331773qvh.89.1645283318438; 
 Sat, 19 Feb 2022 07:08:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q12sm27643417qtx.51.2022.02.19.07.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 07:08:37 -0800 (PST)
Date: Sat, 19 Feb 2022 07:08:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Roger Quadros <rogerq@kernel.org>
Cc: miquel.raynal@bootlin.com, krzysztof.kozlowski@canonical.com,
 vigneshr@ti.com, nm@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: omap2: Prevent invalid configuration and
 build error
Message-ID: <20220219150836.GA1035394@roeck-us.net>
References: <20220118123525.8020-1-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118123525.8020-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_070840_185694_9FAFEA55 
X-CRM114-Status: GOOD (  19.41  )
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

On Tue, Jan 18, 2022 at 02:35:25PM +0200, Roger Quadros wrote:
> We need to select MEMORY as well otherwise OMAP_GPMC will not be built.
> For simplicity let's select MEMORY and OMAP_GPMC unconditionally as
> this driver depends on OMAP_GPMC driver and uses symbols from there.
> 
> Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for ARCH_K3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

This patch ignores OMAP_GPMC dependencies and results in:

WARNING: unmet direct dependencies detected for OMAP_GPMC
  Depends on [n]: MEMORY [=y] && OF_ADDRESS [=n]
  Selected by [m]:
  - MTD_NAND_OMAP2 [=m] && MTD [=m] && MTD_RAW_NAND [=m] && (ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST [=y]) && HAS_IOMEM [=y]

when configuring sparc64:allmodconfig, and in the following
build failure when trying to build that image.

Building sparc64:allmodconfig ... failed
--------------
Error log:
<stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
sparc64-linux-ld: drivers/memory/omap-gpmc.o: in function `gpmc_probe_generic_child':
omap-gpmc.c:(.text.unlikely+0x14c4): undefined reference to `of_platform_device_create'

Guenter

> ---
>  drivers/mtd/nand/raw/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 20408b7db540..d986ab4e4c35 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -42,7 +42,8 @@ config MTD_NAND_OMAP2
>  	tristate "OMAP2, OMAP3, OMAP4 and Keystone NAND controller"
>  	depends on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST
>  	depends on HAS_IOMEM
> -	select OMAP_GPMC if ARCH_K3
> +	select MEMORY
> +	select OMAP_GPMC
>  	help
>  	  Support for NAND flash on Texas Instruments OMAP2, OMAP3, OMAP4
>  	  and Keystone platforms.
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
