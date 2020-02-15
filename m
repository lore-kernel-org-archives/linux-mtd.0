Return-Path: <SRS0=hSdi=4D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD61C352A3
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2020 07:06:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E23020718
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Feb 2020 07:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BKlwr4Qs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eO1+UJHm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E23020718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIQWtqLQAqJUsYNK0BDTZodnDSzLQDKnYX+t8w1ocvs=; b=BKlwr4QsdQhcV4
	1PFdDtIf8PfI8QQAce5JgEogu22UV7G3XhCnxFeTCDaKgAw4f4gfUn6ituEJOLE/tO6wmnHJUTjpn
	04PD4PPeGpCF2+1FkO96ae4IEyEZDSZvzMZyoMARLFxNMpuhzHKb2N38Ww0mLbFchKt+zqGiBc59s
	IARaMpdABh1DSVf24knb0Ae50nh0ocP29ztGgUqdQW3opXG9HZku092Z2sRBlTloxX1/+i31th3hy
	li8qtCExAZDXlyKxKxHXjEFonqR9rPzkRhG5NAcQG19y0mnopYYD227cCci4RIyhVACIz4oxIiarO
	N+srEcQASQgxijBrTj4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2rWv-0000lR-1E; Sat, 15 Feb 2020 07:06:21 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2rWs-0000kw-6b; Sat, 15 Feb 2020 07:06:20 +0000
Received: by mail-oi1-x241.google.com with SMTP id a142so11779655oii.7;
 Fri, 14 Feb 2020 23:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N39DpKb1zbYGk+aZJAg5ol/qxHEEKsb4pngbw2grk9s=;
 b=eO1+UJHmEcsV312SYhyJA6ak1KgsL1IbKBC7k9lGGUS0lBeBXhmo3YzawaHWqAWyZ8
 lo8ZMI9LO1z5FQyujtSwxlkfO6OhBVAupZvzFT8DkFENJZSpAH3NQqSGkd0vNsxLJ0si
 fR6kzV4L18SUTUbIeA9ftt2ou9EIFAQQhpX3CR3HY1kp0iOHGYH2ZoZeCvmS2BRDAv9/
 fJrD/Twt6Odo36Y1Vq08UPJGR1yXvwX5MJsS5PupJ+7aCl/TwrT7ndyuPtrqNjADNJBS
 +yWBrd23XHbuOYXxdzD23HQBmSagx3bIq1jvzbO7lOmD4YkQ/TcJs5RYE7SkqJxUVdug
 kQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N39DpKb1zbYGk+aZJAg5ol/qxHEEKsb4pngbw2grk9s=;
 b=h1xm0zq0+vx2BNWzdWyrYPiKWEeVuNRoxGktAs0ETksIBCoTU9TGPM7eTbhVqC5eBi
 0NIipXarmszfo1tECnffFSQwJ7WDlcxjLCdAAnESSTMbIk65a4P2t9pLHfI6AF0L1+Lv
 9VZDzI+M72GuJOrN6V4cirU7UGcTZMGvz5O26o+Yu6jkSR8Axh3rI3Xx9DPstC9Hm0Yo
 94GijcD4xCm6ZhkqwdF3+I6U/XaWeV+GrXY6jAMSbiE1wl3j66dEKH2ESXXLtytRsC2b
 l8u6TJnOb4i5OveOMCnNxqHqYoLpGoWm01MF0NXBdIsjz8ZprEp0tsI5kibOJKCVwMq5
 /sCw==
X-Gm-Message-State: APjAAAX/CQiHKyY/6DptsX5gIEzvbnxThTOiq2gSwMK6KjduXMdsXP6S
 3m+Mc5V1/wd+Ki9ad5gBkjHbra+LjItSmArPaKp7ODjT5WTXug==
X-Google-Smtp-Source: APXvYqwhjU5dgKNQUhaU81ajtzZqAULg8B7LoPW3kj8BrNcj9xvKsmTDYAJmCamWkh8NnkFhEtNK/Sac+2BzYkL9izs=
X-Received: by 2002:aca:bc0a:: with SMTP id m10mr4335479oif.77.1581750376487; 
 Fri, 14 Feb 2020 23:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20200208084022.193231-1-gch981213@gmail.com>
In-Reply-To: <20200208084022.193231-1-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 15 Feb 2020 15:06:05 +0800
Message-ID: <CAJsYDVJ9JGGpDm-FWvqDsS_ffwQ4FzY_cbVFpnEKt6B_Ab=TMQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: mtk-quadspi: add support for DMA reading
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_230618_268151_D125BFDA 
X-CRM114-Status: GOOD (  10.69  )
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
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all!

On Sat, Feb 8, 2020 at 4:41 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> PIO reading mode on this controller is pretty inefficient
> (one cmd+addr+dummy sequence reads only one byte)
> This patch adds support for reading using DMA mode which increases
> reading speed from 1MB/s to 4MB/s
>
> DMA busy checking is implemented with readl_poll_timeout because
> I don't have access to IRQ-related docs. The speed increment comes
> from those saved cmd+addr+dummy clocks.
>
> This controller requires that DMA source/destination address and
> reading length should be 16-byte aligned. We use a bounce buffer if
> one of them is not aligned, read more than what we need, and copy
> data from corresponding buffer offset.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

This patch is deprecated. I wrote a new spi-mem driver for this
controller:
https://patchwork.ozlabs.org/project/linux-mtd/list/?series=158701
and will be focus on getting that one merged instead.
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
