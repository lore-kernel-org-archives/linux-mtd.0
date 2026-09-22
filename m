Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06FDC982FD
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2026 02:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egIeErPUq4nTggDxRBjQn0n7hQaGFJFNoZF/1Xu8MJg=; b=PwxavjW4FNAQyo
	nAqEpjxn5HJT+XX2GiyzPL1+zV9FgX0w7qxMnYzzhUU+qwbzW5AGKYpjvxvbIFJb0MjQpaH7HDjsj
	qk1NNvNROtrerk4FUEmRRUdYpvrQu6tXMpKw5uUKSuZaB99MFpWxR08HcRfC8YTljUlIl5Vi6YU3a
	negUvejf5+gVdVI6ITVKkm9Xj7YnZQw9AVblk7xYj3umNpzL9YJPBkebeHRgJX0RYTsSxKR0pCxu8
	pBSUIXxdiGZpyfCkSEaumIKt9bhUQhYPOEeA4dIRfN8qJz0qlc6nKlki5meyGU4XQe03M8s4EULzq
	Q3a1JL2tnfKbu5n7879A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qbl-000000041u2-20Da;
	Tue, 22 Sep 2026 02:51:49 +0000
Received: from mail-yx2-x0f.google.com ([2607:f8b0:4864:41::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8qbi-000000041tD-3hWU
	for linux-mtd@lists.infradead.org;
	Tue, 22 Sep 2026 02:51:47 +0000
Received: by mail-yx2-x0f.google.com with SMTP id 00721157ae682-895353e9051so32576147b3.0
        for <linux-mtd@lists.infradead.org>; Mon, 21 Sep 2026 19:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790045505; cv=none;
        d=google.com; s=arc-20260327;
        b=THdGIMw7NsgXNZfIde5lOZngrSRzeLYtAepeOwu3d/aDtRllWW2/NwE07pM3QrFCU4
         6i15Wa7+pZF6UPxOr8nohdigeoKpQIlgMaVeqZijfp7QRU5Ah6OSnO/9T9C+Fi7HvFH7
         Fqsj8NBmKskLqVjx8Sak4lgrCNsJABAW9EnuqbWOE2mOZzVKV08gQHNTWGPAWjaPCM2D
         aKM1y3RvgesAieSz8fgqqi1ojvXKh8//z5+0A36YMNQNBw5iKDK6LSbjEOBi8zROafZ7
         m86qMvF3dp+ljzNVrgFd6k/KwSy5nOYUz2xD2A7iqEjJdMsviNHA4o8bNCh0KHD2wHmG
         9i/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DC37hLz+Eyp/AOht/Mn4hvJpHHJG9yS4sKZLRKsXmYU=;
        fh=pRK+M7d67SlPbvwdNJU6ck+jlVYo8gKsgGW7QTncOfc=;
        b=UptoGI7bXFZiXf5CUyuJty7WV/DFtGZAPepWt8FWYDX7gE4q24W2QHHiVa6hwTXBlM
         QJjL8vryaLiyEN3pcb8It/6QJ3TgYg0jsNpAjbDK0ivNH+4H/YmGwphfO6T9B5fYDLUx
         kNv62uA9o/Jqln7BT+vHSFGI+MnLu0gEjIZ+cWvFrY9LA79b5URYZsrha7vY/faLR2py
         S01Ji33R3NaGYsmj8r8ZDRHAqd+vlZK3c2DpFOjIIInZfvL4QfJIiy/2diqRGh9DqaOa
         P2PxLQOkKAJzqwHa9px7qA0sgcoxjuLI+R73O3asy0+8Th227r8AOBp+RaUoo+MOOLug
         GbGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045505; x=1790650305; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DC37hLz+Eyp/AOht/Mn4hvJpHHJG9yS4sKZLRKsXmYU=;
        b=Tthc9CSijiJHVvCRZ+sIqE2fUlK5YzapEQpDvlH7o0PifyheoIJHIuOV3SsZKHd3eR
         Guo7awThWYttlXv27clxTXZvR9nN7xcmRuu0Otiu3De1iLVrwrVBEZQJGTUQLgtB1p9k
         DsAEvKgg1X8JDZQLJMmfwvrnkfxnWjoZQDEPdPwKV0/yHMFf/JNzO1x/Mn/K6cerFejv
         k1d4jtapyWOnq8jAUjaeTvzZrrw1zBeLfleZshO29qUz/cfBFVyEu4NjTB126sxAsabG
         BwyedE6xh4WQQuqx10h2fGYUGEx8zvpVCXJAO8T8ZkAL4hNNyvYNPYUg6VcDQvWOEHGI
         Qe+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045505; x=1790650305;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DC37hLz+Eyp/AOht/Mn4hvJpHHJG9yS4sKZLRKsXmYU=;
        b=HXGyZbfnWWp0NqRQa5zPMiuZLBqH5qBGpVoGq0RHlzbmpmxb1VmVlxZpBVy9Oi9vvc
         qE9Fkp3hLNvmX+WJ/myQPhq3wgPwihPqc9VmLR460LjXEL74Cw2JVxWpzk+QWkiMVBkl
         9uJ8ZAAMr7kRq2IBedT21yhZcIdIvVnQcjl9QTkNGeWBY5ph/ktwyetMPvCPGn0NA2IL
         QZjcPQ9PPJN2Nng5EBIjNasotQxgDKj5xXHNTRmDdLBHEbXTBhIa6fyoZHLmzFMtBO3i
         54RgVLzp7/YEsYjpIZvpL0vXnxWwdkRvK3zH71hKGj0wkg3uCli9f6rVMAb0+sx9xckp
         9MaA==
X-Forwarded-Encrypted: i=1; AKwUvBx5Dm50XmoWA75wuzuwkK7VePZqvdZrCST/ALkf+XtHp7FXrtMuqqR3S/vUYOeXe5LqAD+Lv4yQbZM=@lists.infradead.org
X-Gm-Message-State: AFuF++n/8Fhq8R86EgsSuN3eT/vmdN1VbLw5NBabZriYDJpcgH/FG1nS
	56vbPzWnfrrxsrbDJTTpyrMAJ2lLeKfDjVxcXkQGKkpKvbvPkg1wjglFCIywmf+0hO1G56fAfZr
	sd8hzHCPG2l5/A2KxKXY2v8YyTHBDYFw=
X-Gm-Gg: AYBFou0tlPuXgf+1f24c3TRFabfG/pQj3PG32B98onNMHak0LPAXaqzvUw8ViCwx/a+
	IKTiF3bagMZKJHYepisMmVreQoXcEeloU45M0yx52eeedhRN/d+oO2m4H+ar147Cpl+q01pg37u
	coUr0j5SR0gfYOyRizzY9Yj/DvkXNnv55xoSjdhEbZ6gIoQjizhPBCG2f5WFl/byRxANABm+bfR
	0qUbGrtpfN4dLJLB35xhvW1F3d2LNezlM/KaZX4p2NKOIpA9zUKayRWzpo6i7eArnvnVBZIboKK
	cLSgztgREeAorNuiCg43ghnSYRanP90oic/Ss/qaQDHMJ9R2y92uaa+CQQ==
X-Received: by 2002:a05:690e:1241:b0:672:bfb4:5f4c with SMTP id
 956f58d0204a3-672bfb46f1dmr1042907d50.101.1790045505504; Mon, 21 Sep 2026
 19:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260915163407.2487869-1-lgs201920130244@gmail.com> <arFJDKtpHSmxkhVG@quoll>
In-Reply-To: <arFJDKtpHSmxkhVG@quoll>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 10:51:32 +0800
X-Gm-Features: AcwNN1VLwtCaM3Xy2OnZ5t0yp926pSurVM_42Ia3AlykAbM73ddOrECv-XxjPlc
Message-ID: <CANUHTR-pX7NrnehBT_p41oAd05jdbcnuLvmLfFE2nfQ1zqbWTQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: intel: fix OF node reference leak
To: krzk@kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, stable@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_195146_942053_A4F08BF7 
X-CRM114-Status: GOOD (  30.96  )
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

Hi Krzysztof,

Thank you for your feedback.

On Mon, 21 Sept 2026 at 23:11, <krzk@kernel.org> wrote:
>
>
> On Wed, 16 Sep 2026 00:34:07 +0800, Guangshuo Li wrote:
> > ebu_nand_probe() gets a reference to the NAND chip node with
> > of_get_next_child(). The probe failure paths release the reference with
> > of_node_put(), but the successful probe path keeps it for the lifetime
> > of the device and ebu_nand_remove() never drops it.
> >
> > As a result, each bind/unbind cycle leaks a reference to the NAND chip
> > device node.
> >
> > Drop the reference in ebu_nand_remove() after the NAND teardown using
> > the flash node stored in the NAND chip.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: bfc618fcc3f1 ("mtd: rawnand: intel: Read the chip-select line from the correct OF node")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/intel-nand-controller.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
>
> You sent multiple independent patches, to multiple independent
> subsystems. The amount of these patches clearly suggest this was
> AI generated and most likely not tested.
>
> More importantly, you sent all this work without properly organizing
> relevant patches into patchsets. This makes reviewing difficult
> and might cause multiple reviewers to address the same issue.
> Replying to the entire set is impossible and requires handling each
> patch independently, instead of applying or discarding the set.
> Maintainers also won't see the bigger picture of your work. Quite
> worrying.
>
> This is on the verge of hostile patch: bomb us with so many
> contributions, we won't be able to handle them in efficient manner,
> like responding ONCE to ask you to slow down.  Considering all this
> is untested and LLM generated, I have even more doubts whether this
> should be considered for review.
>
> Please read kernel documentation BEFORE posting more work. It will
> explain you how to identify subsystems, how to organize your work per
> subsystem, how to document usage of LLM and how what you should not
> do if this was posted in a good faith.
>
> Best regards,
> Krzysztof
>
>
>

I would like to clarify that these patches were manually reviewed and
audited by us; they were not simply generated and submitted by an LLM.
However, I understand why the recent submission pattern may have given
that impression. We sent too many patches in a short period of time,
and we also failed to respond to some discussions in a timely manner,
which made the situation look worse.

Many of the recent patches, especially the v2 revisions, are
corrections and improvements based on previous review feedback rather
than completely new untested changes. That said, we recognize that the
way we submitted them increased the burden on maintainers and
reviewers.

We apologize for the pressure this caused to the community. We will be
more careful about organizing patches by subsystem, preparing proper
patchsets, and following the kernel contribution guidelines before
sending future work.

Thank you again for pointing this out.

Best regards,
Guangshuo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
