Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDFBC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 21:34:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EC6464F77
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 21:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EC6464F77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4AQg5m1kz629LtWPZsPgo3QwxclsQXBY4PXyriRvC8c=; b=SkbVGE3R8nsPCfo9sF8hK7hpO
	4oY5xiS8u0O8mcvyVmcs+RGekLvRfbTvwsEi03rV27SAJ8mpy/Nf5l7PZFbpJkcpTEZqAiqrWDH0q
	KSj367MD84v2hHowCMiJZuhHcHAC+9MPPE23qqM7Eq8QbkUvHgj1R31LHgDfVyuzgQv5GKiu3nrKC
	ybUzxASswcWE0Z5Pm4+yXF4MmXVbp174MiIgSGj8OGSh8g1FkxQZoCRdTjQ+WnuY6OczTaSmrCq00
	Zic0ZmG8vyD5OpgA5Z1+1PpXVmHoSIwmSc0a/IIOD/TkUeWHB5anACJBXNiTSyy65d9kj/SQx96l7
	E/Bg/XRuQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMHKP-001ucM-Pi; Tue, 16 Mar 2021 21:34:13 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMHKL-001ubK-R1
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 21:34:11 +0000
Received: by mail-il1-f181.google.com with SMTP id i18so14067762ilq.13
 for <linux-mtd@lists.infradead.org>; Tue, 16 Mar 2021 14:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wtVmsGWaSjLvC34llZbZffJDXkhsenU9qqvAZVKv1/8=;
 b=HhBTpA12r6iDoTnPl+FXkw/ysfXTB9s6OwKDIk1spukwfrfTNLnBP7F5FUfDlgkHnx
 9axJfHYQc6SFbViFatpqxzF8Bj8/bk28iDxjBSoeONRYJkTsiWOdDQnbtGBlFsrFv6lz
 hPgfMcUB38cBNIdG2eJ3zUMFDQ2qnEWJNNr7zWdECalS2/aTlfxknSqtrELDndvu4czh
 xqT6ltcAnb22Ry9xtiK5NZyvBpVUxdnwu7MBk/5tDgj2JrG+zlN2LotclxH+e5nfj3FP
 yY2dZKz2NpJK17EqNZ61ZLpJCcwsevrcul4xA2pLCePTXLj/0ivzMeZCzjWF2qkRjPU8
 SzGg==
X-Gm-Message-State: AOAM532qxbt+aomuTbabAp/i/8VmVwlQ+qR2C0cPj2IsBDffBuzCrhZa
 epiuaJOw3YN1RA3GCa6n7w==
X-Google-Smtp-Source: ABdhPJzBVv7HSI1t2gaU7fAZ+GPPij0ZTroo2DRbrLzDx38CURXW9/HTqY0BthmvVcdgHn2IQ6rywQ==
X-Received: by 2002:a92:c5cf:: with SMTP id s15mr5219725ilt.149.1615930448006; 
 Tue, 16 Mar 2021 14:34:08 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k4sm9048115ion.29.2021.03.16.14.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:34:06 -0700 (PDT)
Received: (nullmailer pid 3710741 invoked by uid 1000);
 Tue, 16 Mar 2021 21:34:04 -0000
Date: Tue, 16 Mar 2021 15:34:04 -0600
From: Rob Herring <robh@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
Message-ID: <20210316213404.GA3710556@robh.at.kernel.org>
References: <20210311095715.17048-1-ansuelsmth@gmail.com>
 <20210311095715.17048-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311095715.17048-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_213410_201588_5BD822C8 
X-CRM114-Status: UNSURE (   9.44  )
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

On Thu, 11 Mar 2021 10:57:00 +0100, Ansuel Smith wrote:
> Document nvmem-cells compatible used to treat mtd partitions as a
> nvmem provider.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  .../bindings/mtd/partitions/nvmem-cells.yaml  | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
