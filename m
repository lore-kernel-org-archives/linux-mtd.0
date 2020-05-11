Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C5AC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FA8E20714
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:02:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rkpyjTNE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXD9fCZ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FA8E20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaE1CHHwh2z/sPWBaZG+FIOH5EvWJx9gzrbnESudIVs=; b=rkpyjTNENqLSEg
	qGF3m+65m4SAZeir20Im+HyZfhigqp8fL1upZ2d96OTJSPKiWN3DoOJ1YzmzecGqEK3+4TkC3XM2K
	ypoerS3a+g3Fo3nLcO363Zko6Pk6MxkWnxZT1wq2SBUvUrVcF4wY8/ScQWs7sx97z9WP/KIRA16bT
	ZIhXPizPdTsRfykW0vEvjZCJ3BqrvjXn/BuzY+j3s+KySPeJpSuOyXUHb08mIbR4TRY35PB5V+fWE
	whDKpD1utQ/In8c8wwSLhJL0us5BCX278ERJG9sA9nF0d4tga73xdY9ZmQ+MrKIRk2vzgv+JFhNKO
	luzrLPLVrip8J8JSQeFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHRM-0000DW-Bf; Mon, 11 May 2020 23:02:28 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHRJ-0000Cs-C1
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:02:26 +0000
Received: by mail-pl1-x643.google.com with SMTP id y9so1959639plk.10
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=04jfofQ0OxPjQjdmjcz7p2pCwiPU88bfh4Zyk7/WIes=;
 b=lXD9fCZ7vgAYqGcB0bReYiqjnJvrU48Dwt5nV1haDxmNlCOfiEYm0GrsD3fP9oM5Nv
 uVrt/x1RiDWtnCa/hzO/cE5U9xEz3YMrU7cfKUThQG4BF9Hu1X1WQ7wkeX4ZZpgPaWQn
 9di+/IKptsoPR84Cu8M590OKNEt3dPjlKYRuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=04jfofQ0OxPjQjdmjcz7p2pCwiPU88bfh4Zyk7/WIes=;
 b=my91XqlCwVU262TPKbGLhbOHDUwZwiRZ0pVefNTG960hRlG0+Pc+uMech3IizJHjQU
 MgU0ctPfNhkffSaOAAW9wV72q1imMOP9PLRF3hHePS8Bu/PMv9yBh+FDcsJoAdND8bQe
 66n2vhfXJcgp6fZjreRkZ8TOju0yYoP7arN2izyWNtzTHUg595SKAMnLsRsMxZRQ7USh
 00/EGwyvq35OG7DAooj1/qS6svQ+ZQL/HKZe/n81R4Vm6dRS00UBgQnMHa6o2aAI1nBt
 4t0lSkHr5Q44h73wzQHNJvoAxtPjFhbNiEOmuFkmDvsE1yl0VbxRHLowBSySxqOTqvze
 DgYg==
X-Gm-Message-State: AGi0PuaeoAghMFxcp7/mV3lx/u3G74S6GNeGMj0Z6hX0w4J6pcHNzkZV
 VlRYacqsjpuKKOL3ujxrKO/JiA==
X-Google-Smtp-Source: APiQypIwNmw12IH8JOCrn9V+M/ELfF4Ie+RV3w6bNqR2TouERqOStRwtYZiQB61+8jxfB5DqlmBd2g==
X-Received: by 2002:a17:902:ec04:: with SMTP id
 l4mr17438394pld.6.1589238144381; 
 Mon, 11 May 2020 16:02:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id a2sm10027736pfg.106.2020.05.11.16.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:02:23 -0700 (PDT)
Date: Mon, 11 May 2020 16:02:21 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v7 08/18] pstore/zone: Introduce common layer to manage
 storage zones
Message-ID: <202005111559.711BDC6@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-9-keescook@chromium.org>
 <c6ddff6e-25fb-4fb7-18fa-daf7281c1eb0@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6ddff6e-25fb-4fb7-18fa-daf7281c1eb0@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_160225_431074_AF29A294 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2020 at 04:36:21PM +0800, WeiXiong Liao wrote:
> On 2020/5/11 AM 4:24, Kees Cook wrote:
> > [...]
> > + * @time: oops/panic trigger time
> 
> The above comment should be corrected since it is not only oops/panic
> any more.

Ah yes, thanks! I'll clean these all up.

> > [...]
> > +	if (hdr->reason == KMSG_DUMP_OOPS)
> > +		hdr->counter = ++cxt->oops_counter;
> > +	else
> > +		hdr->counter = ++cxt->panic_counter;
> 
> Here should be:
> 
> 	if (hdr->reason == KMSG_DUMP_OOPS)
> 		hdr->counter = ++cxt->oops_counter;
> 	else if (hdr->reason == KMSG_DUMP_PANIC)
> 		hdr->counter = ++cxt->panic_counter;
> 	else
> 		hdr->counter = 0;

Good catch; thanks! I'll move the lost later hunk to here.

> > [...]
> > +MODULE_DESCRIPTION("Storage Manager for pstore/blk");

I'm going to leave this as-is for now since it's accurate for the
moment. :)

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
