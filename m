Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0512CC5DF61
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 18:41:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D186F206BA
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 18:41:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJ++C5nw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D186F206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qzVZgOeaTNFk/gGLEhh4p/PNPlT2+cm/fd2y2Swbb4s=; b=oJ++C5nwuGUa/W
	UAcHjWqhTvO3tVcgaG53MSQ1TLCNq0UuhqM5V1leE7oG3JVHiq8jEtsZQcgsaDljKWi/xgq0hE3Lr
	x+K5kFKuR6SHy/1IXvcWlOacEyDCkJsj0klXrPD8wE8/lzWeBWZZ510BKKhx5uiXCySxmUJwtbqqW
	S6HWGjvIycZHVlZAoUUU3ehzi42MJmH+kj0H1KE0lDMZ4qY95e7gsNguFIORvPPIy1jQTTX/Xx/VA
	U/hf0300EDBU1nuprmmeH8X6FYOE17SfMQV57eqWFKSZ+SE9sCVOuuiKmuq2bhlEfPw+OSDARCFJ9
	K7wYNPFPxLgMdrW2NNOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iS3ls-0000rF-Fk; Tue, 05 Nov 2019 18:41:40 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iS3lm-0000pt-IP
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 18:41:39 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D592A20005;
 Tue,  5 Nov 2019 18:41:23 +0000 (UTC)
