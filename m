Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F4ACC4727E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 09:12:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED8B206B5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 09:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y0EPfiYE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YT92Zyhc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED8B206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TClZoCRnTB9Ns6CKf0LKu50VWI+jXVbxg7qBpt/hwH8=; b=y0EPfiYEmI71hlNVunZfPW326
	wsg/xr02P1nID+zK40TRXlY5+lsIV16aPwxOxOOKgAVhb0KkwfVi22KAIGZ28UJcS9n9lAUrv2ijV
	qCFXrBXHjGhWpxH6hw0nV2siVbXDICUn8sui3gDZWtwX6DgxmpCC+vwOuRHZixjEmbJ2nFV5CBpfJ
	wBTkCcZ7W+IAqTq3r894/0efpJXKDv6cgOeqNHKBfAwn6TE8G1uDzU3+8xqBz9fg6p9bkidT5oO21
	p2BlOqeUFVhQSv+vumlhWonFYjlJ+4Pww/GGJ7S0MHh1nbe4X1FtCyPG7OlHwT70QSC5/R1sgdLxU
	K/fVHLBHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjlI-0000xH-FD; Fri, 25 Sep 2020 09:11:28 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjlD-0000v4-8a
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 09:11:24 +0000
Received: by mail-vk1-xa44.google.com with SMTP id r78so468415vke.11
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aWJwSkHcQYbNKOEWZ1TVdIJh2rPz2r71PSLyhlvFLUY=;
 b=YT92ZyhcCSVct41NNQJ5H+v81DH6N1/Fnpgnd2suwGKDa9o/WkzKzVBD0cv5tjXW6b
 gbauj156FnyzRcly7lGjMDF7C0FMl0mpSP3FK8ozUizc2poL7h3CF7JkfkaP7r/3cYJJ
 2/2HcNxFG/PN129V+7xqesUxl9evRU8A24jS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aWJwSkHcQYbNKOEWZ1TVdIJh2rPz2r71PSLyhlvFLUY=;
 b=fdP6WksRgzksXLCLYu+msPIpkHLXN2XQO3iU5Mx7al9cttC0CdNfzwJnJW4WCZ4qTM
 PUSyCmES4X86/BV79QuoYWY29Yglrr8Sjjt8iTQwiItIIiRgrAOu5S7/w3Gz1xVNEqMs
 NhDubfnM4G3ssCgQjhTa8DyoCM+4J7W2ze2zAaXNwI/yznqydueiHnrayMzQsFasxHGn
 M/Abefz06CEc2vAqSgOalmOpjdlo9kh8ieYhP6NwPQMNuwnmKKjqezRQS1vOoI3WK3lt
 ASzfeeFK8EnUl71EJ6nPYofabUKPw3b2OeVSo0dqsNhf0h2vnYcTognRGlcxcCnE6g4J
 DnqQ==
X-Gm-Message-State: AOAM533e8okGrFQ+wsC4JivtZ6pYSicALh2603vBLFJGmlLvn9YTWt0E
 P8c13Yj2QvhYYnhc7aTu7vX255bIkktPxcyrMNFQFQ==
X-Google-Smtp-Source: ABdhPJxuiIE50tiO0iM0XKiceVHkTJpArQPlcp7pIYzNrV16sQaJzDwMqt8DYhjynnNrl2S33JiyhZ3ih3qhCGU0LVU=
X-Received: by 2002:a1f:434b:: with SMTP id q72mr1948481vka.5.1601025081001;
 Fri, 25 Sep 2020 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
 <CAJsYDV+EifAeMKEGwi0oH6A5EvPN8tMZQ+oqY5JGe=+kqzjMLw@mail.gmail.com>
In-Reply-To: <CAJsYDV+EifAeMKEGwi0oH6A5EvPN8tMZQ+oqY5JGe=+kqzjMLw@mail.gmail.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 25 Sep 2020 17:11:10 +0800
Message-ID: <CAATdQgC7GQ5fhkFBg7y6fpzdbFAiv+3ONdnk+jLytumB7a9pXQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] spi: spi-mtk-nor: support 36bit dma addressing
To: Chuanhong Guo <gch981213@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_051123_340615_60769841 
X-CRM114-Status: GOOD (  13.63  )
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

On Fri, Sep 25, 2020 at 4:27 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>

[snip]

> > +       if (sp->high_dma) {
> > +               writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
> > +               writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
> > +       }
>
> I remembered kbuild test robot reported a warning on this on 32-bit platforms
> in your v1. [0]
> I don't know what's the fix for this though :(
>
> [0] https://marc.info/?l=linux-spi&m=159982425706940&w=2

yeah, I'm not sure how to handle this properly,

"warning: shift count >= width of type",
(sp->high_dma) is always false on 32bit arm kernel.
I think adding size check on here is unnecessary, should I fix for this warning?

> --
> Regards,
> Chuanhong Guo

Sorry for resending, Chuanhong.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
