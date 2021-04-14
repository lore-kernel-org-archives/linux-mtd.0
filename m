Return-Path: <SRS0=WaUJ=JL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9F5C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 06:54:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E0C6105A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Apr 2021 06:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0E0C6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UOf2RygdD/b7OP/uj3q2HbIOpmKcUCZfZKZLy/df0bY=; b=gVJhmAqS+fiYVG4xa9OxQfyyg
	xNec74zksWvk7K08Wmn9HMEO9ymIiSeYNem7E22PHnOWawkR0T2FzwP3S+GFDnyfwu/1sQkp0c7Y2
	FOIrq2l+LpXElb07KqTO9dyI0ku9WhunBYPx10TC/zQWeVc503xABq1hlhpx8JQqHnt22rk4elSUJ
	ITyWbyP0dcg8beQnq3Q6FFWtwYYBar5fYhKdGYxEviGsVmBOXixl4tz3Jz6gCIXch15wr0cD3oOZo
	ZCTu1NSUA3d53b4y/cOL18RzPRhhF1gQfyqSuMR9tezf+Njf75u+/B70YJCRYK396F7Wi9/uQ0p7l
	VJpvfKMoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZPU-00Bk4d-GT; Wed, 14 Apr 2021 06:54:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZOz-00Bjr7-W4
 for linux-mtd@desiato.infradead.org; Wed, 14 Apr 2021 06:53:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5FpXG6BxL1eix7ZuvEbTaKFw6E4r9hjxDvOS4dYSkAY=; b=QeB3Qv5ipPcfJlhlrJLFLLjlzU
 CtUIcX7gzZMxhCAYmRXchjtFwQmOQSj56OsOc5sqm6HKan2uyRNqDoDeEcTvY1NY5QOZJmx6Kw9Sv
 5SoBy8zXB9KSG1+plWAmoJ7MILWi2+LoXgvadfnfGUYPF/nlbUQwosmS+eqdwuGBEX9lrL+sUUmKS
 2PTDItOKfw6HN5lau1IqU0vvBneXVP1Y6Lu/w8BbG4ImbOWFHaL7bz1njchq3gV8m9WIOofmrhEGT
 rNWNqh5jCAClDg1yyHBSWObrqRvWZM3dIvwjyhRpwjfHxpMhFE2g6NXT7UMvESSXRn0yFi0aCZTMd
 UfTIgT9A==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZOx-007Y04-7y
 for linux-mtd@lists.infradead.org; Wed, 14 Apr 2021 06:53:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id l76so13720219pga.6
 for <linux-mtd@lists.infradead.org>; Tue, 13 Apr 2021 23:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5FpXG6BxL1eix7ZuvEbTaKFw6E4r9hjxDvOS4dYSkAY=;
 b=ZrC/mbRqviwCrp5s59OqqAyhvEdMRY3USfk7e6ubgSvZVNx2+4IzlpYBZnp6NjL6nJ
 EQAbg1Wrn0hW8AwBhkp8kJbeWwvXuo8eLX5AA66ahZgvxqh/xIPVYbYadIMrumBClMOg
 t5OxvcggD/+s7eVHhjKwCFsyK0Iutbox1Fco8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5FpXG6BxL1eix7ZuvEbTaKFw6E4r9hjxDvOS4dYSkAY=;
 b=DDF0a3CgCwKqsCWm+sg5ELfB730fPcD0+MRhUA6Zjjoooq2hlQ+GKoAGm1oFCS+hdn
 DuP1gAfVU+Z7CFqYL0RjPL6uy/5EpeViWYIl33mP//GU9WEVlva96PL3Uvt1krtyEfpZ
 XVwKtHGQs+rotmnaD56xkcxRK/mkJBWQ1xU+SNlGTHlAPNPYbdYy8+31ye52z0Kg6IE9
 1vVechmWVO7Qj/vi6OLfGlOul2dUl+h46caaYVW4+1VKC9MlQYBln5zKELcpB88hQqAE
 1zgsWevl60NTHnITXPfh45laIdvmWmSqFQtv2uWivn8qf4uqwFXWG5zU/IuudrDczE/D
 E/jw==
