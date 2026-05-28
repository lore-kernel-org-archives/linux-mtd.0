Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1391ACD5BD5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rsvii7hWIbLQsPpwVbxzopR1/FZW9gJRHMZgaFQSIVc=; b=hHhJWPti5dFaFN
	iNml1Ycwp63oOHRRdn50JJLUM7WEanDUU/z6xVh2Ak6VNStNyYEpMfEag7xnp5jQHpcRztLII+IjN
	y63+5GcMOtnEr5GeEuTWGvf1FOvyv/4pZd89Xms2vDTbMS711h+9tMKypDLGJBH59OzmXm6tujmta
	XXKvYiOOUin2z1IaPLlvK1mi+owZGN6hRDRvnuPVwhC7PujEbTfRo3IKgDJJx6imdOto+9SdqzMv/
	uhI9N4A9bv+IG7Dz8bQlVOYCXvD7g79DjUsJKvYSEVQZZaz1+NrROik6CvYizo4Gg/cK06ASOJ17P
	idPXFG6YEdQhRr6uJ4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX1S-00000005V8e-1WEo;
	Thu, 28 May 2026 09:27:26 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSX1N-00000005V7p-0jQI
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 09:27:25 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B34B3C62447;
	Thu, 28 May 2026 09:27:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8669460495;
	Thu, 28 May 2026 09:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4677110888C99;
	Thu, 28 May 2026 11:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779960437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aFcPPmXLQabQsc1ycX/dsgPewGocQDCIFeeqSEgvr2A=;
	b=v7zUT13wBSF/FrDCrr/gSdvw1loLx4i9gR0SQTM1OV/1Re88co7SVpzbcDesEmczBWYGOm
	35VUfoUIGWVuqRWMNj07kQeYbKoop4ZL19mN4WUZCf1Xun3s5qpJ5mgxoSX13WIfPP+FkN
	KnBgQ3zi46Mw1jTRbvbeHx4uzrUEJV71e4UmowGcbsoRZPba2SAzIvNp52YnpJdHqdYQ6t
	dQqeJxLOgsFazm6351UmFSjRMiW0xgeR+lR39rnuGDbPUTgNgAD/wSpe7YtjKX0Q50wl9d
	/hefaXRUgr2UOro2MFwYNvcFQK5nv0KrwQ05j9Vw96cnU26nuMKZ7wtbwlD/dQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 11/13] mtd: spinand: run PHY tuning after init and
 update dirmap frequencies
In-Reply-To: <20260527175527.2247679-12-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:25 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-12-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 11:27:13 +0200
Message-ID: <87mrxjg9zi.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_022723_632771_DF4930D3 
X-CRM114-Status: GOOD (  20.07  )
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

