Return-Path: <SRS0=FkjY=TK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8F4C04A6B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 07:45:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08F22173B
	for <linux-mtd@archiver.kernel.org>; Fri, 10 May 2019 07:45:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNBxkwOk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08F22173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aOl2tQekQP5oeLMD7njHLJ0AbZB4jSjGUJMAxpQzXA=; b=sNBxkwOkVDg2tA
	JVVhWqoDiN1Kunh53cceGXsnJ+Z+v4P1rnDL+djNJvcwLNhqKBkUMl4uysm7SjeJSBXs1oVyXxA7c
	2dk7qzq8blA1IR0P8OEqwcgnU/X+OJBvsp2bkhBBKSkQ2CBeHuA2FCubznmUhjzu/S79UFauy1e0r
	AMbrtr0dScpV1tap3FuW0jAB+vSvOw+TBwpOY3sc0uU0NPBXJHGHIgWQWRMa0+NVPZuDkeH7uM1Be
	4NCAVk48v99K0EFVBE2+yC93R5tO6IIsEDtjHbka2OGtTtw29T+fgkRYeidQY81stSskMs/r2pBMT
	HlQNmGm9PA3Fdmc2+mSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP0Dx-0006EL-FC; Fri, 10 May 2019 07:45:45 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP0Du-0006DX-8W
 for linux-mtd@lists.infradead.org; Fri, 10 May 2019 07:45:44 +0000
