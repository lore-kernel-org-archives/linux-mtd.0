Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2776EC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:43:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71BE20675
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:43:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MujS9Hey"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E71BE20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wuZQNOkxVHyBsUfpDlBIJLPLH73qFPk2K1FldrXRxw=; b=MujS9Hey5+Z920
	AOgeaaWlTzSMphaHIeiaIWfwCD1y2IMAlRR0z4h1COH8Pb82xB76bF1KPED78G7B/WKRIBPo2KH2X
	PcFOp/FDOXcMictK93wp41XUjRsehiy2YuHEpeuOJoazzveDN5ARmF9px+aDhlYCBitpDCawhm/7T
	0UJ/EZxnN70ndBzpHT+brYMKSsibJ+CZJvYh6TFvAChnkCmtJ4Wg4c2XRnYzcTF5+Pmsqg4PHP7TN
	mo+2BTt+x+EVVCs/8s/L72O6A+DKj4g3MfNcXmCpnce6MB/HPYdKdbduHEbr4AKFMq5OtqWSe1ZBs
	5Rlvz9JWn0dWuTpJpdzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYBWp-0004jL-0x; Mon, 11 May 2020 16:43:43 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYBWl-0004iJ-4b
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 16:43:40 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5F4CC200003;
 Mon, 11 May 2020 16:43:34 +0000 (UTC)
Date: Mon, 11 May 2020 18:43:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v2] nand: brcmnand: correctly verify erased pages
Message-ID: <20200511184333.20d5a560@xps13>
In-Reply-To: <20200505082055.2843847-1-noltari@gmail.com>
References: <20200504092943.2739784-1-noltari@gmail.com>
 <20200505082055.2843847-1-noltari@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_094339_316035_ADAA1777 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIFR1ZSwgIDUgTWF5IDIwMjAKMTA6MjA6NTUgKzAyMDA6Cgo+IFRoZSBjdXJyZW50
