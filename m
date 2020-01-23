Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7074DC2D0DB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 13:54:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4239F20684
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 13:54:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g0qRMt+8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4239F20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lSd8n2A0JfefbsZ/p8x81CLlwR16Njo8npFAH2hObks=; b=g0qRMt+80+AgQk
	ggFYNXFhfoM2Fzs6jv4mMmxuzPY4qWS5QJ7zCxXVxdsVEOZ5hKSpkrjMMnCskzi9jDocmZclrUsml
	WEJ76JAupexQaecKPn6LKp9NPg7lnHEDZ71UiHbC95HiumjKCMYaZOSPzpOAqqmxPsem7x0FV2AvV
	GifVf8+sFvBESRVsmiSVfnmc4rP9C6QrGIRBhPvrr7Z+Jy47+42WN9rIWJWaREtlzIMoBNyElYa9A
	+Tbx4jUH6Z9aX4cT3PAaF4jdtCbGvEUS6AtheDZgs9nODPsB9TtnIrfWmdVO6xMGuoLHzLeg1x9r7
	bvSwZs2mnAoxGb+5nV1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iucvw-00025d-1H; Thu, 23 Jan 2020 13:54:08 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iucvt-00024u-MY
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 13:54:06 +0000
Received: by mail-oi1-f194.google.com with SMTP id p125so2906029oif.10
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2020 05:54:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R/qM3etQQpBSLTEqBLeVd9eY87SXmbEFDzRP+5up0C8=;
 b=kxZRmLgYpA+onEQ9eYlLIZ67FwExoVhN6kwHWLD8NjfbAqBFOnVjXn6/aLmJ2vSg0R
 EY8PWF9G6NwAHkk66Bne2wYKjEEJGOpme95nDHhA5orHnbGYQ3luvzCbk6h5mIiB883H
 7HKoyzQqUXMqIL+ngRUuTwSr67jG5CRjNXGX1tFs14X6i+Kd7/y+QTkfhk7F0kk5ixBR
 PC66xHEfZ3vVzSNgvqDXEnkJJxg6Ztoa/ZEDGLdpxq4JQbjdhUoe3fPUsCXBs85xtrG6
 KBcs0IFnlLM14S4TfhjADS6stcMTLdKMU16U8wZV2VqmYHbVL9bEacaCl+YlzUjcp+YR
 DRoQ==
X-Gm-Message-State: APjAAAX/kkr9snCKI6gzmLDX/59Lw+VA6FZ8WXNWh8Wn3vghTsZpT8+L
 0lz2F0zyDz5WmgG2phm7Gg==
X-Google-Smtp-Source: APXvYqxbmVw4pPuJNM4zzDBdpevfcNsr9BgaGlQWY114ibeMBYPE5XKl4w2rJlu5/DKjrG/8rQ80/Q==
X-Received: by 2002:a05:6808:1c6:: with SMTP id
 x6mr10556492oic.49.1579787643963; 
 Thu, 23 Jan 2020 05:54:03 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 17sm808746oty.48.2020.01.23.05.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 05:54:03 -0800 (PST)
Received: (nullmailer pid 4960 invoked by uid 1000);
 Thu, 23 Jan 2020 13:54:02 -0000
Date: Thu, 23 Jan 2020 07:54:02 -0600
From: Rob Herring <robh@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH V3 1/3] dt: bindings: brcmnand: Add support for flash-edu
Message-ID: <20200123135402.GA4763@bogus>
References: <20200122204111.47554-1-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122204111.47554-1-kdasu.kdev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_055405_734840_D2AFFF98 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 22 Jan 2020 15:41:09 -0500, Kamal Dasu wrote:
> Adding support for EBI DMA unit (EDU).
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
