Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA14C47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C9AB20675
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nIvy4JI1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JHg/0IjD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C9AB20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UibaXKSbK6c/a22Z1vAIPLRdR684oKvy9GiJ8Aes2gs=; b=nIvy4JI1PkNZC1
	q4qVDbIjDVyq8cl42jZ2IfkuPLjny8fCeHMnO4KXCVDG01KaFynMJzXFy36suZQgSZDJqIaxpR6nc
	Yf3YMxckWbW0vwJ515J/Yc2mK1Z3XQaoEMjR82tFhRff/OSUkXndn8lRbU4uFKymfmigwFYVdDAYC
	BYT/wsLjHOEAWoAqbJjbLxb/U1XBICg0Dmz54AG+Qz8saRfWsaPtD5S7lFAmabGNOf/Jh8J/zDTzG
	x1ozfN7PRaDcjR5yWMVnQHQ555vaAiElORD+HXjeZ7oXEsHyuasxQZmkgnffTHQpwqbmaka5graZU
	fMLjD3JulTqxCSDnKSUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHfR-0001uB-GT; Mon, 11 May 2020 23:17:01 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHfO-0001tj-NE
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:16:59 +0000
Received: by mail-pj1-x1042.google.com with SMTP id a7so8497924pju.2
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TyQ+88CfrBEczIT0Dd6n6ZbeE4ol8PzNiSvfm5+kLJU=;
 b=JHg/0IjD7o3QPrAqxokoSFbk/QwW4JofsG45d+APkRNW/YJJedD1NIj4FJBSZWSEvw
 wok+avpYAAXxcqo0SoeTraia5guUYkdGPtH71Yzl9rnbfdF5X6E71jswAIkrKuEIehzQ
 pvmZuSFh/oQLZ1A5h9owaBTTgWB89Agkdsuf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TyQ+88CfrBEczIT0Dd6n6ZbeE4ol8PzNiSvfm5+kLJU=;
 b=bXCbirL30v0FX66cF/EINxXiBfWHKHscaWcssp0kvchjms434xaj0ek1zeu1w2iQl4
 CDBoSTcad8GZVeiMAPuovPzaGiIgTNUyn65OoQG5y63eDKKJc1B2iLExUKXIzlcKOiZa
 CPUzHnoyQoB5uiKFAJRgzPgAWcEaA1DEopsZSfnNYKIThBC+2hn1PiLJhKI42/8Is9To
 h1U1oV2P9VClqAL3B8P1XA7+HFjO98G5iStLmlzBtSJDJ48HlGq7FpaQqW58ewW0PwZy
 UYaxDnLaNjbxQuom3T+wH0eIx3MFWw4PaizhgC3aVmHi98H+lFrQac7twglphs5K7MnM
 rQgg==
X-Gm-Message-State: AGi0PuY65XC9hXOFsPK+Dx6vDqK99ggB75jPPxK/YstzRog8ci6370PI
 QYMOyOZxDLMyGIJyT0msxkhl2Q==
X-Google-Smtp-Source: APiQypJbYkw3p9y1o6N+5NhKARjk7xl5lEcqdm0v+m00BfXaZfzyPSUnPFzAd1fH1+muoyFt2kCyaQ==
X-Received: by 2002:a17:902:a40e:: with SMTP id
 p14mr14257516plq.0.1589239017355; 
 Mon, 11 May 2020 16:16:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id v10sm8920337pjy.48.2020.05.11.16.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:16:56 -0700 (PDT)
Date: Mon, 11 May 2020 16:16:55 -0700
From: Kees Cook <keescook@chromium.org>
To: WeiXiong Liao <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v7 17/18] mtd: Support kmsg dumper based on pstore/blk
Message-ID: <202005111616.CA0264F876@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-18-keescook@chromium.org>
 <59ef2812-93ad-9f8c-81cc-458128a6fb46@allwinnertech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59ef2812-93ad-9f8c-81cc-458128a6fb46@allwinnertech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_161658_759784_9C6FB0B9 
X-CRM114-Status: UNSURE (   9.99  )
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

On Mon, May 11, 2020 at 05:01:26PM +0800, WeiXiong Liao wrote:
> On 2020/5/11 AM 4:24, Kees Cook wrote:
> > [...]
> > +	if (strlen(info->device) == 0) {
> > +		dev_err(&mtd->dev, "mtd device must be supplied\n");
> 
> mtd is NULL here, "mtd->dev" leads to error.
> 
> > +		return -EINVAL;
> > +	}
> > +	if (!info->kmsg_size) {
> > +		dev_err(&mtd->dev, "no backend enabled\n");
> 
> Also here.

Thanks! Fixed.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
