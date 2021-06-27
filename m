Return-Path: <SRS0=QAK/=LV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7939AC48BC2
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jun 2021 13:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3632C61993
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jun 2021 13:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3632C61993
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxcNTV3WpOcBxTHhGUahT/KTCi/eLrHyfpLg4txwAi0=; b=vWzeNz9iFLXK8Q
	FlK4ETKsubCVh95DhQNe5Aen0snjVKoU862B4GmGcpQtIpm1rxj9RHkIPW0RsFoHJxPoefyAO4tYu
	yLW/fCmVyndlpeflLbDUOsYupFIMcVqogA25YjjQCZ42eib7at+ba9i5cgOdzfnGhnyO/ob/7vhKw
	3fqAPZSC7M4TKEjq0uVUcQBf5IKUeQZ6dKpqUnXwq/U8+BmZ/r7DfIG91TJgUSy1ybj+yMkBYDCsP
	Dk0DjqAzl6WbAqgcuPxX/Qiy1q9eNFKinTA5kMfWAPc5lhIxjGOvSwy9ZM3TRABSiKPIt4MNfMjLZ
	lwcUC2neINKtOsUNYaRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxVAG-005dUr-7k; Sun, 27 Jun 2021 13:49:36 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxVAB-005dUK-Q8
 for linux-mtd@lists.infradead.org; Sun, 27 Jun 2021 13:49:34 +0000
Received: by mail-il1-x12d.google.com with SMTP id a7so2625380ilk.10
 for <linux-mtd@lists.infradead.org>; Sun, 27 Jun 2021 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BWGO+itUm6tMgujfJIGgElCIQmjPwoC/qMTdg68ZcXc=;
 b=jSx1jWRNMlAT68tgB7bCsuZqgDYgfiNEwJ1mD2Za+4v4gYkEgHIsfr7NLcl/pPu17E
 sMc7eWOadn89rncqJblRCe2nilMIVe9+Lr0KL+CbAUtDY2ukpo7/iwZ9MCTOworuIwiH
 STBBr6guaR+2aQXcvf7lerOIhVDZWCDmuWp6R4Jv4BwYxFgPZTyv53kg0xQ8/VfTwaJp
 JHRC80ddtc2TbByE27FVpuS/MB4VoLb+XNQQ0kvnqfs1ibZToIoi5tPVhQKdn3uswlkQ
 SW+TyonxdygwCu6jods4Mn3ql5Ei8/OiH53q17/MtCKvNkPl+64lanBnagGZjHi4lnWg
 AD5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BWGO+itUm6tMgujfJIGgElCIQmjPwoC/qMTdg68ZcXc=;
 b=tJZwuDalZsWFAY8xlcg2Gh/dAnsMjTgGQ5JYVmTLt654AbOqEGp+0nydhpwUgFHq+q
 Q7oKmyqdyMcKvFMGz0SZiqIaOr6YJtAO1n8fSmuz0t0TUYAx5RgYUY+A25azZPv0Nwep
 uSVBHkAHGc69cX+6KWzsroJ9HfrwD0v8AMt8xYnalnfYN8NrFaSNkD37nlCyFHvrsuwj
 dhKD4nu7bb7hXD0NOzHH71VOW+bxk52zsF1WQ5YN/KcDjdc4YPnULV6ta3AjKkDRXgGF
 w5I6YxZJnmNqT+B0BaziD5VJeCskyvyPqgaHj0Kj8G0RXkpxieCwGNwlwYS1eh+9TK/W
 GeEQ==
X-Gm-Message-State: AOAM531cYFd4eddb4DvO9MwmJMceEQijLH+96PqyZQIuFEJfRI4YpYic
 jbCmNm8IdEwD2ziFi/Wj8NIIZmbY2gRmL9I3EDY=
