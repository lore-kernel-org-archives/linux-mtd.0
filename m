Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6461C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9613C23AFB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9613C23AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bmq9DqSvxrD1pZMB9uQXOlFtiFT0+ogZ2akS1Xor6u4=; b=THBRlPvRf+A8tq8qMZOJsBMpY
	uqg6Y9v5AM0Ta/RLBGUL+KHqhLF2UM4ngki6RzLi4CgSURftPLEmZlqQgf6rbfPh59HFxO5Y7e8hA
	abk+WLi3lyXS+XT1J34JTR/UboWSTOWht2nV91EqpP6oZqO0GWl77cjXX3TwI23gCmhDdzKA9ee8n
	dv0+1J0M5Y0VUNiWMScyEodCDDKBrZxAsMkgbDiSDdwo/uN0YnKTO6yqa5BzSXB9fwy+D3vn+VspD
	ycNoA0VzIySFxOrQwEW4+SveWqa4PKOnhvw0MNRTi4/xRXqFf53tFZMbytCDiaNuDB9LZhTHOSIZy
	u+SvHXdZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfYM-0004RM-Bx; Tue, 08 Dec 2020 16:09:26 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfY2-0004KO-EM
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 16:09:08 +0000
Received: by mail-oi1-f193.google.com with SMTP id 15so8718826oix.8
 for <linux-mtd@lists.infradead.org>; Tue, 08 Dec 2020 08:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqy913jTNhiXuHNwdA8EIGtb2jTtxvgeV3/C5GrEFO0=;
 b=aykwKjJyk+ME4qOOKBhg1DvE/5IAoHCZ/7AheLdfyyKXdq/GfeJYphYG6VL2JsMABI
 EXqRUked1CosdaNFa84Ga9b6/ONtYs5KjBWm80DmIBrp5p19g2jGRinT10x0Pv6dMVHi
 oCF2mGcJgxxx0pzJcgkyjRJ8CGaXxaslkidJnDQAJyoS6T0YFjNMUwd4MHApQWbyQ47S
 1fL+nzPxpmlDoeJ9O7KQOcRyp8YJxH+BIVQ7HpLM5/9d9DR+qShkMefeW7v4ONqrKOMm
 bo0XcrORa0fegA59cM2lDFCb++5L6k1dILd+ON8NNgRx7UFdw8vSysoI77NGfXuLyxv5
 zoyA==
X-Gm-Message-State: AOAM531nbk9N9XkMXcgshjm9QEcEkIXDnI3UdxD3bZ1hDG55F/ntgnSv
 CZC18MEQVByL14x5UrmZAg==
X-Google-Smtp-Source: ABdhPJzn7QrM9vfH8+GNIiMEKD9w8Pwo/4nyIwLzsfka0xW5ft6dCLEL2uW4pfBb0Z4tl84Z/reaiQ==
X-Received: by 2002:aca:cc89:: with SMTP id c131mr3140565oig.2.1607443740607; 
 Tue, 08 Dec 2020 08:09:00 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q184sm2003598oic.41.2020.12.08.08.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 08:08:58 -0800 (PST)
Received: (nullmailer pid 2620220 invoked by uid 1000);
 Tue, 08 Dec 2020 16:08:57 -0000
Date: Tue, 8 Dec 2020 10:08:57 -0600
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: qcom_nandc: Add SDX55 QPIC NAND
 documentation
Message-ID: <20201208160857.GA2620163@robh.at.kernel.org>
References: <20201126085705.48399-1-manivannan.sadhasivam@linaro.org>
 <20201126085705.48399-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126085705.48399-2-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_110906_586271_FA23BACC 
X-CRM114-Status: GOOD (  10.41  )
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
 linux-arm-msm@vger.kernel.org, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, sivaprak@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 26 Nov 2020 14:27:04 +0530, Manivannan Sadhasivam wrote:
> Qualcomm SDX55 uses QPIC NAND controller version 2.0.0 with BAM DMA
> Engine.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
