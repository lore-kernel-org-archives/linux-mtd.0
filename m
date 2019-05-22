Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF65C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:20:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BE12081C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 22:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eT0Xb2bB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l6Twn3Uj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2BE12081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbTByLsHQxJBwSOdDKW7ivXcTuFZuJ8fLGniASrGRkc=; b=eT0Xb2bBvBh+wH
	pKI23PSNz+54lDdtm28iOt8hlPSTBislP7j3wsA7kpuWD8lzVU7GfvaRFfGI+WTzlEWdwAOKrLVLO
	MhZLfoJ7AojfhAj3bvxm714BqnpNW9pu/mUpVaw0nqmVtHgiL5gVWmyr9A72H+pBmK08zlgkXz1ip
	cL4Y6x8vp71n7JC/sEPdRvMqotFSk2ympwifGiQN4VnJnS9yvY+AHqs+BkpKET9qvRAKnY5J4HS3z
	k5z1W6iW9oEHRvig5drnD5oGXfjJhgpSzTceIu92BTBqVdUg+5qIOqVqM26uF3HmdscKKXokhnjxE
	8Ll+7XSkmQ3frbSS85Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZao-0001EY-9P; Wed, 22 May 2019 22:20:14 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZal-0001Dq-4N
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 22:20:12 +0000
Received: by mail-pg1-x542.google.com with SMTP id o11so1810801pgm.13
 for <linux-mtd@lists.infradead.org>; Wed, 22 May 2019 15:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zKpoS8ChVauG/b5jE7jdGLek9tzNeFPqv0E/OMjWjmE=;
 b=l6Twn3UjulqQqYjQ1sV1Om600H5NzmMO9lU7YFqwo77Q3wEt3NpC2jGlLXf606OARJ
 u5179gymw9vrMKnbwCTv3rehfAly651iOeW71m1DadeWX4CicN1zq9VWAolyQFIs7fHo
 Av9uo86ofFN6IiAIpEWhPjsElNYdgRQbdvBI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zKpoS8ChVauG/b5jE7jdGLek9tzNeFPqv0E/OMjWjmE=;
 b=lLmUI7rX5/tBxm2mbhuPIIPjroGP+vGlRJnimW1TT6X2udgHQogrcEhGKqcV7YFivX
 GqcUimn+V7pZZS+A/e1y7Gs5j9YTc0KMAbMM7bSWbVqqka8KDeM3SSW48ZhHh28unGQg
 Airq0sduV1gDnXlxZQSCVDYjeq9CWVG5/94lIPOi0vrA5LrUGaCG7Bkhp5Pu7nei+XPp
 uNIYD9wZDQahv/omRNzCjtlhfew7TyRXDnilYZexWD72bwyE9gfn13iKJbGOguMNKoU9
 Amm3J9WYBfA8+7GiGDAzHb5demAS5PEGtggLWwThsEuFiEUcQWMPB0Ro75u5ICboMmhs
 wM+Q==
X-Gm-Message-State: APjAAAVLnV3a1KLqliPVfIjv61oW2lSjSoFE2MpIUCYSBJ/CGXEBtTA5
 YGF1vooAHmZde5UkZsfECF7BUw==
X-Google-Smtp-Source: APXvYqw7vBRQoH+FD/trwikHaC065wEINOozIgtwVa9U9ZyvIo0eWI2fuUR7x4j3CWWXadtR698Bjg==
X-Received: by 2002:a63:ed03:: with SMTP id d3mr92213341pgi.7.1558563608854;
 Wed, 22 May 2019 15:20:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x16sm28300353pff.30.2019.05.22.15.20.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 15:20:07 -0700 (PDT)
Date: Wed, 22 May 2019 15:20:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: onenand_base: Avoid fall-through warnings
Message-ID: <201905221519.88B9364E@keescook>
References: <20190522180446.GA30082@embeddedor>
 <201905221403.642AF6092@keescook>
 <20190522235738.68059906@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522235738.68059906@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_152011_228326_45E0EA70 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, May 22, 2019 at 11:57:38PM +0200, Boris Brezillon wrote:
> All this look suspicious, and even if the fall through logic
> has no side effects in practice (which I'm still not sure is the case),
> I think it'd be better to explicitly set the flags that have
> to be set in each case statement and add breaks.

Yeah, totally agreed. :)

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
