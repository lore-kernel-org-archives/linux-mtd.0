Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C764C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sCFxofV9OJXFGrK5hE4NdRAdV8skC48U6ZOQ9+8WS8s=; b=FN/5vdci+tD9Bc
	AtV+/rDWZy4Ve71UGJK+idg00PadmFXY7S4Vrmu722wtZt5gssdWGmQhdep9ghHD/gghMTIHVVDk/
	m8Nu5z6U7E/ZCzkvz/sN5rjhnYs0UhkWwVGZ1QOMRNVeCyvTYJMghkrHsxHPg9oYRDDLiPE/aY+6D
	ab98UTx1UYUSam4wsIA8Q9sj38PUmehHNCgWsB8KOCI0GGF+imHXDFuhXLl0OqByvOSTEqZx0PvYd
	p6UqQg29FDBZ1lScippT/mLKMmNHG+eu8XlOQdsg4tsIORbsiCOgZ4LP8mDouxoTf/kN521dHoCh/
	q4RhVxu45u/hXA2ZnCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rag05-0000000HGyi-2Hz9;
	Thu, 15 Feb 2024 17:58:29 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rafze-0000000HGwb-3Lhz
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 17:57:56 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-51182ece518so1380329e87.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Feb 2024 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708019873; x=1708624673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bzg0JZnBuG9xbxYGq7b3vA4VfEtQYoIHH8VKH+YR0eo=;
        b=c58DIsSgcuZSs7LNstZLkHdiTxXrDC2o68xKEmsKLsmZWuAo89A12ubMx4UQN855a7
         2vAiXo2JfvSWGdQJMdaPAhlnDJtvFw1yDB4JL+EvTLGjlmmFApiqmRQ3ITgyMrZYCwlW
         aP4D6AkJaGFpskylb5EuMMGaIv/lpLEiFwtJkNz2UBBAyX+KOgNM0jTV71dUEF9nVMRL
         vSCOX1eAk5MsUYqWINtYh2H9mOZVT3+PDfgD3CDbmHeWHVGArVBlUMZd3uGw0tZ+8stC
         t0cg0nPbvihKbVZ8SWY45nYItiS9lzO8SDNrbrVOhxsdadswL4FDbYm/IRWtNEPtS6dl
         neNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708019873; x=1708624673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzg0JZnBuG9xbxYGq7b3vA4VfEtQYoIHH8VKH+YR0eo=;
        b=C0Vqp4k+2nw+tBkAd6gFmGwQhu1qAIl5A+OEJ24ERzPcEFwxdPwZaJRdseWkQEVuTA
         LCz4mE5z92gOqWgXuXBv8xjuEXqK0aXO0wCrrlgWKKNiTtAMLTIRZA58hGRHUc9jNCrp
         ertCw4B7glv1SvCC5CISK0VYjgfcYOnZQLfDI7kFQ5xhR7F3mk40oABBndy1hyIoynj0
         qwch0xESmH3erMH2+IeOIhGBoIIieTC/rz3iKsqhocLzfWpvYcMJr8Id3VgsRauCUSNQ
         b9UBQQ2c2crH2xYepi86P0BFnTvSr9MPkRkZnbaWgsNdz94GTScC/grc/P8jS+Fa6lYr
         mwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJZV+jXY11BbOPq/8b3fvDP3wY2C/Qae+1pzhNuDSuCCLo/Aet8l3DLMF4PFITElpRkmb9aZ8V1h/RmZHs9RwX4ogQA4Ix0OebL7PqPg==
X-Gm-Message-State: AOJu0YzhA7IGjNbFD+McTQONJ/WfmcM3pnHZA/LVvI9W02aX6J17tAH4
	ok/ud0cMBorOAAYHK+laNXyOL2fLSDIlnA2YKgliD+ZKmBUCFvGl8C1MRAgeGJc=
X-Google-Smtp-Source: AGHT+IEgWc7gk7Qw+cWxS3tvYJs5tD8dCPuz++09dvf4RN6mi1qt5Xjy9cWFXxSDHU3kPh4Gu11FvQ==
X-Received: by 2002:a05:6512:3f06:b0:512:8d30:6dce with SMTP id y6-20020a0565123f0600b005128d306dcemr879333lfa.52.1708019872670;
        Thu, 15 Feb 2024 09:57:52 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id h32-20020a0564020ea000b00561e675a3casm749438eda.68.2024.02.15.09.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 09:57:52 -0800 (PST)
Message-ID: <d1c80d3f-3b70-4630-8f7d-b00983b487dd@linaro.org>
Date: Thu, 15 Feb 2024 18:57:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Content-Language: en-US
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-4-quic_mdalam@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240215134856.1313239-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_095755_133883_55C479B2 
X-CRM114-Status: GOOD (  10.20  )
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

On 15.02.2024 14:48, Md Sadre Alam wrote:
> Add qpic spi nand driver support. The spi nand
> driver currently supported the below commands.
> 
> -- RESET
> -- READ ID
> -- SET FEATURE
> -- GET FEATURE
> -- READ PAGE
> -- WRITE PAGE
> -- ERASE PAGE
> 
> Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Co-developed-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

[...]

> +void snandc_set_reg(struct qcom_nand_controller *snandc, int offset, u32 val)
> +{
> +	struct nandc_regs *regs = snandc->regs;
> +	__le32 *reg;
> +
> +	reg = offset_to_nandc_reg(regs, offset);
> +
> +	if (reg)
> +		*reg = cpu_to_le32(val);

if (WARN_ON(!reg))
	return;

instead?

This would be tragic..

[...]

> +
> +	ecc_cfg->cfg0 = (cwperpage - 1) << CW_PER_PAGE
> +				| ecc_cfg->cw_data << UD_SIZE_BYTES
> +				| 1 << DISABLE_STATUS_AFTER_WRITE
> +				| 3 << NUM_ADDR_CYCLES
> +				| ecc_cfg->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
> +				| 0 << STATUS_BFR_READ
> +				| 1 << SET_RD_MODE_AFTER_STATUS
> +				| ecc_cfg->spare_bytes << SPARE_SIZE_BYTES;

Let me introduce you to FIELD_PREP/GET and GENMASK().. Many assignments
in this file could use these.

Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
