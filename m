Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51066CA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/sK5wSa9UJmH0olY8udCK69zvZMAbOCtWtt+vAXF58=; b=iBFhmeFw6537UP
	w299VawGVDcb9At4wmJkF8VvIXKUTmu1Jnq5RyVorNkJtrpaI/i7ied+aI5GI/OshBJ/+YmWdGZpP
	UiCAnviOCfF13sWtut+tEx0ZSp9O7cnA0oPpUTc2DqlySXoPvQoszZ7OYW6uP+qUexhtikOGNs4N7
	7IjUUiVuHr+iOkCaGCjC8jRBimURK9jpEE7/j33AYC58YVUBRT4xytfJYwYC0zENvnkuKSWyOISRW
	wvvCVSbzs0YsJu6Ib8IWbHbQfPLSgxvMdkhMmfIY553bNPKovVYQwEWyvQ9d3a68D8db+OkuCAc58
	eQUPx8sz2dMIVdyw65dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg1e0-003DU3-3D;
	Tue, 12 Sep 2023 11:33:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg1dy-003DTI-29
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 11:33:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C9hK3G017949;
	Tue, 12 Sep 2023 11:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zMaARZlcYQLkkzusDpZ0KZOEJPy402eycqTbduCNAZY=;
 b=PUppaESB7NMwcrhIrZ1hhrQmGVmPlWlpP/EYzB3fiiIZ94EhLCPX2+yadfrgrOkV0jQk
 DFTH2/iCuoa7P2/vQh7l/0x1kljRq1RtHPPK4pPtSyjOgP2jnw+W42NP+y6QZXIKC8Nt
 UryX030/lD+EFtIKp99q/vj+Dcpo93QgVdV9JOHEqkGz54s4kaXoQjv8+Nsu8JnNy0yt
 bdFQchBBwrYDWriHj7ruXJi1x8mWcVFQ54NRjsMtqjjlrBSSsmbkZRawt57N2OyiOet6
 KDj8gcr9A5tR0Fyog68NR2hqn4mgnD0XnulMvszNAotgLSQ9W4UUlkQ6Eqbtw5j4Rr6g CA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t29b0hq5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:33:15 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CBXECq026886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 11:33:14 GMT
Received: from [10.214.227.50] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 12 Sep
 2023 04:33:08 -0700
Message-ID: <9a623b21-0c57-4674-b419-f5c4b3a12385@quicinc.com>
Date: Tue, 12 Sep 2023 17:03:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: rawnand: qcom: unmap dma address during probe
 failure
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <mani@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_pkondeti@quicinc.com>
References: <20230912101814.7748-1-quic_bibekkum@quicinc.com>
 <20230912122640.1ed25673@xps-13>
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
In-Reply-To: <20230912122640.1ed25673@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z3dipDbPql6FllqJwQVtbiJdbDQkIrqZ
X-Proofpoint-ORIG-GUID: Z3dipDbPql6FllqJwQVtbiJdbDQkIrqZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_09,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_043322_704401_A785510C 
X-CRM114-Status: GOOD (  20.58  )
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

