Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68D2C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:45:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60F1A64DA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60F1A64DA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=66z3yw5+6GMvSZDexhWl3lT6lxSHidMw4wBGXxb8XkY=; b=RSQWDfmIlRDIfWxvK7Ur7mIcG
	BLeK4I+nAYw6+8SXTMDQSgD3oBIVRiY0x/4N0UN06sLplC+h7psGbrv07Kc1oBLZr+OdboBoVZzLv
	EIEzU2QgdOvrUvRTYFa5YSW/NDre/V9RK+KhY7wjSn3uhJz+t74yCQwh2XcsBVyLj40RtXd2xysf+
	x5+ZhapIR5C9JbTpY2UW2OC5SyXdQwPnu+Q/qcLpUyfljEzB5NAAu2pijmsvyRJP+5ALhURO1vskV
	hoD2ojmBWveS3HkMjHcRGfA0IjTjTMLv8g5a35sclQ9h2+3UH0/xo5QmitrIVIgiYM4a3mFFT/C2N
	T0FnfwtvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBwv7-0003SK-MN; Tue, 16 Feb 2021 09:45:25 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBwv4-0003R8-O2
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:45:24 +0000
Received: by mail-il1-x131.google.com with SMTP id e2so623693ilu.0
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 01:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=52PT7yTNyAjUzhxre6fTQVuNCknsTs/JxV4ww2m8tM0=;
 b=jc55SsIQhp4J4MNYiLwbkzd7wKHFc6UkeX5ZsZ8vH1i7qkkx4sJ/9WhNVtq8YUsrZ8
 y4jsQK4TV/mZcZyogvp526fNMJ1FvG0fe/EF14O3dNRwqqnbUbQu7o4TVI7YG4yfhqY6
 pGazc0O+P/sh/VVwrWxkrfKpMW83sUHxW9Ci0vILwRRyYA8BHnxehqhjMa163WEsJlAh
 IiXwe/Elo+hifYKhBLrjkT0I6/F+acjnlvpfCjqlOOKZUecYls5hpQ8/dzNXl2iN48t4
 BxAYIMSTp0PXd5eIJYNXbIh6jc1qmrsstj+KslOnA0SyOHeyhkxPpi8sWHBIvvUkMKDN
 vM+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=52PT7yTNyAjUzhxre6fTQVuNCknsTs/JxV4ww2m8tM0=;
 b=Rg0O2ukpr9RG6FlaN4ZXALo7obMORt/ViKsTggo8LqrRWRzgtuvpOcc6Dl0aHO7nEl
 /JNPgo5HnZJGp68IaMr4b6aU8MSNn7a3CjCU5rW5X/Il8UfNIxpVfbjHUu4sm6Yb4agQ
 tzOaMvZe9zE4lHewa9+dzgOotJiAQQXUAdy4jm9MthUI6WUpbxFU322jpTYB80cJkdiH
 NHrDVPiwbkt2rncA4SQUbwsHfDAFvtmiFpYMRYt6oYLlvQvr1EzCoFQ3IA1Rn7zsKsa9
 k0FKT9egAzn1xJtd07bdJl0CaIsoYng+XNOiC0mXWh7SrrJY6Gh0LhFIO0Ph9LWGt1dp
 mQ2A==
X-Gm-Message-State: AOAM533YQL8+qFn6TxtJir5YGsAtgq3O2JpBjcbndJxr3EjBJGXC+8aU
 yAQRa56OvYe8oftm0vZD3RmaPxfzkAYmEkyV5GE=
X-Google-Smtp-Source: ABdhPJx3MdKP0Pm/fmwh/S/Y9SU68bodFoiuEPFH9ki4Sq7h2mZ9iL6vFjfwD3xF0R2w0HHePjJ0g+WBosHz4goMnTM=
X-Received: by 2002:a92:dc86:: with SMTP id c6mr16767323iln.129.1613468720929; 
 Tue, 16 Feb 2021 01:45:20 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
In-Reply-To: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 16 Feb 2021 10:45:09 +0100
Message-ID: <CAEyMn7ajj4aXV3zQ0aHrrj2-4PuOj2QU0sSrV6DV2HrtD=bw4Q@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_044522_891255_ED5EADCD 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush et all,

Am Di., 16. Feb. 2021 um 10:27 Uhr schrieb Pratyush Yadav <p.yadav@ti.com>:
>
> On 15/02/21 10:53PM, Heiko Thiery wrote:
> > Hi all,
> >
> > I faced an issue with a SPI flash on our board. We use a macronix
> > MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> > the MX25L12805D [2].
> >
> > The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> > while the older doesn't.
> >
> > I thought that I could do a fixup with a device specific
> > post_bfpt_fixups() call but by now this seems not possible. The older
> > MX25L12805D has no flags set that allows a call to
> > spi_nor_sfdp_init_params() and implements the fixup.
> >
> > Has anyone an idea how to solve this?
>
> The post_sfdp fixup is always run regardless of whether the flash has
> SFDP or not. You can try putting your flash-specific fixups there.

But as far as I can see, this function (spi_nor_post_sfdp_fixups) has
no sfdp information arguments to decide on what to do. Only
spi_nor_post_bfpt_fixups() has these parameters but this is only
called inside spi_nor_parse_bfpt().

>
> >
> >
> > [1] https://www.macronix.com/Lists/Datasheet/Attachments/7397/MX25L12835F,%203V,%20128Mb,%20v1.6.pdf
> > [2] https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf
>
> Both these links are broken.

Works here for me. Nethertheless here are shorter ones:

[1] https://bit.ly/3jQFNLL
[2] https://bit.ly/2OKiGH9

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
