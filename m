Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9B4C0018A
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yUkzahJP4JDTOjyjH2bjHLfR6gbMF0roc6bJ1V5Hs8=; b=b4ipscq1Hr/kzuovly//BRxaum
	zeJB9kjQEIQPLePu9c/Odcr/YQUN2FXDwf2P2Ds8CtnQTayPMrrKlkF/u0Sg7aGMuKehPNbVO0qOR
	xTblb2eKXg3nJ3eibqpBwTJjoh82biqiCSNtmiLuXjT+0gyTdjY7vt1E0AiyyneMmiz4n3SgSmi2D
	DaPdttIaIByycFg4imOXME8JSdMoM/kzkGPnB2f2HFTK9eEnukAK/D/R9Y0/mF+gz4jXFjxg003EQ
	cAGhNqV+f7qThTxP0lmG5eDIL62jdJVQP4dcL+EPSxfk60fFesy8L0h+hPNUDbAQt4HFrLMjBCPBh
	JL9mAvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qysK1-00BKXq-2Z;
	Fri, 03 Nov 2023 11:26:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qysJw-00BKXU-0k
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 11:26:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A3BApAX021726;
	Fri, 3 Nov 2023 11:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lfQIATagDXr/IHl018bEVxuu1E+1OhBeQ1S0dtuTD7U=;
 b=Wkxl8puXjlYAzj4Ieivbx7VPVNi5cMv7U0Dz3OdlbtfIF8kIv0o1qaoZ8kRbYjRLFYGm
 m+B+W8vDhRMX8BTZtAghu/Z7DLNKpqzkXzLZ8UlPNwdnA5o4lsoJPxOtvumUWtUe5ovQ
 Nig6XYuhWkPR4lSKvEIVM/I2r9x5RvKnWNGgieXoR0bAI7LGLYZcj5/ekdNhAJ+vW9vu
 Mo4f2/fjUPdTvArWmm5yJyvmAyJxQTDqmxuHxk186F09m5h1Or9mWsaZwkUcV/TTJtu4
 Y8AH466xorSLTzurkd9bl6XkiZ9ZonYnrVH5SDkDzXLkFsAm7AG12YrEM2c4FH5xJjiU Sw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u47dy31jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Nov 2023 11:26:27 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A3BQQJg016440
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Nov 2023 11:26:26 GMT
Received: from [10.216.26.1] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Fri, 3 Nov
 2023 04:26:20 -0700
Message-ID: <0140b8b9-0043-4cf4-0704-7727774dba0f@quicinc.com>
Date: Fri, 3 Nov 2023 16:56:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [RFC PATCH 2/5] arm64: dts: qcom: ipq9574: Add ecc engine support
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <robh+dt@kernel.org>, <conor+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-spi@vger.kernel.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-3-quic_mdalam@quicinc.com>
 <873c1b14-5b7c-4fb1-8f09-6344a4bf901b@linaro.org>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <873c1b14-5b7c-4fb1-8f09-6344a4bf901b@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZK53JGex603L5pTAe7eCzW7u4s1svBif
X-Proofpoint-ORIG-GUID: ZK53JGex603L5pTAe7eCzW7u4s1svBif
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-03_11,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0 mlxlogscore=798
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311030096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_042636_410212_74626CC9 
X-CRM114-Status: GOOD (  14.01  )
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



On 10/31/2023 8:53 PM, Konrad Dybcio wrote:
> On 31.10.2023 13:03, Md Sadre Alam wrote:
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
>> ---
> Hello,
> 
> you're missing:
> 
> - dt-bindings (make dtbs_check is unhappy)
> - a commit message
> - Co-developed-by for Sricharan

> 
> status should read "okay" instead, but in this case it's unnecessary
> as you're defining the node and lack of the status property also means
> that device is enabled
> 
> however
> 
> this ECC engine seems to be a part of the NAND controller, so it's
> unlikely that the DT maintainers will agree for it to have a separate
> node
> 


Will drop this patch as this was NAK-ed
QPIC controller has the ecc pipelined so will keep the ecc support
inlined in both raw nand and serial nand driver.

Regards
Alam.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
