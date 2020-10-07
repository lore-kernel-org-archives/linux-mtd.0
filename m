Return-Path: <SRS0=AJHc=DO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66546C4363C
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 18:42:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6332173E
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2020 18:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SmewMUHP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z+pf3UsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6332173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oxi4A9KddoAdJqMNq3M6tazhCd3XG2ngwNyDaO/IdNI=; b=SmewMUHP0c3Wh6Z39PX/psYLU
	/K51zRuRMUeQnXgdEHdbFN+0lka30R9rEw0NTU9Ae+uUnNkVkqLxbDf+0yR3sNOxSXuZ8dOtZetAG
	WoPxPMYZioyq22/zeMGk1CIufhDE0aTT+5HExaBj7kLUf69O+7R+p8E4WY7LT+uYSAna006I6fbyG
	UEMigkv/S83+jPyLxTlNCouvJrDV85xHvh1gQsC+2QA0ZKv85KfXkAuWky4pI+nfBVH60oXWP5d+3
	ZbHsaNF/p+X7TYKyuhLtcfCoUwrPBx8TArxKflYhtNpO/pGYrFO2jsAERa183sCDOZmnu5kE17Ahc
	Fx15itRMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQEMs-0006l0-Bn; Wed, 07 Oct 2020 18:40:50 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQEMk-0006kQ-Vm
 for linux-mtd@lists.infradead.org; Wed, 07 Oct 2020 18:40:43 +0000
Received: by mail-pg1-x52b.google.com with SMTP id y14so1939952pgf.12
 for <linux-mtd@lists.infradead.org>; Wed, 07 Oct 2020 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xXW7LOkGsdr16DDohWm1S0zfTBlg5Yr0tvbTwZjyTlk=;
 b=Z+pf3UsZNiwu7xHh5ZQ9hZ+01ELjMbt2ed1X/ipL8w/k7hNHtgncWNAVjKR3tsKPXK
 vCdHRxspE/9bKTjmH6JyrvJ8l0A2xMrHq8foZR3ST9oSHzIguMUC7dILekx/k47JGsQH
 Bqmly9MJM+mmsLUmVY58dWE/53egUiOhO/MQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xXW7LOkGsdr16DDohWm1S0zfTBlg5Yr0tvbTwZjyTlk=;
 b=GSSUZH3OGeyQ4/Rprs3tPGFdB49bCglK6SqsCLLIWuUntuuQ2BfmE2SOLy22rZJYBc
 1JvJL6alqtE0y2CXD324sfbvEonQ3gdN+BE/Sq4sgjdXZVv3J4VrhKTz4ayu2kvXWhX+
 H5Fps/HIRFLGWDP5n3DLIV7feK3zJT1nNJQ+hQluEXHkJmVJSiUA4ufUZ9ufWOvAYRGn
 esaRrqiDSjAXV5owdexcE75VpL5pexlT6jaWk0Xua6taSFFMUHJHaWEeYYn2fywqRe66
 OWkNGZS1CumENNfZ6qs2cfZAt4fPFlcXtoMZpwqNM9nSMp+267pOecAPxzAOLKlM+O9A
 UJog==
X-Gm-Message-State: AOAM532oxdNdAp2P1Jh7D5Cxx7P2tQfWrnsfzsz8gYhFRQwRzC+7xj/h
 ypA4gLr7c44iLusUE/CxfK3HNA==
X-Google-Smtp-Source: ABdhPJx/izEb8o0j/KKQex6oJFq4oBwmBu/eZG5unfLyOm1bgO2WRau8jJCJqiM22rH4iSy75gAgpg==
X-Received: by 2002:a17:90b:e87:: with SMTP id
 fv7mr3817625pjb.187.1602096038809; 
 Wed, 07 Oct 2020 11:40:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id r6sm3889904pfq.11.2020.10.07.11.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 11:40:37 -0700 (PDT)
Date: Wed, 7 Oct 2020 11:40:36 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: use case for register_pstore_blk?
Message-ID: <202010071130.7EA00291@keescook>
References: <20201006155220.GA11668@lst.de> <202010070007.8FF59EC42@keescook>
 <20201007075537.GA12531@lst.de> <20201007083715.GA15695@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007083715.GA15695@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_144043_047169_BB948094 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, WeiXiong Liao <gmpy.liaowx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 07, 2020 at 10:37:15AM +0200, Christoph Hellwig wrote:
> Looking at this more:  in addition to the block code being totally
> broken, there is really no point in mtdpstore even using this code.
> It does nothing but minimal parameter validation to just pass it
> on to the pstore zone interface.  IMHO writing the mtd code directly
> to the zone interface makes a whole lot more sense even if we grow
> a non-broken block backend at some point.  Something like this:

I really don't like this, sorry. I'm using the pstore/blk bits myself
already, and I don't want that removed. Additionally I really don't want
the structures open-coded in the MTD driver. The whole point was to
encapsulate it. I've spent a lot of time clawing pstore back from the
brink of open-coded argument and member explosion. :)

I'm fine to drop the exported register_pstore_blk() API until someone
actually uses it, but I want to keep pstore/blk itself and the existing
separation between pstore backing devices and pstore storage logic so
that configuration happens at the storage level, not the backing device
level. My intent, for example, is to migrate ramoops to pstore/zone,
etc, and remove all the ramoops-specific configuration which is common
to pstore/zone.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
