Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FC3C4453A
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 02:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhYn+w7DULVssg0DJosCBwUt0oBEwSCwYW1CSzbEd8A=; b=kaK13dfygCSn1dmIn4oY/8n18v
	XseAv4h9PwpNTWtVl9AWkuBN0uyaSEnAXE0TtTuGzFc3UNtTvOd84DH+03oqOSt6Q1GnandgAEzYt
	1AuaZrmPZClIB0wr74gr/7Afq0+7AwI7zvHKMzOcTNFD4335N5ThpOtyVai2VDOHY3KAnnh8ev49o
	FCxrVz+Jv0dt0UA5ETWPgsF6d9GBSB+xFSOFUF1TfLLkRLlsrqSCiSZfwNUqLWaonsOR2gAamLj0L
	BnIEyD+sxo/tlJwc3KWMbc9FPcO66Hdz2CDKp0uMQWsaWeXDO2GhWp4vLfF9Ui3toqoos4/uy8QNq
	AKkodi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjMf-0000000DFPX-0GX6;
	Thu, 23 Jul 2026 02:40:49 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmjMb-0000000DFNH-18QZ
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 02:40:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9M7yYSN0bYnlZIH0mun3H5de7bnSDCfsTagPaRh3GQ4=;
	b=4cYtb9/qH8x94qteEZLx+iXyytW8VklXKQUzFwqSyC2QxvBYTq16xTKy+lk6S+a2pLz4quFhg
	kapR3BjUAWYZMjSUyYUIBTlVyuTf3F1gU+N5Yd0KGbfWnFZzm0fuPRUoZLoWmeWSJD4YMyCy6cb
	Zrmx5Yqu1AMms74Up8hUsz8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h5FVR2PqrzRhVH;
	Thu, 23 Jul 2026 10:31:11 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 379F72025F;
	Thu, 23 Jul 2026 10:40:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Jul 2026 10:40:31 +0800
Subject: Re: [PATCH 1/2] UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
To: Ran Hongyun <ranhongyun1@huawei.com>, <richard@nod.at>,
	<miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <vapier@gentoo.org>,
	<artem.bityutskiy@linux.intel.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<yangerkun@huawei.com>, <yi.zhang@huawei.com>
References: <20260723020233.3079997-1-ranhongyun1@huawei.com>
 <20260723020233.3079997-2-ranhongyun1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <bdf4872f-cd25-252e-25ab-f34366909f33@huawei.com>
