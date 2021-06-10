Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AE5C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:50:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECEBB613D0
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECEBB613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ues7feLdBosHvx1IJEF+pFZW5ZhuZO8zidSSnOU+KKc=; b=0QddNwQxOVRZVO
	ucDNxt07iZiH1ad3fUjbnUx5Umr5tyIG69zJzsAm9/6TOWp2pB7X6xZvYZpCn8sYPHlGJ/T/w6GWL
	aHQR3NxNhXX+YGPgWlqwgUy6jF0iQOBRoKLr9GVzW6AJXU+ZdrcaNETdAAopQmnhRlD8pUKKsWrk5
	XsgwuP3y9zZmcM+OIS+FHrYyJDe7R36lLOFi1Bch9ZFbwwgZRteXZkpAB5lUYlyEyGWCalx7sMGn8
	k6gRyUWyLdgD0tryVkH+6FhysfKh/637XTOt5zVA/osUzXElCvmcG/VrNoa1dz87S3JlwDdvvf2TB
	MRZZMTP4+x3toMpDq5qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrMwc-001ScI-C3; Thu, 10 Jun 2021 15:50:10 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrMri-001PYp-Sl; Thu, 10 Jun 2021 15:45:08 +0000
Received: by mail-oi1-f177.google.com with SMTP id m137so2577578oig.6;
 Thu, 10 Jun 2021 08:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3jqSSo5ZxW4cngaVZ8vIXakfFOsb0Nrxx/7Baa6wZNU=;
 b=gBLY9FSOmSfb6SxWCFM/XiUik2x3AKdzOyBCQEa3wbBDIooWOgKh9tJ1vsUDadhnoX
 dGFJkkbmMTehgGhTp3guCiSk4/tZnEbcQY7Deyg6obFI9o8ykKgrvOrR56gw/O0t3CON
 6C2Pxi1p93Nni7l/cC5OzzSxp8jEuNMWFhqvKsyF91BQ7zOp+mX/wI5x0kx/le9A4LD3
 +maBA04nIykAA69IZ30MY9fM2LsPhrqs7+xvV0GqUNRWl/KkzoNo2yj7lkdOlx22ixHx
 EPLHg29tIdRc8+ytMzRKwfhcDW418NvxhIba9GYUGSiQz8FnAsgg14NtwOOovhb/e/Is
 RDwQ==
X-Gm-Message-State: AOAM531gayihg9MMUZk8SXE05QHqttrmp9jfmfMnArAtuLsDZPl9JJSF
 uscCU1Ofn5FPnfJY5Gelug==
X-Google-Smtp-Source: ABdhPJzurAKnW/5A8ES4UdO/j4opb5V8dick44tOpPDgqwIp4RTe7SZTvh+JcSB8rzhoffnoqjPwww==
X-Received: by 2002:a05:6808:7c5:: with SMTP id
 f5mr3770143oij.111.1623339905754; 
 Thu, 10 Jun 2021 08:45:05 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.113])
 by smtp.gmail.com with ESMTPSA id f7sm589309oot.36.2021.06.10.08.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 08:45:04 -0700 (PDT)
Received: (nullmailer pid 1863145 invoked by uid 1000);
 Thu, 10 Jun 2021 15:44:56 -0000
Date: Thu, 10 Jun 2021 10:44:56 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>, helmut.grohne@intenta.de,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <monstr@monstr.eu>, linux-arm-kernel@lists.infradead.org,
 Srinivas Goud <sgoud@xilinx.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v23 09/18] dt-binding: memory: pl353-smc: Convert to yaml
Message-ID: <20210610154456.GA1863070@robh.at.kernel.org>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
 <20210610082040.2075611-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210610082040.2075611-10-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_084506_976408_146A1794 
X-CRM114-Status: UNSURE (   9.21  )
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

On Thu, 10 Jun 2021 10:20:31 +0200, Miquel Raynal wrote:
> Convert this binding file to yaml schema.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../memory-controllers/arm,pl353-smc.yaml     | 131 ++++++++++++++++++
>  .../bindings/memory-controllers/pl353-smc.txt |  45 ------
>  2 files changed, 131 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/pl353-smc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
