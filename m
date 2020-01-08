Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108FEC282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 22:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A292053B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 22:44:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QiCY8Ow/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dxzcHW6v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A292053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZstttYrEBRYl7PUhW/zNBQ8bWDluN4j7e2XCpJroB5s=; b=QiCY8Ow/f7zoBj
	PnvU07L3IlfOteSLS77kCGBoz2gXRqWwKIjdbsTa2jHhfdVpO0nFn9LhuSVA6imCMV9cDWSe7zn8z
	6AeJGsW38wQJiGtuibxvEQGB+hZM+j28UWONqhEPiO7neTBCAflVI0yBjggU6BSJ0iMYzaaYfvM+v
	pFUPv2KpgXFt5zS9+foTFDkO3+jaAtkcazveekDFceESiyzL4CkWzwKH6l/cysvYy32/P//b2221n
	lShjXifwNK/hABsZO9ONMZii+ul2C6qf2XayWHsLVjLO/B+ucjWlX6M8LmgYadm5ZvHyaGgSxGR/x
	HjKTA9QKVa1GEeonb50Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipK3V-0006Eb-M0; Wed, 08 Jan 2020 22:44:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipK3S-0006DY-Dg
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 22:43:59 +0000
Received: by mail-wm1-x343.google.com with SMTP id b19so707029wmj.4
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2020 14:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWWZMqPdrpyLM4PNNhJEbDf2OARkgPYBiWJgc0QHlYM=;
 b=dxzcHW6vBEVtIMKz7w6Rq/2EZ7/9WYR4LnbuTZhnSlBG6qiQWEgnncI+US+L0uNiry
 v+LUH4n0j9OpZ6FIaBOusMzf/coHGLczPogtTAK1A/cD9TwKMSZqMLul3oD83Fmgf/Pr
 Kocq+wkGafcAXC/4mdi1kcnnUPqVV/a0UA7VZbUgBakCxMKnK69NKuJBZdhmWCe9gKTK
 sCzOQAZwXDttePRFLgqtYQlhXA0u0VbognfEgIz0RfOYTNw7mQ3CSId5HGEz+AAO90FL
 9QSgTkEHltlAv7FBF1jLlIkRebXNKBlodTj+aYe3+AaBhyem8eX7IlnOXQDAZu1PB/co
 By1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWWZMqPdrpyLM4PNNhJEbDf2OARkgPYBiWJgc0QHlYM=;
 b=kUexCF6WvvVhXWeQmO8dUXBfgLiSgOyxBwvXAQg7+ol7EhWyOu2KNk7Lv+R9XqQ7WP
 ga3ysBfR03DWtys539q/gmkRc6NUp+B72qGRXzy9EpXxEBVW2j6JtGpoB7EY35pd4ric
 iSqK5tYA55+mYy098Hm9fMG/J+A5wMAoHLYxYpS9vs1bMV2seWnc/l1pzih/cyn+8FDw
 4Ex8B+tvYL0d7vj9ZUYwjNICduGIKRyW9CD9HdkBMxUg/j89H5rUiUdKhUqwQN+8D15u
 4DDXa1b6OIKQJWpOAnr0JK0G4nV8nAf0axVTcWk5Oe59dXHun02SSXZCWP0N6WixjhAK
 6foQ==
X-Gm-Message-State: APjAAAVIWwTKeAsMWoUCFK5IYZ8uR1gffYZOgi+10LLpwojtPsOOaHVQ
 K/5T3SCrbOnzx6WW8+wf1IbBR3vanYogzbT+Loc5eg==
X-Google-Smtp-Source: APXvYqyum7X1NjaMw//Cv9KuPI9DU6oxZ/T2dzD1WKak+E1BQ+o6OZ+VovchbVcu0Gl9WY0dXjhnNvKiDO4TsHzzEI4=
X-Received: by 2002:a1c:184:: with SMTP id 126mr914459wmb.127.1578523436957;
 Wed, 08 Jan 2020 14:43:56 -0800 (PST)
MIME-Version: 1.0
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
 <CAAEAJfCfYV6F4L00m=P60BFdENyhY1CsD3yC-jpOx=kKLL88Kw@mail.gmail.com>
In-Reply-To: <CAAEAJfCfYV6F4L00m=P60BFdENyhY1CsD3yC-jpOx=kKLL88Kw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 8 Jan 2020 23:43:45 +0100
Message-ID: <CAFLxGvw8h+pSV5r1PEf1f_R46do3GAri7DcANM5BhNd+oAdUng@mail.gmail.com>
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_144358_492503_758FE775 
X-CRM114-Status: GOOD (  20.74  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Emil Lenngren <emil.lenngren@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Patrick Doyle <wpdster@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Dec 30, 2019 at 6:32 PM Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> Regarding, the "use a initramfs" I've been there, carrying an
> initramfs for the sole purpose of finding the volume with the
> name you want, mounting and pivoting. Looking back,
> I can say this was a big, fat PITA.

It all depends on your tooling. With yocto creating and maintaining
and initramfs is easy.
But maybe I'm a little biased since every single embedded system
I create needs an initramfs due to crypto foo..

> And it's _not_ about boot time or anything like that.
> It's about increasing the number of components
> (in this case, an entire rootfs) that system integrators
> have to maintain, keep track of, and worry about.
>
> I'm not at all surprised hacking a downstream is easier for
> embedded developers, and I'm sorry we didn't see thought
> about this use case back then.
>
> > Is it maybe possible to define both /dev/ubiblock%d_%d and
> > /dev/ubiblock%d_%s at the same time?
>
> Nope, this won't fly.
>
> The sad news is that it's not easy to fix. The patch proposed
> by Patrick is a no-go, because we don't want to increase
> the number of configuration options for something like this.
>
> Configuration options increase the combinations that you
> need to test, and so we try to avoid them as much as possible.
>
> We can't change any default behavior either, as it will
> have an impact on existing systems.
>
> What we _could_ do, is extend the current syntax, passing
> a format string to the kernel. Something like this, provided
> a ubi0_0 volume, named "rootA".
>
> ubi.block=0,0,ubiblock${dev.id}_${vol.id}
>
> would create block device as "/dev/ubiblock0_0".
>
> Where as, ubi.block=0,0,ubiblock${dev.id}${vol.name}
>
> would create block device as "/dev/ubiblock0_rootA".
>
> Knowing Richard's stand in the initramfs camp, I'm sure
> he's eyes are in flames right now :-)
>
> Does this make any sense... or it is pure insanity?

We need to consider also the volume rename case.
If the kernel creates a named ubiblock device we have to keep
the names consistent also across renames.
Again, udev helps here.

That said, I understand that not everyone wants to have an initramfs.
As maintainer I have to be neutral even when I personally don't like a solution.

I'll happily accept such a change if it:
a) is not an ugly hack and/or makes the existing ubi-naming logic worse
b) is is fine by block layer folks and does not violate the Linux device model

Within UBI we can do whatever we want. That's why the whole ubi name
parsing at attach time exists. IMHO doing this in the kernel was a mistake
and we should have enforced an initramfs back then.
ubiblock is a block device stacked ontop of ubi and we have to obey their rules.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
