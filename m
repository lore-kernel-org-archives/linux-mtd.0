Return-Path: <SRS0=jbuo=FF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6140FC64E7B
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:09:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD0D20639
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Dec 2020 19:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wvr8clet";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WSqvrn9h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAD0D20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ErSltFQmonDyVBGVGAvN6q9FFn5t/vvbpkgOStR6bk=; b=Wvr8cletexAHGv5YSjistiy1M
	ITHfY5OOcCxji+znjODzT+qFH7hb0ymwFyCbJ9vhYnayCDSBOJNO7nLD0PClS/0MkdI2xBivQKNEu
	g5dDLUtJ5RJ8DCe/F/kAGheolQPGdqR+pC7Yoe3jhYw2JcsOb2BAQ9YUt45OKlMUbnyFQGovleGG8
	3O+ViuqS95MnUVsY+DcEpDH7+ypClnkJ5CUEKtj0SPHozCXatRWaKTyST8zjFzm14jRqrm4u24Trp
	9E/1PUTm7bB1Sxk/RCalQOZHYYpO8xJpLwpSICeQ9WWD32lXIOXIvp5KmSpAty8mLSQ1oS7i0YzQ3
	93n8b+eIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkB0l-00026f-7O; Tue, 01 Dec 2020 19:08:27 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkB0i-00025h-OV
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2020 19:08:25 +0000
Received: by mail-pl1-x642.google.com with SMTP id t18so1706439plo.0
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2020 11:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QUWMr12jnZSwer44TsnGGGXMgplRPnA4naaqDE9IQLw=;
 b=WSqvrn9hLl3nPVeLn1YYv7Rbo3046kjzaOrkh0yX03fP/x3M6u/Anz3ZsMsFl+3kz1
 Ll3WuUo2zJqxr8Prc2TvksscpcxbIDUgmNupkHrmRkLL0tzH9B+gsayZWo/02Oa6eroS
 wM1eyxl/GcuxGJ0OW18DUdONXXSLhRhAzq9P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QUWMr12jnZSwer44TsnGGGXMgplRPnA4naaqDE9IQLw=;
 b=ZeKy5ZyNW4R6V8ShhnmzL25fpuo8HT+qOOVQKLij6QIYqW6GSxLizP3wSfyxiut4LF
 Vw4Js558cKeycg0TFLyPCvT1O30ADar9Dd6wjmmIdj8I6DzjG+SU4/qbg2GoQHD8FLN3
 C9kwTqtfYnbKC95lAnRcUlrVPHcJDfBlKroCxcoweE6xdG8BLPOqSZf/U3Di+3zWlQDv
 h7Sqv5vnEsYFWs+4nUuQ7fpBLu+s3NiZLf9cPfMmZDZ1kg710+kroOCIEwX21E/7SfzK
 f9xdmVzGIST0/1RpjOX8vBEzAvogJAEfMPGz5xKXq9Honat3H82vzyjuSXRjNaxCMmF7
 OGkQ==
X-Gm-Message-State: AOAM530B9tUjXBP3zZR3GS4eKFJtgumhMihQYwc5Y+nX/9gMHZSAXsn0
 Mak0A5NpG/Bx3VIPJm05itsh7g==
X-Google-Smtp-Source: ABdhPJy5He4iO506Jp84UD+OP8wHM+ZtcLYwEHTm4UsD6KUvJxD42DZsDb4YdfBhXBSowhDhjdCiMg==
X-Received: by 2002:a17:902:aa84:b029:da:1c29:b965 with SMTP id
 d4-20020a170902aa84b02900da1c29b965mr4204444plr.36.1606849701452; 
 Tue, 01 Dec 2020 11:08:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o29sm530289pfp.66.2020.12.01.11.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:08:20 -0800 (PST)
Date: Tue, 1 Dec 2020 11:08:19 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/9] pstore/zone: cap the maximum device size
Message-ID: <202012011107.49D5ACF0B@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <20201016132047.3068029-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016132047.3068029-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_140824_836024_F5D86965 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Tony Luck <tony.luck@intel.com>, Anton Vorontsov <anton@enomsg.org>,
 linux-kernel@vger.kernel.org, WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 linux-mtd@lists.infradead.org, Colin Cross <ccross@android.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 03:20:39PM +0200, Christoph Hellwig wrote:
> Introduce an abritrary 128MiB cap to avoid malloc failures when using
> a larger block device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Yeah, this seems reasonable. I'm always worried about arbitrary size
limits, but if 128M is needed for pstore, something is likely very very
wrong. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
