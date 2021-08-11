Return-Path: <SRS0=3stn=NC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB99C4338F
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Aug 2021 07:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C1D26056B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Aug 2021 07:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C1D26056B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2KQvn+FGCNtwWCqCLxa5pgIE8BsdFIxgJ8ChNve0do=; b=OViwWxEQFqwENP
	zAq8yhBhIt0mYUXl/0dT23b2eV/7I4KoKqCC+B9oZKOLaLtaFg+suTkeGvSHsoj8ZGlIoP7ezJKYC
	Q8PUEjBa6yXDHhJ7kw3q/okeWvZEAM+ykoxd6oQlmE7fGMS2rln9ZlHQLeXApT6LNyKC6NiGTQHVH
	D9wcDktD1ippLC8KOrw2dUVrJos9CE0ihzcwHgQIDI5Ps4Q84PBN8R/9lE2Y9sEqy+28iSNCzvEK2
	ganYRLh/zQpVZw+bWAQunGxuA2hNc8FDo587CXYnUqYog+yTKOIVGb3L08M4OkuX5Nspuhz01IEbV
	P/JsG5PefGXO4QMhLIDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDioZ-005um9-IM; Wed, 11 Aug 2021 07:38:15 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDioT-005ukw-69
 for linux-mtd@lists.infradead.org; Wed, 11 Aug 2021 07:38:13 +0000
Received: by mail-qt1-x82a.google.com with SMTP id l3so1330397qtk.10
 for <linux-mtd@lists.infradead.org>; Wed, 11 Aug 2021 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KY+zRy9hKXyNf5Kmtc6yl/ru0cuaPUULXfigVpYJwxQ=;
 b=sGY/P6NtAnbm69Lm7vXOE9Jk/dGMYwJgcyYfv0WSY5iC0Q9bkFcLqQcYBDwR9v+C3Z
 ee+eEFLvK0ppuCf3J9hBRv1S3lsmUuxTVGCxmvb1EFA7yrX0Gby+gFFT7V0xHKfRlDSg
 JaiHjzgFMaY2k40bT5RLsOq6wdALAOyM5HICs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KY+zRy9hKXyNf5Kmtc6yl/ru0cuaPUULXfigVpYJwxQ=;
 b=oL2eptBPUwBTFak0LK6LXPnVDHQIKv0CCPlKNfEDixcC2rSJQ+5na4FMJ6/KRlfwYy
 JsP4DLF6cfI4hpr0ldkSqPDWODmeZLl8w3zsGMf30VkxfpKDehGA/UMPkfNeX7SB7u9c
 XrCGveNkIYkV0cgiM46PzhOQDc8ikj0Tt/IjpZxNwPg6S2KgIDigBLhP+ORUl4BAfl+W
 5qjKcPnUOCaPwlF11FrJLLgpeaPaTuMZVuS74vLy0R0hTDKp9/7KMgwImqlm+gNhYEDL
 THq+WAp4kPYyXDrc19vMflOrr0F82zJ05dQHSrJxG3SYr8BBlut0dETM0yVLrOILunX1
 Fj+A==
X-Gm-Message-State: AOAM5316rqoHbzXDL1NOLTWWqL/sFKRNOUmnf62jpQCstvrLxB8SSqO1
 g2s5jag9MIrcWPnKLBqVzfr98WVPQT8eAx3E8T3Nrg==
X-Google-Smtp-Source: ABdhPJwCp4Yz8cVkAjE0jO5SUaGG6LJ3u5iOqFeWzK7H8MEZL9sBdH3FnPiiqXuHFhES8IHwtDyVYn52RaJp6BZfV64=
X-Received: by 2002:a05:622a:387:: with SMTP id
 j7mr29561897qtx.132.1628667485754; 
 Wed, 11 Aug 2021 00:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210617110842.2358461-1-daniel@0x0f.com>
 <20210806220242.4b83237d@xps13>
In-Reply-To: <20210806220242.4b83237d@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 11 Aug 2021 16:37:55 +0900
Message-ID: <CAFr9PXm4FTw5U9pFNoqptZ28M21czDHrbipCOVRcn7uABkEKSQ@mail.gmail.com>
Subject: Re: [RFC PATCH] mtd: spinand: core: Properly fill the OOB area.
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_003809_395790_18E6E6D6 
X-CRM114-Status: GOOD (  14.73  )
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

Hi Miquel,

On Sat, 7 Aug 2021 at 05:02, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> This change looks fine, I'll use spinand->oobbuf instead of databuf +
> offset (will update when applying).

Thanks for looking at this for me. One thing I was worried about is
why the SPI NAND subsystem worked before this change with winbond etc
parts.

You probably don't remember now but I sent a patch to include support
for the longsys foresee parts that have the weird quirk of having no
ECC
data in the OOB so it's all usable by the user except for the bad
block marker and the ECC status bits being next to useless.
I found this issue while trying to validate ubi + my ECC status
decoding worked. [0]

The SPI NAND subsystem in u-boot worked fine as it could create the
ubi formatting on the flash and that would survive reboots but any
blocks written by Linux would be bad on reboot.
When Linux created the ubi format it would work until a reboot as the
correct data was cached in memory then u-boot would complain because
all of the blocks were marked bad.

But winbond parts mounted on the same board, same code etc worked just fine.
I guess the OOB is getting fixed somewhere else for other parts. Maybe
it only happens on the longsys parts because there is no ECC in OOB?

Anyhow I was worried my fix hid some other issue/broke other parts.

Cheers,

Daniel

0 - https://lore.kernel.org/lkml/20210408174922.55c1149f@xps13/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
