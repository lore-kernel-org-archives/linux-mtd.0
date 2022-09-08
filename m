Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6ADC54EE9
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Sep 2022 12:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9lXOsgF+s7xF4YMj/OU2ju6ejDcUsZ4WGpQ/IUo6oo=; b=u/vEkGkIhnaxW+
	wSX10DfCKLrpsvr476yUKaaVS4jHjqvb7XnScRdnK/Ec7QmeyNWGOD+DC6TTBb4Q6lnWJwRGDpgIb
	w5pXura6OAPb8RZNFmT7uDiuU2/m2rknbDidXMQxJMq89xYoQTUHRHu+n4E7y86EBPKaSZI1QMqvF
	XE65/mUXWtnl0u8dQ1SVK0Osj5Kaoq5543Dbg3lCVz+zDYqfe3xBxif3NEkZQwNnWoDfTaUGa6nOe
	V0NGF+zazHjFqN+Uxv0LCT6hyOjCWF0NjeeYfpRunHpdZbKlLK4QECpy/anusBurC6lDfRRR4vcqW
	Sh0iAuqqf668ceSHexIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGXB-003AgP-Av; Thu, 08 Sep 2022 12:21:29 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGX9-003AfV-1L
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2022 12:21:28 +0000
Received: by mail-lf1-x12f.google.com with SMTP id p7so27413685lfu.3
        for <linux-mtd@lists.infradead.org>; Thu, 08 Sep 2022 05:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=VgEQBzw8CkYfD0tP7q7CxKLDwxdimyf08wYdm+SsNM4=;
        b=JE1lwkLdwJjyylYh6CyMucqBmO10IDxKkLskdbPjbV+hFAmyhcGhrysugJC6gpLh3u
         UTjlfGQAm7CSZn2UzNfKJVwXpJvcGAvEUY37GR+a6TUpZZkwgJT9mBWjD6xrnW4+DnET
         G6Afz4SSXRiSPgRR4TEe6LPng8N/rCbJ1ApYoKI+YhEMlgOctkYIxY4V5n//tIhS5z6U
         DDVnctzdgoGGro8KojCs+YWeobRoImK/yNmoCr3m5H22ikFRXBgtpXlLlT+Pvz2W3ZCn
         dP7saY7lfj0IreSJ/AWm1thwoiLK027MbbAAyg1nk083yGLgzomJOF783aGxsl8Yval/
         pUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=VgEQBzw8CkYfD0tP7q7CxKLDwxdimyf08wYdm+SsNM4=;
        b=pxVzA8n96YCmEH4cj6DdoVqHlA7iUYkvsyPl4cxCllJ6vqfE4PG29wejjtUIDm65Fo
         +i2Ifa5Zp6nHGrBsPU5c8FV4s84RLPcuLKAj9iO+lZYnCDsWbbagO3UGk1vy2BudeHz7
         e+rcfKvXL6WV7BoN1/36SJtrlOAoaVU/g6njQjhqAtOr+WWC8A8EXvhFnpwK/jkIi20B
         qHxHLhRfJZNvdL3pv2ZMTs81278xwacrG869gyrBpXPYKhXfEJNhxLIM9bHdTK7ZJoX6
         5g+ilY4oawpizmDzYjQJlRaHzseodElpbEhPsgdzSjc3D9Znj+zT4USUoIBaDON2y9AI
         zgDA==
X-Gm-Message-State: ACgBeo3gbvkA7i+Rkpk3IHI2KJbp6lTawyhsgAz8sWNgyEfD3CW63nHL
	oyLRyjfrgs406gkovDMeJIMreg==
X-Google-Smtp-Source: AA6agR4tuDhl0ADnXwL3Hle5HBL36tuaPl5fK8SbbKt05XtYQZiLpAzFF+LyOp31cFAZNVH2s6NpaA==
X-Received: by 2002:a05:6512:2391:b0:494:7f90:ac04 with SMTP id c17-20020a056512239100b004947f90ac04mr2624366lfv.521.1662639685495;
        Thu, 08 Sep 2022 05:21:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bg37-20020a05651c0ba500b0026acc9edecdsm1060276ljb.47.2022.09.08.05.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:21:24 -0700 (PDT)
Message-ID: <f89cede6-f312-3500-c900-0468200a4464@linaro.org>
Date: Thu, 8 Sep 2022 14:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 14/20] dt-bindings: mtd: relax the nvmem compatible
 string
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20220901221857.2600340-1-michael@walle.cc>
 <20220901221857.2600340-15-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901221857.2600340-15-michael@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_052127_110696_737ADEEC 
X-CRM114-Status: GOOD (  11.88  )
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

On 02/09/2022 00:18, Michael Walle wrote:
> The "user-otp" and "factory-otp" compatible string just depicts a
> generic NVMEM device. But an actual device tree node might as well
> contain a more specific compatible string. Make it possible to add
> more specific binding elsewhere and just match part of the compatibles
> here.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v1:
>  - fix typo in commit message


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