X-Originating-IP: 90.88.28.253
Received: from xps13 (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr
 [90.88.28.253]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 300EF2000F;
 Fri, 10 May 2019 07:45:29 +0000 (UTC)
Date: Fri, 10 May 2019 09:45:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v1] mtd: rawnand: Add Macronix NAND read retry support
Message-ID: <20190510094528.6008e8da@xps13>
In-Reply-To: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
References: <1557474062-4949-1-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_004542_606277_D0FDC897 
X-CRM114-Status: GOOD (  21.42  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
RnJpLCAxMCBNYXkgMjAxOSAxNTo0MTowMgorMDgwMDoKCj4gQWRkIGEgZHJpdmVyIGZvciBNYWNy
b25peCBOQU5EIHJlYWQgcmV0cnkuCgoiQWRkIHN1cHBvcnQgZm9yIE1hY3Jvbml4IE5BTkQgcmVh
ZCByZXRyeS4iPyBUaGlzIGlzIG5vdCBhICJuZXcgZHJpdmVyIi4KCj4gCj4gTWFjcm9uaXggTkFO
RCBzdXBwb3J0cyBzcGVjZmljYWwgcmVhZCBmb3IgZGF0YSByZWNvdmVyeSBhbmQgZW5hYmxlZAoK
Ck1hY3Jvbml4IE5BTkRzIHN1cHBvcnQgc3BlY2lmaWMgcmVhZCBvcGVyYXRpb24gZm9yIGRhdGEg
cmVjb3ZlcnksCndoaWNoIGNhbiBiZSBlbmFibGVkIHdpdGggYSBTRVRfRkVBVFVSRS4KCj4gRHJp
dmVyIGNoZWNrIGJ5dGUgMTY3IG9mIFZlbmRvciBCbG9ja3MgaW4gT05GSSBwYXJhbWV0ZXIgcGFn
ZSB0YWJsZQoKICAgICAgICAgY2hlY2tzCgo+IHRvIHNlZSBpZiB0aGlzIGhpZ2ggcmVsaWFiaWxp
dHkgZnVuY3Rpb24gaXMgc3VwcG9ydCBvciBub3QuCgogICAgICAgICAgICAgICAgIGhpZ2gtcmVs
aWFiaWxpdHkgZnVuY3Rpb24/IG5vdCBzdXJlIGl0IGlzIEVuZ2xpc2gKICAgICAgICAgICAgICAg
ICBhbnl3YXkuCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3VwcG9ydGVkCgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hc29uIFlhbmcgPG1hc29uY2N5YW5nQG14
aWMuY29tLnR3Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jvbml4LmMg
fCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDUyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5j
Cj4gaW5kZXggNDdkOGNkYS4uNWNkMWU1ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9uYW5kX21hY3Jvbml4LmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21h
Y3Jvbml4LmMKPiBAQCAtMTcsNiArMTcsNTcgQEAKPiAgCj4gICNpbmNsdWRlICJpbnRlcm5hbHMu
aCIKPiAgCj4gKyNkZWZpbmUgTUFDUk9OSVhfUkVBRF9SRVRSWV9CSVQgQklUKDApCj4gKyNkZWZp
bmUgTUFDUk9OSVhfUkVBRF9SRVRSWV9NT0RFIDUKPiArCj4gK3N0cnVjdCBuYW5kX29uZmlfdmVu
ZG9yX21hY3Jvbml4IHsKPiArCXU4IHJlc2VydmVkWzFdOwo+ICsJdTggcmVsaWFiaWxpdHlfZnVu
YzsKPiArfSBfX3BhY2tlZDsKPiArCj4gK3N0YXRpYyBpbnQgbWFjcm9uaXhfbmFuZF9zZXR1cF9y
ZWFkX3JldHJ5KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBtb2RlKQo+ICt7Cj4gKwl1OCBm
ZWF0dXJlW09ORklfU1VCRkVBVFVSRV9QQVJBTV9MRU5dID0gezB9OwoKICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAgaXMgbm90IG5lZWRlZCBoZXJlCgo+
ICsJaW50IHJldDsKPiArCj4gKwlpZiAobW9kZSA+IE1BQ1JPTklYX1JFQURfUkVUUllfTU9ERSkK
PiArCQltb2RlID0gTUFDUk9OSVhfUkVBRF9SRVRSWV9NT0RFOwo+ICsKPiArCWZlYXR1cmVbMF0g
PSBtb2RlOwo+ICsJcmV0ID0gIG5hbmRfc2V0X2ZlYXR1cmVzKGNoaXAsIE9ORklfRkVBVFVSRV9B
RERSX1JFQURfUkVUUlksIGZlYXR1cmUpOwoKRG9uJ3QgeW91IG1pc3MgdG8gc2VsZWN0L2Rlc2Vs
ZWN0IHRoZSB0YXJnZXQ/Cgo+ICsJaWYgKHJldCkKPiArCQlwcl9lcnIoInNldCBmZWF0dXJlIGZh
aWxlZCB0byByZWFkIHJldHJ5IG1vZGVkOiVkXG4iLCBtb2RlKTsKCiAgICAgICAgICAgICAgICAg
ICAgICAgIkZhaWxlZCB0byBzZXQgcmVhZCByZXRyeSBtb2RlOiAlZFxuIgoKSSB0aGluayB5b3Ug
Y2FuIGFib3J0IHRoZSBvcGVyYXRpb24gd2l0aCBhIG5lZ2F0aXZlIHJldHVybiBjb2RlIGluIHRo
aXMKY2FzZS4KCj4gKwo+ICsJcmV0ID0gIG5hbmRfZ2V0X2ZlYXR1cmVzKGNoaXAsIE9ORklfRkVB
VFVSRV9BRERSX1JFQURfUkVUUlksIGZlYXR1cmUpOwoKSWYgdGhlIG9wZXJhdGlvbiBzdWNjZWVk
ZWQgYnV0IHRoZSBjb250cm9sbGVyIGNhbm5vdCBnZXQgdGhlIGZlYXR1cmUKeW91IGRvbid0IHdh
bnQgdG8gYWJvcnQgdGhlIG9wZXJhdGlvbi4gWW91IHNob3VsZCBjaGVjayBpZiBnZXRfZmVhdHVy
ZXMKaXMgc3VwcG9ydGVkLCBpZiB5ZXMgeW91IGNhbiByZWx5IG9uIHRoZSBiZWxvdyB0ZXN0LgoK
PiArCWlmIChyZXQgfHwgZmVhdHVyZVswXSAhPSBtb2RlKQo+ICsJCXByX2VycigiZ2V0IGZlYXR1
cmUgZmFpbGVkIHRvIHJlYWQgcmV0cnkgbW9kZWQ6JWQoJWQpXG4iLAo+ICsJCSAgICAgICBtb2Rl
LCBmZWF0dXJlWzBdKTsKCiAgICAgICAgICAgICAgICAgICAgICAgIkZhaWxlZCB0byB2ZXJpZnkg
cmVhZCByZXRyeSBtb2RlLi4uIgoKICAgICAgICAgICAgICAgIEFsc28gcmV0dXJuIHNvbWV0aGlu
ZyBuZWdhdGl2ZSBoZXJlLgoKPiArCj4gKwlyZXR1cm4gcmV0OwoKQW5kIGlmIGFsbCB3ZW50IHJp
Z2h0LCByZXR1cm4gMCBhdCB0aGUgZW5kLgoKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgbWFjcm9u
aXhfbmFuZF9vbmZpX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+ICsJc3RydWN0
IG5hbmRfcGFyYW1ldGVycyAqcCA9ICZjaGlwLT5wYXJhbWV0ZXJzOwo+ICsKPiArCWlmIChwLT5v
bmZpKSB7Cj4gKwkJc3RydWN0IG5hbmRfb25maV92ZW5kb3JfbWFjcm9uaXggKm14aWMgPQo+ICsJ
CQkJKHZvaWQgKilwLT5vbmZpLT52ZW5kb3I7CgpQbGVhc2UgcHV0IGV2ZXJ5dGhpbmcgb24gdGhl
IHNhbWUgbGluZQoKPiArCj4gKwkJaWYgKG14aWMtPnJlbGlhYmlsaXR5X2Z1bmMgJiBNQUNST05J
WF9SRUFEX1JFVFJZX0JJVCkgewo+ICsJCQljaGlwLT5yZWFkX3JldHJpZXMgPSBNQUNST05JWF9S
RUFEX1JFVFJZX01PREUgKyAxOwoKV2h5ICsxIGhlcmUsIEkgYW0gbWlzc2luZyBzb21ldGhpbmc/
Cgo+ICsJCQljaGlwLT5zZXR1cF9yZWFkX3JldHJ5ID0KPiArCQkJCSBtYWNyb25peF9uYW5kX3Nl
dHVwX3JlYWRfcmV0cnk7Cj4gKwkJCWlmIChwLT5zdXBwb3J0c19zZXRfZ2V0X2ZlYXR1cmVzKSB7
Cj4gKwkJCQlzZXRfYml0KE9ORklfRkVBVFVSRV9BRERSX1JFQURfUkVUUlksCj4gKwkJCQkJcC0+
c2V0X2ZlYXR1cmVfbGlzdCk7Cj4gKwkJCQlzZXRfYml0KE9ORklfRkVBVFVSRV9BRERSX1JFQURf
UkVUUlksCj4gKwkJCQkJcC0+Z2V0X2ZlYXR1cmVfbGlzdCk7CgpQbGVhc2UgdXNlIGJpdG1hcF9z
ZXQoKQoKPiArCQkJfQo+ICsJCX0KPiArCX0KPiArfQo+ICsKPiAgLyoKPiAgICogTWFjcm9uaXgg
QUMgc2VyaWVzIGRvZXMgbm90IHN1cHBvcnQgdXNpbmcgU0VUL0dFVF9GRUFUVVJFUyB0byBjaGFu
Z2UKPiAgICogdGhlIHRpbWluZ3MgdW5saWtlIHdoYXQgaXMgZGVjbGFyZWQgaW4gdGhlIHBhcmFt
ZXRlciBwYWdlLiBVbmZsYWcKPiBAQCAtNjUsNiArMTE2LDcgQEAgc3RhdGljIGludCBtYWNyb25p
eF9uYW5kX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCQljaGlwLT5iYnRfb3B0aW9u
cyB8PSBOQU5EX0JCVF9TQ0FOMk5EUEFHRTsKPiAgCj4gIAltYWNyb25peF9uYW5kX2ZpeF9icm9r
ZW5fZ2V0X3RpbWluZ3MoY2hpcCk7Cj4gKwltYWNyb25peF9uYW5kX29uZmlfaW5pdChjaGlwKTsK
PiAgCj4gIAlyZXR1cm4gMDsKPiAgfQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
