Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E1CCD128A
	for <linux-mtd@archiver.kernel.org>; Sun,  7 Apr 2024 17:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQIQo9B8fEzyUgFnvTTUzlI0d4vL5xPsNrE2ZL5v/wM=; b=fOqNVZLCVibJS4
	27k1IIfvPhzS8S+sHlfMmXftQHpiCRgs7mLc8/J/TX98cm/+DYlFie6USHesYw1r75tRUoAjDFtPE
	uEF3rHZm1m6rUxcQL6jZKmJaJMgGDxQ7LuhS5ckFwZLSpZMoGHarN5T2kLWrXvihrrH3lelhGqoLT
	7G4ZiUYlGgDZsezDivMssCjXKKJKbqeE6H2rFdMTIBPVvPUox4MJWyd4R8XGbmWJfaVgpAJWqk2qM
	oPRQ+uKzCh5goZX2xlJX0C6DbJUEB7jtQzAbdSDJyyTatsx3FH11lLrhKYJcmZwLucXiz2KeGS6qS
	pqUV25GX8MqnImdNU7zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtWdH-0000000DCAs-1VCF;
	Sun, 07 Apr 2024 17:48:43 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtWdD-0000000DC9o-2MZe
	for linux-mtd@lists.infradead.org;
	Sun, 07 Apr 2024 17:48:41 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6ea14011938so269195a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 07 Apr 2024 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712512115; x=1713116915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5sXdKQMfOKyJsj4qQ0BFKCNMJKW5FrQPDHTE6QFVUwU=;
        b=gcuALGs2dBpm25cQeI3OpKDqm/N5LjTSDTdcTRmJqTjSjJZA68GuVf1WWI4CkTiKXb
         4FhzgwAdGl2KmyS6hIigZ0aShaYIUd+cGaaUK4WCmJaP6tNxpTEF4n+VqxUg2tM5yGja
         rtI2nxupJ4+ClWaEkw/2AaOlhbnNMx1iZfqioi+a4/IuH6aMx19hBf6/d9lQiolSfU3R
         HQtlZ3UIHH/8tHt+DhlI/BZBgkb/2VM+YUQeGAx3lfXIOnqemXA4kSKripo/tROz35mV
         1FpKb4AwY+zHrzayp9pVnB2MsoV9W8R9mbZJoRTLAhPAIT7zgzmT+lQhAjCN7qkf5UQ2
         S0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712512115; x=1713116915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5sXdKQMfOKyJsj4qQ0BFKCNMJKW5FrQPDHTE6QFVUwU=;
        b=Ifn2t4P6ImOUfuhGReX9RBTUpeqmzKOjf4WmEuu6wlntwKAkKGdC2ErIVp4qs3i63z
         IZW9tBLrKZotXMoMDWjZii6Z3H9Tak6A2vOtGhEE1DJkpfC1tyY4pMuSg2kKQW+zYWsY
         30oUj0T+UA09OMrwkOJkUtzIu9nuiTgjTRqHUUOPnOtXTdgsPmbcWRU6Jtx4iHBsku5A
         bZBdeY8cxyvUJ502nGEGt+VOZur+Rc2ykxORXN4pzP0aZO/++duSECf04MBoh4tBp6Jl
         eVs41v0IMLkqv+kL6rbHnAFC3wRIr3vnecbB8iJ3PzJT/HtBqtWehId0c25CRI3Zg4GI
         hftQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyiztAoALrocUydmsQzCwVSgahOWF/8oNlobPsm4JP+22qLdgH2AueFKfjEYz+Z/I22nw8W/5pdb62K49FAhsGLepJ/40AEHV1CueFkg==
X-Gm-Message-State: AOJu0YxjBrls8qzQ0VZjck9EiG8ZYJkdlfwulhnvwUGyAkaOHR+EF+ul
	HW2+WBqffdnfrO7VryPGTQdIKFg3LS+uXvx1njqbZoMdj0NaMBfg
X-Google-Smtp-Source: AGHT+IEmJUaWcK/hJUC5cAwg09zB7vyfipJlWU9lLlEVltY3uzjfm97qWwibUja23CycpiqAQa5onQ==
X-Received: by 2002:a9d:6a5a:0:b0:6ea:f34:8ab4 with SMTP id h26-20020a9d6a5a000000b006ea0f348ab4mr3238793otn.28.1712512114955;
        Sun, 07 Apr 2024 10:48:34 -0700 (PDT)
Received: from [192.168.7.110] (c-98-197-58-203.hsd1.tx.comcast.net. [98.197.58.203])
        by smtp.gmail.com with ESMTPSA id a25-20020a9d74d9000000b006ea178dadd3sm132893otl.21.2024.04.07.10.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 10:48:34 -0700 (PDT)
Message-ID: <1c803d8c-80b2-47a9-bc8c-8b13cbfc6841@gmail.com>
Date: Sun, 7 Apr 2024 12:48:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] spi: spi-qpic: Add qpic spi nand driver support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, andersson@kernel.org,
 konrad.dybcio@linaro.org, broonie@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 manivannan.sadhasivam@linaro.org, neil.armstrong@linaro.org,
 daniel@makrotopia.org, arnd@arndb.de, chris.packham@alliedtelesis.co.nz,
 christophe.kerello@foss.st.com, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com
References: <20240308091752.16136-1-quic_mdalam@quicinc.com>
 <20240308091752.16136-4-quic_mdalam@quicinc.com>
Content-Language: en-US
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <20240308091752.16136-4-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_104839_700669_6C8A0DB3 
X-CRM114-Status: GOOD (  11.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/8/24 03:17, Md Sadre Alam wrote:
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

For the entire series:

Tested-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
> index bc7021da2fe9..63764e943d82 100644
> --- a/drivers/spi/Kconfig
> +++ b/drivers/spi/Kconfig
> @@ -882,6 +882,14 @@ config SPI_QCOM_QSPI
>   	help
>   	  QSPI(Quad SPI) driver for Qualcomm QSPI controller.
>   
> +config SPI_QPIC_SNAND
> +	tristate "QPIC SNAND controller"
> +	depends on ARCH_QCOM || COMPILE_TEST

Here, it needs to 'select QPIC_COMMON`. Otherwise it can run into 
unresolved symbols:

: drivers/spi/spi-qpic-snand.o: in function `snandc_set_reg':
  drivers/spi/spi-qpic-snand.c:56:(.text+0x484): undefined reference to 
`qcom_offset_to_nandc_reg'
...

> +	help
> +	  QPIC_SNAND (QPIC SPI NAND) driver for Qualcomm QPIC controller.
> +	  QPIC controller supports both parallel nand and serial nand.
> +	  This config will enable serial nand driver for QPIC controller.
> +
>   config SPI_QUP
>   	tristate "Qualcomm SPI controller with QUP interface"
>   	depends on ARCH_QCOM || COMPILE_TEST

Alex

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
