Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1500AC433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:58:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA0161363
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 01:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA0161363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jt2ZK+HdyUBAQxouwD1Xxcf4bRnBs3JZ93GWJF2Nmwo=; b=DbmjhU/Ixt5Q+NYs4lZbWALr/k
	hCWaLfTnAWxwkWHwOPRycgUOtQE6dtmkjEB/E4H/tgMVxSyHPlJP6tyYo3RxJvUH/K22AmkFnQQQb
	aOLjbB3HKa9irh4bz2SIaDz3wwrzXSYN84j3+kxW24/aT52wal2fXF4JrXUgmku3xROmFXzmZ90MZ
	HYV6TZ/Rb1WD4OHMrNv1Z3zkxT3sbaD7dNUJPKLKGcs8YdKGOVRdhMaZh+g2e25vxAErLwKSHaMZ/
	CLNoqCuRZXn46shhKwZV7vX97d92Irvr067q9U3zcDIMrWPI+Nnth2aR0iaedMXBXWNIrF6S5F9MG
	6o9yw5+g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuQH-003Ovg-SI; Fri, 21 May 2021 01:57:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuQB-003OuO-7O
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9L7pKcvqI0fsrhbEbHnXQEuzxdv5ou6NPrrXgllc7Dk=; b=DkHIlnBcbd/A1Jp3cROGLbtkdm
 A5zfOXTG+pOVROnyvu4JS846O0BS2aQtttcfLcP1LCXK6oGj6V+sz7wvmhPB8u0femcDWXRb2Gwxl
 ECgJSh07pyPAhsOmkvzsQQrMmj8pWbULi1e7udHnw5KHpR6ziY87wKV/pWmE6607a5jGEWSnpE2kw
 CVJwvgBKiAt6awq62fEuxaKdxwpJ2nPq/V4IXfqpDN7abroF0byDDSzlr/wnAfAjxRS8xwJxIjH3s
 FW4dIZ3tXORGWcpVTXAmysSRQjbOn4ORdWW1fYxEUWsf8wE6tzjVLQDA17eT3sDmszyG89qa2k/Fi
 oPG6GujQ==;
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuQ8-00Gl9y-QE
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:57:49 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so16648344otc.12
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9L7pKcvqI0fsrhbEbHnXQEuzxdv5ou6NPrrXgllc7Dk=;
 b=dsmiGEf0sZVwuY+7F17dZ6CGOOtKlSCLtZeRoqFnZ/T11ObTC2AWARBc4CKdIpZRvn
 pgeKkyOgv4ILeefmReH+ELu4f9GXOh0hsK9Tkweci5KQkBdk/LKJMNTVBVsykq982o6i
 IR/nkjH4juO4umvTZ5PNGUPjDfJpY23whsUq+kRDPHqX3/v2fLEwiutxXKcQfBxd9Kcq
 miQ8hs6cVW/jSWmnpczHci5Pdee6Hi7/s9nBjMV8kceKiR+P/5t5d+BUG/PLk99IoMj3
 GWsnN4fOctKZwai7farGGE5SMcHSrBNUi5ttXzGPsSWwIKf0lx2NoUTM0boEmJmpVjlR
 ssFw==
X-Gm-Message-State: AOAM531D/Tc3kXCFisEg+SJkVEcGwRqfo+OJOvGqJ9NOAoF25+MDJXGM
 jJaHdL7YK4IIxXwd2OXtqQ==
X-Google-Smtp-Source: ABdhPJyaGIey5VcnOZaNjzuo/5KXRneEgguzjndJceFStXPXWdk4ti/MCiRd7D2fvjVBthWd77/V9g==
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr5900711oth.306.1621562267864; 
 Thu, 20 May 2021 18:57:47 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l9sm913590oou.43.2021.05.20.18.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:57:47 -0700 (PDT)
Received: (nullmailer pid 2494214 invoked by uid 1000);
 Fri, 21 May 2021 01:57:46 -0000
Date: Thu, 20 May 2021 20:57:46 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Michal Simek <monstr@monstr.eu>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Richard Weinberger <richard@nod.at>,
 Helmut Grohne <helmut.grohne@intenta.de>
Subject: Re: [PATCH v20 02/19] dt-binding: memory: pl353-smc: Document the
 range property
Message-ID: <20210521015746.GA2494157@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-3-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185748_887750_12812997 
X-CRM114-Status: GOOD (  10.93  )
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

On Wed, 19 May 2021 20:26:19 +0200, Miquel Raynal wrote:
> The ranges property is missing in the description while actually used in
> the example. This property is actually needed, so mention it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/memory-controllers/pl353-smc.txt         | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
