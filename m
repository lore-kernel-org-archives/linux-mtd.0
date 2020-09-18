Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE00C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 13:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2CC7235FA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 13:35:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KSZK30RD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAHVq72p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2CC7235FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8NUt15lk13H3T8k7TcReg7n7BeYgN0tqvPcgIerulM8=; b=KSZK30RD076cfDw+9yZbfFUwd
	/h/rnsBee+uZM/3bUl5BARdWytdU+tCswhRLRj0xW1s0N4Y3t5os4Kmx1IIj+7uK/e1hOF5HWW5gn
	nlUDraPrYze1VwwqoBr1NHssIAOErrdKTKo7hUlL+E6FnbNhoM7vfVn/12K7Ygk+b6FvLIH/vvJqk
	Cdu/M2cSvP7C/AHOTEfMHnCzkIEMm50FPLmmVCNqusUuSbv/hH0DEma6aC/G0IyKf9ss/HyeuQztD
	PjrPXf46j+XDfUAWP6OkAcrm6zjmGPu/u6SSIvOVro7Jts/m9ddRiG/7eoN+axkbsJ5FfsYCEs1Kf
	iJGU50B1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJGWL-00035y-43; Fri, 18 Sep 2020 13:33:49 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJGWI-00033u-92; Fri, 18 Sep 2020 13:33:47 +0000
Received: by mail-il1-x141.google.com with SMTP id a8so6251830ilk.1;
 Fri, 18 Sep 2020 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vHP6a/n1DUHQQL99sdaOgDDLN4fD6Mu08+md9guUmtw=;
 b=JAHVq72phYgsTz7+cCz2K98bwVoT3voMNXxrRvYlKds4E2Tcwdic91D/30M3J8KHaM
 HnnjFuvQEB0yHzEx/+o1bOBU06cjVuNivsU3zCGkB0dLwyvZ3GRpdMpC4QuS7aFMIC+x
 oOJ6l2yRi3794WPpPUrCpcyqcpH/rQ7qDu9tKB/ADiCp0eguh3XjoX3ebrqNcGRRpXGU
 v6bcRj2GhLbxfvcPcDMbzsHnOlu9IGabU5vGcCXLMOdXMEa40kyhFbI8+AQ+15pFNCUY
 QqaESEET6BaX3HH9e1DhRzYgb733Uj+aRTGX/Vf34sTEHtPKJqHhyb/fCvOiBiYgaU/c
 y20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vHP6a/n1DUHQQL99sdaOgDDLN4fD6Mu08+md9guUmtw=;
 b=JRBGLKyDjfGvwQgehYGpn/6R0g/8kKNONC74rH/qPusX0rhaw3dpJzQilPouVLjeah
 FHxbpvqMwIBTu0mJdb6FfPkBrtiQAKwx2BbSBGLi1TKEvJFF1tyEPnLI/q+tiamBpHnf
 F/g37+eClkwjzjseN6IjXEQHXFxha0HaS6HD1/wZ2Do1ktRd/mUtZvYSPFW5IraWAmkF
 B1uh74LXfjUkmKNcyq767D/Mnz5EzHvRiB7BLnv/BJyD1PnQ7SdO+mk1G6UYLBuKUA+1
 w5mBOLKcg+De4PKy+X8N8TzIQIG0MghttaJanLil+mub6r3I0qI/7dI5SBYzRPgO3IUl
 +HSw==
X-Gm-Message-State: AOAM533Skh1761jdmc5ZQ+BH3EE3bDv8b8OHAbSUNZ0VYrhziALCCqj2
 fsWOK7D1sZNnmDbqa0jt4pn4wUVo9AJKH8Jq+nE=
X-Google-Smtp-Source: ABdhPJz0qCBmtrO5zOnB3h0Skn1hRjcb6T2inQdpc5g/md9N8CbDjqyk4Bo7jWnekfjpoPmERo9MJNhIILGUXPyk2vM=
X-Received: by 2002:a92:c10c:: with SMTP id p12mr4688358ile.274.1600436024267; 
 Fri, 18 Sep 2020 06:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.2.I3de2918f09b817cc2ae6d324f1ece62779ecc7cf@changeid>
 <CAJsYDV+Um3aEsgW-829BsZSaiVCp3O2LkrTmgCthhFv4fuEnLg@mail.gmail.com>
In-Reply-To: <CAJsYDV+Um3aEsgW-829BsZSaiVCp3O2LkrTmgCthhFv4fuEnLg@mail.gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 18 Sep 2020 21:33:33 +0800
Message-ID: <CAJsYDVLcNZ6kyRnZS8zcsC7R_XTZgSVqwqR+SNmNB-rbWrF=CQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] spi: spi-mtk-nor: fix mishandled logics in
 checking SPI memory operation
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_093346_319952_435BF3C2 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Fri, Sep 18, 2020 at 9:09 PM Chuanhong Guo <gch981213@gmail.com> wrote:
> On Fri, Sep 18, 2020 at 4:34 PM Ikjoon Jang <ikjn@chromium.org> wrote:
> > [...]
> > +               switch (op->data.dir) {
> > +               case SPI_MEM_DATA_IN:
> > +                       if (!mtk_nor_match_read(op))
> > +                               return -EINVAL;
>
> You are changing the code logic here.
> mtk_nor_match_read checks if the operation can be executed
> using controller PIO/DMA reading. Even if it's not supported,
> we can still use PRG mode to execute the operation.
> One example of such an operation is SPI NOR SFDP reading.
> Your change breaks that which then breaks 1_2_2 and 1_4_4
> reading capability because spi-nor driver parses these op formats
> from SFDP table.

I just noticed that you already broke this in:
spi: spi-mtk-nor: support standard spi properties
Please also fix the same logic in mtk_nor_supports_op in your v3.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
