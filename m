Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9DAC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 22:54:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB002076E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 22:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uH8v41rE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kn29kPKX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB002076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2hIyWBfgxu0Ps2jpMYdejdIac021akUCSUVBXUpPvUA=; b=uH8v41rEnHqqQg9OyhaAP2S3O
	wZiYItHT543mKUp5Wes/Gz+KfG4XFo6O0Xpw1tiHaOu3j8O/J2MoHxjV56QjbjujFaDqc+Evd94j8
	4xfpl4EiBe42ROqBHHRt9kM4ilqyEvuM9/nwn+uAGT6ZbVep/JcGKczYuEvtpqvSpPDNE3W9Sa1js
	9PeizUjydvcVgqGlSMCxMcLa3vfyF14Yal8sZtLtXTFLPPxjlxr5AmDd/7nNMqoHlpXG0avMdPoOo
	BiP/eMJWNUGT7OcFfaB9lkqMTraZ8YVUU8OM2RhGWY7/gtbwblOJhDD/mLHWRTUXbvRIZrHYZlaQU
	3fb5CJwOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khhC2-0003Dj-Dn; Tue, 24 Nov 2020 22:53:50 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khhC0-0003DH-L3
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 22:53:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id b6so471393pfp.7
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 14:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ljL3CSoYdqarb5zTCYLNXdzPywfy0T6TGMxzOFscvWg=;
 b=kn29kPKXk0w1xKEGzswS4Qbp/mxMrUyauVm+1Pk3+ZM6N2cfG0m8wHJGVeG2Q3qSm0
 xqmH+2wZOe3kk0UT1JbayqwkC5pLhbvygAZWXike68g0YcPoWZHRkRvFMPfeSDsMBb2G
 xFxnXHknNVhmi1Mb8fm6TXUJaRP0pFX8lN5PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ljL3CSoYdqarb5zTCYLNXdzPywfy0T6TGMxzOFscvWg=;
 b=amR4QnIzk++gaLWoR7vaEQIdQBHHGCf+p1h4o/mU6tqOi8ykM2enDyHlRN0gzTHHRb
 QSEgWBPVh6w+BRl1uxNYq1FsRin+wNyBst9+w2olcCnE5U5pNRhSqxIQN07VwiRqz6mo
 5VHfJW6OHWBlCVLt8RzfRNlUnWR1+hfRczD7BmbkD2oaVDp93KgBVsmaU43r+Y7VUrO+
 j+1nD5hn1septBwWZa8Ub2WBRXVShQKpoZnSmD5nJDLQlKZyTHfcbXqBXRaFEE0C5PPb
 jsQtnoFvQbHdHpvRsn8HBFVT/aT/T/EjlhJhfzkTT3bWePB6SrHUIHbI5hfJPkFsRkDl
 ijOQ==
X-Gm-Message-State: AOAM531fiJmnYd6/7n3p8y4H+Vu914vV1nBG6lAi4CQZYhRHYdgx1tp/
 sCIGRrWsJlZQOpPtnwZ8peroOA==
X-Google-Smtp-Source: ABdhPJyC/XDxu1EwO7/8id4vpauYSl9LTEPc/I4hsO9GT/OEDtEPp92l3ey2Mgy7T2gbunujS4AakQ==
X-Received: by 2002:a63:1a02:: with SMTP id a2mr507553pga.359.1606258425853;
 Tue, 24 Nov 2020 14:53:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id c28sm85700pfj.108.2020.11.24.14.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 14:53:44 -0800 (PST)
Date: Tue, 24 Nov 2020 14:53:43 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: simplify pstore-blk
Message-ID: <202011241452.603BC5B@keescook>
References: <20201016132047.3068029-1-hch@lst.de>
 <202010161553.F2BA6CF@keescook> <20201123145331.GA778@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123145331.GA778@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_175348_741460_05CA8A61 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, Nov 23, 2020 at 03:53:31PM +0100, Christoph Hellwig wrote:
> On Fri, Oct 16, 2020 at 03:54:25PM -0700, Kees Cook wrote:
> > On Fri, Oct 16, 2020 at 03:20:38PM +0200, Christoph Hellwig wrote:
> > > this series cleans up and massively simplifies the pstore-blk code,
> > > please take a look.
> > 
> > Cool! Thanks for doing this work. I have a few things I'd like to see
> > done differently, and while I'm not a huge fan of the general reduction
> > in utility, I can live with it as long as it doesn't make other things
> > worse. :) I'll get this reviewed with specific feedback soon, but I'm
> > about to be EOW. ;)
> 
> Any progress on this in the last five weeks?

Hi! Sorry, no, I keep getting distracted by other stuff. I'll try to
make time for it again next week (I'm soon AFK for Turkey Day).

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
