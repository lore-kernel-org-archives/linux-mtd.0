Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79733C2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 17:00:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46CB921569
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 17:00:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GdVytKCM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46CB921569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0ro4v/HlPFV56wus2KF2K+gU0wms4XtRjc4yV5oMdQ=; b=GdVytKCM+TWqVZ
	v/Pqc9Vc1kUe2W8I6tyz2zwRy7g3/3Nja7pGgEBZvAzqWbhkpX17ZrQVeIY9sSvz3CgVjBfYzYkPZ
	MAwIGlqrIjIleBMT9QO05AU6j1NHFMgHCxPX4fY7nDB1RDKa2WW4Cpt4K8rmo/BnzyHQDDttIkNIs
	Ys9PI5pmwoBWwioiizeePmdjNr8QV6RBOAjiqA+l3MTah4V4ZzHyPQO8+Opw67vRcLElsE0VPdpPc
	IAQXSn8YunpHk9yXGbczrlqzpKpqme4m+d5QD6ljMhg+knMzRNYz9gmKkwp0wYc575E/95u4Ef7qC
	of5xTLXIOg42ku5/Ylgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuJMD-0001o2-M7; Wed, 22 Jan 2020 16:59:57 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuJMB-0001nV-7w
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 16:59:56 +0000
Received: by mail-oi1-f194.google.com with SMTP id c77so36467oib.7
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2020 08:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MDfiBL9hRIkQihktjqWJHDulsuoBJ4pn4Oh6gdd9G/o=;
 b=JCR1lg03BB5vJ1eaUJX+618CyvHPB3xeeXGC83Rtx3V6BMWfpTtYrdPA4UNS/La2ps
 uXjW+9Gns4AayetStPvCZSwDxznUQcySA1eIcrzIkNqowGTESpl3t2UPgBie8oNaDMxi
 qRs08MjBJSa3O4hkp1Fs11LHgGitR7M4NWEYSt2grSajsJ3amp0sHs3g/8Lx9HHqPmrd
 A6cGkqoqywkHy5EKHbDInP4cDZl8a8olndaVO/yuwqGuUIQn4u/P+h2rUjhkUyfilmVJ
 v+LZ1DqZ/bllrMKt8ojZfuOSF4p3+BDxRsIsFHUDXXwxO0WANsJFlAXFWKF+r+k3nPMX
 79bA==
X-Gm-Message-State: APjAAAVz/YTwjx5akgPtA3wSKXdt7BGachsTAxulr92XTcFBg0tQUYer
 A8y9fbcrj404iE5b0p4Osw==
X-Google-Smtp-Source: APXvYqy/buEH2irQzHZ7iB8zOrFJTgu/RpXFmiyIgGAQ/cqqf+k0u1vTUvftpZN1fotzOGFfgb9/EA==
X-Received: by 2002:aca:5490:: with SMTP id i138mr7622913oib.69.1579712394590; 
 Wed, 22 Jan 2020 08:59:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j186sm13213861oih.55.2020.01.22.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 08:59:54 -0800 (PST)
Received: (nullmailer pid 8001 invoked by uid 1000);
 Wed, 22 Jan 2020 16:59:53 -0000
Date: Wed, 22 Jan 2020 10:59:53 -0600
From: Rob Herring <robh@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH V2 1/3] dt: bindings: brcmnand: Add support for flash-edu
Message-ID: <20200122165953.GA7321@bogus>
References: <20200121200011.32296-1-kdasu.kdev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121200011.32296-1-kdasu.kdev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_085955_286852_7C42111C 
X-CRM114-Status: GOOD (  10.88  )
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
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jan 2020 15:00:06 -0500, Kamal Dasu wrote:
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
