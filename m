Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD125EE57C7
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Sep 2024 06:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aNPOX/p420IOjxAFy9i7btVsB/btzjVzW+aMyBz8wRI=; b=j3spS0YaySYA4v
	EfFNsVAGY4bwusGfhS3Yldx22/oXm2/H8ETRCoSKYIH4cpmt1jpYyYhmnV88hDC04HqhWtmOBr2m9
	dwqAMdlYz/eQkrvstP0sAYTRnH2cAeWsbpPUYNvpd+ctNqiGT5I5hffCdqgFgy5gJ0OWAzuaHGr5p
	90g2CiTdtVfeItDpqs+G0QuCfZLblrooPBky448NGa+J7bgXBKGVcWrm+E0+8w0TumIQt00WPuo2p
	VPD4CScmrjmN3igO9U3+Fyk7H0jAVo0rL1aAx2Oy2wTbp4qDiYT7ja/f5qfH1M+sNc8k0ojbP+pnq
	boke9Q28qLHe4yWRWE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodAM-0000000C0AB-2KtJ;
	Thu, 12 Sep 2024 06:18:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sodAK-0000000C09Z-0o06
	for linux-mtd@lists.infradead.org;
	Thu, 12 Sep 2024 06:18:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L3Hc000707;
	Thu, 12 Sep 2024 06:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bcpWMPBrKfFYTh0DDOkCavKCNrnvqAK6zb2Ig0d+Fkk=; b=hvGEfIkRisWXRd0N
	YqyA4I3BGzw3JDSi8A7i/Z0RiCuM0qDIUQjWPRcTeqSnZGjTqgHA2Yrs4CSn+svi
	XVrDQCSoIzNcxE6F6M/bcw+Ui0+u3KWxn64PSJkaoKiVugXxUWVY+1buIULlF7j0
	y7aEUM/9tBvH4979YZ29/nNUuVjrYrwGV3DIRk9iXHjR3v7kVthHRpts0iuf32Ap
	idM9cfc0+K52kC5ocachOabEIh05fULmqJ6yyEyp8+uV/hTimy1CWtHUrenRW1tg
	Nc9AkjrSwRqbgek2n7xtZ4LeyMPacgIDGWICFs/Ugxuab3p04LJbHdSfkLlkOfZZ
	m7QT7w==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybpv0wp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 06:18:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C6IZ0f028712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 06:18:35 GMT
Received: from [10.151.37.94] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Sep
 2024 23:18:30 -0700
Message-ID: <25975ae0-a8b3-a633-f3ee-c338de7a09a4@quicinc.com>
Date: Thu, 12 Sep 2024 11:48:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 0/8] Add QPIC SPI NAND driver
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
 <5169761b-422d-70ab-ba53-a898cb7bfa2f@quicinc.com>
 <20240903150826.749b8560@xps-13>
 <bb1397c3-2327-e211-f7eb-cac4b126424e@quicinc.com>
 <20240910094120.19348fea@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20240910094120.19348fea@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IkTYh_XMnR4e3VNSGJGPxyNdcCA3yKzG
X-Proofpoint-GUID: IkTYh_XMnR4e3VNSGJGPxyNdcCA3yKzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=905 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_231852_258687_CCA050A5 
X-CRM114-Status: GOOD (  13.23  )
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

CgpPbiA5LzEwLzIwMjQgMToxMSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSwKPiAKPj4+
Pj4gICAgID4+ICAgICAgIEkgaGF2ZSBhZGRyZXNzZWQgeW91ciBjb21tZW50cyB0byB2NiBhbmQg
ZnVydGhlciBwb3N0ZWQgdGlsbCB2OC4KPj4+PiAgICAgICAgQ291bGQgeW91IHBsZWFzZSBsZXQg
bWUga25vdyBpZiB0aGlzIGlzIGZpbmUuCj4+Pj4gICAgICAgIGFuZCBob3cgdG8gZ2V0IHRoaXMg
bWVyZ2VkID8KPj4+Cj4+PiBUaGVyZSBhcmUgc3RpbGwga2VybmVsIHRlc3Qgcm9ib3QgcmVwb3J0
cywgc28gdGhpcyBtZWFucyB0aGVyZSBhcmUKPj4+IGlzc3VlcyBpbiB5b3VyIGNvZGUgdGhhdCBJ
IGRvbid0IG5lZWQgdG8gcG9pbnQgb3V0IGV4cGxpY2l0bHksIGJ1dCBJIGFtCj4+PiBhY3RpdmVs
eSB3YWl0aW5nIGZvciB0aGVtIHRvIGJlIGZpeGVkLgo+Pgo+PiBJIGhhdmUgZml4ZWQgbW9zdCBv
ZiB0aGUgc3BhcnNlIHdhcm5pbmdzIGFmdGVyIGNvbnZlcnRpbmcgX19sZTMyIHRvIHUzMi4KPj4g
SG93ZXZlciBhbSBub3QgYWJsZSB0byBhZGRyZXNzIHRoZSBmb2xsb3dpbmcgc3BhcnNlIHdhcm5p
bmdzCj4+Cj4+IAlkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmM6MTQwMToyOTogc3Bh
cnNlOiB3YXJuaW5nOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19sZTMyCj4+IAlkcml2ZXJzL210ZC9u
YW5kL3Jhdy9xY29tX25hbmRjLmM6MTU4NzozMDogc3BhcnNlOiB3YXJuaW5nOiBjYXN0IHRvIHJl
c3RyaWN0ZWQgX19sZTMyCj4+IAlkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmM6MTU4
ODozMTogc3BhcnNlOiB3YXJuaW5nOiBjYXN0IHRvIHJlc3RyaWN0ZWQgX19sZTMyCj4+IAlkcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmM6MTU4OTozNDogc3BhcnNlOiB3YXJuaW5nOiBj
YXN0IHRvIHJlc3RyaWN0ZWQgX19sZTMyCj4+IAlkcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25h
bmRjLmM6MjQ3OTo0Nzogc3BhcnNlOiAgICBnb3QgcmVzdHJpY3RlZCBfX2xlMzIgW3VzZXJ0eXBl
XQo+PiAJZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jOjI0ODA6NDc6IHNwYXJzZTog
ICAgZ290IHJlc3RyaWN0ZWQgX19sZTMyIFt1c2VydHlwZV0KPj4gCWRyaXZlcnMvbXRkL25hbmQv
cmF3L3Fjb21fbmFuZGMuYzoyNjE2OjI1OiBzcGFyc2U6IHdhcm5pbmc6IGNhc3QgdG8gcmVzdHJp
Y3RlZCBfX2xlMzIKPj4gCWRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYzoyNjcyOjMy
OiBzcGFyc2U6IHdhcm5pbmc6IGNhc3QgdG8gcmVzdHJpY3RlZCBfX2xlMzIKPiAKPiBUaGUgcnVs
ZSBpczogeW91IGNhbm5vdCBhZGQgbmV3IHdhcm5pbmdzLgo+IAo+IEZvciBleGlzdGluZyB3YXJu
aW5ncyBpbiB0aGUgZHJpdmVyLCBJJ2QgYW55d2F5IGFkdmlzZSB0byBzb2x2ZSB0aGVtLgo+IFdp
dGhvdXQgdGhlIGFjdHVhbCBjb2RlIEkgY2Fubm90IGhlbHAuCkkgaGF2ZSBmaXhlZCBhbGwgdGhl
IHdhcm5pbmdzIGFuZCBwb3N0ZWQgbmV4dCByZXZpc2lvbi4KPiAKPiBUaGFua3MsCj4gTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
