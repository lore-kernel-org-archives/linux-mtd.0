Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F57F433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2026 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7WqOQz84qQKLYFDzxkjE3YuabVVEFiV/NbygbPtYTc=; b=bGrHC678l2jPr1y4BJrWN/SdLw
	YXDCLU/QR0JeXh1LqYXQew6O55TgtEz0Yc23c0Gvg1auV7IuYSkueuoCgFVtRtwjUQ+BoImQhloAb
	YK2C+dmxXVa1CLon1aohsFTsww69eY5Bsu8DTo9aekUFRai+WJbRRLYzakcGNUyVHg12R15Nx5ENH
	ZzDbwtRgidqm76Rqf2pIquw/Q7i+Bc7Qjt+QtfoowHgOX3QImccAckOoJYiZFcQyV+yaUnC1fEO8Y
	b5Ck7runHmUN/0YBGM0a2UJ4AzYvhudpfbINzp7RQR8d/sKZ0Ot9l7M5AXqQrGnKM3vgUyUOluoax
	5Htfxz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDLt-00000001vPT-3Z4S;
	Thu, 16 Apr 2026 03:25:13 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDDLp-00000001vJr-11RO
	for linux-mtd@lists.infradead.org;
	Thu, 16 Apr 2026 03:25:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6poktiCoAbsAGxEQVdUuhm6EpOJF51D0LdBC7Ts+Orc=;
	b=j3MbQ2nE776lQtGFRBuvhSNrSMDxl6S5NVk0uxiBCbiqq18hA4uomfvgJGUc5+ACwXjgG2MFT
	eDVGIfysdNn8h92jGgfsJoTT8eXVUoiffH76a9pfiC4GKwChiNT348Q2vRvOZVZxdmvI/cSNS9r
	YForbEL3Kdn+xx1y0ZPf5Rg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fx3814FJmzLlYg;
	Thu, 16 Apr 2026 11:16:33 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 9D33F40562;
	Thu, 16 Apr 2026 11:22:51 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemk500005.china.huawei.com (7.202.194.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Apr 2026 11:22:50 +0800
Subject: Re: [PATCH v1] mtd: ubi: fix kref leak on -EBUSY return in
 ubi_detach_mtd_dev()
To: Yuho Choi <dbgh9129@gmail.com>, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260416011128.45754-1-dbgh9129@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <26c9c959-a3b6-e1de-1215-887990a46870@huawei.com>
Date: Thu, 16 Apr 2026 11:22:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20260416011128.45754-1-dbgh9129@gmail.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_202509_769925_DC9A5514 
X-CRM114-Status: GOOD (  16.16  )
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

1NogMjAyNi80LzE2IDk6MTEsIFl1aG8gQ2hvaSDQtLXAOgo+IHViaV9kZXRhY2hfbXRkX2Rldigp
IGNhbGxzIHViaV9nZXRfZGV2aWNlKCkgd2hpY2ggaW5jcmVtZW50cyBib3RoCj4gdWJpLT5yZWZf
Y291bnQgYW5kIHRoZSBkZXZpY2Uga3JlZiB2aWEgZ2V0X2RldmljZSgpLiBXaGVuIHRoZSBkZXZp
Y2UKPiBpcyBidXN5IGFuZCBhbnl3YXk9PTAsIHRoZSBmdW5jdGlvbiByZXR1cm5zIC1FQlVTWSBh
ZnRlciByZWxlYXNpbmcKPiB1YmlfZGV2aWNlc19sb2NrLCBidXQgbmV2ZXIgY2FsbHMgcHV0X2Rl
dmljZSgpIHRvIGRyb3AgdGhlIGtyZWYKPiBhY3F1aXJlZCBieSB1YmlfZ2V0X2RldmljZSgpLiBU
aGlzIGxlYWtzIHRoZSBrcmVmLCBwcmV2ZW50aW5nIHRoZQo+IGRldmljZSBmcm9tIGV2ZXIgYmVp
bmcgZnJlZWQuCj4gCj4gQ29tbWl0IDdlODRjOTYxYjJlYiAoIm10ZDogdWJpOiBpbnRyb2R1Y2Ug
cHJlLXJlbW92YWwgbm90aWZpY2F0aW9uCj4gZm9yIFVCSSB2b2x1bWVzIikgbW92ZWQgcHV0X2Rl
dmljZSgpIHRvIGFmdGVyIHViaS0+aXNfZGVhZCA9IHRydWUKPiB0byBwYWlyIGl0IHdpdGggdGhl
IG5vdGlmeStudWxsaWZ5IHNlcXVlbmNlLCBidXQgaW5hZHZlcnRlbnRseSBsZWZ0Cj4gdGhlIGVh
cmx5IC1FQlVTWSByZXR1cm4gd2l0aG91dCBhIG1hdGNoaW5nIHB1dF9kZXZpY2UoKS4KPiAKPiBB
ZGQgcHV0X2RldmljZSgmdWJpLT5kZXYpIGJlZm9yZSByZXR1cm5pbmcgLUVCVVNZIHRvIGJhbGFu
Y2UgdGhlCj4gZ2V0X2RldmljZSgpIGluc2lkZSB1YmlfZ2V0X2RldmljZSgpLgo+IAo+IEZpeGVz
OiA3ZTg0Yzk2MWIyZWIgKCJtdGQ6IHViaTogaW50cm9kdWNlIHByZS1yZW1vdmFsIG5vdGlmaWNh
dGlvbiBmb3IgVUJJIHZvbHVtZXMiKQo+IFNpZ25lZC1vZmYtYnk6IFl1aG8gQ2hvaSA8ZGJnaDkx
MjlAZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAxICsKPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3ViaS9idWlsZC5jIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBpbmRleCA2NzRhZDg3ODA5
ZGYwLi5kODFmNWUwMzk1YWMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtMTEwNiw2ICsxMTA2LDcgQEAg
aW50IHViaV9kZXRhY2hfbXRkX2RldihpbnQgdWJpX251bSwgaW50IGFueXdheSkKPiAgIAlpZiAo
dWJpLT5yZWZfY291bnQpIHsKPiAgIAkJaWYgKCFhbnl3YXkpIHsKPiAgIAkJCXNwaW5fdW5sb2Nr
KCZ1YmlfZGV2aWNlc19sb2NrKTsKPiArCQkJcHV0X2RldmljZSgmdWJpLT5kZXYpOwo+ICAgCQkJ
cmV0dXJuIC1FQlVTWTsKPiAgIAkJfQo+ICAgCQkvKiBUaGlzIG1heSBvbmx5IGhhcHBlbiBpZiB0
aGVyZSBpcyBhIGJ1ZyAqLwo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
