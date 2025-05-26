Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911F0C5AD49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 20:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZbEWOPHzBUTrgup7soWW2G6Stz6x7tuPYQN+mE9WcSo=; b=CNzayWk6PB4BhP
	VWxUyLUWdGJ9jM4Ac+5JSpGgv5TbvHiskss0vAGd1PX0U+5+T+/V5ujPsXmrzmDjNJTSYTR3id4b2
	pBfSQDCJ98IZrqRiFkAWu1ttmvdpJ6PTxHmFZ/+xiMd0g3oNU+HyWx8kQ9iwOPxN1qU9Z7FGVutam
	WP2JMlMKcikaX0/N0KZpiyBVZca0qAMk5GjHTbXzGuQ+s2yi5pPZU0MBS5DCkMpUEIQAXfFcdbNK6
	ElIcWWLgOWVT34hHp81jE6qIWbrgZWWBqVTRsG5IpnFozJlpfJdd4sDgZatUS8jsC1E+tlKSCcgE1
	NYuIai6zBeUeYuhfCssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeK4-00000009TNZ-1plO;
	Mon, 26 May 2025 20:21:24 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJeK0-00000009TMm-0fkV
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 20:21:23 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-ace94273f0dso511314066b.3
        for <linux-mtd@lists.infradead.org>; Mon, 26 May 2025 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748290878; x=1748895678; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwGwL1R5+A9nxd4dy8PEerX4QLjdTorOtvO+bIuw+fc=;
        b=eNOefH9HF8qi/XpFg0GaN7Hln8b23ny7oLhgO/lt5YqLs2SsgWSiGU49Vpyrlkdv8H
         cM64k/e3vrGh95hLdXhEZAsmgg5uDWD35sWumNPSMWGrfiGPU9qQH8buJPvoPahLbKxn
         rhGQRiNsicDkzcB0b67ebQEmxAGDBWumQFf74C3sznUC5dhAX+kQvGdMVkfN2S9dcqAE
         IDxvU/XzVGUBiV8TN+MYv5xGXWGgPUHbX3oD7s9iboDKNswi7z2R7Te1H5t6BgDA+V0s
         HpHMCE375yoyad20bnLZMPIcpDbzLPsQSeteptvYcouXwOzQNtcCwnUxAOvCnYpl/Vbn
         oczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748290878; x=1748895678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwGwL1R5+A9nxd4dy8PEerX4QLjdTorOtvO+bIuw+fc=;
        b=DgBUDPZ29SOkR4Debq+pRy6YTSvFDLSq+Ca9845N6UZzoNaJTIFl4e2sQMemSPI3mA
         PEq8oQOw/YA55wjeDfn1M/UlqWBuNILxIIjHPF6/XE8qknZlnlN4S6KlE9oDDGXF93VB
         MxKekCcyIuPP8GHSzHMrwE/k7d194GaRZfMcYxbjQvhXaBL0i7Ff57qsDxrsEX9PLi6j
         NgNTjPfiJ9FW/Uk551y4naTe9XV5wpmJlZpLnv9Ad0iX7BNFcfVCIgJuQU5gvXBW8HZh
         zSOHmtnjN2gFxnctMs0+/YP7GDfvmOYAWtdPXc5NVA5u+C1+gvSW8xUV7wBYGqeitNBB
         vU2w==
X-Forwarded-Encrypted: i=1; AJvYcCXYqVADmUISiaVhx6hXtveQ5PqtAkWpmiNMF3rCPMb1+sumx5gJwakXJpkaCAIp+8nZoI9W+pMVwZY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyM98sKGpnzOI8lcLCh/rOKTORlalT9d1V3iEpHsc9gLc7N/p9
	23TCt/iHtJjbU8Fzx7Ry0qW1do9v35UyRHhvRxz7CYgX+9IGNgvRNPz0
