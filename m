Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861A6CA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xwwl/2YkmFJOaLyUKe5YTx/beein4wFH1nAIW+nCWSA=; b=g3RDqXH6jOabWr
	2yb4/8BmCwHb8sNWT4uLzv+DuoAhCXY+O/VGrndWYlTH+mB10Nl/MIx66CEovTgkRFICJ9XhNb6Qe
	B+mhWoWw6GKr7aho96bPklGDE1bf3qziyEN888MRME8P1lHmA8coiN7MGl3Xwppkmx0NOHj6yaoHj
	AnesIKO8QoCqIf1j0Ac98JxCwVIfKwgbyqgfZmeEi731+spqE8vmXSvpjxrkJMSbV7IBn+nvMd4fi
	Q6EM49EfyRGMFssJnLOK4djb2JwVZGT1zSORUIaWwGJgiSYICVm6Lf6pAzR3+JO4YYGuDd4fpXpQR
	doLy/PgWvK7SRVlykwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrho-0000000BHKS-2Olz;
	Tue, 12 Aug 2025 16:18:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulljZ-0000000ARe3-33Gv
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 09:55:58 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C96ptk028942
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2025 09:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fy5zAaN1Le8gwkS5f3ejrtBssrUSdwA0NqZDJMsJ1vI=; b=KUexjIeE4/ARZQ7n
	sTm74lM/Gn3RugLldjBpvUw/0ZmVxw2LPmp8TmsugDwKlt5t5tvgyvboPd02tNVM
	sxqvgpYxMDx/BGvnIvUEzu8QhD9xahE1IY7zP2Y5ZrAN9w8mAuPBxiQFe/ZTSIw1
	nvOPeTBXTO5Kc2Py5QktGzGLXdgpWGIp95u+wQipuW74qNywSsQE6veRmel3OU5h
	+jUVsovCHqA9Ch3xFyPqdHwkhlyoWmcpTS+KPFoDqS5L7gkuKybYhK7bKFAHV+Ik
	WAopAZJ2Zd8E8pkHC3JwrnXz5HFpSyRic1/IRco55Kmwyn0C2DtcURtX3m+h3VQh
	T44bTw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9squaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2025 09:55:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4af23052fb8so8264811cf.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2025 02:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992555; x=1755597355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fy5zAaN1Le8gwkS5f3ejrtBssrUSdwA0NqZDJMsJ1vI=;
        b=q2sdFmUtGEBmXu8pMLbrh7Dnv49CIh99OGNdDiu9YpA0OUBjul69VAy/1ihZkX/m6T
         XgrIhn0sLYdCvyJKQPlIdpmYQ3Twz0JBy5HbZQHE+HlCFdnKxWsiMdgnrt7TvtS23HWB
         nRdoXxZJxGDXQOnJcJjL6WMFHf2db58a/5UOmpOzEFalobvZMxm5K9tL3V+QszNqXiNE
         UUJw+xiwvM8pzdwE8ZlOJancTDCwZSV8ItLA8va5Ty3X5ZtR+WrA2sKxBxgE7CGPZNCI
         mQQd7eJkIC9M9cc1lhk7Dh0F+zFK51iN0tLvz/qy4dw53mrl5NN4qFpdAe/WBIeU4Ycg
         jdxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmKUHGHSmRHjdwhfrBmV8Wcjf7BphneW8d5O9yQS57SnnMy338kyguUlfWQLbrhpsJm/+oRw3c5IA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOpQVsOonhsn6eOESI+zehZtR8tGyWNiXShyniISuC3v8M2Gzg
	3Kv+IuUS/KVmqY/9uJpBM/kbxSpKcohzMU83TqTZO5pCbtwif/tBbpu7NvKG0c9oWoeI9oOR+Ny
	cR+o7D/zI+VZmh9zIl9b44VyNViuic3/nNWgbjJceipgr2RW+c3SHbG6+EGBEwhOuvUI1
X-Gm-Gg: ASbGncvs3kgjI2oHj+xauio4bLjwyl/FmxoN+Cvn5hupojWz/mhxXJU8s5dQST0awab
	fjhP/9XFeMoG3bHvnQ1OyAHO6Wn4aCAvVcPg8NIjnnvfGLSlIC8ASf6BB63z6qZVyHev7v1Iqgb
	b8bULBe+W5vFc3fXjyO2+c9sP7y9fqmfFgVwDOuncCD9JU7mq8XJt2+vdX6vxn7tGYKWW96TB0Q
	JK/FB6W2bdSboy1ySUeHD/SFSQJRvuA59G7zxHI3aHLmNVk/S0XWCvj8zCIEOAR0INK2kn3SXQo
	Mi9tY7umYgxhgUAwhMkgrWWyekr6+nvIJA0wYHyR3c9xhj048/AHq9rUieX/jIDGmJU6dVKhmYK
	/wI/9EOLYDZtCtHEpsg==
