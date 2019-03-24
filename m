Return-Path: <SRS0=La3s=R3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A90FC43381
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 20:40:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268AA20989
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Mar 2019 20:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jrh+Lt1K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPT/L0tz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268AA20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8MiHGu+ofJOKvJ7KwjCDQSM5OpPFcjJ5xL4QYMJeB8A=; b=Jrh+Lt1KaENHiX
	sRi7JBfwOqkMpnBDjcRjeKstReTKs9LXmH/y2vkpDnpM9gOcELzdTZY/uhTM6yOOdEmCILMEPph87
	d45xDdMa1w4nRKQafzu90BgtQz8IUPFcEErX4c8slKBn6YWJ8+D3V8YGjNWZMpyuyW4GK4rJtlnMY
	w9h++5VtLlm2WvpVbhyxUqzjZF9lNaT4FiTaRvPN9Wp0h+PP+Cpe3L50S9zFM0dhl0lAnYy6WNZqI
	ztS7Z79LAk99ko4BDVl2p8L1RNpIhLfhEL2thdfPT9CkLdCjP5aH9hX3pSi877DZKB4j6HFKb84Hf
	CH8/Cgb4SgqMq2zHTlZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h89vA-0005Yy-Gp; Sun, 24 Mar 2019 20:40:44 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h89v7-0005YC-Ov; Sun, 24 Mar 2019 20:40:43 +0000
Received: by mail-lf1-x141.google.com with SMTP id a6so4565849lfl.5;
 Sun, 24 Mar 2019 13:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zag3mS16/ocWpIVeVVV7YLnfoYtX1qKbn1MjQNJ0iGE=;
 b=gPT/L0tzX/vifYTUsA5MPNJD/Y4KG7q8tZijBuFJQfi0Jv6xIteIvXtfthZCZSMIl5
 y4wtmNQFyF72Jm6UKocE1/54kP+th90xkaqZ8rOCT4soTummmQ6LqAIplPZHHg/e9AHN
 2eyKwF96i1qRT5mu2Rssz12t3GDtJaxe2cEIiHJBL3zEw8TScVUdOrct2uFAZ4sV9rK8
 ZTM057pchI9qokWhXYE1ikb1phfVo771mINfdiav4cAV+egPuXZdazb8CGLnn9Tt3N4e
 5l2mLNTxqo80q4OKOuOSKwI4+pvj6vNY1GTqmd88fb298iGciwiPCv3bqaI4VkpNuEyk
 tAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zag3mS16/ocWpIVeVVV7YLnfoYtX1qKbn1MjQNJ0iGE=;
 b=q/MZ49zI8nF8ebzI9o2hIgdzbtJRjbAUg4i9o81nc3SZCbhonST013odd8lXVafknP
 x2iqwSB2sGG2zdMGnTNI17lLqGg1aEjoJwGJHTOiVcYpnQqUlgbFXbKMOAG2m7xA7FOQ
 Cm8AqVKxsTVfS9FMGq1JD2ysgHSwED7ai+Z98LZCCaj2ODS+QGXOAQCXrynm3RnSNZ4Q
 jZF+XzYuqGbqJagITJm1U/cbkPKTED6CQqoVXot2acuibm537A4uDqYi0QnxzNJJqQBo
 nTvbh1PNIfcpUnbT19cg/4cRua382CKq7CXSd3p2YLFmMOlx5GlzIz4I/8HnypBjvLtO
 JTVg==
X-Gm-Message-State: APjAAAUwD4mr+XFp2vad2VcWFNfKeB+ylh6mq9CvocgBkuJec8q82EU5
 D+GnmQ7nFUxbRB8ENhu3TO8=
X-Google-Smtp-Source: APXvYqxTsAbZitRwsCnlTyDIDMZNbwyT8GykkG8UMah4iOV1rdBf54Ehs7lMSr967Bp/Jh6M3wAdzw==
X-Received: by 2002:ac2:5921:: with SMTP id v1mr10775321lfi.135.1553460037040; 
 Sun, 24 Mar 2019 13:40:37 -0700 (PDT)
Received: from z50.localnet (109241207190.gdansk.vectranet.pl.
 [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id 77sm1079933ljc.69.2019.03.24.13.40.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 13:40:36 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] mtd: rawnand: ams-delta: Drop board specific partition
 info
Date: Sun, 24 Mar 2019 21:40:34 +0100
Message-ID: <1944041.gYv7fxL5Uc@z50>
In-Reply-To: <454BF5C9-478A-4E2A-BF00-D2A2AFE25C45@goldelico.com>
References: <20190319223718.26131-1-jmkrzyszt@gmail.com>
 <20190324185932.GA24594@darkstar.musicnaut.iki.fi>
 <454BF5C9-478A-4E2A-BF00-D2A2AFE25C45@goldelico.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_134041_839163_F80D9992 
X-CRM114-Status: GOOD (  23.28  )
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
Cc: linux-omap <linux-omap@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Richard Weinberger <richard@nod.at>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Sunday, March 24, 2019 8:24:48 PM CET H. Nikolaus Schaller wrote:
> Hi,
> 
> > Am 24.03.2019 um 19:59 schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
> > 
> > Hi,
> > 
> > On Sun, Mar 24, 2019 at 05:48:22PM +0100, Janusz Krzysztofik wrote:
> >> Hi Aaro,
> >> 
> >> Thanks for your review.
> >> 
> >> On Wednesday, March 20, 2019 2:16:30 AM CET Aaro Koskinen wrote:
> >>> On Tue, Mar 19, 2019 at 11:37:18PM +0100, Janusz Krzysztofik wrote:
> >>>> After recent modifications, only a hardcoded partition info makes
> >>>> the driver device specific.  Other than that, the driver uses GPIO
> >>>> exclusively and can be used on any hardware.
> >>>> 
> >>>> Drop the partition info and use MTD partition parser with default
> >>>> list of partition types instead.
> >>>> 
> >>>> Amstrad Delta users should append the followig partition info to their
> >>>                                        ^^^^^^^^
> >>> Should be "following".
> >>> 
> >>>> kernel command line, possibly by embedding it in CONFIG_CMDLINE:
> >>>> mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),
\
> >>>> 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved).  For their
> >>>> convenience, select CONFIG_MTD_CMDLINE_PARTS  symbol from that board
> >>>> Kconfig automatically if this NAND driver is also selected.
> >>>> 
> >>>> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> >>>> Cc: Tony Lindgren <tony@atomide.com>
> >>> 
> >>> Could we move the fixed partition setup to the board file
> >>> instead? Otherwise this kind of change is not really nice for the users,
> >>> as it will likely break existing setups. The default partition layout
> >>> should remain the same.
> >> 
> >> I'm wondering if it would be acceptable to pass partition info from a 
.dts 
> >> file.  I think that would be a better, more modern approach than adding a 
new 
> >> header under include/linux/platform_data.
> > 
> > Hmm, I thought there was some generic way to define partitions without
> > adding any new headers. But if that is not possible, then I guess your
> > CMDLINE proposal is the preferred one..
> 
> I am not sure what you exactly need, but partitions can be defined in
> the DTS as children of some NAND drivers. Example:
> arch/arm/boot/dts/omap3-beagle.dts
> So this design pattern could be copied instead of using CMDLINE.

The problem is, OMAP1 has no device tree support.  Other than that, your 
proposed approach already works for me locally with some basic support for 
device tree added to the board file.

Thanks,
Janusz




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
