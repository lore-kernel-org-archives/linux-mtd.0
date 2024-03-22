Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2692C54E71
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Mar 2024 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk7IdqL8G2K2fOFF6YcJ9y1ErUMkQ9SCWYR9VMzEyYg=; b=S+Yh75e5jHupRG
	OsL7ujpPm5UFfCO0hEUjU1LMzkfNbCACiR0Ng77LpR9fn/f/em2BJ+j667/CTZckxbwStba03nMK9
	SQ7IPdGQheAKd29GcD5RZ6HsXo2+ju5mnqMwKdLLsdWP1N+r4+UsGS6ThRSpq+TYhtXCdN0JoMv3z
	u5jkDJLsbWKzcDPlW7jTuoilMtVAITlisz/F173Hs2fZG09xXyBk6zrJtZMrzNT/lELE/NwWEUDO5
	sbr1h4Xx7sNm1kStuTXlEvTl3pJlmBImopYMQEyegYDPG4o6vo6XjSZmyWNlUdi0NpN6ANU0JfuM9
	QOCe+JopcX0/b5Pq53sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndWj-000000072Xh-1Yjv;
	Fri, 22 Mar 2024 11:57:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rndWf-000000072Wi-22PW
	for linux-mtd@lists.infradead.org;
	Fri, 22 Mar 2024 11:57:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4V1LNV6nWqzwQ1N;
	Fri, 22 Mar 2024 19:54:50 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id CEA141400D7;
	Fri, 22 Mar 2024 19:57:25 +0800 (CST)
Received: from [10.67.111.176] (10.67.111.176) by
 kwepemd500012.china.huawei.com (7.221.188.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 22 Mar 2024 19:57:25 +0800
Message-ID: <661736fb-bb3c-3519-1f4b-44dff285ea0b@huawei.com>
Date: Fri, 22 Mar 2024 19:57:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH 2/5] ubifs: Initialize or update ACLs for inode
Content-Language: en-US
To: Zhihao Cheng <chengzhihao1@huawei.com>, <richard@nod.at>,
	<kent.overstreet@linux.dev>, <agruenba@redhat.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
 <20240319161646.2153867-3-lizetao1@huawei.com>
 <2991c168-723d-48ef-8420-61e22a897239@huawei.com>
From: Li Zetao <lizetao1@huawei.com>
In-Reply-To: <2991c168-723d-48ef-8420-61e22a897239@huawei.com>
X-Originating-IP: [10.67.111.176]
X-ClientProxiedBy: dggpeml100005.china.huawei.com (7.185.36.185) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_045733_883265_415DAC42 
X-CRM114-Status: GOOD (  20.39  )
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