X-Gm-Message-State: AOAM532LK7yAIlrOS/gnHu5YzsUujSRX6I/a2jN4WTOnHI6UGv9Ld18G
 t2FVuw/aBXhOcPkZhd/Ed7cUUWiVgr6UlUNW7kdybw==
X-Google-Smtp-Source: ABdhPJwv5wFKRCqUakt5uMuQOtM3jnC4w4KH5JJ4cnCysJqWAMdTHJUlU295rpEldhiJ0+2ZGtABHZuVwB4BTv7H190=
X-Received: by 2002:a63:525c:: with SMTP id s28mr35660389pgl.317.1618383206183; 
 Tue, 13 Apr 2021 23:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413120210.3671536-1-ikjn@chromium.org>
 <51761f1db840c51bad17f5f275b4ce1a@walle.cc>
In-Reply-To: <51761f1db840c51bad17f5f275b4ce1a@walle.cc>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 14 Apr 2021 14:53:15 +0800
Message-ID: <CAATdQgCYoeEKfvQPNUxzMA+o4Xwtt80SoMmfweTAB1MCijyC6A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add block protection support to
 mx25u6435f
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Richard Weinberger <richard@nod.at>, 
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_235327_326300_9AC1B91D 
X-CRM114-Status: GOOD (  23.78  )
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

HI Michael, thanks for the review.

On Tue, Apr 13, 2021 at 8:26 PM Michael Walle <michael@walle.cc> wrote:
>
> Hi Ikjoon,
>
> Am 2021-04-13 14:02, schrieb Ikjoon Jang:
> > This patch adds block protection support to Macronix mx25u6432f and
> > mx25u6435f. Two different chips share the same JEDEC ID while only
> > mx25u6423f support section protections. And two chips have slightly
> > different definitions of BP bits than generic (ST Micro)
> > implementation.
>
> What is different compared to the current implementation? Could you give
> an example?

Two chips have different definitions on BP and  T/B bits.
- 35f has 4 BPs without T/B, BP3 behaves like T/B bit.
- 32f has 4 BPs plus T/B on CR.

# MX25U6435F

 BPs | BP3=0 | BP3=1
---------------------
 000 | None  | 1/2
 001 | 1/128 | 3/4
 010 | 1/64  | 7/8
 011 | 1/32  | 15/16
 100 | 1/16  | 31/32
 101 | 1/8   | 63/64
 110 | 1/4   | 127/128
 111 | 1/2   | All

# MX25U6432F

  BPs | T/B=0 | T/B=1
---------------------
 0000 | None  | None
 0001 | 1/128 | 1/128
 0010 | 1/64  | 1/64
 0011 | 1/32  | 1/32
 0100 | 1/16  | 1/16
 0101 | 1/8   | 1/8
 0110 | 1/4   | 1/4
 0111 | 1/2   | 1/2
 1xxx | All   | All

It seems that 35f has a unique definition on bottom protections than others.
Assuming there's no way to distinguish between mx25u6435f and 32f,
This patch simply takes the common parts only - BP[2:0]
without using T/B or BP3 at all.

But the current swp implementation implies that "BP with all ones"
is to be 'all' protection while in this approach it's 1/2,
A hidden BP3 should be involved for 'all' protection.

>
> > So this patch defines a new spi_nor_locking_ops only for macronix
> > until this could be merged into a generic swp implementation.
>
> TBH, I don't really like the code duplication and I'd presume that it
> won't ever be merged with the generic code.

Agree, I hope I could make a more generalized version into swp.c.

Honestly I expected that I just needed to add one line of SPI_NOR_HAS_LOCK
to flash_info to support mx256432f (this was the main purpose of my patch)
before I read the datasheets. :)

>
> You also assume that both the WPSEL and T/B bit are 0, which might not
> be true. Please note that both are write-once, thus should only be read.

yep, that also should be considered,
I'm thinking just not to support WPSEL=1 case for now.

>
> See also:
> https://lore.kernel.org/linux-mtd/346332bf6ab0dd92b9ffd9e126b6b97c@walle.cc/
>

Thanks, let me try it.

> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
