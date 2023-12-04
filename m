Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EA1C4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8k/5gy04EL4/8fQr47v5QdvV+ZVU49Z+t1IPfWspHeU=; b=33/thdmgH2+V5p
	yp562emdkFMcFwYTBg9+GeVoFJHMxGf6w4MyBCsRa1Q1gd6n8LU7ShzopUmAr4dsyXCeQCD1vA0tV
	AvSRhYushBh1tNnYyTtpI55NJnBF06OPDYSE6OFb3mABWk1znieHtHL8BkNcg0WVFSKVAvBnhfjC4
	hTg4T5g4iR+WQMlE4ntlmiuJRxiUNnNo5iymLh4TSWPctwUiF6Up3l3bAhdpxJx9uFzWww6hPHijg
	o788Qw38HXJWOCJmTvczlGWtdYtF2EwY13ZmK3epLqevdl84CVMPYenDLXO8BuAp+19ZVA0C945c2
	s2YDxPOUa8su0paVEC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA2hT-0037KH-06;
	Mon, 04 Dec 2023 06:45:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA2hO-0037JA-1s
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 06:45:00 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5c66418decaso178802a12.3
        for <linux-mtd@lists.infradead.org>; Sun, 03 Dec 2023 22:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701672296; x=1702277096; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o0SyVgs21FhrslTNro3slR1glxUO3+gtPKSi+q5bQFk=;
        b=aT7JPhIzbzJll9sCfplwyTKEEChuYOBuWjvR7ZpeCPYYFYW5PTqIcmC6OPFvy90fBG
         TQBSX0TGB6FcUKN3PalSVdVukR9gaZRBGulUhRIindWTCHbm9BqAYuy4gem9xawxcsXd
         n/zr8o6HXYCuYZxd71L/i1AUiTW9G0DDVEcrVj46YDnJdwQqYpVdvZFwHQEQe120I7tM
         MpKX7u0OinZqKbzfC/Q6KdWikK8VsBbxLFhXGAPkQaWUiWAld2vIWC164luSxxy4xPSj
         S63joWYnzx6Ke5o7Eew52KWYfLYP/cSbf825UwHI7yvGG+RESzj1kMa6RQ0/FEojtXiH
         dMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701672296; x=1702277096;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0SyVgs21FhrslTNro3slR1glxUO3+gtPKSi+q5bQFk=;
        b=M5Ai8iVadCVWrWlpinVsfO1uA3UQ4MrEkpsVRtU6PUn67SiV6k1iPf/Vgc/LfOeAb2
         Ku79lycYAqpNto/xxyFOd4HUNa1LXGP8dltLL2+QzzVL1HNBcf5a8LQ08PciMHXT32NR
         dxpiyC9JOs2RB9ZnR4rPdUhLrTnXYYuwg8e/qgfbB/rFiyT9x2Y7G6fBhg/KkIK9uqEM
         lIrZ5ZQ0MH27MPuPk6YyoM9N9ik+k8Su61fX2nqnSfhbfRzyJD0P/J8TFgqROq9Ssi3b
         zeEWtUCyoOulN7x47VkL3NwM2wERz8fSOjlOgd8GVgOemUZhv0LQ9jDTvG/sQ9fCKZvT
         gocA==
X-Gm-Message-State: AOJu0YxRR3TNuPAubR4EMDoXsTvpc4uBleY9ip2kH49dNW8sN2U4fjSj
	9Z+J8gLEBsxVRVLgebJ9GdX+Y5cUn5sM6ighuaQ=
X-Google-Smtp-Source: AGHT+IHYSi7Ebu3y1pFyaAmBV94NrXuLvv4MRnZLmy8xqk/U7+3x7MTfXqbnihs/KwbwyXgVOYOSOfzhJpQgxm0Hi5o=
X-Received: by 2002:a05:6a20:918e:b0:185:a90d:363d with SMTP id
 v14-20020a056a20918e00b00185a90d363dmr924576pzd.2.1701672296471; Sun, 03 Dec
 2023 22:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20231130083854.55221-1-jaimeliao.tw@gmail.com>
 <20231130083854.55221-6-jaimeliao.tw@gmail.com> <eb145cfb0cf10330f5125f0c7d2224eb@walle.cc>
 <CAAQoYRm=5smXRSRJki8MB3yOuh4UeQO4oBYG8JSG29bbyADHGA@mail.gmail.com> <d42c102528ac8d4188147b6e23b18612@walle.cc>
In-Reply-To: <d42c102528ac8d4188147b6e23b18612@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Mon, 4 Dec 2023 14:44:43 +0800
Message-ID: <CAAQoYRnF5zn+RH6LaQfPioOnbRADG8LXBuVpBbQvDGGYqJX1-g@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] spi: mxic: Add support for swapping byte
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_224458_622276_6BD042F9 
X-CRM114-Status: GOOD (  31.11  )
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

Hi Michael


>
> Hi Jaime,
>
> >> > Some SPI-NOR flash swap the bytes on a 16-bit boundary when
> >> > configured in Octal DTR mode. It means data format D0 D1 D2 D3
> >> > would be swapped to D1 D0 D3 D2. So that whether controller
> >> > support swapping bytes should be checked before enable Octal
> >> > DTR mode. Add swap byte support on a 16-bit boundary when
> >> > configured in Octal DTR mode for Macronix xSPI host controller
> >> > dirver.
> >> >
> >> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> >> > ---
> >> >  drivers/spi/spi-mxic.c | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> >> > index 60c9f3048ac9..085c9037d6f5 100644
> >> > --- a/drivers/spi/spi-mxic.c
> >> > +++ b/drivers/spi/spi-mxic.c
> >> > @@ -572,6 +572,7 @@ static const struct spi_controller_mem_ops
> >> > mxic_spi_mem_ops = {
> >> >
> >> >  static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
> >> >       .dtr = true,
> >> > +     .dtr_swab16 = true,
> >> >       .ecc = true,
> >> >  };
> >>
> >> I'm confused. How can this swap the bytes depending on the flashes
> >> requirements? I.e. the controller should look at the spi-mem operation
> >> and either swap the bytes or it should leave them as is.
> > Byte order in 8D-8D-8D mode could get by parsing BFPT 18th Dword 31th
> > bit.
> > I think flash driver should notify controller driver and verify whether
> > the
> > controller driver support byte swap functionality. If flash requires
> > byte swap
> > in octal DTR mode but the controller driver doesn't support it, then
> > octal DTR
> > should not be enabled.
>
> Correct. But the above means, the controller *supports* swapping the
> bytes
> if the flash requires it. But where is the code in the spi-mxic driver
> which
> actually controls the swapping depending on the dtr_swab16 property in
> spi_mem_op?
I add it additionally because of controller driver should enable swap byte
feature on special case only.
I programed data in 1s-1s-1s mode and read back in 8d-8d-8d mode
with controller swapped byte.
Then check program data(in 1s-1s-1s) and read data(in 8d-8d-8d).
In normal case, 8d-8d-8d prgram then 8d-8d-8d read, controller driver
should disable swapping byte feature.
So that I don't think controller driver swapping byte feature should depends
on dtr_swab16.

>
> > The controller driver should indicate in the
> > description of
> > "spi_controller_mem_caps" whether this feature is supported. The
> > implementation
> > of this feature should be handled separately by each controller drive
> > since the design
> > may vary for each one.
>
> Correct. And because your flashes apparently need that swapping, the
> driver
> will have to have support for that.
>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
