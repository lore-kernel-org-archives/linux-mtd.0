Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B56CD3C937
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 07:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gC1kEN6mCGQH5jLHZBYVjIUswjsEl46/w9EKKJwGcII=; b=XCbMbbq+wGcqgO
	UB+m5YxXcOQUB2ATMmkeCB39bKTFWDu8JupUM0TMLGSZdku5ba1Nc08I7wDObrAzIQnND+KBAZD8R
	lUw5LgOdKUCUJDgiN8S9oeg/JBrhpusOSaVyBHR+vpbcvpTE1XY0kbX19Pc1xvvZFuCD0dDcCzNCS
	kB8W2atCU8BIRLBj+YpYuhCu9Tq5EezpfEwO8IVhb4KjAFkvZouYLJoiWy4kvnS0Ut+oHbaVd2N3L
	goKHyNb60CFCLSUme9d76+qAIPoxeHLkGKO9GU9/28wkp/2AAKVt4uo0Iy+lENmYuLvVQiW2gDnlh
	Wp8ccB4AdkL3tIpZ988g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mgE-00000006L6b-3yk6;
	Mon, 21 Oct 2024 07:18:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mcI-00000006KBd-2VxK
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 07:14:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49KNdnZD006185;
	Mon, 21 Oct 2024 07:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hBRCfPgu1vyB4VjNQILG00Eqs1DLwICYXQAWTx5WmFE=; b=pHuDOKZUR0it44Q/
	nHr7IGkZ4rHwX4zxV3HIaEc2MN7USMIBZ5VEAFvfoUTLvuyuPDy0Y5t6Hy0FyZ/j
	JdJFzRcUz/69DlVb+cWKTx+e6xnlSCyHAnXEZlzKXK8HNJNiV1TMhC7Soloj8Eem
	Pnw48cmP67eUaILBIyZJrhMQCO3K7mr99Pn3xwA6zpzCXNA0wRX8OYKWOyM9z7+a
	RPfHX+Wp02yx/2wmUP4mqxvM0jcc1N4g/n14Q6s/KkpP7UJZ1DC/GMdx1CuCdkVl
	piDeZs2Sn6173WlG9wxGrQrvS5yaplRnELYMx3KebW9/jnQGMvESU/9he1wQERD2
	YRHIfA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6w1kftv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 07:13:52 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49L7DpjO027079
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 07:13:51 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 21 Oct
 2024 00:13:45 -0700
Message-ID: <78820059-a1fa-2402-1e7c-0a9445b4fe1f@quicinc.com>
Date: Mon, 21 Oct 2024 12:43:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v11 8/8] arm64: dts: qcom: ipq9574: Disable eMMC node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <broonie@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <arnd@arndb.de>,
        <esben@geanix.com>, <nikita.shubin@maquefel.me>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20241010070510.1504250-1-quic_mdalam@quicinc.com>
 <20241010070510.1504250-9-quic_mdalam@quicinc.com>
 <0bde12c0-0c36-4d7c-9538-25d1b55d2fa9@oss.qualcomm.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <0bde12c0-0c36-4d7c-9538-25d1b55d2fa9@oss.qualcomm.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lfY6icX4uid13RR-7aJTQUo6jJtK_pud
X-Proofpoint-ORIG-GUID: lfY6icX4uid13RR-7aJTQUo6jJtK_pud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=556 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_001414_684741_695C0A99 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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



On 10/19/2024 2:55 PM, Konrad Dybcio wrote:
> On 10.10.2024 9:05 AM, Md Sadre Alam wrote:
>> Disable eMMC node for rdp433, since rdp433
>> default boot mode is norplusnand
>>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> ---
> 
> If eMMC is absent on this board, remove the whole &sdhc_1{} section
Ok, will remove in the next revision.
> 
> Konrad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
