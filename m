Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B61AC48BC4
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 12:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0XT8DZsK/7xv5IEdRaAWIfQ1ZWEHuv9LG+vbxH38q4=; b=CDKiWXoCqsJhix
	l7JolqnX2F2A5uI1PpqhWyJhqs9qjq11YgbdP233HhgedIwhXkfeR/W8lD9usKURybbySlnuSp1Tz
	ZCI4TDLYiCMfUtZxaPhcz+HcAbCuEY03W25mM1YkSJO1SxSvQp4ExT+XLxU8+iLIwbux9gGZA0SqS
	Ig2FCTG35mlm34D6MP+DpgDRZbF064aom2oqFXkZhVXTa1cSxgQ/KB4843Va9ljNZx2v7/mVnwuiZ
	d0Wbdr35Xd5fZ2707khT35pZMZAma6g+BIHRwrCON5B1PPv7lBI5ADZPe0TxQDBKKRA3D+epyllIS
	7YRKiaIXo2QF3mhvI+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPJH-0000000EiNr-1N0r;
	Tue, 20 Feb 2024 12:33:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcPJF-0000000EiNG-2sNT
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 12:33:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41KADuSC021368;
	Tue, 20 Feb 2024 12:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aZqdYkf9yBn7uDqQwJZdkkHvOw5yxarzAkmgKi369wA=; b=Hu
	6lTqj/Dka7Nyrs3Y7SBTBeUkRkny9U8IHotkrpXQdNdyzVy3Wwxqd9Lrv0nh6Biw
	Ft5tVDLYdZKOmTYERTUSrof1T1WKeVeG8Qz9m2+wdpTGAnUuO70ZGXHn8mnaG4eQ
	1rm6gX2BdBlp52GHs8vh95/PZ7zGq1IAy4/IrURlNuExpxetx6c1zBttkQVsNtB4
	RYGfyQONcscwBa8i4cQH3oymFOcczh3/JRcIavMj2sDkE1NiF9ItjJkuHjM3O5r0
	MQW7k9m93UAgF7WfmkEpo7cPtnZMUfTZIU2A7V16wy35810ryj9xqSYZgjNz9neB
	J33c6hKUKsWsbKzdwunA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wct5787xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:33:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41KCXAdv008363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 12:33:10 GMT
Received: from [10.216.16.129] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 20 Feb
 2024 04:33:04 -0800
Message-ID: <b3e3a1e3-9c48-6c37-cd7c-6df2faaf884e@quicinc.com>
Date: Tue, 20 Feb 2024 18:03:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq9574: Disable eMMC node
Content-Language: en-US
To: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <broonie@kernel.org>, <robh@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-6-quic_mdalam@quicinc.com>
 <ea840faa-e628-4f2f-a7ea-aa222f58f820@quicinc.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <ea840faa-e628-4f2f-a7ea-aa222f58f820@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gD9JeeBpxLCBL311higl3RFS1l1sha_1
X-Proofpoint-GUID: gD9JeeBpxLCBL311higl3RFS1l1sha_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=771 mlxscore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402200090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_043317_751266_9A04E752 
X-CRM114-Status: GOOD (  11.71  )
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

CgpPbiAyLzE2LzIwMjQgOToxMyBQTSwgS2F0aGlyYXZhbiBUaGlydW1vb3J0aHkgd3JvdGU6Cj4g
Cj4gCj4gT24gMi8xNS8yMDI0IDc6MTggUE0sIE1kIFNhZHJlIEFsYW0gd3JvdGU6Cj4+IERpc2Fi
bGUgZU1NQyBub2RlIGZvciByZHA0MzMsIHNpbmNlIHJkcDQzMyBkZWZhdWx0IGJvb3QgbW9kZQo+
PiBpcyBub3JwbHVzbmFuZC4KPj4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBTcmljaGFyYW4gUmFtYWJh
ZGhyYW4gPHF1aWNfc3JpY2hhcmFAcXVpY2luYy5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IFNyaWNo
YXJhbiBSYW1hYmFkaHJhbiA8cXVpY19zcmljaGFyYUBxdWljaW5jLmNvbT4KPj4gQ28tZGV2ZWxv
cGVkLWJ5OiBWYXJhZGFyYWphbiBOYXJheWFuYW4gPHF1aWNfdmFyYWRhQHF1aWNpbmMuY29tPgo+
PiBTaWduZWQtb2ZmLWJ5OiBWYXJhZGFyYWphbiBOYXJheWFuYW4gPHF1aWNfdmFyYWRhQHF1aWNp
bmMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxhbUBxdWlj
aW5jLmNvbT4KPiAKPiAKPiBTaW5nbGUgbGluZSBvZiBjaGFuZ2UgaXMgZGV2ZWxvcGVkIGJ5IDMg
YXV0aG9ycz8KCiAgV2lsbCBmaXggaW4gbmV4dCBwYXRjaC4KPiAKPiAKPj4gLS0tCj4+IMKgIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9pcHE5NTc0LXJkcDQzMy5kdHMgfCAyICstCj4+IMKgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL2lwcTk1NzQtcmRwNDMzLmR0cyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvcWNvbS9pcHE5NTc0LXJkcDQzMy5kdHMKPj4gaW5kZXggMWJiOGQ5NmM5
YTgyLi5lMzNlN2ZhZmQ2OTUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcWNv
bS9pcHE5NTc0LXJkcDQzMy5kdHMKPj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9xY29tL2lw
cTk1NzQtcmRwNDMzLmR0cwo+PiBAQCAtMjQsNyArMjQsNyBAQCAmc2RoY18xIHsKPj4gwqDCoMKg
wqDCoCBtbWMtaHM0MDAtZW5oYW5jZWQtc3Ryb2JlOwo+PiDCoMKgwqDCoMKgIG1heC1mcmVxdWVu
Y3kgPSA8Mzg0MDAwMDAwPjsKPj4gwqDCoMKgwqDCoCBidXMtd2lkdGggPSA8OD47Cj4+IC3CoMKg
wqAgc3RhdHVzID0gIm9rYXkiOwo+PiArwqDCoMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+IMKg
IH07Cj4+IMKgICZ0bG1tIHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