IGNvZGUgY2hlY2tzIHRoYXQgdGhlIHdob2xlIE9PQiBhcmVhIGlzIGVyYXNlZC4KPiBUaGlzIGlz
IGEgcHJvYmxlbSB3aGVuIEpGRlMyIGNsZWFubWFya2VycyBhcmUgYWRkZWQgdG8gdGhlIE9PQiwg
c2luY2UgaXQgd2lsbAo+IGZhaWwgZHVlIHRvIHRoZSB1c2FibGUgT09CIGJ5dGVzIG5vdCBiZWlu
ZyAweGZmLgo+IENvcnJlY3QgdGhpcyBieSBvbmx5IGNoZWNraW5nIHRoYXQgdGhlIEVDQyBhcmVu
J3QgMHhmZi4KPiAKPiBGaXhlczogMDJiODhlZWE5ZjljICgibXRkOiBicmNtbmFuZDogQWRkIGNo
ZWNrIGZvciBlcmFzZWQgcGFnZSBiaXRmbGlwcyIpCj4gCgpUaGlzIGV4dHJhIHNwYWNlIGJldHdl
ZW4gdGhlIEZpeGVzIHRhZyBhbmQgeW91ciBTb0Igc2hvdWxkIGJlIHJlbW92ZWQKCj4gU2lnbmVk
LW9mZi1ieTogw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KPiAt
LS0KPiAgdjI6IEFkZCBGaXhlcyB0YWcKPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYyB8IDIyICsrKysrKysrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gaW5kZXggZTRlM2NlZWFjMzhmLi41NDZmMDgwN2I4
ODcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQu
Ywo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiBAQCAt
MjAxOCw2ICsyMDE4LDcgQEAgc3RhdGljIGludCBicmNtbmFuZF9yZWFkX2J5X3BpbyhzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgc3RhdGljIGludCBicmNt
c3RiX25hbmRfdmVyaWZ5X2VyYXNlZF9wYWdlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLAo+ICAJCSAg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwgdm9pZCAqYnVmLCB1NjQgYWRkcikKPiAgewo+ICsJc3Ry
dWN0IG10ZF9vb2JfcmVnaW9uIG9vYmVjYzsKPiAgCWludCBpLCBzYXM7Cj4gIAl2b2lkICpvb2Ig
PSBjaGlwLT5vb2JfcG9pOwo+ICAJaW50IGJpdGZsaXBzID0gMDsKPiBAQCAtMjAzNSwxMSArMjAz
NiwyNCBAQCBzdGF0aWMgaW50IGJyY21zdGJfbmFuZF92ZXJpZnlfZXJhc2VkX3BhZ2Uoc3RydWN0
IG10ZF9pbmZvICptdGQsCj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+IC0JZm9y
IChpID0gMDsgaSA8IGNoaXAtPmVjYy5zdGVwczsgaSsrLCBvb2IgKz0gc2FzKSB7Cj4gKwlmb3Ig
KGkgPSAwOyBpIDwgY2hpcC0+ZWNjLnN0ZXBzOyBpKyspIHsKPiAgCQllY2NfY2h1bmsgPSBidWYg
KyBjaGlwLT5lY2Muc2l6ZSAqIGk7Cj4gLQkJcmV0ID0gbmFuZF9jaGVja19lcmFzZWRfZWNjX2No
dW5rKGVjY19jaHVuaywKPiAtCQkJCQkJICBjaGlwLT5lY2Muc2l6ZSwKPiAtCQkJCQkJICBvb2Is
IHNhcywgTlVMTCwgMCwKPiArCj4gKwkJcmV0ID0gbmFuZF9jaGVja19lcmFzZWRfZWNjX2NodW5r
KGVjY19jaHVuaywgY2hpcC0+ZWNjLnNpemUsCj4gKwkJCQkJCSAgTlVMTCwgMCwgTlVMTCwgMCwK
PiArCQkJCQkJICBjaGlwLT5lY2Muc3RyZW5ndGgpOwo+ICsJCWlmIChyZXQgPCAwKQo+ICsJCQly
ZXR1cm4gcmV0Owo+ICsKPiArCQliaXRmbGlwcyA9IG1heChiaXRmbGlwcywgcmV0KTsKPiArCX0K
PiArCj4gKwlmb3IgKGkgPSAwOyBtdGQtPm9vYmxheW91dC0+ZWNjKG10ZCwgaSwgJm9vYmVjYykg
IT0gLUVSQU5HRTsgaSsrKQo+ICsJewo+ICsJCXJldCA9IG5hbmRfY2hlY2tfZXJhc2VkX2VjY19j
aHVuayhOVUxMLCAwLAo+ICsJCQkJCQkgIG9vYiArIG9vYmVjYy5vZmZzZXQsCj4gKwkJCQkJCSAg
b29iZWNjLmxlbmd0aCwKPiArCQkJCQkJICBOVUxMLCAwLAo+ICAJCQkJCQkgIGNoaXAtPmVjYy5z
dHJlbmd0aCk7Cj4gIAkJaWYgKHJldCA8IDApCj4gIAkJCXJldHVybiAKCklmIEkgdW5kZXJzdGFu
ZCBjb3JyZWN0bHksIHRoZSBjbGVhbm1hcmtlciBpcyBpbiB0aGUgImF2YWlsYWJsZSBPT0IKYXJl
YSIsIHdoaWNoIGlzIHNvbWV3aGVyZSBpbiB0aGUgT09CIGFyZWEgYmV0d2VlbiB0aGUgYmFkIGJs
b2NrIG1hcmtlcgphbmQgdGhlIEVDQyBieXRlcy4gSSB0aGluayB0aGF0IGNoZWNraW5nIHRoZSBk
YXRhIGJ1ZmZlciBhbmQgdGhlIEVDQwphcmVhIG9ubHkgaXMgZW5vdWdoIGFuZCB3ZSBjYW4gcHJv
YmFibHkgbGVhdmUgdGhlIHJlbWFpbmluZyBzcGFyZSBPT0IKYXJlYS4KCkJ1dCBpbnN0ZWFkIG9m
IGNhbGxpbmcgbmFuZF9jaGVja19lcmFzZWRfZWNjX2NodW5rIHR3aWNlLCBqdXN0IGNhbGw6Cgog
ICAgbmFuZF9jaGVja19lcmFzZWRfZWNjX2NodW5rKGRhdGEsIGRhdGFsZW4sIGVjYywgZWNjbGVu
LCBOVUxMLCAwLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cmVuZ3RoKTsgCgpB
bmQgYWxzbyBwbGVhc2UgY2xhcmlmeSB5b3VyIGNvbW1pdCBsb2c6IHlvdSBhcmUgbm90ICJqdXN0
IGNoZWNraW5nIHRoZQpFQ0MgYnl0ZXMiIGJ1dCB5b3UgYXJlIGNoZWNraW5nIGJvdGggdGhlIG1h
aW4gYXJlYSBhbmQgdGhlIEVDQyBieXRlcy4KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
