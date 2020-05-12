Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAF2CA90AF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 19:44:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95FC4206DD
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 19:44:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bAjFrupj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PXb1v9IS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95FC4206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=np1xHDLNo3R8K6HIakHxiPFImDxGKX/lLY9EVpk0YLY=; b=bAjFrupjzWJv+5
	JWzk5GuIRQkINEt5g7MEvPDVuEnTzvc5HDaH43ulBwjEgZXDYYnUzh7hLD/dw6JFm0KqTBinrozwj
	hLtVOmjK982T3Hoa9pDlS7cKi1jOVZkBoDgWfu8KIhn7fE7lrq7NEWDmDWVx67cgTtta+D+jEt+K1
	yMPsGi0+ccuzBxOSY34eF4ZmotVLpTLt5bqzRE9kPjDyu55AyNZ325+3Xa9lZsL1bZD3haSzhwSP6
	iGF24An3vd9uH8j5omyu72/pNcBY99GVjQXBsS+5IFzFstSpA7sTIQZk6Wo0+rXuEPYfQJo7g7Aj1
	xnpOH8qv6G+FlAb0Q2gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYapP-00068v-Od; Tue, 12 May 2020 19:44:35 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYapL-00067p-P3
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 19:44:33 +0000
Received: by mail-pg1-x543.google.com with SMTP id r10so6154809pgv.8
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 12:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DBhE+bHXP5zrV91t92AV1x7apzTWyzN424aYc5YNfWg=;
 b=PXb1v9IS/OL5cX7Bsw8OKUXEAAg3UGRT+IO9saYbsZLXygtycRHvu1AmhWYJuN5SnN
 HMv2wzHcr7yAYKt4zrainQLFXtdP3FUj0XgbE24JTleE5ovZKHgPTv9fRRNS2lsADErm
 9FFpr88LUFS4jkmqQRpZPl9/IwzQSn+YH2YEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DBhE+bHXP5zrV91t92AV1x7apzTWyzN424aYc5YNfWg=;
 b=doHZpFubSI6QR1AsfwQnUAKBBj/9JtlLE6BghKKt8VH9tIVIBx41P/Qq4tQFjITJow
 mO2VaUdZjDCTJxRZ1qZGANeRRz5L5O7oMPD7haWtrOFVdIUaflC6O+nh++V7LxyzN5LZ
 mXAORoN4Dx1uoMOCLXEjdimCivzzvuavOXKP/2MMMlguQTnG3d13MP/OUn9BtI2Nm7iY
 9IB2hYJ6W+r9ZvLWYcxIWHFJz7rEAbYg5gd40c/8eVXxnyu8I2f0zVo4ksgJSGxSR0g4
 A7QwU4pfXJe3SZ8KCqfQENUntGlKmw8/ewO/WHO9kKSHeutZ3H/rxuWWrOwSO3t7xy7C
 qKAQ==
X-Gm-Message-State: AOAM532TIXlPVSJpM9feS9ygqCZwaj44pgPTsilLXplNKlm/uvXxnxKm
 BSrjVHvUIDwDryD2qSCY+OsB8Q==
X-Google-Smtp-Source: ABdhPJwpe3nOv6RiywTAma2C9/wcHumGJ8VS3qWE7oUMdxQmXUNg5rmOFCYxnJjbkKS69HE+a0AWZg==
X-Received: by 2002:aa7:8ad0:: with SMTP id b16mr3033296pfd.129.1589312668034; 
 Tue, 12 May 2020 12:44:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id fu12sm13524369pjb.20.2020.05.12.12.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 12:44:27 -0700 (PDT)
Date: Tue, 12 May 2020 12:44:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v7 07/18] printk: Introduce kmsg_dump_reason_str()
Message-ID: <202005121244.874D7C52@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-8-keescook@chromium.org>
 <20200512084441.GD17734@linux-b0ei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512084441.GD17734@linux-b0ei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_124431_816229_B05605B2 
X-CRM114-Status: GOOD (  11.22  )
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 WeiXiong Liao <liaoweixiong@allwinnertech.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Colin Cross <ccross@android.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 12, 2020 at 10:44:42AM +0200, Petr Mladek wrote:
> On Sun 2020-05-10 13:24:25, Kees Cook wrote:
> > The pstore subsystem already had a private version of this function.
> > With the coming addition of the pstore/zone driver, this needs to be
> > shared. As it really should live with printk, move it there instead.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> I looked only at this printk part and it looks good to me ;-)
> 
> Acked-by: Petr Mladek <pmladek@suse.com>

Excellent; thanks!

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
