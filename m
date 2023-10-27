Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDE4C25B67
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Oct 2023 11:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZiRQJW9dM3WpY5C7Us8t5SwoffB49CFxecrGvGB4Lk=; b=2mYdk1MRBkss0L
	V6OADCvepd1dyXKB8TCvJecPRgNHIq+cbfAH7R/vKZksxYXCuk+r4hZI/cMVGU4pK6jl3UqO/jU7N
	DqnFmChgQcT1dp2PrLgOgXvndpmnMse4JfV2l2aOR/AbI84Y8rw5ZWPQGFT6teA6dlCQPYzZPZJX0
	O4+OOjvqG6Utd8Q+RzIeawlbDetSWe44eZNwWY3hv8QF923peaA/8zqyB29WzceAgt7zrfYN7wtPZ
	jEnGqpf0JIUy+UfOZE0DWgCXfvrIVcM5Ur7D4G7mib/dkLNsSJCtE3EpRMgMXCJNSZB8XsWHy2rmM
	ckOl3EUUoaFODkGw9ZAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKfP-00GHQh-0f;
	Fri, 27 Oct 2023 11:06:15 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwKfM-00GHQG-1r
	for linux-mtd@lists.infradead.org;
	Fri, 27 Oct 2023 11:06:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-507cd62472dso3500592e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 27 Oct 2023 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698404770; x=1699009570; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sn0SkupVcdj5VcJbVKdeh9E9I20fBSBNAsJMfpC8QzU=;
        b=cKZtOZ4Y/IHd36GDQAFphUEMnO/SOdDgN+1xmjwVyU2kYazB1+Ugh5djuzjVD+BZeb
         6j80MllFbmSz9uJZ8QAN+XI11nrjHsqaPGs9OCd+73LMUF8lbiHiZFJUbh9tIV0CzSrv
         Pr1yCEFpjCWKNM3H25sY/VZzAKrC2p1y5IiYF3vOF4fF7hUDVHTngujdoeAhL+Olb34p
         LemkhCXnh2riHIwhJfVSyw8xMfJkbAAKex8/4XhR11IsAYcbmGD0VK1UcxVTQNUVxW68
         k7GIbLFxXOGEQWwxH3yUNb1Kxbw5NBCpvqlx8IKkJ/Rmkz8o8tHiquHkkInVYaE8/huR
         yFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698404770; x=1699009570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sn0SkupVcdj5VcJbVKdeh9E9I20fBSBNAsJMfpC8QzU=;
        b=E7Kw7KEMRCC60jBIknJYA9/2vflqz2mJraoz7jn6xcFtZihWkRGXistLzow6uiZi83
         sf9PWmGJTWJ79dWjyFUCsgiBJkOHBWgtiKk/j4X8A+qMMBGxxdVHYr1G+FEulj6/2u8C
         HGdnG3RrV/MOiEF69sdTH/LAVZrDiQPBEhKHLSktdz2DAp40+/oKrEmuKiVabeSVyiNv
         bULaD/7FY0uinpRNfYO+PahrsyhIsymB3/+6yBRFMAcbrut79IWtc+Sjk3oTPLYyEmtS
         asY5bIj8PGgKF+9z230FkgCvxz6rvMXu8KzVDHNOec/PcgMTtjAW6mycCSd53gfLFhfY
         kpgg==
X-Gm-Message-State: AOJu0Yzm26qflCgpuraPC2Pa61YN09AE5IlmACSRloOnd4E3qoqH7/rV
	R21SHGNbQnAFO9deo5uMASUo2g==
X-Google-Smtp-Source: AGHT+IF74fDPSxKudSJkG37lyKSSBlG5zZ/3h4KAaX7dR24ge5dvrd17j6I8JxYr/cShylumwVfgFA==
X-Received: by 2002:a05:6512:4010:b0:507:9b69:6028 with SMTP id br16-20020a056512401000b005079b696028mr938671lfb.24.1698404770157;
        Fri, 27 Oct 2023 04:06:10 -0700 (PDT)
Received: from [192.168.0.22] ([78.10.206.168])
        by smtp.gmail.com with ESMTPSA id m28-20020ac24adc000000b00507d478c211sm237468lfp.76.2023.10.27.04.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 04:06:09 -0700 (PDT)
Message-ID: <1f9aa42d-6269-4dd0-a048-3e91266bf135@linaro.org>
Date: Fri, 27 Oct 2023 13:06:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: mtd: partitions: Document special
 values
Content-Language: en-US
To: Edward Chow <equu@openmail.cc>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lech Perczak <lech.perczak@camlingroup.com>
References: <20231025052937.830813-1-equu@openmail.cc>
 <20231027094610.1022114-1-equu@openmail.cc>
 <20231027094610.1022114-3-equu@openmail.cc>
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
In-Reply-To: <20231027094610.1022114-3-equu@openmail.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_040612_621135_299CD47C 
X-CRM114-Status: GOOD (  15.49  )
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

On 27/10/2023 11:46, Edward Chow wrote:
> Add examples for special values in linux/mtd/partitions.h.
> 
> Signed-off-by: Edward Chow <equu@openmail.cc>
> ---
>  .../mtd/partitions/fixed-partitions.yaml      | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
> index 331e564f29dc..e7bf466c395f 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
> @@ -164,3 +164,33 @@ examples:
>              read-only;
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/mtd/partitions.h>
> +    partitions {
> +        compatible = "fixed-partitions";
> +        #address-cells = <2>;
> +        #size-cells = <1>;
> +
> +        partition@0 {
> +            label = "bootloader";
> +            reg = <0 0x000000 0x020000>;
> +            read-only;
> +        };
> +
> +        firmware@1 {
> +            label = "firmware";
> +            /* From the end of the last partition, occupying as mush

This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
