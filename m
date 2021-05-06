Return-Path: <SRS0=TrVe=KB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D24C433ED
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 15:07:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A44261166
	for <linux-mtd@archiver.kernel.org>; Thu,  6 May 2021 15:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A44261166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=malat.biz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V5Di1C1ZDM0u3oL1262sBtaLd8puDvcwDiP5NRUSDR8=; b=kDyeaxltS8XjMkdMa44f4XFEg
	5Xz9Ak5WRPSoPSC2DvDiaJdnZo5JEdkRaPX2NqWj6tTekIo/VCbq+kx5K+V5qu2VvxHaVWdy155dB
	U6+hJDMRAd5yCJVo6zbsHm9RJs0y4Nofnab0nRLh+vYjv1+ouM6JM70fPss0A1nV1KSqaOjBhYZcD
	bY4azxD0EXkrTacEiZDaS0Hc+K4TE/ryFIJIzteNzkkOh72Y+Nbzrsa2YO7CN4qX5/vMxrIryXO7q
	1RIYMmSFQfFb2c97xsIEXTaHMsn2AvuJtmM13/3q10llGFF4MggZO/hi/33Qh8oR7PLXAmHElHEzl
	/KSaMbi4g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lefZw-004VGh-5A; Thu, 06 May 2021 15:06:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lefZu-004VGS-0s
 for linux-mtd@desiato.infradead.org; Thu, 06 May 2021 15:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vodnM2xPwp/o8rXQ4KpnLDcH7j5gZEgyUaUqrtxPFCg=; b=oJrHGKfnu7C0YgEzuS1h14z8Tm
 MmnywiGbelXpP1mrJgb4xOUYckZ+OPaXarDWheYJHuToPd/8GgEC6/vyZ+x7gCYfr6hAtje88caOo
 u9dU/vXQeSwRs14ngGo6mm9J7GKPS29nY4+fY75/0u7YFmiEiuqfVigEi3IqtijJs53jK8RMA3GFW
 Bsnk0VJtDeZYqzV4aBaMvY5Ob119k9C/11DucWNQFrdOhsF+UI+bQ0U4JzpOT0H4zWGDhJzIiSRZa
 FGMrtNm2FvzuZspAd4f0oHkSctUEsuduYU5zwDrB0MZznAM0QlERmZYWzU9c9WY1GhAQopXkW8YCO
 WSSyJ9jw==;
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lefZq-0067Oe-IQ
 for linux-mtd@lists.infradead.org; Thu, 06 May 2021 15:06:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id d4so5982396wru.7
 for <linux-mtd@lists.infradead.org>; Thu, 06 May 2021 08:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=malat-biz.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vodnM2xPwp/o8rXQ4KpnLDcH7j5gZEgyUaUqrtxPFCg=;
 b=sxArirhULIbf9EGwTOYtgMUc20ycDWurNzONFmD0xmw0pY76onAQF8pQBs82VSNz6a
 Jh1Ju8mEo589QKT06DYR34yv3N3yV55ZZGvZgnGSB8ADX27sNXAtM2qEtHTCAz4bMKSp
 pYQzwDNgEqt4MuKcF7/SXxHgt1gh+GZD0uRxczSv6PLZcQZw87FE6lt9gbEOdPccwE0u
 yYmgQCGbD/E2vh673v/mJZjPfE6oyp0Fg7voRYNJGlPg3PzrOHQ5LQkrLtGjvf+PE+M/
 UbbVZNkngVO5OalBcGNHgpx8k5+6ev8ysTpENRSWx+Y7/49AvGHKHruOKmZwmpBvJ7wI
 enww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vodnM2xPwp/o8rXQ4KpnLDcH7j5gZEgyUaUqrtxPFCg=;
 b=Cz7FnOjK5g6IW6Ud0pNeTHRXu5N1myN2GK9W7CUoDJrAtVfUEcYTdgIodGM0jaKsAf
 tM5O7MM3vpURuJpu2P0zIMFaTODgI5hjUvK4v6pWk4vm0PWz2mjP4mJOe8HxUDRXpXqT
 T68GOul9QagSzNoJvGgmDJqYbLCiJ4JsT4refZhAbT8l/sxxO2XSkPO7W2fsq4FkWRZr
 tGcHNSvbG8HTzVhAMqu6EkWYYvwcSmUaYXTYNVE5CjLQpgscyuqdmJOxkHK/fMV0UnoC
 KOzaI9g6jrZOIv0/3fVioiyCnl2NKwhUVlWBOP7GihD5/x7LCuXSg6uAnBoqWfbq8ZjX
 FqFg==
X-Gm-Message-State: AOAM5333TmCvDHOs6/2aqO7hSCYEtpjujIzc+TNMx1Poyc2GwZyBmR3P
 HmsfqBRZvmim+7pql2UxdEHzcw==
X-Google-Smtp-Source: ABdhPJwJ7W2DLTMmm/aOwHMv0c9LuytCADPUDC/0UhPcEVXy0AVaow+UzKAwc9mO1P63dDiy4XuK/g==
X-Received: by 2002:a05:6000:1887:: with SMTP id
 a7mr5811032wri.280.1620313567823; 
 Thu, 06 May 2021 08:06:07 -0700 (PDT)
Received: from ntb.petris.klfree.czf (snat2.klfree.cz. [81.201.48.25])
 by smtp.gmail.com with ESMTPSA id q16sm3700515wmj.24.2021.05.06.08.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 08:06:07 -0700 (PDT)
Date: Thu, 6 May 2021 16:57:57 +0200
From: Petr Malat <oss@malat.biz>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: Create partname and partid debug files for child MTDs
Message-ID: <20210506145757.msil4utmz2vg3smy@ntb.petris.klfree.czf>
References: <20210430065057.32018-1-oss@malat.biz>
 <dc9d00dd84d4fa1f4219cd769922312e@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc9d00dd84d4fa1f4219cd769922312e@walle.cc>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_080610_685179_333FA1CA 
X-CRM114-Status: GOOD (  15.86  )
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

Hi!
On Fri, Apr 30, 2021 at 09:02:14AM +0200, Michael Walle wrote:
> > Partname and partid are set by the upper driver (spi-nor) on the master
> > MTD. If this MTD is partitioned and CONFIG_MTD_PARTITIONED_MASTER is
> > disabled, the master MTD is not instantiated and partname and partid
> > aren't available to the userspace.
> 
> You might have a look at:
> https://lore.kernel.org/linux-mtd/20210429155713.28808-1-michael@walle.cc/
Thanks, I used it to replace my hack to dump SFDP with print_hex_dump.
As it seems I'm not the only one interested in SFDP in userspace I
have pushed my SFDP parser to github https://github.com/petris/sfdp-parser

> This is just for spi-nor though, but attaches the properties to the
> flash device instead of the mtd device.
Currently, no other driver is using it. If your change makes it in,
debugfs attributes can be removed (or extended to cover other drivers
as well).
  Petr

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
