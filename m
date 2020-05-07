Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBA1C47257
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 19:46:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A35C20CC7
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 19:46:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fXVh2e68";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Oe0PU5NZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A35C20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSgP5YR8pgj2GAnr9iOfaDrJlVwhzYdVggNb0lmPep0=; b=fXVh2e68lAonRN
	OUdvE9NvgplguCjbqbaG6bqtZsxHyfDjpN6AaA9gBUYMTeSjTDnzvgBANM9F8mNL78cliteJlnQr+
	x2EGuXbDqvWf97uTEgoK6NnMAxWFnPmlCu/fKCHjwo3MLx92Fyu7eD2bXHrRGDoOD/6vC2TtIjAea
	yOox6GIhJ0wg7xsXwcl69XHvAn5e2ZQbDrYLtYOG+eoca6Q7Ht1N9LX+6uHHTvrQHoQasXMjfomg+
	QQSG3TrgBfqOZH+6ZtN1Wradjc/46U+D5A900Dexr5esbFcr1L2ZzDBkMPSdHDHjngZqO68+uUkcr
	YvFSKJcE+GI7bl+MkJSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWmSp-0003kW-1o; Thu, 07 May 2020 19:45:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWmSm-0003ju-1n
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 19:45:45 +0000
Received: by mail-pj1-x1043.google.com with SMTP id fu13so3098677pjb.5
 for <linux-mtd@lists.infradead.org>; Thu, 07 May 2020 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IbfxBGzYrCHzzfTqHU4rAuwYtieZW8IZ52DJWF9xsUo=;
 b=Oe0PU5NZ2azBtHLJKpX3ha1q5sVBZ4ZHO+l13jT6Erh0ACOWTwKch462jXBcFXyD24
 s/knbIwKHieGmlCElrOSj0hDSdIyuGY9V7VyJlbqfYR/GtTzoLQNjVaFkcRQYiSY3Hh+
 93C47ECe6RAr7s+FMJPAHvDax6a3hMvgtnLag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IbfxBGzYrCHzzfTqHU4rAuwYtieZW8IZ52DJWF9xsUo=;
 b=HLnXxGZKpQN6QwTBIQc1ECA4ExA5sgX3bBYEMqcA5HPgcwdmMYQADXDxpM1fmglWoz
 bVfTQOuD0tls8Tn5q2L+XPDRf3oBkcuKqD4VYKPnT2R7t7w2v6fjkORXgQKbmWTyiNJR
 UlS4jtn90/KD2ieQfkz17Bg1AW4XihAT/zIYq3HlnYVMhVY+cIWMNJVtAmYGPZ71Dhoc
 BGjfIs2fOogBr+ZqqYbnPuh7CaCklmri2/0IZl07zgA5YrKDqYIrohn9Gpl+P/wy72Jh
 1b3/ue/m1DpHd0fJhflYC391GCSXx+ruJ+nahJMjUWIF/N5BrM8rI45hy2tQCc778rjX
 q1Ww==
X-Gm-Message-State: AGi0PuZexZE9zI7JtHf9DBnIemLFRfctn+vtHjlUSS9VIHkcFcnbX11K
 +X9TpEy76UphOj7fEWKsIBDcvA==
X-Google-Smtp-Source: APiQypLBhRh1xD+zBIxgBZHXiwlmz2uQ7tdEn6c4Ababtg8mWoyu4ca2B3WYR9T4i3qlo9eH8sYYZw==
X-Received: by 2002:a17:902:eed1:: with SMTP id
 h17mr14686969plb.312.1588880743038; 
 Thu, 07 May 2020 12:45:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l30sm536526pje.34.2020.05.07.12.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 12:45:42 -0700 (PDT)
Date: Thu, 7 May 2020 12:45:40 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v3 00/11] pstore: mtd: support crash log to block and mtd
 device
Message-ID: <202005071244.AAD82F41F@keescook>
References: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585126506-18635-1-git-send-email-liaoweixiong@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_124544_113817_3C324CFA 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>,
 linux-mtd@lists.infradead.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2020 at 04:54:55PM +0800, WeiXiong Liao wrote:
> [PATCH v3]:
> 1. patch 1~10: a lot of improvements according to Kees Cook <keescook@chromium.org>
>                including rename module, typo, reorder, rewrite document, bugs
> 			   and so on.
> 2. patch 11: rename funtions of pstore/blk and update document.

This is looking good. I'm going to update it for the recent max_reason
series, and make some tweaks here and there and send out a v4 tomorrow
to see what you think. Thanks for your patience!

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
