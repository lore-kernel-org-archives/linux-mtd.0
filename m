Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5352BCDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Oct 2023 09:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exP/7YdnHkwNyEV/rrw4vxrtqCTDkVf7VF19XzcI4QE=; b=gpKAZTl4QR6Jnp
	YdFK++3Ckd0aySys8cuYRQ4M5zrCsKJL3XVtGDkTRVKvkQQkdeHCkTlCi/WvatTcUzwk3ZCeniAoo
	LFeD28hSSAcEC1p/s+YfDNxY/vTG/ASDCn41tG2Nimk+cWHTlc+1bCsqsQUVTEL3TmNHWMhkT1J/P
	q4LdtdYY9xEkXKQdD3RzoPJYRNMkWiTt+TDbd4naFDQ05A95vLecGexFqwfObLrLafEnFzboSDQOH
	1e3TLYnDRuMwBTYsEYBHxzoBl0WIJirMC6h447g/YMokbmgFyourMHkkrJ2NcyKtvwp2OFBZrtcGd
	b3ys4h7KZGFAyJDMaGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEFx-002vTd-35;
	Fri, 13 Oct 2023 09:14:53 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrEFv-002vSj-17
	for linux-mtd@lists.infradead.org;
	Fri, 13 Oct 2023 09:14:52 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-27d3c886671so320514a91.3
        for <linux-mtd@lists.infradead.org>; Fri, 13 Oct 2023 02:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697188490; x=1697793290; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Xp0ijNhY4nAztKDvIss0880mV//xdqdEVm43/02Kfg=;
        b=aq3l4FqsOtGwjXdEfVv6jzpbMZM2Ueu8GJuomoW2q96VJGnXnF7+YMu+cuP7bTNwlh
         SOvFZx3aaHEpl9CeHau3ZFe4fS6A1LZEcoq3OfFfB9HJmMCvMjLWxguOXvYcSMcrZJRA
         XLh2oPvsYMuQujwgXr6b3j7S3Wk3IsqTpkWXRgRMxgULxIdNTB7RselbhO8xxqYGoA/w
         OX0Dmoe4LoZkJuRq894jeb2+92+KvpXFTCOlEeRJYd+Cpfr2ci/94gGMvlMOnl17cvJ+
         iveOPPgidZfG1CNs22q7CC4WwaAmpt/SjzrEpqV5QnQuPQyptglUGh1Ni7qqghh0Hd/K
         yETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697188490; x=1697793290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Xp0ijNhY4nAztKDvIss0880mV//xdqdEVm43/02Kfg=;
        b=kUnuIl/gEviB30YYNgRhgfI7024i8M9pG8cstsc6Ji7Z31RevH+bwj4rcE/65e8UTa
         GDRfGzokMB/cjSyMHt9aK1wmw9tiL2oMhwdyPGUjMvj+EbaoKC5NlGGtXQsvJ6S0IZuf
         06dcDBMVZ/dsojtpv9skSDWbMMC30ptqSuWfxFhJWmepSo+P7UrqHvR2+Pa8B5BLtwp1
         YAEMW7CufFWikqzTYHOeY3CUgthiBpgcgUJ+BE2SbsqoaKt5qQzcdgStuI3LgWm3TgSh
         FmDEZY9CbQk7DIlE3NvaRNFniis4OlWPVS4sKg7owSg/7mpzxBKYGn3X1zV+qZYRUC4i
         mhTg==
X-Gm-Message-State: AOJu0YxcccT37TjZ8CispI4uKZ/D4kASDBrt/ZhHS9hef7h+asnpPzhV
	Iby+5nUCGkBWRGnb+YQq42WKEmXP6SysVcmB6qg=
