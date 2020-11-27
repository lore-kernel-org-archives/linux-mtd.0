Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69ACEC63798
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:56:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFCA620679
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 12:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b6MlSZj3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3pQARZQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFCA620679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iXAjW9dfmS22gRukXQ0ArA4fZ1GI+B7zBxOUxUP54a4=; b=b6MlSZj3jNWd7GlbkLiAfwukV
	JUFcKEFxclxlLgzLAkaTBpqCORqGYcvJUukLoXQe/bBmZX3xvIBLEq3G/kGAlbqf5N6fATxjDxTse
	YUNsF0WmlLEf058UjTs6e+Bd8enimBoPHc6KcJR/Xyu12WIr1ZenBG3cnj7FwFjA6RNLZm4xzyRG/
	QfBTeScmtjtAM+hTYfEcdx/Nzyjms3AkdKEQQ1yHZoKE2QgKWSBbOE4rdhDRNjuQu+o71MYzr0Tv6
	BZsoKzUTFh75Lz1TKWY3AnubjyVssXS5LoAIdzmjYIpv9jaDUF0aLYNLxvRCCao2Qj5GQAt+QHvVq
	Y9qvhPeBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kidI8-0005za-Vt; Fri, 27 Nov 2020 12:56:01 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kidI5-0005nZ-C3
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 12:55:58 +0000
Received: by mail-qk1-x744.google.com with SMTP id v143so4218755qkb.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2020 04:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SR0buUf6DCzAWU92G2HBvARJg34ZQtaAQdyvkGxwmHw=;
 b=d3pQARZQzne4lvGIbtpPxP1Ngz44mhbQTwiD+ZRXLPeJlCrbsx/rqcKMN7q40lL6Jp
 rX3akTMtl362x5JpWgDsx3FO2TPOX0t0UDcHtzZ0QXHQnog4WT2ngj77dN1Ig+hqWn7C
 1bxyhC7h6M2Jm6j/R20590QYxRf6OjD2PTULAV8g1T8g189/6tmWPm9aJt3RYZnLh3k8
 AwStSiFhWqXULNGbCsRfds/wnW0smGj2jqOcYiMr3/EffTZICkHU6q9EnmJAMQZrrm15
 HQjsj0e8sjSKDPBMklC/aDJBq2Cs2RiCmvb/ZA7jullaZOG87K2iHBT3OsXBhd5d+63z
 hg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SR0buUf6DCzAWU92G2HBvARJg34ZQtaAQdyvkGxwmHw=;
 b=G2VEwnOMVd3nM1SX+SPpBIqxc+xNuvdbnP0kqK+Kn8UxYjmWNFRLigZL992BAn4m6o
 Ifvuwk+XHqWtyKDOsemBl3tZXD2INrOzppRwQ76P0vJ8Mh+UrgbgPPglWmlYsjVO8XoZ
 prRY9nyLmWjdU0GTLrwVJu/UgfEDi83V79Hd2SagQWuH5PJtWEt/sRgXwPAHej2Kc1aZ
 S+wcyt+X5kjQAomvfrJVc4b0LJIIuHWaYOoidC2IY91hVYpV8zOQqU3dGLEYwjhlQmYP
 EnRYPE5tTBeWeAkVEzslHKEEIF5gWynS4s0X3zllQfwqxVDiXWo/AMDOHqrc7BXNLEvm
 SDDA==
X-Gm-Message-State: AOAM531HzgD9CRSD1w2gaIm00Ipf/UMUFWQyUaZEAgTJAoyZmS4d3VFw
 1st2o+jOTDYj7EhKnVz1pvJL5+Lciwv4mhHlHDA=
X-Google-Smtp-Source: ABdhPJz5XCY1HfjEjxSS3/+367IzKVw/fV+zyn+EUUOMXGBy667vJRPqWlzmQV7b5DHfXf9Lz5glKhf8p4fS9WuxwiU=
X-Received: by 2002:a37:991:: with SMTP id 139mr8297156qkj.185.1606481755664; 
 Fri, 27 Nov 2020 04:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20201118182459.18197-1-p.yadav@ti.com>
 <20201124134619.2pbg7zejbvwc3e2w@ti.com>
In-Reply-To: <20201124134619.2pbg7zejbvwc3e2w@ti.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 27 Nov 2020 13:55:44 +0100
Message-ID: <CAFLxGvx=pKeLxq1yaruSK8qtodivX8TOFVyjF8sLrJQjdVT8Dw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_075557_495846_BA443ADA 
X-CRM114-Status: GOOD (  27.26  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 2:58 PM Pratyush Yadav <p.yadav@ti.com> wrote:
>
> Hi,
>
> On 18/11/20 11:54PM, Pratyush Yadav wrote:
> > Hi,
> >
> > The Cypress Semper S28 flash family uses 2-bit ECC by default. Under
> > this ECC scheme, multi-pass page programs result in a program error.
> > This means that unlike many other SPI NOR flashes, bit-walking cannot be
> > done. In other words, once a page is programmed, its bits cannot then be
> > flipped to 0 without an erase in between.
> >
> > This causes problems with UBIFS because it uses bit-walking to clear EC
> > and VID magic numbers from a PEB before issuing an erase to preserve the
> > file system correctness in case of power cuts.
> >
> > This series fixes that by setting mtd->writesize to the ECC block size
> > (16) and making sure UBIFS does not try to do a multi-pass write on
> > flashes with writesize > 1.
> >
> > It is based on the xSPI/8D series that adds support for Cypress S28
> > flash [0] (it is in next now). The patches themselves are independent of
> > that series in the sense that they don't rely on 8D support. But since
> > S28 flash is not supported without that series, these patches don't make
> > much sense without it.
> >
> > Tested on Cypress S28HS512T and MT35XU512ABA on J7200 and J721E
> > respectively.
> >
> > [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/
>
> Any comments on the series? If not, can it be picked up?
>
> > Pratyush Yadav (3):
> >   UBI: Do not zero out EC and VID on ECC-ed NOR flashes
> >   mtd: spi-nor: core: Allow flashes to specify MTD writesize
> >   mtd: spi-nor: spansion: Set ECC block size
> >
> >  drivers/mtd/spi-nor/core.c     | 4 +++-
> >  drivers/mtd/spi-nor/core.h     | 3 +++
> >  drivers/mtd/spi-nor/spansion.c | 1 +
> >  drivers/mtd/ubi/build.c        | 4 +---
> >  drivers/mtd/ubi/io.c           | 9 ++++++++-
> >  5 files changed, 16 insertions(+), 5 deletions(-)

Can we please have am ACK from NOR folks? :-)

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
