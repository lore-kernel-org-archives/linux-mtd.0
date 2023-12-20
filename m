Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8CCC41535
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 02:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUw/K5nCBuEIZZPVw0sOLQM3aWhl4/WD6X/wF5xK2II=; b=fJWLbMFhIB9JBb
	mZd3akH7sIHBPIIzUlwLU7p9Gm2g54uJEqP1otrnQ4DEsTpmavFghNK+711K4P+W8SUTngYUf2RuQ
	cOhFW+DiqR+iLyriS8A/RnC3OdKsoa1s0XW4FO+ss4JtXmwMUbH4+UWZKnzdBbqHvMWx0xMTm+lEy
	nJ9MKsSfMXHwRUn8siaKh+25HiIxLrBJeMYdTjJKY7RH7qYuE7lfRFmO/xzat4BXB6AO8vceIv3PW
	n68ve1o8xp5a7RBRWPgavgbV38eblSZ1nmzylxsoTM9WqGTo6z6I9tDmNOKB+1XYdT25hc1oYfhP0
	eRBFiySwUPo18VGXR6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFm7q-00FxmD-1p;
	Wed, 20 Dec 2023 02:15:58 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFm7m-00FxlJ-2j
	for linux-mtd@lists.infradead.org;
	Wed, 20 Dec 2023 02:15:57 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Svxws1B1Xz1Q6y4;
	Wed, 20 Dec 2023 10:15:25 +0800 (CST)
Received: from dggpemd200001.china.huawei.com (unknown [7.185.36.224])
	by mail.maildlp.com (Postfix) with ESMTPS id 90F5718001C;
	Wed, 20 Dec 2023 10:15:41 +0800 (CST)
Received: from [10.174.178.209] (10.174.178.209) by
 dggpemd200001.china.huawei.com (7.185.36.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Wed, 20 Dec 2023 10:15:41 +0800
Message-ID: <31c3da46-5373-f91d-6f35-051bc4735a29@huawei.com>
Date: Wed, 20 Dec 2023 10:15:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3] mtd: Fix gluebi NULL pointer dereference caused by ftl
 notifier
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
	<vigneshr@ti.com>, Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, dpervushin
	<dpervushin@embeddedalley.com>, linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, chengzhihao1
	<chengzhihao1@huawei.com>, yi zhang <yi.zhang@huawei.com>, yangerkun
	<yangerkun@huawei.com>
References: <20231027012033.50280-1-wangzhaolong1@huawei.com>
 <20231027194026.1bc32dfe@xps-13>
 <174426702.13324.1698438610904.JavaMail.zimbra@nod.at>
 <20231029145033.0ad2682a@xps-13>
 <142222867.20038.1698593973984.JavaMail.zimbra@nod.at>
 <04b4c375-d890-9458-5d62-0a9ba74b8c68@huawei.com>
 <20231219154438.2bc1820e@xps-13>
From: ZhaoLong Wang <wangzhaolong1@huawei.com>
In-Reply-To: <20231219154438.2bc1820e@xps-13>
X-Originating-IP: [10.174.178.209]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemd200001.china.huawei.com (7.185.36.224)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_181555_122923_1094F610 
X-CRM114-Status: GOOD (  10.97  )
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

T2gsIHNvcnJ5LCBJIGhhZCBtaXNzZWQgYSBjcnVjaWFsIHBhcnQgb2YgeW91ciBwcmV2aW91cyBt
ZXNzYWdlLApzcGVjaWZpY2FsbHkgdGhlIHNlZ21lbnQgYWJvdXQgdGhlIGBmbHQgPyBub3RpZmll
cixUaGlzIG92ZXJzaWdodApsZWQgdG8gbXkgbWlzdW5kZXJzdGFuZGluZyBvZiB0aGUgc2l0dWF0
aW9uLCBhbmQgZm9yIHRoYXQsIEkgYW0KdHJ1bHkgc29ycnkuCgpUaGFuayB5b3UgZm9yIHlvdXIg
dW5kZXJzdGFuZGluZyBhbmQgcGF0aWVuY2UuIEkgYW0gY29tbWl0dGVkIHRvCm1haW50YWluaW5n
IGNsZWFyIGFuZCBhY2N1cmF0ZSBjb21tdW5pY2F0aW9uIGdvaW5nIGZvcndhcmQuCgpJJ2xsIHNl
bmQgYSB2NCB2ZXJzaW9uIG9mIHRoZSBsb2cgZml4ZWQgcGF0Y2ggc29vbi4KCldhcm1lc3QgdGhh
bmtzLApaaGFvTG9uZyBXYW5nCgo+IEhpIFpoYW9Mb25nLAo+IAo+IHdhbmd6aGFvbG9uZzFAaHVh
d2VpLmNvbSB3cm90ZSBvbiBUdWUsIDE5IERlYyAyMDIzIDIyOjM2OjUwICswODAwOgo+IAo+PiBG
cmllbmRseSBwaW5nLi4uCj4+Cj4+IEknZCBsaWtlIHRvIGtub3cgd2hhdCB0aGUgY3VycmVudCBz
dGF0dXMgb2YgdGhpcyBwYXRjaCBpcy4gSXMgdGhlcmUgYSBuZWVkIGZvciBmdXJ0aGVyIHByb2dy
YW1tZSBpbXByb3ZlbWVudHM/Cj4gCj4gRWFzeSwgc2VlIGJlbG93Lgo+IAo+Pgo+PiBCYXN0IHJl
Z2FyZHMsCj4+IFpoYW9Mb25nIFdhbmcKPj4KPj4KPj4+IC0tLS0tIFVyc3Byw7xuZ2xpY2hlIE1h
aWwgLS0tLS0KPj4+PiBWb246ICJNaXF1ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGlu
LmNvbT4KPj4+PiBBY2suIEknbGwgcXVldWUgdGhpcyBvbmNlIHRoZSBsb2cgZml4ZWQgYW5kIHlv
dXIgb2ZmaWNpYWwgQWNrLWJ5Cj4+Pj4gcmVjZWl2ZWQgZm9yIG10ZC9uZXh0IGFmdGVyIC1yYzEg
aXMgb3V0Lgo+IAo+IEhlcmUgSSBkZXBpY3QgdHdvIGNvbmRpdGlvbnMuCj4gCj4+PiBBY2tlZC1i
eTogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KPiAKPiBBbmQgaGVyZSBvbmUg
b2YgdGhlbSBpcyBmdWxmaWxsZWQsIHdoaWNoIG1lYW5zIHRoZSBvdGhlciBvbmUgaXMgc3RpbGwK
PiBub3QgQUZBSUsgOikKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
