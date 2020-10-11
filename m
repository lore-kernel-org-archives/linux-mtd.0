Return-Path: <SRS0=teGx=DS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCA5C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 14:16:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 510862076C
	for <linux-mtd@archiver.kernel.org>; Sun, 11 Oct 2020 14:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AHPSWOCv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0RUJIwW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 510862076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q5Z28cfUvx5FZ2J8LgoMWa6JrmFP3hWW6c3tlcfYCCk=; b=AHPSWOCv9vM3gcDHF7oTvosya
	zoYWS6B2XZQMBwhD7/W9nxYnOdkawE3WNBY2FGiGq85pbUv49tQGIo2U6r8Oz4u0hU+AR8tkaQDvg
	iIbinko2cwYZh8qphjHcNIWRVPKzID2BGjrNum/3SbXbzRCp8n3Zv23bUgRenbrx6JLNtJFSKHp3D
	Osf1mQswDb2I1ocb4YHgGRgjQEelCO6aiDEENhanDz156LF1Koz7ZiRrOkfLgIfXbPGcQwQqJH33U
	y3qsj2Wp8smR5sNDy9OeHWMWEZ5HakkMzJvnot3qvT8VXsumt4cVwn6CQ9WvR5DdfeJxlY3uIe2xk
	A5RoWzkUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRc7o-00082t-5U; Sun, 11 Oct 2020 14:15:00 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRc7h-00081h-Js
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2020 14:14:54 +0000
Received: by mail-ot1-x344.google.com with SMTP id f37so13361297otf.12
 for <linux-mtd@lists.infradead.org>; Sun, 11 Oct 2020 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=muNZenS0Km4uODESvAwS5JDriZubFvXedophlc0fbss=;
 b=A0RUJIwW3Jw6VGrIbIvCBWuwW5gvVIwwQJYWVuawgwMv3dGud3GX5Chla8ZJVapU6w
 Xa+NMOll4AFRj9wwRwB60L7G4B7JTpmWyfmISu7gyFMcpnMAa1DawZS9JA1OhSkvu0DU
 djvRvm68GeZE6//I2X/ozENdB+3Gshe7c6odbn6S8NnW1kwpyjHyXhbGhIB7aqH+h4sg
 6EwpjsBXVG0oowGP8JiqgSH9RgpVYSO2FOB9Gt1d+rK9fMNDVuyG7RfDPUsROJnnkSnE
 UShx0n7O5mOEiBA4Z5A67ybRVI5wdFASYbUIIO3rMZbrdhuKkiWFJwUz47BXMBvnn3Lc
 k3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=muNZenS0Km4uODESvAwS5JDriZubFvXedophlc0fbss=;
 b=ZNy2uXhm67fNMXFuM27OLj9Ww6e1twlIh588xdBURN3z2v0LDcPgZHp5jQ6ZANvGZ9
 jgizG29+KMviK2h2TEWnRcB8DoXfggtuU72RABuuavxWkiQY+Idd4IN9U2qW4LL2O2P4
 w97FaLKhec6cWHuC0npTfR+cx6AWXbtzQplrwr8CPcuMwUTMDUmn3QpqcpJCo761i/ML
 nLylFCZQH6lS4CATG+QvKOLl5Enf8KRPfOrG4x20CmSyNYsOE4fRr9FpbhmivPXWqtju
 e5APRMu5iXL0dQgmQXVRm9pYVzhanQ1GHy/rGryNW695KqjiWo/qJZiRb7+MQqjWbADI
 w+zQ==
X-Gm-Message-State: AOAM532qT5f4ErWycATlSLn2416Hn0+QnWIj5ZdWp7YJwMZcAP7n9zSr
 ntCcOvIEYt7P1PeogpjzXUQ=
X-Google-Smtp-Source: ABdhPJyy8ExgRMDlYsTYkkLhCw077p/PR6MvHl6/JCxGySg6X+QX+Psbr0XLNu2GjHmuxyCOcwjOsw==
X-Received: by 2002:a9d:7085:: with SMTP id l5mr7653164otj.159.1602425689809; 
 Sun, 11 Oct 2020 07:14:49 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z8sm8813278oic.11.2020.10.11.07.14.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 11 Oct 2020 07:14:49 -0700 (PDT)
Date: Sun, 11 Oct 2020 07:14:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] mtd: parsers: bcm63xx: Do not make it modular
Message-ID: <20201011141447.GA9215@roeck-us.net>
References: <20200928161617.2a1b2244@xps13>
 <20200929172726.30469-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929172726.30469-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201011_101453_779558_C6DB480A 
X-CRM114-Status: GOOD (  20.63  )
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
Cc: =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Jonas Gorski <jonas.gorski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Sep 29, 2020 at 10:27:21AM -0700, Florian Fainelli wrote:
> With commit 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE
> detection"), we generate a reference to fw_arg3 which is the fourth
> firmware/command line argument on MIPS platforms. That symbol is not
> exported and would cause a linking failure.
> 
> The parser is typically necessary to boot a BCM63xx-based system anyway
> so having it be part of the kernel image makes sense, therefore make it
> 'bool' instead of 'tristate'.
> 
> Fixes: 91e81150d388 ("mtd: parsers: bcm63xx: simplify CFE detection")
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

What happened with this patch ? The build failure is still seen in mainline
and in next-20201009.

Guenter

> ---
>  drivers/mtd/parsers/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> index f98363c9b363..e72354322f62 100644
> --- a/drivers/mtd/parsers/Kconfig
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -12,7 +12,7 @@ config MTD_BCM47XX_PARTS
>  	  boards.
>  
>  config MTD_BCM63XX_PARTS
> -	tristate "BCM63XX CFE partitioning parser"
> +	bool "BCM63XX CFE partitioning parser"
>  	depends on BCM63XX || BMIPS_GENERIC || COMPILE_TEST
>  	select CRC32
>  	select MTD_PARSER_IMAGETAG
> -- 
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
