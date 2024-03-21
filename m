Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745EAC54E58
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2024 03:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGCauW4l5rvt07o91OQQ+6gnPNJX+v1gq/QJFg3OPtA=; b=Dbky0yI1KWk1TQ+5ld0KSq+Oxk
	GOWodwLx+JPccrRO4dZaL1p2unx5vj+WMyky+pi+0QyerUbq9VXTiMvvDeKNDI20ja2ih+I9W56st
	Gj9qBQXPkzvyUnsbH5HN/0nNutff3m5boIsktTlSZ/3Ei04ws13ugWA+QqfYKKYBHlaPwtOIsZudl
	OLB2hU9fwwrUp8YvmG38x7hFdD6cvCtaHeONCv7dv4i7UuYxxN/Y/HH5+lA1iweyHIQeD4rGpWobb
	VAyiXVL9SpctALNpFDYxttv6FMJr9EHlX06fEOTztHtkdk6iCQ/ZMFa2+79UjLxo1teOp4oR+qzAG
	X9ezO8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn9PT-00000001k4H-0rZB;
	Thu, 21 Mar 2024 03:48:07 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn9PP-00000001k3f-2RRL
	for linux-mtd@lists.infradead.org;
	Thu, 21 Mar 2024 03:48:06 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4V0Wb039dMzNmCY;
	Thu, 21 Mar 2024 11:46:04 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7D216140390;
	Thu, 21 Mar 2024 11:47:58 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 11:47:57 +0800
Subject: Re: [RFC PATCH 2/5] ubifs: Initialize or update ACLs for inode
To: Li Zetao <lizetao1@huawei.com>, <richard@nod.at>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20240319161646.2153867-1-lizetao1@huawei.com>
 <20240319161646.2153867-3-lizetao1@huawei.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <2991c168-723d-48ef-8420-61e22a897239@huawei.com>
Date: Thu, 21 Mar 2024 11:47:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240319161646.2153867-3-lizetao1@huawei.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_204804_125214_8A816680 
X-CRM114-Status: GOOD (  18.55  )
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

