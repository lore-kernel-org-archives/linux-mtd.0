Return-Path: <SRS0=QAK/=LV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD44CC48BC2
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jun 2021 08:43:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442A661AC0
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Jun 2021 08:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442A661AC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvFv+nktZaj7qgiFtcGwr39FV9AICbF7vk9OhDzE6UE=; b=uYoFjMl+umpnDH
	q4foGhSXLyAZdOkoKXBHt7wyHZm0QUSGSCnvygKaGWZ/IL9Hr19onotDOK/6lGf2Z3L+HjT+J11Uq
	dhhd+fAhezRM1d7HmwzldnEvtSEb4bTwz1SsfUpq5tHtLA6PE3Y3TxOD+U+UJLtaNhyY7on5DUnEH
	U8zyY+JZWGpPoUYihq+5a5tzWwtX3w+Q98HcN+C44txg5RAKRwOPDdJWhw65IvsR7xwPIf6mlorSn
	/N/3sgNT1l/YKNvPh9hYJXCx34i4uK8DiBY+g0jZ7hEJaQy16bxAk+uV34bwSr4V3qaFMUXehLrPN
	U5Zg1xRJWVeJdM+8mY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxQN4-005Mkk-1C; Sun, 27 Jun 2021 08:42:30 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxQMy-005MkL-2A
 for linux-mtd@lists.infradead.org; Sun, 27 Jun 2021 08:42:25 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id p7so4476039qvn.5
 for <linux-mtd@lists.infradead.org>; Sun, 27 Jun 2021 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a61V3I0RkkpncjLGVitOxPP7pgTIYctbNAh6crT1fIc=;
 b=gKew31FjLvxKtF6+77teKgibgLTHgFRU5qg2qWDHmdxmA+nK6/ioIljeTlE2gkljsA
 OltSzDEsciEudxpZD6N6nk19v/b/FDgp7J5Vkqoe5/TPN1fCiViHcp7HPiUnnSFkDz0J
 /oXEuT0FMuwWBPbB6E/hx9HTlFSqRUfJ3DXTUNbMpPkpdRHaTE3rws/aR0OJ3IRy+oqF
 5FokggCbmsr7TxHM3EauIuNZt9/sArkWjZUeD9+vLQaaE42rTq7Z7pJQ32Njj3uOjfdB
 cJTpWSoGEzzV9chvCAX09S17WfJEzbMmYbg37T8nKB4+JHdvh4W7okCIA1yd5mdNG+hQ
 LxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a61V3I0RkkpncjLGVitOxPP7pgTIYctbNAh6crT1fIc=;
 b=kqku2vDC0Hp4SGAW03sNvWBb8b00qgNjBlkceYJxpBKbM+b+Z2f3OBpat5xP4tMxb1
 BgEI4gkwuR1ri+G0QCCdQSXo0kXQOSf2ItMUYyUfhrci+tXO/qEFb4+0m3sm/1ianQrW
 geT8oHWLskpMHnHlsFeeVnaFVB+TCWeoDJSufNikcHesdfzWCVbgYjPMX3HHelNxxwxl
 uaigi+KT5xyG7mnHTxE+kc+bog2wbQErSpzTXWBtca+/Yn+shK6Zk1bAbWGmWxDt8JE7
 3OLuD4ZI2CSH4anU5QoeqLX9qtXoidVa8awBKlnozY+2o1Fb9gZSjP6HU7RAxsR712h6
 wrPQ==
X-Gm-Message-State: AOAM5327S4+58QXugWWxBDL1qIvPbtZ57CNI7kAHGwagutLzzH8+Pe1m
 xUpCi3/J+vxhkd9K7jys+gSInRBXO9IpQviua1w=
X-Google-Smtp-Source: ABdhPJyyeE8ckdqwy4lInSfTvN820ZtsN8ptJ11b7lF7PyF+wWfDVsSd9SrZBO+/1VHcgFifkey80tQxdyaQe1hv/oE=
X-Received: by 2002:a05:6214:c2a:: with SMTP id
 a10mr16518973qvd.60.1624783342077; 
 Sun, 27 Jun 2021 01:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLiZL4wXc__+Zx+m7TMjUjNq10tykHow3R9AvCknSNR6bQ@mail.gmail.com>
 <CAOuPNLhoLBwksNt+tJ2=hZr-TGHZgEiu7dgk66BUsraGA16Juw@mail.gmail.com>
In-Reply-To: <CAOuPNLhoLBwksNt+tJ2=hZr-TGHZgEiu7dgk66BUsraGA16Juw@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 27 Jun 2021 10:42:10 +0200
Message-ID: <CAFLxGvw1UoC3whDoQ5w6zfDNe=cLYi278y6vvSadQhOV9MGvTA@mail.gmail.com>
Subject: Re: Query: UBIFS: How to detect empty volumes
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 Richard Weinberger <richard@nod.at>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>, Sean Nyekjaer <sean@geanix.com>, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_014224_165912_9BB00B8A 
X-CRM114-Status: GOOD (  24.01  )
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

On Thu, Jun 24, 2021 at 6:09 PM Pintu Agarwal <pintu.ping@gmail.com> wrote:
> I have one basic query related to UBIFS volumes on a system with NAND partition.

There is no such thing as a UBIFS volume. Do you mean UBI volumes?

> In short, how to detect a particular empty volume inside a system
> partition while flashing the partition image?

What do you mean by system partition? A MTD partition?

> Suppose I have one big system partition that consists of 4-5 ubi
> volumes inside it with varying sizes.
> Lets say:
> -- System Partition (ubi image)
>     - rootfs volume (ro, squashfs)
>     - data volume (rw, ubifs)
>     - firmware volume (ro, ubifs)
>     - some-other volume (ro, squashfs)

So by system partition you mean the MTD partition that hosts UBI itself?

> Consider that all these could be flashed together as part of
> system.ubi image in a single shot from the bootloader.
> Now, suppose, one of the volume image (say firmware) is missing or
> remains empty (as you know we can have empty volumes).
>
> So, during system image flashing, we wanted to detect if one of the
> volume (firmware) is empty.
> Since this is an important volume, so we wanted to detect if this
> volume is empty/missing we will abort flashing the system partition.
> As there is no point in booting the system without this partition.
>
> So, I am exploring options, how can this be detected ?

Read from the volume after flashing. If you get only 0xFF bytes it is empty.

> I mean is there any kind of magic number or header information which
> we can read to detect a particular empty volume ?
> Can we get any information from just "system.ubi" image to indicate
> about the volume information ?

You'll need to perform a proper UBI scan on all blocks.
If for the sad volume no LEBs have been found it is empty.

> Also it could be possible that 2 or more volumes are empty, but we are
> only concerned about one particular volume (firmware), so how to
> detect particular volume ?

I don't understand the use case. Is your image creation process so error prone
that you can't be sure whether critical parts got included or not?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
