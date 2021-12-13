Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Dec 2021 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWAIAPkbU+qbMRNU4Hb4/8dIZTpUcbHi1mExzlKteKo=; b=VFWw+yH0KchMF0
	i2GBLiu4eHaFE275tD9d4geU5awUDphUnuuT2KZnsL3jAyMFVmuUS756raXJvtWcWhyh5nWZ2BAWi
	jxtuyLpEOt5nrHn4MC5oh3IftZx7uzuODgWYk8Gd6DmmzO6Owao03IR4jS63ObEir5+EwkYHRGe6j
	T84R/UgPveymyZMl5kOon+5M4tsi/eg9WU0Zh6ODJdMdHqXfThdfXFnOd2uPPGPGRBIqdZ26LZJLg
	/e1fO2mGjbElpQne85Mn0UAdz3ZDYhJ0IOzZF4HPQwInIxulQ/fPLFl+lkq6KprVoWNPS5f+Oqmh8
	lgcLukW6l58LjSDgumsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwnd9-00ASCA-6f; Mon, 13 Dec 2021 15:52:47 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwnd3-00ASAg-Df
 for linux-mtd@lists.infradead.org; Mon, 13 Dec 2021 15:52:45 +0000
Received: by mail-io1-xd2c.google.com with SMTP id m9so19083143iop.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2021 07:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CjOK7zG4lmsI/zp9Y5fQMp7GBNGBJj/NStUfv3M1YVc=;
 b=dwo2lL/xcAhMSZxaD4BKaEmuczKzyAZqbBJYR+yDjtagIiQtaf/vB7gm48RoLcI/rI
 VW1aBzFKjdGInllx2a4i4+Q40oYWfUOP+nlyVlKK0r+iGPJiWlNLyZ45eKchDZ9b2p1U
 QhpZq7jCAqDY/M6pXX7CuP/c1coiEAJx2yDnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CjOK7zG4lmsI/zp9Y5fQMp7GBNGBJj/NStUfv3M1YVc=;
 b=69hZuDe1EU0NVbpjX/nzDvMrEVPOGe+rB31II9gzBPlQKaXuZnpknHVOq49iSgk8iz
 3mLdlqPd6u3kyg3PA1HY8pNdnhhDYMr3zltWpaQWODN19LctmLB4YKpRkMCfAnhqYAHN
 gkaQexkNEnCLAzb1hCow8S4hDCas2qTCPbeUBzVMKYjiHyDAUiR6TPJ7Ks11+AjdlNgg
 79KVS2PCm+LNHMZJ/r541DV+RpBvx2nBxABW8+khw0aB3/UOc6a2E8+GYTlewpYS5TmT
 +rlAtq+4nceOQcgpa39r9/NleHEMn0PEsslc1WmwLkO1H+G9BtvUCUaw/yf1ZIQl3f1O
 YBLA==
X-Gm-Message-State: AOAM532EJE/Np200Co2wsRwN6T40Ygl/25pf+twDcC+rzyx9Om9qfk0W
 TMzP+KaF2xfYvWCMhZuoYnu233BCqXVMjA==
X-Google-Smtp-Source: ABdhPJzMDs7mFq1J/ojNEr7+L9LhHAj093RufLaem4uHpfxUZhxbtVYyabisWC2pbKrhe3TouS6EfA==
X-Received: by 2002:a05:6638:4113:: with SMTP id
 ay19mr34782162jab.149.1639410759189; 
 Mon, 13 Dec 2021 07:52:39 -0800 (PST)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com.
 [209.85.166.180])
 by smtp.gmail.com with ESMTPSA id a12sm8762066iow.6.2021.12.13.07.52.37
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 07:52:38 -0800 (PST)
Received: by mail-il1-f180.google.com with SMTP id v13so2093333ilm.8
 for <linux-mtd@lists.infradead.org>; Mon, 13 Dec 2021 07:52:37 -0800 (PST)
X-Received: by 2002:a92:cdaa:: with SMTP id g10mr31230629ild.142.1639410757022; 
 Mon, 13 Dec 2021 07:52:37 -0800 (PST)
MIME-Version: 1.0
References: <1638427092-9139-1-git-send-email-quic_c_sbhanu@quicinc.com>
In-Reply-To: <1638427092-9139-1-git-send-email-quic_c_sbhanu@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Dec 2021 07:52:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VB6hsEHEb8yZmB=xA__47p4vC6dBc528RV37dvAKTgOQ@mail.gmail.com>
Message-ID: <CAD=FV=VB6hsEHEb8yZmB=xA__47p4vC6dBc528RV37dvAKTgOQ@mail.gmail.com>
Subject: Re: [PATCH V2] mtd: spi-nor: winbond: Add support for winbond chip
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stummala@codeaurora.org, vbadigan@codeaurora.org, quic_rampraka@quicinc.com, 
 quic_pragalla@quicinc.com, sartgarg@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_075241_498796_F0006287 
X-CRM114-Status: GOOD (  18.46  )
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

Hi,

On Wed, Dec 1, 2021 at 10:38 PM Shaik Sajida Bhanu
<quic_c_sbhanu@quicinc.com> wrote:
>
> Add support for winbond W25Q512NW-IM chip.
>
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> ---
> Changes since V1:
>         Added space before name of the flash part as suggested by Doug.

When someone comments on V1, it's nice to CC them on V2. ;-)

> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 96573f6..44f19f2 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +       { "w25q512nw", INFO(0xef8020, 0, 64 * 1024, 1024,
> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },

I had a quick look. Though I'm no expert on this driver, I believe
that the name should be "w25q512nwm", not "w25q512nw" (you need an "m"
at the end). Evidence:

The Winbond doc [1] shows:

W25Q512NW-IM is 0xef8020
W25Q512NW-IQ/IN is 0xef6020

Comparing to a different datasheet [2], I see that:

W25Q256JW-IM is 0xef8019
W25Q256JW is 0xef6019

Since "W25Q256JW-IM" is in code as "w25q256jwm" it implies to me that
for the "-IM" suffix you just add a "m" to the end of the name.

[1] https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf
[2] https://www.winbond.com/resource-files/W25Q256JW%20SPI%20RevJ%2003102021%20Plus.pdf

After changing the name, feel free to add my Reviewed-by (and please
CC me on v3).

-Doug

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