1NogMjAyNC8zLzIwIDA6MTYsIExpIFpldGFvINC0tcA6Cj4gVGhlcmUgYXJlIHR3byBzY2VuYXJp
b3Mgd2hlcmUgQUNMIG5lZWRzIHRvIGJlIHVwZGF0ZWQsIHRoZSBmaXJzdCBvbmUKPiBpcyB3aGVu
IGNyZWF0aW5nIHRoZSBpbm9kZSwgYW5kIHRoZSBzZWNvbmQgb25lIGlzIGluIHRoZSBjaG1vZCBw
cm9jZXNzLgo+IFdoZW4gY3JlYXRpbmcgZGlyZWN0b3JpZXMvZmlsZXMvZGV2aWNlIG5vZGUvdG1w
ZmlsZSwgQUNMcyBuZWVkcyB0byBiZQo+IGluaXRpYWxpemVkLCBidXQgc3ltbGluayBkbyBub3Qu
V2h5IG5vdCBzdXBwb3J0IHN5bWxpbms/IEl0IGxvb2tzIGxpa2UgbWFueSBmaWxlc3lzdGVtcyhl
Zy4gZXh0NCwgZjJmcywgCmJ0cmZzKSBzdXBwb3J0IGl0LCBleGNlcHQgeGZzLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IExpIFpldGFvIDxsaXpldGFvMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZnMvdWJp
ZnMvZGlyLmMgIHwgMTYgKysrKysrKysrKysrKysrKwo+ICAgZnMvdWJpZnMvZmlsZS5jIHwgIDQg
KysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL2Rpci5jIGIvZnMvdWJpZnMvZGlyLmMKPiBpbmRleCA1NTExNDhkZTY2Y2Qu
LmRmYjY4MjNjYzk1MyAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9kaXIuYwo+ICsrKyBiL2ZzL3Vi
aWZzL2Rpci5jCj4gQEAgLTMxNiw2ICszMTYsMTAgQEAgc3RhdGljIGludCB1Ymlmc19jcmVhdGUo
c3RydWN0IG1udF9pZG1hcCAqaWRtYXAsIHN0cnVjdCBpbm9kZSAqZGlyLAo+ICAgCQlnb3RvIG91
dF9mbmFtZTsKPiAgIAl9Cj4gICAKPiArCWVyciA9IHViaWZzX2luaXRfYWNsKGlub2RlLCBkaXIp
Owo+ICsJaWYgKGVycikKPiArCQlnb3RvIG91dF9pbm9kZTsKPiArCkF0dGVudGlvbiwgYSBuZXcg
aW5jb25zaXN0ZW50IHByb2JsZW0gcG9pbnQgaXMgaW1wb3J0ZWQgYnkgYWNsIHhhdHRyIApjcmVh
dGlvbi4gU2VlIGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE4
MzA5LiAgQFJpY2hhcmQKPiAgIAllcnIgPSB1Ymlmc19pbml0X3NlY3VyaXR5KGRpciwgaW5vZGUs
ICZkZW50cnktPmRfbmFtZSk7Cj4gICAJaWYgKGVycikKPiAgIAkJZ290byBvdXRfaW5vZGU7Cj4g
QEAgLTQ2Niw2ICs0NzAsMTAgQEAgc3RhdGljIGludCB1Ymlmc190bXBmaWxlKHN0cnVjdCBtbnRf
aWRtYXAgKmlkbWFwLCBzdHJ1Y3QgaW5vZGUgKmRpciwKPiAgIAl9Cj4gICAJdWkgPSB1Ymlmc19p
bm9kZShpbm9kZSk7Cj4gICAKPiArCWVyciA9IHViaWZzX2luaXRfYWNsKGlub2RlLCBkaXIpOwo+
ICsJaWYgKGVycikKPiArCQlnb3RvIG91dF9pbm9kZTsKPiArCj4gICAJZXJyID0gdWJpZnNfaW5p
dF9zZWN1cml0eShkaXIsIGlub2RlLCAmZGVudHJ5LT5kX25hbWUpOwo+ICAgCWlmIChlcnIpCj4g
ICAJCWdvdG8gb3V0X2lub2RlOwo+IEBAIC0xMDEzLDYgKzEwMjEsMTAgQEAgc3RhdGljIGludCB1
Ymlmc19ta2RpcihzdHJ1Y3QgbW50X2lkbWFwICppZG1hcCwgc3RydWN0IGlub2RlICpkaXIsCj4g
ICAJCWdvdG8gb3V0X2ZuYW1lOwo+ICAgCX0KPiAgIAo+ICsJZXJyID0gdWJpZnNfaW5pdF9hY2wo
aW5vZGUsIGRpcik7Cj4gKwlpZiAoZXJyKQo+ICsJCWdvdG8gb3V0X2lub2RlOwo+ICsKPiAgIAll
cnIgPSB1Ymlmc19pbml0X3NlY3VyaXR5KGRpciwgaW5vZGUsICZkZW50cnktPmRfbmFtZSk7Cj4g
ICAJaWYgKGVycikKPiAgIAkJZ290byBvdXRfaW5vZGU7Cj4gQEAgLTExMDgsNiArMTEyMCwxMCBA
QCBzdGF0aWMgaW50IHViaWZzX21rbm9kKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3Qg
aW5vZGUgKmRpciwKPiAgIAl1aS0+ZGF0YSA9IGRldjsKPiAgIAl1aS0+ZGF0YV9sZW4gPSBkZXZs
ZW47Cj4gICAKPiArCWVyciA9IHViaWZzX2luaXRfYWNsKGlub2RlLCBkaXIpOwo+ICsJaWYgKGVy
cikKPiArCQlnb3RvIG91dF9pbm9kZTsKPiArCj4gICAJZXJyID0gdWJpZnNfaW5pdF9zZWN1cml0
eShkaXIsIGlub2RlLCAmZGVudHJ5LT5kX25hbWUpOwo+ICAgCWlmIChlcnIpCj4gICAJCWdvdG8g
b3V0X2lub2RlOwpUaGUgd2hpdGVvdXQgaW5vZGUgaXMgbm90IHNldCBhY2wgZm9yIHJlbmFtZShX
SElURU9VVCkgb3BlcmF0aW9uLiBJdCAKbG9va3MgbGlrZSBtYW55IGZpbGVzeXN0ZW1zKGVnLiBl
eHQ0LCBmMmZzLCBidHJmcykgc3VwcG9ydCBpdCwgZXhjZXB0IAp4ZnMuIEluIG15IG9waW5pb24s
IHdoaXRlb3V0IGlzIGEgY2hhciBkZXYsIHNpbmNlIGNoYXIvYmxvY2sgZGV2aWNlIGlzIApzdXBw
b3J0ZWQsIHdoeSBub3Qgc3VwcG9ydCB3aGl0ZW91dD8KCklmIHdlIHN1cHBvcnQgd2hpdGVvdXQs
IHdlIHNob3VsZCBtYWtlIHN1cmUgdGhhdCB0aGUgd2hpdGVvdXQgcmVuYW1laW5nIApvcGVyYXRp
b24gaXMgYXRvbWljWzFdLiBCdXQgSSBjYW5ub3QgY29tZSB1cCB3aXRoIGFuIGlkZWEgaG93IHRv
IGNvbWJpbmUgCndoaXRlb3V0IHhhdHRyKGFjbCkgY3JlYXRpb24gYW5kIHdoaXRlb3V0IGZpbGUg
Y3JlYXRpb24gaW50byBhbiBhdG9taWMgCm9wZXJhdGlvbiwganVzdCBsaWtlIHByb2JsZW0gbWVu
dGlvbmVkIGluIFsyXSwKClsxXSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIw
MjExMjI3MDMyMjQ2LjI4ODY4NzgtNi1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS8KWzJdIGh0dHBz
Oi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE4MzA5Cj4gZGlmZiAtLWdp
dCBhL2ZzL3ViaWZzL2ZpbGUuYyBiL2ZzL3ViaWZzL2ZpbGUuYwo+IGluZGV4IDUwMjllYjMzOTBh
NS4uOGY5NjRmOGIwZjk2IDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2Zz
L3ViaWZzL2ZpbGUuYwo+IEBAIC00MSw2ICs0MSw3IEBACj4gICAjaW5jbHVkZSA8bGludXgvbW91
bnQuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICAjaW5jbHVkZSA8bGludXgvbWln
cmF0ZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcG9zaXhfYWNsLmg+Cj4gICAKPiAgIHN0YXRpYyBp
bnQgcmVhZF9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB2b2lkICphZGRyLCB1bnNpZ25lZCBp
bnQgYmxvY2ssCj4gICAJCSAgICAgIHN0cnVjdCB1Ymlmc19kYXRhX25vZGUgKmRuKQo+IEBAIC0x
Mjk4LDYgKzEyOTksOSBAQCBpbnQgdWJpZnNfc2V0YXR0cihzdHJ1Y3QgbW50X2lkbWFwICppZG1h
cCwgc3RydWN0IGRlbnRyeSAqZGVudHJ5LAo+ICAgCWVsc2UKPiAgIAkJZXJyID0gZG9fc2V0YXR0
cihjLCBpbm9kZSwgYXR0cik7Cj4gICAKPiArCWlmICghZXJyICYmIChhdHRyLT5pYV92YWxpZCAm
IEFUVFJfTU9ERSkpCj4gKwkJZXJyID0gcG9zaXhfYWNsX2NobW9kKGlkbWFwLCBkZW50cnksIGlu
b2RlLT5pX21vZGUpOwo+ICsKPiAgIAlyZXR1cm4gZXJyOwo+ICAgfQo+ICAgCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
