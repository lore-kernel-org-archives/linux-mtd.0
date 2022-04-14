Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25685C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 16:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xd0ryJkUmNc9etRwXh6YzN/GeBGmayOZDnzCz9TsEuw=; b=wd3COa/ZR6aqob
	xSuYwPCleksOzZa8CmDL7PuMeblyaAURYzO52cz5uI435I0clsw0yhXU7hDQKVBpcu+tOArfmzSN/
	gAFbq+9p/TOSTV6OdIt6uwB7RF0c+j1swn9hquhPbMKsN0+lqupUd+IbV82goWnEOPqFK5lK77HdQ
	lMQgWO+MKkI3RAixXHSJfnhJ3Mi5oYAO658rfkJ3AjIk1oFqJ37XFm2GNvPQmiyLq1tKRC+rqUY/K
	HNCBzqHruVXLhpOwEFwTPQ+ocqEYMUYdzsYPbWj7v3xgjzwk+IIp6+zfy6pSxLjXzsNWBWdP1YfTk
	qVW587fFtPlyXzNLvV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf1tR-006Kb1-CV; Thu, 14 Apr 2022 16:00:25 +0000
Received: from mail-oa1-f52.google.com ([209.85.160.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf1tN-006KZq-TF
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 16:00:23 +0000
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so5681878fac.7
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 09:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CknfC/PGi/RUmPx0vFlSRqvrZjpNZo6qdtUtPEw0y+U=;
 b=Vf/xVObJ1Goa9CyjN3EclsT/XB6GsxXh3oXGqy5ZmtV5hF4/Hlz7KB6olIpp8KDKKi
 /RDyGXJno3W7T9907lUnqVgC44hp0fosnSkiuxseIVfhUYto1Jx1xQQ9gCNrimWiw4kQ
 Z88tfLWP/CbCaZZdjuryT5Kd/GxA7rcozdroprJXyX9elSGNu0zJmiJToUstYzsa6ULz
 LV81zz+5CQbEGomXFiKqKBMENID1PZ338o4qNRhRH9A9reLUEpDxadG69ETXc93Rd+Ft
 V6MpB8SSkExpSsp2DEjDVmu5PkGZXBbXnu1FcB+/sL5xCjlOboMLlH5HaxxiDmnZATt5
 bZvQ==
X-Gm-Message-State: AOAM533lZvQ/u7qL8fWy7UlcAs6O2vOEC3KVPRnsQ8HsBrvx97MSChTP
 rFRnNG+8BChLc8Myqd5Brg==
X-Google-Smtp-Source: ABdhPJyt6ZU+qu6Ic2CDWPvmSCL3DLOmDOsfuZimZMM+GcPDrEth6OE6TsDYi4KFQzehfO07lGAhbQ==
X-Received: by 2002:a05:6870:210e:b0:e2:7574:47e5 with SMTP id
 f14-20020a056870210e00b000e2757447e5mr1564303oae.101.1649952018884; 
 Thu, 14 Apr 2022 09:00:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q6-20020a056870028600b000d9be0ee766sm766951oaf.57.2022.04.14.09.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 09:00:16 -0700 (PDT)
Received: (nullmailer pid 2133825 invoked by uid 1000);
 Thu, 14 Apr 2022 16:00:14 -0000
Date: Thu, 14 Apr 2022 11:00:14 -0500
From: Rob Herring <robh@kernel.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: richard@nod.at, joern@lazybastard.org, linux-mtd@lists.infradead.org,
 frowand.list@gmail.com, vigneshr@ti.com, krzk+dt@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, kernel@axis.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: reserved-memory: Support MTD/block
 device
Message-ID: <YlhFDi0uE/3Pdxjt@robh.at.kernel.org>
References: <20220412135302.1682890-1-vincent.whitchurch@axis.com>
 <20220412135302.1682890-3-vincent.whitchurch@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220412135302.1682890-3-vincent.whitchurch@axis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_090021_978545_7B3CCFA6 
X-CRM114-Status: GOOD (  11.96  )
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

On Tue, 12 Apr 2022 15:53:00 +0200, Vincent Whitchurch wrote:
> Add bindings to allow MTD/block devices to be used in reserved-memory
> regions using the "phram" (MTD in PHysical RAM) driver.
> 
> This allows things like partitioning to be specified via the existing
> devicetree bindings.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v3:
>     - Reword description.
> 
>     v2:
>     - Add note on what "phram" means.
>     - Use /schemas/mtd/mtd.yaml instead of relative pathUse /schemas/mtd/mtd.yaml instead of relative path.
> 
>  .../bindings/reserved-memory/phram.yaml       | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/phram.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
