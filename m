Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC208C7619A
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Mar 2023 10:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+ADNax4kJjZ62l2PaFq0eEDgxsiN9nAavWoxn0ws2U=; b=hAuXSAv63cJDbC
	QhyFZii2u5lXG4LsHu1P34R2HENp4zIN4nv86gi5tQB9M5ni5KEaa5ki4RFPd5yghzELKaP6WtmTq
	4wsyTpZGFDtHdwL9+DNyT0LF0XxaFFrSHzqS9uK1tSu61GanxAoril/vUOnawhljaGpIwntbFqYa4
	vXvIwhgeK1n7AyFq3OyhPzC8W7MAzetHGrZ0yWRDrlwWH1Wf+t+sVYicSfSQVcFxIlcaJsEpr/CWy
	eCMdAZUxr/JMqwa7KG73dPQt3YT1g80VcT2BbQBOzRCpXDc+qT2LRzJ7tfBQX4oQmm7JKyedt9Up8
	PKsPJAZsMRvLOB9tjrPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgk70-00Ae0s-16;
	Mon, 27 Mar 2023 10:30:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgk6x-00Ae0D-2R
	for linux-mtd@lists.infradead.org;
	Mon, 27 Mar 2023 10:30:01 +0000
Received: by mail-wm1-x32e.google.com with SMTP id u1so4720811wmn.5
        for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2023 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679912998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYfSIoKXNS3sSCXkM4mLPOnfFyH+Y/o4nva0Ic4Cwk0=;
        b=dcns/R16IPSR9+8Qx4l91dTXHIf7FlZWe9GoJ6MSG9DAgpQUHXBvQf3iS3ONcMn6nH
         eFHmciA8dwxEBu7xf32wW4b3HGloLF6XIwRk6nM7qCG4pJ8zZTP5FT8GG6KeV9bezVKO
         ppDzdYI7Ve/fQ5s2K3kEUKJ/eEGdXOZxn4vbDjoYcRnIrZ7X7lrDYve0ovs6dhf5KqYC
         qJ5hKC+eEJw3RFo9XKgTRDJO9aXJ+4JLSti0Ot3SMHJSb+34ucfZwyY3dYHHmKHzRxeD
         F+5qKTMcbu36DlU6w1uro8ymsJMAgWyIzp+PXXTcJEMUybyPB1Ggb0prNSIEf4e9PX/H
         vmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYfSIoKXNS3sSCXkM4mLPOnfFyH+Y/o4nva0Ic4Cwk0=;
        b=ZRYZAUg1hJa3wIVsMFjX28QhO1275y7EE6E0wKZ7FKvmsk9oBv9lvCH6Oae0AlbIrb
         rHX71ziH5vEure6vrBI7Lcknxq/iMUzpYx4F3/G/nPOfB/NxDOHTdImlU9FPFlaGmeKS
         VFcD5Lz9xs4t3mMJ1jVcAT9WyMsAxQ2YReQxbCtFY2+HURHt1p7g3fMxLRmHMuMTzvWx
         Q37tnbWO6N/BXyaxp8leH+jhiUiQfv1gFPtAZ+tavP4kjf6qFf9vhV4ntqu2qF1/P1sy
         ZXNRjIggtHiy5lu455L09pzdK96lzE9F5IahnnqVQ3pwPMb06lCiMw2baUOa5SFt+Md7
         d/kg==
X-Gm-Message-State: AO0yUKVEoT/9b3+LGszr1ZTKndgdD47TXYepfBLUCn8Y4Kz+z9AqTfH8
	//Sb9AUzaZAvaWthyMeeNB6yQg==
X-Google-Smtp-Source: AK7set/smYnMthy48xIiehT+4wd3+HCmKMpGIq/8zhn9DCMe/nzn+LRCE19xdyNlP+eMMFDqVvbXNw==
X-Received: by 2002:a05:600c:28b:b0:3ed:5cf7:3080 with SMTP id 11-20020a05600c028b00b003ed5cf73080mr8752590wmk.5.1679912997970;
        Mon, 27 Mar 2023 03:29:57 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
        by smtp.gmail.com with ESMTPSA id s17-20020a7bc391000000b003ed2987690dsm13210822wmj.26.2023.03.27.03.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:29:57 -0700 (PDT)
Message-ID: <a17cd888-ef4d-ced0-adba-c6a6abdba51a@linaro.org>
Date: Mon, 27 Mar 2023 11:29:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/2] mtd: rawnand: stm32_fmc2: do not support EDO mode
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-2-christophe.kerello@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327094742.38856-2-christophe.kerello@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_032959_948890_CE0A9C8C 
X-CRM114-Status: GOOD (  18.87  )
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

Hi,

On 3/27/23 10:47, Christophe Kerello wrote:
> FMC2 controller does not support EDO mode (timings mode 4 and 5).
> 

commit subject and message should be in imperative mood, so I would
change the commit subject to "mtd: rawnand: stm32_fmc2: Remove
unsupported EDO mode" and the message to something like "Remove the EDO
mode support from as the FMC2 controller does not support the feature."
Extra points if you describe what happened when you used timings mode 4
and 5 with the current version of the driver.

Miquel, could you add Cc to stable when applying?
Cc: stable@vger.kernel.org

> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 5d627048c420..3abb63d00a0b 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1531,6 +1531,9 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
>  	if (IS_ERR(sdrt))
>  		return PTR_ERR(sdrt);
>  
> +	if (sdrt->tRC_min < 30000)
> +		return -EOPNOTSUPP;
> +
>  	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
>  		return 0;
>  

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
