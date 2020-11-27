Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8152FC5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 16:33:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B4022228
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 16:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EtU146ik";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQgAv8AQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B4022228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NOZ/Zuj4vGD9jUj0kc31iYWTStnMkdjvPPjENrtWaZA=; b=EtU146iki4g0GVcABYGV6Whnh
	18npDaFOzYOWWGFo1NDoHjJjT+85d0t2cy8nacpIMHKg0Wkh021lWIKv4RCxFDF9Y+VgSrwTDJY1m
	ejibBGGX3mTOvJmbjiYCY0jgecwWWtadTgLTqXIsWlJ8RptAK3+m8zWKqDbZJbuOUHL48BceTLiCu
	3p0cXEROvDaQnALW50vVU6tOG2FV9tQAKLupefOSr/vRrivHPb9F4qn/RZB0Un3ykkLULEjt1sk3c
	sfEtJZidJ7MEvcyKDI3tsBLj7A096uGVPl8nVjm/o77ebcATrki9XvSzMUG+AEf6uaMnG2//d7T8D
	KXhZyALWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kigfU-0006yD-6h; Fri, 27 Nov 2020 16:32:20 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kigfR-0006xQ-Bx
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 16:32:18 +0000
Received: by mail-oi1-x241.google.com with SMTP id d9so6460669oib.3
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2020 08:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yoNHFIpJxAfCNwHv1SmanaFdgxZUkmi7Q2RLHPIcLMM=;
 b=mQgAv8AQ6moiNBtlZmoV2B11KQwi49AaRZV/zUBwOG8ga92FBlmA0mPje0jzCM6uNj
 6TU6HAsXDurpuQg/8Yt1iGFxgZvfDHIz/FWkrCZrhMoc7RSYoPTC29rvYZaeLRWvUrgQ
 pBOBISmGXP0CRZykE7o1TU4EHCRMC1cDh4NUTDcTLX3VOfK1WBnv9bczc3Z263QO3/6e
 LHXKzcWuRUkmKjeu5FWXdDmi1JcUOlO/4bH3ZYMG1rgVHDhF3yKvj5uWGUbuU+RZ9pUk
 1UQN+zKyCY0dVjSWfOWrkL1Vxtkh/tFA5k3KnNkdHQnQ+zVMWsxpAQtjgQVAuu92m8k8
 f4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yoNHFIpJxAfCNwHv1SmanaFdgxZUkmi7Q2RLHPIcLMM=;
 b=uiE3bebyTYmUCWapCpVwjkXklvnHqlSgRq66b5ZNxuKJZuuCkX70gbiR7fwu9Y//pP
 An8FZxYYAzl/q2xlN1DznRNbkfdn1V3kudaCW412DPxZzBmE/A+JiSv+s1i+F5ykN5ed
 tWbURGUbzRflMEgMn9E6K/722oqJrWoV5k7k141TdaiVfaE0gOQBH2G8L1VymrDI78k0
 g5vG4mMbCZDBiM43DRTjbxh2k0MV1YNhhp/jh0SiHEfpi7bJlAiwZ/LRqbXG0MI5HVo5
 Xt41BGVl2tgjqvcue0fmDmqA/THJSa3+VRIW3JdvjwOjUGBJsgC4JrkN6MhOvUBPi1bw
 JEuA==
X-Gm-Message-State: AOAM531Y3e10oQxfGptGOx9oB9Opxjkp5D873/l8u0Kjx6WEuQ0zY9sX
 pqz1GcJCiR7IAoUlmsdFeHnqvpsgO7kJXsEz4Kw=
X-Google-Smtp-Source: ABdhPJw+YDZAAdv/S+pZxHAJMSGhPXsOjhnu/Ldl7txaFIOBqFsvCVsUmwYLyzg8j/Oi3vnwzq3NgSe7Bwkt2tKwViI=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr6115814oic.49.1606494733974; 
 Fri, 27 Nov 2020 08:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20200429165347.48909-1-rminnich@google.com>
 <7171837.EvYhyI6sBW@sven-edge>
In-Reply-To: <7171837.EvYhyI6sBW@sven-edge>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Nov 2020 08:32:02 -0800
Message-ID: <CAP6exYKEN-sQXGxTC1CSzfyuYmbbMPHKEosCP7DciFTLOhAFCQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
To: Sven Eckelmann <sven@narfation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_113217_439304_AF438849 
X-CRM114-Status: GOOD (  26.44  )
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
Cc: Sasha Levin <sashal@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I'm a bit worried about how tricky this starts to get. I'm inclined to
go back to an earlier implementation which used a character that had
not yet been used (iirc I used [] around the PCI ID in a very early
version). What if we used, e.g, a single ! and searched for that? It
need not be !; pick a character. Just something not already in use, as
the ambiguity around which ':' delimits the device has become an
issue, as you show.

Almost nothing in the original patch would change, save the character
being searched for. By using a character we'd never used, we'd avoid
breaking existing usage.

Comments?

On Sat, Nov 21, 2020 at 4:14 PM Sven Eckelmann <sven@narfation.org> wrote:
>
> On Wednesday, 29 April 2020 18:53:47 CET Ronald G. Minnich wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > Looks like some drivers define MTD names with a colon in it, thus
> > making mtdpart= parsing impossible. Let's fix the parser to gracefully
> > handle that case: the last ':' in a partition definition sequence is
> > considered instead of the first one.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ron Minnich <rminnich@google.com>
> > Tested-by: Ron Minnich <rminnich@google.com>
> > ---
> >  drivers/mtd/parsers/cmdlinepart.c | 23 ++++++++++++++++++++---
> >  1 file changed, 20 insertions(+), 3 deletions(-)
>
> This change broke OpenWrt booting on some IPQ40xx devices. Here for example
> the parts of the cmdline which the u-boot on an OpenMesh A62 sets
> automatically:
>
>     root=31:11 mtdparts=spi0.0:256k(0:SBL1),128k(0:MIBIB),384k(0:QSEE),64k(0:CDT),64k(0:DDRPARAMS),64k(0:APPSBLENV),512k(0:APPSBL),64k(0:ART),64k(custom),64k(0:KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive) rootfsname=rootfs rootwait
>
> This is then parsed by newpart as: KEYS),0x002b0000(kernel),0x00c80000(rootfs),15552k(inactive)
>
> And of course, this results in:
>
>     mtd: partition has size 0
>     [...]
>     /dev/root: Can't open blockdev
>     VFS: Cannot open root device "31:11" or unknown-block(31,11): error -6
>     Please append a correct "root=" boot option; here are the available partitions:
>     1f00           32768 mtdblock0
>     (driver?)
>     Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(31,11)
>     CPU1: stopping
>     CPU: 1 PID: 0 Comm:
>
> This affects OpenWrt since the commit d6a9a92e3217 ("kernel: bump 5.4 to
> 5.4.69") because this change was backported to Linux v5.4.69. Reverting
> this change fixes the problem for me.
>
> And if I see it correctly, this is also affecting the kernel (4.14) for
> the OpenWrt 18.06.x + 19.07.x branch because it can also be found in
> there as part of the v4.14.200 release.
>
> Another workaround is to replace the first "(" with a NULL too. See the
> attached patch for the one which I used to fix the OpenWrt bootup.
>
> Kind regards,
>         Sven

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
