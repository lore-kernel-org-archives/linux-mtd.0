Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE55C48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6oxUBOStL1+5Gc5hzNURcHER45y62+A2ywUbEwfUWY=; b=aCVt0CJPC6U/c3
	XFNQL0uq5vGTXmwmqegIHqXR82T+IKD4936JsjuhFJuvUpDGIhleu0K8QReJqg5tqs4R/kkMN3GeQ
	+cdllnsTOxD4aMSaYqK9P4Hub26OLoWMJDU3613gDMBa10UJ6vVRSNKg+6kU5+GJUF4mY4+k3wb3b
	UX8xPvoM+UPu34xv8GkMQcAJQUYgJEa4znCvYTwEFajMrduIe5dc58VIqEtq4oeRNxA0aMrFD/p2h
	zlf2aNLBvyYjhBry7O3nWn0dW1FZf5j4Pj4zJCMKCty4u5CJM/U/3BuUIBXlnCpfam7CvXipdval0
	dYVzYC2hGKXP+Xm6o5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOsc-0000000EanG-2Npx;
	Tue, 20 Feb 2024 12:05:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcOsZ-0000000Ealb-0O3a
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 12:05:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41K89mOx014360;
	Tue, 20 Feb 2024 12:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uaotM+TMfu6Ag+7mzcFHA7Okom4KyPPm/SNRIsJyHi4=; b=R4
	Hc1qUhB0HCQSah9EPrtfDxHShgjeAKd2s+RqqKer31LFnurj7HG5PwhP6AT9ZtNd
	pGkI1piGPOc8MO/mgjQEUxL6dAh5EJ8SuLqmrriNTJ2l+pIDSgXSe79NYeP4Wzfg
	asGJOxFqoOVET7xNBMI/SpS9JmCR/vnQEYPQuvmLoyDEjVyzcEUeVrMKSFIDA+wC
	ElzCHcHodMqS/XlCE/FZRuprDkTfsmSQ5RSuuzqESIiMmpIwfoPu0eU/lPx81fVo
	5ZFJH7mpvobQPWVg23aDN8PkE2qx4KHlTQtFXxtnxZdM3m4T/kLuaLP3lS1TBNvG
	08GHCTEUEFwWdewmvqPQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wcravgfdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:05:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KC5Xxo002018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:05:33 GMT
Received: from [10.216.16.129] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 04:05:27 -0800
Message-ID: <48ab25f4-fc8e-f420-924d-bbae797048b2@quicinc.com>
Date: Tue, 20 Feb 2024 17:35:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/5] spi: dt-bindings: add binding doc for spi-qpic-snand
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-2-quic_mdalam@quicinc.com>
 <ab55fcde-f3ee-426c-ae24-2e76ffb20a2b@sirena.org.uk>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <ab55fcde-f3ee-426c-ae24-2e76ffb20a2b@sirena.org.uk>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7K83zaQ7nw6AGb3krlCnT41vnav1Acx3
X-Proofpoint-ORIG-GUID: 7K83zaQ7nw6AGb3krlCnT41vnav1Acx3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=781 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402200087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_040543_302167_E14A405D 
X-CRM114-Status: UNSURE (   9.04  )
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



On 2/15/2024 7:52 PM, Mark Brown wrote:
> On Thu, Feb 15, 2024 at 07:18:52PM +0530, Md Sadre Alam wrote:
> 
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 3
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 3
> 
> The driver requests the clocks by name but this does not document the
> expected set of names.  The driver also unconditionally requests all
> three clocks so won't work with only two clocks.

Thanks for reviewing, Will document the clock name in next patch.
By mistake i have given minItems = 2 and maxItems = 3 , will fix
this in next patch.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
