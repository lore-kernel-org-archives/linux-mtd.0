Return-Path: <SRS0=DhJx=CW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0751EC433E2
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 18:40:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 338DD2151B
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2020 18:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aUVvzidz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uWpnYqMm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 338DD2151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F2y98ijQG4AC0EvU+d59JNuL1s7Sb295eRTOdWz0dHM=; b=aUVvzidzxOsxt2nhSFxjn/Gsl
	Rg1iiXpQfdkQV47DfTCwhbKaeW0O744lpOZETUoCuIpepYobmwkt9hFIFeqh7YsMkJO84dI/7boWo
	YonLaKhtgYglxOXrSY7t41t6XkmNGgXc5QeNviAdQY7MPlIeH+kJXyEAyoeb85bIubsbpbagHyahf
	eh4sapRwgUn+3rTesEdJC618AhqOF5goCd8+xfikzyqnfIkMh9f7ON2lUaMSXrvuk8U0Zj38FJ5iU
	CLpjZsIFlcdBYt2+dLsEW0Dn4cVG1XRH9dsVKCYvazlzx3RbaGSwlvnYCp2QgeLh6ZFU4i8UalI/h
	t383PStCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHWv3-0002O5-HZ; Sun, 13 Sep 2020 18:40:09 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHWv1-0002Nc-Cl
 for linux-mtd@lists.infradead.org; Sun, 13 Sep 2020 18:40:08 +0000
Received: by mail-qk1-x744.google.com with SMTP id d20so14910533qka.5
 for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2020 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K8ubMUZDeeKR9nMv2dJn/qnSOG8J0zmmqr6tWo71S1Q=;
 b=uWpnYqMmRwbT1cbVOA3uSB9aiNhLiGNKSfR3OmWJcSe8xYfTNqrg3yQuC1EAwDbIm4
 w5fNm4PE54LRJAiukAQfvQBQrJt65BaE3Ln0IXBFDHeObOtA3VV66Mg1HIcBWPbcELgC
 j1tnmKy5qoVvw3X6G3q1fbGQy9+DYHfBDC+dR+7QTHEor8srv/dX5Wj3pb2gSgVT0VfD
 5dVnmunz7B/UB4yuQEoZ7R/qbSWyQL4blWohA62Mg7Q/EadasHPqofXJra4txBDLyykm
 Jf+ZVM/4XFqTjdYXSVBhxmP1eKBxj4al8g2Gv0uvM/48rxHMTOLiyTOo5f+z9m51vH9A
 TU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K8ubMUZDeeKR9nMv2dJn/qnSOG8J0zmmqr6tWo71S1Q=;
 b=Oj8N72bfWdUOPtis18OQt63t1ecF5zlMmzA7YxVAraccuMxSfVGG1WgoYA5v3HdxLg
 n4ZLEPBcqSBEqEKUqVotJT3ZDLWHkWTVi0uIDlHb36cn6nvJZsyV5QqCGw5JK6AyfOf6
 RHYKiGXoqQjO9ld2+4CVC5YgMez1ikOOSUh3vDbzf9BdsnP1hJ69jAEV8KlKCkAkJgeh
 qP5DOEQVI3UQUsnjiSGUBM3pJayYb174yCbSmJfILOYyY2vnCuGclNemIKDAcrauwyYe
 XBJmHaT2QoBAOgGjrAVEO3U0TVDTKlX1fPu8JsvrB3SiqYGTGgRT5dxUUzy7boEJZ4bH
 VVHA==
X-Gm-Message-State: AOAM531b1nddAJuvZpY0yTl3lXBDmfQJ/XC9qhEjBJttgsY6d7zhhu7+
 nSHALzIIO7D5S8f4yZp1lICytSpZInEJeZqk+Sc=
X-Google-Smtp-Source: ABdhPJz2nR8dyQeiqPb44/9pqa7J3ZE9ait6L7YKmea4APll3PekOjSXhvIRmzdXDOVHVAjs7Px8QpYXm2d9bR8AMc4=
X-Received: by 2002:a37:474c:: with SMTP id u73mr10364919qka.45.1600022401427; 
 Sun, 13 Sep 2020 11:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200828033250.910168-1-chengzhihao1@huawei.com>
 <CAFLxGvwzTiDDLaN3Q5BSa2+7cwxBooeJuHSrgNPaM9=ONBLTkg@mail.gmail.com>
In-Reply-To: <CAFLxGvwzTiDDLaN3Q5BSa2+7cwxBooeJuHSrgNPaM9=ONBLTkg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Sep 2020 20:39:50 +0200
Message-ID: <CAFLxGvx1a7wGWJGhNvW5w3acGysEnuYbpJ_v=wOLpubB47=BKA@mail.gmail.com>
Subject: Re: [PATCH] ubifs: setflags: Don't show error message when
 vfs_ioc_setflags_prepare() fails
To: Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_144007_442480_3F19FB85 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 "zhangyi \(F\)" <yi.zhang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Aug 30, 2020 at 9:23 PM Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Fri, Aug 28, 2020 at 5:33 AM Zhihao Cheng <chengzhihao1@huawei.com> wrote:
> >
> > Following process will trigger ubifs_err:
> >   1. useradd -m freg                                        (Under root)
> >   2. cd /home/freg && mkdir mp                              (Under freg)
> >   3. mount -t ubifs /dev/ubi0_0 /home/freg/mp               (Under root)
> >   4. cd /home/freg && echo 123 > mp/a                       (Under root)
> >   5. cd mp && chown freg a && chgrp freg a && chmod 777 a   (Under root)
> >   6. chattr +i a                                            (Under freg)
> >
> > UBIFS error (ubi0:0 pid 1723): ubifs_ioctl [ubifs]: can't modify inode
> > 65 attributes
> > chattr: Operation not permitted while setting flags on a
> >
> > This is not an UBIFS problem, it was caused by task priviliage checking
> > on file operations. Remove error message printing from kernel just like
> > other filesystems (eg. ext4), since we already have enough information
> > from userspace tools.
> >
> > Signed-off-by: Zhihao Cheng <chengzhihao1@huawei.com>
> > ---
> >  fs/ubifs/ioctl.c | 1 -
> >  1 file changed, 1 deletion(-)
>
> Makes sense, thanks for fixing!

Applied to fixes.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
