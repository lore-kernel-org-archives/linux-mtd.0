Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC8DC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Feb 2022 23:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Xl4VLmAcKOe4p75haKjjtEDIy3qciSxO/Y1VOpcqh8=; b=DyjUhXFNZCoNmF
	7EqOGPAgLvcX7U7h/3KdG9Z6/FDWaj7AJY0LcR1egQb+s0Zywztj3Mo2lLX4bOAFBqQSJn3Q5A3tV
	AJYvvnD6cFMjy29svdadu5AcQ/Wo2awA0vX3fTjekr33p7KAijA3IdIF2nGMmfsWTUYjkXJwxnKkW
	mj1FLuqyWjjXCYnMsCcr9lro1+OWWv9V7yIcgdO78nhKgJkaDjiSUemnXSMilnjpAEO6LRIVohi/v
	QXkDNHIiKLwHJ4UJPCO8PoJZIoBzlNkHzo9QVtN9vWVHmUwVPqdU9+f4UhwiYDZCuBrJAfeQs5HmX
	rAAhFJqf+TJPSSPDPHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKqKs-00CTE9-JO; Thu, 17 Feb 2022 23:37:18 +0000
Received: from mail-il1-f173.google.com ([209.85.166.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKqKo-00CTDM-Uw; Thu, 17 Feb 2022 23:37:16 +0000
Received: by mail-il1-f173.google.com with SMTP id d3so3442925ilr.10;
 Thu, 17 Feb 2022 15:37:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0cpps6fIOkrz70XNTnOiubUyvmOKMtcIh+3ek+Nhnc=;
 b=n0K1a+PW5buzOA7M33hpouwd4rYh+tS1QaLw/69Fb+ATU6qnephPBxX1LeUbsztvja
 IaHRNvAC0l2XSlFfhBZE1laHzBuOSN21gR8lUMGwldPTLmF82560iMOdcibh3g/4YmP9
 n2VLRvTaUH5rD/93kmsAoQQ39zTWcb7SlBnN0NbsxrjHJ/7NaHkj/Ysjr8711kCSh8lJ
 DVMiEJByfDMdf2ki6g+8UFsKMP/LY5M+tLX7vgmZfKSE6q+QPApJORIwYnqziAwlW2PK
 xKKPduuuqnPpBq86zB2Bkf3YfhH8dRH0VSuVhCMNvmA1hjhBaLFm2Riry7yZIqB5x17V
 XVXQ==
X-Gm-Message-State: AOAM532vL0bZ6mBFpoairLfQt/DfoX0Ghs9gWXXdfZxRNP4kWYwrG680
 Jcrofv6XZQ/Wu2IvoUccIg==
X-Google-Smtp-Source: ABdhPJxRXAu4lWlnrSyMuVGGUIlIwZ78D9qKrd5IMvKHicwBT5UyQPvXTfjdsYdS0a6np8p0LN6ibA==
X-Received: by 2002:a92:3406:0:b0:2be:a7b8:4efb with SMTP id
 b6-20020a923406000000b002bea7b84efbmr3590748ila.67.1645141034281; 
 Thu, 17 Feb 2022 15:37:14 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id o13sm2841220iou.3.2022.02.17.15.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 15:37:13 -0800 (PST)
Received: (nullmailer pid 3984027 invoked by uid 1000);
 Thu, 17 Feb 2022 23:37:11 -0000
Date: Thu, 17 Feb 2022 17:37:11 -0600
From: Rob Herring <robh@kernel.org>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linus.walleij@linaro.org, vigneshr@ti.com,
 linux-arm-kernel@lists.infradead.org, miquel.raynal@bootlin.com
Subject: Re: [PATCH v3] dt-bindings: mtd: drop mtd/cortina,gemini-flash.txt
Message-ID: <Yg7cJzAsGo4pcb25@robh.at.kernel.org>
References: <20220211120842.3388592-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220211120842.3388592-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_153715_019260_1B5AD910 
X-CRM114-Status: GOOD (  13.26  )
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

On Fri, 11 Feb 2022 12:08:42 +0000, Corentin Labbe wrote:
> Drop mtd/cortina,gemini-flash.txt since it is nearly already handled by
> Documentation/devicetree/bindings/mtd/mtd-physmap.yaml.
> 
> We add jedec-flash to list of compatible because one board (gemini-dlink-dns-313.dts) needs it.
> See commit a10d862e585e ("ARM: dts: Fix the DNS-313 flash compatible")
> The flash on the DNS-313 needs to be probed as JEDEC, it does not conform to the common CFI standard.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
> Change since v1
> - fixed typo in syscon
> 
> Change since v2
> - Added reason of adding jedec-flash
> 
>  .../bindings/mtd/cortina,gemini-flash.txt     | 24 -------------------
>  .../devicetree/bindings/mtd/mtd-physmap.yaml  | 18 +++++++++++++-
>  2 files changed, 17 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/cortina,gemini-flash.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
