Return-Path: <SRS0=11ri=LJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2944C48BE5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 17:00:14 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8835661874
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jun 2021 17:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8835661874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jevwqiMVff7lgg25gL4RhHXSQAWu140FVnZo7SiVOT0=; b=OkaJTid3Sy12tl
	Rp8oC+33Br90tD5eMh9AfHlQKlNWjbwWRWBB0j7gwsNksKj7dLU1BypyS0hrA8gSLem2ykYwehP6d
	JtGULNiPz7g8ff7FzG3Z8Db5BS/2PcS7025rz1b+160ebtuPzF8f4bnCH4stbrfDvFNKAbhgPuEs8
	liIhZduY2bRmzfWZeFM14GBxoY7xZIatUm4I7e3xNHHMjSWGj1/CX28Xu9at9u9mJVqtPWSi5s0uc
	eh1S3lM14SSH0Q6hUGLNglwskbXi8o/tmn1fNn/aZm1Z8GHKtc8sI7c3ihausaYTgIiMq+Ue9hNly
	6T2Dsf1uKzOBkr+pPJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltCNq-001XcE-Co; Tue, 15 Jun 2021 16:57:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9Ms-000DwX-Mf
 for linux-mtd@bombadil.infradead.org; Tue, 15 Jun 2021 13:44:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xyi5xIjGsB+0Cu9DQZo1Hv0CUoMX1ylQGxX15iVtOww=; b=T1YooxS33gZSDnI39A0zH9Jqgq
 tzn+2tufJ7aDtReLkAyUjvopW5sM197mDNu2d+e6etKfLTMVc7SH+xCgQY9vaKQ2i4pKDn4n/8BoZ
 G/HFp8xJY49zzHun5ZY9nHCnB3Anp1VJBAzk8ruhymDFh7KylxRGMuSxA+sDeQmOOFpxDoND5/+x8
 KjzTrXdk7ZGV+CL5RK2/WgMfT43viI+0pCCufoSjYh6gKah2KK42EhrFuH/36q7zvM2xype5hAAlb
 /aqmHRFYnj/mMF2T6nSsD9eE+EQ/+vQF997F9358A2HMUW1ifATl9kKegZ6nISEY4u5Hu4RBDI77B
 n4EMCfXw==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt1NK-007MBz-Rj
 for linux-mtd@lists.infradead.org; Tue, 15 Jun 2021 05:12:43 +0000
Received: by mail-ed1-x536.google.com with SMTP id i13so49366678edb.9
 for <linux-mtd@lists.infradead.org>; Mon, 14 Jun 2021 22:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xyi5xIjGsB+0Cu9DQZo1Hv0CUoMX1ylQGxX15iVtOww=;
 b=YMwn+YehcDBZCmZg3ea09v0qT6YTum/D3Me+RAqRLJAugasSdQjiWbQ3kEdNxxDVrZ
 a0X920zWELBqYhNtoYWVfgomCT1D47sGM0X9wgJoqhHZVx5fTdDteDpbno7bSlhBoXjI
 3aGhILHerFW+Ime9guj5FPkCWR/99i779CAj/VZLsJFbR2fiVThj8HV6bEqd1oNGtiSu
 jUksRfAHoCyjB490aTvR+kvgp1o9damiJK2zmij+3DEAFDqGXXQz+WfCBkx9ap1xQHro
 XYk4HN1MDWKzchgiiivS7cxrRJA4cD1Hw699nitQUTacnXZfaleHZ5aczuHUCZ/0Xiwp
 bxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xyi5xIjGsB+0Cu9DQZo1Hv0CUoMX1ylQGxX15iVtOww=;
 b=ILRJmeUUbU0436muS19e/67kksR0ibIc8ogd4yH8JZPRi+uy1wRdQUgxtkIbrrIAAM
 UDcMPbS6fXuGlh1FUt0TAMc1a9ojYCi641XH6iGiKBw67qG7uWdJeuYXs/ygdHpFrxui
 xmyms1TTnQln4s81D8Jhd14MRDderd9TS0s63cTCvsOZDzcrAyudbt/IpeeX2r8MR9np
 Wjrl18/NSEkTRa8/p+5cQr9m3viSDqrUK7vkYykJtK1Mlm4BPjuguV7hP1gvrrANN5FK
 R6r7uPCQE3DRIbpCpT0TArlUln8nqVbhKWyRTbYZ68cbjHSXFXLVEdpxQ3Ux8+WQYbkt
 6m1g==
X-Gm-Message-State: AOAM532sSyWKR0UX+2oXZpOVx9TO66T3wHlhvnkQbvwZM/w0QZMWkqUX
 iIODBfYE1xYXjQTg9BgCUI1LcTpP/Y9UjDfyRz8B32Nz/Ps=
X-Google-Smtp-Source: ABdhPJxN4m823M1pDUBchSwIpcDFs2ZMJrEs2tDgx/y0lzxE6eViASdV4rs6s7+ZKIuNy3f/s8WDKZaFwsZn+hfws1M=
X-Received: by 2002:a05:6402:3134:: with SMTP id
 dd20mr20768437edb.59.1623733960009; 
 Mon, 14 Jun 2021 22:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLi8_PDyxtt+=j8AsX9pwLWcT4LmVWKj+UcyFOnj4RDBzg@mail.gmail.com>
 <dacd3fd3-faf5-9795-1bf9-92b1a237626b@gmail.com>
In-Reply-To: <dacd3fd3-faf5-9795-1bf9-92b1a237626b@gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 15 Jun 2021 10:42:28 +0530
Message-ID: <CAOuPNLjCB2m7+b9CJxqTr-THggs-kTPp=0AX727QJ5CTs5OC0w@mail.gmail.com>
Subject: Re: Kernel 4.14: SQUASHFS error: xz decompression failed, data
 probably corrupt
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel@kvack.org, Phillip Lougher <phillip@squashfs.org.uk>, 
 Sean Nyekjaer <sean@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_061241_771455_222DEAC4 
X-CRM114-Status: GOOD (  17.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jun 2021 at 03:53, Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 6/14/2021 3:39 AM, Pintu Agarwal wrote:
> > Hi All,
> >
> > With Kernel 4.14 we are getting squashfs error during bootup resulting
> > in kernel panic.
> > The details are below:
> > Device: ARM-32 board with Cortex-A7 (Single Core)
> > Storage: NAND Flash 512MiB
> > Kernel Version: 4.14.170 (maybe with some Linaro updates)
> > File system: Simple busybox with systemd (without Android)
> > File system type: UBIFS + SQUASHFS
> > UBI Volumes supported: rootfs (ro), others (rw)
> > -------------------
> >
> > When we try to flash the UBI images and then try to boot the device,
> > we observe the below errors:
>
> Someone in The OpenWrt community seems to have run into this problem,
> possibly on the exact same QCOM SoC than you and came up with the following:
>
> https://forum.openwrt.org/t/patch-squashfs-data-probably-corrupt/70480
>
Thanks!
Yes I have already seen this and even one more.
https://www.programmersought.com/article/31513579159/

But I think these changes are not yet in the mainline right ?

So, I wanted to know which are the exact patches which are already
accepted in mainline ?
Or, is it already mainlined ?

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/fs/squashfs?h=next-20210611
From here, I see that we are only till this:
==> 2018-08-02: Squashfs: Compute expected length from inode size
rather than block length



Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
