Return-Path: <SRS0=vJsE=D3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719CFC4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 15:53:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0494D22250
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Oct 2020 15:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Suw4eW3g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0494D22250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VgpWwl5LCNC1VNqqVUHQxb19FxlPAvSBxXof+E/xqwQ=; b=Suw4eW3gukI2Vt+4DHEQLl/aK
	oH++YMeYUXBCQfYBvGozBn9svWsq1L3tDrGlxOnTEet4iKZBWd3smdyXBoMxI8/cC4T5bloE+Nb2g
	0g8/BbRzvCnYHDxEBIMNK7/Sv0l9g5Jr0GTPBZKa0qcN/XvY0QM7AGQiaHDRVTmD8VJzZJRf4PzLB
	O2Vq3BP5MPb/P5Agpun8QCCaDjkB5zHgEaxkVgnWiPkd/1HTNec00r7wIMC3+aHumn5Ygu4hMu3BY
	eOXbGKfghf9btmdHIVwvZc0I7ZsWM1oXyY9NF3JMV1vK6ixMTepLL5svyv/+QlSrhQT5tP69CpVmx
	o0ZGIvb3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUtwB-0001cz-Ix; Tue, 20 Oct 2020 15:52:35 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtw6-0001bH-6u; Tue, 20 Oct 2020 15:52:30 +0000
Received: by mail-oi1-f196.google.com with SMTP id w141so2648433oia.2;
 Tue, 20 Oct 2020 08:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cuj8FYcNkqUs6si3CJnFao+OyDVHBcl/RdsIhf6hpE8=;
 b=G/C9Ol2neei8MW0gx9AYU6mMQZJNMReeDRhhWpoXqilT2OnmFuW+p69L9Ob+sgQ3hl
 eDaT2y2fj47F2tMutbq3OAEKSNGC7P2PnMJM6x29frpy6w/Lc7S9CM2M99LpvgoKSimS
 MMhsv44kR/871asyI7IO/OB3s1o63hRgmMoCEqZ8lqWcUJYpjYPz1zsMucFuMF3IasGE
 kD4wjqsY9VwR5KgH1/9zkxkShUpV2T8HgtkzEO/4pluKU5ay5nlD/gq4grnTpwzP9M3j
 dXcDwz6AtZeuvb78laA0f7OHyM8PbubTcngocFEjJLWQWGixVP6bkGuwvROUsRumPrKw
 C//Q==
X-Gm-Message-State: AOAM530r4PdH5XnPiumrQ0ukmRsx6JCNHI3pddlAes92vGlXQpvAP7K4
 np/qrncEsMhbn6+hqAzYfEakv8Re7Q==
X-Google-Smtp-Source: ABdhPJwm+3bWHCRyFI+ShnwRrr9u7+alcmPQdLWqF0fyKmjdJS9/IpzApUmx78OQrOzZeNNnLnqxXA==
X-Received: by 2002:a05:6808:3bc:: with SMTP id
 n28mr2127334oie.171.1603209149057; 
 Tue, 20 Oct 2020 08:52:29 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j8sm514782otn.53.2020.10.20.08.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 08:52:28 -0700 (PDT)
Received: (nullmailer pid 906474 invoked by uid 1000);
 Tue, 20 Oct 2020 15:52:27 -0000
Date: Tue, 20 Oct 2020 10:52:27 -0500
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v12 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20201020155227.GA906028@bogus>
References: <20201020031733.17883-1-yifeng.zhao@rock-chips.com>
 <20201020031733.17883-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020031733.17883-2-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_115230_273739_B95F368E 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: devicetree@vger.kernel.org, heiko@sntech.de, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 11:17:30 +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v12:
> - Fix some warnings while make dt_binding_check
> - Drop a allOf defined
> 
> Changes in v8:
> - Fix a error while make dt_binding_check
> 
> Changes in v7:
> - Fix some wrong define
> 
> Changes in v6:
> - Fix some wrong define
> - Modified the definition of compatible
> 
> Changes in v5:
> - Fix some wrong define.
> - Add boot-medium define.
> - Remove some compatible define.
> 
> Changes in v4:
> - The compatible define with rkxx_nfc.
> - Add assigned-clocks.
> - Fix some wrong defineChanges in.
> 
> Changes in v3:
> - Change the title for the dt-bindings.
> 
>  .../mtd/rockchip,nand-controller.yaml         | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
