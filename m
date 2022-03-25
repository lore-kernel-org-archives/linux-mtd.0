Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEBAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 16:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sv3RVOUO6pcWeeXPpMSOcCEckh+XCGKpTcKdHg8CGwQ=; b=pxLTMbHZsPeZMZ
	Pit1O6d76Ui/Iaal7dRxXA7oaXHp+FSyiR69q13Bxnp3tcX7FxPyW3BLX8+zsPIm00gDZYWSMKKYB
	fTcnDwP8ErYr7Vx2HANatOWAqNMqcbcBv2ycbWImJpo3qIXrGq+1hREBFVCni/NYXficKoq+EUZ0s
	7on7hc3G54vAhChhwpn3TndHyIATMhyMnUpBRRGahvgE9p3pSyHHMVv0qpMl827sdDdHKVrvqQgZW
	VKdLl5EbJMYdsU49zwK49toGkN+q0O05ftktYnM/EacV7h5L13PM7KFSgcQLL3uiIKP5dNOyMxDOJ
	AI2sMQlzKF66q1HV5MTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXmhZ-002b9O-H4; Fri, 25 Mar 2022 16:22:13 +0000
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXmhX-002b8u-2S
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 16:22:12 +0000
Received: by mail-ed1-f41.google.com with SMTP id b15so9850967edn.4
 for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2022 09:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=25Sv76S3nsIXclHnSSNKGZRwYOFE+JeCmB/X5ru3160=;
 b=cHkBXXwn3M8ozIIFTR+U4NpKNqwqxwEyYjCmxdFnwRpW4BJznjv0lhsQ5kBoL+tWkI
 vXSG5Epqc3z23PTxSktNQSs7pRhi1v0AJBKLI/C+k2Cq0q312dz6hG/k1RD4rX7V7oHw
 4bHbphzsplEAweVB4bfcr3n9uByFHo3LKTo8gm3sdiMkpWfkNpj8QQP8zsw4ph4CfaZr
 hIpbT+xJ6Dd6vVIQSyvMlSWTUcvfAQGTG43oMMfuMzW+qCqrXRDXpDUFOYrF2g8eswBD
 +3coiPTJ/vuXWBwBxEq09sLp1ajQVTwmvelflNCek2pr0wf5MCiZSXvvbHhYqn7snnDE
 wg9A==
X-Gm-Message-State: AOAM530GUbW9IDRJOgFct2CBpgtc4Th4Quh5x6XDOgNiEIlfG3UScR+g
 3dAiRx0B9WtKuWTrqcTLWUI=
X-Google-Smtp-Source: ABdhPJzlWhOcwaAePVg/IepGLB+F80voFv4n8ELMntFLxO0cDY4gE9dISPGaxZrLtJxAP9NILWAwBw==
X-Received: by 2002:a50:fe81:0:b0:419:16a5:d265 with SMTP id
 d1-20020a50fe81000000b0041916a5d265mr14211658edt.4.1648225329129; 
 Fri, 25 Mar 2022 09:22:09 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 c14-20020a170906340e00b006ce98f2581asm2449507ejb.205.2022.03.25.09.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 09:22:08 -0700 (PDT)
Message-ID: <ebca0e5d-cc24-af1c-5308-8544682984ec@kernel.org>
Date: Fri, 25 Mar 2022 17:22:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: ti, elm: Add support for AM64 ELM
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220325123707.22020-1-rogerq@kernel.org>
 <20220325123707.22020-3-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220325123707.22020-3-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_092211_146054_EBFD0726 
X-CRM114-Status: GOOD (  14.59  )
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

On 25/03/2022 13:37, Roger Quadros wrote:
> TI's AM64 SoC has the Error Locator Module. Add compatible and
> related properties to support ELM on AM64 SoC.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/ti,elm.yaml       | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> index e36452b742c0..967c87f32c71 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
> @@ -16,7 +16,10 @@ description:
>  
>  properties:
>    compatible:
> -    const: ti,am3352-elm
> +    items:

Why do the items appeared again?

Make it an enum in first patch, without items, with one entry. Now in
patch #2 you add one more compatible.


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
