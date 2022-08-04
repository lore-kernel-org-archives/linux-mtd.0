Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148FCC19F2A
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Aug 2022 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We5Z4tycw6O5doeRqyrtt+B+gx+B1utnjVAaJyaPIPo=; b=hSiBOdPctV0qAb
	mxqTanTjRQ8/nglmerfSk6X/qmZmdwOfnEGGp8NMp5Fnq68mOn8+XrqlbEm/G2GnTejjaazrMx9SY
	IUyEmZThrDshZR7PnnRLsKbpBzKrF+hnHb1Clzle/9ljvFRCg79ccKxRzDQlNlm3OE7DcmUu9NeYu
	MbK61+wPWn6wTY6ipR1iSTRG7lVVsbK1sQsIVchfMBzfVhFkOC9ePmVAqcjzTcfWeCgSq95igOA3W
	s5YQQi5p2J86xkPAFsFpBCK2XA6raTNj44M71ZYzjA/hyfdog223iOjshvza7aEDZSXKPL+DR+r7S
	DyJLf1o81RXJ824Kty+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJf4H-007yjg-12; Thu, 04 Aug 2022 17:55:33 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJf4D-007yh9-2U
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2022 17:55:30 +0000
Received: by mail-qv1-xf32.google.com with SMTP id m10so156009qvu.4
        for <linux-mtd@lists.infradead.org>; Thu, 04 Aug 2022 10:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Hbjl3nNAZzAxsce6YFBJuobMzGqRGOHNPcP+9siXqBE=;
        b=Ygon3eKTgfZBTXO4e7G23ZXRLZXIP2ETyigijndRgsIyKoRei+iBusncpugnigANpl
         d6EwVc6S1sgiD1iIq1ggSGep6SGhBAUKAU4K42wcd3duO6e8Lizg8froZQUzPAxWKtdC
         kknKw/YWmb3UvH4hXMN43srLv7ZRVbjz3p9Hu8hJbv44IoIfaF9PAwHumSNBvtVCwdIk
         o8s44V9fB3sal1CQTZOHD64v10mZpzvlSrGl9aFMnsmZG/dmkPuHsc49/vpMXVjf3knF
         ZjalYHQh3fuxIOH8ZzSYu41XDiIZe3shCJNk3kHHFTLavRz+vtCj0CNiGdfxMvvUN5N/
         RTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Hbjl3nNAZzAxsce6YFBJuobMzGqRGOHNPcP+9siXqBE=;
        b=RI39g/cUcF5OAVHYMabIzJy87ibA14KSqDiOXJY1w5nEqN2UKSIPm+cNG3SMS1xZBP
         1PbUF9AtZtUutDOo7h+Ltk+wFkXAtWFN0UF+VrLb9PmPK14NjjN9YF9mhTE9+IykazA4
         hsKYcd+9nOCEHMyunotnmkAeMNdVxiMeXb8koEjcEewjtqWlsJD4V84KKegIt6twMBgW
         ek9wK7AisWx3toiy7gGf7CIpUzNQqb+j+J7pkTlLCN2Mw3uH5RL7hPzedHn3LaqBydBU
         sYOMgju4+3uRaCrIN41u/9zTydZJTYWYd4zh8cLXTiMtSj+V0xjhL/98YPmgsd6Z02at
         zlrA==
X-Gm-Message-State: ACgBeo0oZcK+HM5UAzwVZv8Dni9adCQiGlP5mA7DSi73qjcwXxX9VTmD
	cn0yhtvhLJmR+jYGLzhM1J8=
X-Google-Smtp-Source: AA6agR6im+t1U/t5x9jWtYHxLrT0GXVJLmHrJztxXsznigFqDo3eQr0H9U+Ke0xQAt5CGIwLQqUyiA==
X-Received: by 2002:a05:6214:20a4:b0:476:f037:8ac with SMTP id 4-20020a05621420a400b00476f03708acmr2468793qvd.38.1659635725212;
        Thu, 04 Aug 2022 10:55:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id bi23-20020a05620a319700b006b8fb2a1145sm1100682qkb.124.2022.08.04.10.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 10:55:24 -0700 (PDT)
Message-ID: <6008ef46-ccdb-ea01-f9fb-4f8fceed2d29@gmail.com>
Date: Thu, 4 Aug 2022 10:55:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] mtd: rawnand: brcmnand: Glue driver Kconfig entries
Content-Language: en-US
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Roger Quadros <rogerq@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Cai Huoqing <cai.huoqing@linux.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 William Zhang <william.zhang@broadcom.com>
References: <20220711222323.4048197-1-f.fainelli@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220711222323.4048197-1-f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_105529_143621_88D6E9E9 
X-CRM114-Status: GOOD (  15.38  )
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

On 7/11/22 15:23, Florian Fainelli wrote:
> Hi all,
> 
> This patch series allows for a finer control over the BRCMNAND driver
> glue driver selection such that it defaults to the various platforms
> enabled in the configuration file.

Miquel are you able to review and apply those patches if satisfactory? Thanks!

> 
> Florian Fainelli (2):
>   mtd: rawnand: brcmnand: Move Kconfig to driver folder
>   mtd: rawnand: brcmnand: Add individual glue driver selection
> 
>  drivers/mtd/nand/raw/Kconfig           | 22 +-----------
>  drivers/mtd/nand/raw/brcmnand/Kconfig  | 49 ++++++++++++++++++++++++++
>  drivers/mtd/nand/raw/brcmnand/Makefile |  8 ++---
>  3 files changed, 54 insertions(+), 25 deletions(-)
>  create mode 100644 drivers/mtd/nand/raw/brcmnand/Kconfig
> 


-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
