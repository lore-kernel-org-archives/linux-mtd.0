Return-Path: <SRS0=zrsi=EJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23225C2D0A3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 08:20:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD67A206E3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2020 08:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YyPGpeS7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e69uPPkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD67A206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4tddykYAayPWt4b0WxAT6HVcjJk3cE18fz1tvrRtTmI=; b=YyPGpeS7Xs5OOLCa0IjVIB9GK
	BY+Wio3sD78+s58hjKRGYGfiCT4arvlAzGtyScJtB1y4qft6XInazWNWH8InKpqgalk5zX+ArvbOi
	hCR/gveGXOF1uvftmAsa0X8D42ewOTN9fpRTgsVVR37Z49nDObixaWIpfwXBwBCNkdqLcpcZ+w91c
	Q5/GzP6wz7yO70WlUSGVnypf52QQLPG5Q5RzXxZnmHRAkS5O5z8EgUFJc2Lup63ruRMnbHQlVDOQH
	R5ruukjFVOVsAldZra45fT8Qj2qZJTZltdAdqzrYMnH4mpRswMnFU3lMnDHDY7dYl35xcE2YYLV4S
	hUE63xwQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZrXb-0000td-MQ; Tue, 03 Nov 2020 08:19:43 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZrXV-0000s7-QS
 for linux-mtd@lists.infradead.org; Tue, 03 Nov 2020 08:19:40 +0000
Received: by mail-qt1-x842.google.com with SMTP id j62so11107217qtd.0
 for <linux-mtd@lists.infradead.org>; Tue, 03 Nov 2020 00:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NPgo2qOWjgcjboUoKNHW+zYp+3nBFcGU86OMBoAl2S0=;
 b=e69uPPkVMvWIDl14/oGixxtLwXf77h1hXs9yD5j9e3wQXBdrJM/x1j1/9x0+a60TiC
 u0sssfA98X5LNvZLI/kGmplGplvU0pEsEJbJ1AyCKcVnfp5unsd6fvJRXD5fMsEoXFAZ
 r39uA2aTQ1mvGHfucy0bDrzbAAUbbnZfMAv7pAnFvdzIpNkvwL4w8OKjweE3Lvj55lyi
 MJmhIcfCdUxsWpuMn8pwB6PpqdB+90qOUw4NvVkueDILzslX/8Wk9bAG7DraoFknq4+q
 oAVFO/pt6IGDTPxNR0lMwB34rZ13PqO8RDciX+QZFs8s1RItJTu91VVVGhI2DslmziiI
 9fiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NPgo2qOWjgcjboUoKNHW+zYp+3nBFcGU86OMBoAl2S0=;
 b=tLZQCcsuhRdqnVPXfdZPtXkmFVRGUKG5HxkqnXNvkoY28uvRe8GKfjQtLlBRLmjARY
 4iRxf/P8bE1pttjlg0YonRAYKcaLQNNHaezR7SqqzF+N+bmzO5YyKAhw4f43+PSV8zvI
 Syokzinx9wtCbjg2W7lJdn1wa5pxBQ84tDye2VRTSLqWAWYiaJfqi2/x/Da2PzYX7O6I
 o1u58uohLl0BQ7why1m4Jn3RJb5GydxeEhC5El9W4EuGLAcnyZncYjqH91m3J0EL87FV
 fwikjlv64MUUvetLu/NYGODfOqsMvtdXNUDuWwWE/s1IzXqBaR3mxZnQqmLtaBvHinCX
 dPew==
X-Gm-Message-State: AOAM532nc62rvEaUlpUtWPb5rEXQwq0xVozMxkb85uo7AlU8sDo1+B1r
 CJh/SQKScjoI4eExGm4NcsTXQ/9XF7k+3Uund6Y=
X-Google-Smtp-Source: ABdhPJxRPkC+uMi5QD61S1iwmbusTRCGB6OCd3OFHjJ2WsdXmQj+bIpFI6e12K8OZ1QhZpf8PRy9J6Mo+LxhdGfxRdc=
X-Received: by 2002:ac8:5ac1:: with SMTP id d1mr16443241qtd.82.1604391574530; 
 Tue, 03 Nov 2020 00:19:34 -0800 (PST)
MIME-Version: 1.0
References: <20200630130438.141649-1-houtao1@huawei.com>
 <e2a0ddaa-402f-a4e0-ed0a-74ce7d620722@huawei.com>
 <CAFLxGvxHiFuHpwUOWxbf7djG0__-Z9qB5eG1oBYwGzY3FKSDGA@mail.gmail.com>
 <b3b82f88-c87e-6077-7189-f2f84a2739c2@huawei.com>
In-Reply-To: <b3b82f88-c87e-6077-7189-f2f84a2739c2@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 3 Nov 2020 09:19:23 +0100
Message-ID: <CAFLxGvwVK1M6FLnkL3xbSzAx5iTWmt2j5uOxJXhWKoep16kA8Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] fixes for ubifs xattr operations
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_031939_492058_818778B0 
X-CRM114-Status: GOOD (  18.46  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 3:04 AM Hou Tao <houtao1@huawei.com> wrote:
>
> Hi,
>
> On 2020/11/1 5:10, Richard Weinberger wrote:
> > Tao,
> >
> > On Fri, Oct 23, 2020 at 9:25 AM Hou Tao <houtao1@huawei.com> wrote:
> >>
> >> Hi Richard,
> >>
> >> I have written two xfstest cases [1] for these fixes three months ago, could you please
> >> check whether the proposed solution is OK ?
> >
> > Thanks for your time and reminding me about this issue!
> > I agree that this is a problem but I'm not sure whether the lockless
> > solution is the right path to go.
> > DId you try the locking approach?
> >
> Yes. Adding an extra lock for xattr ops also works. I will post a V2 soon.

Sounds promising!
Btw. you think of an extra rw lock because host->ui_mutex is too cause
grained and
would block xattr parallel read operations?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
