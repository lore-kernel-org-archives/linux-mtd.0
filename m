Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD31FC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 07:00:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6FC207E8
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 07:00:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWNJCIlv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irjmK0pg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6FC207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWuwtGtQQ6T8BZAkY9jartcgTltPNlvIDr8nb2yESZw=; b=WWNJCIlvlMKU7D
	Rgp6UaUQpTyPwErMiHxYJkJitj8MqaPBb+QJJJF3mgUUWu51inhMwEpAyxyzbrMwJEnJ8DlNORDW9
	AEHi+dCZHAX13RH9QXLniyZnuF9Sqn2FbE07JgnJI6Xvn846o9rW3Dya15exkxgih5z/rcojF8F8M
	wNRdFsHNWiTJCzcpNeiGUflvWpg4dedYjuW2Gh/5t1bnRFm1XUBytKclsbA1UaUOEA+wGfAznEX+Y
	TqfN+yfKXqaKt7tJpfKXOqhUnO58ue+uvDHbGioh5eXmkBEGUKA+z6BTyf18X0MXHZ81aTmK7make
	4neeqrbmyEWdk98LZBgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeCWL-0006wQ-VF; Thu, 28 May 2020 07:00:05 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeCWJ-0006EX-0V
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 07:00:04 +0000
Received: by mail-qv1-xf36.google.com with SMTP id v15so12457019qvr.8
 for <linux-mtd@lists.infradead.org>; Thu, 28 May 2020 00:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bkP6W2XZVCYEB4qte0IPa6X4kZhn97Iduh+MwUOs7tk=;
 b=irjmK0pgkASpeeQiYfdut4cHxSDwghxbrxJVYLdFzA4OboreFC1VJVqmKSGkZcVGTS
 hRtPTh9DcPPcto+nA/g0nuKyxMeS2OIRcW/3xOAD3YcSAXgvVNtRqznZWBs1Vc8a/5FY
 +dOuWZGFe+KTRXpPSttmRgLRaoaLZ9PFEkRgvwvVAaSsDELxDWvCTXSP6aB7EsJcb3Gy
 j/pTPR7vqMhLfv+Fi0tInqQnJgmkWz249H6nQZalVgVffCf7tdG8t3Pt+r9NKcc/3kyt
 UnipmaVxssVZIuuSanKD7R0npUD1VSYBitDcIwXVW4uA/tBHK4aMPI8vVFa/DIVGqcFT
 T/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bkP6W2XZVCYEB4qte0IPa6X4kZhn97Iduh+MwUOs7tk=;
 b=ku1XgSgSpB/mp7uja1cCScy6xRH95JV4YUTM7LfNdWKXKgjqEfTh0LvW66o29HeEl0
 qg1F3tqAU7i27CMEXP6FGWqeKCr5w9y8OGIfN5qERvb7YGBWz9Dqu/4yqOTAp05tTZAe
 siBBwT3pCX9TjpEO8MwLXexd4LN97LutAnbfgAP1dvDA8wcIlDHfEL4fPU0gJdTVtZbt
 SKd61j/vk3qr68BJfOF4BS/gjwAsLKR2Sd4Q3oeGwZIlgCdjrnL1zdjlGuqmcO3ddA55
 +DkiR5yuUjkzuG44yXEZjaEqs2yZzI3/heboN2nnb5Snl3dLQMQsnuonDWe9KkFBI0xP
 idLw==
X-Gm-Message-State: AOAM530Xf/q+vxRYnx+OXaufliK5gfPseq06ikOlIGPdkt3+Ff2+RoX6
 X+Ah9jU+5DPUamXk6/fngycOBb2VdiOlgl6r66E=
X-Google-Smtp-Source: ABdhPJwX5EUZk1RYO7F3Q0w+Dyi5l6QnOw0UeDWEES25sCNwBf8L2pWvK7+6n0qqjt3CSwPwz4O+9cuzHSrIYIQ+DRo=
X-Received: by 2002:ad4:556b:: with SMTP id w11mr1599732qvy.171.1590649201098; 
 Thu, 28 May 2020 00:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <e90b59f8c1f842cca8a6db59239a9d67@XBOX02.axis.com>
In-Reply-To: <e90b59f8c1f842cca8a6db59239a9d67@XBOX02.axis.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 28 May 2020 08:59:50 +0200
Message-ID: <CAFLxGvzg7pCkE6fPYp9ELUimOOvnhB0RzBy5eCGsrnoYPV9UHA@mail.gmail.com>
Subject: Re: ubi2 error: ubi_refill_pools: no free eraseblocks
To: Rickard X Andersson <Rickard.Andersson@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_000003_099493_2F3D17E4 
X-CRM114-Status: UNSURE (   6.87  )
X-CRM114-Notice: Please train this message.
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
Cc: "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 3:21 PM Rickard X Andersson
<Rickard.Andersson@axis.com> wrote:
> During a stress test we get the following error:
>
> "ubi2 error: ubi_refill_pools: no free eraseblocks"
>
> Is this something we need to take some action to solve or is it unharmful?

It basically means that you're draining free blocks faster than it can
produce (by erasing outdated ones, etc..).
So nothing harmful but I'd worry if you face this during normal
operation (non-stresstest).
Mostly because when this situation happens UBI has to do many things
synchronously and things will get
slow.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
