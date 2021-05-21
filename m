Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EC8C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:04:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D713861363
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D713861363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6+k1rAWV3DX5WVh+b3tqJ0LTR380TCdVR+FOBtt2p0=; b=FAviAuq8ymOb/75orJALArgWku
	XzTxT4+wPQrv2NCXFobV2wtjFYoCNnWOqlJZwtXNxvFpAcDirYjil6MP63ubE/+4Ldmj542Y7GyGB
	Zv6mBIgr9+pPtMMA8KrkaQnDFr4pAIr4cqQ02fEoX6mHmNkKQqfScx+A4QYlII2JC16tWCHtHTG1f
	nJy9qP1Dh1nKSG4RtXEI5s3EKFjnmlov7gKxNhMmSokZGhSMMWlkOYqdevWwW6nFlM9Kry6prCLGJ
	mPdRAC4T1NjYky/CcHR2YG+QLRCS9UF5edQVyu7c9vSGeEAti6n6/aOQ1oml/sn2jWw6CAYZWAC7O
	QTE20mIQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuVe-003QOi-6X; Fri, 21 May 2021 02:03:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuR9-003PEl-UJ
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=8E3lx0LtnmXkn4zmw+kmVk+CeXLZmUSlDecTRGiMrEU=; b=K4v5RqPLZsQ0sV0LHL9Awj+hIA
 N4MKQHtCM8lfpgTlt1EVVi0wyFpT72AETULF1OVYyrHuxx9D2OFV36jkrSRo9hKOWUU4gskTbtNT0
 mLS/whBJrwozELOmYWgr64W2J1a6e/e0jjV/RXCcMl1HyEfbBBv/KEBD+c+5Sp3y7KRvq5dcANrLv
 oAkMxS8+DJjFdCBGpEU9yz+dC45dr2Z57oWoFJU5P2ZjFpthA01AxqIJzLDSU5WmO2mNNilRGOikW
 YI2CA4Q6QJhphPj7947XUkFK9E4nvOgCb20O590JXhxtZtDoAjWOEpIbhh6XvV+aWmvbCW42CSyK/
 Dr3ojh1A==;
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuR7-00GlDv-HN
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:58:50 +0000
Received: by mail-ot1-f52.google.com with SMTP id
 d3-20020a9d29030000b029027e8019067fso16628612otb.13
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8E3lx0LtnmXkn4zmw+kmVk+CeXLZmUSlDecTRGiMrEU=;
 b=caO7wwKHUO5rRGyWzRz9KgwbJRafX3C6TnnSCPsCDDHniEE37YnjT0EwEaDxlzMk6o
 JJu5EyCOBfKzuEw6G9j4z3106gDETZovq1Fn9zIpiQj2T/6pTPHQXGdlCgvYtbZfMP3D
 p8DP1H7MXWHWBcB/rf94gZiIUb+ITfZsiRLiZSIN1xGoND0w9Ij6Wo77ROIVmq6kUvGl
 8VchzYmvoUm1i6/5Dlf+BgHXs3tPG0+pNcv70lwY7W5DhMYkGrTK6laX7KzOfGPZoW+P
 5X0pm7uB60HJVCFgDPa5pQ6rHFWzHGxyoEau+78O08cU9jPep5vjJQW6p4KHZPgiuC2C
 VAXg==
X-Gm-Message-State: AOAM532dSGRDDJUfp7PNuyAINRklQbdZKTqvwCFDwudkH6776Y/o/kgh
 pwg/cANaS8FgausxXoBG2w==
X-Google-Smtp-Source: ABdhPJznIlvVhog9VmvyTBs+XWtmbCFcpljzvpaYjzBLXyIS6rKxyqFFbDTryMIBOUOn9a5QCE3W3A==
X-Received: by 2002:a05:6830:4da:: with SMTP id
 s26mr5961025otd.77.1621562327848; 
 Thu, 20 May 2021 18:58:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t26sm1016521otc.23.2021.05.20.18.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:58:47 -0700 (PDT)
Received: (nullmailer pid 2496601 invoked by uid 1000);
 Fri, 21 May 2021 01:58:46 -0000
Date: Thu, 20 May 2021 20:58:46 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, devicetree@vger.kernel.org,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, Helmut Grohne <helmut.grohne@intenta.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, Srinivas Goud <sgoud@xilinx.com>
Subject: Re: [PATCH v20 07/19] dt-binding: memory: pl353-smc: Fix the NAND
 controller node in the example
Message-ID: <20210521015846.GA2496572@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-8-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-8-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185849_591752_5D480764 
X-CRM114-Status: GOOD (  12.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 19 May 2021 20:26:24 +0200, Miquel Raynal wrote:
> To be fully valid, the NAND controller node in the example should be
> named nand-controller instead of flash, should be at the address @0,0
> instead of @e1000000 and should have a couple of #address-cells and
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
