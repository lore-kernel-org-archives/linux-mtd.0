Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE10ACA0EEC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4b3/xFZL/6zLRLquj2eshtuf46VjVfxgLB068h1vBk=; b=2/EEvWQJqenL//
	ZpfDqTv7AgvCdYlO/SVH8VRytivkihrJpzHyT4EO+nuPOOVEJdBv17Jm6/Mm+k+hiJ0tjJddFdoQa
	Nxa2CrKVilqU2gjDAtn4aOQgrKPRSpevxGgKV5T3xhk8qn/MZ0O5oxRWvYYBDn49YpOKIQiI1M7U3
	nIGTSPbul5zrgCGnn7MV0o4mBqBYmJ7tLgiYfmR31bULRPTzbJ7P9mGu5N5bRRF8rzTzyAAbbIeMn
	HJHurYhHPTOykR+VpkxvCzvtJ8bDZOiJlqfmF92a0LaEw8xnqyDoemSiRSdYx46Mz/9lXMu5X5iFv
	PM5xUgi/rOsqzz1Rhaow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4RI-003ajw-2g;
	Tue, 12 Sep 2023 14:32:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg4RF-003aj0-2w
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 14:32:27 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CDo0Kr006822;
	Tue, 12 Sep 2023 14:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0MXVxIMxcRyFzQm0Xx9I9lFxvozA1Kor5DCnR3zK4y4=;
 b=dnIejVxKqnp5xXncE0ZUNMrPRJv22cT/c11yDNbXVdyszxMCppyB8N5RirZ6tC8iPHUD
 LHSLfapwGWs2HALaDDWDCjObRbv/E1tGuqq6q/Xt57XkjMyAPpGJ2G4VSjDChyzFSpfK
 2Va2Q+BRSJUpMNnoguOtMqQOgKeP+jB/vHNJ8wyiRckhQWlztB7ILUIym+6MXrD9npJy
 lCQ47sH67DrNqhqZ3cTNsApcyarKadFzl2pCg5Q+CL2SOyZACG6gxi6Wp7c071QnQu47
 75jEFl+0bzN6YXYc1pGOK5LeN3eAtyEviZA/dBt6nRrt8/GEiZ/uWNqqBzYh+GoH0BiB Vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2qefggng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 14:32:18 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CEWHCd014452
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 14:32:17 GMT
Received: from [10.214.227.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 12 Sep
 2023 07:32:11 -0700
Message-ID: <5e80e600-b523-476a-81bd-93d2c517b7b6@quicinc.com>
Date: Tue, 12 Sep 2023 20:02:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mtd: rawnand: qcom: Unmap the right resource upon
 probe failure
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_pkondeti@quicinc.com>
References: <20230912115903.1007-1-quic_bibekkum@quicinc.com>
 <20230912142847.4610c0a0@xps-13>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20230912142847.4610c0a0@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UUqJCj4RTDMBGTqI3ChIGIYPOVlEBR2D
X-Proofpoint-ORIG-GUID: UUqJCj4RTDMBGTqI3ChIGIYPOVlEBR2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=473 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_073226_081322_9ADCD93E 
X-CRM114-Status: UNSURE (   9.95  )
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



On 9/12/2023 5:58 PM, Miquel Raynal wrote:
>> We currently provide the physical address of the DMA region
>> rather than the output of dma_map_resource() which is obviously wrong.
>>
>> Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
> Cc: stable?
Cc: stable@vger.kernel.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
