Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409BEC54E41
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Feb 2024 11:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT1XAxboVNb3tD8VVAueErCmcns0hj5QV0gsJoIEHmA=; b=KGzRt7+HXSB7vo
	HVODdvPXdJSEyNI+ABidDfaYXvPLym2SLv7Maqm6/JOSyYCmDsaaQhdikOdMoqqs9gqRt9lh3ZzY4
	U5IGcIINllX0g0H/LcBlLcebEkNklCXzOa0cz6mAXXQ4aA3MYw8x061KiEaSIHZ6aYkXRJhytON1K
	w4qM8S0+j/1r81QDayv79bAUPKQKVjC9+rqdNfUx05uSu3tm9a/LrxQZdxvVHqHoxlXkqIZNCF7ap
	VrYAFGUn55rQ/y7u3vx9oEvIPTP52KNOQXbgYPXuwWd97pH8XNxA9QB8yjrpzJKScvXE55SlP4Vtc
	g0phug5R7s5DH5u/Ksaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdq3J-0000000ChSe-3up1;
	Sat, 24 Feb 2024 11:18:45 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdq3G-0000000ChRV-03bb
	for linux-mtd@lists.infradead.org;
	Sat, 24 Feb 2024 11:18:43 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3394ca0c874so1029776f8f.2
        for <linux-mtd@lists.infradead.org>; Sat, 24 Feb 2024 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708773520; x=1709378320; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/zHtnHJBkLHaWWffv0wRxWGPw57+ZGOg6K9nRmYxTo4=;
        b=eOEGxmuybY5qjEC5ybmlVr1KjLYG6rYoOw7yVIzPTSZtszxYCZgbedNDd0Azc/1nKZ
         3RtW5nlwL6NjLgunJalKWM9Tg84ugF1DrT21+hxlkZNg4nuu0+hM8NVCIi/F0PQ4/yD0
         yljGJuTEgu4l/JAuNP9gsDAJaYDOpbLKs8+dmQMZbcHVz+wnUUzJVDx4aKH5umESi/v6
         PJqaxKfeMbF8+0p4F83PxugZtcpplJE83C3cGJE52viC2PgszgsNA1FZ1Xa53x2Eo6xz
         OXLFlmbLIW1iyyYjQSlaan3a4xhXCuoEirU2m+oFWXSc7S1KA3PFLxM9QlUujS4LzXEu
         bacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708773520; x=1709378320;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zHtnHJBkLHaWWffv0wRxWGPw57+ZGOg6K9nRmYxTo4=;
        b=R+5Nm5u1pGiy9yemiNbHqOcjquC/M3GbScj6QL+vljQf16OJPftKI79KGSL6itPkkl
         wU3Z3YH4zSdFT6HGHk9pwppNbi9kaEveMA5294yrzj1VCYu5Fo5IAUBy8CKJ0qJQj6MN
         834yniSWkQgPSDflB5LxmmokcGNRJxlJtU5dLxXKTlTMKM2dWfWyLNtifzGY2AIxd7A3
         +M9J9PGDhBuU/op2RPy14Csye1sxkL9IiAwARq+SQtGxCqMe7OwZC+yNEm/Ahsd5J2yJ
         8271sE0CDfrAxvFHuysxqkbJJjtypJcETeCeCYYO/QKHrP7244XAoWVqXKD0BUAE1b0R
         WWzA==
X-Forwarded-Encrypted: i=1; AJvYcCXFCPm6bi177dSH7w8Oa875wnlJl0SgCfIwhcdbexhdkSv1Ne6pUeIY85lh74O+FdpormLBXbZIih10YV5Z12g8Wys+U1QeHFum7aIwcg==
X-Gm-Message-State: AOJu0YyWfsmw42CKjbnGfhsmCmOtFkHb/761lSLY9y9VPm9iXchbziFQ
	yrRhkrrK7RkV40YW2Lz0Y/kLVZ5UYwyHrX4oZnR4bVEAJaX7blgl
X-Google-Smtp-Source: AGHT+IFjdGtAcyyWaW+dDqzIT3dnsYQx3wZ2z+cpQrxMSC/0EYYTNa7bwc0ddqm4fNskWdx6J0I3+Q==
X-Received: by 2002:adf:ee06:0:b0:33d:746b:f365 with SMTP id y6-20020adfee06000000b0033d746bf365mr1464302wrn.52.1708773519559;
        Sat, 24 Feb 2024 03:18:39 -0800 (PST)
Received: from Ansuel-XPS. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id k3-20020adff5c3000000b0033d8ce120f2sm1783346wrp.95.2024.02.24.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 03:18:39 -0800 (PST)
Message-ID: <65d9d08f.df0a0220.988bb.3177@mx.google.com>
X-Google-Original-Message-ID: <ZdnQjOFySK5xzA-N@Ansuel-XPS.>
Date: Sat, 24 Feb 2024 12:18:36 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, David Bauer <mail@david-bauer.net>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for BoHong bh25q128as
References: <20240220200325.19089-1-ansuelsmth@gmail.com>
 <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7c45e7b-993c-444b-8710-042da7512bbf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240224_031842_145560_2002BF06 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, Feb 22, 2024 at 09:19:48AM +0000, Tudor Ambarus wrote:
> 
> 
> On 2/20/24 20:03, Christian Marangi wrote:
> > From: David Bauer <mail@david-bauer.net>
> > 
> > Add MTD support for the BoHong bh25q128as SPI NOR chip.
> > The chip has 16MB of total capacity, divided into a total of 256
> > sectors, each 64KB sized. The chip also supports 4KB sectors.
> > Additionally, it supports dual and quad read modes.
> > 
> > Datasheet is public and can be found at the referenced link.
> > 
> > Functionality was verified on an Tenbay WR1800K / MTK MT7621 board.
> > 
> > Link: https://www.e-interlink.com.tw/userUpload/files/BH25Q128AS_v1_0.pdf
> > Signed-off-by: David Bauer <mail@david-bauer.net>
> > [ reworked to new flash_info format ]
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> > Read/write/erase test are done by flashing and installing an OpenWrt
> > image on the spi and by using overlayfs on it confirming correct
> > read/write.
> > 
> > root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/partname 
> > bh25q128as
> > root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id 
> > 684018
> > root@OpenWrt:/tmp/tmp2# cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer 
> > bohong
> > 
> > root@OpenWrt:/# xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
> > 53464450000101ff00000109300000ff68000103600000ffffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b42bbeeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
> > ffffffffffff003600279ef97764fcebffff
> > 
> 
> Hey, Christian,
> 
> Seems that the flash defines the SFDP tables, thus it's likely you won't
> need a flash entry at all, and instead rely on the generic SFDP driver
> to parse the flash settings from SFDP and initialize the flash based on
> that.
> 
> Have you tried testing the flash without adding a dedicated entry for
> it? Just specifying the jedec,spi-nor compatible in dt will do the
> trick. As you do now, but without this patch :).
>

The user just tested this and It seems there is a problem in JEDEC id?

[    0.726451] spi spi0.0: setup: ignoring unsupported mode bits a00
[    0.732850] spi-nor spi0.0: unrecognized JEDEC id bytes: 68 40 18 68 40 18
[    0.739725] spi-nor: probe of spi0.0 failed with error -2

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
