Return-Path: <SRS0=Q6Kj=TW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47030C282CE
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 21:45:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08C020868
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2019 21:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k0h4d4iA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T9zHpWyJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08C020868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWhcJin0Rha2lS9oZFEdBQ1RnQK0obFqXMn7zh/znio=; b=k0h4d4iAMwlyr9
	8MgUBKNzf/5/fLtWL9Ga6UCM8EPf09h6yKZ5mlpvtUo0USgp7ayQGLTPRwIB6TTdaT2vm6/JAOmWT
	DuoO/p3Yk+UGK5I7ipSpkLtyFw+mKZWBoNg9UXVBUAW4lFW/oSeXG/e0Wo5HyCMu9RdTbMyWtnOxq
	e/27ZfrJ0DEVLeDDaTxShlVjlwCUtq20/qk/XLANJC7GsKUjpGuyHqeMMKhyYvwSkdzcp/2B+Hwzr
	hFssb4zW6dn80nVESDC1NUbBNZDgL4ObFPVIUp3aegf3HkqRSAYqihcggXHUJQIJq+fvfCxGQROf3
	6L8RnLftIiLnBNpKxS5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTZ33-0006BT-GZ; Wed, 22 May 2019 21:45:21 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTZ2z-0006B9-TC
 for linux-mtd@lists.infradead.org; Wed, 22 May 2019 21:45:19 +0000
Received: by mail-pf1-x442.google.com with SMTP id q17so2008773pfq.8
 for <linux-mtd@lists.infradead.org>; Wed, 22 May 2019 14:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3msBjqVTJ1kTESQU/rT/HU56k2o0e/t/iRqw2p4BFfY=;
 b=T9zHpWyJquwaUzakm+kApDt3POLoWJmKmRWBvXBVb+0YhVraKV+b6OnKSVvkmoVMTb
 m5E8aUR9YkzfPrDM9G36OUhEe0XDYAFFMRtUG23mFfC+ltHlRynUtamdsVMcO+SQGnrh
 aZ7n046ymukpCPNU/EMXN0YGHGxXsG2sJsUwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3msBjqVTJ1kTESQU/rT/HU56k2o0e/t/iRqw2p4BFfY=;
 b=a4J5POUZqQiJVqNo4LD3jS0fZzd1iWGk+wPkOzms+c6+7G9VRIFkQOMcfd3gcCfQLE
 yClxamJ2f529yHM+od2bl4NDlUJwC0d4O6umNN4F146AGXWP/X98dZdUURnLbDURz/aj
 f3omSQRUYA/oiyeMQbeQwfsA40fO7s8tIey5dEVr+adyBDcSQN1YwLs3JH6jkx71utp9
 J8T68WqKWzHI4+nmpjPHzZDJqhFVr5V2TibkXaqRJYWP2YdaO/W1FPo4slDa9rNGgFSm
 dXo8EsWQ+UjRSV0zAubyPlb9WphfMOSDzXHBt1/6u6kpCZ4jySx8iKB8BAE5kdzLAyTp
 yDgA==
X-Gm-Message-State: APjAAAXKelxVe/2SXfKvczwi46HjCGVp0UKQwdZMyUtAlPGL2lydx7hm
 FS2r7ehQ5OJZSXKEuT2/RvZq/A==
X-Google-Smtp-Source: APXvYqzOarFkWaTvY38nd1mXMA6LjE1SIm+r6SAsYrEQCtbQjS4lltVrnHQvjcH6nVU5wIbi2MtCjg==
X-Received: by 2002:aa7:8219:: with SMTP id k25mr5697545pfi.38.1558561517334; 
 Wed, 22 May 2019 14:45:17 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b3sm44151294pfr.146.2019.05.22.14.45.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 14:45:16 -0700 (PDT)
Date: Wed, 22 May 2019 14:45:15 -0700
From: Kees Cook <keescook@chromium.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] mtd: onenand_base: Avoid fall-through warnings
Message-ID: <201905221444.014568B0F4@keescook>
References: <20190522180446.GA30082@embeddedor>
 <20190522233705.234d75d5@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522233705.234d75d5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190522_144517_968577_0DF4FBFA 
X-CRM114-Status: GOOD (  16.15  )
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

On Wed, May 22, 2019 at 11:37:05PM +0200, Boris Brezillon wrote:
> > @@ -3280,12 +3280,14 @@ static void onenand_check_features(struct mtd_info *mtd)
> >  			if ((this->version_id & 0xf) == 0xe)
> >  				this->options |= ONENAND_HAS_NOP_1;
> >  		}
> > +		/* Fall through - ? */
> 
> So, the only thing that you'll re-use by falling through the next case
> is the '->options |= ONENAND_HAS_UNLOCK_ALL' operation. I find it easier
> to follow with an explicit copy of this line + a break.
> 
> >  
> >  	case ONENAND_DEVICE_DENSITY_2Gb:
> >  		/* 2Gb DDP does not have 2 plane */
> >  		if (!ONENAND_IS_DDP(this))
> >  			this->options |= ONENAND_HAS_2PLANE;
> >  		this->options |= ONENAND_HAS_UNLOCK_ALL;
> > +		/* Fall through - ? */
> 
> This fall through certainly doesn't make sense, as the only thing that
> might be done in the 1Gb case is conditionally adding the
> HAS_UNLOCK_ALL flag, and this flag is already unconditionally set.
> Please add a break here.
> 
> >  
> >  	case ONENAND_DEVICE_DENSITY_1Gb:
> >  		/* A-Die has all block unlock */
> 

Your reply was much more to-the-point than mine. :) I'd agree: retain
existing behavior (ONENAND_HAS_UNLOCK_ALL) and add breaks.

-- 
Kees Cook

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
