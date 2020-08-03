Return-Path: <SRS0=IhQK=BN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0F8C433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:18:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AEFA206D7
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Aug 2020 13:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eO9yqVX4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="Pb+02f+l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AEFA206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7oVtOz6Q14wQle+ccaC0RaTxSDVyIKMLG1JgamvvvBA=; b=eO9yqVX4NhFU7x+45CG87+P33
	wJ7K6A215OaBE1jZH86sxNy8XIailrfQX3vJLWHOKJmC7TD+o8AvbFLz6DK1f2jpCWYROrrCV1jWG
	LX/P5Avdt/gj4dE3eXt/jtfiVrW1mW7Bb+4iVV4GDyZ+BI61aIlii+J7Kf7GrIeBZGyrUV/Xjyh1a
	4OUJzsTV1T6KV30OGK2Lepp+g8cq0jOQD32BZ+yPlJ/w3o1wbyPFj6QF1e6mQRdAedXbazaA2xQi5
	aiclU0i3x+6mqisdFTz3Kcks2lIoOXl9SpDXusg99z//xvfwti1m6pI6cC8mSZgpIQ5AVY07fk9GP
	EcvjgzTcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2aM4-0002c6-CD; Mon, 03 Aug 2020 13:18:16 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2aM1-0002bQ-7n
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2020 13:18:14 +0000
Received: by mail-qk1-x744.google.com with SMTP id x69so35058365qkb.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Aug 2020 06:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZcGSsHeP5e+40JMga9CZxbgjB55gpH983rZr/StcFAo=;
 b=Pb+02f+lDwuPKfIgC7YpTTAr50AWdc6glnECFDurbxg4pSS3SjHUTXxXX3wN+Hprr/
 n1J0MOvStjeeMjEG19RtlI2OLIfbaif/JPVlVcVjlup8AWCPXVek+TkWEHvodvhoh+q4
 X/tQfzPDPAVwtECIcLoMry+52bo6Ms36g536J0ASbYh1mV+fjLxA3etISDxPvxFnqxAO
 HVvyLWrRyJKHQu4A3ic+p9o3Na0Aw22MdRVvJJwAhNXXLW34+8BQz0QDdVfRscAm51gE
 sjqCGCvG9FBMpyFF+fQWOpvSutGu+5NNFokSkYcXZ/VNEe47VCVNNrcy8DYPqs8hwUOk
 U+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZcGSsHeP5e+40JMga9CZxbgjB55gpH983rZr/StcFAo=;
 b=cG29dRDWSy+KIVWd/dr2l3SQkO1a9xGzCu39ub6Qd6CFcB+VNaNCFD8M6kvQJZZ5J7
 TeMa/dprJz/LlwYtjnPbUsKhhh0/dLkRG1ld8iCt4SKqh1epnBlOUrX9CqPC1A8Cge06
 HaD+wyXGZQyyLLj+N+Hxr53lHtJ7mCldmFkFP2k7pzGv4MxcTAHL/byjHgE6H5WfmL5f
 akR3KMuhWBYjPDAf0zPEDG9Z2hejd5VdkfZEqdbF04VbCfcuR6GPx4RHAQtXHwy/Ny+7
 oCdLSB+yQvkO04BcNLNw6Y+d0n+5vCI1K1n3VIQMvB2UB87tHf6f2jOH4Hi/ozDqpLwV
 b8nw==
X-Gm-Message-State: AOAM533H/V6VCV2ZrLLqUM/GKkp54WLSijrH0Fs5Q70UXgVDdbECvDPg
 etwg5sgnsmY4LYvExO5tGzi9ChO6QcGJvnxfB2Dh27mE
X-Google-Smtp-Source: ABdhPJzV2OSdSL38md1inZlV4Js8tyGX4S/yZviIwNc+fjhKkgbH+HYlmRqOKQnU9+4FgORa4568bHLOB4JkhcQMMe8=
X-Received: by 2002:a37:278d:: with SMTP id
 n135mr15719786qkn.486.1596460691093; 
 Mon, 03 Aug 2020 06:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200724212853.11601-1-daniel.gutson@eclypsium.com>
 <20200803095720.GC1375436@lahna.fi.intel.com>
 <CAD2FfiFt6=OueX3E0g2ckPU+7F69yCmM0+bzF_6UD1sd4E_k_A@mail.gmail.com>
 <20200803102711.GK1375436@lahna.fi.intel.com>
 <CAFmMkTHSjQZJNzvUzLHHJ7sUTVX4BV6TwB=P8EO-HNk_cv8RKg@mail.gmail.com>
 <20200803130532.GY1375436@lahna.fi.intel.com>
In-Reply-To: <20200803130532.GY1375436@lahna.fi.intel.com>
From: Daniel Gutson <daniel@eclypsium.com>
Date: Mon, 3 Aug 2020 10:17:59 -0300
Message-ID: <CAFmMkTH8TpezraD2d3_rpaPt+hoO3gpJrRPs56-aGHupm6iNtQ@mail.gmail.com>
Subject: Re: [PATCH] Module argument to control whether intel-spi-pci attempts
 to turn the SPI flash chip writeable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_091813_381939_03827EAA 
X-CRM114-Status: GOOD (  22.23  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Richard Hughes <hughsient@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 10:06 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Mon, Aug 03, 2020 at 09:58:23AM -0300, Daniel Gutson wrote:
> > On Mon, Aug 3, 2020 at 7:27 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > >
> > > On Mon, Aug 03, 2020 at 11:18:12AM +0100, Richard Hughes wrote:
> > > > On Mon, 3 Aug 2020 at 10:57, Mika Westerberg
> > > > <mika.westerberg@linux.intel.com> wrote:
> > > > > I think instead of this we should simply make it so that the driver
> > > > > never tries to make the chip writable.
> > > >
> > > > I think this is a good idea, but I wasn't sure if it was an acceptable
> > > > behaviour change. Should the driver still try to set BCR_WPD when
> > > > writing an image (i.e. defer the setting of write enable until later),
> > > > or just not set the BCR register at all? I think your last comment was
> > > > the latter, but wanted to check.
> > >
> > > I would say not set it at all. I think it was (my) mistake to set it in
> > > the first place.
> >
> > Do you want me to remove the module parameter from intel-spi too and
> > do the same?
>
> No, I think that should still be left there. Then by default it is
> read-only and you can only enable writing if the BIOS allows it and that
> the user actually requested it.

OK. Patch heading your way in 1h.



-- 
Daniel Gutson
Argentina Site Director
Enginieering Director
Eclypsium

Below The Surface: Get the latest threat research and insights on
firmware and supply chain threats from the research team at Eclypsium.
https://eclypsium.com/research/#threatreport

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
