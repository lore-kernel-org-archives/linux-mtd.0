Return-Path: <SRS0=kBHj=SI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8ABC10F06
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D849B21855
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Apr 2019 06:06:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WbdAShkN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D849B21855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=REjf7Pfn1Xurof4DBIDGWBOLunPsT2qAIAz3QMXjfSQ=; b=WbdAShkNcEYd82oAo8RYR2nrJc
	/XY+F+kcAkcMals08ThvZGg6TgorBmE12Z7iacJp9bcHCpHhjmw4HY2l8vks9os2njq6BWEaSujgS
	K669mGmjXW4Sf8M7A1wX9w007HRCW5rA0qd9n1ump1FEQlygZAsWDZ99CJkHWMOxxAxykUF0c5txf
	ALre1GLHQgqClbLgalufl0A34swLwYg1r16B/+/4r9yYZPyZb9RgQvhwo5RQIFtBC8AcegeEszCtF
	0D4HkkwWFPixOd0ziOBubOYcW4ZaeS1HTzz0q2+6jrY2ACxo3COLHcGR9h0AQad0ffJNotEZ/3zHY
	MJUJu8cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCeSj-0007ku-EV; Sat, 06 Apr 2019 06:05:57 +0000
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCeSg-0007k9-H5
 for linux-mtd@lists.infradead.org; Sat, 06 Apr 2019 06:05:55 +0000
Received: by mail-pg1-f195.google.com with SMTP id u9so4185443pgo.7
 for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2019 23:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=2rS5dxlM+I+HbCox3AhVK42CM/mW/5wJmozmgACgE40=;
 b=byEiDy2CXpwW1yCbciT+BTKuys1k3dp/QFLYQvudsdK057O11fs96ZbvEI9aVDMycf
 KolaWMmd1AGx3KuNtLTLMEYJbdjyY8JQn9w0NuztNqtLIvNfcEWQnP8zYxCWRsusn0Vx
 7zZQJBxaA27C5JTgIY7UwIsiohn/3EkOplW8BGGUFCQ5VAOqQ6RAPxV7NYA79PnCwG1s
 ofjlQRbgXsVEck6HSe9BtLDeCy6BNo1xWWYoQbqnWNG/M2DWT3+ESdboj5n/TlBx3NWY
 Qr620CYcKR/AIZ6x7XcBwF6t02KsYB9oI4ik/pTpsQ8Bx/Obb93uL6WXxYvDwcdUu3Mj
 O0jg==
X-Gm-Message-State: APjAAAWILsBOuuC4v3Q/9wAVdiWA3UILf4/DVwmKKx/MhCHJWgnqWeQK
 sl4Des+log5IWx5vieiM9A==
X-Google-Smtp-Source: APXvYqyNRw/JqNCHgdpApW0s1wEL633I5rY79NwIHZF5NsceiBGQZ8xrUReyG6qT17fxfCZIeF1VGQ==
X-Received: by 2002:a63:945:: with SMTP id 66mr15532470pgj.128.1554530751584; 
 Fri, 05 Apr 2019 23:05:51 -0700 (PDT)
Received: from localhost ([210.160.217.71])
 by smtp.gmail.com with ESMTPSA id j6sm31178545pfe.107.2019.04.05.23.05.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Apr 2019 23:05:50 -0700 (PDT)
Message-ID: <5ca841be.1c69fb81.9bbef.2ef4@mx.google.com>
Date: Sat, 06 Apr 2019 01:05:49 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/2] dt-binding: mtd: physmap: Add example using
 addr-gpios property
References: <20190329021322.6833-1-chris.packham@alliedtelesis.co.nz>
 <20190329021322.6833-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20190329021322.6833-3-chris.packham@alliedtelesis.co.nz>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_230554_567285_E8EC5E38 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, computersforpeace@gmail.com,
 dwmw2@infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 15:13:22 +1300, Chris Packham wrote:
> Add an example showing how to use the addr-gpios property to deal with a
> system with limited IO space.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - None
> 
>  .../devicetree/bindings/mtd/mtd-physmap.txt      | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
