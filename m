Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8C2C6FA99
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:CC:To:From:References:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5lndzTgOESl0PQT12DWKEazki2NPJRKBD0rwjDYdZ0=; b=kNip3Vyg3Rx/rB
	nNQZ0A5054jQQZhBFDbYepQemqQYYijNCXw3/rSNl25gC2QDtIl/6QU7la6D4vk2zzxFTr5jUN04Q
	67yI1+8E6J/+D+10px6LM4x23aKIihk0n3tZOGlRebfe4OFfr8Ble7aP59mACu//1xalSQkm1k4j2
	vkA4XqOX3Ur+Nj8MZjLWGZWwZIIOAFyYOemu9p5y23qtn3o2UClQw9HViO2mntnGwj76He2owyfpl
	r4v51T2A6fLrjvIsPuQXX9SiRCJRUSjKaSnCLgMoVKs5ZsdmjHcMGYIFt2zIMSNOWBiZxMg2ByJe8
	6g9+8gZnzeCEjc/FImuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC5N-00DO23-HZ; Mon, 06 Mar 2023 14:45:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBdh-00D9RI-VO
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 14:16:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326AsGfm024550;
	Mon, 6 Mar 2023 14:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : references : from : to : cc : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ToGOgT1zYJnZw1YqBW9tkP8brT1FsDbw6RekuRK/JlA=;
 b=GQn1yc4oHMS4WDOT/QW57+U6EoDV+0OcwO3eRONGphhyee/RPulRqVfBfs0/Bij/oQ3g
 pV+BltVwyklC7NIsx4hg340Vd5kKFEL7Eivnd//2nAiYZtQCpGJt9uPnEFTdCORrvdTq
 9gAWjsRnLh1o9u3v3Y8tTWExRtiHNMOHcSy4irls8ucEmwZNtzJcwbraPGT6jc99oX2l
 gKpsOfmqr3fGVEvTtbdlYzdlCGngw8fRixePywhfSij8qcXv/qLRPyjEHkikfRQv+sE3
 gMBCNg9ij7mgypF0fFUhJ3xhU0+Am6uRE/ORNUZsAEn8uLAsEVUef5z975XkIyqeHNar tA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p41874ynf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 14:16:07 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326EG62m014582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Mar 2023 14:16:06 GMT
Received: from [10.201.3.104] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 6 Mar 2023
 06:16:01 -0800
Message-ID: <b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
Date: Mon, 6 Mar 2023 19:45:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Content-Language: en-US
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
 <20201029100751.713e27df@collabora.com>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <robh+dt@kernel.org>, <vigneshr@ti.com>, <richard@nod.at>,
        <miquel.raynal@bootlin.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <quic_srichara@quicinc.com>,
        <qpic_varada@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_mdalam@quicinc.com>
In-Reply-To: <20201029100751.713e27df@collabora.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TUkWDrT8DUHnG65Bz7VizolOBn1HMx_O
X-Proofpoint-ORIG-GUID: TUkWDrT8DUHnG65Bz7VizolOBn1HMx_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_07,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_061634_121732_FE007BBA 
X-CRM114-Status: GOOD (  20.08  )
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

