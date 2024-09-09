Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D0FCE7AB0
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 03:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15IJtJODk2XywDCB6spYjn7YCbvI4JgBJV+yAy5ebac=; b=YG5ht31w+qPSMauD/+khzeqo8a
	g5wqYO8Jjni49UvwirAsL9eaNimlWjaFDDv+vcbe/ZSf7kGDo3niAm1+1asmDSRJdKlQ7j/GDP17Q
	F0QCLKQYGQXBxZ2rnF5Lct4NhvBe7ZaSygNNwveJNX3yOw3DaGuaBNSeeJeYnNhgsP3Bwn6jkWNF9
	DC60hjlkJlogfgxkRU0IBYCl98vc5oWv9dVEgoZ7wfhLyI2ZJZjNEHcmDBq5EPqL1jtPuSpUOoKr5
	EE5BUvVgFVpccN/SAQMwyEQ2jiaW2M6HRER6aO3BT12dcnWhLCS4WbdzCZUid7CBssxL/CrpxcP5N
	4mTTIVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUxh-00000000Lxa-3yEO;
	Mon, 09 Sep 2024 03:21:09 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snUxc-00000000Lup-2NPG
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 03:21:07 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4X2Bsw6Brsz1j8JW;
	Mon,  9 Sep 2024 11:20:20 +0800 (CST)