X-Google-Smtp-Source: ABdhPJz1Ubb4xI0HYKINaSQPBvAxnz0e8JYIbsgs0KMkjdWkzp48dXCScptKhbn01OC2YzZmtwYq7A6g9xKqrnL9EGY=
X-Received: by 2002:a92:d4c5:: with SMTP id o5mr8968854ilm.306.1624801770256; 
 Sun, 27 Jun 2021 06:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiZL4wXc__+Zx+m7TMjUjNq10tykHow3R9AvCknSNR6bQ@mail.gmail.com>
 <CAOuPNLhoLBwksNt+tJ2=hZr-TGHZgEiu7dgk66BUsraGA16Juw@mail.gmail.com>
 <CAFLxGvw1UoC3whDoQ5w6zfDNe=cLYi278y6vvSadQhOV9MGvTA@mail.gmail.com>
In-Reply-To: <CAFLxGvw1UoC3whDoQ5w6zfDNe=cLYi278y6vvSadQhOV9MGvTA@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Sun, 27 Jun 2021 19:19:18 +0530
Message-ID: <CAOuPNLj4ktYYieOqxd1EGUWt0DZamwQik_jg6cj2ZyqRaL9Amw@mail.gmail.com>
Subject: Re: Query: UBIFS: How to detect empty volumes
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard@nod.at>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_064931_897111_9E589667 
X-CRM114-Status: GOOD (  37.14  )
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

On Sun, 27 Jun 2021 at 14:12, Richard Weinberger
<richard.weinberger@gmail.com> wrote:
>
> On Thu, Jun 24, 2021 at 6:09 PM Pintu Agarwal <pintu.ping@gmail.com> wrote:
> > I have one basic query related to UBIFS volumes on a system with NAND partition.
>
> There is no such thing as a UBIFS volume. Do you mean UBI volumes?
>
Yes I mean the ubi volumes which are created using the ubinize config file.

> > In short, how to detect a particular empty volume inside a system
> > partition while flashing the partition image?
>
> What do you mean by system partition? A MTD partition?
By this I mean the entire UBI partition that contains the magic header "UBI#"
>
> > Suppose I have one big system partition that consists of 4-5 ubi
> > volumes inside it with varying sizes.
> > Lets say:
> > -- System Partition (ubi image)
> >     - rootfs volume (ro, squashfs)
> >     - data volume (rw, ubifs)
> >     - firmware volume (ro, ubifs)
> >     - some-other volume (ro, squashfs)
>
> So by system partition you mean the MTD partition that hosts UBI itself?
>
Yes the entire UBI partition that contains UBI volumes

> > Consider that all these could be flashed together as part of
> > system.ubi image in a single shot from the bootloader.
> > Now, suppose, one of the volume image (say firmware) is missing or
> > remains empty (as you know we can have empty volumes).
> >
> > So, during system image flashing, we wanted to detect if one of the
> > volume (firmware) is empty.
> > Since this is an important volume, so we wanted to detect if this
> > volume is empty/missing we will abort flashing the system partition.
> > As there is no point in booting the system without this partition.
> >
> > So, I am exploring options, how can this be detected ?
>
> Read from the volume after flashing. If you get only 0xFF bytes it is empty.
>
I mean, without flashing the image, is it possible to determine/guess
from the image content/header
 that a volume in the image is empty.
If it is empty then do not allow to flash the image.

> > I mean is there any kind of magic number or header information which
> > we can read to detect a particular empty volume ?
> > Can we get any information from just "system.ubi" image to indicate
> > about the volume information ?
>
> You'll need to perform a proper UBI scan on all blocks.
> If for the sad volume no LEBs have been found it is empty.
>
hmm, this seems reasonable. We have something called
"ubi_scan_partition" that scans for bad blocks, during "ubi_open".
And we also have ubi_find_volume that checks for vtbl record in an
incoming image.
Let me check about the LEB option here.

> > Also it could be possible that 2 or more volumes are empty, but we are
> > only concerned about one particular volume (firmware), so how to
> > detect particular volume ?
>
> I don't understand the use case. Is your image creation process so error prone
> that you can't be sure whether critical parts got included or not?
>
Actually our UBI creation process contains multiple volumes, in which
one volume contains
firmware image, that comes from another subsystem.
So, it requires copying that firmware image manually before building
the etire yocto image.
But, it might be possible that some developer may miss/skip this
firmware copying part, thus
the resulting image may end up is having an empty firmware volume.
However, this firmware volume is an important volume, without which
the modem may not boot up.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
