Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E0EC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Mar 2022 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysrWSnPo81EOzRSI0rdrZOL34sKqBgabYAZHsOw/jEA=; b=kfGcFfRgzxIrQU
	7W20Se7Sjcu5O4Rn2eGLm1tHOcjh7RR5oKMGF97JGJlKWWIv9Sc1DQisjoyK9JNpMvrZ2/CA4uLvt
	Yt67zdhRa0lmfTH3hpmjQraeLUo6ulCbcsgOr2dBPRUQ5v2pOieHJU7k7eL0ToM+hh7VAyhuJcfmu
	Xt0Jj0S9re9EJxhl+RMaBFTrlnzsb6j2xMEQ6qv9VMeuIDnlLc2sRvohkBGzPTn2Zme1ihcC16Ldb
	gpVHADvebae5DXm6JA3dp17+Pn0fW3/l3IuvPytBm3CyDiOrlQNySh/f6r9pkzWQB6gsO5KLmUqO9
	BBGCUuGq1Nfflr03IgSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY1Yz-003zl7-LE; Sat, 26 Mar 2022 08:14:21 +0000
Received: from mail-ej1-f50.google.com ([209.85.218.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY1Yx-003zkN-CB
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2022 08:14:20 +0000
Received: by mail-ej1-f50.google.com with SMTP id pv16so19435342ejb.0
 for <linux-mtd@lists.infradead.org>; Sat, 26 Mar 2022 01:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T8ebr2iFGoh7ryNOjBQ98YHXu8uvdUYMxvGrKpFpiQU=;
 b=AfCCIJkuoIL98rTbA4EEUwNeEtxsqSZaxK9uNP+wBF4Rj+MsRxKyD+nF+ImfeyWs5O
 5c2XnBBx09qrk0b0BECMpdAlH4dEkXI6epEflqqAm9ATqC3/You6PPyTsC6FVuvPNJr5
 nXpGEgTe/D3v2Q3OTdC6wQvMwNjJmEVLvGGzZbQrNkNKKBPHXHSsVDyUK3lm5Y9Ya6NU
 DHLbkfS14qiV4GY/fUCRy2jFEILs6gB3F5vzozlrN0KZjFlMGA2e6zL5NMwC+Pykjas/
 pkFm/9bnZ9cDzcvq3oMHPXH/weXkWGmiOAQIM9fStV7B7fS82hNWjvE6AdZxWeeN1aIu
 F8OQ==
X-Gm-Message-State: AOAM530GYyxVg88sakfA5fi2MpKkoOI6JOgojN4mybMD/4dfimG6ui6+
 OfD3A5zt+M4YB8Rk2LhjWU4=
X-Google-Smtp-Source: ABdhPJziycJCmOI8ifnO12TtKmV3cON6H184IhBIaccU6Xwb1dxUxQjhgncFsXLalZs3koHg4AKxDg==
X-Received: by 2002:a17:906:58d3:b0:6da:bdb2:2727 with SMTP id
 e19-20020a17090658d300b006dabdb22727mr15838125ejs.549.1648282457756; 
 Sat, 26 Mar 2022 01:14:17 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 hp12-20020a1709073e0c00b006e02924bf20sm3265161ejc.117.2022.03.26.01.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Mar 2022 01:14:17 -0700 (PDT)
Message-ID: <c1e9175e-e33d-ec51-4d9a-ce5c441a0ba4@kernel.org>
Date: Sat, 26 Mar 2022 09:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/3] dt-bindings: mtd: ti, elm: Add support for AM64 ELM
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, miquel.raynal@bootlin.com,
 robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220326080726.30372-1-rogerq@kernel.org>
 <20220326080726.30372-3-rogerq@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220326080726.30372-3-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_011419_471580_ABD093C2 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

On 26/03/2022 09:07, Roger Quadros wrote:
> TI's AM64 SoC has the Error Locator Module. Add compatible and
> related properties to support ELM on AM64 SoC.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../devicetree/bindings/mtd/ti,elm.yaml       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
