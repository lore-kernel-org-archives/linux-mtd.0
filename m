Return-Path: <SRS0=R+0z=OL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B84C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C8360FDA
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Sep 2021 20:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7C8360FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gH3HPARuFmrCVQt5NhLciYv1PMi+8XUP9NZzawfdPWY=; b=sofoLPXZzj56ml
	nagn7K/kyhyrDsjdpBmecGb1aHHgYFubwtb+83HwY7ihMXNDTmuY4Lo9yxlr5pyNobaqx4iEGILO3
	n1BDeoE1dcv8pksiDeX5hZW7YHbbtLxYAFbomHmXLbARqele1hI5stqbpa6Ay3XRwTqEzEsTonDlv
	/qPWRKrmYdgi2nYGooKYdRAuWSoXJaJPn/3QQi8s91Ci6xgjT61PF5SH8A8cQjDTZkoVi2SBQGvVF
	tsyO2lu0VJAxdPJO2XOjWkN5WzTF+krKJhXKGW1HE9w75I6ULFHYxFVoGT3N9NzO8DwxR6YUungx7
	IZK6zEsoUdX9WGHe2gAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSmZI-005ikh-Ea; Tue, 21 Sep 2021 20:40:44 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSmZF-005ijh-An
 for linux-mtd@lists.infradead.org; Tue, 21 Sep 2021 20:40:42 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 97-20020a9d006a000000b00545420bff9eso257785ota.8
 for <linux-mtd@lists.infradead.org>; Tue, 21 Sep 2021 13:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lIsMkc1Ru4Hy+3XDmUohr+N44VuUIeGdNclPrsd8TlE=;
 b=ixp7K2IxH2YU3JYbwuawWU8mMGPwm1fOr7w4DXLrAOjKPu4FZCiPKZuMWYB0sszqHP
 yYO8da0NzvS/WSyEvl4piTj/hh4rtOx9EUAqVKOmoQrE9EDB1SJnwTtTbpX0HSgixGMz
 rVpKxp1Ag74HRfYpnZ2MGZeQoONodeCUpX6kly7aL3znaG0C6KvjTOdPM0Mb8qVhHZxt
 l2MgxOpyBHzsQ0op9j8pKYjNcreATgOa0vozGoB36Jcxe0HpOylmQ3QKkWDnfySqoPPm
 o20Ir2e7Hso/X/uZes3cyAakiI/BBAMAYztHsvN4GCyojHyE/Eh5msWmEiFm09d2CLbc
 JCxA==
X-Gm-Message-State: AOAM530zW8sl62RM08sG2U++LYDlST30uf3jhbQbtJXigfb3o+mK6Uio
 Q8C9xfArZC4eMLHEdMAZIQ==
X-Google-Smtp-Source: ABdhPJxkU1UAKTiSDKIIDMi5tHNRusRT64dD5UXCiQJ1rdrAm9DpC0NNzmKgqwE0+YNysku5MAzNGA==
X-Received: by 2002:a9d:4b85:: with SMTP id k5mr5955996otf.103.1632256840367; 
 Tue, 21 Sep 2021 13:40:40 -0700 (PDT)
Received: from robh.at.kernel.org (rrcs-192-154-179-36.sw.biz.rr.com.
 [192.154.179.36])
 by smtp.gmail.com with ESMTPSA id c5sm17580otb.35.2021.09.21.13.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 13:40:39 -0700 (PDT)
Received: (nullmailer pid 3291297 invoked by uid 1000);
 Tue, 21 Sep 2021 20:40:38 -0000
Date: Tue, 21 Sep 2021 15:40:38 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: krzysztof.kozlowski@canonical.com, nm@ti.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, nsekhar@ti.com, linux-omap@vger.kernel.org,
 robh+dt@kernel.org, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 lokeshvutla@ti.com, grygorii.strashko@ti.com, tony@atomide.com
Subject: Re: [PATCH v4 4/8] dt-bindings: memory-controllers: Introduce
 ti,gpmc-child
Message-ID: <YUpDRkZqQjmfKZgz@robh.at.kernel.org>
References: <20210914122705.15421-1-rogerq@kernel.org>
 <20210914122705.15421-5-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914122705.15421-5-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_134041_419067_C65F5242 
X-CRM114-Status: GOOD (  12.11  )
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

On Tue, 14 Sep 2021 15:27:01 +0300, Roger Quadros wrote:
> This binding is meant for the child nodes of the TI GPMC node. The node
> represents any device connected to the GPMC bus. It may be a Flash chip,
> RAM chip or Ethernet controller, etc. These properties are meant for
> configuring the GPMC settings/timings and will accompany the bindings
> supported by the respective device.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../memory-controllers/ti,gpmc-child.yaml     | 245 ++++++++++++++++++
>  1 file changed, 245 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
