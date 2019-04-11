Return-Path: <SRS0=0SW8=SN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CB1C10F13
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 13:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAD47206B7
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Apr 2019 13:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N53z2+RA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuU78GGf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAD47206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WUruoxv40gQvATt3cVJlAdj/bKfzCGVCc7kClSCH8Q=; b=N53z2+RALnxLpR
	pT8P72DK91V3XF+aUtSpL2LKlfkGfPufaPdXUwd5dLff/KrN87mm5qlXqRu+267tXTStr7mE6jEU+
	KRm6yVR6QTkYN0w17s6zbG09xinb0FHNiQ0zDXbb+OO3zBcUsZUpnfYI7DlUd88ZMYmF+pXPtSQOl
	XAWECCLBzenirqUYKdPfTe/NI6Z6gZ9figDqOvgflALeAh8YMIuyROsS2PmtnNFP86KETfReM68KN
	/ofMJg/CTG8Q5V8uhCgfQTk9I8S0prtqfuuV1X4+CV3XI9e6iGR/wq6wGOPLyGjfTU/s/DEVpIO27
	Oe2/UuC7is7eEECqF48w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEZcO-0001JF-46; Thu, 11 Apr 2019 13:19:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEZcG-0001FL-Os; Thu, 11 Apr 2019 13:19:46 +0000
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B60221852;
 Thu, 11 Apr 2019 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554988784;
 bh=INpHV1wMKlIoeJz3WbTdzbh8mNZZOUVi+KYSjvTpPP0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kuU78GGfesa2WDHG1W6yzymAtnGYhpIYwY464F4swuHZ+va8LHpjg9hMFa/EFD8zu
 omnQmMfL8eu1mhWs3JX7ntLLVDCJljxvxNM6p5TwcrCnmGQ65k6NVBylSBgfAImFGQ
 H5e/HnwLT2neBvKd5QXKyDoTgMryN0CqpWzP0PqU=
Received: by mail-qk1-f173.google.com with SMTP id b74so3383665qkg.9;
 Thu, 11 Apr 2019 06:19:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVkg5p0pvzqCG7z5xe9pb1o/x59ORLc5HAIzOw2Zzsx1ubWo6Iw
 HC8XkmTG6x1p0gI/oM4WSPAoPf1QZHQH5xqzWA==
X-Google-Smtp-Source: APXvYqwVKjoo1wElgJ1V1S67QPcYaOH+I4jMtaYrNi1WqIltuN8JOXtzHAlFnrD3dXq0vXnEBus0jtWWw+gzfdyTuCw=
X-Received: by 2002:a37:5805:: with SMTP id m5mr38612974qkb.136.1554988783488; 
 Thu, 11 Apr 2019 06:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <74b8a52ce98b09d7906f988c107793a86c0c5f6b.1554216856.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqL9rOO8jUUVQ5MnD3GCvyyCDPsw=Kd=va3X-rAF60Wkzg@mail.gmail.com>
 <20190403073551.ym7nbqwcdpicwo6e@flea>
In-Reply-To: <20190403073551.ym7nbqwcdpicwo6e@flea>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2019 08:19:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKCky41zrGKNdwrj8i-fburCXx_D+NkZwESUasqNkbMeA@mail.gmail.com>
Message-ID: <CAL_JsqKCky41zrGKNdwrj8i-fburCXx_D+NkZwESUasqNkbMeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: Add YAML schemas for the generic
 NAND options
To: Maxime Ripard <maxime.ripard@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_061945_237751_75521522 
X-CRM114-Status: GOOD (  15.77  )
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

On Wed, Apr 3, 2019 at 2:35 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi Rob,
>
> On Tue, Apr 02, 2019 at 08:20:58PM -0500, Rob Herring wrote:
> > > +      nand-ecc-strength:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 1
> >
> > While I wished this worked, these 2 have to be under 'allOf'.
> > Unfortunately, this will also silently pass validation in json-schema.
>
> Unfortunately, I'm not sure I fully get how the ref system is supposed
> to work yet. Can you elaborate a bit on why we should put the ref and
> whatever constraint we have in an allOf?

TL;DR is that is how sub-classing or extending schemas works.

I think I read something at one point which explained why it doesn't
work without allOf, but couldn't find it. Certainly, it seems like it
should at first.

> Should we do the same in a separate schema that would reference
> another entire schema (like the second patch does with the first
> one)?

That would just split defining the type from the additional
constraints. I prefer to keep the top-level 'allOf' including classes
of devices.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
