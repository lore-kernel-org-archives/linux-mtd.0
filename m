Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79287C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 21:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xbGT0JBfNe2ZDC21WAMurfq4UYq+DjsJtxIwG8VrF8=; b=OSxe7jx/sKWmYd
	v/oplZ+3+RKWoHURf4REVOtt7SC8qqtsrf1jKP7/4ACqyYq7CZh7jMZGDmlCAuOPZkJhVfT0wtmgU
	9pbXxvw3gRwstnBmlE+ZTGevWiVOZcPjW8lntenZFvP6gbV+yAuC850xAwU2nEScoUIGJsi+vOH1y
	4oB3g65rhrRI6rCGlXCi9zgBHIVKday+h42bSXqyDsyu8nFbaZo8ASJZ7XNFzHngTvKwnFtx6XlQr
	yCnjv6kXgOWSdI7E80mLVX5vhhVZhkBvrf6CWaIDXHg1OaSrLfbqlZIl8h45sqsJnP3r4JkbkMdsZ
	fiE0lPRsY+xPRkkzJQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msAqm-006llM-De; Tue, 30 Nov 2021 21:39:44 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msAqj-006lkh-5w
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 21:39:42 +0000
Received: by mail-qk1-x734.google.com with SMTP id t6so28531134qkg.1
 for <linux-mtd@lists.infradead.org>; Tue, 30 Nov 2021 13:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIjUhHqT3I7yZhNSyjjqGWIqrlg0jw98kAJKFJqT2YE=;
 b=f6wqnQVLJ/QypuLiFKBo++Q/jnDWh5SE3YACOp/LVwre7fBIRnF7XivKVEkvV3izbS
 Pz8sEFp6zKpHK/mtiaH1eJezYlGcD1sb1MCKEjXB8IPmSYucTxmb0zdmRT2mR250MUsC
 WVXvNyv/S+bVXzjGATk3wAXm8zrXOAd4t0y8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIjUhHqT3I7yZhNSyjjqGWIqrlg0jw98kAJKFJqT2YE=;
 b=ruRl/XjaZIrcky+z6Wu4ImgmmYLdzuW0igJHILsrC0XrMb/Jl4xCHCCvVgBfiq3H3t
 YpIft6cRq4Wy5yLcljtYCrSVjDMr5RlLuOhfUqQg5mCps3zq5YhoifhZjI3wZT6Cs2rl
 7jfiWglJ2wx7X7pD9wqIOn2i0JbCjfIYgAaexcTurWuwtXfYQXjtUdWGzE1Mkktcpalg
 nVNWx3ShqyfQAgqEv6S0Z1ep8O+by9lqt44iAfMQ+FQlFEZ6CzVo3sNZRgCvGtMmYyh6
 PjhvouOV9uD6XeeBpv/mUO8dASrhrFZ3iJPhObG96TNY1Ld+A8jWS4tewHfbuS+qZTuR
 gK1Q==
X-Gm-Message-State: AOAM5312+CxV/sjZXgKcB2TmDBCE8PV144uQ8EhH+ZzvBSz2+nV3ZY/s
 7sct5iT3Tb4NEE06v7wXI1U4zpWDoXbk9g==
X-Google-Smtp-Source: ABdhPJw1v9uGamHcJQDaVBGqe6azCFEfFSrzbN1rdennXXTpIkAN/DOiQoasz1zNY1Dt1ZVQAilT0w==
X-Received: by 2002:a05:620a:4624:: with SMTP id
 br36mr2108068qkb.531.1638308379648; 
 Tue, 30 Nov 2021 13:39:39 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com.
 [209.85.160.182])
 by smtp.gmail.com with ESMTPSA id m15sm10408660qkp.76.2021.11.30.13.39.39
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Nov 2021 13:39:39 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id v22so21749040qtx.8
 for <linux-mtd@lists.infradead.org>; Tue, 30 Nov 2021 13:39:39 -0800 (PST)
X-Received: by 2002:a05:6638:2590:: with SMTP id
 s16mr3336928jat.93.1638307901229; 
 Tue, 30 Nov 2021 13:31:41 -0800 (PST)
MIME-Version: 1.0
References: <1637909640-32232-1-git-send-email-quic_c_sbhanu@quicinc.com>
In-Reply-To: <1637909640-32232-1-git-send-email-quic_c_sbhanu@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 30 Nov 2021 13:31:29 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W_LAJDKgLf5mZKe9Ku=GSvV=m4Tg=5VLYZWvT8=Ds10Q@mail.gmail.com>
Message-ID: <CAD=FV=W_LAJDKgLf5mZKe9Ku=GSvV=m4Tg=5VLYZWvT8=Ds10Q@mail.gmail.com>
Subject: Re: [PATCH V1] mtd: spi-nor: winbond: Add support for winbond chip
To: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
Cc: tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com, 
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stummala@codeaurora.org, vbadigan@codeaurora.org, quic_rampraka@quicinc.com, 
 quic_pragalla@quicinc.com, sartgarg@codeaurora.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_133941_259642_A0C0E651 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, Nov 25, 2021 at 10:56 PM Shaik Sajida Bhanu
<quic_c_sbhanu@quicinc.com> wrote:
>
> Add support for winbond W25Q512NW-IM chip.
>
> Signed-off-by: Shaik Sajida Bhanu <quic_c_sbhanu@quicinc.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index 96573f6..cdfa2ee 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -100,6 +100,9 @@ static const struct flash_info winbond_parts[] = {
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>                             SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> +       {"w25q512nw", INFO(0xef8020, 0, 64 * 1024, 1024,
> +                          SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                          SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>         { "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
>                              SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },

I have no comments on the contents of this patch, but your spacing is
off. The entry above and below you have a space between the "{" and
the string with the name of the flash part. You should match.

-Doug

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
