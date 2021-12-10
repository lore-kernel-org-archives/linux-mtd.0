Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F44C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ofN9Hx9ubMUdZ/Ac0+gZPIcx8nwEpsILstgh6ngRBHc=; b=G1yaaj482/V1f3
	UHZWRKAnrbz0SCI0+/ymV8Nr/RbXf4AnffcGiXST7ZTnxc+RAQzCkTTra4bdvbJClvBpx0XybI/db
	i+Appt5ks/mCzM/byMgNLYLdLG2Cs8uC1fqKqlyGL2zCRKvpPb84jfvXA7UahBIwJcMVs5osAd4DB
	imazSGS6lIZTSGnCk13JPtGthhqtZlTwmw2XboWWSWLdnmG1qCLhn8aPXQSajZOQ8inOXUc7bDkAj
	Fv9JikiFFnmZAnarainobfBTxZzJVcZ63d62hkrE04otb7k7XC1SxaNWKF8C9QhF/8Mqo4HrTdCi3
	bYBc/T0b+YxkHPpBYxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvcNw-001OLR-9u; Fri, 10 Dec 2021 09:40:12 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvcNs-001OK1-BF; Fri, 10 Dec 2021 09:40:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 04924FF818;
 Fri, 10 Dec 2021 09:40:04 +0000 (UTC)
Date: Fri, 10 Dec 2021 10:40:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "xiangsheng.hou" <xiangsheng.hou@mediatek.com>
Cc: <broonie@kernel.org>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <donghunt@amazon.com>, <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: Re: [RFC,v4,3/5] spi: mtk: Add mediatek SPI Nand Flash interface
 driver
Message-ID: <20211210104003.7db18f5e@xps13>
In-Reply-To: <60212a8cba39939ff2bf48196cc37cb1a2eb20e4.camel@mediatek.com>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
 <20211130083202.14228-4-xiangsheng.hou@mediatek.com>
 <20211209112030.5cdcd07c@xps13>
 <60212a8cba39939ff2bf48196cc37cb1a2eb20e4.camel@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_014008_679435_5F85406C 
