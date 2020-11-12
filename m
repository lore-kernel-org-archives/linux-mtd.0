Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F18DC2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 11:53:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAAD221FE
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 11:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p4WUJ77P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAAD221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/XhI9FgRnMOTKnA1I5VIqB/XLFXHwuyWBX7R+wPclyU=; b=p4WUJ77PcpaVtpH8VRyk7kK1C
	KFwNMnoMZuFcIeBb8nxQkK7qM6oOh8A1D7RQE+RV5I3V0nk/HCCyLXtGwjmAc4XEw+Ej2a6amNyfu
	iufmgOMTG22OaX68Dbwv5piYoebzvB2WBVGhUcEuiQ+iTjURamGlx0xoscJN3ntdEfWs0Lu/Rb6Vn
	xzB2C3vXdozC4KpNxZTzelWPZfWi15xa5wqOjF+U1LVegDdf2qjLQrB95Ibd9A6uAmzMkG/aLWl4o
	L470i7snfHKFaNefIJCo6gidjhczyV+3/nNn9wbNCfYpNsbSyhhEG3kyiNVB+CY0E3GICV2Cx87JQ
	fxbjIzQ3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdB9a-0007Mn-Up; Thu, 12 Nov 2020 11:52:41 +0000
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdB9W-0007JB-6D
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 11:52:35 +0000
Received: by mail-lj1-f195.google.com with SMTP id i17so4703348ljd.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2020 03:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xeIxKSXAFIucEStiMPJy2kOgKe0FiyFd2v0/6ZVQ1QU=;
 b=Ni58TTdWJm8+Qlxy4Tz3NR9Hz0vNM6SfPTSdaU1/XtC12PeCJ5VE02/NspZgxgwi4a
 jQe2j7r3IlQDxSN4+ADeD4E5OI4nRKctfTjn8Dm8/movO+mA9h9QwpRUqItjkt8V69v9
 MSc76LNNs86GOkeUd6OQxjV/5yH6HKVi3o5MBds7qa7sGs1+9RjoZevl6XGW9IGsaKLR
 H8vDVLIzsSYdoJ8K2NYpjL/Ylk1fQi/O0OQDMLdFHj6EJ8DzxKrLrU7lCvHwX0UWuVp+
 RmHobAhWcPkhxxkHHtt/wIcmc7lh7vTpv2tziBrZ7IVP5aivz70kCP8roWvAM01NApQJ
 f0UQ==
X-Gm-Message-State: AOAM533cKQfJbVG9FJRXZbGDMez9cQ9T8bsOH7HudQG5RtpsFSHtZCi+
 AVnw6MyRatabcBsRESIfg5g1xSnTlYnYrg==
X-Google-Smtp-Source: ABdhPJz2JrCsYh2oYZpgmxe5yf0TnTF0/l60brzVjYjvvDxZUoKB37vY8n3kEL+bL26GZpFZUqRrFA==
X-Received: by 2002:a2e:9797:: with SMTP id y23mr11454876lji.208.1605181947890; 
 Thu, 12 Nov 2020 03:52:27 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47])
 by smtp.gmail.com with ESMTPSA id a30sm518292ljd.91.2020.11.12.03.52.27
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 03:52:27 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id u19so1714768lfr.7
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2020 03:52:27 -0800 (PST)
X-Received: by 2002:a19:e04:: with SMTP id 4mr2783488lfo.193.1605181947272;
 Thu, 12 Nov 2020 03:52:27 -0800 (PST)
MIME-Version: 1.0
References: <20201106213655.1838861-1-lee.jones@linaro.org>
 <20201106213655.1838861-21-lee.jones@linaro.org>
In-Reply-To: <20201106213655.1838861-21-lee.jones@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 12 Nov 2020 19:52:14 +0800
X-Gmail-Original-Message-ID: <CAGb2v66qjLmQEAQdNqpx6HZ2A6O=BqygAn2uepFXUYM0ArZV8A@mail.gmail.com>
Message-ID: <CAGb2v66qjLmQEAQdNqpx6HZ2A6O=BqygAn2uepFXUYM0ArZV8A@mail.gmail.com>
Subject: Re: [PATCH v2 20/23] mtd: nand: raw: sunxi_nand: Document
 'sunxi_nfc's 'caps' member
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_065234_437181_8EDDAA05 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Sergey Lapin <slapin@ossfans.org>, Dmitriy B <rzk333@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, linux-mtd@lists.infradead.org,
 Qiang Yu <yuq825@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Nov 7, 2020 at 5:37 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/mtd/nand/raw/sunxi_nand.c:250: warning: Function parameter or member 'caps' not described in 'sunxi_nfc'
>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Boris BREZILLON <b.brezillon.dev@gmail.com>
> Cc: Qiang Yu <yuq825@gmail.com>
> Cc: Dmitriy B <rzk333@gmail.com>
> Cc: Sergey Lapin <slapin@ossfans.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

FWIW,

Acked-by: Chen-Yu Tsai <wens@csie.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