X-Received: by 2002:a05:622a:189f:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b0f4ccd933mr2855681cf.10.1754992555230;
        Tue, 12 Aug 2025 02:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEReLnphOGEbNWWWfSrjX8K9aTE+4skbxwGcSBRQDYN+gOwpLRpbaZJOvyvPh88HdyWT+9wag==
X-Received: by 2002:a05:622a:189f:b0:4b0:8cfa:a507 with SMTP id d75a77b69052e-4b0f4ccd933mr2855621cf.10.1754992554790;
        Tue, 12 Aug 2025 02:55:54 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0def2esm2146839666b.61.2025.08.12.02.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:55:54 -0700 (PDT)
Message-ID: <3e790d99-5c6c-4148-85f5-0023a621afeb@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: handle 'use_ecc' parameter of
 qcom_spi_config_cw_read()
To: Gabor Juhos <j4g8y7@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689b0fad cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=5qz9QPgusZpkEaXBDdAA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: qAEq4-CapFdAzTMpY-Z5j_M15FzXBw_u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX4X/jIAQBFb5a
 0ZUNT13PdTWWuNuGgoWHvVl7qiyHYLjmuM1poKPYXd/b+wibkJVo08ZwT8rAOv98lBbWxfYiEx+
 2u1hCmy3aXISEpDMILVEyLDlMxX//dpLX1+JMJVb1kLAIx5oxDJx4txhSnBvjR39QQOkAllRrKq
 WaIwV0YsiIeL7L/Tk5rtdi6KKobPYDAVgf9hbpXEMRggz0CWZzdUVSlPWWfsV2M8QR7j7uki0FJ
 X8/9lEP3Gs4Gogp7z/ZLon5KRpyI4JMd9NSOCp1VogIoCPoPr3rztPckmLY0iZAlGYcCbf97JiV
 oLgnndI7eLOTK6M2o/H4tYL1EXUervAprX6Y6E0q1Zgu1TgyunfTRZ0KNHqtphg0IuzCd7i0T8E
 kt99JAnZ
X-Proofpoint-GUID: qAEq4-CapFdAzTMpY-Z5j_M15FzXBw_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025557_778545_9BFFAE0C 
X-CRM114-Status: GOOD (  21.42  )
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

On 8/8/25 7:15 PM, Gabor Juhos wrote:
> During raw read, neither the status of the ECC correction nor the erased
> state of the codeword gets checked by the qcom_spi_read_cw_raw() function,
> so in case of raw access reading the corresponding registers via DMA is
> superfluous.
> 
> Extend the qcom_spi_config_cw_read() function to evaluate the existing
> (but actually unused) 'use_ecc' parameter, and configure reading only
> the flash status register when ECC is not used.
> 
> With the change, the code gets in line with the corresponding part of
> the config_nand_cw_read() function in the qcom_nandc driver.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/spi/spi-qpic-snand.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
> index 7b76d2c82a5287df13ee6fcebc4abbe58ca861ee..119003c4784890458a41c67fa8bc17d721030b0d 100644
> --- a/drivers/spi/spi-qpic-snand.c
> +++ b/drivers/spi/spi-qpic-snand.c
> @@ -494,9 +494,14 @@ qcom_spi_config_cw_read(struct qcom_nand_controller *snandc, bool use_ecc, int c
>  	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>  	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>  
> -	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);
> -	qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> -			  NAND_BAM_NEXT_SGL);
> +	if (use_ecc) {
> +		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 2, 0);

Why are we reading 2 registers (the 2 in the func call) here, but 1 everywhere
else?

Konrad

> +		qcom_read_reg_dma(snandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> +				  NAND_BAM_NEXT_SGL);
> +	} else {
> +		qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1,
> +				  NAND_BAM_NEXT_SGL);
> +	}
>  }
>  
>  static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
> 
> ---
> base-commit: 13d0fe84a214658254a7412b2b46ec1507dc51f0
> change-id: 20250805-qpic-snand-handle-use_ecc-de929376d50b
> 
> Best regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
