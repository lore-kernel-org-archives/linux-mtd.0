Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9836C4345F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 May 2024 18:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIboTFgUE06/hyU4VEsW61QHiLGxKB3bfb1fQhdGWm4=; b=GJ7Z0Nlc7U1nZr
	NGElWRTaC182tWHDw3daLhHeh60AIYrRDk9l4NgaYXLbKkJy5MkHIN5+N5yPSVN4IKC7TQ/muwz9e
	aEHsvY4UdJ9lxJC1G/eojPpd4VrPUjAcxpwigdjfNboLp6YrMsXLQVwI9Z0YHq6p7EqJ/z3Teiq6o
	eEEMfAnT/rkI0VP4vwTgIMC4+hKWQi14XNrlTzixzR7ZKX95wn2lwMXTVut3ESh3SY0g+sX5LRPyb
	kYxOZYL7blqwiTIGnThEvnU7G0L3ipVfgYNKLK5/6B2E4wwT1scP3DpGUS+KSBCf/P9kuSkiaTJ8c
	+KSFVTmiayPmzPzwRIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xyf-000000003z1-1Z2C;
	Fri, 03 May 2024 18:49:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xyc-000000003yS-097A
	for linux-mtd@lists.infradead.org;
	Fri, 03 May 2024 18:49:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443Hj0Yp014003;
	Fri, 3 May 2024 18:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=77hzGIyr9qM/bmZ3o2LLjXkvCbHgrrzMWUibQcn58ic=; b=pE
	VFslJOGHpZ/L09Q5397B+RLy7ZXdX2CbKtrxxLr+dYBSQVL7iF8DxCAvuulu76po
	hQaZhSRKYyH5ZJkDrzL0ijjkFPuGh1tYyqc6fuxHDL3ti+PpbAAytxoVLKVO24Q9
	smPpKrlZAwuWDo5Y3srOr6hqgOUD98h+ne10DvW9uqd4ryTzrtdlwFZsXZZTC/0+
	NYhGKyBRYJNd7rRYRYwgpnD71XaX2cqY3qCpMgkOk/leUqTm7t0p1h1P197c/7N6
	nT1gZJoYJo47d4VG8t6JxgC7Lp9NPHNlxe1/opG8FCGQgwqjRWzMsvKjSEccTii3
	nuLQK9xGPBiu91xV3rag==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xw2nc8d2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 May 2024 18:49:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 443InRNW019967
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 May 2024 18:49:27 GMT
Received: from [10.110.94.246] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 3 May 2024
 11:49:26 -0700
Message-ID: <3a0edfd7-fa22-434a-902d-a3a0df1c9d0f@quicinc.com>
Date: Fri, 3 May 2024 11:49:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] mtd: cfi: Get rid of redundant 'else'
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20240503184230.2927283-1-andriy.shevchenko@linux.intel.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240503184230.2927283-1-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Sxuo-uLUCjxAOsviM6ODP59QscNBSQ_G
X-Proofpoint-GUID: Sxuo-uLUCjxAOsviM6ODP59QscNBSQ_G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_13,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_114946_137294_4F1C1802 
X-CRM114-Status: GOOD (  19.18  )
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

On 5/3/2024 11:42 AM, Andy Shevchenko wrote:
> In the snippets like the following
> 
> 	if (...)
> 		return / goto / break / continue ...;
> 	else
> 		...
> 
> the 'else' is redundant. Get rid of it.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>  include/linux/mtd/cfi.h | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
> index 947410faf9e2..35ca19ae21ae 100644
> --- a/include/linux/mtd/cfi.h
> +++ b/include/linux/mtd/cfi.h
> @@ -308,32 +308,32 @@ static inline uint8_t cfi_read_query(struct map_info *map, uint32_t addr)
>  {
>  	map_word val = map_read(map, addr);
>  
> -	if (map_bankwidth_is_1(map)) {
> +	if (map_bankwidth_is_1(map))
>  		return val.x[0];
> -	} else if (map_bankwidth_is_2(map)) {
> +	if (map_bankwidth_is_2(map))
>  		return cfi16_to_cpu(map, val.x[0]);
> -	} else {
> -		/* No point in a 64-bit byteswap since that would just be
> -		   swapping the responses from different chips, and we are
> -		   only interested in one chip (a representative sample) */
> -		return cfi32_to_cpu(map, val.x[0]);
> -	}
> +	/*
> +	 * No point in a 64-bit byteswap since that would just be
> +	 * swapping the responses from different chips, and we are
> +	 * only interested in one chip (a representative sample)
> +	 */
> +	return cfi32_to_cpu(map, val.x[0]);
>  }
>  
>  static inline uint16_t cfi_read_query16(struct map_info *map, uint32_t addr)
>  {
>  	map_word val = map_read(map, addr);
>  
> -	if (map_bankwidth_is_1(map)) {
> +	if (map_bankwidth_is_1(map))
>  		return val.x[0] & 0xff;
> -	} else if (map_bankwidth_is_2(map)) {
> +	if (map_bankwidth_is_2(map))
>  		return cfi16_to_cpu(map, val.x[0]);
> -	} else {
> -		/* No point in a 64-bit byteswap since that would just be
> -		   swapping the responses from different chips, and we are
> -		   only interested in one chip (a representative sample) */
> -		return cfi32_to_cpu(map, val.x[0]);
> -	}
> +	/*
> +	 * No point in a 64-bit byteswap since that would just be
> +	 * swapping the responses from different chips, and we are
> +	 * only interested in one chip (a representative sample)
> +	 */
> +	return cfi32_to_cpu(map, val.x[0]);
>  }
>  
>  void cfi_udelay(int us);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
