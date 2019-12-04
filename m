Return-Path: <SRS0=Ia6G=Z2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 054EDC43603
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 19:12:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E402073C
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Dec 2019 19:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gEQWMJaW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7E402073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDSfN3/oZa4tPPJj2yPYay8FtLAM3mNV8caFoxZCvmA=; b=gEQWMJaW9DthDf
	gdTzRDxB1PrsKAHtMISGe+IjDhGbibAl3WN4Bc+p9X57bnlvOCIOqqZ8L2rAFKbaJpgdqHRaEmZqV
	EqSYeB6XfvsLLLrEiVuePq7rZigNKqszGOsWppktjWBqYKlqj7GNutV5ZnIVKLU6+1s6fsBORyWwY
	EzAZWiYxiHKuCK8TOrBiKMTDKzuNUK/QnMXl9gv/oKcYsbtNceyniL0a0bp3UHNVgEaD3nSXouuyQ
	wbsd3yh1YaXngmoDyPKbtO7Gq3bcugf+aF+fXl25mLLl4f2fpPeAV8/d4QcSKhRnchRKfCKlmd3CU
	zd30BLEzho+ZlpzYIv1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ica4Z-0008Nb-3I; Wed, 04 Dec 2019 19:12:27 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ica4W-0008NH-LT
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2019 19:12:25 +0000
Received: by mail-oi1-f194.google.com with SMTP id v140so328977oie.0
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2019 11:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eJF8QJlqp+vHYH7MET2rR8dZMnoSfUiUrUd7ao63kNg=;
 b=Fpu3JFc0aQysXN4w10/wV71R6CboJMVhFdeNMUiuz4fJ+gFf36gxGC0r6ejo8BmhXu
 mSMyZTLXSWO96FWKNcwGIFWKdLb3OopvgX4+o+dNeTvAIM54tBEIUqJ0dg8RXF3GhTo4
 Qsyl0sDHZTBHrrUhdbjDkaelZ182fjzOgML1pfga7B2s8V5iqygtOfv1J0uRKOPZ+enr
 SkjMS1mxLerIGkLWMlVDI8entJMXxH18dfRRJhEp5cGhpstA98lEDljh0rNzDJ3nEMBu
 DmQyhr9WhCh957Avq3TMKg1vrlFAjnOG5C4el9ehFI1POabnH0cxkJiEBXN/GoUr1ZMQ
 4kgg==
X-Gm-Message-State: APjAAAVOtX651SSL+BZUvABG5wjQpn666QeW2rrR7rlnMpN7tqrArPPO
 VCRIlCPaT1QdFHtgyzPTQw==
X-Google-Smtp-Source: APXvYqxZsp6Boueg7LT/zYs+LCC2WL++8X0NkLr1C5Xzy3VXHiOov75J+lJ8eUO8aPzifacC3vNTRA==
X-Received: by 2002:aca:4fcd:: with SMTP id d196mr3997896oib.89.1575486743132; 
 Wed, 04 Dec 2019 11:12:23 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j1sm2601628oii.2.2019.12.04.11.12.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 11:12:22 -0800 (PST)
Date: Wed, 4 Dec 2019 13:12:21 -0600
From: Rob Herring <robh@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH 1/3] dt: bindings: brcmnand: Add support for flash-edu
Message-ID: <20191204191221.GA14944@bogus>
References: <20191120182153.29732-1-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191120182153.29732-1-kdasu.kdev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_111224_703705_0AB1237C 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 Nov 2019 13:20:57 -0500, Kamal Dasu wrote:
> Adding support for EBI DMA unit (EDU).
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  .../devicetree/bindings/mtd/brcm,brcmnand.txt          | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
