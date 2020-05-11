Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD10CC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:14:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1FD20675
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:14:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdVXwyc4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UCck4fLi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1FD20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0BmX872VJQFEHEB4Z+ndvQhZ7ulUiwrpJ241asVJBE=; b=jdVXwyc45dUpV2
	sM/vkvL123xA2bLA6c3MYAcTISfDQiz3vl2f5koYYeho5A0qjcFskbW7Rkhl3J6ju9jkllg/17mBK
	ptL6ujUvEPGQkPQF3qx+pEELlsh9ULPGJT+P58DHKsXh0kalkC/Sn/jJdt2QU68DxI/EyGI7iML7x
	CUyufQ8t+7F6bbXqPWM7JbJltSNV/whr0dY88/ZCAlzjNft4/0QmLMPxMxzxQ4x2CdUXk7gaPaCfZ
	gxwOSTT6hv+0rBT244+hsdpA3XQqs2fMB0BBhOodEIb8iUoRvnHLXdRIWIx4K1gMxTte/N0zbxZ41
	3qmzzeMZI2VwhlqCYw2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHcz-0007My-RP; Mon, 11 May 2020 23:14:29 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHcx-0007MW-21
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:14:28 +0000
Received: by mail-pl1-x641.google.com with SMTP id b8so4554262plm.11
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oLYGiY1VcoUuZyQjSRt0EjsR/VIIkqkknogJiDpiRhY=;
 b=UCck4fLisgj6UcVB/cAH9mNu4GpO5hH8d5mbh/bG3fku7/1Jrx6/4TOECxiimjIWOx
 7KbuxG0YYV8aG1EP1qn6CCmTJTbfozI0IKKBOMEO+dzE/i1mJI7jd0nF0e2NlDlDhyZS
 ni3FdgM+hLwUi9CdX6nncPPcyj+72dW+ERF24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oLYGiY1VcoUuZyQjSRt0EjsR/VIIkqkknogJiDpiRhY=;
 b=MMRYX4cukL/LbHEkbf31jB2vfsWiNq67mzEsBHPjqYqyni5t41dPrMYGU0SbgritTZ
 v/s+u2rTebMAJOZQ1uOso/59k9nQdR8PBXx3LQ8dj5v2OCtZpqSrOSPUpFclBtRXLOFr
 WsVE2SgYno6ThrSFE+v77N2wvZHPrGlWsiqVdjezVIOfNgykracnpuwP18rrcYxtwSPN
 c61rVaQyx8047Ydu6efnh8NXkUGOy6KWmVcXy73bRkrHzzX8ctWZ2SNWb0o10H8xl/ys
 A+VtU1S+hipdAHFC50h239b2b3aQjx/o7R0nre3ig8BSzA6d05k9teGn/W0zk5IcU4Gg
 OjEQ==
X-Gm-Message-State: AGi0PuZzXh3Hl5qqJTnWyuxLJvhF9mi52jdCcaDU8oQEJMswATMSb3Mw
 pqGwJ2HqMDR13XQhcjYsLt1FYA==
X-Google-Smtp-Source: APiQypIMHggqUeWrrrUBc+49/UkRkp4H6it9wkIlmlUqDgYBAzEEiw7GofYyl0Ye461eA6ivRZ/xng==
X-Received: by 2002:a17:90a:1941:: with SMTP id
 1mr25376738pjh.65.1589238865966; 
 Mon, 11 May 2020 16:14:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id s9sm10217183pfc.179.2020.05.11.16.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:14:24 -0700 (PDT)
Date: Mon, 11 May 2020 16:14:23 -0700
From: Kees Cook <keescook@chromium.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v7 11/18] pstore/zone,blk: Add console frontend support
Message-ID: <202005111613.8C332ABC@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-12-keescook@chromium.org>
 <db0ae27c-8e96-9b85-9526-920800da4755@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db0ae27c-8e96-9b85-9526-920800da4755@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_161427_120726_7037FF1F 
X-CRM114-Status: GOOD (  14.66  )
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
 WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2020 at 08:38:32AM -0700, Randy Dunlap wrote:
> On 5/10/20 1:24 PM, Kees Cook wrote:
> > diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> > index f18cd126d83f..f1484f751c5e 100644
> > --- a/fs/pstore/Kconfig
> > +++ b/fs/pstore/Kconfig
> > @@ -236,3 +236,15 @@ config PSTORE_BLK_PMSG_SIZE
> >  
> >  	  NOTE that, both Kconfig and module parameters can configure
> >  	  pstore/blk, but module parameters have priority over Kconfig.
> > +
> > +config PSTORE_BLK_CONSOLE_SIZE
> > +	int "Size in Kbytes of console to store"
> 
> maybe	                    of console log to store"
> 
> since my console size is not measured in Kbytes.
> 
> > +	depends on PSTORE_BLK
> > +	depends on PSTORE_CONSOLE
> > +	default 64
> > +	help
> > +	  This just sets size of console (console_size) for pstore/blk. The
> 
> 	                         console log
> 
> > +	  size is in KB and must be a multiple of 4.
> > +
> > +	  NOTE that, both Kconfig and module parameters can configure
> > +	  pstore/blk, but module parameters have priority over Kconfig.

Good points! I've fixed this and a typo in the ftrace Kconfig help.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
