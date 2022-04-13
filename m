Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEA1C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4pDCrnRAfQiIIVN/rjPX3wqEUOjWaR09iwr+BTP/A8=; b=ZvajSxvyp/kD4z
	25q0TZ/3MJhiP/lFT00jJXDPRwSca1KwKyKj/8AIJgrV9dovaSji0rvbZPNsN1h2+4yTBaeZcH69v
	oRh4L5Lb61PdXLrJ0762biFUFGyxjlYtp+A4i99majdXijoJEuyUjfbQiEuCG3qgYYXd4h10lh+oM
	5aouSLXw0O3tSpBWoxyzipiS/ZYcfJlfgHNkW6wKGApchv0bXXCtHBiBH0Uwodp7KzGu/c8gXthRT
	VpDb67frJDdLw9OdV8Ao61QypAB1uhQKHmLyNeINqw6uUiTa9dtG/D4rUy/+jYN+6HZtvYDW9L2lZ
	PXgOI7V45kho5qXgZ9Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neeKi-001U0A-9n; Wed, 13 Apr 2022 14:51:00 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neeKe-001Tzg-Op
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 14:50:58 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 c24-20020a9d6c98000000b005e6b7c0a8a8so1337426otr.2
 for <linux-mtd@lists.infradead.org>; Wed, 13 Apr 2022 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+NNFF3WYjd8C1QYq4detVhKQK1MffqpGN9VKt8TJvZs=;
 b=By63kXptljWQTyCi/GWdKBpb6G/eWPjK9x+6S4EATkV/dFTtjOxMuSD48XhbDhRbwG
 JrpviCrGwYtMtaDhYdsMiWHPlgyMhpbzli5QgVah2F0HKHZmotoEAfMJ4zlM3CBb2Zqh
 Wrb1s0Ll2Vsfc/Xzb7gRLKWZUA/uUiNvp2iiyUHba0Pz2pcu6Z6PgewIJW7sSINk9w7F
 lpfcyy/QVA+9Y/o5Kb5EBP9NHNvyL5aH2hTFqgDxau/Se+bo9KTATpt+bdb6y82m9chu
 eixTnKsVUniCZLmEOyqqUNGVWS14f1N0CpLT71j9RO6Fb5h2CT4w6c5Gy7585TadB43P
 elSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+NNFF3WYjd8C1QYq4detVhKQK1MffqpGN9VKt8TJvZs=;
 b=gdeaDOYOkyFJ58AQckq0ZD61CSqw2X0rxPlovn7vzIrj/Do9GZpj/KOSp21io13Lxb
 4V8O96ih8EbCdepM1op9StK+W+foX8QDLbpTv7ZWIcN/Or4OTIcLSA1rgQSRJ3N3a51m
 8hDEJhzGU0Gkvet75tolAFe14DIgRxFABfasgyXRlb3jRF/5IEAWTrcp87y0tSk56WFj
 RdTDGJePMprVfdvfKF/xR4HjMZaiX9QmQ+kNyom/MM9fjNZ1xhVMvJFgiyjDG+iogsSd
 v2vqVsjQEdhq5FRhriW5sJhkKl7LWDkXtnDAaxT7h0Kj0SLCEHgJoIwhuy2EHkke/SEX
 s6Pg==
X-Gm-Message-State: AOAM5306VrebgY1YsM9u+Oklzr+goCxa8t3CHw1xlyf3qkCa8b0HQEei
 uFz+w6c+cEb+Hchuh2zX+/fn37png8e486ewVwU=
X-Google-Smtp-Source: ABdhPJyn1dTCnUoWxb5z+Sq3ql5W24Hh52Mp7FwrEfgqZXjfodffCZUMuZevwAXM2BfvpWEVe8b6al5mf2N/CV2U+ic=
X-Received: by 2002:a05:6830:2b0d:b0:5cd:aca2:f3f2 with SMTP id
 l13-20020a0568302b0d00b005cdaca2f3f2mr14990347otv.212.1649861455407; Wed, 13
 Apr 2022 07:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220413083824.247136-1-gch981213@gmail.com>
 <20220413145843.46a3d9b5@xps13>
In-Reply-To: <20220413145843.46a3d9b5@xps13>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 13 Apr 2022 22:50:43 +0800
Message-ID: <CAJsYDV+3J0ipbR+N-xE=DH-WXsjierdHe_pJtKf1Xbt7fdaiWw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spinand: add support for ESMT F50x1G41LB
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, 
 Daniel Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_075056_849210_AA18E63F 
X-CRM114-Status: GOOD (  21.26  )
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

On Wed, Apr 13, 2022 at 8:58 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> [...]
> > This patch is made purely based on datasheet info without testing
> > on any actual chips.
>
> Do you plan to get one of these any time soon?

No. I already have way more spi-nand chips than I possibly
need due to my last GigaDevice submission :)

I need to replace the spi-nand driver for mediatek in OpenWrt
with my recent submission, and this chip is used in one of the
currently supported router. So I made this patch from
datasheet for it.

BTW Rockchip added identical chip support in their u-boot.[0]
I assume they've tested it.

> I am not really confident merging a 100% non-tested driver :)

I can understand that.
I'll roll this patch out in OpenWrt anyway. I can wait for a test
there and resubmit piled downstream patches for chip supports
after next OpenWrt stable release.

>
> [...]
> > +
> > +/* ESMT uses GigaDevice 0xc8 JECDEC ID on some SPI NANDs */
> > +#define SPINAND_MFR_ESMT_C8                  0xc8
>
> What happens if the gigadevice driver probes first?

Their device ID aren't conflicting yet, so nothing will happen
at the moment.

There is a solution for future conflict: Recent SPI-NAND chips
contain a parameter page which has the exact chip vendor
and model. We can do one more detection with the parameter
page content.
Winbond W25N01KV is a 2k+96 SPI-NAND with 4-bit ECC.
It uses the exact same chip id as the current W25N01GV
(2k+64 1-bit ECC). We need to support detection using
parameter page for this crazy decision by Winbond anyway.
I'll try to code something for this with my free time.

My current idea is: We first do a detection based on chip id.
If that failed, try to read the parameter page. If we got a
valid one, match the chip vendor and model string.

Any thoughts?

(BTW this ESMT chip is POWERCHIP PSU1GS20DX
according to the parameter page in their datasheet.
But I can't find a datasheet for this model number.)

>
> > +
> > +#define F50L2G41XA_ECC_STATUS_MASK           GENMASK(6, 4)
> > +#define F50L2G41XA_STATUS_ECC_1_3_BITFLIPS   (1 << 4)
> > +#define F50L2G41XA_STATUS_ECC_4_6_BITFLIPS   (3 << 4)
> > +#define F50L2G41XA_STATUS_ECC_7_8_BITFLIPS   (5 << 4)

Oops. These are left-over defines when I discovered that ESMT 2G/4G
SPI-NANDs are repackaged micron parts and dropped their support
from this file.
A v3 is needed anyway. I'll wait for a test before submitting it.

[0]: https://github.com/rockchip-linux/u-boot/commit/52b0060178285488737854a48ddecd381f8b236e
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
