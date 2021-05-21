Return-Path: <SRS0=4Ctu=KQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07087C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:02:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 524E361363
	for <linux-mtd@archiver.kernel.org>; Fri, 21 May 2021 02:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 524E361363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEpd/IWxJts7VagsrfZIAyAVmw/lvvIjJzJHI1N0FH0=; b=J7/VvcGs3/g5//HiYARl/tCkDk
	qtVRvQrCJtPeFy2IyLCY1ejoMZ70aDB7FI3W2WUZpFQUdGFzQSZwDpiXzKWjTFlTFwjsT/YqMAkN7
	8EE6NF/gPQxfz5YP/vVDiuZ3Q58lnXEUe1pZmE/PFwQqHVuJJYzFT1GoZAYtg/zpb9LIjfINRb+RZ
	gpFE0jmKC2YcKmfAJ6RDouMPHgbY8HzMbTxFoVBMY+DD4X08XMVM3nkWduC+2DepWIRAz5Sy1nflW
	qUWpLKCMjowShLOoH/ghyGXTX+5ivgFbxsPe33Af4kaljkf9+6EVmpC0YrAivUtb4zRl+BcNLzQpr
	YEIXJgjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljuTx-003Q3M-Et; Fri, 21 May 2021 02:01:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljuQx-003PBP-Kr
 for linux-mtd@desiato.infradead.org; Fri, 21 May 2021 01:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vvC4Y8CR9bI+JUYqRL1jBowD94kwSZdRtPupkAiyU5s=; b=2z3Wp6t+YYJyiCazO847HS3FSL
 3JtyAUQc13WkF9wyuKi7ByRFg7Wzq1TPqgSqiFCb2UoGfRaYeklle7XYodOuqfEd/DtoH/WZuf6HE
 KVpKvYXNYSskjIw3Jzt0cXcYxRjY7fuLCrSHLTnkyQx7ohVhdJWbANMjx0htQZNnHHKXaMksdJy0k
 iT/364X6dMG7oEyW4li7k+CMJptpSAKInfHbRuaXjsHFf3omC611HjWB96pJ8b7GiGC2sncE7a0TB
 fbQuBwfBX3IwHzS0/wI/pZ/kCf+TGSyE10VbDJAQUoJ42DSQaClnaPOvEw9sFTqVuh/Q2s7Jtij8o
 y0FMWN5g==;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljuQv-00GlDb-13
 for linux-mtd@lists.infradead.org; Fri, 21 May 2021 01:58:38 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso16710726ote.1
 for <linux-mtd@lists.infradead.org>; Thu, 20 May 2021 18:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vvC4Y8CR9bI+JUYqRL1jBowD94kwSZdRtPupkAiyU5s=;
 b=hti2h6V0OfWsfuyaTwt/L9aEJSmh3eCX8zSP5byyd58lqVX7MVXu0Vn82LNGzWw4nO
 FdRBo8l8Fr+KSEO0xLzsoDQ7mOl/FLH2Thtbl0+y0Hq3uqG+aXZyq9RJ5DNGQMGU3Kbc
 68xgVngoLifGEv62/SKpbwVEV9HJzS8qgMlA29VcEzdswU1JpGYTmEl0OH14aTg/dlbY
 1mNp2zc7CFoM0y2jWSpQMPOYKvwK1aFY6T8UtKQkUC/WEUER9jVOJGDd7NMO1Y5GcyJf
 ZJzits2oI+JtM15ySN/c9w4h17rg7Tn7oNJ1vnC4CR03NXDOQqOg7YR6HGUZ+iUZU55A
 YB+A==
X-Gm-Message-State: AOAM531EFxqnLWcQm/LBkQuq3HYK5g1xW2UGJ8vDsJpnBsEXFwQYdzDc
 VOkpMVUV49/W8Lno7N+P0A==
X-Google-Smtp-Source: ABdhPJyAx6OTiaug8hpl/Ku5ud6j2Rhov9Ij5B1x90Qa5sT7b+rPzq86IuC4/9eZlCjqNDcA0pfM2g==
X-Received: by 2002:a9d:7610:: with SMTP id k16mr3917154otl.32.1621562316433; 
 Thu, 20 May 2021 18:58:36 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o18sm1018873otp.61.2021.05.20.18.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 18:58:35 -0700 (PDT)
Received: (nullmailer pid 2496157 invoked by uid 1000);
 Fri, 21 May 2021 01:58:34 -0000
Date: Thu, 20 May 2021 20:58:34 -0500
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Helmut Grohne <helmut.grohne@intenta.de>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Rob Herring <robh+dt@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Srinivas Goud <sgoud@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v20 06/19] dt-binding: memory: pl353-smc: Drop
 unsupported nodes from the example
Message-ID: <20210521015834.GA2496096@robh.at.kernel.org>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
 <20210519182636.1110080-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210519182636.1110080-7-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_185837_088515_EE4CB465 
X-CRM114-Status: GOOD (  12.50  )
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

On Wed, 19 May 2021 20:26:23 +0200, Miquel Raynal wrote:
> These nodes are given as examples and are not described nor used
> anywhere else. There is also no hardware of my knowledge compatible with
> these yet. If we want to be backward compatible, then we should avoid
> partially describing nodes and their content while there are no users.
> Plus, the examples are wrong (the addresses should be updated) so
> let's drop them before converting this file to yaml (only the NAND node,
> which will be fixed in the example and described somewhere else is
> kept).
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../bindings/memory-controllers/pl353-smc.txt          | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