Date: Thu, 23 Jul 2026 10:40:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260723020233.3079997-2-ranhongyun1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_194045_939258_6D684C40 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNi83LzIzIDEwOjAyLCBSYW4gSG9uZ3l1biDQtLXAOgo+IEZpeCB0d28gaXNzdWVzIGlu
dHJvZHVjZWQgYmVmb3JlOgo+IAo+ICAgLSBUaGUgcGFyYW1ldGVyIGZvcm1hdCBzdHJpbmcgd2Fz
IG1pc3NpbmcgdGhlIGVuYWJsZV9mbSBhbmQKPiAgICAgIG5lZWRfcmVzdl9wb29sIHRva2VucyBp
bnRyb2R1Y2VkIGluIGFuIGVhcmxpZXIgY29tbWl0Lgo+IAo+ICAgLSBUaGUgYmFkLWJsb2NrIHJl
c2VydmF0aW9uIG5vdGUgd2FzIG1pc3BsYWNlZCBhZnRlciBFeGFtcGxlIDUKPiAgICAgIGluc3Rl
YWQgb2YgYWZ0ZXIgRXhhbXBsZSAzLiBJdCB3YXMgbWlzcGxhY2VkIGR1ZSB0byBhbiBlYXJsaWVy
IHBhdGNoLgo+IAo+IEZpeGVzOiA4M2ZmNTlhMDY2NjMgKCJVQkk6IHN1cHBvcnQgdWJpX251bSBv
biBtdGQudWJpIGNvbW1hbmQgbGluZSIpCj4gU2lnbmVkLW9mZi1ieTogUmFuIEhvbmd5dW4gPHJh
bmhvbmd5dW4xQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL210ZC91YmkvYnVpbGQuYyB8
IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5j
b20+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQv
dWJpL2J1aWxkLmMKPiBpbmRleCA2NzRhZDg3ODA5ZGYuLjhlNWYxNzgxNjhjYiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3ViaS9idWls
ZC5jCj4gQEAgLTE1NzQsNyArMTU3NCw3IEBAIHN0YXRpYyBpbnQgdWJpX210ZF9wYXJhbV9wYXJz
ZShjb25zdCBjaGFyICp2YWwsIGNvbnN0IHN0cnVjdCBrZXJuZWxfcGFyYW0gKmtwKQo+ICAgfQo+
ICAgCj4gICBtb2R1bGVfcGFyYW1fY2FsbChtdGQsIHViaV9tdGRfcGFyYW1fcGFyc2UsIE5VTEws
IE5VTEwsIDA0MDApOwo+IC1NT0RVTEVfUEFSTV9ERVNDKG10ZCwgIk1URCBkZXZpY2VzIHRvIGF0
dGFjaC4gUGFyYW1ldGVyIGZvcm1hdDogbXRkPTxuYW1lfG51bXxwYXRoPlssPHZpZF9oZHJfb2Zm
cz5bLG1heF9iZWJfcGVyMTAyNFssdWJpX251bV1dXS5cbiIKPiArTU9EVUxFX1BBUk1fREVTQyht
dGQsICJNVEQgZGV2aWNlcyB0byBhdHRhY2guIFBhcmFtZXRlciBmb3JtYXQ6IG10ZD08bmFtZXxu
dW18cGF0aD5bLDx2aWRfaGRyX29mZnM+WyxtYXhfYmViX3BlcjEwMjRbLHViaV9udW1bLGVuYWJs
ZV9mbVssbmVlZF9yZXN2X3Bvb2xdXV1dXS5cbiIKPiAgIAkJICAgICAgIk11bHRpcGxlIFwibXRk
XCIgcGFyYW1ldGVycyBtYXkgYmUgc3BlY2lmaWVkLlxuIgo+ICAgCQkgICAgICAiTVREIGRldmlj
ZXMgbWF5IGJlIHNwZWNpZmllZCBieSB0aGVpciBudW1iZXIsIG5hbWUsIG9yIHBhdGggdG8gdGhl
IE1URCBjaGFyYWN0ZXIgZGV2aWNlIG5vZGUuXG4iCj4gICAJCSAgICAgICJPcHRpb25hbCBcInZp
ZF9oZHJfb2Zmc1wiIHBhcmFtZXRlciBzcGVjaWZpZXMgVUJJIFZJRCBoZWFkZXIgcG9zaXRpb24g
dG8gYmUgdXNlZCBieSBVQkkuIChkZWZhdWx0IHZhbHVlIGlmIDApXG4iCj4gQEAgLTE1ODcsOSAr
MTU4Nyw5IEBAIE1PRFVMRV9QQVJNX0RFU0MobXRkLCAiTVREIGRldmljZXMgdG8gYXR0YWNoLiBQ
YXJhbWV0ZXIgZm9ybWF0OiBtdGQ9PG5hbWV8bnVtfHBhCj4gICAJCSAgICAgICJFeGFtcGxlIDE6
IG10ZD0vZGV2L210ZDAgLSBhdHRhY2ggTVREIGRldmljZSAvZGV2L210ZDAuXG4iCj4gICAJCSAg
ICAgICJFeGFtcGxlIDI6IG10ZD1jb250ZW50LDE5ODQgbXRkPTQgLSBhdHRhY2ggTVREIGRldmlj
ZSB3aXRoIG5hbWUgXCJjb250ZW50XCIgdXNpbmcgVklEIGhlYWRlciBvZmZzZXQgMTk4NCwgYW5k
IE1URCBkZXZpY2UgbnVtYmVyIDQgd2l0aCBkZWZhdWx0IFZJRCBoZWFkZXIgb2Zmc2V0LlxuIgo+
ICAgCQkgICAgICAiRXhhbXBsZSAzOiBtdGQ9L2Rldi9tdGQxLDAsMjUgLSBhdHRhY2ggTVREIGRl
dmljZSAvZGV2L210ZDEgdXNpbmcgZGVmYXVsdCBWSUQgaGVhZGVyIG9mZnNldCBhbmQgcmVzZXJ2
ZSAyNSpuYW5kX3NpemVfaW5fYmxvY2tzLzEwMjQgZXJhc2UgYmxvY2tzIGZvciBiYWQgYmxvY2sg
aGFuZGxpbmcuXG4iCj4gKwkJICAgICAgIlx0KGUuZy4gaWYgdGhlIE5BTkQgKmNoaXBzZXQqIGhh
cyA0MDk2IFBFQiwgMTAwIHdpbGwgYmUgcmVzZXJ2ZWQgZm9yIHRoaXMgVUJJIGRldmljZSkuXG4i
Cj4gICAJCSAgICAgICJFeGFtcGxlIDQ6IG10ZD0vZGV2L210ZDEsMCwwLDUgLSBhdHRhY2ggTVRE
IGRldmljZSAvZGV2L210ZDEgdG8gVUJJIDUgYW5kIHVzaW5nIGRlZmF1bHQgdmFsdWVzIGZvciB0
aGUgb3RoZXIgZmllbGRzLlxuIgo+IC0JCSAgICAgICJleGFtcGxlIDU6IG10ZD0xLDAsMCw1IG10
ZD0yLDAsMCw2LDEgLSBhdHRhY2ggTVREIGRldmljZSAvZGV2L210ZDEgdG8gVUJJIDUgYW5kIGRp
c2FibGUgZmFzdG1hcDsgYXR0YWNoIE1URCBkZXZpY2UgL2Rldi9tdGQyIHRvIFVCSSA2IGFuZCBl
bmFibGUgZmFzdG1hcC4ob25seSB3b3JrcyB3aGVuIGZhc3RtYXAgaXMgZW5hYmxlZCBhbmQgZm1f
YXV0b2NvbnZlcnQ9WSkuXG4iCj4gLQkJICAgICAgIlx0KGUuZy4gaWYgdGhlIE5BTkQgKmNoaXBz
ZXQqIGhhcyA0MDk2IFBFQiwgMTAwIHdpbGwgYmUgcmVzZXJ2ZWQgZm9yIHRoaXMgVUJJIGRldmlj
ZSkuIik7Cj4gKwkJICAgICAgImV4YW1wbGUgNTogbXRkPTEsMCwwLDUgbXRkPTIsMCwwLDYsMSAt
IGF0dGFjaCBNVEQgZGV2aWNlIC9kZXYvbXRkMSB0byBVQkkgNSBhbmQgZGlzYWJsZSBmYXN0bWFw
OyBhdHRhY2ggTVREIGRldmljZSAvZGV2L210ZDIgdG8gVUJJIDYgYW5kIGVuYWJsZSBmYXN0bWFw
Lihvbmx5IHdvcmtzIHdoZW4gZmFzdG1hcCBpcyBlbmFibGVkIGFuZCBmbV9hdXRvY29udmVydD1Z
KS5cbiIpOwo+ICAgI2lmZGVmIENPTkZJR19NVERfVUJJX0ZBU1RNQVAKPiAgIG1vZHVsZV9wYXJh
bShmbV9hdXRvY29udmVydCwgYm9vbCwgMDY0NCk7Cj4gICBNT0RVTEVfUEFSTV9ERVNDKGZtX2F1
dG9jb252ZXJ0LCAiU2V0IHRoaXMgcGFyYW1ldGVyIHRvIGVuYWJsZSBmYXN0bWFwIGF1dG9tYXRp
Y2FsbHkgb24gaW1hZ2VzIHdpdGhvdXQgYSBmYXN0bWFwLiIpOwo+IAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
