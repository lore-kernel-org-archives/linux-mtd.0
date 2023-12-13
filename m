Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497B8C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtfCT5nMuHGvK21fv40+KDv2gQhOmzaBfd9u2SYi4DY=; b=tS7RhSv0e9HUoB
	Sm4Au4yYRC8p5GrwIq0QjyLU/kRzERUuWs9OR/GDn7jDyhVQu2vlQfXTi12ZTY2r1zS7zUaPYGjsy
	hbt2Of/ylrfV1c6r570xIidQNawVYCzVENkEJh7wvcGK8plxgO/uB2uJ4izi4xtH9NmoA3n19WzIX
	KQVRunOl6zo/pfkpAPtjiTN9bh2eoESJeKpaUzQPNfatWpXIssFrPuaucgsajfLs1h1eAwjp9eQmI
	gRCoiOFzt+hsKpL2uvH1OVNLYkFprV5a8JSnBQQE1G7uy24FU/ZXxsp0PTztsCDSxSwOwKLCr2PYk
	RUdsZx87Zf3lEWGecIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLC0-00E6ZZ-2h;
	Wed, 13 Dec 2023 09:06:12 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLBy-00E6Z4-2A
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 09:06:11 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6d9e0f0cba9so4260583a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702458369; x=1703063169; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c2FVyN33UTw5ZjbtKTkeaphP+qX4xvSSsUlvEhgJcR0=;
        b=HsaunKvphwqX89UVeQL2xNiLyn91pcjp1Xz61in2j5qHy3AH8YDNS98ty/zMJ2/ni7
         9z0TQKycILKgnSoKeYbPML49QjXKRu9X7wPZZEKbahWEtzvKVYFUkkoOB9vQAwW+3aS/
         HABYwx8qoAg32OKITLK2yvDMWcJoVytVMNm871Y0n2MOwvz2lENk9I9BAo2MM0ae5ZQA
         ndOJcDEeRqbRwpDhACzXd7pwL82SHoT0vZ9sQ2WoHzqvDSlXlxzYpgER2xtcECEKHKQB
         y/0W+GQ87mWQQJcgKRRICviWLjrvHzgQidyu+iSNpz9Tr1BdcwFwuc58OxewQPAZQD8L
         0lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702458369; x=1703063169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2FVyN33UTw5ZjbtKTkeaphP+qX4xvSSsUlvEhgJcR0=;
        b=TEWT4gHDS4cJ7Evw3NyucuuDogWBJY86lEEjJgUDDOl/kTyNK3rX1QSjU+N4+KShZT
         QKHkLwJ1BV8IUUMPvIoMHUnXEUXROBaCCg3x8JBaNGwhxvt5ukRn4fbgKxk+bke8ePel
         qhRPPWHLI5S9MXYcynPkyycBS9tuIyb4aampna4x4YdxsO/5gCZaSOv4BvB1Mbg7yznj
         6WiPXVZNmgE+PgmjTHT9PZdhvbxE9MztDQrjFnvVbwyz6c8rnjco6rH0f0HLBNQw7/3c
         WkPGsaaJ8TF+Pf9f9xwimMeycPixi6a0Gl9ZE7VEe9YaUWrXG9kHadM4eEpE7/w5XiiP
         rd7g==
X-Gm-Message-State: AOJu0YwVwczSWT6k2iQctyuSn9BJ5XbeQgwvL3zvsIpebug66d2DZc1N
	PN4Dlmbptfsgh8DimygrcIBBkjWo51ZRMFAiZWI=
X-Google-Smtp-Source: AGHT+IEjjyOcv1oa7rGZF9bKkGYlLWFKOvtZeBMbdhTs9e7lfGedB2lYN2xHFhd3CdHRk7nNyf2SWjsVGOIYHhoD1Sw=
X-Received: by 2002:a05:6871:5ca:b0:1fb:75a:7794 with SMTP id
 v10-20020a05687105ca00b001fb075a7794mr7861867oan.69.1702458369549; Wed, 13
 Dec 2023 01:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
 <f015ef75d6bb0a9f8edba37b40affb60@walle.cc> <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
 <e08b45ea59a0ba96de99a42ddf7b6769@walle.cc> <CAAQoYRmYxmD8v20_Q=YShj_xv1vsV7fXnAGPYPBSP=XJmoG2-Q@mail.gmail.com>
 <eb0667ee62c304b041f7861788ca0c7d@walle.cc>
In-Reply-To: <eb0667ee62c304b041f7861788ca0c7d@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 13 Dec 2023 17:05:49 +0800
Message-ID: <CAAQoYRkR0Jgr96n0-h9_6HTjmSPBq-YKskFN5+e-m6HBSbCocQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_010610_707261_AF068B60 
X-CRM114-Status: GOOD (  20.06  )
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
> >> To me it seems, that spi_nor_select_{read,pp,erase}() will select
> >> the wrong commands/proto. So it should be fixed there. Probably
> >> shared_mask is wrong.
> > Features in shared_mask have include 2 parts as below.
> > 1. Flash support the feature (by parse SFDP or ID table flags)
> > 2. spi host controller support the feature (In
> > spi_nor_spimem_adjust_hwcaps)
> >
> > But I think Octal DTR is a special case because, in addition to the 2
> > points
> > mentioned above, there are also other conditions that need to be met.
>
> Correct. And btw we would have the same problem for quad_enable if we
> wouldn't
> have a default.
>
> So in spi_nor_default_setup() I'd suggest to add something along
>
> if (!nor->quad_enable)
>    shared_mask &= ~SNOR_HWCAPS_4_4_4;
I think this check is unnecessary for quad_enable.
Because of "spi_nor_sr2_bit1_quad_enable" would be a default
method for enabling quad mode in spi_nor_init_default_params().

>
> /* skip octal command mode if we don't have a .octal_enable callback */
> if (!nor->octal_enable)
>    shared_mask &= ~SNOR_HWCAPS_8_8_8;
Sound great.

Could I follow the suggestion for preparing v2 patch?
BTW, I think discard is better than abort.
What do you think?

>
> #define SNOR_HWCAPS_4_4_4 (SNOR_HWCAPS_READ_4_4_4 |
> SNOR_HWCAPS_PP_4_4_4)
>
> etc.
>
>
> > My goal is to enable Octal DTR mode for Octal flashes listed in ID
> > table.
> > For those not in ID table, choosing spi_nor_generic should allow
> > selecting
> > either 1-1-8 protocol or, at the very least, 1-1-1 protocol.
>
> That's understood.
>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
