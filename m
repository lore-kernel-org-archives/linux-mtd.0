Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EF8C352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 06:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0AFF206D7
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 06:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDc3cF60";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0PIYJaW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0AFF206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akua7Wu5HRRg3mpWgsLVcQCUlOo+wzENlXCXCRy5QSg=; b=YDc3cF60K75ylO
	vCZT9Sv9IDU2HE1iOk8cRTt4ewPLqJ7RMCIEO9utZ1QGE0S2W9mpJqtokrqer5bUc+NUvsNUHC0qv
	84XA6+/EjT+dL0vJ3i36gpzMGUwSqC+kWC3uqTr9E6wYEJ/HaqVsRy/DA4TJkrfDUmjDJnFHkqTV+
	kzpaIzU6h1R0GMQJVjci1NxxO5Uc8yUmQn9BGMMvjqzmULrF7ma/ToHPUE27iQO16bKIKDh2/AkZK
	9pF0PwrFQov8tiQgmvmqgbV2gsntY87Cb20fCsQM91lXy0cKALe8idMRf4jys6TOT9C+YyERjJtWh
	YMcUCVL5KIqaPlfjG+5Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1PSG-0006wI-FT; Tue, 11 Feb 2020 06:55:32 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1PSD-0006vM-OS; Tue, 11 Feb 2020 06:55:31 +0000
Received: by mail-ot1-x341.google.com with SMTP id i6so9046730otr.7;
 Mon, 10 Feb 2020 22:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0qsBaYW+8tB375NH6OQOHYpSP00PTX/24760IzgBPWM=;
 b=g0PIYJaWAWx7ZYpbMTj/h5I8yC9Of7h+6G71MOTcoKwG1sXqIRCtHnj2A1Bog8F0D6
 gRegnL9DOFPHP3NfmRiQphE7IsOBTlUM31AvacH3fpoDnqGnK2q8LqWAH2RR0/Q/7WzI
 duP1KOPfAuTlULiUAgHq6CLpSbUiTV1SO95ePO4rsRoWpQ0JplY3NS7yClKK7Cu6bwl8
 pVzpg5r5EZTiEqSZ4ZQxHUcDTdJ4FA67PpBHgKvI1GDq69mKuFWRGxvx3K0fTf7J98+/
 IQsiov/bIeai8YzlLGeROG8O9fZ7Fq2Ld7LVDxIjP47KB+IR1/ZBFkCo7JBoQGKe+ew2
 yJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qsBaYW+8tB375NH6OQOHYpSP00PTX/24760IzgBPWM=;
 b=ozuFOpcQxxdygaA26FlxINeXH9z+4YmWPcpz2eAwAC8pt6R9NlMgjEJHrEaNDaJK2p
 mWsPSOxrxl8qDpaRYndk7MkAScfsn8eSwnE5tQ06GD0qewqMxMacccJ9tGaWzwGXK6hX
 xseVIL15wQlHJjoyHzjX4AUs6spbSJYqtNp7aagwHCAjjwZZxTPlzYW1AfgJCT7RaPa2
 8hRHj7SkqPianDGidcyGOl5CI9LzgP0pWBvQ1mSsZ0h01a3iYRxZsPZX6KtWuJaaJsyJ
 FwyZVK/UefomgzEZtYbzw24MFE+UHJ/f8BJB3ADl0glJkUGdjclrEL6o4VZMbX0gKsjj
 lBPA==
X-Gm-Message-State: APjAAAXLeP8RuBcrkXLUqxZ+qEHPFT9/cH5gjpWYOZwZ490Y03yTmBXG
 WPBComKekDmASg1B2V6xbF6eJxgncHHfdeYPe3A=
X-Google-Smtp-Source: APXvYqxfpeNlSBi1DWWxelEmsr9hbXLc0MmgqyHPY0wwLkSBHpl+jlRuYrJEeQNRvkKIlN3ori5EnDnw9W4L7XWKMI0=
X-Received: by 2002:a9d:3e43:: with SMTP id h3mr3925618otg.84.1581404128257;
 Mon, 10 Feb 2020 22:55:28 -0800 (PST)
MIME-Version: 1.0
References: <20200208084022.193231-1-gch981213@gmail.com>
 <1581323455.2213.6.camel@mtksdaap41>
In-Reply-To: <1581323455.2213.6.camel@mtksdaap41>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 11 Feb 2020 14:55:17 +0800
Message-ID: <CAJsYDVLzwWfT24NGDJMJShwoG0Qrq06mLqamHbH0xedmMLdrAQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: mtk-quadspi: add support for DMA reading
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_225529_823151_9A9FFD2F 
X-CRM114-Status: GOOD (  13.79  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Mon, Feb 10, 2020 at 4:31 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> > DMA busy checking is implemented with readl_poll_timeout because
> > I don't have access to IRQ-related docs. The speed increment comes
> > from those saved cmd+addr+dummy clocks.
>
> Hi Chuanhong,
>
> Thanks for your patch, I'm checking with Guochun to see if we could
> release IRQ related information to you.

Thanks for the info.
I'd like to keep using polling mode in this patch for easier reviewing.
It's already a pretty lengthy patch now. I may implement IRQ support
in future patches.

>
> > This controller requires that DMA source/destination address and
> > reading length should be 16-byte aligned. We use a bounce buffer if
> > one of them is not aligned, read more than what we need, and copy
> > data from corresponding buffer offset.
>
> I've checked with our HW guys. The limitation is on DRAM only.
> So for read we should check buffer and length to make sure it is
> aligned, but don't need to check from.

My previous test on mt7629 shows that from address also needs to
be aligned. e.g. If I perform a DMA read from 0x2 I actually got data
starting from 0x0 instead.

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
