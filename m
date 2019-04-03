Return-Path: <SRS0=c1Ix=SF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31934C4360F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 01:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3C1420693
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2019 01:26:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkJOEk55";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wtj5+Ht8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3C1420693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUqaSHRH2UqYhIIwHVX809HQxaJDZmaJ1zm40F0ev4I=; b=nkJOEk55RUFiY8
	e/Aak7Od5VjkG+QVzXD92OMRmq1DE3tbZzNdXOXKi45lLuJhMzO7qWtp3cFlm/7QO6WsmE7QwpDyK
	s9ZdQJf8Y2X0Ufl3+gX250qG1T3sdW80VydTLN/m8YDXYLkT962nx+JkX2Gfia+MfSaZql4j4Q99/
	cyS/sn/j/1lPh+tU57i0NstIrAG02DkYod76SbfyP4Gbq8M434/v5/cxaYotEzf75stG/i3auxQON
	MKyHhSU8EsFR++YqGy9CVmUSV5/qDdQloWlSnkFdXztwMCqvO/g6mqCiC8OmwTZPXZQMQLEga7YB6
	D+o5JaQzOVRF8RpkLwgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBUfU-0005ae-6I; Wed, 03 Apr 2019 01:26:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBUfL-0005Rm-Db; Wed, 03 Apr 2019 01:26:12 +0000
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 055D620830;
 Wed,  3 Apr 2019 01:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554254771;
 bh=+ZpCoyUOHC8kjIRPAqyaFyDVr3ngkkCkbRX3zU8gz44=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wtj5+Ht8U+ncDvsn75OE3nFeZQLycjNG3OiW7SHu4Yp0g9bhpUcdhogstRfQfBu0i
 76fp1l5yQ0ZAkXnvrs9rgsRNsPi4ip4ZNsoNk23l45n/j4d7E5DVI/wSnOQUcPT8jK
 Ld0Qz2gaaBQYb/H5YlVdQeJsuGea1X/pfokob8/U=
Received: by mail-qk1-f175.google.com with SMTP id o129so9165503qke.8;
 Tue, 02 Apr 2019 18:26:10 -0700 (PDT)
X-Gm-Message-State: APjAAAUZ2WWDra6r/yqNtX7DDp0sxU/pBQHNBQXdVL/VI3LIzvT90rqw
 yUUi0WzXhvtJjw34eF7rtT/n/sYKVz2loBR3rg==
X-Google-Smtp-Source: APXvYqwGnWHFit9xZD6mt0D9kSqpBL7SR4SCwogtgmDyjROUur2KouHDAPGmuZk/nWyObq49w29jGaf/ZYBf7nYiQeg=
X-Received: by 2002:a37:5805:: with SMTP id m5mr58653951qkb.136.1554254770272; 
 Tue, 02 Apr 2019 18:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <079279c3713042bdcc76ea27907d5f75bcb483fc.1554216856.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 2 Apr 2019 20:25:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
Message-ID: <CAL_JsqLrdFAhdbjVi0ZoCOM6ajEOdQeLpkSKBsZ90X+UvfkLmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: sunxi-nand: Add YAML schemas
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_182611_476729_E3FEEB61 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Boris Brezillon <boris.brezillon@collabora.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Apr 2, 2019 at 9:54 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Switch the DT binding to a YAML schema to enable the DT validation.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> ---
>
> Changes from v1
>   - Added controller constraints to the generic options
> ---
>  Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 96 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/mtd/sunxi-nand.txt                | 48 +------------------------------------
>  2 files changed, 96 insertions(+), 48 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

Same 'a-f' comment here, but otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

And thanks for being an early adopter. Let me know if you have any
feedback on the schema or pain points.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