Received: from kwepemm000013.china.huawei.com (unknown [7.193.23.81])
	by mail.maildlp.com (Postfix) with ESMTPS id 0E3CC1A0188;
	Mon,  9 Sep 2024 11:20:47 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm000013.china.huawei.com (7.193.23.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Sep 2024 11:20:46 +0800
Subject: Re: [PATCH] ubi: wl: Close down wear-leveling before nand is
 suspended
To: =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>, Richard
 Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>
References: <20240907-ubi-wl-race-v1-1-6f7f5e0aea7b@axis.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <10beabdf-17e2-8232-0ce9-1b3d1136f6bb@huawei.com>
Date: Mon, 9 Sep 2024 11:20:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240907-ubi-wl-race-v1-1-6f7f5e0aea7b@axis.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm000013.china.huawei.com (7.193.23.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_202105_689381_50A5FD0F 
X-CRM114-Status: GOOD (  14.54  )
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

5ZyoIDIwMjQvOS84IDM6MjgsIE3DpXJ0ZW4gTGluZGFobCDlhpnpgZM6Cj4gSWYgYSByZWJvb3Qv
c2h1dGRvd24gc2lnbmFsIHdpdGggZG91YmxlIGZvcmNlICgtZmYpIGlzIHRyaWdnZXJlZCB3aGVu
Cj4gdGhlIGVyYXNlIHdvcmtlciBvciB3ZWFyLWxldmVsaW5nIHdvcmtlciBmdW5jdGlvbiBydW5z
IHdlIG1heSBlbmQgdXAgaW4KPiBhIHJhY2UgY29uZGl0aW9uIHNpbmNlIHRoZSBNVEQgZGV2aWNl
IGdldHMgYSByZWJvb3Qgbm90aWZpY2F0aW9uIGFuZAo+IHN1c3BlbmRzIHRoZSBuYW5kIGZsYXNo
IGJlZm9yZSB0aGUgZXJhc2Ugb3Igd2Vhci1sZXZlbGluZyBpcyBkb25lLiBUaGlzCj4gd2lsbCBy
ZWplY3QgYWxsIGFjY2Vzc2VzIHRvIHRoZSBmbGFzaCB3aXRoIC1FQlVTWS4KPiAKPiBTZXF1ZW5j
ZSBmb3IgdGhlIGVyYXNlIHdvcmtlciBmdW5jdGlvbjoKPiAKPiAgICAgc3lzdGVtY3RsIHJlYm9v
dCAtZmYgICAgICAgICAgIHViaV90aHJlYWQKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkb193b3JrCj4gICBfX2RvX3N5c19yZWJvb3QKPiAgICAgYmxvY2tpbmdfbm90aWZp
ZXJfY2FsbF9jaGFpbgo+ICAgICAgIG10ZF9yZWJvb3Rfbm90aWZpZXIKPiAgICAgICAgIG5hbmRf
c2h1dGRvd24KPiAgICAgICAgICAgbmFuZF9zdXNwZW5kCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBfX2VyYXNlX3dvcmtlcgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1Ymlfc3luY19lcmFzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIG10ZF9lcmFzZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbmFuZF9lcmFzZV9uYW5kCj4gCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICMgQmxvY2tlZCBieSBzdXNwZW5kZWQgY2hpcAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuYW5kX2dldF9kZXZpY2UKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9PiBFQlVTWQo+IAo+IFNpbWlsYXIg
c2VxdWVuY2UgZm9yIHRoZSB3ZWFyLWxldmVsaW5nIGZ1bmN0aW9uOgo+IAo+ICAgICBzeXN0ZW1j
dGwgcmVib290IC1mZiAgICAgICAgICAgdWJpX3RocmVhZAo+IAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRvX3dvcmsKPiAgIF9fZG9fc3lzX3JlYm9vdAo+ICAgICBibG9ja2lu
Z19ub3RpZmllcl9jYWxsX2NoYWluCj4gICAgICAgbXRkX3JlYm9vdF9ub3RpZmllcgo+ICAgICAg
ICAgbmFuZF9zaHV0ZG93bgo+ICAgICAgICAgICBuYW5kX3N1c3BlbmQKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHdlYXJfbGV2ZWxpbmdfd29ya2VyCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHViaV9lYmFfY29weV9sZWIKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB1YmlfaW9fd3JpdGUKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG10ZF93cml0ZQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBuYW5kX3dyaXRlX29vYgo+IAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgQmxvY2tlZCBieSBzdXNwZW5kZWQgY2hp
cAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5hbmRfZ2V0
X2RldmljZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
PT4gRUJVU1kKPiAKPiAgIHN5c3RlbWQtc2h1dGRvd25bMV06IFJlYm9vdGluZy4KPiAgIHViaTAg
ZXJyb3I6IHViaV9pb193cml0ZTogZXJyb3IgLTE2IHdoaWxlIHdyaXRpbmcgMjA0OCBieXRlcyB0
byBQRUIKPiAgIENQVTogMSBQSUQ6IDgyIENvbW06IHViaV9iZ3QwZCBLZHVtcDogbG9hZGVkIFRh
aW50ZWQ6IEcgICAgICAgICAgIE8KPiAgICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8ODAxMDdi
OWY+XSAoc2hvd19zdGFjaysweGIvMHhjKQo+ICAgKHNob3dfc3RhY2spIGZyb20gWzw4MDMzNjQx
Zj5dIChkdW1wX3N0YWNrX2x2bCsweDJiLzB4MzQpCj4gICAoZHVtcF9zdGFja19sdmwpIGZyb20g
Wzw4MDNiN2YzZj5dICh1YmlfaW9fd3JpdGUrMHgzYWIvMHg0YTgpCj4gICAodWJpX2lvX3dyaXRl
KSBmcm9tIFs8ODAzYjgxN2Q+XSAodWJpX2lvX3dyaXRlX3ZpZF9oZHIrMHg3MS8weGI0KQo+ICAg
KHViaV9pb193cml0ZV92aWRfaGRyKSBmcm9tIFs8ODAzYjY5NzE+XSAodWJpX2ViYV9jb3B5X2xl
YisweDE5NS8weDJmMCkKPiAgICh1YmlfZWJhX2NvcHlfbGViKSBmcm9tIFs8ODAzYjkzOWI+XSAo
d2Vhcl9sZXZlbGluZ193b3JrZXIrMHgyZmYvMHg3MzgpCj4gICAod2Vhcl9sZXZlbGluZ193b3Jr
ZXIpIGZyb20gWzw4MDNiODZlZj5dIChkb193b3JrKzB4NWIvMHhiMCkKPiAgIChkb193b3JrKSBm
cm9tIFs8ODAzYjllZTE+XSAodWJpX3RocmVhZCsweGIxLzB4MTFjKQo+ICAgKHViaV90aHJlYWQp
IGZyb20gWzw4MDEyYzExMz5dIChrdGhyZWFkKzB4MTFiLzB4MTM0KQo+ICAgKGt0aHJlYWQpIGZy
b20gWzw4MDEwMDEzOT5dIChyZXRfZnJvbV9mb3JrKzB4MTEvMHgzOCkKPiAgIEV4Y2VwdGlvbiBz
dGFjaygweDgwYzQzZmIwIHRvIDB4ODBjNDNmZjgpCj4gICAuLi4KPiAgIHViaTAgZXJyb3I6IHVi
aV9kdW1wX2ZsYXNoOiBlcnIgLTE2IHdoaWxlIHJlYWRpbmcgMjA0OCBieXRlcyBmcm9tIFBFQgo+
ICAgdWJpMCBlcnJvcjogd2Vhcl9sZXZlbGluZ193b3JrZXI6IGVycm9yIC0xNiB3aGlsZSBtb3Zp
bmcgUEVCIDI0NiB0byBQRUIKPiAgIHViaTAgd2FybmluZzogdWJpX3JvX21vZGUucGFydC4wOiBz
d2l0Y2ggdG8gcmVhZC1vbmx5IG1vZGUKPiAgIC4uLgo+ICAgdWJpMCBlcnJvcjogZG9fd29yazog
d29yayBmYWlsZWQgd2l0aCBlcnJvciBjb2RlIC0xNgo+ICAgdWJpMCBlcnJvcjogdWJpX3RocmVh
ZDogdWJpX2JndDBkOiB3b3JrIGZhaWxlZCB3aXRoIGVycm9yIGNvZGUgLTE2CgpZZXMsIEkgbm90
aWNlZCB0aGVzZSB0eXBlcyBvZiBtZXNzYWdlcyB0b28gYmVmb3JlIGtlcm5lbCB2NS4xOC4gU2lu
Y2UgCmNvbW1pdCAwMTNlNjI5MmFhZjVlNGIwKCJtdGQ6IHJhd25hbmQ6IFNpbXBsaWZ5IHRoZSBs
b2NraW5nIiksIHRoZSAKYmVoYXZpb3Igb2YgbmFuZF9nZXRfZGV2aWNlKCkgaXMgY2hhbmdlZC4g
QSBwcm9jZXNzIHdobyBpcyBpbnZva2luZyAKbmFuZF9nZXRfZGV2aWNlKCkgZHVyaW5nIHJlYm9v
dGluZyB3b24ndCBiZSBzdHVja2VkLCBpdCB3aWxsIGdldCBhbiAKRUJVU1kgZXJyb3IgY29kZSwg
dGhhdCdzIHdoeSB3ZSBzZWUgdGhlIGFib3ZlIG1lc3NhZ2VzIGZyb20gVUJJIG1vZHVsZS4KQWZ0
ZXIgY29tbWl0IDhjYmEzMjM0MzdhNDlhNCgibXRkOiByYXduYW5kOiBwcm90ZWN0IGFjY2VzcyB0
byByYXduYW5kIApkZXZpY2VzIHdoaWxlIGluIHN1c3BlbmQiKSwgdGhlIGJlaGF2aW9yIG9mIG5h
bmRfZ2V0X2RldmljZSgpIGlzIGNoYW5nZWQgCmJhY2suIEEgcHJvY2VzcyB3aG8gaXMgaW52b2tp
bmcgbmFuZF9nZXRfZGV2aWNlKCkgZHVyaW5nIHJlYm9vdGluZyB3aWxsIApiZSBzdHVja2VkIGFn
YWluLCBzbyB0aGVyZSBzaG91bGQgYmUgbm8gZXJyb3IgbWVzc2FnZXMgaW4gVUJJIGxheWVyLgpT
bywgaXMgeW91ciBrZXJuZWwgdmVyc2lvbiBsb3dlciB0aGFuIHY1LjE4PwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