X-CRM114-Status: GOOD (  17.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CnhpYW5nc2hlbmcuaG91QG1lZGlhdGVrLmNvbSB3cm90ZSBvbiBGcmksIDEwIERlYyAyMDIxIDE3
OjA5OjMxICswODAwOgoKPiBIaSBNaXF1ZWwsCj4gCj4gT24gVGh1LCAyMDIxLTEyLTA5IGF0IDEx
OjIwICswMTAwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgWGlhbmdzaGVuZywKPiA+IAo+
ID4geGlhbmdzaGVuZy5ob3VAbWVkaWF0ZWsuY29tIHdyb3RlIG9uIFR1ZSwgMzAgTm92IDIwMjEg
MTY6MzI6MDAgKzA4MDA6Cj4gPiAgIAo+ID4gPiAKPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCBt
dGtfc25maV9jb25maWcoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLAo+ID4gPiArCQkJICAgc3Ry
dWN0IG10a19zbmZpICpzbmZpKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBtdGtfZWNjX2VuZ2lu
ZSAqZW5nID0gbXRrX3NuZmlfdG9fZWNjX2VuZ2luZShzbmZpKTsKPiA+ID4gKwl1MzIgdmFsOwo+
ID4gPiArCj4gPiA+ICsJc3dpdGNoIChuYW5kZGV2X3BhZ2Vfc2l6ZShuYW5kKSkgewo+ID4gPiAr
CWNhc2UgNTEyOgo+ID4gPiArCQl2YWwgPSBQQUdFRk1UXzUxMl8ySyB8IFBBR0VGTVRfU0VDX1NF
TF81MTI7Cj4gPiA+ICsJCWJyZWFrOwo+ID4gPiArCWNhc2UgS0IoMik6Cj4gPiA+ICsJCWlmIChl
bmctPnNlY3Rpb25fc2l6ZSA9PSA1MTIpCj4gPiA+ICsJCQl2YWwgPSBQQUdFRk1UXzJLXzRLIHwg
UEFHRUZNVF9TRUNfU0VMXzUxMjsKPiA+ID4gKwkJZWxzZQo+ID4gPiArCQkJdmFsID0gUEFHRUZN
VF81MTJfMks7Cj4gPiA+ICsJCWJyZWFrOwo+ID4gPiArCWNhc2UgS0IoNCk6Cj4gPiA+ICsJCWlm
IChlbmctPnNlY3Rpb25fc2l6ZSA9PSA1MTIpCj4gPiA+ICsJCQl2YWwgPSBQQUdFRk1UXzRLXzhL
IHwgUEFHRUZNVF9TRUNfU0VMXzUxMjsKPiA+ID4gKwkJZWxzZQo+ID4gPiArCQkJdmFsID0gUEFH
RUZNVF8yS180SzsKPiA+ID4gKwkJYnJlYWs7Cj4gPiA+ICsJY2FzZSBLQig4KToKPiA+ID4gKwkJ
aWYgKGVuZy0+c2VjdGlvbl9zaXplID09IDUxMikKPiA+ID4gKwkJCXZhbCA9IFBBR0VGTVRfOEtf
MTZLIHwgUEFHRUZNVF9TRUNfU0VMXzUxMjsKPiA+ID4gKwkJZWxzZQo+ID4gPiArCQkJdmFsID0g
UEFHRUZNVF80S184SzsKPiA+ID4gKwkJYnJlYWs7Cj4gPiA+ICsJY2FzZSBLQigxNik6Cj4gPiA+
ICsJCXZhbCA9IFBBR0VGTVRfOEtfMTZLOwo+ID4gPiArCQlicmVhazsKPiA+ID4gKwlkZWZhdWx0
Ogo+ID4gPiArCQlkZXZfZXJyKHNuZmktPmRldiwgImludmFsaWQgcGFnZSBsZW46ICVkXG4iLAo+
ID4gPiArCQkJbmFuZGRldl9wYWdlX3NpemUobmFuZCkpOwo+ID4gPiArCQlyZXR1cm4gLUVJTlZB
TDsKPiA+ID4gKwl9Cj4gPiA+ICsKPiA+ID4gKwl2YWwgfD0gZW5nLT5vb2JfcGVyX3NlY3Rpb25f
aWR4IDw8IFBBR0VGTVRfU1BBUkVfU0hJRlQ7Cj4gPiA+ICsJdmFsIHw9IGVuZy0+b29iX2ZyZWUg
PDwgUEFHRUZNVF9GRE1fU0hJRlQ7Cj4gPiA+ICsJdmFsIHw9IGVuZy0+b29iX2ZyZWVfcHJvdGVj
dGVkIDw8IFBBR0VGTVRfRkRNX0VDQ19TSElGVDsKPiA+ID4gKwl3cml0ZWwodmFsLCBzbmZpLT5y
ZWdzICsgTkZJX1BBR0VGTVQpOyAgCj4gPiAKPiA+IFNob3VsZG4ndCB0aGlzIGJlIGNhbGN1bGF0
ZWQgb25seSBvbmNlPyAgCj4gCj4gWWVzLCBUaGUgbXRrX3NuZmlfY29uZmlnIGZ1bmN0aW9uIGNh
biBiZSBvbmx5IGNhbGxlZCBpbiBwcmVwYXJlX2lvX3JlcQo+IGF0IHRoZSBmaXJzdCB0aW1lLiBJ
IHdpbGwgYWRkIGEgdmFyaWFibGUgdG8gaW5kaWNhdGUgY29uZmlnIGRvbmUgb3Igbm90Cj4gdG8g
YXZvaWQgY2FsY3VsYXRlIHJlcGVhdGVkbHkuCgpObywgaXQncyBmaW5lIHRvIHdyaXRlIGRvd24g
dGhlIGNvbmZpZ3VyYXRpb24gaW4gdGhlIHJlZ2lzdGVycyBlYWNoCnRpbWUgeW91IGVudGVyIC0+
cHJlcGFyZSgpIGJlY2F1c2UgeW91IGRvIG5vdCBrbm93IGlmIHRoZSBlbmdpbmUgd2FzCnVzZWQg
Zm9yIGFub3RoZXIgZGV2aWNlIG9yIG5vdC4gQnV0IHdoYXQgeW91IHNob3VsZCBub3QgaGF2ZSB0
byBkbyBpcyB0bwpyZWNhbGN1bGF0ZSBldmVyeXRoaW5nIGJlZm9yZSB0aGlzIHJlZ2lzdGVyIHdy
aXRlLiBZb3UgbmVlZCB0byBtb3ZlIHRoZQplbnRpcmUgY2FsY3VsYXRpb24gdG8gLT5pbml0X2N0
eCgpIHdoaWNoIGlzIGNhbGxlZCBvbmx5IG9uY2UgZm9yIGEKZ2l2ZW4gZGV2aWNlIGFuZCB0aGVu
IGFwcGx5IHRoZSBjb25maWd1cmF0aW9uIGVhY2ggdGltZSB5b3UgZW50ZXIKLT5wcmVwYXJlKCku
Cgo+ID4gPiArCXJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW50IG10
a19zbmZpX2VjY19pbml0X2N0eChzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQpCj4gPiA+ICt7Cj4g
PiA+ICsJc3RydWN0IG5hbmRfZWNjX2VuZ2luZV9vcHMgKm9wcyA9IG10a19lY2NfZ2V0X3BpcGVs
aW5lZF9vcHMoKTsKPiA+ID4gKwo+ID4gPiArCXJldHVybiBvcHMtPmluaXRfY3R4KG5hbmQpOwo+
ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCBtdGtfc25maV9lY2NfY2xlYW51cF9j
dHgoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kKQo+ID4gPiArewo+ID4gPiArCXN0cnVjdCBuYW5k
X2VjY19lbmdpbmVfb3BzICpvcHMgPSBtdGtfZWNjX2dldF9waXBlbGluZWRfb3BzKCk7Cj4gPiA+
ICsKPiA+ID4gKwlvcHMtPmNsZWFudXBfY3R4KG5hbmQpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+
ICtzdGF0aWMgaW50IG10a19zbmZpX2VjY19wcmVwYXJlX2lvX3JlcShzdHJ1Y3QgbmFuZF9kZXZp
Y2UgKm5hbmQsCj4gPiA+ICsJCQkJICAgICAgIHN0cnVjdCBuYW5kX3BhZ2VfaW9fcmVxICpyZXEp
Cj4gPiA+ICt7Cj4gPiA+ICsJc3RydWN0IG5hbmRfZWNjX2VuZ2luZV9vcHMgKm9wcyA9IG10a19l
Y2NfZ2V0X3BpcGVsaW5lZF9vcHMoKTsKPiA+ID4gKwlzdHJ1Y3QgbXRrX3NuZmkgKnNuZmkgPSBt
dGtfbmFuZF90b19zcGkobmFuZCk7Cj4gPiA+ICsJaW50IHJldDsKPiA+ID4gKwo+ID4gPiArCXJl
dCA9IG10a19zbmZpX2NvbmZpZyhuYW5kLCBzbmZpKTsKPiA+ID4gKwlpZiAocmV0KQo+ID4gPiAr
CQlyZXR1cm4gcmV0Owo+ID4gPiArCj4gPiA+ICsJcmV0dXJuIG9wcy0+cHJlcGFyZV9pb19yZXEo
bmFuZCwgcmVxKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIGludCBtdGtfc25maV9l
Y2NfZmluaXNoX2lvX3JlcShzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQsCj4gPiA+ICsJCQkJICAg
ICAgc3RydWN0IG5hbmRfcGFnZV9pb19yZXEgKnJlcSkKPiA+ID4gK3sKPiA+ID4gKwlzdHJ1Y3Qg
bmFuZF9lY2NfZW5naW5lX29wcyAqb3BzID0gbXRrX2VjY19nZXRfcGlwZWxpbmVkX29wcygpOwo+
ID4gPiArCXN0cnVjdCBtdGtfZWNjX2VuZ2luZSAqZW5nID0gbmFuZF90b19lY2NfY3R4KG5hbmQp
Owo+ID4gPiArCXN0cnVjdCBtdGtfc25maSAqc25maSA9IG10a19uYW5kX3RvX3NwaShuYW5kKTsK
PiA+ID4gKwo+ID4gPiArCWlmIChyZXEtPm1vZGUgIT0gTVREX09QU19SQVcpCj4gPiA+ICsJCWVu
Zy0+cmVhZF9lbXB0eSA9IHJlYWRsKHNuZmktPnJlZ3MgKyBORklfU1RBKSAmCj4gPiA+IFNUQV9F
TVBfUEFHRTsKPiA+ID4gKwo+ID4gPiArCXJldHVybiBvcHMtPmZpbmlzaF9pb19yZXEobmFuZCwg
cmVxKTsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArCj4gPiA+ICtNT0RVTEVfTElDRU5TRSgiR1BM
IHYyIik7Cj4gPiA+ICtNT0RVTEVfQVVUSE9SKCJYaWFuZ3NoZW5nIEhvdSA8eGlhbmdzaGVuZy5o
b3VAbWVkaWF0ZWsuY29tPiIpOwo+ID4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJNZWRpYXRlayBT
UEkgTmFuZCBGbGFzaCBpbnRlcmZhY2UgZHJpdmVyIik7ICAKPiA+IAo+ID4gT3RoZXJ3aXNlIGxv
b2tzIGdvb2QsIEkgYmVsaWV2ZSB5b3UgY2FuIGRyb3AgdGhlIFJGQyBwcmVmaXggbm93Lgo+ID4g
ICAKPiAKPiBJIHdpbGwgcHJlcGFyZSB0aGUgZm9ybWFsIHBhdGNoIGFuZCBzZW5kIGZvciByZXZp
ZXcgYWZ0ZXIgaW50ZXJuYWwKPiByZXZpZXcgYW5kIHRlc3QuCj4gCj4gVGhhbmtzCj4gWGlhbmdz
aGVuZyBIb3UKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
