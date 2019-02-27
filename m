Return-Path: <SRS0=gTFy=RC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7078C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 22:13:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FAFA20863
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Feb 2019 22:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gby7VDEL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ji6islzh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FAFA20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QZBiiNeejB4zIpYJ4Fo0gWlxjTYrm/qDQ+x0uXvMDPo=; b=Gby7VDELulTL61
	Bt7heaJSkRRzvrI5VQbEzs0gcFlawQouklqMdS6/5xKTHL/1C5CTrakyhHWUhKXZtGiM7jbz22q1x
	39qX6Gg4TX2s9ko4RV9d552iOoKoxf8l5LXQwJ83uC4t4hMUHDPbv2pgDm3lE8JY10cPqXjeWFxI2
	R3WHX1je/yS8cjK0tia6XlTljZmCtq952FqQTZiv7soSOzoqN3uMnwNqeko4iut1T+9LvjHnpHL7Z
	2kjhwoepYbzuPqDqTz5eU70fjTKXLd5kWW61eI8J2Dmcoxf1TRD63YzAUqPtOByL4bvgV5Vpj2BgK
	/F+w7iXIHgTDummTrz1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gz7Ry-0002Ih-J6; Wed, 27 Feb 2019 22:13:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gz7Ru-0002IO-6d
 for linux-mtd@lists.infradead.org; Wed, 27 Feb 2019 22:13:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id t18so19769081wrx.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2019 14:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MXSFr7AR394cRhgzxkjRC/dIrpInQGyBkjNOuhgCNmY=;
 b=ji6islzhOPoVffnEdZj/9+K7soDF57lh8N9gsjABTNomS+TU0EHKmEQjCY2LBpmkHq
 OtHDcsAk0ABZIfr1P1Aq2WUQIVNsWVHJ3Az2BL9mvN35JjRmsiFEm2TbWJU5b8zSURb4
 oBWhhwrQ38hZgwrlZfuTMKmvZtkb3ERNAcDwQl7t2fiApj8bi44DKw9X6ip0oQmyfhcp
 NsYn1u17Qx/ytO5+vIJn0M5tPtZ3p/oJfvknzlkkqp9DFFWGtAnaxSLwtKUJ85YKP2gW
 44/WBlwoJ3YOFYZ8oNx4mwrs0pJbZmbd5BgDiOv7pZFix5HsmBQwi96qMVWm5U7NGNxt
 2MYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MXSFr7AR394cRhgzxkjRC/dIrpInQGyBkjNOuhgCNmY=;
 b=T0atSUBr11J8EPIQ9dxazZ7CBIubqno5waYBJVSqCZZubiDXr7VLLp8QfMHx5Cb60i
 tnqOlFhDIWTT8UlbkJi70gGlLuWag5/M+eVFvypPQWhXEBaI3jLRWsfw0LnOHZx4AVaB
 xSz8QeWKSXz+bIHGbFG/MjGsJ/6NJN7TB/6rK/6TO+SvSQswfOW62t3tIU3XOivO0MUd
 hMFtkU2MwwGvp7Pj2ywKKsc4cRIQj39h8Dsajfz+FUUrJRl1QLVH1r81EVFVDQjOFuVv
 xzd3G6ooi8BQ80BxUwZZRbNOrlLwX+SBoGQCvLcPoGQ43vU62up5PEjEwg0IeuEwi0E2
 vHog==
X-Gm-Message-State: APjAAAUClUhW1z/ecvQ813tjwdM5FglzfDSBEVAJw6ni7OcrslpmEQVB
 l5fekub/nUsSn7YKZmXeb11wS5qwr9BbyATXNoIoVQ==
X-Google-Smtp-Source: APXvYqz2U92FLjaOkSTcnM1/u03JRSxugBWfJj9JAvtBvgyo/GSZhGeiDSsTU2OUzRb4U8VXxIbECdndllPEB4zK3Aw=
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr4160542wrx.203.1551305587754; 
 Wed, 27 Feb 2019 14:13:07 -0800 (PST)
MIME-Version: 1.0
References: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU3sxjVjuPg8NRCBJzRNByM__xFAYdiQo=-ZKXawvZw1yQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 27 Feb 2019 23:12:55 +0100
Message-ID: <CAFLxGvyFgO-OzgrijL_i0Us5=_VbuYTSCBW0EVyC+8HYpnqOfg@mail.gmail.com>
Subject: Re: ubi/ubifs performance comparison on two NAND devices
To: Tim Harvey <tharvey@gateworks.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_141310_270368_8E9FC845 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Feb 27, 2019 at 9:39 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> Greetings,
>
> I've got two embedded boards (IMX6 using gpmi-nand driver) that are
> identical except for the NAND FLASH and am trying to understand why
> I'm seeing a massive performance difference when it comes to ubi and
> ubifs (in particular ubi scanning and UBIFS resizing).
>
> Micron MT29F16G08ADACAH4:
> - page size: 4320 bytes (4096 + 224 bytes)
> - block size: 64 pages (256K + 14K bytes)
> - device size: 16Gb
> - 30ns per-block read
> - 300us per-block program
> - 2.0ms per-block erase
>
> Cypress S34ML16G202BHI000
> - page size: 2176 bytes (2048+128)
> - block size: 64 pages (128K + 8K)
> - device size: 16Gb
> - 25ns per-block read
> - 300us per-block program
> - 3.5ms per-block erase
>
> The parts are relatively close in per-block performance but because
> the Micron has twice the block size I think of it being twice as fast
> on a per-byte basis compared to the Cypress and I do see this relative
> performance when testing read/write/erase both in modern U-Boot and
> latest Linux. What doesn't add up is that the Cypress part takes about
> 7x longer to complete the ubi attach (between 'attaching mtd' and
> 'scanning is finished' and about 100x longer to complete the UBIFS
> free space fixup (between 'start fixing up free space' and 'free space
> fixup complete') performed on the first mount of a ubifs filesystem
> that was created with auto-resize enabled.
>
> Both parts are 2GiB and the ubi scanning on attach in the kernel goes
> from ~4s on Micron to ~28s on Cypress and the UBIFS free space fixup
> goes from 0.5s on Micron to a whopping 56s on Cypress.
>
> Any ideas why would I be seeing this kind of performance difference
> when the raw erase/read/write performance is (both datasheet and Linux
> tests) only 2x slower? Anywhere I can look to improve performance of
> the Cypress part?

Let's focus as first step on UBI attach by scanning. Here UBI reads
the first two
(sub)pages of each block.

Please figure whether in both setup subpages are used or not. Then
measure how long
it takes to read a single page.
Given this numbers we can start with the detective work.

Did you also check what timings both NANDs are using?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
