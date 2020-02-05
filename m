Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018D2C35249
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 07:58:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0EEE20702
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 07:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8KmVBUK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qcDXG3Ok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0EEE20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uoUz4AluRZI+QJSjZiPVC0fI3DGimKX8djW67LQ7my4=; b=Q8KmVBUKqazVJZ
	kdvJ+pfY6wENV/z5j7HRnS+XRZNlil0b2L7HP/SvIHjOJ3mhS/P3mm27ZD6uHV1BAFjBx9Eir99AS
	s3HTKbffogMK6fUuTpQbcOFY/2tirJ3qyEahoxrEi7xI9GEBRXdHUEp9ZTbOFLXoxhF1AUqlcmNh6
	xnlcPIuLaAizpCRQ/sljHQmwRcsqruw/oA3OQ4eP3mCEhpwmum89oJ3REF9hKnp9t0Mj8/KvV788z
	D9Mp4iFSCTsQh4YJ7z8XTMrbZGD8sQMHFxSLHpfIEE8v0X9dxDRcGFrKTzIhJOk5b4SIk+zYVo0Io
	ROOuwsir5/+sRdJSvRmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izFZc-0001iA-0X; Wed, 05 Feb 2020 07:58:12 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izFZZ-0001hH-IK
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 07:58:11 +0000
Received: by mail-io1-xd2f.google.com with SMTP id s6so1063345iol.9
 for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2020 23:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QFhVLTjOwKS+r2kppzMBwCdkHt7bCPipyZl3pY14DKs=;
 b=qcDXG3Okv6G0zUjisf9fFjV7gxZBtjW3u3S8F2Cteoz8sHzG2K/hFqysJ+qUEyUWfj
 MUgwXCRgxXZ1sAfBzcOsKkCaqwKxuN8UVKsg5DhIP3g3yXUoKiq9szI/ujjn/XjOIlx2
 RpQP8qb6sQbKPCAVEO6weT3cT4JcVPBxHl5pK/pm6kMnixd8TwDre50NB0OxYiuKVAH8
 9UbmAt/cquTMNlcevi9I5vP69TShc+Xqj/G5BdwRmsFfuliDDtodaiNikgFNerqor2ff
 teX+ydyZQzg06GwCiDLyMWk8oO02AoMORN15mBV43FMfzqKZ9CXsC0advOtDaUwSsln5
 4tNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QFhVLTjOwKS+r2kppzMBwCdkHt7bCPipyZl3pY14DKs=;
 b=hEoSN1tZBpJo9Tyn4EPg2zmmlQAukUf0rZAeKQnvWTy+QabLRhZZy6mbLkdbqRV5zA
 VczSLI4kNvOBtbobQBxdia+bq59BL0iaE/oSTnibN2neq2WrM1BKfpTCS7zGkyg+oZsr
 TZSSA3s1vBPdGoxC5Oh0NwHcB6kD/To0YBKFDgRImbibh5NCDU9N92A2VSSc+7Gm4pgz
 ++o+Arov9HD+FdIqcUBeSnV2IeczCJyttOY/25noRAv+ZVT3XbpY6roYYR3iM7/AolQF
 4Wu9p5xrFIexIAdLeCKiBCoCD6ivfyARaOtTGZ3lrtkkD5zBiwBX0tVqhwYymePXqOFA
 +I0A==
X-Gm-Message-State: APjAAAUvAflbOwq5k7d8+K/FEIKCHOu4NqBwGj9uDVJZI1lUFB10BFkL
 OYBvcWsIvhAXnq0FZnAB4kcHR5h1VMIjtTlKNW2zS/ZI9to=
X-Google-Smtp-Source: APXvYqzzyIf7pbD9VHsTfFWLvFenKryoWU6CQxD7RMFMDXnwtWdDLh7/1BTs9sxjOn15e41UlnRetyQZdNBSEYxlxx4=
X-Received: by 2002:a6b:d912:: with SMTP id r18mr25850975ioc.306.1580889485335; 
 Tue, 04 Feb 2020 23:58:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ad5:5d0d:0:0:0:0:0 with HTTP;
 Tue, 4 Feb 2020 23:58:04 -0800 (PST)
In-Reply-To: <CALLGbR+8osorMEWUXW5BED=_Y1uYDDdheY+QNXp4hG_AwLgeyw@mail.gmail.com>
References: <CAA=hcWTmUFRnxH7XY_040QG0oiUErJ84-mZQ3Zbfaaj7-TMFtQ@mail.gmail.com>
 <CALLGbR+8osorMEWUXW5BED=_Y1uYDDdheY+QNXp4hG_AwLgeyw@mail.gmail.com>
From: JH <jupiter.hce@gmail.com>
Date: Wed, 5 Feb 2020 18:58:04 +1100
Message-ID: <CAA=hcWSkzctHUgLDsC3w4-CRhPOwWNptFOv2Ef3SQ_c68iYEgw@mail.gmail.com>
Subject: Re: Corruped NAND booting for all devices
To: Steve deRosier <derosier@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_235809_629799_7F4AEFB5 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Steve,

On 2/5/20, Steve deRosier <derosier@gmail.com> wrote:
> I've been following your questions on both this list and the
> linux-wireless one. May I recommend some reading:
> http://www.linux-mtd.infradead.org/doc/nand.html
>
> It isn't clear what filesystem you're using, though I recall from an
> earlier email you weren't running UBIFS. But in the log I do see UBIFS
> messages. In any case, based on your descriptions, I strongly suspect
> NAND bitflips are causing your filesystem corruptions, and you likely
> don't have the correct settings for the ECC strength as necessary for
> your NAND. Or maybe you're not flashing images correctly and the ECC
> info is getting lost.  Or maybe you're writing logs and such to flash
> and you're filing up the filesystem. Maybe your extents aren't correct
> and one filesystem overwrites another. Unfortunately, you've got your
> system so cobbled up with user-space prettiness in your log output
> that you're obscuring the kernel log output that would help you
> diagnose the problems.

Yes, the file system is UBIFS, the different revision of test units
have been running for many months, they were relative stable until now
for a new revision of hardware. Like you found, we have lots of
problems in low level when running the new revision of hardware. As
both firmware and hardware evolved, the first rational thing is to
narrow down the source of the problem.

I appreciate all your advice which are very helpful and valid, the
hardware was designed by other contractors, there is limited tools and
equipment for software guy to debug the hardware. Hardware contractors
firmly ruled out any issues in hardware, they pointed finger to
software image built from Yocto to cause the NAND corruption. The
Yocto image contains all open sources, Linux kernel, connman, MTD,
ofono, etc, so I try to figure out if there are limitations and
constrains to turn the device power off while it may be in the middle
of erasing pages, would that cause the NAND flash corrupted? Or we
might not set up things properly?

I posted message here to gather information from your experiences and
to take your advice to figure out in what circumstances that the NAND
corruption could be occurred. So we could  mitigate the issues as much
as possible.

As you said, there are so many things in software and hardware could
cause the NAND corruption, what I am particular interested in is if so
called a bad Yocto image could cause the NAND corruption, let's make
it clear I am not talking about software problems in that image, I am
talking about Yocto build system problem which generated a bad image.
I thought, if you built a bad image, it would not be able to run at
first time, if an image to run NAND booting well for several days,
what that the Yocto build system could to make the image corrupted the
NAND  late like a virus? It does not make sense to me, but I could be
wrong.

Thank you.

Kind regards,

- jh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
