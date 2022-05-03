Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A827C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vDE8bXJ8k5ciWCprG85F4CykNAZGL1vLKCE1Zwp18Pw=; b=zxIZAZLnEu/KAw
	dV11KlyUBMMTX3D9y0PNRH+btwguXgYWzL3/4gstpX2L5brfLpABrqK83AZk7v5SpmZlO11K1SzCd
	y9Ql7dwp/F1q6/Jl07wcv2DLw3Nayzehqlr22IfYIoP14CGBBksJ0AOtDDQMrTyLOQzER4JfkyDuL
	nRawA3r6EezTu5B/qOMtLJY9EjWLl1fCAxWIiLccnmw4DgS56F3TH16bOXnZkpUhRcxvu/qTls9La
	YDrzYgtfG4qDK3tFeKon3aqW7IbFtlYlHvnogH1OzjzcPcodces8kNEjj6oXwkq19EIxj9V1waFFl
	6GsVEiljILTwFB3wHT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqqT-005ccQ-51; Tue, 03 May 2022 11:37:33 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqqH-005cZ9-Gw
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 11:37:24 +0000
Received: by mail-ej1-x62d.google.com with SMTP id dk23so32872018ejb.8
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 04:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=X1FUNuB7P3eW2ayDNUqILdNTj2LgjfmvS/GJDjAZwJ8=;
 b=m1lsa/lUBG13ARmSDKBacb1BxkHOLDYVNgdzx87jaByNzrYBqQjteQH9jkfbbdF0QO
 gVBjSQDRDw79CP7VbvuDmFkUQHW5Y/2HQOpqKUZd50/mRQE0HrMFgj8B66PmfYRy61kb
 8mQDe2M8M3SeuqAHv+CkuKeCTRxKJ8py6uI2LM1l0QxqNtLGG3TQ/E1drhj9elaMYM+Z
 xFA/t/PW27qFlRei0Or6PigQwyezhQQlkaMdEd86vK4ijPxTDPA3k4qBDuVAyd7WmywV
 UJb9Ji7I8Ftv+i2NiOVJKZ3oCXUG0kPPc9hYXimNdHyqsP34bD3r76D1aIy486doAtNa
 cl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X1FUNuB7P3eW2ayDNUqILdNTj2LgjfmvS/GJDjAZwJ8=;
 b=z310QDYp1jzkM3wBoO0M6XISO6iG1JB/LT4H/xPVeBKTrdwryepTWA6udWguIyBfzi
 xsGa03Jr4nZ4ssIAKKo2j6BSNJmFwmjN4oXoOc/T/8vdyzfK65b5ofIDk7QRLTnEjJAG
 ymrtJuf2xPuwaI96Wr939WK2j9lPJKafhj1gS40d8whJfuiz7RuDaR20UjpT6dp1cV5D
 OacF40brv+0GVorCj3/HpcM1bLMgI8WXH4Tyo/xisxZeZ5ZYb0eKgiJYZhomy0Yu7SqO
 TnB2uBDZ9hOsX1ar97HHXKryBJJ4ddYp9jKJukt4ROHm2kCkMtxWkE9rv2gF/KGbnxnj
 Xmig==
X-Gm-Message-State: AOAM5303dyaFh5Jkq1SBa/RqtCH7C38bHZZAEdyoQK54Z+5FFk7H79YF
 IYhVnhnOD5rN/rkrw2OMe0I63A==
X-Google-Smtp-Source: ABdhPJzQ+6Vtojorbgz03fnGzcETCdUI4hWoJhuVofseBZB8aIdh7DtxCNdBnYFVXj5i+orsRW9lFg==
X-Received: by 2002:a17:907:1c9c:b0:6f4:2918:5672 with SMTP id
 nb28-20020a1709071c9c00b006f429185672mr12582950ejc.439.1651577838380; 
 Tue, 03 May 2022 04:37:18 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 l24-20020a056402029800b0042617ba63a7sm7841464edv.49.2022.05.03.04.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 04:37:17 -0700 (PDT)
Message-ID: <b7bf8ab3-9680-6318-a575-bb1dfaeef405@linaro.org>
Date: Tue, 3 May 2022 13:37:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 0/2] Hi3521a support.
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>, arnd@arndb.de,
 cai.huoqing@linux.dev, christian.koenig@amd.com, devicetree@vger.kernel.org,
 gengdongjiu@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
 mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net, p.yadav@ti.com,
 rdunlap@infradead.org, richard@nod.at, robh+dt@kernel.org, sboyd@kernel.org,
 soc@kernel.org, sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
 vigneshr@ti.com, xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501173423.2473093-1-hanetzer@startmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_043721_632597_8216408E 
X-CRM114-Status: GOOD (  10.01  )
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

On 01/05/2022 19:34, Marty E. Plummer wrote:
> Resend RFC.
> 
> Changes in v2:
> - Actually include the dts files.
> - DT Bindings still missing, as the the driver is not quite complete
>   (need to add the reset controller bindings, have't quite figured that
>   out yet.)
> 
> Marty E. Plummer (2):
>   clk: hisilicon: add CRG driver Hi3521a SoC
>   arm: hisi: enable Hi3521a soc

Still no bindings for boards/SoC.



Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
