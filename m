Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F34CC25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2024 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSoQKxeBvhoNIR4mxkdKXfqPTKCAkvBjARZvUVVXlvA=; b=oJTL+2qWJ1Bys1
	C4euxXV2rjLKjTy8XYq/0UNaZbhKo3dqYnQQgmbHP/F21BnzerGKEEUtnvg2YptMQcVsIfwrWlX/Z
	6/WRVccEa1CWLPnBuIMvtqoj8M1dXPJceMaH5JLGF3ZcNm5u4LqDlPQ+DPA8YS9LzMeVPsgeiGfQl
	AAYNYse2p97EKvLGWzWDLyMt0XZKGrPkeV+Y9mTYFBWAzZHwLMg7R1gzEtr9ZuYN7LbhMbunyh/GD
	jf+snxbtzKuT+/d+W0IQopgw9aoB+bXz9uO3i1SxJQapA59GalTIRIqoGaBEQHsDlQF8nUACar9DI
	uoCoaA3PsK/s8C+hniPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9f9y-000000024wz-0nM1;
	Wed, 22 May 2024 06:09:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9f9u-000000024wS-3vJ1
	for linux-mtd@lists.infradead.org;
	Wed, 22 May 2024 06:09:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LNaRHs019181;
	Wed, 22 May 2024 06:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=76X18h8ZdxGj97syQ3G8X16mJAi6U8JWctpGW0mNnGM=; b=Vf
	cFxf9cRRjiPYJwdfkeRQkRxSwgXWdNCY0Wwdh+iQhCGEXlUEdMXe6DNkBTRLEGFw
	GLqAKJed9gNHi7Jlqn+rWm2qu70L955pYwSaNK7E7w1+Gn5Kc/IkC9fNO0XRxeZ7
	cFFeQ5SXKQD+23ibg0D8s3UJR0QcCYlgRM+lg3PqAB1Wl9UF4MO0LedTYPDv6E/k
	GWVDc0DUsrtFCLqf0s9Uv7tS8Q7wzQUNN6omCr9LVPF4lr14F7oIdyg4hYLHrAqL
	7/mh/8Co35rimFPifRFmpjU355JYMVG4OH5glBdq1ByV5eGIuadp2UppMVGmmTfb
	4K+yiTfP5GBLaYbh2NlA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4gfyeh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 06:08:54 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44M68rYs023009
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 06:08:53 GMT
Received: from [10.216.52.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 23:08:48 -0700
Message-ID: <1eaa6f78-07d8-25e7-2e00-1284dd37f761@quicinc.com>
Date: Wed, 22 May 2024 11:38:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v6 4/8] drivers: mtd: nand: Add qpic_common API file
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240521105532.1537845-1-quic_mdalam@quicinc.com>
 <20240521105532.1537845-5-quic_mdalam@quicinc.com>
 <20240521145140.5cb49946@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240521145140.5cb49946@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aUN5v4k1sl7V4N9StjvzU3eaRECy46JR
X-Proofpoint-ORIG-GUID: aUN5v4k1sl7V4N9StjvzU3eaRECy46JR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_02,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_230907_172814_98C2D033 
X-CRM114-Status: GOOD (  12.00  )
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

CgpPbiA1LzIxLzIwMjQgNjoyMSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPj4g
ICBkcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlICAgICAgICAgICAgfCAgICA0ICstCj4+ICAgZHJp
dmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jICAgICAgIHwgIDc0MCArKysrKysrKysrKysrKysr
Kwo+PiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYyAgICB8IDEwOTAgKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBpbmNsdWRlL2xpbnV4L210ZC9uYW5kLXFwaWMtY29t
bW9uLmggfCAgNDY3ICsrKysrKysrKysrCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxMjIyIGluc2Vy
dGlvbnMoKyksIDEwNzkgZGVsZXRpb25zKC0pCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvbXRkL25hbmQvcXBpY19jb21tb24uYwo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2xpbnV4L210ZC9uYW5kLXFwaWMtY29tbW9uLmgKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvTWFrZWZpbGUgYi9kcml2ZXJzL210ZC9uYW5kL01ha2VmaWxlCj4+IGluZGV4IDE5
ZTEyOTFhYzRkNS4uZTU5MTA2ZTBhM2FmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L01ha2VmaWxlCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvTWFrZWZpbGUKPj4gQEAgLTMsNyAr
Myw5IEBACj4+ICAgbmFuZGNvcmUtb2JqcyA6PSBjb3JlLm8gYmJ0Lm8KPj4gICBvYmotJChDT05G
SUdfTVREX05BTkRfQ09SRSkgKz0gbmFuZGNvcmUubwo+PiAgIG9iai0kKENPTkZJR19NVERfTkFO
RF9FQ0NfTUVESUFURUspICs9IGVjYy1tdGsubwo+PiAtCj4+ICtpZmVxICgkKENPTkZJR19NVERf
TkFORF9RQ09NKSx5KQo+PiArb2JqLXkJKz0gcXBpY19jb21tb24ubwo+PiArZW5kaWYKPiAKPiBC
cmVha3MgaWYgeW91IHNldCBDT05GSUdfTVREX05BTkRfUUNPTSA9IG0KICBPayAsIHdpbGwgZml4
IGluIG5leHQgcGF0Y2guCj4gCj4+ICAgb2JqLXkJKz0gb25lbmFuZC8KPj4gICBvYmoteQkrPSBy
YXcvCj4+ICAgb2JqLXkJKz0gc3BpLwo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9x
cGljX2NvbW1vbi5jIGIvZHJpdmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZGZiYmI1ZjYyNmI2Cj4+IC0tLSAv
ZGV2L251bGwKPj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jCj4+IEBAIC0w
LDAgKzEsNzQwIEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
Cj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChjKSAyMDE2LCBUaGUgTGludXggRm91bmRhdGlvbi4g
QWxsIHJpZ2h0cyByZXNlcnZlZC4KPj4gKyAqLwo+PiArI2luY2x1ZGUgPGxpbnV4L2JpdG9wcy5o
Pgo+PiArI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+
Cj4+ICsjaW5jbHVkZSA8bGludXgvZG1hZW5naW5lLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvZG1h
LW1hcHBpbmcuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9kbWEvcWNvbV9hZG0uaD4KPj4gKyNpbmNs
dWRlIDxsaW51eC9kbWEvcWNvbV9iYW1fZG1hLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbXRkL3BhcnRpdGlvbnMuaD4KPiAKPiBEaWRuJ3QgeW91
IHNheSB5b3Ugd291bGQgcmVtb3ZlIHRoYXQgaW5jbHVkZT8KICBTb3JyeSwgbWlzc2VkIGl0ICwg
d2lsbCBmaXggaW4gbmV4dCBwYXRjaC4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
