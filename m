Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AC4C4727E
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 18:41:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 446182083B
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 18:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XBfb7gqR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Syf7hE4/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 446182083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:In-Reply-To:
	References:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oEtUZioX8DKjguvhxN9lpQeiFzRCEtPGaioYcn1IA1Y=; b=XBfb7gqRKhwChxmflkjx5tVeW
	3qOIiDpLWE1xRFs/V3xKxRe9ctKm5l3F3t2qRjftCDVUcFgMqnkugC4cT5P9E4WAQAwwSIuh4wbjC
	Ha7XTvOgccsMKv29iOFich5rzoun4K5xjqTN/FOt0GD7BP3Ip+4smaMNeqJvOtY5uphAPDkhliRou
	1bO/og1iK8bTxeKuUEX3K8+aFtVsXaoO3btjueHw+ovrW3Dg2ZPGYOZOSP23lqRESO3dP6U8iIFad
	JlSPHMZ03yt0APgICzyNzb99EFs4zouSzpvmp0EThpHQwQxHHFg0nsVI2eUH4saZMFFWJiyYxe9Gs
	gEYU2mTDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLsdE-0006j6-9L; Fri, 25 Sep 2020 18:39:44 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLsd6-0006iQ-Ko
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 18:39:38 +0000
Received: by mail-qv1-xf41.google.com with SMTP id f11so1893963qvw.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 11:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=dUf435LeWetQI7T/0I6jtCo+Jj+pjMiRIhsGBhL9+Ks=;
 b=Syf7hE4/NbuBopE4fj6R7YVeAw1e4pC/XFomn9rGC5Ic4Bh3BmIc7Zc/UekYCw1o93
 Dm+HkmALXxcv5YP8ZaMqGfeKvNBhSiCn+iUtJj0Ep3jYIKs76Hcmxo3+3fgpxhs4nBrn
 bv0dMWeZmnnCRhJqZAql9w2z4SXxuLEx+hh7WxFxoiIUOVj7TImZIVO3viYDiBSlq479
 2hlCSo59GqQs/gdzdRyHR+EztEPckFxKLOC4rbC9ddTLL0HdLGewAi4SB3B04SNcfBAQ
 s3/e2ZATvE1MSNVzS+kmjMoyXqpVY8+IE7Je5CeREbCohS232UOb2uNaGbIyKQzLeYzq
 k/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
 :message-id:mime-version:content-transfer-encoding:content-language
 :thread-index;
 bh=dUf435LeWetQI7T/0I6jtCo+Jj+pjMiRIhsGBhL9+Ks=;
 b=FB836iAz5iHygutyTwzVruwrnG6o4qMc0jXt3c6pvtruK2EVamj9bP10a4v9Qbc/cQ
 GXT0Yc0NZ2C6BSbSPkxpCQwJdYkoNX/oyBKD88ttngU5Pzn88Hw/snnvStpPGDOy18XK
 h+pYf/z6wZxb5GwMxder4EeoBPzm8/VKu10CEmm0je/Rrk07mSayPNH2jEJ5dojZvBXp
 SPRihGTJsRBmzj7/XRun8Cq/322NvTG4yMsHJ2cQFkV0MuEVJ8IMEO2dS8DumRjsOi8E
 hXH6NpFEi3g1CrRYIt8cfjhBQUGBPlp3rc47ICNaK3PTPeW9gF7bfiXRGIw8MXCxWzok
 PK1Q==
X-Gm-Message-State: AOAM531HVx6Dj17TMoRcOY05FxaMs/SxE/EEvAHNttiwsHiE4siNRVGF
 pATM1qzlVUBJtjwOEEexyFM43jS1xP2oHw==
X-Google-Smtp-Source: ABdhPJxDhaiOVjVfIGD8RWeyXsIunrWwPzE9wLn+BAfnkudkko5iSAi6Y/tH4RMK/XBVIPZAxiNCkA==
X-Received: by 2002:a0c:b251:: with SMTP id k17mr799820qve.53.1601059174715;
 Fri, 25 Sep 2020 11:39:34 -0700 (PDT)
Received: from AnsuelXPS (93-39-149-95.ip76.fastwebnet.it. [93.39.149.95])
 by smtp.gmail.com with ESMTPSA id g19sm2208622qka.84.2020.09.25.11.39.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 25 Sep 2020 11:39:33 -0700 (PDT)
