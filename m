Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED53C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 12:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F107206A5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 12:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sncxz4EF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F107206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g507TbvHdAZndKqkflR68lAtfJU9c5TzsFU6pVourdk=; b=sncxz4EF6/LmFe
	ivUk53MLHkjlVQBs/ROPNfyHnyTaiymjyYX7bDdhjgMSsImG+hL6MuYhGplUPIWQpjszrqizRMoon
	ni3m+yjr7cqGSUmbt3tfdIf0kur5o+isDu5qzdNEQkFJUo0V31DZAYM7pEXkDJCpdRbAFId/mnRDa
	tg/4UBKRtQ+oFwARcZAJDD4iXy2nDha7ieqtS8iHdFVnKTln02q4o6zfBmPvKwXhCPky0oOiTnBYS
	SDoCdUsUJbebBB1H25CshVOB7eV7C45HEyP2mNDIDELSqXM4YtvF3HXIDTKafruSKcx7LL6AXqZ9n
	AfKL/7n7AVCvis3UurBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZDQJ-0002Pz-R3; Thu, 14 May 2020 12:57:15 +0000
Received: from mail-oo1-f68.google.com ([209.85.161.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZDQG-0002PD-87
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 12:57:13 +0000
Received: by mail-oo1-f68.google.com with SMTP id z26so326469oog.8
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 05:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cznThrffsFgz6B9IAhrsH7SLC/KaQFz2r6H5JGNHjEw=;
 b=QVqZNcV9QgZkWwynKF18aGF8dBNcmYP3xC3dB8lOM+eSg+xGnRDcvgyPEoV7Tho28Y
 ojCf/ubcRvpalguzyy3+Q6EHEDLJRhEYRLnYb9xNml6/WsJWyHWZc22rGOnzZe0IJWQi
 XRHURHnS6PJ42ZSK18HHOfX5ItzMefOR8OPDg70xoKXDGNzuB7yI9zjXR5kipssMSWu9
 OYbNePF/Sp1lGjBMeUKczhIVaKjrvcrJca8vpvrlksk3MP8jfhq6j6nemxf9KWa7ozg9
 mrOCvEt0id9N90ByIli08X6/QxHN0utpvVwnAS7tmTfU3l+A3JhA0EtK0rXE/RhzeTcw
 PgfA==
X-Gm-Message-State: AOAM530fraWxlWh+vTvcqqK1UGtdEQpvGibQ9t9i03YMkXpKjZo7dPF8
 1HdnT4cN5swVxHF7G2mwkQ==
X-Google-Smtp-Source: ABdhPJzJFnI8dx+4vT5VS+q5CsLxvOGqaL8uj5bcWi9aigZyaLxKb2Tzizwj/Je2B/ONKpZCJxmmjQ==
X-Received: by 2002:a4a:accf:: with SMTP id c15mr3354139oon.29.1589461031007; 
 Thu, 14 May 2020 05:57:11 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l2sm6690090oib.58.2020.05.14.05.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:57:10 -0700 (PDT)
Received: (nullmailer pid 8973 invoked by uid 1000);
 Thu, 14 May 2020 12:57:09 -0000
Date: Thu, 14 May 2020 07:57:09 -0500
From: Rob Herring <robh@kernel.org>
To: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller
 support for Intel LGM SoC
Message-ID: <20200514125709.GA8436@bogus>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_055712_291659_ED524C23 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 devicetree@vger.kernel.org, richard@nod.at, brendanhiggins@google.com,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, masonccyang@mxic.com.tw,
 andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 13 May 2020 18:46:14 +0800, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add YAML file for dt-bindings to support NAND Flash Controller
> on Intel's Lightning Mountain SoC.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mtd/intel,lgm-nand.example.dt.yaml: nand-controller@e0f00000: 'dmas' is a dependency of 'dma-names'

See https://patchwork.ozlabs.org/patch/1289160

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
