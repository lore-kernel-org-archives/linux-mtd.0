Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC55C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 11:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0KnlJOBFHfgW4aBU8oHAC0WPo36oBDWc/9FeH0CIIZQ=; b=IINWhHlzq+RfWW
	8pgDGtjpkColu8BDwoCxopiwRoxlFZhaz9CvcPLWdav2k6Kp5o4ur/7bZOfD0Jlyw8x4rM1YeMXtU
	wLQm4ncD/HgHxSjaHXcesx3hZ/tI9dH/88Q04bLeA84v/SokmPjtdZEHxMw6+bryrIFVOf6mIBe7h
	Oglnd5kj9P/0T+VGcx7Ht40zwuH9kHEGPd7bHM8VRFbIhYVK12DVzwwSI9onLo7tWAiENbb+jurYo
	CA9GKVKLn2fV0Wzkl435fwcojeCDbuvwX6YDZRluIcPXTmfyY0weHt3K/z8CdT08yvTZwiVjxWvwo
	rdkaJhnLI19rWMq5oRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7MO-00E6uV-0J;
	Tue, 28 Mar 2023 11:19:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7ML-00E6tO-28
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 11:19:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SAEY3o009515;
	Tue, 28 Mar 2023 11:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=97c3pXB/WN3ouuJ1a2KcLrV4gwtPErUklI/JNZ8pz2c=;
 b=it1ezcQWJeeyHKD8Dg56dn2bhaW58+RgXIsWT52dX6xIvXejYW36HhX6GZT0iSSuG3hh
 tuXjn7jdI/OonZqjCVxXEr+uqeF0RctRz6NT6YFuDt2x/PbMVPJ3q8iXBganxyfFBLSE
 jQChM8gLI0NBGHhZB7TbT0OfpDmSPsXW9OKvzRwoZ8sxVGBeKiK6UPug+WQJBLOyYvVz
 WfFoEjJvk6YQoDIJ3lrrRmeQcSQFyfxJYMF5k2XKFbzFPU2yiWi+Q4wrlxGyPnbLYq6A
 vcVkiwjVqz3Xi0igqN7SuPiuYbeI8Myr1BSs60VBhypQ4HQIfpmca2/Dag3C55za46Dw ww== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pkk7b9gw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:19:08 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32SBJ8TQ031123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 11:19:08 GMT
Received: from [10.216.62.255] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 28 Mar
 2023 04:19:02 -0700
Message-ID: <80ab07f8-fd7b-da08-f92e-20b76f5cefea@quicinc.com>
Date: Tue, 28 Mar 2023 16:48:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <boris.brezillon@collabora.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <robh+dt@kernel.org>, <vigneshr@ti.com>, <richard@nod.at>,
        <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <quic_srichara@quicinc.com>, <qpic_varada@quicinc.com>,
        <quic_sjaganat@quicinc.com>, Mark Brown <broonie@kernel.org>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
 <1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
 <20201029100751.713e27df@collabora.com>
 <b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
 <20230306153851.0dcdda27@xps-13>
 <745e6bd6-96a5-ceab-1f0c-31440d34e4c8@quicinc.com>
 <20230327164949.465750a0@xps-13>
From: Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20230327164949.465750a0@xps-13>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8tIg0m9ltrXYXbPzZheTvTd1MACtDxXu
X-Proofpoint-GUID: 8tIg0m9ltrXYXbPzZheTvTd1MACtDxXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 malwarescore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303280093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_041925_725490_56A8DA30 
X-CRM114-Status: GOOD (  28.01  )
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

