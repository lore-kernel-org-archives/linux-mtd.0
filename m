Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48234C282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D9D12067D
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 16:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gyTgcKS0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D9D12067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRCk3GrFzOAV5uZqPlXMeaVRQG5UegUhOqti6D7BeBQ=; b=gyTgcKS0ElFm7W
	n8a+GlCncR6VyM2/07aozQ+UM6doqGkp/KvtMUG+yN+/wcJN++QqNYB6qQg0ilIpd4pJ7wVEN5pRc
	p4/b/hfoPBIzpxYzmBAK0vntSqor1YPZtZnFn97eCdehz2l4uwb21onlDtfDj2wEx2oDsKFF6Idl2
	gHSrYb3u2TKVEQtwtfQmRWtGzdSwaZdIixnyoc7mceY57ZhoDJM5KFnHKJ8ZCabvl8WLki6dcYsYF
	zy1nn+SwFgHhThbQZmnOV8z5M3FxMuR8NgyidWlSR+6pLzs7dX5SX4b4a74b3aaz/bLBFf9pgTNA/
	T6XxGd3yi7aWSbKIEaWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipafl-0005C9-6d; Thu, 09 Jan 2020 16:28:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipafV-0004tK-El
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 16:28:23 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3718220011;
 Thu,  9 Jan 2020 16:28:17 +0000 (UTC)
Date: Thu, 9 Jan 2020 17:28:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add support for Macronix NAND
 randomizer
Message-ID: <20200109172816.6c1d7be7@xps13>
In-Reply-To: <1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
 <1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_082821_809862_7743A581 
