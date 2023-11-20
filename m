Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40C6C072A2
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Nov 2023 01:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbxOiEEdWQece0511S/ZdYslZvZH/l51fwdpnRidq6I=; b=vw/Apd3CTJLgOI
	WOdKQ1FTpUm2ajDHWDLc27rpoAQ+8tr+OSLXCi0kDuexK1wBbBrgd5cNNgnkCnnXaGKjAD85sg6hI
	vMMi0W+FWVa0Ywl23h7hVg0Ug1LZPfe8d/c4tzW9WKWo12jCsEA+FI8/+EP4KXDRKCgnUirD7o3e9
	Ug1rx1kTnr6wnUYHOa1f38s9JEGTPV7FbO5WEZLLxQqH93nTPO6jThfvlYdzLXdhMJDzBGkQAJ4g3
	s66j/NSmHjL6X8X5yOe0TIb7ICCoOWMrxzziC3xCgK0IbX5TAEza1XveWh3CbcuuiN67mksG9Tv5W
	QL8fl0teFhKqw2IM6A/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4tR0-00AvKY-1R;
	Mon, 20 Nov 2023 01:50:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4tQu-00AvKA-2e
	for linux-mtd@lists.infradead.org;
	Mon, 20 Nov 2023 01:50:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc394f4cdfso28110645ad.0
        for <linux-mtd@lists.infradead.org>; Sun, 19 Nov 2023 17:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700445039; x=1701049839; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GhQchwzCIZHAeFSVF0JF+ZxxQabPI7iFHYRhLuaPXqQ=;
        b=WkZ0FVEFqH2tqI0dca/WTmQ2OgoUrsqOBDbA2DPBDQMAEpuK2pCX0GCXq+Pd5ywNG1
         j+UGzZgjxErdncu1WtOa4o/yfL5XajFKEiqDHfh1PDPsU42uI2Jfo5KfnuSIk4dKKmYK
         dN9PZgr/M8yYsRcGqsw+vk52cWNvKxvKrVgWTnooyZO9jsppQmi8ZFOds7fuNzCHre5f
         IAXFCDL0qESVshGw2+s4d456CkWRx59XfSkamb7kgo7GyCvrOhYPSM28kW2DOvC0y4+R
         kBeXAzgvIgOCRBUV36Jx5evB5LyfA1X/rGkatPiKVaL+jYKJp9mIaZJXS4uIbQQEb7+F
         aDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700445039; x=1701049839;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhQchwzCIZHAeFSVF0JF+ZxxQabPI7iFHYRhLuaPXqQ=;
        b=Xu8iCCbhgC5yx4wQDntAGKMxAgwFEASBkPllliXd0yFq+YVqdymXQmI+Dm9CTbojmk
         U0wueFqv5iSh22WHMJ5qPjCqwliRtpC249LGW5COR0M4ETCFIM6I15o2GNIW0eD0us/8
         USbLvp0gJNdYMhzfZOK85PiBz7ecoBJilT3crNVFpJnGPRBEBZgvDIcr37kFvTlO2zPk
         bm2dy47hDGsFmvljZnXQCOEHvgoBlUZUOZ2tm6tfH3BW2U/aMUM4Bgzx2EYwDyfJdyo+
         fJTjC/MmBsSPAUyQ/hvkCbITbJ++AK6v3ipExDMvcrpLHtL8zUoYlxIHN2lX6NdHo2hv
         bg8A==
X-Gm-Message-State: AOJu0YxOIQYyNU++XQo3VcZXP2nfe8nBNJsp0ydynS4wahBAGf2fUmKE
	uh14n1tb6TMR+7AgSRtUjWmETvBQpo8Epxg3wSIyq7FP
X-Google-Smtp-Source: AGHT+IHMZOlHhT3ZxxtoGiTpI+MisUXvcOvLx75+8s29rhoPkKq9iR8RtORwE1qRmD6W+9oTbkAL+66EhnzjQoC0jtA=
X-Received: by 2002:a17:90b:1810:b0:27c:f9e7:30fd with SMTP id
 lw16-20020a17090b181000b0027cf9e730fdmr3656076pjb.7.1700445039026; Sun, 19
 Nov 2023 17:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <bdcaa357da0d1d3861831761b428dee9@walle.cc> <CAAQoYRkMjq6R+6ZpyW0upDz0ScBQQd00gCx=BcS-_K9nypnUCQ@mail.gmail.com>
 <1e36423d84074b8056985a08737a7768@walle.cc>
In-Reply-To: <1e36423d84074b8056985a08737a7768@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Mon, 20 Nov 2023 09:50:24 +0800
Message-ID: <CAAQoYRnRxFjBq7afwHOWi_EbCjdrpLPL6dR2WMs-HC2TdsByAQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add octal DTR support for Macronix flash
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_175040_881553_2D29544F 
X-CRM114-Status: GOOD (  20.51  )
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

Hi Michael

>
> Hi,
>
> >> > Add method for Macronix Octal DTR Eable/Disable.
> >> > Merge Tudor's patch "Allow specifying the byte order in DTR mode"
> >> > Add support for Macronix flash
> >>
> >> I skimmed over the patches and they look good, but where is the
> >> controller part of this? I.e. which driver is using the dtr_swab16
> >> bit?
> >> There should be a working setup.
> > I think controller should info dtr_swab16 support in
> > spi_controller_mem_caps.
> > 8d-8d-8d will not be enable if the flash swap bytes and controller
> > driver not support
> > dtr_swab16.
>
> What I meant is that this patchset is missing a driver for the
> controller.
> Which controller does support it? We don't add code which is then not
> used
> at all. Or what I am missing here?
For this part, I validated on macronix spi host controller(spi-mxic.c).
I add ".dtr_swab16 = true;" in mxic_spi_mem_caps for patchset validation.
Do you mean that I need to patch dtr_swab16 support for spi-mxic.c as well?

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