SGkgTWlxdWVsLAoKT24gOS8xMi8yMDIzIDM6NTYgUE0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgQmliZWssCj4gCj4gcXVpY19iaWJla2t1bUBxdWljaW5jLmNvbSB3cm90ZSBvbiBUdWUsIDEy
IFNlcCAyMDIzIDE1OjQ4OjE0ICswNTMwOgo+IAo+IFRpdGxlOiBzL2R1cmluZy91cG9uLz8KPiAK
Pj4gRml4IGFkZHJlc3MgYXJndW1lbnQgb2YgbmFuZCBjb250cm9sbGVyIGN1cnJlbnRseSBiZWlu
Zwo+PiBwYXNzZWQgdG8gZG1hX3VubWFwX3Jlc291cmNlKCkgaW4gcHJvYmUgZXJyb3IgcGF0aC4K
PiAKPiBXaGF0IGFib3V0Ogo+IAoKU3VyZSwgdGhpcyBsb29rcyBtb3JlIGNvbXBhY3QgYW5kIHNp
bXBsZXIuCndpbGwgdXNlIHRoaXMgZm9yIHRoZSB0aXRsZS4KCXYKCj4gCVVubWFwIHRoZSByaWdo
dCByZXNvdXJjZSB1cG9uIHByb2JlIGZhaWx1cmU6IHdlIGN1cnJlbnRseQo+IAlwcm92aWRlIHRo
ZSBwaHlzaWNhbCBhZGRyZXNzIG9mIHRoZSBETUEgcmVnaW9uIHJhdGhlciB0aGFuIHRoZQo+IAlv
dXRwdXQgb2YgZG1hX21hcF9yZXNvdXJjZSgpIHdoaWNoIGlzIG9idmlvdXNseSB3cm9uZy4KPiAK
CV4KV2lsbCBrZWVwIHRoZSByZXN0IGluIGNvbW1pdCBkZXNjcmlwdGlvbi4gVGhhbmtzIGZvciB0
aGlzIHN1Z2dlc3Rpb24KCj4+IFRoaXMgYWRkcmVzcyBhcmd1bWVudCBzaG91bGQgYmUgdGhlIGRt
YSBhZGRyZXNzIHJldHVybmVkIGJ5Cj4+IGRtYV9tYXBfcmVzb3VyY2UoKSBpbnN0ZWFkIG9mIHRo
ZSBwaHlzaWNhbCBhZGRyZXNzIG9mIG5hbmQgY29udHJvbGxlci4KPj4KPj4KPj4gRml4ZXM6IDcz
MzBmYzUwNWFmNCAoIm10ZDogcmF3bmFuZDogcWNvbTogc3RvcCB1c2luZyBwaHlzX3RvX2RtYSgp
IikKPj4gU2lnbmVkLW9mZi1ieTogQmliZWsgS3VtYXIgUGF0cm8gPHF1aWNfYmliZWtrdW1AcXVp
Y2luYy5jb20+Cj4+IC0tLQo+PiB2MzogSW5jb3Jwb3JhdGVkIGNvbW1lbnRzIGZyb20gTWlxdWVs
Cj4+ICAgICAgLSBNb2RpZmllZCB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kIHRpdGxlIGFzIHBlciBz
dWdnZXN0aW9ucy4KPj4KPj4gdjI6IEluY29ycG9yYXRlZCBjb21tZW50cyBmcm9tIFBhdmFuL01h
bmkuCj4+ICAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMwOTExMTMzMDI2LjI5
ODY4LTEtcXVpY19iaWJla2t1bUBxdWljaW5jLmNvbS8KPj4KPj4gdjE6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2FsbC8yMDIzMDkwNzA5Mjg1NC4xMTQwOC0xLXF1aWNfYmliZWtrdW1AcXVpY2lu
Yy5jb20vCj4+Cj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIHwgMiArLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+IGluZGV4IDY0NDk5YzFiMzYwMy4uYjA3OTYwNWM4
NGQzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMKPj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4+IEBAIC0zNDQ0LDcgKzM0
NDQsNyBAQCBzdGF0aWMgaW50IHFjb21fbmFuZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4gICBlcnJfYW9uX2NsazoKPj4gICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG5h
bmRjLT5jb3JlX2Nsayk7Cj4+ICAgZXJyX2NvcmVfY2xrOgo+PiAtCWRtYV91bm1hcF9yZXNvdXJj
ZShkZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSwKPj4gKwlkbWFfdW5tYXBfcmVz
b3VyY2UoZGV2LCBuYW5kYy0+YmFzZV9kbWEsIHJlc291cmNlX3NpemUocmVzKSwKPj4gICAJCQkg
ICBETUFfQklESVJFQ1RJT05BTCwgMCk7Cj4+ICAgCXJldHVybiByZXQ7Cj4+ICAgfQo+PiAtLQo+
PiAyLjE3LjEKPj4KPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzICYgcmVnYXJkcywK
QmliZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
