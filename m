Return-Path: <SRS0=tHFz=4P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C566C4BA24
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 07:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA9920578
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Feb 2020 07:50:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtZsEdNF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ185W0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA9920578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v+z0i40FM1w+K4My3lih3ybWsuWYutMcwpfQgvzROr8=; b=YtZsEdNFgLd2+y
	+/4M25MJV4A3G659nVdc4YggiWlef9r3DqhdEz2DfuB28I3P3ac9Z94xIb79lt9B0Mcu5YZWTDMy0
	UBL67D5slq8yB2sLjk6+94Wv5jsswntMc+i9QU7Bp0BmVmv6uaIeaWlKl0wE6+LceLzm7Qfi5CTnl
	F1m3T9QuXWNU83V4838rFgHSd8/XzDT9FXmqdz3JpAJhjpdOdib5lYBMo6bdGQBXYRWyi20IfrbCZ
	Zju4g/znKBY0i6T7NTYKhMrTDQ7vg0hePn92QnUg7bIMkKZspIUHqHd1M2rICpO2IDXH28M/7R42I
	IPgejzbdwGxq051jCk/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7DwL-0000mp-TR; Thu, 27 Feb 2020 07:50:37 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7DwJ-0000m6-0I
 for linux-mtd@lists.infradead.org; Thu, 27 Feb 2020 07:50:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id m16so2009237wrx.11
 for <linux-mtd@lists.infradead.org>; Wed, 26 Feb 2020 23:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7TN5H6ajW+MVZRODlxyODgjS8CY5XOEP7Ya5NZlv6i4=;
 b=KQ185W0JWITw2EgHzUK62GfcHeAt9TIX8NqpryVqmlCYnKD92zZCyOqprd2fo+wlWF
 ZIUD95rz//ErCTL+zvYJLSm8gtzkOU6Jbhh/FJdn9q0Y2FMPviXgVrB4YW2WCFr6nYVI
 Emv/n9hbuvZFyKTEEMqHI/9CP+7SlCqGRz8HR/mayupVkWWd5wSGPdLROuhK1Cx17drd
 qfMJLI9CzBn+52tMmY5uvdN+Wf+VUOegiERaVuXmhum+cvBx7QlvLLkdA6xOz5k5iqYR
 BO59jcHh+3ZJC5QSBgj84KSa/1QxBPIbBmk7UqNlybHqvx20xNvzsNJNv/R+J9xPkgYN
 DPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7TN5H6ajW+MVZRODlxyODgjS8CY5XOEP7Ya5NZlv6i4=;
 b=n/E5M3FkqkBzxLRW1DCLKeBxQuGlEE35aF7ExUR6gnMasXgR52dPF/v1FTPX2FB5js
 MhT93BwnBgkIQU8VrXN5oAPwD1L7Qxx3QhknSP/DDRKKyFa9FH8iP/edfRVYneU10l6k
 DIrYal0yN56mms7chX4JcjXYqJI+PFa7KGtGnFBDB4Xr/nDG6BZD7tKBR/5DgK4C4n3p
 cEZ2ukxd4aS6KXHYTYJuJxSVaIvgV/8sgc3/W1pDe8PHMtivn+l19TeQG6EuAmry+yog
 zXj++ksu6t/Jar/ygqWEn6yusyOTXF2G1z0AQgvCv3BBQVRvIjI2SX0Qkv1G0NcqhBxP
 XAHA==
X-Gm-Message-State: APjAAAX0hSWFUMxg8W1Z9HzmnuyJi+T31CI9gJileZ5n/6gDE6bJAWgz
 B9B1ubmncEE6wyDiLDtmSZkpF05vIxQX5OhLSig=
X-Google-Smtp-Source: APXvYqwECg8ccEWwfxkCaZCm5edpWkv0ptL1DAYY9LQILjUOEt58/AOI/AMH3tX6aKNlLgoKBLIzo+WAhcMo8LPi96w=
X-Received: by 2002:adf:dccb:: with SMTP id x11mr3207743wrm.214.1582789832629; 
 Wed, 26 Feb 2020 23:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20200113145622.18357-1-arne.edholm@axis.com>
 <764e1e6b-f6c4-dd45-cc7f-1adc557cb5e3@axis.com>
In-Reply-To: <764e1e6b-f6c4-dd45-cc7f-1adc557cb5e3@axis.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 27 Feb 2020 08:50:21 +0100
Message-ID: <CAFLxGvw_8EAZHUf=D+2bUpGqeQvR7TOUQQQ=4Ovk2ChzV38cNQ@mail.gmail.com>
Subject: Re: [PATCH] ubi: Select fastmap anchor PEBs considering wear level
 rules
To: Arne Edholm <arne.edholm@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_235035_047123_ADD0B303 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: "richard@nod.at" <richard@nod.at>, kernel <kernel@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Arne,

On Tue, Feb 18, 2020 at 3:00 PM Arne Edholm <arne.edholm@axis.com> wrote:
>
> Hi Richard,
>
> On 1/13/20 3:56 PM, Arne Edholm wrote:
> > There is a risk that the fastmap anchor PEB is alternating between
> > just two PEBs, the current anchor and the previous anchor that was just
> > deleted. As the fastmap pools gets the first take on free PEBs, the
> > pools may leave no free PEBs to be selected as the new anchor,
> > resulting in the two PEBs alternating behaviour. If the anchor PEBs gets
> > a high erase count the PEBs will not be used by the pools but remain in
> > ubi->free, even more increasing the likelihood they will be used as
> > anchors.
> >
> > Getting stuck using only a couple of PEBs continuously will result in an
> > uneven wear, eventually leading to failure.
> >
> > To fix this:
> >
> > - Choose the fastmap anchor when the most free PEBs are available. This is
> >   during rebuilding of the fastmap pools, after the unused pool PEBs are
> >   added to ubi->free but before the pools are populated again from the
> >   free PEBs. Also reserve an additional second best PEB as a candidate
> >   for the next time the fast map anchor is updated. If a better PEB is
> >   found the next time the fast map anchor is updated, the candidate is
> >   made available for building the pools.
> >
> > - Enable anchor move within the anchor area again as it is useful for
> >   distributing wear.
> >
> > - The anchor candidate for the next fastmap update is the most suited free
> >   PEB. Check this PEB's erase count during wear leveling. If the wear
> >   leveling limit is exceeded, the PEB is considered unsuitable for now. As
> >   all other non used anchor area PEBs should be even worse, free up the
> >   used anchor area PEB with the lowest erase count.
> >
> > Signed-off-by: Arne Edholm <arne.edholm@axis.com>
> Do you have any comments on this suggestion?

Thank you for working on this. On first sight what you describe makes sense
but I need to verify it first. Fastmap is tricky. ;-\
Maybe we even can have a xfstests test for it.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
