Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2610C43464
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 06:55:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DA99207BC
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 06:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tvHjWD6M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YBxfWLO9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DA99207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aLqGipkwDWMhEROEh0EccLoEJGm/y9CZ/IwhhVp6mww=; b=tvHjWD6MNF3x37vAQuzIOgYJz
	X4mVUXKooz/kyLfHw9MKeCxHL4TzdgXmLFXlvTqUvuYu35GjZ1kRyGmQqcFl2oNCp0tIqvl2KGqPe
	liDIHhyr++PtJd9NLzsC5tdh/lKqA1yTwImvLgwEI4iS+9ZaoqJYmIYRkctJx1C2uxlOrtBIupfdk
	eVJXy3k5kK8eU54H6Op76lThLTGVOgWKWEUZ2090jzf0epCSRGqA9pDWkBN1LNxK40PaIvX9FQ6dR
	dIYKhESL9oigCu7f6s7fNCL88uY7ZJcKep5INbphuehYOaGU3yevIYRDdLbcj0t6fKuLzRmAotCBJ
	AVQgRnb3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFiq-00034b-TV; Mon, 21 Sep 2020 06:54:48 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFin-000331-Fw
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 06:54:46 +0000
Received: by mail-vs1-xe44.google.com with SMTP id 5so7481132vsu.5
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mtQqkf0DOg7SDhcAIXUbdE0JhrrbIB/Y7A8QqESS0bc=;
 b=YBxfWLO9xyiBxANQCD7TGEWzgQnCUtV/3967x5NsoR9xd+xMaC5dtXLtLl5dA9JR4e
 HrNSMTXNiwdIR1l1WPg3Z6LYpMdLk1dnXRJvSEBcnilzj696HtkRuH35V8kl6cD9xoMV
 IWBWYH69TRpKUnGsnuBl8MCPPLhODstYnLtqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mtQqkf0DOg7SDhcAIXUbdE0JhrrbIB/Y7A8QqESS0bc=;
 b=qSa7iuYDIUxouxmqOUNip/gRLL6p/pCbpG7g52w4lACoz2XGN6YdL/OcAtENcapyjE
 twJaMmaRrSRT6+AEYrEyp/At6mb1dghqzZeVjxxUePIzfeNE5QKyzSyMapWREjkR/oVu
 oUXAjb1wWCxTiUY0j3lh1IHa3q8jc3JH2WsOr38F1wPooYzT1nd25OVTzQQPiC1pzr6b
 KBUAwoP0DtJm6OQmBq3eKO09MzTvHgnUZ/one9cgwAt6BWjT5eN+5rIPaO9EV6OHev20
 VRGZYxzv5aGiXWFz0oorsdZTl8UUTbTGBYmWMKPisckzehi1iGL5Cugki7NmJ5KrC4KK
 o38w==
X-Gm-Message-State: AOAM532AOTRnR5j7w4l3dJWanKbsrQHVuXN8vLo4dQOLA8NzyAC3YCYh
 dr7E536dkxOXOmKwzrrTiILUSUruW2/UDYFZqzlezA==
X-Google-Smtp-Source: ABdhPJxJMZSII0e7AryQCVgZiyLLcBbUBiHsQPI0JYgGmO2/Nidf+iXorrmdf5Tda6KXV0TQQMPb75c5vYVzyh7WnqA=
X-Received: by 2002:a67:db87:: with SMTP id f7mr17600470vsk.31.1600671283955; 
 Sun, 20 Sep 2020 23:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200918083124.3921207-1-ikjn@chromium.org>
 <20200918162834.v2.4.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
 <1600529204.7002.0.camel@mtksdaap41>
In-Reply-To: <1600529204.7002.0.camel@mtksdaap41>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Mon, 21 Sep 2020 14:54:32 +0800
Message-ID: <CAATdQgBOdEAFvsf-mukzmU0Z9MevMzPvtnuX2mJjLGU9VivDUQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] spi: spi-mtk-nor: support 36bit dma addressing to
 mediatek
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_025445_572369_93C8AD5C 
X-CRM114-Status: GOOD (  12.67  )
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

On Sat, Sep 19, 2020 at 11:26 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> On Fri, 2020-09-18 at 16:31 +0800, Ikjoon Jang wrote:
> > This patch enables 36bit dma address support to spi-mtk-nor.
> > Currently 36bit dma addressing is enabled only for mt8192-nor.
[snip]
>
> Do we need to set sp->high_dma when we have >32bits DMA?
>

Yes, to do so, you need to add new compatible strings if there are
more SoCs support >32bit other than mt8192
or just ust mt8192-nor for binding.

> Joe.C

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