CgpPbiAzLzI3LzIwMjMgODoxOSBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAK
PiArIE1hcmsKPiAKPiBxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBNb24sIDI3IE1h
ciAyMDIzIDE5OjI0OjAyICswNTMwOgo+IAo+PiBPbiAzLzYvMjAyMyA4OjA4IFBNLCBNaXF1ZWwg
UmF5bmFsIHdyb3RlOgo+Pj4gSGVsbG8sCj4+Pgo+Pj4gcXVpY19tZGFsYW1AcXVpY2luYy5jb20g
d3JvdGUgb24gTW9uLCA2IE1hciAyMDIzIDE5OjQ1OjU4ICswNTMwOgo+Pj4gICAgCj4+Pj4gT24g
MTAvMjkvMjAyMCAyOjM3IFBNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4+Pj4+IEhlbGxvLAo+
Pj4+Pgo+Pj4+PiBPbiBTYXQsIDEwIE9jdCAyMDIwIDExOjAxOjM5ICswNTMwCj4+Pj4+IE1kIFNh
ZHJlIEFsYW0gPG1kYWxhbUBjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cj4+Pj4+ICAgID4+Pj4gVGhp
cyBjaGFuZ2Ugd2lsbCBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvciBxc3BpIChzZXJpYWwgbmFuZCku
Cj4+Pj4+Pgo+Pj4+Pj4gUVBJQyBWZXJzaW9uIHYuMi4wIG9ud2FyZHMgc3VwcG9ydHMgc2VyaWFs
IG5hbmQgYXMgd2VsbCBzbyB0aGlzCj4+Pj4+PiBjaGFuZ2Ugd2lsbCBpbml0aWFsaXplIGFsbCBy
ZXF1aXJlZCByZWdpc3RlciB0byBlbmFibGUgcXNwaSAoc2VyaWFsCj4+Pj4+PiBuYW5kKS4KPj4+
Pj4+Cj4+Pj4+PiBUaGlzIGNoYW5nZSBpcyBzdXBwb3J0aW5nIHZlcnkgYmFzaWMgZnVuY3Rpb25h
bGl0eSBvZiBxc3BpIG5hbmQgZmxhc2guCj4+Pj4+Pgo+Pj4+Pj4gMS4gUmVzZXQgZGV2aWNlIChS
ZXNldCBRU1BJIE5BTkQgZGV2aWNlKS4KPj4+Pj4+Cj4+Pj4+PiAyLiBEZXZpY2UgZGV0ZWN0aW9u
IChSZWFkIGlkIFFTUEkgTkFORCBkZXZpY2UpLgo+Pj4+PiBVbmZvcnR1bmF0ZWx5LCB0aGF0J3Mg
bm90IGdvaW5nIHRvIHdvcmsgaW4gdGhlIGxvbmcgdGVybS4gWW91J3JlCj4+Pj4+IGJhc2ljYWxs
eSBoYWNraW5nIHRoZSByYXcgTkFORCBmcmFtZXdvcmsgdG8gbWFrZSBTUEkgTkFORHMgZml0LiBJ
IGRvCj4+Pj4+IHVuZGVyc3RhbmQgdGhlIHJhdGlvbmFsZSBiZWhpbmQgdGhpcyBkZWNpc2lvbiAo
cmUtdXNpbmcgdGhlIGNvZGUgZm9yCj4+Pj4+IEVDQyBhbmQgcHJvYmFibHkgb3RoZXIgdGhpbmdz
KSwgYnV0IHRoYXQncyBub3QgZ29pbmcgdG8gd29yay4gU28gSSdkCj4+Pj4+IHJlY29tbWVuZCBk
b2luZyB0aGUgZm9sbG93aW5nIGluc3RlYWQ6Cj4+Pj4+Cj4+Pj4+IDEvIGltcGxlbWVudCBhIFNQ
SS1tZW0gY29udHJvbGxlciBkcml2ZXIKPj4+Pj4gMi8gaW1wbGVtZW50IGFuIEVDQyBlbmdpbmUg
ZHJpdmVyIHNvIHRoZSBFQ0MgbG9naWMgY2FuIGJlIHNoYXJlZAo+Pj4+PiAgICAgICBiZXR3ZWVu
IHRoZSBTUEkgY29udHJvbGxlciBhbmQgcmF3IE5BTkQgY29udHJvbGxlciBkcml2ZXJzCj4+Pj4+
IDMvIGNvbnZlcnQgdGhlIHJhdyBOQU5EIGRyaXZlciB0byB0aGUgZXhlY19vcCgpIGludGVyZmFj
ZSAobm9uZSBvZgo+Pj4+PiAgICAgICB0aGlzIGhhY2sgd291bGQgaGF2ZSBiZWVuIHBvc3NpYmxl
IGlmIHRoZSBkcml2ZXIgd2FzIHVzaW5nIHRoZSBuZXcKPj4+Pj4gICAgICAgQVBJKQo+Pj4+Pgo+
Pj4+PiBSZWdhcmRzLAo+Pj4+Pgo+Pj4+PiBCb3Jpcwo+Pj4+PiAgICA+PiAgIMKgwqAgU29ycnkg
Zm9yIGxhdGUgcmVwbHksIGFnYWluIHN0YXJ0ZWQgd29ya2luZyBvbiB0aGlzIGZlYXR1cmUgc3Vw
cG9ydC7CoCBUaGUgUVBJQyB2MiBvbiB3YXJkcyB0aGVyZSBpcyBzZXJpYWwgbmFuZCBzdXBwb3J0
IGdvdCBhZGRlZCAsIGl0cyBub3QgYSBzdGFuZGFyZCBTUEkgY29udHJvbGxlcgo+Pj4+Cj4+Pj4g
ICAgwqDCoCBpdHMgUVBJQyBjb250cm9sbGVyIGhhdmluZyBzdXBwb3J0IGZvciBzZXJpYWwgbmFu
ZC4gQWxsIFNQSSByZWxhdGVkIGNvbmZpZ3VyYXRpb24gZG9uZSBieSBRUElDIGhhcmR3YXJlIGFu
ZCBpdHMgbm90IGV4cG9zZWQgYXMgU1BJIGJ1cyB0byB0aGUgZXh0ZXJuYWwgd29ybGQuIE9ubHkg
YmFzZWQgb24KPj4+Pgo+Pj4+ICAgIMKgwqAgUVBJQ19TUElfQ0ZHID0gMSwgc2VyaWFsIGZ1bmN0
aW9uYWxpdHkgd2lsbCBnZXQgc2VsZWN0ZWQuIFNvIHRoYXQgbm8gbmVlZCB0byBpbXBsZW1lbnQg
YXMgU1BJLW1lbSBjb250cm9sbGVyIGRyaXZlciwgc2luY2UgaXRzIG5vdCBhIFNQSSBjb250cm9s
bGVyLgo+Pj4+Cj4+Pj4gICAgwqAgUGxlYXNlIGNoZWNrIHRoZSBiZWxvdyBkaWFncmFtIGZvciB0
b3AgdmlldyBvZiBRUElDIGNvbnRyb2xsZXIuCj4+Pgo+Pj4gT25lIG9mIHRoZSBoYXJkIHRoaW5n
cyBpbiB0aGUgTGludXgga2VybmVsIGlzIHRvIG1ha2UgZGV2aWNlcyBmaXQKPj4+IGZyYW1ld29y
a3MuIFRoaXMgZmVhdHVyZSBkb2VzIG5vdCBmaXQgdGhlIHJhdyBOQU5EIGZyYW1ld29yay4gSXQg
ZG9lcwo+Pj4gbm90IGZvbGxvdyBhbnkgb2YgdGhlIGNvbnZlbnRpb25zIHRha2VuIHRoZXJlLiBJ
dCBpcyBub3QgZ29ubmEgYmUKPj4+IGFjY2VwdGVkIHRoZXJlLiBZb3UgbmVlZCB0byBleHBvc2Ug
c3BpLW1lbSBmdW5jdGlvbmFsaXRpZXMsIGV2ZW4gaWYgdGhlCj4+PiBzcGktcHJvcGVyIGZlYXR1
cmVzIGFyZSBub3QgYXZhaWxhYmxlLiBJIGJlbGlldmUgeW91ciBzaXR1YXRpb24gc3RpbGwKPj4+
IGZpdHMgdGhlIHNwaS1tZW0gYWJzdHJhY3Rpb24uCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gTWlxdcOo
bAo+Pgo+Pgo+PiBJIGhhdmUgc3RhcnRlZCB3cml0aW5nIHRoZSBkcml2ZXIgY29kZSBmb3IgU1BJ
IE5BTkQuIFBsZWFzZSBjaGVjayB0aGUgYmVsb3cgZGVzaWduLAo+PiBpcyB0aGlzIGZpbmUgYXMg
cGVyIEJvcmlzIHN1Z2dlc3Rpb24uCj4gCj4gVGhhbmtzLgo+IAo+IAo+PiAgICAgICAgICAgICB8
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfCAgICAgICAgICAgICAgICAgICAgICB8LS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tfCAgICAgICAgICAgICAgICAgICAgICAgIHwtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18Cj4+ICAgICAgICAgICAgIHxxY29tIHNwaSBuYW5kIGRy
aXZlciAgICB8LS0tLS0tLS0tLS0tLS0tLS0tLS0tPnxjb21tb24gRUNDIGVuZ2luZSBkcml2ZXIg
ICAgICB8PC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfHFjb20gcmF3IG5hbmQgZHJpdmVyICAgICAg
ICAgICAgIHwKPj4gICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfAo+PiAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICB8
ZHJpdmVycy9tdGQvbmFuZC9lY2MtcWNvbS5jICAgfCAgICAgICAgICAgICAgICAgICAgICAgIHxk
cml2ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmQuYyB8Cj4+ICAgICAgICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwKPj4gICAgICAgICAgICAgfGRyaXZlcnMvc3BpL3NwaS1xcGljLmMg
IHwgICAgICAgICAgICAgICAgICAgICAgfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fAo+PiAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICB8Y29tbW9uIEFQSSBmaWxlOiAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4+ICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHxjb21tb24g
QVBJOiByZXNldCwgcmVhZCBpZCwgICB8ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwKPj4gICAgICAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgIHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0+fGVyYXNlLCByZWFkIHBhZ2UsIHdyaXRl
IHBhZ2UsIHw8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfAo+PiAgICAgICAgICAgICB8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfCAgICAg
ICAgICAgICAgICAgICAgICB8YmFkIGJsb2NrIGNoZWNrIGV0Yy4gICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8Cj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
fC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfGRyaXZlcnMvbXRkL25h
bmQvcmF3L3FwaWNfY29tbXwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICBvbi5jICAgICAgICAgICAgICAgICAgICAgIHwK
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPj4KPj4KPj4gSGVyZSBFQ0Mg
ZW5naW5lIGRyaXZlciBhcyBzZXBhcmF0ZSBmaWxlIHVuZGVyIChkcml2ZXJzL210ZC9uYW5kL2Vj
Yy1xY29tLmMpIGFuZCBhbGwKPj4gY29tbW9uIEFQSXMgbGlrZSByZXNldCwgcmVhZCBpZCwgZXJh
c2UsIHdyaXRlIHBhZ2UsIHJlYWQgcGFnZSwgY2hlY2sgYmxvY2sgYmFkIGV0Yy4KPiAKPiBJJ20g
bm90IHN1cmUgaG93IGdlbmVyaWMgdGhlc2UgQVBJcyBhcmUsIHBsZWFzZSB0cnkgdG8gbm90IHB1
dCBhbnl0aGluZwo+IHJhdyBOQU5EIG9yIFNQSS1OQU5EIHNwZWNpZmljIGluIHRoZSBjb21tb24g
ZmlsZS4gSSBkb24ndCB3YW50IHRvIHNlZQo+ICJpZiAocmF3KSIgb3IgImlmIChzcGkpIiBjb25k
aXRpb25zIHRoZXJlLgoKICBJIGFncmVlICwgSSB3aWxsIG5vdCB0cnkgdG8gcHV0IGFueSBjb25k
aXRpb24gbGlrZSBpZihyYXcpIG9yIGlmKHNwaSkuCgogIEkgYW0gZG9pbmcgaW4gdGhlIGJlbG93
IHNlcXVlbmNlLgoKICAxKSBleGVjLT5vcCgpIGluIHJhdyBuYW5kIGRyaXZlcgoKICAyKSBNb3Zl
IGVjYyByZWxhdGVkIGNvZGUgdG8gbmV3IGVjYyBlbmdpbmUgZHJpdmVyIHVuZGVyIC4vZHJpdmVy
cy9tdGQvbmFuZC9lY2MtcWNvbS5jCiAgICAgYW5kIG1ha2UgcmF3IG5hbmQgZHJpdmVyIHRvIHdv
cmsgd2l0aCB0aGlzIGVjYyBlbmdpbmUgZHJpdmVyLgoKICAzKSBXcml0ZSBzZXBhcmF0ZSBTUEkt
bWVtIGRyaXZlciB1bmRlciAuL2RyaXZlcnMvc3BpL3NwaS1xcGljLmMKCiAgNCkgTW92ZSBjb21t
b24gY29kZSB1bmRlciBxcGljX2NvbW1vbi5jIHVuZGVyIC4vZHJpdmVyL210ZC9uYW5kL3Jhdy9x
cGljX2NvbW1vbi5jCgo+IAo+PiBhcyBzZXBhcmF0ZSBmaWxlIHVuZGVyIGRyaXZlcnMvbXRkL25h
bmQvcmF3L3FwaWNfY29tbW9uLmMuQVBJcyB1bmRlciBFQ0MgZW5naW5lIGRyaXZlcnMKPj4gYW5k
IHFwaWNfY29tbW9uLmMgd2lsbCBiZSBleHBvcnRlZCBhbmQgdXNlZCBieSBzcGktcXBpYy5jIGRy
aXZlciAoU2VyaWFsIE5BTkQpIGFuZCBxY29tX25hbmQuYwo+PiAocmF3IG5hbmQgZHJpdmVyKS4K
PiAKPiBPbiBteSBzaWRlLCBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3BpbmlvbiB5ZXQgYnV0IGl0
IGxvb2tzIGdvb2QgdG8gbWUuCj4gCj4gQ2FuIHlvdSBjb25maXJtIHlvdSBhcmUgY29uc2lkZXJp
bmcgc3dpdGNoaW5nIHRvIHRoZSAtPmV4ZWNfb3AoKSBBUEkgaW4KPiB0aGUgcmF3IE5BTkQgZHJp
dmVyPwoKICAgWWVzLCBmaXJzdCBwcmlvcml0eSBpcyBzd2l0Y2hpbmcgdG8gLT5leGVjX29wKCkg
QVBJIGluIHJhdyBuYW5kIGRyaXZlci4KICAgSSBoYXZlIGFscmVhZHkgc3RhcnRlZCBhbmQgc2Vu
dCBjb3VwbGUgb2YgcGF0Y2hlcywgd2lsbCBhZGRyZXNzIGxhdGVzdCBjb21tZW50CiAgIHNlbmQg
YWdhaW4uCgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