From: <ansuelsmth@gmail.com>
To: "'Rob Herring'" <robh+dt@kernel.org>
References: <20200920095724.8251-1-ansuelsmth@gmail.com>
 <20200920095724.8251-4-ansuelsmth@gmail.com>
 <CAL_JsqKhyeh2=pJcpBKkh+s3FM__DY+VoYSYJLRUErrujTLn9A@mail.gmail.com>
In-Reply-To: <CAL_JsqKhyeh2=pJcpBKkh+s3FM__DY+VoYSYJLRUErrujTLn9A@mail.gmail.com>
Subject: RE: [PATCH v3 3/4] of_net: add mac-address-increment support
Date: Fri, 25 Sep 2020 20:39:30 +0200
Message-ID: <00f801d6936b$36551e20$a2ff5a60$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQKM5RC4rgXeqQ5LopEy1q5Nkk2f7gIPbdkoAY21rs6n8B/RMA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_143936_721428_E5D2EC8D 
X-CRM114-Status: GOOD (  22.82  )
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
Cc: 'Andrew Lunn' <andrew@lunn.ch>, 'Vignesh Raghavendra' <vigneshr@ti.com>,
 'Boris Brezillon' <bbrezillon@kernel.org>,
 'Richard Weinberger' <richard@nod.at>, 'Russell King' <linux@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 'netdev' <netdev@vger.kernel.org>,
 'MTD Maling List' <linux-mtd@lists.infradead.org>,
 'Miquel Raynal' <miquel.raynal@bootlin.com>,
 'Jakub Kicinski' <kuba@kernel.org>, 'Frank Rowand' <frowand.list@gmail.com>,
 "'David S. Miller'" <davem@davemloft.net>,
 'Heiner Kallweit' <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Rob Herring <robh+dt@kernel.org>
> Sent: Friday, September 25, 2020 8:24 PM
> To: Ansuel Smith <ansuelsmth@gmail.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>; Richard Weinberger
> <richard@nod.at>; Vignesh Raghavendra <vigneshr@ti.com>; David S.
> Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>;
> Andrew Lunn <andrew@lunn.ch>; Heiner Kallweit
> <hkallweit1@gmail.com>; Russell King <linux@armlinux.org.uk>; Frank
> Rowand <frowand.list@gmail.com>; Boris Brezillon
> <bbrezillon@kernel.org>; MTD Maling List <linux-mtd@lists.infradead.org>;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; netdev
> <netdev@vger.kernel.org>
> Subject: Re: [PATCH v3 3/4] of_net: add mac-address-increment support
> 
> On Sun, Sep 20, 2020 at 3:57 AM Ansuel Smith <ansuelsmth@gmail.com>
> wrote:
> >
> > Lots of embedded devices use the mac-address of other interface
> > extracted from nvmem cells and increments it by one or two. Add two
> > bindings to integrate this and directly use the right mac-address for
> > the interface. Some example are some routers that use the gmac
> > mac-address stored in the art partition and increments it by one for the
> > wifi. mac-address-increment-byte bindings is used to tell what byte of
> > the mac-address has to be increased (if not defined the last byte is
> > increased) and mac-address-increment tells how much the byte decided
> > early has to be increased.
> 
> I'm inclined to say if there's a platform specific way to transform
> MAC addresses, then there should be platform specific code to do that
> which then stuffs the DT using standard properties. Otherwise, we have
> a never ending stream of 'generic' properties to try to handle
> different platforms' cases.
> 
> Rob

I agree about the 'never ending stream'... But I think the increment feature
is not that platform specific. I will quote some number by another patch
that tried to implement the same feature in a different way, [1]

* mtd-mac-address                used 497 times in 357 device tree files
* mtd-mac-address-increment      used  74 times in  58 device tree files
* mtd-mac-address-increment-byte used   1 time  in   1 device tree file

The mtd-mac-address is what this patchset is trying to fix with the nvmem
support. The increment is much more than 74 times since it doesn't count
SoC that have wifi integrated (it's common practice for SoC with integrated
wifi to take the switch mac and use it to set the wifi mac)
Actually what is really specific is the increment-byte that can be dropped
if we really want to.
I still think the increment feature would be very useful to add full support
for mac-address extracted from nvmem cell.

[1] https://patchwork.ozlabs.org/project/netdev/patch/1555445100-30936-1-git-send-email-ynezz@true.cz/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
