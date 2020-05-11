Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EDFC54E92
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:04:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB7CF20836
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 23:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pR9JMKRt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB7CF20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVFQXrzlm34wPu7RB4zKgA6lMe5aHi0I0xMA2cuI/XI=; b=pR9JMKRtRqhWx2
	VAh2KerpCWvCgNW+VNjlehnzP9lBUkodjT76gAohw3OJRxbqcZs86yV2gVrithvQmrfS0k/7a65md
	lp3vL3WF6aLxQklVOSWW6rpjDLVuGsL9ewbXvfcm6AC/+QGC1YUnyb1FxxOQudLEYsw9Hfn1vFUdv
	Zzs/Fvd87S8DDH/0+9ynH7rOJF15xcEIC+1YCdeCSc8E+Htoh0d0y6Gd+4NhzZpt/GHLNyOjKMGM4
	2RXS7c1r9bMeIjMmgmHjyGsT/axS7clDMQG7pCEBlj/X2fJHKMY2bmhJkj5IF0yB9Kq5zKWzDbtFl
	ZPDVDHTDSv88BDkhpiFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYHSq-0000XS-8Z; Mon, 11 May 2020 23:04:00 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYHSn-0000X4-NK
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 23:03:58 +0000
Received: by mail-ot1-f66.google.com with SMTP id m33so9022345otc.5
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 16:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6abpqm2P83o/3f2rBgdXnNsVGvBaUGfzdzSfP0B8UIk=;
 b=aBDMbgIxiNZv8VIuTa5s+HOEvXTwF6YVDr/ZT7OHFjCQ+lgnbXJe6PdNb7ISRJiFal
 lrmlgrDVfX8i2ivmVsk8u8uuEDDYv2vqem9ewOje62s0ywsXowdNG7KNxJPNB632WgaT
 O9HTlE1bcFFfMWLoVn3rY3fGqdiuqZRpZ8ty8gcfc4XNtxysm0DFKp3BcHrO/7Km2w9w
 6G1pYVDSJz9BdPh9EogXIWAtzBTR9lMa2vNwxfSVCx6rt7ADYTcZZJaZXM+2AabiTZ/N
 yuAWnb87djquF1IzuFPeniA72T1Qs5fw5LBq+Dl/shvyZo8zms+QzgdRdhYD3g3Vdz4t
 uHEg==
X-Gm-Message-State: AGi0Pubos9djnJ3L8VCaOMHIK4BzoXC1veWSC1o9f1av47zcAspBeKJQ
 JQjDhEoic6H0WKLAj6vbgQ==
X-Google-Smtp-Source: APiQypINK2hUBK6KwHLih5ZKpKToDjfgG8X1oTxLFmefw0CgowPlGu76ORlvr9A9Om6WR7IoSO5zNg==
X-Received: by 2002:a9d:70d1:: with SMTP id w17mr14711341otj.67.1589238236334; 
 Mon, 11 May 2020 16:03:56 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e10sm5007114oie.18.2020.05.11.16.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 16:03:55 -0700 (PDT)
Received: (nullmailer pid 18679 invoked by uid 1000);
 Mon, 11 May 2020 23:03:54 -0000
Date: Mon, 11 May 2020 18:03:54 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 7/8] dt-bindings: serial: Convert ingenic, uart.txt to YAML
Message-ID: <20200511230354.GA18582@bogus>
References: <20200426185856.38826-1-paul@crapouillou.net>
 <20200426185856.38826-7-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426185856.38826-7-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_160357_758407_AF54080B 
X-CRM114-Status: GOOD (  11.22  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
 linux-gpio@vger.kernel.org, od@zcrc.me, linux-mtd@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 26 Apr 2020 20:58:55 +0200, Paul Cercueil wrote:
> Convert the ingenic,uart.txt to a new ingenic,uart.yaml file.
> 
> A few things were changed in the process:
> - the dmas and dma-names properties are now required.
> - the ingenic,jz4770-uart and ingenic,jz4775-uart compatible strings now
>   require the ingenic,jz4760-uart string to be used as fallback, since
>   the hardware is compatible.
> - the ingenic,jz4725b-uart compatible string was added, with a fallback
>   to ingenic,jz4740-uart.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/serial/ingenic,uart.txt          | 28 ------
>  .../bindings/serial/ingenic,uart.yaml         | 94 +++++++++++++++++++
>  2 files changed, 94 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/ingenic,uart.yaml
> 

Applied, thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
