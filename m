Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659DCD3B7DE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7d9Re0sI4xs5JWAwRMrysbNQL47UIGV534HHccNkBsA=; b=D0FraJWOL4xyyE
	KgzyyC2hCzdUEMF7QEKEg1KJNfoVA6N/Oml/leuyHUml8G4D7htD0eJzrdOTrqD0jCD9xuDRykIU+
	esys/K+A15SRY9F5BFlUaJwGn6SmityRcAY/VL9JMZvHWqi984ePqqxWgX5sph2yBIaIQWkZ1Gk+u
	2SbVCyT3VRzkdVZlrJIGFUbtBsjMOxVVY1dzMoJCsMYOfB8tXdxuAFc2vW+8ui4Wn7gz4yO4z0+HC
	+FTMX7qlEe7QgniS324mp2CDJZ2LzOVBpFRuxuph9dCmW+5qVaD9s8mwdp3OFBh7noL93i35oE6f8
	qfZ0IVhUe2I4UgvNkEOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYS6-0000000CwtZ-04Yt;
	Mon, 08 Dec 2025 10:26:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSYS3-0000000Cwt3-1Uw4
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 10:26:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B88wq223096344;
	Mon, 8 Dec 2025 10:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJ+khFB3JTD/9yjARB0ndD0h1fHRX5zNgIMiiU2BXWc=; b=Sz5KAKD42Cy5FJ4o
	/47/IvK+gT5tcnipHv/kcJVeC/Hnuf7EMSWv+atIrNN6o4dPGhJufOydSoqmQQHM
	AMJKTZ1XaczL7wLWkdQRzCqGoPMKjVIf/L7hzkxWT4aJeZ0127Ru7NgG20clDsPj
	7EZvdJLhx1AmLiVlI+eUg9GIHpFWvtRu/F9Wj1VLlO7Nnb13dWgK13Bi/FI2cy5r
	2Md9vYFTQgERLRHbl4b4i/sW62OHotRPEKz3Z9zmbZ+l4QSYY+fAXFVxda9kCpZu
	IHhYqVy1hohGKc7ETeQF3Kp840ERb7GhEGZgrIC+F5lYBL4jiYlvSilQLAYlVNM/
	1fvGSA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4avd8e4j67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 10:26:39 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B8AQck3027691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Dec 2025 10:26:38 GMT
Received: from [10.151.36.184] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 02:26:35 -0800
Message-ID: <b33fc77b-81f6-1628-bdf3-20b1d51e774c@quicinc.com>
Date: Mon, 8 Dec 2025 15:56:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] Revert "mtd: spinand: esmt: fix id code for F50D1G41LB"
To: George Moussalem <george.moussalem@outlook.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Ziyang Huang <hzyitc@outlook.com>
CC: <richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>,
        <mmkurbanov@salutedevices.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <87wm2x74pz.fsf@bootlin.com>
 <BL4PR19MB8902CF825EF35C4F145300BF9DA2A@BL4PR19MB8902.namprd19.prod.outlook.com>
Content-Language: en-US
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <BL4PR19MB8902CF825EF35C4F145300BF9DA2A@BL4PR19MB8902.namprd19.prod.outlook.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA4MDA4OCBTYWx0ZWRfX2J2Sb7Ztnukx
 TjiVdYhQXXcWEpzrGZRq/8m4C0n7Gcdqu4aRUZ/IW5etyVb2uoXE+6ZrI2lxErUIU5Z+7ewxxoT
 cwJ+wzmy2sdIbAY7ZZ7OxdizcyyCkRxyLNilOxGp8wkyE5GQzDilFhBlWJ/Oej+8L5v9gEyP8Ml
 oCKVEWq6xI0k+zmj8KOsZsOO9UgkxnRX2XqtfhSZya3llXAaXSGd57QoN/HBWGtkz3RTvWPiEtR
 2yS2aQAQvR2VGcf1LOIkF/POePcoMH9QmylZUZSHLzm4k5x3YuYoUbpoTje9KdjXdLerqEmsIQO
 NF43yfJHEPy1uJLXdiQYc5L3aTNkkwSMPhJIL6wiafy7cMqILTcLs+X78pDj64uTHHm/JKTK2sZ
 QK/c7sCqNcO9NO/tahXyu05y12lCFg==
