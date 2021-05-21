Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB74C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:01:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A426135B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A426135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRHUpB1HMmfSpRIgt5ZkpZWBwetUKbpYmjl5uiIGLn0=; b=lNtpqpZ/5qLwWLp8lhjzi5XqEC
	ER+boijiP9rrQYhAcfLurDTHw1LgEhsWOuWjClUVeLhprDEoXbQVkBRCMnRE+yK3sl5uBv0rMlMrO
	vC/wGwri2Ot8v91XLLjuY3WjyQW3Yr436WSfWEZ3ZXASHjU70jOnCaF1t7Ob3X9QXkdV7epm3m/yD
	DKXWAKZ8JXAbzoqg76xlCY41zGPt6xdaeb1F/MxKKnSTufkHAeG9SKdU5S4mwUvovYbUgSo/0H6OF
	KJNqID1lp/1ChyOcS7afPXFimPu4oj+XodomzxVN+IZ9g1MmqxKrmWpDpapiWUA+QYRjpVDgJp8U5
	8yoYxnYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuSo-003Pn6-Fj; Fri, 21 May 2021 02:00:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuQl-003P6Y-95
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UvcU4EeUaIjV+Ny7V91j+mXar+CTc1dWe9HkTz10n94=; b=IB3Cg0Z9aj3Do4cLzImhXOynW1
 zKnYCwkXuQHE28ytYI8Onw6MO3IEPUEuyGGWvYVKfAuj/au12s31x4Lre8BRSNSZlFOW0Cao1248a
 EIEfdChlXEYnB/fCdAnHUOG4RfHB61A+kE+oxdPflGN26iCS3rnYEvIkOTjALFQat83r0vYBIW1e8
 wm0mdFVm5/yx88Q0iejRUbvz7SeNX8JSlw39cPNJPsE1PvjyP7sgGGaxGXRZmV5PC5/MzV1LEqTm6
 qTLs8JgzuWL1BM/l6zUDLmvnirPPN0PE2Z2ZQRuV7OgA5UYnRqTLbv0qVQkoGlMQXl8kuEoUuCedX
 Vm4725dw==;
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuQi-00GlCR-Qr
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:58:25 +0000
Received: by mail-oi1-f174.google.com with SMTP id u11so18279760oiv.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UvcU4EeUaIjV+Ny7V91j+mXar+CTc1dWe9HkTz10n94=;
 b=NJxl3tyBjOkfYZRtfi5TfZesDNKfUeoKPx5u+Fk0opjH+K0c7ouv7gYGdo466rRGR9
 6cL+XXIMN2L/w+EwJ74xzL52j2Yfj4mKcarMACFyvl1gJFTcIBasCEsDdY30HOP1woDP
 /G+c9fqFDBRB8C0ny97ZDdw9bDkqojl4kjilGcJZsy8yZ9ePTDQnECFYgf769ZzplQat
 I9QCMfCSG1Y6cXcdbSLjOHjrbbHPngzpqjQ769QYAdo/11aD9R6FP2vJf3jAWJ2ZfULC
 k98o/LxxtcvV6g5IZrfPuErKMxBoBNvIYXOrWpLlWIvSa0O2u0n9SoVRuIu6MODjqW+M
 p/5g==
X-Gm-Message-State: AOAM533wzuyslEUQyqKGBDTFBf0Rrq4sbdtStzUUGrFo/lxgtO0oV7js
 HEdGPA6XLMFoJobGqNkweZmUc9OwyQ==
X-Google-Smtp-Source: ABdhPJyh2Y2kbzs7se4ZbLfeXy4GL9pyfcBP9KvUd+7br3OFbQ8gORAMzZAnc0R/8RK4ctVbaMrGGA==
X-Received: by 2002:aca:4a8b:: with SMTP id x133mr338546oia.124.1621562303797; 
 Thu, 20 May 2021 18:58:23 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f13sm1061181ote.46.2021.05.20.18.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:58:23 -0700 (PDT)
Received: (nullmailer pid 2495659 invoked by uid 1000);
 Fri, 21 May 2021 01:58:22 -0000
Date: Thu, 20 May 2021 20:58:22 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Helmut Grohne <helmut.grohne@intenta.de>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v20 05/19] dt-binding: memory: pl353-smc: Fix the example
 syntax and style
Message-ID: <20210521015822.GA2495628@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-6-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185824_888724_8B6F2E63 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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

On Wed, 19 May 2021 20:26:22 +0200, Miquel Raynal wrote:
> Enhance the spacing, the comment style, add { }, remove (...).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/memory-controllers/pl353-smc.txt | 48 ++++++++++---------
>  1 file changed, 25 insertions(+), 23 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
