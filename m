Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05794C02194
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOg8Py8gxXPWb0Soc3ZbRaD43HMkDSylsjAeoD1TiHc=; b=rFXW5euH99c/Mx
	6HYlqYthuo96O7O0LQ5eXqXOVvuXq5hdmGnFJAGH3qNbsMcfa4Vu0C1nilZR4relX4qi4qRpCYtul
	XiKM6yPYZ5ihl46uzktRGvDdFzpS/E8xvIsTaNDNofkRQiQFNkuFzd32hTsaMTZLDviMUdj+tVtcl
	t9g2S1AjiBkm5ewDZ4LZ7wgZDy21qmfazx/G8a6qR4T5ztZK4rnJblE4aHCHXVsmp1vDIRR4kf8dJ
	C1cyjK6lYs/bDIuuhBB6KhqFUDyLfv4XXMjAY5TcWCKjZ9rxm3AJJr2IiRnPR97lrcTTFDx4SLJ+C
	s22xf8VEL6jpEbnppRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1EK-00000006Iv4-33pk;
	Thu, 06 Feb 2025 12:43:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1EJ-00000006Iua-04Y1
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 12:43:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516AGVtk015699;
	Thu, 6 Feb 2025 12:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+VuwwPUX96t/cvLAig0W9CrSmNSvF+GAw2WUICZpBM=; b=RlYu1OA8BRoZs37J
	AlZng96pHzMmd5b/WS3mArhheJxQZkg6wK1Uu8SnYgsX7gZ4zD3Nwywdi2TrgQ/C
	GyfiRQP7RNKoMpqdyOOGScg/0hvqvCllrhy6E0Y7u2sk1pY0wjXE+zTmvDcI1DZn
	xnDdgS1E83WqXxVI/EZFbrOPZsAOr997ybn+R+beI6/3xzH4GKU4/HzFL9ogcebC
	k3y7x/vCJsXs3cD0ZwTmJx1BeyIdu3GBrW8H5JuVZMpGT6jrS1itMQOOSlmtiCNR
	7dQFerqlN+/t/eYGocVaXBAve+8g0Cfsne1qzTX/EHp5UMvpO+I8rLQL4g/Bqa+G
	gk1Zbw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mu6f0b3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 12:43:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 516Ch5Z4004850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 12:43:05 GMT
Received: from [10.216.49.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 04:42:52 -0800
Message-ID: <689302c6-8fba-4fd1-a4b7-557cb2f8fa4d@quicinc.com>
Date: Thu, 6 Feb 2025 18:12:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] dt-bindings: pci: Add fsl,mpc83xx-pcie bindings
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Frank Li
	<Frank.li@nxp.com>
CC: <devicetree@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        Scott Wood
	<oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael
 Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao
	<naveen@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Damien Le Moal
	<dlemoal@kernel.org>,
        Niklas Cassel <cassel@kernel.org>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Lee
 Jones <lee@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi
	<lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
	<kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?J=2E_Neusch=C3=A4fer?=
	<j.neuschaefer@gmx.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter
 Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-ide@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20250126-ppcyaml-v1-0-50649f51c3dd@posteo.net>
 <20250126-ppcyaml-v1-6-50649f51c3dd@posteo.net>
 <Z5qx3jAFE81Ni2cJ@lizhi-Precision-Tower-5810> <Z6KkBEaGTkSyWiE_@probook>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z6KkBEaGTkSyWiE_@probook>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TE8H3f9cFLjJrvrDo3x9nlVxTSkbm7Tn
X-Proofpoint-ORIG-GUID: TE8H3f9cFLjJrvrDo3x9nlVxTSkbm7Tn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=657 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_044339_172973_F4531C32 
X-CRM114-Status: GOOD (  11.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyLzUvMjAyNSA1OjA0IEFNLCBKLiBOZXVzY2jDpGZlciB3cm90ZToKPiBPbiBXZWQsIEph
biAyOSwgMjAyNSBhdCAwNTo1NToyNlBNIC0wNTAwLCBGcmFuayBMaSB3cm90ZToKPj4gT24gU3Vu
LCBKYW4gMjYsIDIwMjUgYXQgMDc6NTk6MDFQTSArMDEwMCwgSi4gTmV1c2Now6RmZXIgd3JvdGU6
Cj4+PiBTdXBwbGVtZW50IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvZnNs
LHBjaS50eHQgd2l0aCBhIG1vcmUKPj4+IGZvcm1hbCBiaW5kaW5nIGluIFlBTUwgZm9ybWF0Lgo+
Pj4KbmVhdDogc3ViamVjdDogc2luY2UgYmluZGluZyBpcyBhbHJlYWR5IG1lbnRpb25lZCBpbiB0
aGUgcHJlZml4IG9mIHRoZSAKc3ViamVjdCwgbm8gbmVlZCB0byBhZGQgYmluZGluZ3Mgd29yZCBh
Z2Fpbi4KPj4+IFNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5lQHBvc3Rlby5uZXQ+
Cj4+PiAtLS0KPj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2ZzbCxtcGM4eHh4LXBj
aS55YW1sICAgfCA4MyArKysrKysrKysrKysrKysrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCA4MyBpbnNlcnRpb25zKCspCj4gWy4uLl0KPj4+ICtleGFtcGxlczoKPj4+ICsgIC0gfAo+Pj4g
KyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmg+Cj4+
PiArCj4+PiArICAgIHBjaTE6IHBjaWVAZTAwMDkwMDAgewo+Pgo+PiBuZWVkbid0IGxhYmVsIGhl
cmUKPiAKPiBXaWxsIGNoYW5nZS4KPiAKPiAKPiBUaGFua3MsCj4gSi4gTmV1c2Now6RmZXIKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
