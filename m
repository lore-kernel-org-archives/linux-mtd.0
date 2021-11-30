Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A36C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 22:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o1dpY5KXdFBMlPpB4sP/YCPBTDfIDPWLS23yYy+xVs=; b=hBQIqNJMy9HvQ0
	w0baB5PQyn9y+mLcRHwPWyR6rgArJKPUeMZ3MAN2TFbcEf8C0CnTwtA7b9mBrhMGNODWYwm5feaXY
	kSXonUiolpMVx1bqZndFotOxtixH2q7mOoNFluEqZia/W88CZD1ZvHe9vnSkikTut+49z4jv6cBw0
	GfoabcLT053fvwvh9ByNCHkQtgthwFlbxdeaMNOYBK/trh/8088k6Zoih9pkwmhowVM198ns7Y+oS
	p2cCo8ZQJjCpQUyFAYvuHz/dFd48Bv3Ug6B+w0Px8+Zy0xWtt1H/h/gg9n4FvyKlqEh9U3FX0TA2a
	xaeaGBBEJBXh1fGFpWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msBDm-006ssC-Eg; Tue, 30 Nov 2021 22:03:31 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msBCn-006sMo-AI
 for linux-mtd@lists.infradead.org; Tue, 30 Nov 2021 22:02:30 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso32283632otr.2
 for <linux-mtd@lists.infradead.org>; Tue, 30 Nov 2021 14:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2y0uLYrc4LVNu1yTztLEOqOdD37NYIMCMjTwTvihF1w=;
 b=E51Eb8D3WmFVb4JMH+L8iYSuBBDXQNxN0btVOiuvr3valEDO7O7WIVxz3cfWxEH6qr
 xvJV+M+ANsfmFgiauscnkQyrKzi1jMKHbo8n5bywNCw++SfK7MU6v8byWqY94bshEB3h
 JsJcGopg31GA5LJ6Opq3C12tMHNjiT8HAkFdBJ52XWWScwfq70P0VwNCPDMRVUbTRIWt
 j5c3Ht++FMd5yMwBj0pu72HfvauwOpF0Nt5NkNjVS9pULRVa/iaZC/gRQR6Xpw2AGaIC
 ernRzG2ySqZQ9SK+GKVWaw7kLizQCNFTO0hqtIV6foeClkIm+ZV+qL9u2k2UMU1PNsrK
 21qA==
X-Gm-Message-State: AOAM530zgGKrYr34qmiJFNJnbYsXHT8e2zr8YVOGm8XnOUReo0jEPPeV
 cVwiJwo4T1uMdC9cP6w5Hg==
X-Google-Smtp-Source: ABdhPJxL/RehRAo5pFAtvsXkVIpvv/Qwx2epoFXohjMaoKe5dFJb59Tqb8+FGJfOylP5rv7cc+GRGw==
X-Received: by 2002:a05:6830:1544:: with SMTP id
 l4mr1817648otp.309.1638309747933; 
 Tue, 30 Nov 2021 14:02:27 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z8sm2932666oot.7.2021.11.30.14.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 14:02:27 -0800 (PST)
Received: (nullmailer pid 3089404 invoked by uid 1000);
 Tue, 30 Nov 2021 22:02:26 -0000
Date: Tue, 30 Nov 2021 16:02:26 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, miquel.raynal@bootlin.com,
 tony@atomide.com, devicetree@vger.kernel.org, kishon@ti.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, nm@ti.com,
 vigneshr@ti.com, richard@nod.at
Subject: Re: [PATCH 1/4] dt-bindings: mtd: ti,gpmc-nand: Add compatible for
 AM64 NAND
Message-ID: <YaafcgGseFtQgS5+@robh.at.kernel.org>
References: <20211123103609.14063-1-rogerq@kernel.org>
 <20211123103609.14063-2-rogerq@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123103609.14063-2-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_140229_393895_EC2F542C 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, 23 Nov 2021 12:36:06 +0200, Roger Quadros wrote:
> AM64 SoC contains the GPMC NAND controller. Add compatible for it.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
