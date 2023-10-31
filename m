Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E222C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 17:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=slnHneruYq9GRMI6Q746LD4OhHExnitswWtWn86UHnA=; b=GTnRPU8vgO6uPd
	qgnuUkjtuLlpZu+iJjUZIEE/zI7zMj/ho50Mt9ZHOw4OfsiaCmbd6Sk7PSH3gD/ux5d1Wfdm9Csp1
	CrTrCAfikehzSG7ScBRqvularGzjw3sAKSWvCztTBWZMV4RCkyyeEmWoyJlgAWSCJsEs37a/Rv0/i
	XJjw2DDfvh4+psvPFHPWp/95TyiocWSmZkD3SZGy6sNQWmA4LA5hF11wbSiFS60PAT8EA1iZvXGn8
	OSd/F8IOoFKinSSd0ZSQVn7+8wRGIEs2XGxGyYwcRNlhYfS+w1jJSsDudclXGbr2ffGaL+RuPVhDr
	t7rmY/CCi1O4LpDvLQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsJF-005pHU-2N;
	Tue, 31 Oct 2023 17:13:45 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxsJD-005pGI-0T
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 17:13:44 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so883243766b.1
        for <linux-mtd@lists.infradead.org>; Tue, 31 Oct 2023 10:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698772420; x=1699377220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQTUNx4Mt1V3Xbfj6nADMIG97fP/+CR083uBLNeQZTs=;
        b=YlGb4/7iYahp7AstPJwfdYbDpMKjuItEOBIFTLYqoT+D8M8Z7v5qa6aC//1vUffOef
         JAxZ6POh20OzhLrRbL8JKuizkxS6tmLUKXeOHjJjuC3WqqhRPFTEwNoTLcxRXR9hiSYi
         H9BA+z1gS59Rwi69YOHStj1PeR28wT+7JQYGlnRg74QZcE9ekrocR2+nGA00J2BpIfqy
         pJ4JzQdqul4/Rp2sEiVnUbe7TzrYVhfUF2AGT1LLnUYABOOKnCDs29FQrB+MctF/n1zu
         3qIbO7nhKawDmXizPPsr4QRgPk+sDmZAw9xSpkJN4/pb4Vw+/Pk3yB1z6F1HJwtKRUCB
         mKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698772420; x=1699377220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQTUNx4Mt1V3Xbfj6nADMIG97fP/+CR083uBLNeQZTs=;
        b=rckMBhIY50b9tdhQX9vNxS3Wm0MoeDe+wgawNffZyIoxVVgrwgM/oLtabOs1PEAoXa
         Ljm+bvb86jwZspy9WisG1X+aqUB9TgYScnSA6ylHWJzMRfsiqcY2GInYhTHeXNlYlvG5
         JvCk5Jmr4SjXQtimY836bZwjQ/t7p5KQxXNLI6/aEoKkG2cA4mvXUhvMTYTnUPVuJbfq
         DK+M9jD97SVUE+KMFy8rn384lpH3f25ZCJx2EPcaQ8BXU3d7il8xKDjMy3n6z5Q0Fem7
         q/yGuBsKM67yxNf9YApqFedeL/KuDtWmXT2jIYFAH4SgkzbE5PzuMms+xIuQnS43qhdJ
         Db+g==
X-Gm-Message-State: AOJu0YwwMKXnoU4s7n36qCdyrVdaoLBkdhhszpQFFOvYn776iPrtcfQm
	V8uYG5jYY133Xz9cUJYJNbBjdw==
X-Google-Smtp-Source: AGHT+IFd/RH1t48DNmOvCXOwpJg2eBZTRP2U2+y6MkWFB/zxtr99u8vS60Bx5qQ3jlzGC1NNMIywBA==
X-Received: by 2002:a17:907:7f26:b0:9be:fc31:8cd3 with SMTP id qf38-20020a1709077f2600b009befc318cd3mr10801150ejc.17.1698772420090;
        Tue, 31 Oct 2023 10:13:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id pj17-20020a170906d79100b0099bc8bd9066sm1268384ejb.150.2023.10.31.10.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 10:13:39 -0700 (PDT)
Message-ID: <691607ce-ed05-4fd8-9989-ebd58f2e1664@linaro.org>
Date: Tue, 31 Oct 2023 18:13:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] spi: qpic: Add support for qpic spi nand driver
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 broonie@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 quic_srichara@quicinc.com, qpic_varada@quicinc.com
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-5-quic_mdalam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231031120307.1600689-5-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_101343_188789_A5EE2E4F 
X-CRM114-Status: GOOD (  14.51  )
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

On 31/10/2023 13:03, Md Sadre Alam wrote:
> Add qpic spi nand driver support for qcom soc.

What is "qcom soc"? Did you mean Qualcomm and SoC?

> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> ---
>  drivers/spi/Kconfig          |   7 +
>  drivers/spi/Makefile         |   1 +
>  drivers/spi/spi-qpic-snand.c | 604 +++++++++++++++++++++++++++++++++++
>  3 files changed, 612 insertions(+)
>  create mode 100644 drivers/spi/spi-qpic-snand.c
> 

...

> +
> +static int qcom_snand_remove(struct platform_device *pdev)
> +{
> +	struct spi_controller *ctlr = platform_get_drvdata(pdev);
> +	spi_unregister_master(ctlr);
> +
> +	return 0;
> +}
> +
> +static const struct qcom_nandc_props ipq9574_snandc_props = {
> +	.dev_cmd_reg_start = 0x7000,
> +	.is_bam = true,
> +	.qpic_v2 = true,
> +};
> +
> +static const struct of_device_id qcom_snandc_of_match[] = {
> +	{
> +		.compatible = "qcom,ipq9574-nand",

Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