X-CRM114-Status: GOOD (  17.67  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
VGh1LCAyNCBPY3QgMjAxOSAxNTo0MDowNgorMDgwMDoKCj4gTWFjcm9uaXggTkFORHMgc3VwcG9y
dCByYW5kb21pemVyIG9wZXJhdGlvbiBmb3IgdXNlciBkYXRhIHNjcmFtYmxlZCwKPiB3aGljaCBj
YW4gYmUgZW5hYmxlZCB3aXRoIGEgU0VUX0ZFQVRVUkUuCj4gCj4gVXNlciBkYXRhIHdyaXR0ZW4g
dG8gdGhlIE5BTkQgZGV2aWNlIHdpdGhvdXQgcmFuZG9taXplciBpcyBzdGlsbCByZWFkYWJsZQo+
IGFmdGVyIHJhbmRvbWl6ZXIgZnVuY3Rpb24gZW5hYmxlZC4KPiBUaGUgcGVuYWx0eSBvZiByYW5k
b21pemVyIGFyZSBzdWJwYWdlIGFjY2Vzc2VzIHByb2hpYml0ZWQgYW5kIG1vcmUgdGltZQo+IHBl
cmlvZCBpcyBuZWVkZWQgaW4gcHJvZ3JhbSBvcGVyYXRpb24gYW5kIGVudGVyaW5nIGRlZXAgcG93
ZXItZG93biBtb2RlLgo+IGkuZS4sIHRQUk9HIDMwMHVzIHRvIDM0MHVzKHJhbmRvbWl6ZXIgZW5h
YmxlZCkKPiAKPiBGb3IgbW9yZSBoaWdoLXJlbGlhYmlsaXR5IGNvbmNlcm4sIGlmIHN1YnBhZ2Ug
d3JpdGUgbm90IGF2YWlsYWJsZSB3aXRoCj4gaGFyZHdhcmUgRUNDIGFuZCB0aGVuIHRvIGVuYWJs
ZSByYW5kb21pemVyIGlzIHJlY29tbWVuZGVkIGJ5IGRlZmF1bHQuCj4gRHJpdmVyIGNoZWNrcyBi
eXRlIDE2NyBvZiBWZW5kb3IgQmxvY2tzIGluIE9ORkkgcGFyYW1ldGVyIHBhZ2UgdGFibGUKPiB0
byBzZWUgaWYgdGhpcyBoaWdoLXJlbGlhYmlsaXR5IGZ1bmN0aW9uIGlzIHN1cHBvcnRlZC4gQnkg
YWRkaW5nIGEgbmV3Cj4gc3BlY2lmaWMgRFQgcHJvcGVydHkgaW4gY2hpbGRyZW4gbm9kZXMgdG8g
ZW5hYmxlIHJhbmRvbWl6ZXIgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzb24gWWFu
ZyA8bWFzb25jY3lhbmdAbXhpYy5jb20udHc+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfbWFjcm9uaXguYyB8IDY5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9uYW5kX21hY3Jvbml4LmMKPiBpbmRleCA1ODUxMWFlLi44OTEwMWZhIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+IEBAIC0xMSw2ICsxMSwxNCBAQAo+ICAjZGVmaW5l
IE1BQ1JPTklYX1JFQURfUkVUUllfQklUIEJJVCgwKQo+ICAjZGVmaW5lIE1BQ1JPTklYX05VTV9S
RUFEX1JFVFJZX01PREVTIDYKPiAgCj4gKyNkZWZpbmUgTUFDUk9OSVhfUkFORE9NSVpFUl9CSVQg
QklUKDEpCj4gKyNkZWZpbmUgT05GSV9GRUFUVVJFX0FERFJfTVhJQ19SQU5ET01JWkVSIDB4QjAK
PiArI2RlZmluZSBFTlBHTSBCSVQoMCkKPiArI2RlZmluZSBSQU5ERU4gQklUKDEpCj4gKyNkZWZp
bmUgUkFORE9QVCBCSVQoMikKPiArI2RlZmluZSBNQUNST05JWF9SQU5ET01JWkVSX01PREVfRU5U
RVIgKEVOUEdNIHwgUkFOREVOIHwgUkFORE9QVCkKPiArI2RlZmluZSBNQUNST05JWF9SQU5ET01J
WkVSX01PREVfRVhJVCAoUkFOREVOIHwgUkFORE9QVCkKPiArCj4gIHN0cnVjdCBuYW5kX29uZmlf
dmVuZG9yX21hY3Jvbml4IHsKPiAgCXU4IHJlc2VydmVkOwo+ICAJdTggcmVsaWFiaWxpdHlfZnVu
YzsKPiBAQCAtMjksMTUgKzM3LDc2IEBAIHN0YXRpYyBpbnQgbWFjcm9uaXhfbmFuZF9zZXR1cF9y
ZWFkX3JldHJ5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBtb2RlKQo+ICAJcmV0dXJuIG5h
bmRfc2V0X2ZlYXR1cmVzKGNoaXAsIE9ORklfRkVBVFVSRV9BRERSX1JFQURfUkVUUlksIGZlYXR1
cmUpOwo+ICB9Cj4gIAo+ICtzdGF0aWMgaW50IG1hY3Jvbml4X25hbmRfcmFuZG9taXplcl9jaGVj
a19lbmFibGUoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+ICsJdTggZmVhdHVyZVtPTkZJ
X1NVQkZFQVRVUkVfUEFSQU1fTEVOXTsKPiArCWludCByZXQ7Cj4gKwo+ICsJcmV0ID0gbmFuZF9n
ZXRfZmVhdHVyZXMoY2hpcCwgT05GSV9GRUFUVVJFX0FERFJfTVhJQ19SQU5ET01JWkVSLAo+ICsJ
CQkJZmVhdHVyZSk7Cj4gKwlpZiAocmV0IDwgMCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCWlm
IChmZWF0dXJlWzBdKQo+ICsJCXJldHVybiBmZWF0dXJlWzBdOwo+ICsKPiArCWZlYXR1cmVbMF0g
PSBNQUNST05JWF9SQU5ET01JWkVSX01PREVfRU5URVI7Cj4gKwlyZXQgPSBuYW5kX3NldF9mZWF0
dXJlcyhjaGlwLCBPTkZJX0ZFQVRVUkVfQUREUl9NWElDX1JBTkRPTUlaRVIsCj4gKwkJCQlmZWF0
dXJlKTsKPiArCWlmIChyZXQgPCAwKQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJLyogUkFOREVO
IGFuZCBSQU5ET1BUIE9UUCBiaXRzIGFyZSBwcm9ncmFtbWVkICovCj4gKwlmZWF0dXJlWzBdID0g
MHgwOwo+ICsJcmV0ID0gbmFuZF9wcm9nX3BhZ2Vfb3AoY2hpcCwgMCwgMCwgZmVhdHVyZSwgMSk7
Cj4gKwlpZiAocmV0IDwgMCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJldCA9IG5hbmRfZ2V0
X2ZlYXR1cmVzKGNoaXAsIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUkFORE9NSVpFUiwKPiArCQkJ
CWZlYXR1cmUpOwo+ICsJaWYgKHJldCA8IDApCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlmZWF0
dXJlWzBdICY9IE1BQ1JPTklYX1JBTkRPTUlaRVJfTU9ERV9FWElUOwo+ICsJcmV0ID0gbmFuZF9z
ZXRfZmVhdHVyZXMoY2hpcCwgT05GSV9GRUFUVVJFX0FERFJfTVhJQ19SQU5ET01JWkVSLAo+ICsJ
CQkJZmVhdHVyZSk7Cj4gKwlpZiAocmV0IDwgMCkKPiArCQlyZXR1cm4gcmV0Owo+ICsKPiArCXJl
dHVybiBmZWF0dXJlWzBdOwoKQ2FuIGZlYXR1cmVbMF0gYmUgIT0gMCA/IEkgZG9uJ3QgdGhpbmsg
c28sIGluIHRoaXMgY2FzZSBJIHByZWZlciBhOgpyZXR1cm4gMDsKCj4gK30KPiArCj4gIHN0YXRp
YyB2b2lkIG1hY3Jvbml4X25hbmRfb25maV9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4g
IHsKPiAgCXN0cnVjdCBuYW5kX3BhcmFtZXRlcnMgKnAgPSAmY2hpcC0+cGFyYW1ldGVyczsKPiAg
CXN0cnVjdCBuYW5kX29uZmlfdmVuZG9yX21hY3Jvbml4ICpteGljOwo+ICsJc3RydWN0IGRldmlj
ZV9ub2RlICpkbiA9IG5hbmRfZ2V0X2ZsYXNoX25vZGUoY2hpcCk7Cj4gKwlpbnQgcmFuZF9vdHAg
PSAwOwo+ICsJaW50IHJldDsKPiAgCj4gIAlpZiAoIXAtPm9uZmkpCj4gIAkJcmV0dXJuOwo+ICAK
PiArCWlmIChvZl9maW5kX3Byb3BlcnR5KGRuLCAibXhpYyxlbmFibGUtcmFuZG9taXplci1vdHAi
LCBOVUxMKSkKPiArCQlyYW5kX290cCA9IDE7Cj4gKwo+ICAJbXhpYyA9IChzdHJ1Y3QgbmFuZF9v
bmZpX3ZlbmRvcl9tYWNyb25peCAqKXAtPm9uZmktPnZlbmRvcjsKPiArCS8qIFN1YnBhZ2Ugd3Jp
dGUgaXMgcHJvaGliaXRlZCBpbiByYW5kb21pemVyIG9wZXJhdG9pbiAqLwoKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgd2l0aCAgICAgICAgICBvcGVyYXRpb24KCj4gKwlp
ZiAocmFuZF9vdHAgJiYgY2hpcC0+b3B0aW9ucyAmIE5BTkRfTk9fU1VCUEFHRV9XUklURSAmJgo+
ICsJICAgIG14aWMtPnJlbGlhYmlsaXR5X2Z1bmMgJiBNQUNST05JWF9SQU5ET01JWkVSX0JJVCkg
ewo+ICsJCWlmIChwLT5zdXBwb3J0c19zZXRfZ2V0X2ZlYXR1cmVzKSB7Cj4gKwkJCWJpdG1hcF9z
ZXQocC0+c2V0X2ZlYXR1cmVfbGlzdCwKPiArCQkJCSAgIE9ORklfRkVBVFVSRV9BRERSX01YSUNf
UkFORE9NSVpFUiwgMSk7Cj4gKwkJCWJpdG1hcF9zZXQocC0+Z2V0X2ZlYXR1cmVfbGlzdCwKPiAr
CQkJCSAgIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUkFORE9NSVpFUiwgMSk7Cj4gKwkJCXJldCA9
IG1hY3Jvbml4X25hbmRfcmFuZG9taXplcl9jaGVja19lbmFibGUoY2hpcCk7Cj4gKwkJCWlmIChy
ZXQgPCAwKQo+ICsJCQkJcHJfaW5mbygiTWFjcm9uaXggTkFORCByYW5kb21pemVyIGZhaWxlZFxu
Iik7Cj4gKwkJCWVsc2UKPiArCQkJCXByX2luZm8oIk1hY3Jvbml4IE5BTkQgcmFuZG9taXplciBl
bmFibGVkXG4iKTsKCk1heWJlIHdlIHNob3VsZCB1cGRhdGUgdGhlIGJpdG1hcHMgb25seSBpZiBp
dCBzdWNjZWVkcz8KCj4gKwkJfQo+ICsJfQo+ICsKPiAgCWlmICgobXhpYy0+cmVsaWFiaWxpdHlf
ZnVuYyAmIE1BQ1JPTklYX1JFQURfUkVUUllfQklUKSA9PSAwKQo+ICAJCXJldHVybjsKPiAgCgpX
aXRoIHRoZSBhYm92ZSBmaXhlZCwKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