Date: Tue, 5 Nov 2019 19:41:22 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Angelo Dureghello <angelo.dureghello@timesys.com>
Subject: Re: [PATCH] mtd: devices: fix mchp23k256 read and write
Message-ID: <20191105194122.4dcee126@xps13>
In-Reply-To: <20191030113957.1625342-1-angelo.dureghello@timesys.com>
References: <20191030113957.1625342-1-angelo.dureghello@timesys.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_104137_658260_C3072078 
X-CRM114-Status: GOOD (  15.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 andrew@lunn.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQW5nZWxvLAoKKyBBbmRyZXcKCkFuZ2VsbyBEdXJlZ2hlbGxvIDxhbmdlbG8uZHVyZWdoZWxs
b0B0aW1lc3lzLmNvbT4gd3JvdGUgb24gV2VkLCAzMCBPY3QKMjAxOSAxMjozOTo1NyArMDEwMDoK
Cj4gRHVlIHRvIHRoZSB1c2Ugb2Ygc2l6ZW9mKCksIGNvbW1hbmQgc2l6ZSBzZXQgZm9yIHRoZSBz
cGkgdHJhbnNmZXIKPiB3YXMgd3JvbmcuIERyaXZlciB3YXMgc2VuZGluZyBhbmQgcmVjZWl2aW5n
IGFsd2F5cyAxIGJ5dGUgbGVzcwo+IGFuZCBlc3BlY2lhbGx5IG9uIHdyaXRlLCBpdCB3YXMgaGFu
Z2luZy4KPiAKPiBlY2hvIC1uIC1lICJcXHgxXFx4MlxceDNcXHg0IiA+IC9kZXYvbXRkMQo+IAo+
IEFuZCByZWFkIHBhcnQgdG9vIG5vdyB3b3JrcyBhcyBleHBlY3RlZC4KPiAKPiBoZXhkdW1wIC1D
IC1uMTYgL2Rldi9tdGQxCj4gMDAwMDAwMDAgIDAxIDAyIDAzIDA0IGFiIGYzIGFkIGMyICBhYiBl
MyBmNCAzNiBkZCAzOCAwNCAxNQo+IDAwMDAwMDEwCj4gCgpMb29rcyBmaW5lIGJ5IG1lLCBqdXN0
IGFkZGVkIEFuZHJldyBpbiBjYXNlIGhlIHdhbnRzIHRvIHJldmlldyB0aGUKcGF0Y2ggYXMgaGUg
d2FzIHRoZSBvcmlnaW5hbCBjb21taXR0ZXIuCgpBbnl3YXkgeW91J3JlIG1pc3NpbmcgYSBDYzog
c3RhYmxlIGFuZCBGaXhlcyB0YWcgb24KNWRjMTdmYTZmYjcwICgibXRkOiBtY2hwMjNrMjU2OiBB
ZGQgZHJpdmVyIGZvciB0aGlzIFNQSSBTUkFNIGRldmljZSIpCgpUaGFua3MsCk1pcXXDqGwKCj4g
U2lnbmVkLW9mZi1ieTogQW5nZWxvIER1cmVnaGVsbG8gPGFuZ2Vsby5kdXJlZ2hlbGxvQHRpbWVz
eXMuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9kZXZpY2VzL21jaHAyM2syNTYuYyB8IDIwICsr
KysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL21jaHAy
M2syNTYuYyBiL2RyaXZlcnMvbXRkL2RldmljZXMvbWNocDIzazI1Ni5jCj4gaW5kZXggYjIwZDAy
YjRmODMwLi43N2M4NzJmZDNkODMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9t
Y2hwMjNrMjU2LmMKPiArKysgYi9kcml2ZXJzL210ZC9kZXZpY2VzL21jaHAyM2syNTYuYwo+IEBA
IC02NCwxNSArNjQsMTcgQEAgc3RhdGljIGludCBtY2hwMjNrMjU2X3dyaXRlKHN0cnVjdCBtdGRf
aW5mbyAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sCj4gIAlzdHJ1Y3Qgc3BpX3RyYW5zZmVy
IHRyYW5zZmVyWzJdID0ge307Cj4gIAlzdHJ1Y3Qgc3BpX21lc3NhZ2UgbWVzc2FnZTsKPiAgCXVu
c2lnbmVkIGNoYXIgY29tbWFuZFtNQVhfQ01EX1NJWkVdOwo+IC0JaW50IHJldDsKPiArCWludCBy
ZXQsIGNtZF9sZW47Cj4gIAo+ICAJc3BpX21lc3NhZ2VfaW5pdCgmbWVzc2FnZSk7Cj4gIAo+ICsJ
Y21kX2xlbiA9IG1jaHAyM2syNTZfY21kc3ooZmxhc2gpOwo+ICsKPiAgCWNvbW1hbmRbMF0gPSBN
Q0hQMjNLMjU2X0NNRF9XUklURTsKPiAgCW1jaHAyM2syNTZfYWRkcjJjbWQoZmxhc2gsIHRvLCBj
b21tYW5kKTsKPiAgCj4gIAl0cmFuc2ZlclswXS50eF9idWYgPSBjb21tYW5kOwo+IC0JdHJhbnNm
ZXJbMF0ubGVuID0gbWNocDIzazI1Nl9jbWRzeihmbGFzaCk7Cj4gKwl0cmFuc2ZlclswXS5sZW4g
PSBjbWRfbGVuOwo+ICAJc3BpX21lc3NhZ2VfYWRkX3RhaWwoJnRyYW5zZmVyWzBdLCAmbWVzc2Fn
ZSk7Cj4gIAo+ICAJdHJhbnNmZXJbMV0udHhfYnVmID0gYnVmOwo+IEBAIC04OCw4ICs5MCw4IEBA
IHN0YXRpYyBpbnQgbWNocDIzazI1Nl93cml0ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90
IHRvLCBzaXplX3QgbGVuLAo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCWlm
IChyZXRsZW4gJiYgbWVzc2FnZS5hY3R1YWxfbGVuZ3RoID4gc2l6ZW9mKGNvbW1hbmQpKQo+IC0J
CSpyZXRsZW4gKz0gbWVzc2FnZS5hY3R1YWxfbGVuZ3RoIC0gc2l6ZW9mKGNvbW1hbmQpOwo+ICsJ
aWYgKHJldGxlbiAmJiBtZXNzYWdlLmFjdHVhbF9sZW5ndGggPiBjbWRfbGVuKQo+ICsJCSpyZXRs
ZW4gKz0gbWVzc2FnZS5hY3R1YWxfbGVuZ3RoIC0gY21kX2xlbjsKPiAgCj4gIAlyZXR1cm4gMDsK
PiAgfQo+IEBAIC0xMDEsMTYgKzEwMywxOCBAQCBzdGF0aWMgaW50IG1jaHAyM2syNTZfcmVhZChz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHNpemVfdCBsZW4sCj4gIAlzdHJ1Y3Qg
c3BpX3RyYW5zZmVyIHRyYW5zZmVyWzJdID0ge307Cj4gIAlzdHJ1Y3Qgc3BpX21lc3NhZ2UgbWVz
c2FnZTsKPiAgCXVuc2lnbmVkIGNoYXIgY29tbWFuZFtNQVhfQ01EX1NJWkVdOwo+IC0JaW50IHJl
dDsKPiArCWludCByZXQsIGNtZF9sZW47Cj4gIAo+ICAJc3BpX21lc3NhZ2VfaW5pdCgmbWVzc2Fn
ZSk7Cj4gIAo+ICsJY21kX2xlbiA9IG1jaHAyM2syNTZfY21kc3ooZmxhc2gpOwo+ICsKPiAgCW1l
bXNldCgmdHJhbnNmZXIsIDAsIHNpemVvZih0cmFuc2ZlcikpOwo+ICAJY29tbWFuZFswXSA9IE1D
SFAyM0syNTZfQ01EX1JFQUQ7Cj4gIAltY2hwMjNrMjU2X2FkZHIyY21kKGZsYXNoLCBmcm9tLCBj
b21tYW5kKTsKPiAgCj4gIAl0cmFuc2ZlclswXS50eF9idWYgPSBjb21tYW5kOwo+IC0JdHJhbnNm
ZXJbMF0ubGVuID0gbWNocDIzazI1Nl9jbWRzeihmbGFzaCk7Cj4gKwl0cmFuc2ZlclswXS5sZW4g
PSBjbWRfbGVuOwo+ICAJc3BpX21lc3NhZ2VfYWRkX3RhaWwoJnRyYW5zZmVyWzBdLCAmbWVzc2Fn
ZSk7Cj4gIAo+ICAJdHJhbnNmZXJbMV0ucnhfYnVmID0gYnVmOwo+IEBAIC0xMjYsOCArMTMwLDgg
QEAgc3RhdGljIGludCBtY2hwMjNrMjU2X3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZf
dCBmcm9tLCBzaXplX3QgbGVuLAo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAt
CWlmIChyZXRsZW4gJiYgbWVzc2FnZS5hY3R1YWxfbGVuZ3RoID4gc2l6ZW9mKGNvbW1hbmQpKQo+
IC0JCSpyZXRsZW4gKz0gbWVzc2FnZS5hY3R1YWxfbGVuZ3RoIC0gc2l6ZW9mKGNvbW1hbmQpOwo+
ICsJaWYgKHJldGxlbiAmJiBtZXNzYWdlLmFjdHVhbF9sZW5ndGggPiBjbWRfbGVuKQo+ICsJCSpy
ZXRsZW4gKz0gbWVzc2FnZS5hY3R1YWxfbGVuZ3RoIC0gY21kX2xlbjsKPiAgCj4gIAlyZXR1cm4g
MDsKPiAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
