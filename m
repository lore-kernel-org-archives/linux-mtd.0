Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A6FC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 18:08:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54A3A64E4D
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 18:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54A3A64E4D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R8JZyv72h6CyabqoRN96LtGMAwsBIY25m/basyVSjIU=; b=pcY3DP4/PIN03CrTwG4du1JE1
	+nvt8QaGCWtHQ5TO7d62rMvDCd62HNTjhPWiapDjVOLtkNgaoDp741Df+GA6BD8YIqEGDUhNNzP1b
	bWAXfAVlBcBnFE7y7oFZIUI5ugxKh8VSZonV9tycjgwgw36ivIhid5MqlisNqNUvXN+AWc35Jgr5U
	hHQ5a7+/CP4615DBdRP2KerVRFWZvkD5ju8zqrurxy0leKF3qYE2FWWWK0pBU2g0+8wKWPnJXwGDt
	NFiMSuHapATHg6Ql3Ll6gsGFJO3a60hep4jpwio2QrNrWHkZ5VIQxZgMu9tmeP98zYW0BCQTKCat0
	keUteQ6SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEc6C-0004BC-2Y; Tue, 23 Feb 2021 18:07:52 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEc69-0004An-V6
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 18:07:50 +0000
Received: by mail-ot1-f43.google.com with SMTP id s107so16500063otb.8
 for <linux-mtd@lists.infradead.org>; Tue, 23 Feb 2021 10:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJC41uj2PpVZYS8ZrypliNOrjVrALIbDACe38HQbpe0=;
 b=Rhk/p3q6KCPiVqazP8KfNrRaJxjQbNjrgLLzRI5Vlp9LudXhu2wlCkO8/AWm1FH6Hu
 7bCpgOgwL7hr2N9kBy5a7egjIKP0A9iyvqEbl6A9j1LPuSBilEiBa9KaGIxEhXBHY53J
 UWvJQCLd6+lV2WQHmWuKJKBFF7/oVNnKJ/Dg/vR6ke2vqpmC4W3h0seXyAxB7P6UBat7
 JNTunEY6bYCdwwJKm10Pmlh0kk228q3+wbjdis9Dm0h4pSFesPt2FwhHygMUQO4CFGuD
 cS0kL4ibTS5LiPz831RZ8/RR6g6Bj4ddjjj7p8vg1bA8foa3H3jRVfRbDVuMwTU+qyjI
 gvZw==
X-Gm-Message-State: AOAM530hcSPgrP91sMLSEm6Zanej7iHiHL9tzcd55vIr+oithVMOrv/V
 A7gEF2eLvyFRnjZWxVD/HoJm8qsAZyLj3Jmh8Xg=
X-Google-Smtp-Source: ABdhPJy39Q4RNfyXx9Fl6r4sFKRG/1VC3igCpLK13X1CD9+hSAxjZ5QPPeB+USoxzPBCi8FwPi3lUkr6goSzhiRZnNY=
X-Received: by 2002:a9d:77d6:: with SMTP id w22mr21544277otl.145.1614103668840; 
 Tue, 23 Feb 2021 10:07:48 -0800 (PST)
MIME-Version: 1.0
References: <1612517808-10010-1-git-send-email-zhengxunli@mxic.com.tw>
 <1612517808-10010-2-git-send-email-zhengxunli@mxic.com.tw>
 <20210205104736.2771074c@xps13> <20210205133404.esqqeokhlp4askpq@ti.com>
 <20210223141344.7ad25831@xps13> <20210223133649.GD5116@sirena.org.uk>
 <20210223152504.jtq4uxfepz7bdxhl@ti.com>
In-Reply-To: <20210223152504.jtq4uxfepz7bdxhl@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Feb 2021 19:07:37 +0100
Message-ID: <CAMuHMdVQUCaiBwdU=KdFOu=D71kYbGqoqp9V3pLsXXE0AAdCog@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: add support for Macronix
 octaflash
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_130750_031843_75D3EDE2 
X-CRM114-Status: GOOD (  20.63  )
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
Cc: "R, Vignesh" <vigneshr@ti.com>, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, zhengxunli <zhengxunli@mxic.com.tw>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Pratyush,

On Tue, Feb 23, 2021 at 4:25 PM Pratyush Yadav <p.yadav@ti.com> wrote:
> On 23/02/21 01:36PM, Mark Brown wrote:
> > On Tue, Feb 23, 2021 at 02:13:44PM +0100, Miquel Raynal wrote:
> > > Pratyush Yadav <p.yadav@ti.com> wrote on Fri, 5 Feb 2021 19:04:04 +0530:
> >
> > > > [0] Since SPI NOR has no way of knowing what speed the controller is
> > > > running at, assume the fastest speed the flash can run at.
> >
> > > Ok, I am not entirely clear about what is available/not available from
> > > the SPI core.
> >
> > > If this is true then I guess we can't do better with the current code
> > > base and this can be improved in the future if needed. So I'm fine with
> > > the current implementation.
> >
> > For normal SPI operations you can set the speed (really, top speed) on a
> > per transfer basis.
>
> To select the optimal number of dummy cycles we need to know what speed
> the controller is running at, not the other way around. The flash would
> always set the top speed to its maximum (say 200 MHz). But if the
> controller is only capable of running at 50 MHz, you will end up wasting
> dummy cycles. I don't see any API to communicate speed from controller
> to flash.

spi_transfer.effective_speed_hz?

If the driver has filled this in (after the first transfer), you can optimize
dummy cycles before doing the next transfer.  Note that effective_speed_hz
might not always be the same, if e.g. the SPI controller shares its parent
clock with another component.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
