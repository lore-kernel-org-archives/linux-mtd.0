Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B4CC072A2
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Nov 2023 03:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlH1YLmyLadvoKvviPMdkKZZIenFn3dYO4WtlUgm/VU=; b=nbHRUv4L9GXBcx
	FlEpR9XkdD38Dw3XrEH2UwxLKj2bVceZKvlzI7xKQPO69gOnBf37cnNOTcSz5vGO+pq+B6gq695ez
	z9yv2g0y9qaNXp7R/alzIUhzfL6AvfeNZ6qM21hcEPTPgyTYw1/gpqE5rFEAqzzJ75Lvi0jXP2lT/
	zm01l+3r514UfC/LDxM5WdkPMm6WAmeMfAEdWK7MOGXqLfQ2dnT1kp0zZT49C12T2iNgKUIeoi32B
	YhgPRi/buDr3MH/dec2hmSvhtzPETMNElUGzgRITtxdcQLt3yfGIbA8GdFQCcREi9+UoNISn19qnP
	Ud7SG/1uR5PwuVgZmUfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5diE-000Wdm-1k;
	Wed, 22 Nov 2023 03:15:38 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5di8-000WdJ-1m
	for linux-mtd@lists.infradead.org;
	Wed, 22 Nov 2023 03:15:34 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-280200949c3so4296361a91.0
        for <linux-mtd@lists.infradead.org>; Tue, 21 Nov 2023 19:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700622931; x=1701227731; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RgGrxpGqTLv7jAkfksGY9SMNFqCKrYpyf7jGHnowoAU=;
        b=icJbxOuuzNBFH7VKfCSwXU9/UcCuzBfy/yc/C3vpRqB4bk12sA2AsPih2AaP3x7wu3
         UNgdH+ZCrJTQDolBGmx/mORvhLKUG9ciDvLA0IV4a5XV1JyVVzik68xRarBwbQ3X5/ls
         2cd/BwwHxq0HtxaOvrGgXClsq4hwlxSUCWj9ZKzj22KM+oKwgmRW9ZoW24Gnr9WWDV1z
         08nu3nXHFRYm8XWmfqcIRzgI6ZAnP5w52Y44bpVtc6XDqYh3WHFa5kvymLNsBMMArQZu
         9oSSDhEIwnUJWRIWNo+pfNpjjIUoioAdQsSnlKGRSoltZmpAL+HTs6+pGcq67YOWsY0N
         IVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700622931; x=1701227731;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgGrxpGqTLv7jAkfksGY9SMNFqCKrYpyf7jGHnowoAU=;
        b=oQWuDcTHomcOrSDHIGZP8JVlDQqV1ODz8AQiOOLijT+BblLQydksg7oZ2yT7st6RLi
         6fUAEW1FlrWPWQqL9tAwb5sZjvNFnRoK51irhae2XScJChba1jSdZCrk0dnPs05ScDqH
         /7lobvU/vhtX4z1Z+ptQ3g8x0bfouyWtc74G48V9BCjR4mU4NkXeU//lxGdbcEvxUU06
         WA9z7P8V3Tf5636vJHDRp8gdpXwPc6TOhGO4ZG0zw0GnDbZg8cAaX+gPyEvfaPJY6bkg
         mudB3DyfY0M8T2ymbavITo0oqGhvQBYnGhp1jp9Yrp7AcibwnZC+L/HG9TwPraUYy4Bk
         OKiA==
X-Gm-Message-State: AOJu0Yz19c5um2o+7+6VFc9r1LXPXuFOPRmd2+NUKeHV+qcgtyRpoGI5
	3wg82HIoZ/rJjDdOiqu3Puh5wnLtG/ZUB7B5XoE=
X-Google-Smtp-Source: AGHT+IHYX44vvCxgMYK+tLa362hVaneq7Ye23bAHNe8nRNF/Hjnj6RLHhgRecIc4Oop0JkLNfRlwqKYqtP0EkYtqqz4=
X-Received: by 2002:a17:90b:4a03:b0:27d:c35:7f3 with SMTP id
 kk3-20020a17090b4a0300b0027d0c3507f3mr1300709pjb.8.1700622931435; Tue, 21 Nov
 2023 19:15:31 -0800 (PST)
MIME-Version: 1.0
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-7-jaimeliao.tw@gmail.com> <8eba400c77127b0df74d2a336561a49d@walle.cc>
 <CAAQoYRkw5hUONJ32sGKxgv5XtO24Vc6=KojankTG73u5E7jPBw@mail.gmail.com>
 <844becc9c6fde66c4d60a621b5462998@walle.cc> <fb66cdb7-e89e-47a0-96ef-022a512ceebb@linaro.org>
In-Reply-To: <fb66cdb7-e89e-47a0-96ef-022a512ceebb@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 22 Nov 2023 11:15:18 +0800
Message-ID: <CAAQoYRnYVsyQD6iSP7nugxa9F7xUGZ49FNExf_SyyxjVdq3AvQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org, pratyush@kernel.org, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_191532_613130_1AFB9FF8 
X-CRM114-Status: GOOD (  16.37  )
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

Hi

>
>
>
> On 11/21/23 08:51, Michael Walle wrote:
> > Hi Jaime,
> >
> > [please keep the CC list in replies].
> >
> >>> and sometimes incorrect. Therefore, at least drop it and just list the
> >>> IDs.
> >> Could I know patch 6/6 only or patch 5/6 should remove name as well?
> >
> > I'd say yes. Tudor? Pratyush? New flash additions without names?
>
> Why do you need a flash addition in the first place? Haven't we agreed
> that we'll apply the vendor fixup based on the manufacturer ID?
>
> Anyway, flash additions without names is fine by me.
>
> Cheers,
> ta
> >
> > As, mentioned last time, for OF we might introduce an of_compatible
> > (thats then ABI) - or - we can use the numeric ID in the device tree,
> > as it's already used for PHY IDs or PCI IDs.
> >
> > Jaime, could you try to use
> >
> > /* Apply vendor fixups */
> > { .id = SNOR_ID(0xc2) }
I have validate some flash without "name" and looks good.
But I got some log with (null) like below:

SPI-NOR SPI0.0: (null) (32768 Kbytes)

and

zynq> cat jedec_id
c2943c
zynq> cat manufacturer
macronix
zynq> cat partname
(null)

Is this result acceptable to everyone?

> >
> > -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
