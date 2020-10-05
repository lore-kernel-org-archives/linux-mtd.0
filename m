Return-Path: <SRS0=tKtu=DM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5EBC4363A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 14:42:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F17392078A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2020 14:42:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2Ya9zu0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F17392078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jh5qeFKgY5bbr76ikZKQi0YotKVU+oyMvDyFObeogZc=; b=2Ya9zu0n6kKf9raT9PhZzV6+v
	wcW1zT6z/JyZnSvWepa67cjrdQXlK/CJhs7gMfiVRip1ZpBr/xAtITxUOZEODzwOS3PUBHT8Dj67d
	BnauWdcrR9giZkDoVFGvrk+40sio+o0QtbtPReG4/95xImM82oCRrrjOzF5iXHzWgTJFF3O8MrLeI
	dz7dmbir4TjDBuBlbeBapTx3Y0/sLiWp+bqkekJvIQs31KCTeBr3VQEnon5ptakm2busoL7q/yqly
	1bsJ6OY/vwOI3wuTNK0kdOOEyr4q8HJ4YqUNjaX229F+ZRSAKW9aZB91PSdkkxIevUNGyGQPNMApK
	OCxji5Plw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPRg0-0002rR-B4; Mon, 05 Oct 2020 14:41:20 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPRfr-0002qJ-LH; Mon, 05 Oct 2020 14:41:12 +0000
Received: by mail-ot1-f68.google.com with SMTP id n61so8793984ota.10;
 Mon, 05 Oct 2020 07:41:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9bJPJc/0YFm4pMXzg6Pd5rp8R+BK4BSmdTiiXnloDY4=;
 b=Vw5o0YE4RFIPH+P9Bh6+d97ATANDECXLhXoG/P7neNO19sZsa4o9+4IMsuRbNpwJKW
 rEYIHOJUVdgSroxMxxP2MvWmTVDr8Lh2/jqCM8zmvE6In5Jp/lIK+czyBSJ4d1kAJjbs
 yidr47YilT+Cge6bpeUH9ixLHhIgi4G7DMWF26ZldY6nCTnaWY3p5V//WFTm2D1cHU6X
 YIdQCGfuBWLMCLuh8SLmyhmkzVhKK87upqfLHsGgHZtvuDY7fN7zsavfaoxMkrMIquKi
 K7yHJRq1+AIXZCwAevTFYTj+QRp1PXQrw7wFG5GbCbPbPF0q9VzBcGfaOVORChwqUovC
 fVTA==
X-Gm-Message-State: AOAM533cfL9sy2xuiQvX6DFyP7+d5ms53kS1IE/w5nCg42HC9h10S1ER
 jAe3UDGBJRxbczBEo7CNSw==
X-Google-Smtp-Source: ABdhPJxs9QD2rXZYSKcBC5z+8AzZfLlTL1JZdqwKI5hy0BOUwSmgkaRe0EA+ekgrzfEpXxDuIi8cxQ==
X-Received: by 2002:a05:6830:1f2b:: with SMTP id
 e11mr12357240oth.296.1601908871008; 
 Mon, 05 Oct 2020 07:41:11 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 2sm1921010oty.59.2020.10.05.07.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 07:41:10 -0700 (PDT)
Received: (nullmailer pid 154079 invoked by uid 1000);
 Mon, 05 Oct 2020 14:41:09 -0000
Date: Mon, 5 Oct 2020 09:41:09 -0500
From: Rob Herring <robh@kernel.org>
To: Yifeng Zhao <yifeng.zhao@rock-chips.com>
Subject: Re: [PATCH v10 1/8] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
Message-ID: <20201005144109.GA154028@bogus>
References: <20200930020710.7394-1-yifeng.zhao@rock-chips.com>
 <20200930020710.7394-2-yifeng.zhao@rock-chips.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930020710.7394-2-yifeng.zhao@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_104111_711010_096F0414 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Sep 2020 10:07:07 +0800, Yifeng Zhao wrote:
> Documentation support for Rockchip RK3xxx NAND flash controllers
> 
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> ---
> 
> Changes in v10: None
> Changes in v9: None
> Changes in v8:
> - Fix make dt_binding_check error
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
> Changes in v2: None
> 
>  .../mtd/rockchip,nand-controller.yaml         | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