Ck9uIDEwLzI5LzIwMjAgMjozNyBQTSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOgo+IEhlbGxvLAo+
Cj4gT24gU2F0LCAxMCBPY3QgMjAyMCAxMTowMTozOSArMDUzMAo+IE1kIFNhZHJlIEFsYW0gPG1k
YWxhbUBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4KPj4gVGhpcyBjaGFuZ2Ugd2lsbCBhZGQgaW5p
dGlhbCBzdXBwb3J0IGZvciBxc3BpIChzZXJpYWwgbmFuZCkuCj4+Cj4+IFFQSUMgVmVyc2lvbiB2
LjIuMCBvbndhcmRzIHN1cHBvcnRzIHNlcmlhbCBuYW5kIGFzIHdlbGwgc28gdGhpcwo+PiBjaGFu
Z2Ugd2lsbCBpbml0aWFsaXplIGFsbCByZXF1aXJlZCByZWdpc3RlciB0byBlbmFibGUgcXNwaSAo
c2VyaWFsCj4+IG5hbmQpLgo+Pgo+PiBUaGlzIGNoYW5nZSBpcyBzdXBwb3J0aW5nIHZlcnkgYmFz
aWMgZnVuY3Rpb25hbGl0eSBvZiBxc3BpIG5hbmQgZmxhc2guCj4+Cj4+IDEuIFJlc2V0IGRldmlj
ZSAoUmVzZXQgUVNQSSBOQU5EIGRldmljZSkuCj4+Cj4+IDIuIERldmljZSBkZXRlY3Rpb24gKFJl
YWQgaWQgUVNQSSBOQU5EIGRldmljZSkuCj4gVW5mb3J0dW5hdGVseSwgdGhhdCdzIG5vdCBnb2lu
ZyB0byB3b3JrIGluIHRoZSBsb25nIHRlcm0uIFlvdSdyZQo+IGJhc2ljYWxseSBoYWNraW5nIHRo
ZSByYXcgTkFORCBmcmFtZXdvcmsgdG8gbWFrZSBTUEkgTkFORHMgZml0LiBJIGRvCj4gdW5kZXJz
dGFuZCB0aGUgcmF0aW9uYWxlIGJlaGluZCB0aGlzIGRlY2lzaW9uIChyZS11c2luZyB0aGUgY29k
ZSBmb3IKPiBFQ0MgYW5kIHByb2JhYmx5IG90aGVyIHRoaW5ncyksIGJ1dCB0aGF0J3Mgbm90IGdv
aW5nIHRvIHdvcmsuIFNvIEknZAo+IHJlY29tbWVuZCBkb2luZyB0aGUgZm9sbG93aW5nIGluc3Rl
YWQ6Cj4KPiAxLyBpbXBsZW1lbnQgYSBTUEktbWVtIGNvbnRyb2xsZXIgZHJpdmVyCj4gMi8gaW1w
bGVtZW50IGFuIEVDQyBlbmdpbmUgZHJpdmVyIHNvIHRoZSBFQ0MgbG9naWMgY2FuIGJlIHNoYXJl
ZAo+ICAgICBiZXR3ZWVuIHRoZSBTUEkgY29udHJvbGxlciBhbmQgcmF3IE5BTkQgY29udHJvbGxl
ciBkcml2ZXJzCj4gMy8gY29udmVydCB0aGUgcmF3IE5BTkQgZHJpdmVyIHRvIHRoZSBleGVjX29w
KCkgaW50ZXJmYWNlIChub25lIG9mCj4gICAgIHRoaXMgaGFjayB3b3VsZCBoYXZlIGJlZW4gcG9z
c2libGUgaWYgdGhlIGRyaXZlciB3YXMgdXNpbmcgdGhlIG5ldwo+ICAgICBBUEkpCj4KPiBSZWdh
cmRzLAo+Cj4gQm9yaXMKPgogwqDCoCBTb3JyeSBmb3IgbGF0ZSByZXBseSwgYWdhaW4gc3RhcnRl
ZCB3b3JraW5nIG9uIHRoaXMgZmVhdHVyZSAKc3VwcG9ydC7CoCBUaGUgUVBJQyB2MiBvbiB3YXJk
cyB0aGVyZSBpcyBzZXJpYWwgbmFuZCBzdXBwb3J0IGdvdCBhZGRlZCAsIAppdHMgbm90IGEgc3Rh
bmRhcmQgU1BJIGNvbnRyb2xsZXIKCiDCoMKgIGl0cyBRUElDIGNvbnRyb2xsZXIgaGF2aW5nIHN1
cHBvcnQgZm9yIHNlcmlhbCBuYW5kLiBBbGwgU1BJIHJlbGF0ZWQgCmNvbmZpZ3VyYXRpb24gZG9u
ZSBieSBRUElDIGhhcmR3YXJlIGFuZCBpdHMgbm90IGV4cG9zZWQgYXMgU1BJIGJ1cyB0byAKdGhl
IGV4dGVybmFsIHdvcmxkLiBPbmx5IGJhc2VkIG9uCgogwqDCoCBRUElDX1NQSV9DRkcgPSAxLCBz
ZXJpYWwgZnVuY3Rpb25hbGl0eSB3aWxsIGdldCBzZWxlY3RlZC4gU28gdGhhdCBubyAKbmVlZCB0
byBpbXBsZW1lbnQgYXMgU1BJLW1lbSBjb250cm9sbGVyIGRyaXZlciwgc2luY2UgaXRzIG5vdCBh
IFNQSSAKY29udHJvbGxlci4KCiDCoCBQbGVhc2UgY2hlY2sgdGhlIGJlbG93IGRpYWdyYW0gZm9y
IHRvcCB2aWV3IG9mIFFQSUMgY29udHJvbGxlci4KCgogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgUVBJQyBXcmFwcGVyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCgogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBBSEIgTWFzdGVyIElGIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoCB8IApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18gfF9fX19fX19fX19fX19fX19fX19fX19fX19fX198wqDCoMKg
wqDCoMKgwqAgfAoKPC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0twqAg
wqDCoCB8IMKgwqDCoCDCoMKgwqAgwqDCoMKgIHwgwqDCoMKgIMKgwqDCoCAKIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoMKgIHzCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoMKgIHwgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgUVBJQyBJT19NQUNSTyDCoMKgwqAgCiDCoMKgwqAgwqDC
oCB8IMKgIMKgwqDCoMKgIHwKCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCB8IMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgIHwgwqDCoMKgIAogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgUVBJQyDCoMKgwqAgwqDCoMKgIMKgIHwgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqAgfMKgIMKgwqDCoCDCoMKgwqAgwqDCoCAKKGNvbnRyb2wgdGhlIFNQSSBCVVMgwqDCoMKgIMKg
wqDCoCB8wqAgwqDCoMKgIMKgIHwgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tPsKgIFNlcmlhbCBOQU5EIElPcwoKIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHwgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDCoMKgIHwgwqDCoMKgIAogwqDCoMKgIMKgwqAg
UVBJQ19TUElfQ0ZHID0gMSDCoMKgwqAgwqAgLS0tLS0tLS0tLS0tLS0tPiDCoCDCoCB8IMKgwqDC
oCDCoMKgwqDCoCB8IMKgwqDCoCDCoMKgwqAgCiDCoMKgwqAgwqDCoCBpbnRlcm5hbGx5KSDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgIHwgwqDCoMKgIMKgwqDC
oCB8wqAgCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
PgoKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqDCoMKgwqDCoCB8wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDC
oCB8IMKgwqDCoCAKIMKgwqDCoCDCoMKgwqDCoMKgwqAgfMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
wqAgfCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgfMKg
IMKgwqDCoMKgwqDCoCB8CgogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoMKgwqDCoMKgIHwgfCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
fMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgwqAgCnxfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X3wgwqDCoMKgwqAgfAoKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqDCoMKgwqDCoCB8wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqDCoCB8IMKgwqDCoCAKIMKgwqDCoCDCoMKgwqDCoMKgwqAgfCB8IHwKCiDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgwqDCoMKg
wqAgfCDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCB8IMKgwqDC
oCAKIMKgwqDCoCDCoMKgwqAgfCDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoCB8wqAgX19fX19fX19f
X19fX19fX19fX19fX19fX19fX198IMKgwqDCoCB8CgogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoMKgwqDCoMKgIHwgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgfCDCoMKgwqAgCiDCoMKgwqAgwqDCoMKgwqAg
fCDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCB8IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDC
oMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgfMKgIMKgwqDCoCDCoCB8IAogwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCDCoMKgwqAgfCB8
IMKgwqDCoCDCoMKgwqAgwqDCoMKgwqDCoMKgwqDCoCAKfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCBFYmkyX2V4dF9pZiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqDCoCDCoCB8CgogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgfCB8IHwgfCB8wqDCoMKgwqDCoMKgwqDC
oCB8CgogwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoMKgwqDCoCB8IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqAgfCDCoMKgIAogwqDCoMKgIMKgwqDCoMKgIFFQSUNfU1BJX0NGRyA9IDDCoCAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tPiB8IMKgwqDCoCDCoMKgwqAgwqAgfCDCoMKgwqAgwqAgCiDCoCDCoCDCoCB8
IHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tPiBQYXJh
bGxlbCAKTkFORCBJT3MKCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgwqDCoMKgIHwgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoCB8IMKgwqDCoCAKIMKgwqDCoCDCoMKgwqAgwqDCoMKgIHwgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqAgfCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqDCoMKgwqAgfCAKfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLT4KCjwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0gCnxfX19fX19fX19fX19ffF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X198X19fX19fX3xfX19fX19fX19fX19fX19fX19fX19fX19fX19fX198X19fX3wKCiDCoMKgwqAg
wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgIEFIQiBTbGF2ZSBJRgoKCiDC
oCBSZWdhcmRzLAoKQWxhbS4KCgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
