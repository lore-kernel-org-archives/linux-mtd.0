Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B92DCDB482
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Oct 2023 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uESsbk4VHNdjfo9EuorvkDQMsDmstmem7jQuy3ybwls=; b=wdhbl3C4jIR+El
	Vr4Um35oDF7SbZZcCRxeLescQPzQBnMzEDIcBobxLMyGmlahTLxvNsXjpiz2RSLpruM+uOPTPsLmI
	pC/LANkrrAqGSFlHukMaMvl37dfYxU+n9x2JDIxFCfSfFTUq2Iut7EJrvQTqhCCkB5XpxsxgETKoI
	GLGqKegNlspXB/RiK+aNMkZuFJYzs53PxMlgdpwZqsMPlNO6foTdCi/bKBvqKtW2zVXd4PuCApJpA
	kS9TdRKx6cGCCOzbaCRVzhsCtGikU2odv0xfX8ydAY5RuGV9x1JobMBcPEMUDOv0JKT4t3DGXvwag
	veySxkRUDensX70TJTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4Oz-00EVok-2y;
	Wed, 18 Oct 2023 11:07:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt4Ow-00EVnv-26
	for linux-mtd@lists.infradead.org;
	Wed, 18 Oct 2023 11:07:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39I6ApHh011707;
	Wed, 18 Oct 2023 11:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ix6ZpUMVpeBCtPeI7PgVsnjw1IDYnRh6hsgCYDArqqk=;
 b=TCpGAlhVGzzGYHUqVAgRTfBxGW7r3l9edYesXVV8nRXNeW+y8d9IxkeffrYg9B8ArHRb
 Sljl3t6Yb7TNsThBQqVfPrFLSWChotCj3hJZPhqet9TVOoWXR710Cr41BdMuLSY+6SBy
 EBxKBsiSs4KwuWlIXPc8jrjTO6KN5WShxLG8uUh+1k2l66oOnVshHk6rqhgTfskxGs6J
 rGyXg1lnAiAO2jEdUL3emIUzR1CFDh+pQERnuTARnHSTucxUv9Cez+utssSVfVaOIbYs
 VyPWIJCtgIm/RebDKNIs2Pv006MaOx26c31pwvDP4iGOrgMr21Epd6SqMaWPaxHf27Pa MQ== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tsvxwtc0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 11:07:41 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IB7fbg011157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 11:07:41 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 04:07:37 -0700
Message-ID: <62909863-5f1d-7fc7-3fd5-a8da0caa89ba@quicinc.com>
Date: Wed, 18 Oct 2023 16:37:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] mtd: spi-nor: Ensure operation completion before shutdown
Content-Language: en-US
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>
CC: <tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>
References: <20231012055148.2445303-1-quic_mdalam@quicinc.com>
 <bb12db1205a5d1bfbee341d23defe0be@walle.cc> <mafs034ygm9yc.fsf@kernel.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <mafs034ygm9yc.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GawOuAzjbGeZmEDcqcMoiSnUNK6Xgh0V
X-Proofpoint-ORIG-GUID: GawOuAzjbGeZmEDcqcMoiSnUNK6Xgh0V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_09,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=377 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_040746_700968_E66FB6A1 
X-CRM114-Status: GOOD (  16.20  )
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



On 10/12/2023 3:36 PM, Pratyush Yadav wrote:
> On Thu, Oct 12 2023, Michael Walle wrote:
> 
>> Hi,
>>
>> Am 2023-10-12 07:51, schrieb Md Sadre Alam:
>>> Ensure that there are no pending spi operation inprogress
>>> when system halts.
>>
>> What operation might be in progress here? Did you encounter some problems?
>> Please explain it in more detail in the commit message.
> 
> +1
> 
> Ideally we should never reach this function with a pending operation. I
> think we should do a proper wait in the place we did the operation that
> needs waiting rather than here. That would make sure operations other
> than shutdown, like reads, also work properly.
> 

   We have faced issue while doing nor flash read/write test with specific nor part.
   Will check once again with the same part and post new patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