SGkgU2FudGhvc2gsCgpPbiAyNy8wNS8yMDI2IGF0IDIzOjI1OjI1ICswNTMwLCBTYW50aG9zaCBL
dW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IFJ1biBzcGlfbWVtX2V4ZWN1dGVfdHVuaW5n
KCkgaW4gc3BpbmFuZF9wcm9iZSgpIGFmdGVyIHNwaW5hbmRfaW5pdCgpCj4gY29tcGxldGVzLiBU
aGUgcmVhZCBhbmQgd3JpdGUgb3AgdGVtcGxhdGVzIGFyZSBjb3BpZWQgaW50byBwZXJzaXN0ZW50
Cj4gZmllbGRzIGluIHNwaW5hbmRfZGV2aWNlIHNvIHRoZSBjb250cm9sbGVyIGNhbiB3cml0ZSB0
aGUgdmFsaWRhdGVkCj4gZnJlcXVlbmN5IGRpcmVjdGx5IGJhY2sgaW50byB0aGVtLiBPbiBzdWNj
ZXNzLCBwcm9wYWdhdGUgdGhhdCBmcmVxdWVuY3kKPiB0byBldmVyeSBkaXJtYXAncyBwcmltYXJ5
IGFuZCBzZWNvbmRhcnkgb3AgdGVtcGxhdGVzLiBVcGRhdGluZyB0aGUKPiBzZWNvbmRhcnkgdGVt
cGxhdGUgZW5zdXJlcyBjb250aW51b3VzLXJlYWQgZGlybWFwcyBhbHNvIGJlbmVmaXQgZnJvbQo+
IHRoZSB2YWxpZGF0ZWQgc3BlZWQsIG5vdCBqdXN0IHRoZSBwcmltYXJ5IHJlYWQgcGF0aC4KPgo+
IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggfCAgNCArKysrCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IGluZGV4
IGYxMDg0ZDVlMDRiOS4uOWI1NGU0NjA3Y2ZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IEBAIC0y
MDMwLDYgKzIwMzAsNDEgQEAgc3RhdGljIGludCBzcGluYW5kX3Byb2JlKHN0cnVjdCBzcGlfbWVt
ICptZW0pCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICsJLyoKPiArCSAqIENv
cHkgdGhlIHJlYWQgYW5kIHdyaXRlIG9wIHRlbXBsYXRlcyBpbnRvIHBlcnNpc3RlbnQgZmllbGRz
IHNvCj4gKwkgKiBleGVjdXRlX3R1bmluZyBjYW4gd3JpdGUgdGhlIHZhbGlkYXRlZCBmcmVxdWVu
Y3kgYmFjayBpbnRvIHRoZW0uCj4gKwkgKiBUdW5pbmcgZmFpbHVyZSBpcyBub24tZmF0YWw7IHRo
ZSBkZXZpY2Ugb3BlcmF0ZXMgYXQgYmFzZSBzcGVlZC4KPiArCSAqLwo+ICsJc3BpbmFuZC0+bWF4
X3JlYWRfb3AgPSAqc3BpbmFuZC0+b3BfdGVtcGxhdGVzLT5yZWFkX2NhY2hlOwo+ICsJc3BpbmFu
ZC0+bWF4X3dyaXRlX29wID0gKnNwaW5hbmQtPm9wX3RlbXBsYXRlcy0+d3JpdGVfY2FjaGU7Cj4g
Kwo+ICsJcmV0ID0gc3BpX21lbV9leGVjdXRlX3R1bmluZyhtZW0sICZzcGluYW5kLT5tYXhfcmVh
ZF9vcCwKPiArCQkJCSAgICAgJnNwaW5hbmQtPm1heF93cml0ZV9vcCk7Cj4gKwlpZiAocmV0ICYm
IHJldCAhPSAtRU9QTk9UU1VQUCkKPiArCQlkZXZfd2FybigmbWVtLT5zcGktPmRldiwgIkZhaWxl
ZCB0byBleGVjdXRlIFBIWSB0dW5pbmc6ICVkXG4iLAo+ICsJCQkgcmV0KTsKPiArCj4gKwkvKgo+
ICsJICogRGlybWFwcyB3ZXJlIHNldCB1cCBpbiBzcGluYW5kX2luaXQoKSBiZWZvcmUgdHVuaW5n
IHJhbjsgdXBkYXRlCj4gKwkgKiB0aGVpciBvcCB0ZW1wbGF0ZXMgdG8gdXNlIHRoZSB2YWxpZGF0
ZWQgZnJlcXVlbmN5Lgo+ICsJICovCj4gKwlpZiAoIXJldCkgewo+ICsJCXN0cnVjdCBuYW5kX2Rl
dmljZSAqbmFuZCA9IHNwaW5hbmRfdG9fbmFuZChzcGluYW5kKTsKPiArCQlpbnQgaTsKPiArCj4g
KwkJZm9yIChpID0gMDsgaSA8IG5hbmQtPm1lbW9yZy5wbGFuZXNfcGVyX2x1bjsgaSsrKSB7Cj4g
KwkJCWlmIChzcGluYW5kLT5kaXJtYXBzW2ldLnJkZXNjKSB7Cj4gKwkJCQlzcGluYW5kLT5kaXJt
YXBzW2ldLnJkZXNjLT5pbmZvLnByaW1hcnlfb3BfdG1wbC5tYXhfZnJlcSA9Cj4gKwkJCQkJc3Bp
bmFuZC0+bWF4X3JlYWRfb3AubWF4X2ZyZXE7Cj4gKwkJCQlzcGluYW5kLT5kaXJtYXBzW2ldLnJk
ZXNjLT5pbmZvLnNlY29uZGFyeV9vcF90bXBsLm1heF9mcmVxID0KPiArCQkJCQlzcGluYW5kLT5t
YXhfcmVhZF9vcC5tYXhfZnJlcTsKPiArCQkJfQo+ICsJCQlpZiAoc3BpbmFuZC0+ZGlybWFwc1tp
XS53ZGVzYykKPiArCQkJCXNwaW5hbmQtPmRpcm1hcHNbaV0ud2Rlc2MtPmluZm8ucHJpbWFyeV9v
cF90bXBsLm1heF9mcmVxID0KPiArCQkJCQlzcGluYW5kLT5tYXhfd3JpdGVfb3AubWF4X2ZyZXE7
Cj4gKwkJfQo+ICsJfQoKVW5mb3J0dW5hdGVseSwgaG90IGZpeGluZyB0aGUgZGlybWFwcyBpcyBp
bnZhbGlkLiBXaGVuIHdlIHRha2UgdGhlIGJlc3QKdmFyaWFudCwgd2Ugc2VsZWN0IGEgbWF4aW11
bSBzcGVlZCB0aGF0IG1heSBiZSBsb3dlciB0aGFuIHRoZSB0dW5lZCBQSFkKc3BlZWQuIFdlIGNh
bm5vdCBqdXN0IG92ZXJ3cml0ZSB0aGF0IHZhbHVlIHdpdGhvdXQgY29uc2VxdWVuY2UsIGJlY2F1
c2UKZGVwZW5kaW5nIG9uIHRoZSBib3VuZGFyaWVzIHdlIGNyb3NzLCBleHRyYSBkdW1teSBjeWNs
ZXMgbWF5IGJlCnJlcXVpcmVkLgoKSSBiZWxpZXZlIHNwaW5hbmRfc2VsZWN0X29wX3ZhcmlhbnQo
KSBzaGFsbCBiZSBhd2FyZSBvZiB0aGUgZGlmZmVyZW50CnBvc3NpYmxlIHNwZWVkcy4gSXQgc2hv
dWxkIGxvb2sgZm9yIHRoZSBtYXhfc3BlZWRfaHogY2FwYWJpbGl0eSBhbmQgbm90CmZvciB0aGUg
YmFzZV9zcGVlZF9oeiwgYW5kIGZhbGxiYWNrIHRvIGJhc2Vfc3BlZWRfaHogaW4gY2FzZSBvZgpp
c3N1ZS4KCk9yIG90aGVyd2lzZSwgbWF5YmUgd2UgY291bGQgZ28gdGhyb3VnaCB0aGUgd2hvbGUg
SS9PIHZhcmlhbnQKc2VsZWN0aW9uIGFnYWluIGFmdGVyIHR1bmluZywgd2l0aCB0aGUgYWN0dWFs
IG1heGltdW0gc3BlZWQgc2V0LgoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
