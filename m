Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CADCC54E49
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 07:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5pE6ZYx+fWTC+OBk+A55eWSF4tvlJbnKJ5LPdhiXuk=; b=itbbgvSYZlyltO
	+JgnonRzqUsmw8qrxMS5hou1Ja62bFGDTVgLgG93kYZK36qBocp4S25gSS01j94wHkQmwZQXhdHtt
	0YfsLyS/zdL9K6TXija1B/9vr7CS7NaSv/Y7lmfhqGdeLTlO7G5w3lE7DRa0IdO/MZ/cZaxZgc9Xn
	vXbFNcn1XowA7e2SlSBDdA5cO5oZcM0ihzpWiPpjvYqTXM/Becr4I+2pxT4IxgwzD1w0skvf2GsMH
	ssLYicSTf3UISDsfZEKq14vcwLBFoqqtNRL+kYgN89yzUJ8ILn5fVI4+9CINlUZU7lpQMP8sTEzfq
	9vPyHtptZuxw4CZ83zBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8SM-00000003UQq-05nG;
	Thu, 07 Mar 2024 07:46:22 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri8SH-00000003UNy-1Pcr
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 07:46:20 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-566adfeced4so513144a12.1
        for <linux-mtd@lists.infradead.org>; Wed, 06 Mar 2024 23:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709797575; x=1710402375; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vEFocjxe/C7G6zRYMMM39IplkNHkFI1xgU3DzRRjSU=;
        b=GO1tuOsjtBIhWHZKlfpp++yU+QXwX/yFvnJNPwrEneyyRytaTvHqWS9YRS+Nrj/ZZy
         nMghQm/P0HQF8mJ/rnUJQ1tsAatybgGcV/Q/QVA4MKCL4gDTM0L/qh7mTe2vRPx9Ehen
         YYR2O1ZQ6RaYleP0Gg0WCZCZvvAlrnM3ms26jUlw61WcxcuRNF0bBiKR0yZlh1zicTpB
         gIKBMQoJOD+f/szl7SIILq8hqtj36LLKV2mKWJIrNLX+FQR6Q4BuE/JnG+Lpvp2neNja
         PIusXtMj3s7Vl1/BTz5WwKtpN5f7ZnU3T9GM1chFckJbqDx56i+w3ZHfGFrVW0PyP9HE
         cowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709797575; x=1710402375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vEFocjxe/C7G6zRYMMM39IplkNHkFI1xgU3DzRRjSU=;
        b=JYJ2z4TUhXAhy3d/lWsB4ew75XpyjUp9axikk6RkPfRph5x1RfZW9rveSvFvU0Rwui
         8pIJbqYSGQsa0pLlN8kQ+VWogGsauNkCtbk/fwjNt960qv2lrzc0HcjN9GfMvwRHnn3l
         kX+6lVJO8xlaWBrC5tp74zibRRT7w8rzCUsw7HjKAdUrDY0/1Rnjun1LnzdG4RUnOZRF
         41qqWmucaPI9zcnLghEXjXX43VjKltnVYIY9r762cLVy6FF+4J+0Zg8anaXvI3Te9tZs
         ePXowEOPhSQaiokAnwNzNckvdaZKh+SRDV4ap9OKgGrGmz4gvri72zhdEUpx6kndqLch
         5uow==
X-Forwarded-Encrypted: i=1; AJvYcCVbv7avSMj4Cw4YCMWdPEXMTd0dKkYULk1JvG46TipUxs+yukCnTqrRpO9cycCEtFUuxu4CBLO3IsiB4UUoPzAFWIaSeZ8oy/jAVU7AcA==
X-Gm-Message-State: AOJu0YwwBo2hsHPbEAteaFpriN2EH8KzeUDX38266q11+C6LAAOFXtHu
	l0yoGNH6t7pUdD7PmnRMfNO8Xbt7SU9WPDfnTyYCJqBaTil4Efv1EG7UIb/okG8=
X-Google-Smtp-Source: AGHT+IFpl4af52prw6dvxD6VpZHr8XiDzYEFEVnS7NoLGOSu1hUyybkH3c+zyzSjt/Clbzqqa8vELA==
X-Received: by 2002:a17:906:f6d1:b0:a45:d712:7b3e with SMTP id jo17-20020a170906f6d100b00a45d7127b3emr372989ejb.52.1709797575088;
        Wed, 06 Mar 2024 23:46:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id tj7-20020a170907c24700b00a413d1eda4bsm7959287ejc.87.2024.03.06.23.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 23:46:14 -0800 (PST)
Message-ID: <19d3c024-38aa-4526-b6c1-d9543b41fa2b@linaro.org>
Date: Thu, 7 Mar 2024 08:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] spi: dt-bindings: add binding doc for
 spi-qpic-snand
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_varada@quicinc.com, quic_srichara@quicinc.com
References: <20240307041726.1648829-1-quic_mdalam@quicinc.com>
 <20240307041726.1648829-2-quic_mdalam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240307041726.1648829-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_234617_429878_1AD8EDCC 
X-CRM114-Status: GOOD (  20.01  )
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

On 07/03/2024 05:17, Md Sadre Alam wrote:

There is no commit msg.

Subject did not improve. This is a friendly reminder during the review
process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.


> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> Change in [v3]
> 
> * Updated commit message, removed "dt-bindings" from commit
>   message
> 
> * Updated compatible name as file name
> 
> * Added hardware description
> 
> * Documented clock-name
> 
> * Moved dma-names property to top
> 
> * Droped unused label "qpic_nand"
> 
> * Fixed indentation in example dt node
> 
> Change in [v2]
> 
> * Added initial support for dt-bindings
> 
> Change in [v1]
> 
> * This patch was not included in [v1]
>  
>  .../bindings/spi/qcom,spi-qpic-snand.yaml     | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> 
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> new file mode 100644
> index 000000000000..3d20a4bc567f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/qcom,spi-qpic-snand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm QPIC NAND controller
> +
> +maintainers:
> +  - Md sadre Alam <quic_mdalam@quicinc.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The QCOM QPI-SPI-NAND flash controller is an extended version of
> +  the QCOM QPIC NAND flash controller. It can work both in serial
> +  and parallel mode. It supports typical SPI-NAND page cache
> +  operations in single, dual or quad IO mode with pipelined ECC
> +  encoding/decoding using the QPIC ECC HW engine.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,spi-qpic-snand
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3

Drop

> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: aon
> +      - const: iom

Missing blank line

> +  dmas:
> +    items:
> +      - description: tx DMA channel
> +      - description: rx DMA channel
> +      - description: cmd DMA channel
> +
> +  dma-names:
> +    items:
> +      - const: tx
> +      - const: rx
> +      - const: cmd
> +


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