X-Google-Smtp-Source: AGHT+IFal39xlmR3+DGtNP6/j6floHYjIedtcPU5l33PTGvf0tQo+DxrTSmAv17zOorgxbeKbpOMZgk4fSqV53Hlf+A=
X-Received: by 2002:a17:90a:199e:b0:27d:222c:f5eb with SMTP id
 30-20020a17090a199e00b0027d222cf5ebmr3732384pji.11.1697188489660; Fri, 13 Oct
 2023 02:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com> <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org> <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org> <cdd8fb4d9261892345588388a5de262f@walle.cc>
 <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
 <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc> <CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
 <8ec055f3a5bb69e6d72d4f4c5c7946bf@walle.cc> <CAAQoYRnYQBXPX59u3y7_Omz1qW=XuqGi8dy6trzfJXGTA_QCqQ@mail.gmail.com>
 <8b19eae720f0e0a8285993f3627eeff7@walle.cc>
In-Reply-To: <8b19eae720f0e0a8285993f3627eeff7@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 13 Oct 2023 17:14:26 +0800
Message-ID: <CAAQoYRnektLQaw__dkxXaOcRJ_B1gazC6ukW-qjEeU89W6oYuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_021451_380910_D0BD3A3B 
X-CRM114-Status: GOOD (  29.28  )
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
> Hi,
>
> Am 2023-10-13 10:23, schrieb liao jaime:
> >> >> > After checking with Macronix designer, a-a-b-b-c-c is the data
> >> >> > arrangement for
> >> >> > read id operation of flash in 8D-8D-8D.
> >> >>
> >> >> Could you please point to any specification? I doubt there is one
> >> >> and every vendor will do it slightly differently. I mean we already
> >> >> have some flashes which (apparently) reply to RDID in 8d8d8d.
> >> >>
> >> >> For example, see the Semper flash datasheet:
> >> >> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
> >> >>
> >> >> Have a look at Table 78 (or search for RDIDN_4_0) and Figure 28.
> >> > For Figure 28 in this datasheet, I think it means that data latch
> >> > while DS raising and falling edge.
> >> > The data arrangement of read id follow the 9.2(Manufacturer and Device
> >> > ID).
> >> > As below are the data arrangement for vendors.
> >> > For Infineon, a-b-c-d-e-f
> >> > For Micron, a-b-c-d-e-f
> >> > For Macronix, a-a-b-b-c-c
> >>
> >> So there is no standard among vendors, infineon as well as micron is
> >> using 8d8d8d and macronix is using 8d8d8s. And - please correct me if
> > Macronix read id operation is not 8d8d8s, it just look like 8d8d8s on
> > datasheet
> > but flash send 2 bytes data per DQS cycle exactly.
>
> Two DQS edges, yes.
>
> > I think whether to use 8d or 8s depends on how many times data is
> > latched
> > within per cycle.
>
> I see and I agree with you. The flash behaves like it's in 8d8d8d mode,
> but
> just send every byte of the id twice. Well, then I'd argue, it's a quirk
> of
> your flash.
I cannot refute that.

>
> So Tudor and Pratyush want to hide that away in macronix.c. I would like
> to
> see this handled in the core, because all flashes do the very same after
> switching to octal mode and that is trying to do a rdid and see whether
> they got a sane response. And during cleanup I noticed that this code is
> pretty much copy and paste among all these flashes and looks very
> open-coded.
>
> But to move forward here, keep it in macronix.c.
Do you mean that I can keep v3 method as below for comparing ID after enable
8D-8D-8D mode?

for (i = 0; i < nor->info->id_len; i++)
if (buf[i * 2] != nor->info->id[i])
return -EINVAL;

>
> >> I'm wrong - the data strobe signal is optional.
> > As I know, data strobe signal is needed when 8D-8D-8D mode.
> > Infineon data strobe signal called "DS".
> > Macronix and Micron data strobe signal called "DQS"
>
> Maybe Pratyush can help here. But as far as I know, the data strobe
> is optional. E.g. on a layerscape ls1028 you can use an internal dummy
> strobe if it's not connected. The timing is then determined by pad
> delays.
It would be great if Pratyush could provide additional information.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