X-Authority-Analysis: v=2.4 cv=BqaQAIX5 c=1 sm=1 tr=0 ts=6936a7df cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=8saBfKwcVPVdoUCdR_MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: uZRRoXvpzSUuiY38s50MmWDPIklO1xkj
X-Proofpoint-ORIG-GUID: uZRRoXvpzSUuiY38s50MmWDPIklO1xkj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512080088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_022643_423540_7093585E 
X-CRM114-Status: GOOD (  12.02  )
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

SGksCgpPbiAxMi84LzIwMjUgMjo1NiBQTSwgR2VvcmdlIE1vdXNzYWxlbSB3cm90ZToKPiAKPiAK
PiBPbiAxMi84LzI1IDEyOjMzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBPbiAwMi8xMi8yMDI1
IGF0IDIzOjA1OjU2ICswOCwgWml5YW5nIEh1YW5nIDxoenlpdGNAb3V0bG9vay5jb20+IHdyb3Rl
Ogo+Pgo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCBkZDI2NDAyNjQyYTA4OTlmZGU1OWVhNmIwODUy
ZmFkM2Q3OTliNGNjLgo+Pj4KPj4+IFRoZSBpc3N1ZSBHZW9yZ2UgbWV0IGlzIGR1ZSB0byB0aGUg
bGltaXQgb2YgUVBJQywgbm90IHRoZSBpc3N1ZSBvZiB0aGUKPj4+IGZsYXNoIGNoaXAuCj4+Pgo+
Pj4gUVBJQyBvbmx5IHN1cHBvcnRzIDQgYnl0ZXMgSUQuIFNvIHRoZSBmaWZ0aCBieXRlIGlzIGFs
d2F5cyAwLgo+Pj4KPj4+IElmIHdlIHVzZSBzcGktZ3BpbywgdGhlIGZpZnRoIGJ5dGUgY2FuIGJl
IHJlYWQgY29ycmVjdGx5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFppeWFuZyBIdWFuZyA8aHp5
aXRjQG91dGxvb2suY29tPgo+Pj4gLS0tCj4+Cj4+IFNvIGhvdyBkbyB3ZSBzb2x2ZSB0aGF0Pwo+
Pgo+PiBJcyB0aGVyZSBhbnl0aGluZyB0aGFuIGNhbiBiZSBkb25lIG9uIHRoZSBxcGljIHNpZGU/
Cj4gCj4gSGkgQWxhbSwKPiAKPiBJcyB0aGUgaGFyZHdhcmUgaXRzZWxmIGxpbWl0ZWQgdG8gcmVh
ZGluZyA0IElEIGJ5dGVzIG9ubHkgb3IgaXMgaXQgYQo+IGRyaXZlciBsaW1pdGF0aW9uPwoKVGhl
IGhhcmR3YXJlIGl0c2VsZiBpcyBsaW1pdGVkIHRvIHJldHVybmluZyA0IElEIGJ5dGVzLiBRUElD
IHJlYWRzIHRoZSAKZGV2aWNlIElEIGFuZCBwbGFjZXMgaXQgaW50byB0aGUgUVBJQ19OQU5EX0ZM
QVNIX1JFQURfSUQgcmVnaXN0ZXIsIHdoaWNoIAppcyAzMuKAkWJpdCB3aWRlLiBBcyBhIHJlc3Vs
dCwgb25seSA0IGJ5dGVzIG9mIHRoZSBkZXZpY2UgSUQgYXJlIGF2YWlsYWJsZSAKdG8gc29mdHdh
cmUuIFRoZSByZWdpc3RlciBzdG9yZXMgdGhlIElEIGJ5dGVzIGluIHRoZSBvcmRlciBbMzE6MjRd
ID0gCmJ5dGUgMywgWzIzOjE2XSA9IGJ5dGUgMiwgWzE1OjhdID0gYnl0ZSAxLCBbNzowXSA9IGJ5
dGUgMC4KClRoYW5rcywKQWxhbS4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
