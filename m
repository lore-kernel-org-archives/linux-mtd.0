Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB024C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNlNUBv8BwJLMvlocUSu86Hiu0z8fj2tXMXwv8oUSEo=; b=JgSnzHlAqqTrJC
	Z2f3jW68ShKrxghKCaabCOXM/6GeZ+XcznKYWTrWkQ+/QIYJfr1rENxBYsduAEPGcu1bESm/osfLy
	bkHpA3/V1+lGvk7bbeONL+7ouPK1YyhIGt7EVYCrzQMJIB6coo3rIQ4s/c6aWl+ODsTIK/iiepyJZ
	56loS/O0QR7DOj5uWgW9kRYbeayx/r/GCgQkBBqX1F2QCoiJ1K1Si+4kjIqZEA7uMEHdEV9guw0Hg
	f7aSsscabNOkMzi1dM/Gsa49HHqhxixqCIty03FwIrxIp1TqhrH1RssvM4APFObOFJyBV2BC2hLy/
	RUMusiskrywjiemI/41g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqaX-005WTD-2G;
	Tue, 31 Oct 2023 15:23:29 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxqaV-005WSk-0O
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 15:23:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-507a55302e0so8224481e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 31 Oct 2023 08:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698765803; x=1699370603; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ATYS9nanviadzb566KV+seOqWKaS5f1isvxWfQD8QqA=;
        b=uXKJtVez/f3a48wiKTGuxxax6z4XtCYLwe5TYRtz4VgJKfYm4KvDT24nstIqFU5gto
         q75PdYxN2EW4d2eVpqeI89DaNC/eZ4e7H845voLprF4xiJ1M4rPNdxwONhA5gNIAvlYQ
         jInrOghXbyTQV0jqpmc/+mgA3qXxdNEMOWEVd2dgyvrnVI+Wv6hBDDOUkf6z8KJZmuTp
         45GDh74wZoOxjSMsHfu0tk2VSkwTmTGezuxt67dPQBTgIEDXe+rrmCERyw2lz2o/ESwB
         JZHLr9IIX44bRcE3C1i6PjMdXo1iRnxrjyYHHjtMeIOr/RGCY7ek2AYvc8I/cY1fBLOb
         dEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698765803; x=1699370603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATYS9nanviadzb566KV+seOqWKaS5f1isvxWfQD8QqA=;
        b=JEh29kGSZhBVd6GaIHIVZixcW/elhzHbkbdeVzWkx1gjaOxPhISgjYyPQR/vjQWbD1
         etzGQC9bHPkB62jPgli6qBNfEKiBLI+Sod19u56EtAvJxfDcWvSjfbXrNNO1PcFbW5pF
         YPQuxf49FjUD8iyYcjWPUC00lSseV/eZchxs1hxt5tVBpemQS0wmJ+h6Nype7dsZ1erd
         oiA1BKQa5ADcZl/tMxpP7wxwHIGNbPKldOOTACzf3gpKuPuZWm8fi2aVGLkvHS3Z+gLK
         KmVzf0fymdVck8Ha3rWrvz3by3176ieQk/8TzuEKInrwo0xwMJgj+3LsaRwnTZFc0x6L
         e5Kw==
X-Gm-Message-State: AOJu0Yxlb9QjSq1Rz7YKTWo+3lP1Wg/n2F/Kbw/FabqanNyqnOpuLwVk
	8wk6iSUlX9P4tPPBwoUoItmKug==
X-Google-Smtp-Source: AGHT+IGb7omjnf0GkAFWUjhV7orO4W8kGX5+o4ozOOQdo5MzuuZDwFymNSCMD7ksBcg5ZYsq4MNoCw==
X-Received: by 2002:ac2:4546:0:b0:507:9fe7:f321 with SMTP id j6-20020ac24546000000b005079fe7f321mr9092874lfm.54.1698765802622;
        Tue, 31 Oct 2023 08:23:22 -0700 (PDT)
Received: from [192.168.143.96] (178235177091.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.91])
        by smtp.gmail.com with ESMTPSA id v17-20020ac25591000000b00503189d8b8csm233610lfg.198.2023.10.31.08.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 08:23:22 -0700 (PDT)
Message-ID: <873c1b14-5b7c-4fb1-8f09-6344a4bf901b@linaro.org>
Date: Tue, 31 Oct 2023 16:23:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/5] arm64: dts: qcom: ipq9574: Add ecc engine support
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, quic_srichara@quicinc.com, qpic_varada@quicinc.com
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-3-quic_mdalam@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231031120307.1600689-3-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_082327_191052_285BD03A 
X-CRM114-Status: GOOD (  13.65  )
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

On 31.10.2023 13:03, Md Sadre Alam wrote:
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> ---
Hello,

you're missing:

- dt-bindings (make dtbs_check is unhappy)
- a commit message
- Co-developed-by for Sricharan


status should read "okay" instead, but in this case it's unnecessary
as you're defining the node and lack of the status property also means
that device is enabled

however

this ECC engine seems to be a part of the NAND controller, so it's
unlikely that the DT maintainers will agree for it to have a separate
node

Konrad
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 5f83ee42a719..b44acb1fac74 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -336,6 +336,11 @@ sdhc_1: mmc@7804000 {
>  			status = "disabled";
>  		};
>  
> +		bch: qpic_ecc {
> +			compatible = "qcom,ipq9574-ecc";
> +			status = "ok";
> +		}
> +
>  		blsp_dma: dma-controller@7884000 {
>  			compatible = "qcom,bam-v1.7.0";
>  			reg = <0x07884000 0x2b000>;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