SGksCgpPbiAyMDI0LzMvMjEgMTE6NDcsIFpoaWhhbyBDaGVuZyB3cm90ZToKPiDlnKggMjAyNC8z
LzIwIDA6MTYsIExpIFpldGFvIOWGmemBkzoKPj4gVGhlcmUgYXJlIHR3byBzY2VuYXJpb3Mgd2hl
cmUgQUNMIG5lZWRzIHRvIGJlIHVwZGF0ZWQsIHRoZSBmaXJzdCBvbmUKPj4gaXMgd2hlbiBjcmVh
dGluZyB0aGUgaW5vZGUsIGFuZCB0aGUgc2Vjb25kIG9uZSBpcyBpbiB0aGUgY2htb2QgcHJvY2Vz
cy4KPj4gV2hlbiBjcmVhdGluZyBkaXJlY3Rvcmllcy9maWxlcy9kZXZpY2Ugbm9kZS90bXBmaWxl
LCBBQ0xzIG5lZWRzIHRvIGJlCj4+IGluaXRpYWxpemVkLCBidXQgc3ltbGluayBkbyBub3QuV2h5
IG5vdCBzdXBwb3J0IHN5bWxpbms/IEl0IGxvb2tzIGxpa2UgCj4+IG1hbnkgZmlsZXN5c3RlbXMo
ZWcuIGV4dDQsIGYyZnMsIAo+IGJ0cmZzKSBzdXBwb3J0IGl0LCBleGNlcHQgeGZzLgpUaGFua3Mg
Zm9yIHRoZSByZXZpZXdzLCBidXQgdGhpcyBpcyBpbmNvbnNpc3RlbnQgd2l0aCBteSB1bmRlcnN0
YW5kaW5nLgpJIHRoaW5rIG1vc3QgZmlsZSBzeXN0ZW1zIGluIExpbnV4IGRvIG5vdCBzdXBwb3J0
IGl0LCBiZWNhdXNlIG1vc3QgZmlsZSAKc3lzdGVtcyBkbyBub3QgcmVnaXN0ZXIgdGhlIGdldC9z
ZXQgZnVuY3Rpb25zIG9mIEFDTHMgZm9yIHN5bWxpbmsgCm9wZXJhdGlvbnMuIEFuZCB0aGUgcG9z
aXhfYWNsX2NyZWF0ZSgpIHdpbGwgZGV0ZXJtaW5lIHRoYXQgaXQgaXMgYSAKc3ltbGluayB0eXBl
IGlub2RlLCBhbmQgdGhlbiBza2lwIHRoZSBjcmVhdGlvbiBwcm9jZXNzLiBCdXQgZXhjZXB0IGZv
ciAKYmNhY2hlZnMsIGl0IG1heSBiZSB0byBzb2x2ZSB0aGUgcHJvYmxlbSBvZiBjZXJ0YWluIHNj
ZW5hcmlvcywgc28gaXQgCndvdWxkIGJlIG5pY2UgaWYgYW55b25lIGNvdWxkIGV4cGxhaW4gaXQg
dG8gdXMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29t
Pgo+PiAtLS0KPj4gwqAgZnMvdWJpZnMvZGlyLmPCoCB8IDE2ICsrKysrKysrKysrKysrKysKPj4g
wqAgZnMvdWJpZnMvZmlsZS5jIHzCoCA0ICsrKysKPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9kaXIuYyBiL2ZzL3ViaWZz
L2Rpci5jCj4+IGluZGV4IDU1MTE0OGRlNjZjZC4uZGZiNjgyM2NjOTUzIDEwMDY0NAo+PiAtLS0g
YS9mcy91Ymlmcy9kaXIuYwo+PiArKysgYi9mcy91Ymlmcy9kaXIuYwo+PiBAQCAtMzE2LDYgKzMx
NiwxMCBAQCBzdGF0aWMgaW50IHViaWZzX2NyZWF0ZShzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwg
Cj4+IHN0cnVjdCBpbm9kZSAqZGlyLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZm5h
bWU7Cj4+IMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIGVyciA9IHViaWZzX2luaXRfYWNsKGlub2Rl
LCBkaXIpOwo+PiArwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9p
bm9kZTsKPj4gKwo+IEF0dGVudGlvbiwgYSBuZXcgaW5jb25zaXN0ZW50IHByb2JsZW0gcG9pbnQg
aXMgaW1wb3J0ZWQgYnkgYWNsIHhhdHRyIAo+IGNyZWF0aW9uLiBTZWUgaHR0cHM6Ly9idWd6aWxs
YS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTgzMDkuwqAgQFJpY2hhcmQKVGhpcyBwcm9i
bGVtIGlzIGluZGVlZCBhIGJpdCB0cmlja3kuCj4+IMKgwqDCoMKgwqAgZXJyID0gdWJpZnNfaW5p
dF9zZWN1cml0eShkaXIsIGlub2RlLCAmZGVudHJ5LT5kX25hbWUpOwo+PiDCoMKgwqDCoMKgIGlm
IChlcnIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9pbm9kZTsKPj4gQEAgLTQ2Niw2
ICs0NzAsMTAgQEAgc3RhdGljIGludCB1Ymlmc190bXBmaWxlKHN0cnVjdCBtbnRfaWRtYXAgKmlk
bWFwLCAKPj4gc3RydWN0IGlub2RlICpkaXIsCj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKg
IHVpID0gdWJpZnNfaW5vZGUoaW5vZGUpOwo+PiArwqDCoMKgIGVyciA9IHViaWZzX2luaXRfYWNs
KGlub2RlLCBkaXIpOwo+PiArwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3Rv
IG91dF9pbm9kZTsKPj4gKwo+PiDCoMKgwqDCoMKgIGVyciA9IHViaWZzX2luaXRfc2VjdXJpdHko
ZGlyLCBpbm9kZSwgJmRlbnRyeS0+ZF9uYW1lKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfaW5vZGU7Cj4+IEBAIC0xMDEzLDYgKzEwMjEsMTAg
QEAgc3RhdGljIGludCB1Ymlmc19ta2RpcihzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwgCj4+IHN0
cnVjdCBpbm9kZSAqZGlyLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZm5hbWU7Cj4+
IMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgIGVyciA9IHViaWZzX2luaXRfYWNsKGlub2RlLCBkaXIp
Owo+PiArwqDCoMKgIGlmIChlcnIpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9pbm9kZTsK
Pj4gKwo+PiDCoMKgwqDCoMKgIGVyciA9IHViaWZzX2luaXRfc2VjdXJpdHkoZGlyLCBpbm9kZSwg
JmRlbnRyeS0+ZF9uYW1lKTsKPj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBvdXRfaW5vZGU7Cj4+IEBAIC0xMTA4LDYgKzExMjAsMTAgQEAgc3RhdGljIGlu
dCB1Ymlmc19ta25vZChzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwgCj4+IHN0cnVjdCBpbm9kZSAq
ZGlyLAo+PiDCoMKgwqDCoMKgIHVpLT5kYXRhID0gZGV2Owo+PiDCoMKgwqDCoMKgIHVpLT5kYXRh
X2xlbiA9IGRldmxlbjsKPj4gK8KgwqDCoCBlcnIgPSB1Ymlmc19pbml0X2FjbChpbm9kZSwgZGly
KTsKPj4gK8KgwqDCoCBpZiAoZXJyKQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfaW5vZGU7
Cj4+ICsKPj4gwqDCoMKgwqDCoCBlcnIgPSB1Ymlmc19pbml0X3NlY3VyaXR5KGRpciwgaW5vZGUs
ICZkZW50cnktPmRfbmFtZSk7Cj4+IMKgwqDCoMKgwqAgaWYgKGVycikKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0X2lub2RlOwo+IFRoZSB3aGl0ZW91dCBpbm9kZSBpcyBub3Qgc2V0IGFj
bCBmb3IgcmVuYW1lKFdISVRFT1VUKSBvcGVyYXRpb24uIEl0IAo+IGxvb2tzIGxpa2UgbWFueSBm
aWxlc3lzdGVtcyhlZy4gZXh0NCwgZjJmcywgYnRyZnMpIHN1cHBvcnQgaXQsIGV4Y2VwdCAKPiB4
ZnMuIEluIG15IG9waW5pb24sIHdoaXRlb3V0IGlzIGEgY2hhciBkZXYsIHNpbmNlIGNoYXIvYmxv
Y2sgZGV2aWNlIGlzIAo+IHN1cHBvcnRlZCwgd2h5IG5vdCBzdXBwb3J0IHdoaXRlb3V0Pwo+IAo+
IElmIHdlIHN1cHBvcnQgd2hpdGVvdXQsIHdlIHNob3VsZCBtYWtlIHN1cmUgdGhhdCB0aGUgd2hp
dGVvdXQgcmVuYW1laW5nIAo+IG9wZXJhdGlvbiBpcyBhdG9taWNbMV0uIEJ1dCBJIGNhbm5vdCBj
b21lIHVwIHdpdGggYW4gaWRlYSBob3cgdG8gY29tYmluZSAKPiB3aGl0ZW91dCB4YXR0cihhY2wp
IGNyZWF0aW9uIGFuZCB3aGl0ZW91dCBmaWxlIGNyZWF0aW9uIGludG8gYW4gYXRvbWljIAo+IG9w
ZXJhdGlvbiwganVzdCBsaWtlIHByb2JsZW0gbWVudGlvbmVkIGluIFsyXSwKWWVzLCB0aGFua3Ms
IEkgaGF2ZSBmaXhlZCBpdCBpbiB2MiB2ZXJzaW9uLgo+IAo+IFsxXSAKPiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1tdGQvMjAyMTEyMjcwMzIyNDYuMjg4Njg3OC02LWNoZW5nemhpaGFv
MUBodWF3ZWkuY29tLwo+IFsyXSBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxODMwOQo+PiBkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMv
ZmlsZS5jCj4+IGluZGV4IDUwMjllYjMzOTBhNS4uOGY5NjRmOGIwZjk2IDEwMDY0NAo+PiAtLS0g
YS9mcy91Ymlmcy9maWxlLmMKPj4gKysrIGIvZnMvdWJpZnMvZmlsZS5jCj4+IEBAIC00MSw2ICs0
MSw3IEBACj4+IMKgICNpbmNsdWRlIDxsaW51eC9tb3VudC5oPgo+PiDCoCAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvbWlncmF0ZS5oPgo+PiArI2luY2x1ZGUg
PGxpbnV4L3Bvc2l4X2FjbC5oPgo+PiDCoCBzdGF0aWMgaW50IHJlYWRfYmxvY2soc3RydWN0IGlu
b2RlICppbm9kZSwgdm9pZCAqYWRkciwgdW5zaWduZWQgaW50IAo+PiBibG9jaywKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB1Ymlmc19kYXRhX25vZGUgKmRuKQo+PiBA
QCAtMTI5OCw2ICsxMjk5LDkgQEAgaW50IHViaWZzX3NldGF0dHIoc3RydWN0IG1udF9pZG1hcCAq
aWRtYXAsIAo+PiBzdHJ1Y3QgZGVudHJ5ICpkZW50cnksCj4+IMKgwqDCoMKgwqAgZWxzZQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gZG9fc2V0YXR0cihjLCBpbm9kZSwgYXR0cik7Cj4+ICvC
oMKgwqAgaWYgKCFlcnIgJiYgKGF0dHItPmlhX3ZhbGlkICYgQVRUUl9NT0RFKSkKPj4gK8KgwqDC
oMKgwqDCoMKgIGVyciA9IHBvc2l4X2FjbF9jaG1vZChpZG1hcCwgZGVudHJ5LCBpbm9kZS0+aV9t
b2RlKTsKPj4gKwo+PiDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+IMKgIH0KPj4KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
