Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8BDCC433B4
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:02:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72170610A1
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 16:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72170610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsC6L2Bo+iXCptpubqVZOYsdikeuy/DPdd1A1A4IY7o=; b=NpxQZbkrFIyS/jglpxJCz7/CrL
	YwAGS2rKxYhtZFNloyVanFuAmvkHbExHf6aQTDHKbm4Y3ZqUs2bcC4Ov3vRUu15UVDGIkDuvV/U68
	JqcrtnpiJAHIsOB9PB5VbB5/KP2+N8nCOPtwy4CxLhmNcQ8We8e8H7I5YF9AdPwI2U/a4bNM0ziIC
	wifBe7tNWgRMa/ot7azkH/A1x43NBu/6uQEcdOsQpnndeFi/kRRf3PDvFLiErc5ciCMRFS5uUsM8z
	6a8CwoYIUd5uSvHf+Rt80siB7OOe/jr8vyWaL5qH0ZdBAWO9flMPGTS2K90IlhgBNZa9wG3odZpAb
	DLkaZ6Dw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljl6m-001pkA-By; Thu, 20 May 2021 16:01:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljl5x-001pPN-5x
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 16:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fibiLYNzCSxzKlD/xDOC0kJ8IUe2xcxUsRVvcqtb5Bg=; b=RzBCrHf0fPNGGlTM1AlcDbXmhj
 zWl7KagIGB1Wz+i6ox0tAtL1YVgSNmVV8ET/gycaZQyidev5bDoug9MH9XJVNYycgKDB17EHK2Or0
 ioI20AvonrHrGRBtBlnyVMeEPp8mS2DdROGlS0zFcG8UaVqzPmAw4ElYFpLkEAIea7H2KbHIXdyvr
 o+tHdwkG/JcqZ16Q+WVWJeWnyA6k5VglM+8etlMEWgZLgtP+eYfntuK71/im1EdpSxPcrlDK4InQ4
 t/Y3cz+wXJ8I7bEkPnQYku14w/eZxkRhKKQ3gA9SxhP6lDqk1Z/ndr2MhBi+XrDAd876F1Pnwyb9t
 u3p4Tchg==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljl5u-00GUSS-KI
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 16:00:19 +0000
Received: by mail-lj1-x235.google.com with SMTP id a4so5581917ljd.5
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 09:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fibiLYNzCSxzKlD/xDOC0kJ8IUe2xcxUsRVvcqtb5Bg=;
 b=XcMbHeaMyOr2NMd9nIssNN0jXKAFLyhnPJsMXHxNQkL/kEGlHAupO8YnLCpXxV/U3w
 qeC+GRSBYzd7C1Z2nlheBF6qlRS3LNSfqG4QLRiSEsMiF6wnXXRI6JYQPU8XH8NAu5dO
 nca8j7nK51v8x9XGTvsgRNsGgUPITDi3yVairw3Rqnt+Lb/ImVjSYgh7FoJkHivPt4XJ
 T+dRm0ekLqZ38rj9S4RtC/rz70VcmAMBd19kiPZKoJg5FX/BWeeHhIDDWLkzawYzDt1g
 gvJsjYTLdrabR5BGDy9oruoqj4D1E8I5pcS/CN2UcLZf+MqF6EQ3dTndpbLUqsJwQEzw
 jSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fibiLYNzCSxzKlD/xDOC0kJ8IUe2xcxUsRVvcqtb5Bg=;
 b=l+mosmMqzGzQM/p2bFj5eEeYV/uYYsnumPLC1LTBbgTjZKQy3mdV1X5fihJUbUGEqa
 4fsmuL6/wWlIQao14zevT/XXr7X0kW3K/EhLVrV8kWR2uop5dw8JCFDAJOs9FF5LQVvo
 XycUvNWcNrczsdu+9dH/K/zkDroZz95i+/9i7vFaLL6Pjnrila+6Vvdlhmqub3kWojmU
 p8FEKz1wfAOKMLQkt5MqHqMnBaWNDSLoeEBo72qIAUxsBf4FswYQZF4B+/yscw3v/CFa
 OjhPF+8uumkVEsG4NNAD61krr9r4okxsr456Ndfjvl4v2eNGGyOT4ykU5xpi3BDhTH07
 3sPQ==
X-Gm-Message-State: AOAM533+kuo+3q+UbiPdT0X5UI3S3VMHXN09WHYaJG2cDK35tc5uSj4/
 +uklOyg4kvP3GcbjzTa38wSikw+T2KEwDWUT+4edeQ==
X-Google-Smtp-Source: ABdhPJxoQUYkYcVt6hLw7Lie95F5BPvQm3ceeDtHxM7FkF1cOFQylU2pJdQ+DMx5IapJpFCRxNF3Kdx1mzACi+ONFUE=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr3458982ljt.200.1621526415562; 
 Thu, 20 May 2021 09:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210520114851.1274609-1-clabbe@baylibre.com>
 <20210520114851.1274609-2-clabbe@baylibre.com>
 <CACRpkda6ou1SJZzBwHXN_kWofnFw8w7XAkr7VcFO2NrqbQug_Q@mail.gmail.com>
 <20210520173619.26870bc8@xps13>
In-Reply-To: <20210520173619.26870bc8@xps13>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 May 2021 18:00:04 +0200
Message-ID: <CACRpkdZhhNQupN_4Oh759bKL7sEM9M=yOW1y-mT69ugEkjRMZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: partitions: redboot: fix style issues
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Corentin Labbe <clabbe@baylibre.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh R <vigneshr@ti.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_090018_694375_5C888273 
X-CRM114-Status: GOOD (  14.24  )
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

On Thu, May 20, 2021 at 5:36 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> wrote on Thu, 20 May 2021
> 17:24:26 +0200:
> > On Thu, May 20, 2021 at 1:49 PM Corentin Labbe <clabbe@baylibre.com> wrote:
> >
> > > This patch fixes easy checkpatch issues.
> > >
> > > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > (...)
> > > -    uint32_t     flash_base;    // Address within FLASH of image
> > (...)
> > > +       u32       flash_base;    // Address within FLASH of image
> >
> > Does checkpatch complain about this? At one point the MTD maintainer
> > disliked the u32/u16/u8 types and explicitly wanted to use the C
> > standard library types, and it's the kind of eccentric maintainer
> > deviations we accommodate for.
>
> I suppose this happened quite some time ago? :)
>
> I've never heard Richard nor Boris complaining about it, nor will I.

Yes that was a specific David Woodhouse preference.
I'm too old!

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