X-Gm-Gg: ASbGncuOdrXXzgWT/OYtUC5lJFGVUOnpk1ZK/AcfTiX1c4fsR6iNaKLk94Xdayys73v
	zRTMhgkrTcQamzSbcpdL6jt9ZYCEiXt4WBfJw8M/970O0MkK5hf9m4FKjUlE0FUFjLk6aqjncDu
	UNxrSghA+5U+j78ufi5wzKyPRU8s+RwAA3m8ojXoAXtedcYKYEYcLYwqOtEW2peZsHiZGkcoYlO
	fF7/mJgGR3/Lrlhj7422CVcRnA4BPlhkRGKLtUDPGFg/nzXdjZSj/ZUO4MXe8i7nezYboq6IOfM
	hIcueNLK98EolaJLkE7LhcCtznZkYKTZ+9B2vTAu6iZ0607k0Fb56eJjEo3ZzH7TUjDSfCs/vkr
	3rt0hkKYiUpnWqKp1
X-Google-Smtp-Source: AGHT+IGe6juV60a5hMqsQdI23XueeHzJAlXhlZuR9Lhudg3mhmRAjYN4WPw3YGPkaSEDDtLe84BGSw==
X-Received: by 2002:a17:907:3da8:b0:ad2:53fc:a876 with SMTP id a640c23a62f3a-ad85b1c3ae0mr983862366b.31.1748290878121;
        Mon, 26 May 2025 13:21:18 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6045e3917d3sm3160590a12.71.2025.05.26.13.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 13:21:17 -0700 (PDT)
Message-ID: <c73a0d7d-5618-4e57-af70-1d25ab38a7ad@gmail.com>
Date: Mon, 26 May 2025 22:21:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: nand: qpic_common: prevent out of bounds access
 of BAM arrays
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
 <20250525-qpic-snand-avoid-mem-corruption-v1-2-5fe528def7fb@gmail.com>
 <87cybv2032.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87cybv2032.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_132120_206687_66AD25E7 
X-CRM114-Status: GOOD (  18.97  )
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

Hi Miquel,

[...]
>> ---
>> Preferably, this should go in via the SPI tree along with the previous
>> patch. It is not a strict requirement though, in the case it gets
>> included separately through the mtd tree it reveals the bug fixed in
>> the first patch.
> 
> Sorry, didn't see that in the first place. Fine by me.

Sorry for the inconvenience. Should I add these kind of notes into the cover
letter next time?

> 
>> ---
>>  drivers/mtd/nand/qpic_common.c       | 28 ++++++++++++++++++++++++----
>>  include/linux/mtd/nand-qpic-common.h |  8 ++++++++
>>  2 files changed, 32 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
>> index e0ed25b5afea9b289b767cd3d9c2d7572ed52008..fb1f81e4bdacaa3e81660a20e164926c64633513 100644
>> --- a/drivers/mtd/nand/qpic_common.c
>> +++ b/drivers/mtd/nand/qpic_common.c
>> @@ -15,6 +15,13 @@
>>  #include <linux/slab.h>
>>  #include <linux/mtd/nand-qpic-common.h>
>>  
>> +static inline int qcom_err_bam_array_full(struct qcom_nand_controller *nandc,
>> +					  const char *name)
>> +{
>> +	dev_err(nandc->dev, "BAM %s array is full\n", name);
>> +	return -EINVAL;
>> +}
> 
> This is rather uncommon, I don't know if it's very relevant to do
> that. Please drop this static inline function.

The purpose of the inline function is a bit similar to dev_err_probe().
It helps to standardize the error message, and it allows to print the message
and return with a value in one go.

So this kind of statement ...

	if (bam_txn->bam_ce_pos + size > bam_txn->bam_ce_nitems) {
		dev_err(nandc->dev, "BAM %s array is full\n", "CE");
		return -EINVAL;
	}

... can be simplied like this:

	if (bam_txn->bam_ce_pos + size > bam_txn->bam_ce_nitems)
		return qcom_err_bam_array_full(nandc, "CE");

The latter is cleaner for me, but no problem, I will remove that.

Regards,
Gabor

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
