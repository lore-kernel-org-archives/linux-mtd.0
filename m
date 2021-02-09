Return-Path: <SRS0=FWsg=HL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36446C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 15:23:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C76464EBC
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Feb 2021 15:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C76464EBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=szeredi.hu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AwilzdX/W/HwHuugruutPstBdVdtXZP3DVlVFM40hxk=; b=JdHzUKDk5Eo4elEj4zGD7ua0U
	2ccWrki6/G478WFr/ZXxNdj8ryF/tEYbd41aEz28n/rYC0Un1xJ2+f4QsYgN0kwFkSzODyM+WzSnO
	1EvCCmwj9/HedGjDISwXpnSlF1W41EVDpoJZ1blV+rP9lFrVUmBWC618mvAtLNmmhwJkOm/xjJdYu
	kf06Ja1lmTFEs+a11Sw3XNeL7C43m9dLBW03Jz3wrPmuGt3HRz+JxgPJYfdPBZKgurjt7DvSOlfw3
	4esgv1A0HheQkMTWxaE8Vtp7VeoxwxnqyBYcm6fiKRXNi2DHsWSi5YlpiyDbdsrLrXBRBUvTA0uEw
	yKKZkvRnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Uqw-0007ei-Ha; Tue, 09 Feb 2021 15:22:58 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Uqs-0007dG-Rs
 for linux-mtd@lists.infradead.org; Tue, 09 Feb 2021 15:22:55 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id q23so9627454vsg.4
 for <linux-mtd@lists.infradead.org>; Tue, 09 Feb 2021 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCZz97uzCHGddkBTReOyagy60zeLzzCF1I6wRGccqhE=;
 b=DrGLXzDh3hkpXg9djEHKfEhye/AVp2sQm27tEP3KeWlb8f5B0Nwq7pfOpmCMi27AGG
 cT3f98YOQIj82GzIR7WKpE0qSo/tNcRAJhGVThQAGzoMebMIAEfoYr5PV7i1CPoYFxrm
 xA3xvwJFDKHwYFPCjP7VvoVrWLCnNMFsPj45A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCZz97uzCHGddkBTReOyagy60zeLzzCF1I6wRGccqhE=;
 b=DhmhQ77LpybHEaLWKS4m0hcGHbAkaJKixiX3/fHKQmZsN/1WuKjNVKgGGp172UJt1F
 t8WDrgx3SGz3RJSgjlpMxV+h4xtBTzKUXLoG005VqwvC5rjgwyqRrgGjlPrt+yhUlJeT
 nBhoXj9sWbyh5VprqYsk0iLshc87uPdEzeDvtVHmvmdsrHG6tyrjM8qE9zoE50FrWaPS
 O8NMRBJZ8SRg/L6Yu6IV1tN2VyF4jugL3ZkcnM9RmBXQU+P14AIgDWhwJX3Rk2WZY7CK
 RfFuLLMsCyrHMpHBJg4eVBsYsQaTol/XkvIl1UvKJ7nXge5JonmYDG3R2yzu4dKJRUKr
 gjfQ==
X-Gm-Message-State: AOAM533Bp4vmJcdh7ibQuh/GDtd66NUUXBs5OI+5ESj+Gh/lg8N8elSE
 uj0ZlDn0anx93CoFsfJu7OZ1EOA4nQO1iD/9Pqxr5w==
X-Google-Smtp-Source: ABdhPJyQaaW8l0xGMipKjEWaPlZilec/uO/KyZ287BqbXRG1zNpFaUAXEASIAMSauQrZVVkhPozcrTic5kP1jEc0OlQ=
X-Received: by 2002:a67:a404:: with SMTP id n4mr13411993vse.0.1612884172982;
 Tue, 09 Feb 2021 07:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20210124232007.21639-1-richard@nod.at>
 <CAJfpegvN2KdMj_7T-OF1PAs8xZiU3f4233AvigaXwwRAsgQEjw@mail.gmail.com>
 <563952295.378372.1612881357746.JavaMail.zimbra@nod.at>
 <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
In-Reply-To: <3a9c19cf-2c25-a3bf-a200-6d223952797a@studio.unibo.it>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 9 Feb 2021 16:22:42 +0100
Message-ID: <CAJfpegv5zG0ixRrf-nauHkG-36C34xVO5jN_GX=3f4JamnRfwA@mail.gmail.com>
Subject: Re: [fuse-devel] [PATCH 0/8] MUSE: Userspace backed MTD v3
To: Luca Risolia <luca.risolia@studio.unibo.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_102254_999131_1FB3576C 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, sven@narfation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 9, 2021 at 4:10 PM Luca Risolia
<luca.risolia@studio.unibo.it> wrote:
>
> Hi guys,
>
> a bit OT probably: is there any chance for you to also implement mmap()
> for CUSE? That would be much appreciated.

That's an old one.

No, I don't have plans, but patches are welcome, of course.

Thanks,
Miklos

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
