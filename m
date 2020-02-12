Return-Path: <SRS0=zQg3=4A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DF9C352A4
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 18:26:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10B5C206D7
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2020 18:26:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glPXQ+hD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PDl+NqgL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10B5C206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wzbIoaP+vccrRnNQAoZ2C5lpHItA+ZR7JceylQfuHt0=; b=glPXQ+hDaMdQlW
	o97syHhVJI0I9Jg+Kf9ud0FMwpl84TmcyaTdtIMNvgqARdWYY6G+Q0u7eRrqHmNwnqNY8Q5Rmw8LK
	38R9VBQkA+MGA+ILNP47925XsKAkMaP2yGO9UoBNfTNTmPRYocKF0RLqDrtuf/XigTGXRNx2SMthb
	nGsLe/vpjrtZvmt7/tbj08Sali3tr9sVTDPbg4BPYopzbLsdmoUJ6ABTb583w3nYDHNxUP1G+Hl6n
	PBeu59BoT4etYRtQ6VJ66KCUXPq95Ttm3FQheTrAk1fpsVwkbxc0NDb/r/GsgMxszTTRLfrf0xFCj
	1zp94FlSQ67dwjg41fTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1wi6-0008D5-0o; Wed, 12 Feb 2020 18:26:06 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1why-00086z-Du; Wed, 12 Feb 2020 18:25:59 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so3474006ljh.5;
 Wed, 12 Feb 2020 10:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sdJy3y/pjaYpYWC4J4QN/ZTkobn3EjGqqaK/ExDj4B8=;
 b=PDl+NqgL/n+cptSpvy3o69nsnQDeFVZK5EcckuzH9CtGJU9MGCvbmo9l1XlFtSY9NP
 PjsnyN6dRhKPnjP0+M0v5Bvbmga87Wqa667VT5KGe13SNrj2vaySsTgqFNRJkBO+jcGS
 1PX3uePvSoDEBBXCHQfZDqxymmTSnSx2UYsL5KJU/hdDtmX3PnWWuyAELrQIXk4zZ0pC
 GZMmLubj2cJJiSAsvBxi0RO+97Zxd8BbkKHfaPqnp7MmP4RuKXZwDEq2WYaKow8je3Xg
 rBie8/l18sE7TqlahXXzNDoeOC45Sa61/4NmdKNBdXsKRlHD1l+MhwOaebh7RoQ2zmD1
 c1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sdJy3y/pjaYpYWC4J4QN/ZTkobn3EjGqqaK/ExDj4B8=;
 b=BUfDhk2w3DxYOgCNYZj/j+MkmEgrlxSJRuOIkxuRNyz1eL/hgCENBH8QDKKyTzwZYD
 eIbvBhsemNIWWZBPsE6+QUPR7CWvvWdhCJ2kuX70v9TqpKg82TJAGTi3zof4zZOtCVRB
 kCzIuX6ysj2GVcb++Ghxj8MI8U8C3y3pZFHTvKS32n67viBO5wG0IZa+ftF2q7q1IDQP
 wvsJ15SzVY4jXyTUT5VCXZ5eH0hvye1B8HXuPFr9YbBGauZE+qlnIM4nzK4UsNSWKX9W
 9s5jT/FVIV5HPKxeXsmndEXBqVdgQIlBMI6SZgI51tl+cKXWh1lBwOZ3B+ksCoovGHma
 +yiA==
X-Gm-Message-State: APjAAAUd2W5cicnAW0bdXylM6gFyoBVaK0VKcbkOKcraWg8DvmQjhFKs
 lS1gqFJDDPH1fe7c1VHh3kM=
X-Google-Smtp-Source: APXvYqwW8lp+R+SCYfdudPq/rEy1BJkdsJzEMeiG2qAC1OaWJKbtuvvqTu29yUSv5jGGKPKIep94DA==
X-Received: by 2002:a2e:5854:: with SMTP id x20mr8026053ljd.287.1581531955333; 
 Wed, 12 Feb 2020 10:25:55 -0800 (PST)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl.
 [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id 14sm669227lfz.47.2020.02.12.10.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 10:25:54 -0800 (PST)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [RFC PATCH 03/14] ARM: OMAP1: ams-delta: Provide board specific
 partition info
Date: Wed, 12 Feb 2020 19:25:52 +0100
Message-ID: <4506487.GXAFRqVoOG@z50>
In-Reply-To: <20200212145154.GK64767@atomide.com>
References: <20200212003929.6682-1-jmkrzyszt@gmail.com>
 <20200212003929.6682-4-jmkrzyszt@gmail.com>
 <20200212145154.GK64767@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_102558_471935_06D9AD5B 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Richard Weinberger <richard@nod.at>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tony,

On Wednesday, February 12, 2020 3:51:54 P.M. CET Tony Lindgren wrote:
> * Janusz Krzysztofik <jmkrzyszt@gmail.com> [200212 00:41]:
> > Now as the Amstrad Delta NAND driver supports fetching information on
> > MTD partitions from device platform data, add partition info to the
> > NAND device configuration.
> 
> Fine if you want hardcoded partition info :) Not sure if the partition
> info coming from bootloader is any better either.. Ideally there would
> be a partition table somewhere on the device like we have for disks..

Yeah, but Amstrad didn't provide anything like that, and we may want to get 
convenient access to factory content of the flash.  We might use command line 
for that, though nobody seemed to really like my previous proposal to use 
command line partition info exclusively.

> Anyways, this is best merged together with the mtd patches so:
> 
> Acked-by: Tony Lindgren <tony@atomide.com>

Thanks for your A-b:.  BTW, patch 06/14 also touches the board file and would 
require your acceptance before being merged via mtd, so could you please have 
a look?

Thanks,
Janusz




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
