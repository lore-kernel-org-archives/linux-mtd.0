Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D63AC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 14:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ws464WVCmuL3na9GaestTlRdQQDrw3cgsY888hr1i8=; b=SqF1C60PiPxKe/
	H3RSRHoBgzy6lX3B/WjH4GfWBrEO4I2dWg+3WPQELeyCeqmr2M/1PSpzJ1m8BZdJEHK1W7C9pCc5m
	tnK4xm230b+laZ3k9vysRlCtPeKz8jlToEhYu1xhgZcwX1dwPfZlF8+S4e/HIs9Ku2w0a1hO0if9+
	l6qyR9nMB9zVZvtGOm9dhG9maVnsZZBHBBzUCUT6QnUFjV90TiNVphXLKvp34Zcj0BuXJ1a/klQD4
	cIEGnV0M2jf0Y6M+JOgzCOYAP/OHSCFfPWOalGITEvN4oY41lUX1TW38/auo3kBOj1dNOcCYkU92N
	mH/I+oSVrrj/ZRkfi3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqbQW-008Dwl-J7; Mon, 16 May 2022 14:10:24 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqbQU-008DvF-An
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 14:10:23 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id
 a23-20020a4ad5d7000000b0035ee70da7a9so4075568oot.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3L9ucVaR/Ejc1j0lbTxJ50RjR5DDft1mXnfjZbe8XHI=;
 b=kAT+QhfzSE4Rv08p4UM1CjKAom7zKObZf2OKcy5fXfLNxtuRPYKKwYChwNtwR4Aqce
 YgYMx7SOIRE6dF0bgdXbmewYbRR0B+MoL0E8fCjvpX5MNFsp1hsUY4lGVYuG09gelIGn
 p/U41VzFdduU/yYeT2g6XzrPQHrKxNuQW8eXweG6qYsUCtI9hIzkeTtxXZlnUW7TjQG8
 YLMjUZdJw17HouZps03Qo2ZJeR+UyX/uL+X+zoDH957b0E8IuMax5dazbUcfyb0Nannv
 dR4S2vD9ss7OwjfmzGmG5lxLFgc8yDJOA1X1ij4oZoTSrXnlIFW39tmGV4yUHYHX8PfV
 f8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3L9ucVaR/Ejc1j0lbTxJ50RjR5DDft1mXnfjZbe8XHI=;
 b=Q4ZNc6hK9S3xjhjAKWyh0h4RA2s8lY6SKDVny+pHNcEbgPCopcCFFOechqUDEICyR1
 62eetes6BM7Mz6DaOfSCwoihKrXMMVT5hMRZD8laWfk0xmkyVcAHgiJPYIbpjf7e2TJv
 RiC0rkWdknKRM8dJSQt6LoW8U9HeMRx6ydTXgBnarTyUWORggHwaSnNyF4O37MVo50Df
 r6bq3cv0MoALO4A8xA3JFmjgSxUFRz0f6KshZpvC/LJHig8GzYPKLSkvQ7lkTGjh/Sz0
 UZozykhrkhXnNUx11olJ3rZfT2Xp1pkV2cJueMZRf+YCsPS7pAYXa+CRelepRTCZqCKh
 5O1Q==
X-Gm-Message-State: AOAM531iW0EA3mftiJC3bm4bY95tqOeLqCUaxwiqHqufummRVXgBzbwS
 /XSOk4hgDF/crQlcyn0I7WOBq1G+Uduea7D5+6Q=
X-Google-Smtp-Source: ABdhPJyqMj2s7jfJDLnF/x95jeeMc9LMg+uGl/fQSL/8oDUhl/dYxxYmMXphzX9sA5hJ+jbtT7eycyWH/Ms4xPQo0L8=
X-Received: by 2002:a4a:8c41:0:b0:362:19a7:7529 with SMTP id
 v1-20020a4a8c41000000b0036219a77529mr6055010ooj.38.1652710219915; Mon, 16 May
 2022 07:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220414143426.723168-1-gch981213@gmail.com>
 <20220414143426.723168-2-gch981213@gmail.com>
 <05966ece-65c8-ff7c-cb44-55c4d5a5542e@kontron.de>
In-Reply-To: <05966ece-65c8-ff7c-cb44-55c4d5a5542e@kontron.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 16 May 2022 22:10:08 +0800
Message-ID: <CAJsYDVJ=WRT270mj2jNc+yy0v_XRpyH8N+GOmkNJv1zAh76rDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: spinand: add support for detection with param
 page
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, 
 Daniel Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_071022_420082_5A253253 
X-CRM114-Status: GOOD (  21.01  )
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

On Mon, May 16, 2022 at 3:38 PM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Chuanhong,
>
> Am 14.04.22 um 16:34 schrieb Chuanhong Guo:
> > SPI-NAND detection using chip ID isn't always reliable.
> > Here are two known cases:
> > 1. ESMT uses JEDEC ID from other vendors. This may collapse with future
> >    chips.
> > 2. Winbond W25N01KV uses the exact same JEDEC ID as W25N01GV while
> >    having completely different chip parameters.
>
> I think they share the same first byte of the JEDEC ID, but the second
> byte actually differs and would allow to differentiate between them, right?

No. For the 128M version, all 3 bytes are the same between
W25N01GV and W25N01KV.

>
> I have this patchset [1] that I didn't manage to send upstream yet which
> adds support for the W25N02KV. I added the second ID byte to detect them.
>
> Still your approach using the ONFI data is more flexible of course and
> probably a better way to handle this. I will see if I can find some time
> to add support for the W25N02KV based on your patches.

Don't do that. I abandoned this patchset because I later found that
some early W25N01GV doesn't contain a parameter page at all,
which means detecting W25N01GV/KV using only the parameter
page is unreliable.
I think what Boris proposed earlier in v1 (use parameter page
just to distinguish the two chips) is the correct way to go.

BTW I was making this patchset for a potential future ID conflict
between ESMT and GigaDevice, and I don't actually need to
deal with the W25N01GV/KV nonsense now, so I don't have a
plan for send a new version of this atm.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
