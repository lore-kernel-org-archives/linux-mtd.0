Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61400C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 15:59:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8983613C5
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 15:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8983613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bBZmzUvx+KSPbgoTIOU3yb5mOeUAos0sD95iYK/k8B8=; b=HvIav6d7vXqAWjGnkZkyld788
	FPk+wN9BsLjYAIfnJoO8OaucLr58d33iI7BG9LUteNApBlDghAM8yFWQFt31Cy7uTc8P0aJXZKcxj
	Hsj2yqQHt9sjuC2S6Z1GQ88zAW4ddbHbJS5+gI9Kww9QGmAoT1FsOGd9AmNrXEWbIFPMsZFZF9WAT
	mDaQd31i9Tyy1BgkbsjSG29fArNouQChuzK266OeU0k+6b909W0MzLhL5yXk5k6viXkltkPwa2OcY
	E/pSka7aDxDGnmljOQKzHN91mOszRAaQ/PgoQTXP7d6WhqsRbGA/bM0wBVsmCTXpvOFIkm7eNoRcb
	67f5J+NIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbmaT-003nWT-Ae; Wed, 28 Apr 2021 15:58:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmaP-003nWF-8z
 for linux-mtd@desiato.infradead.org; Wed, 28 Apr 2021 15:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qPInnfOFiDjbUtus8UESi4go/lSMf8a+ZIcwDEWf+8g=; b=44BhepoF8jaL/Zld6w7ohbrYIQ
 vzB5egjk5kMg0Yybv0SlM8a7iYtCDa+IXkm4IaM0bVPHrVIO52pv9m6mZ/+WnufMHBBuyGf9wGr0U
 Y+4p5R7eG6p82Z/45WyouIucO/p3pLwa9Ikn3+p2KhEqkS5202Pu/X3jgHL3hha5DGa6SBRNnaMH6
 rUaXAo/d9qExpriJpimVmu5hjRsO+s2cg/tz/luDUXEvK0vJ6bg2VwbzQ2WvMpZuUxMR6qrMKBY5G
 snpXTz9boqrpw8ro3r/8HJvyI4tWaHSr8VYnP0xl5iwI6DR6TQdwSbMNTJgAF08sFjmsfT5m2jERd
 WQOsoTaQ==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbmaM-00005w-BA
 for linux-mtd@lists.infradead.org; Wed, 28 Apr 2021 15:58:47 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id
 p12-20020a4a2f0c0000b02901ecdbb16887so7046670oop.5
 for <linux-mtd@lists.infradead.org>; Wed, 28 Apr 2021 08:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qPInnfOFiDjbUtus8UESi4go/lSMf8a+ZIcwDEWf+8g=;
 b=erKh+epsO63scyXMwNrUCjVdg/KQNgN3/PTHy6uqKZ3wbcqM0VUrGjnRNq+l7DYi0Y
 E2O+zrnAZTSNsco+1E7M2Cp5PmhNpFyWwJY3WtK9tmbUCQ75/b6b/Zuk6qLXYBH0Flte
 srY6xHKDoXmmK99E2QiNxPCf72uFfhw1xCHx+XQTd9FKDuizkzGvCYWhARywzQ44EhMf
 zQ57DjH2RHlSfdCkr1baAiXGaWSV8xv+NJqZVIljCLMTwoPHkXMYvGBROrGK4CPh0Oq9
 HhADVMBQR7Y6k9HwI/ojdt8l0En48Hv4ZxHcyoIzIaOYia+NMzLno/uK4V86IJjmb+hh
 hICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qPInnfOFiDjbUtus8UESi4go/lSMf8a+ZIcwDEWf+8g=;
 b=fB5AyvxxeBehPqJ4NLH3os4baLlb37NLp6b+FqXActr4V6Unyf2XfstfKukTCWWtHI
 xBfZPRXLyrvTsM+YnFuZsPldS+L+XDHGVsiSluxR4eJxHzBN3verxS95y0wpEjKYRNQx
 T8eYU59hFy5wG+5byRBU3TTDfE/orjqTcbghlmVTgZZtrlfMiOTLZ7dAWCntxRa5d/pH
 BSM7w2TFncrV4C54FHVHxLtOD+p568M/d/rEU3PgFAu55Byfz2YqJO/8rldqpU2XkCSm
 CATVdqCSGKhYpZKMlZBmwUb5DmAxZbeVpalfkmIgVi22bVS7ALDOshPn0ogmJ8Dx3Aka
 C+tg==
X-Gm-Message-State: AOAM533lh5vgw0+AaYcHZJGvNbiRkZ648s7RkPOqPGIPN2PWF6WYmRYj
 ImGBbyS0k4/5WNSbhXuH4Gf3NGjDuWh8Ugi9vtP7jw==
X-Google-Smtp-Source: ABdhPJzY2bBmiTk7UScRg+Ew+/mwUg7rioHvkVTYx5RrU19N+q7hRblmsHXhiSDyJt7D/QuDmKwCvetLwCWaeZ+xVgE=
X-Received: by 2002:a4a:db7d:: with SMTP id o29mr23054498ood.45.1619625523100; 
 Wed, 28 Apr 2021 08:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210428052725.530939-1-awill@google.com>
 <dd33cf8d3a78d60eebbb6f1be90cb7d3@walle.cc>
 <CACqsJN-Vernbp5kJc+qZ6nUW50xPWz_9DznLDjtTu=btSra09Q@mail.gmail.com>
 <5e23722b1c7d6716c404667a3c5bfbff@walle.cc>
In-Reply-To: <5e23722b1c7d6716c404667a3c5bfbff@walle.cc>
From: Alexander Williams <awill@google.com>
Date: Wed, 28 Apr 2021 08:58:32 -0700
Message-ID: <CACqsJN_OmEGO+Dgd-xYtX0RXaPcaj4zBL3PqB8=w9TAO_a04Hg@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Export SFDP access to sysfs
To: Michael Walle <michael@walle.cc>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_085846_422496_1A6E652B 
X-CRM114-Status: GOOD (  23.92  )
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

On Wed, Apr 28, 2021 at 8:51 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2021-04-28 17:37, schrieb Alexander Williams:
> > On Wed, Apr 28, 2021 at 12:58 AM Michael Walle <michael@walle.cc>
> > wrote:
> >>
> >> Hi Alexander,
> >>
> >> Am 2021-04-28 07:27, schrieb Alexander Williams:
> >> > Add the ability to specify a technology-specific attribute_group, and
> >> > expose the SFDP through spi-nor's private group. This enables user
> >> > space
> >> > to have full access to the contents of the SFDP, so all information is
> >> > available without regard for whether the kernel supports parsing it.
> >>
> >> Please see:
> >> https://lore.kernel.org/linux-mtd/20210318092406.5340-1-michael@walle.cc/
> >
> > Thanks for the pointer! Sorry I didn't see that patch series already:
> > My search
> > skills need some work... In any case, there's no good reason for me to
> > duplicate
> > work.
> >
> > I should probably comment on that series directly, but I'll note that
> > one thing
> > I tried to do with the sysfs attributes here was avoid racing with user
> > space.
> > The uevent is suppressed until all the related files are created in
> > sysfs. See
> > http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/
> > for
> > Greg's explanation of a scenario.
>
> Sure, reviews and remarks are always welcome. Btw. what is patch 2/3 and
> 3/3?
> I couldn't find it on the LKML.

There are none. I goofed and forgot to fix up the subject line. The two commits
that followed merely added quick-and-dirty SFDP support to intel-spi.c to enable
testing on one of the platforms I had lying around.

--Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
