Return-Path: <SRS0=mBQF=S4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAAEC43219
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 20:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D20D720693
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Apr 2019 20:11:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UuAIZmaI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D20D720693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tSu66vT7xbPUGVJYPmrD4bS/0zSpCfNvCndCaakebs=; b=UuAIZmaIdS4LiW
	31/+2q5uVREQgSSsLam9+jsBasq7zqLhQlHEVZYeB8Ydcj+z7mvikwK3nBiVvCTLqxuzyEkLFq74b
	a8tHyuefo8DPTuB6aG4inx/zg4d7S4Z8lKjFTBUmI1Z/YYfJ2kvpDIjT07cR4XX1WOrqWKSqrh/f2
	0gamiPZBl7K4tjCltlM4hAFNxixgvW/yXnLuEVC36DDGzd5fo0FtDSI7776pI92OdEmQk7rI4tPcy
	PHXJgy5eCPKG/3owFTB3A1ULrzz01WrHm1dLwd7uSVkahc3JsiqSp5pyqR5TYUX1jVuC0IR+nuMe/
	KR6ErZRVQexZNuWmP4FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK7BW-0007bY-4g; Fri, 26 Apr 2019 20:11:02 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK7BT-0007ai-53; Fri, 26 Apr 2019 20:11:00 +0000
Received: by mail-ot1-f68.google.com with SMTP id r20so2581309otg.4;
 Fri, 26 Apr 2019 13:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EIrViTHQy/HhbaZAFL1n34DvIIYgJIxX3veMFIez2DQ=;
 b=NpZHMk0yFAI7S0TxuLqv8AZi+p9V0+BVZyrVieHn04Y+9UJmAGiNjcG3DUjhylIiyi
 dkr7e6PeO9kj141ljNVhW8rRSI75LPFba5Pc4h4/G/SnYUTKG30l1mXaE9lK2m7+fb3Q
 oGIsekLQw7yubw/lovT8JesjWmm+wnp8K7g6ZVQPQt9lEkfj/d7UknVpkV5/84Hl+NNn
 iWO0V2s0p3zPFw4/fm3IxxQ4eNiXUCLmmE0bAMIyC6FP8y0hiUvQpBuhkDEwSP95ugrB
 CTo6zVzXFK5npu2KiyrI79r4bMPdUqlSjJvWLcxZCWBVkppLGLeaaloJg1ejU5Mt9PAN
 TWPA==
X-Gm-Message-State: APjAAAVKl2XadIQ+F2/DwIXRmL9NngGsq9kSF8z3ManElICuA21m/12g
 oJcYRXJiy7mSKwqMxhCnmw==
X-Google-Smtp-Source: APXvYqz6sJpskQDgC2ryPjI0HgjLYWa/4xq+SyCHkVIXMqM1IxQaTGS+dkK6beNBDWC/ZTfXgB/ueg==
X-Received: by 2002:a05:6830:1342:: with SMTP id
 r2mr28483459otq.105.1556309454488; 
 Fri, 26 Apr 2019 13:10:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 38sm5564328otg.10.2019.04.26.13.10.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 13:10:53 -0700 (PDT)
Date: Fri, 26 Apr 2019 15:10:52 -0500
From: Rob Herring <robh@kernel.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: mtd: Add binding documentation for
 HyperFlash
Message-ID: <20190426201052.GA24002@bogus>
References: <20190423104814.5762-1-vigneshr@ti.com>
 <20190423104814.5762-3-vigneshr@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190423104814.5762-3-vigneshr@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_131059_194036_FF0DCBFD 
X-CRM114-Status: GOOD (  12.47  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 23 Apr 2019 16:18:11 +0530, Vignesh Raghavendra wrote:
> Add DT binding documentation for HyperFlash devices.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  .../devicetree/bindings/mtd/cypress,hyperflash.txt  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
