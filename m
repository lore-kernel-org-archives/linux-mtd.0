Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9695DC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 20:59:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64828206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 20:59:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WtU+eKVy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a73TWtFB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64828206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yJYJkpGnckxyawMJJn3GhFLSmEK+2xc7SU1yI56X4gk=; b=WtU+eKVy64G3DP
	X5Y4K5rxOYogxdNA1IuhWjk1eig3/DgBXls+xWVmT/IPCIm/ZHM6ygNqt+AtZf539BcFo7aUY+D8T
	26vaujVz/i25liPzSzevkvJx1QBWudHUmgVJTsik+DBelFy47FFrHlF4pxZ+1Ma/Ym857Mz3RS50A
	m5WrSB/cDsJOX8+UJshEmQlx5LHQy/GfZmnH85ud3iRDRyT68KU+o8jv9hTYKqLQY2QT7Qtwj9FEq
	zDWeGNGtPpCpZm0RqZc+MCuCpE/nnqwS1/K/ZPN++moPzK3ydhqzIglTYhH+3HkINSke1ipLpghQN
	foQmTYDlYyqCWvnePhYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwvQv-0000P1-Ip; Thu, 21 Feb 2019 20:59:05 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwvQs-0000Nb-8d
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 20:59:03 +0000
Received: by mail-qk1-x744.google.com with SMTP id z13so7642qki.2
 for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2019 12:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5HsirSaHgF3nrHLdsnlGzjR+XNKpSzn5MWdsXjHuCW8=;
 b=a73TWtFB23q7YILKBQK6H3cNILUIRSrXiZqFLyL0ZAo1023eRTxXAaVETCI9CMyEW0
 rJArQNgXojK0TGiog3oJk58B80cOgu3O63+7Zk28yxD+OEvUqs+UsXwfh/oyRK5w/v7b
 W/0XtfWHOzI7xJJBKWjQ79Gj8dU83olkiS0h/EATZyLvXbXQQXZ8tGJNrjua51OZ1T5d
 J99+2mxglYWTc2hBqqmf7x5zdLtEbHrIibqgNw2hgxuZkA0YkyDf1MPPr/YPXebghnql
 OVvxKkDwcur1Wjb+tMkfr0vzWLBjet4NPDnNIGTqdPh12E3Hg0Ev2fE0/G3WHzmPKhsN
 lDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5HsirSaHgF3nrHLdsnlGzjR+XNKpSzn5MWdsXjHuCW8=;
 b=RTCPNnlZbq7hAk8ypAYRkAt0o4ukYuV2LXJyywb/g620Ac/rwsqhoqP+pNPWLj7olj
 H3pLwtgBOf6C+nCNx6NXJgpY7ZKMcVHbBztxh7mVQVA9AfoRUXO2K3GMjSnepCO8yCe2
 Loiuv75DD2yqye9JIBqt4/Hb+mzN7fChgLtGoYh3xvuV+QavX6i5NbDZYR7IyTchEFEB
 v6WliyTiBFp+HZDIj5Dm1i9m+NYA1cAcyZPBYJcf75NpH+9HmCU2RyjsLacf3d9XzqGs
 g4uGe1d9bh6byQnJPJ6p1E+ExvEW9RTByvU5bDI0IjOp7UFPKroqy07OaBhZf+6SUjHZ
 FyHg==
X-Gm-Message-State: AHQUAuZ5YUJ33ZO8NrkpJVR00iwgEHmNMLN1nb2idSa5ClnTh63ibmTT
 gMnq3vYzqHWv3y9vjgBCLGOXAK+tEKeynSjgjTg=
X-Google-Smtp-Source: AHgI3IYnrl6/w7gDDnXr3YQYGShHPAHMWAMRjqVkY18kuiRzm1xHl63g49lUDUWBqxkEB8g5WDKn26avTfAmC2bed5Q=
X-Received: by 2002:a37:c403:: with SMTP id d3mr421649qki.54.1550782739144;
 Thu, 21 Feb 2019 12:58:59 -0800 (PST)
MIME-Version: 1.0
References: <20190214205723.9011-1-robimarko@gmail.com>
 <97e48e85-9700-53e3-0f7a-eeac6f93f721@microchip.com>
In-Reply-To: <97e48e85-9700-53e3-0f7a-eeac6f93f721@microchip.com>
From: Robert Marko <robimarko@gmail.com>
Date: Thu, 21 Feb 2019 21:58:47 +0100
Message-ID: <CAOX2RU5MsnNLseBRqcp1KqbmQ+5_KzRyTQ_rGQB2DsrW_v-3iA@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add Winbond w25q16jv support
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_125902_309674_192180C2 
X-CRM114-Status: GOOD (  17.83  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, linux-kernel@vger.kernel.org,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 Feb 2019 at 21:29, <Tudor.Ambarus@microchip.com> wrote:>>
Hi, Robert,>> On 02/14/2019 10:57 PM, Robert Marko wrote:> >
Datasheet: https://www.winbond.com/resource-files/w25q16jv%20spi%20revg%2003222018%20plus.pdf>
>> > Testing done on Mikrotik Routerboard RB450Gx4 board under 4.19.19
kernel.>> It is preferable to do the test on spi-nor/nextUnfortunately
I cant do that as OpenWrt has a considerable amount of patches that
would need to be ported and we are only moving from LTS to LTS version
and we are currently on 4.19.
> >
> > Test board does not support Dual or Quad modes.
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 6e13bbd1aaa5..0e958f48db1b 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1975,6 +1975,11 @@ static const struct flash_info spi_nor_ids[] = {
> >                       SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >                       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> >       },
> > +     {
> > +             "w25q16jv", INFO(0xef7015, 0, 64 * 1024,  32,
> > +                     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> > +                     SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>
> You'll need a way to differentiate between W25Q16JV-IQ/JQ and W25Q16JV-IM/JM.
Hm, from what I understood JV is the series and suffix only indictes
the package.
They should all have the same JEDEC ID and features.
>
> And I would prefer to have the new entries ordered alphabetically as much as
> possible. This one should fit just before w25q20cl. Manufacturers are naming
> flashes based on a product identification system. The flashes are presented in
> alphabetical order, we should do the same.
I agree, will reorder and send a v2.
>
> Cheers,
> ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
