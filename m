Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E268C11D3D
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:40:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01D1E2469F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 16:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRqrPe1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01D1E2469F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WG+OxwN1iRIGWPHAxTHWFzNZqwlawbQ+XbaaeqMKAE=; b=QRqrPe1nQdIn3R
	mDU5csGeZ0LqA3PtCtB8Kezb9dl1pJ4o+R3uKZLMe1YvQ5xDrqyz5CJPOeNzPjURmM1bzhnAft5g2
	ZJ/8M2zMkkYqBimKtxiu3/chh2Z/N5xFYlZ8/ljAN15xKzoi+exAo5ZibIu9dV08tXLU6qnnYvmq6
	exgTAaAD5bFXK8GcoK2tb0ag7ooj8zGa0LBdBmSy+BrilpG/pUJ6MOLm8K2m3bPpqklwqzHmE4AAF
	BjB/Jgq12Qptd2b6OANieOgHTtJTjF/2ZDcCH99ksFN51GjpnELmxU6cvs2PhShsqVJoTQ4PkJOGU
	NUV1zx1JrS9jZkFW+8Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7MDO-00050W-7R; Thu, 27 Feb 2020 16:40:46 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7MDL-00050A-GT
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 16:40:44 +0000
Received: by mail-oi1-f194.google.com with SMTP id i1so3914987oie.8
 for <linux-mtd@lists.infradead.org>; Thu, 27 Feb 2020 08:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCYsGMCW0SwZkIyBJuFeCwKSJseDitgI487QueGROLA=;
 b=nYCXIbUE6VWknDM6APHop7DS1FuKrPd51jkWmcmKm2nHlRo0ghDdr2H8JtBNUj0yEm
 akx7T0pNt6WqwAOqPsJbsbhAXtWiJPeFkWw5+ybzksH0eo+nnhO3dIkyfG4POsJvXyDW
 eumrfWXOnLDg1bJ3KO8sqr3C2vwYNSagIpw5SdKfjYrn0Fljs1FFeOmvwzDmujW4b79Q
 pQgYPNx9cOqWdbly/7GjuZ8giFg9DD3krJWtBBijSmmco8GcbC8R/nqu9E4AMlk+8+sB
 JrjhTADPpvzeAvmoJfeGQYkp4sz79FuPM1n6ZMXpD+luTGhyMKYFd0+r2RbLf+9XrYBv
 A/WQ==
X-Gm-Message-State: APjAAAXU8ruIkHWe3p9FBUTQiyuG5eMnquTO9pEnHj8Qs6P0i1MJ9tq4
 BhTS5FJip6GoVo956P7KAumYzEp3rSo8UBRuHVo=
X-Google-Smtp-Source: APXvYqxi2lBXElKfDVk3UZlxPINmCFgsVAPQF8DUTRsAPVQr2KdIUt1ieiiCMdPs4JqAaaMjFiUborT+0iUnPUYglQs=
X-Received: by 2002:aca:b4c3:: with SMTP id d186mr3967588oif.131.1582821642630; 
 Thu, 27 Feb 2020 08:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20200226093703.19765-1-p.yadav@ti.com>
 <20200226093703.19765-2-p.yadav@ti.com>
 <20200227171147.32cc6fcf@collabora.com> <20200227162842.GE4062@sirena.org.uk>
In-Reply-To: <20200227162842.GE4062@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2020 17:40:31 +0100
Message-ID: <CAMuHMdWMCDzQm0tjpybJZyHy4imbC9NqRXP5d4C0xgxQx-Pf8g@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: spi: allow expressing DTR capability
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_084043_548379_46A3D5F5 
X-CRM114-Status: GOOD (  12.84  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi <linux-spi@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Thu, Feb 27, 2020 at 5:28 PM Mark Brown <broonie@kernel.org> wrote:
> On Thu, Feb 27, 2020 at 05:11:47PM +0100, Boris Brezillon wrote:
> > Pratyush Yadav <p.yadav@ti.com> wrote:
>
> > > Allow spi devices to express DTR receive and transmit capabilities via
> > > the properties "spi-rx-dtr" and "spi-tx-dtr".
>
> > Is the RX/TX granularity really useful?
>
> It's what we do for other properties, and if this is anything like the
> other things adding extra wiring you can't assume that the ability to
> use the feature for TX implies RX.

Double Transfer Rate uses the same wire.
But as you sample at both the rising and the falling edges of the clock, this
makes the cpha setting meaningless for such transfers, I think ;-)

However, as the future may bring us QDR, perhaps this should not be a
boolean flag, but an integer value?
Cfr. spi-tx-bus-width vs. the original spi-tx-dual/spi-tx-quad proposal.

What would be a good name (as we only need one)? spi-data-phases?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
