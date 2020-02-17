Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346E8C35254
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 10:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06DE7206F4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 10:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZY/17EqR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06DE7206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJZRPvkp0hysowrz944z2BEbIhjU08WhVIB/oAiwp2g=; b=ZY/17EqRZyixJp
	9+kyf14YhOjQr7PuOvD+e3muvmWuvTYv94wJxowcly6pJZRdmxhP58ATUDSonYjviH2ASwotrqdm+
	Ehyr9F9WPnQQh1MQAHLmuJkGxaTqmAJXRtIoytQGujL70SwW3oQDAL1C9Iv187XbSOaY4D6d3wd5O
	/BC8ynCr+e+sHET6iTTUjzx2JxFA25c3BpeaiKQoFX7304lX+x7xobTTTDxAxHgkGCCyOJiJScGjX
	QC0SlPzJDfDbqyGtSM0/uei610OVHhrGT1rO+A2pHOTKCyKzSubKcV82ASdNRjBfB7Njdqh604ZYB
	iwRcAemOtEKyNmy59JYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3doV-000785-9a; Mon, 17 Feb 2020 10:39:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3doQ-000775-87
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 10:39:40 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9E731100019;
 Mon, 17 Feb 2020 10:39:20 +0000 (UTC)
Date: Mon, 17 Feb 2020 11:39:19 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish
 before writing a bad block marker
Message-ID: <20200217113919.0508acc4@xps13>
In-Reply-To: <20200211163452.25442-4-frieder.schrempf@kontron.de>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-4-frieder.schrempf@kontron.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_023938_565760_EF99DF29 
X-CRM114-Status: GOOD (  19.28  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeff Kletsky <git-commits@allycomm.com>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgRnJpZWRlciwKClNjaHJlbXBmIEZyaWVkZXIgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5k
ZT4gd3JvdGUgb24gVHVlLCAxMSBGZWIKMjAyMCAxNjozNTo1MyArMDAwMDoKCj4gRnJvbTogRnJp
ZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+IAo+IEN1cnJlbnRs
eSB3aGVuIG1hcmtpbmcgYSBibG9jaywgd2UgdXNlIHNwaW5hbmRfZXJhc2Vfb3AoKSB0byBlcmFz
ZQo+IHRoZSBibG9jayBiZWZvcmUgd3JpdGluZyB0aGUgbWFya2VyIHRvIHRoZSBPT0IgYXJlYSB3
aXRob3V0IHdhaXRpbmcKPiBmb3IgdGhlIG9wZXJhdGlvbiB0byBzdWNjZWVkLiBUaGlzIGNhbiBs
ZWFkIHRvIHRoZSBtYXJraW5nIGZhaWxpbmcKPiBzaWxlbnRseSBhbmQgbm8gYmFkIGJsb2NrIG1h
cmtlciBiZWluZyB3cml0dGVuIHRvIHRoZSBmbGFzaC4KPiAKPiBUbyBmaXggdGhpcyB3ZSByZXVz
ZSB0aGUgc3BpbmFuZF9lcmFzZSgpIGZ1bmN0aW9uLCB0aGF0IGFscmVhZHkgZG9lcwo+IGV2ZXJ5
dGhpbmcgd2UgbmVlZCB0byBkbyBiZWZvcmUgYWN0dWFsbHkgd3JpdGluZyB0aGUgbWFya2VyLgo+
IAoKVGhhbmtzIGEgbG90IGZvciB0aGlzIHNlcmllcyEKCllldCBJIGRvbid0IHJlYWxseSB1bmRl
cnN0YW5kIHRoZSBwb2ludCBvZiB3YWl0aW5nIGZvciB0aGUgZXJhc3VyZSBpZgppdCBmYWlsZWQ6
IHdlIGRvbid0IHJlYWxseSBjYXJlIGFzIHByb2dyYW1taW5nICgxIC0+IDApIGNlbGxzIGlzIGFs
d2F5cwpwb3NzaWJsZS4gQXJlIHlvdSBzdXJlIHRoaXMgbGVhZCB0byBhbiBlcnJvcj8KCkFsc28s
IHdoeSBqdXN0IG5vdCBjYWxsaW5nIHNwaW5hbmRfZXJhc2UoKSBpbnN0ZWFkIG9mCnNwaW5hbmRf
ZXJhc2Vfb3AoKSBmcm9tIHNwaW5hbmRfbWFya2JhZCgpPwoKPiBGaXhlczogNzUyOWRmNDY1MjQ4
ICgibXRkOiBuYW5kOiBBZGQgY29yZSBpbmZyYXN0cnVjdHVyZSB0byBzdXBwb3J0IFNQSSBOQU5E
cyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBGcmllZGVy
IFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+Cj4gLS0tCj4gIGRyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYyB8IDU2ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJz
L210ZC9uYW5kL3NwaS9jb3JlLmMKPiBpbmRleCA5MjVkYjYyNjk4NjEuLjhhNjlkMTM2MzllMiAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtNjAwLDYgKzYwMCwzMiBAQCBzdGF0aWMgaW50IHNw
aW5hbmRfbXRkX2Jsb2NrX2lzYmFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZmcykK
PiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gK3N0YXRpYyBpbnQgX19zcGluYW5kX2VyYXNlKHN0
cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5hbmRfcG9zICpwb3MsCj4gKwkJ
CSAgIGJvb2wgaGFyZF9mYWlsKQo+ICt7Cj4gKwlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5h
bmQgPSBuYW5kX3RvX3NwaW5hbmQobmFuZCk7Cj4gKwl1OCBzdGF0dXM7Cj4gKwlpbnQgcmV0Owo+
ICsKPiArCXJldCA9IHNwaW5hbmRfc2VsZWN0X3RhcmdldChzcGluYW5kLCBwb3MtPnRhcmdldCk7
Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcmV0ID0gc3BpbmFuZF93cml0
ZV9lbmFibGVfb3Aoc3BpbmFuZCk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+
ICsJcmV0ID0gc3BpbmFuZF9lcmFzZV9vcChzcGluYW5kLCBwb3MpOwo+ICsJaWYgKHJldCAmJiBo
YXJkX2ZhaWwpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXQgPSBzcGluYW5kX3dhaXQoc3Bp
bmFuZCwgJnN0YXR1cyk7Cj4gKwlpZiAoIXJldCAmJiAoc3RhdHVzICYgU1RBVFVTX0VSQVNFX0ZB
SUxFRCkpCj4gKwkJcmV0ID0gLUVJTzsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICBz
dGF0aWMgaW50IHNwaW5hbmRfbWFya2JhZChzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQsIGNvbnN0
IHN0cnVjdCBuYW5kX3BvcyAqcG9zKQo+ICB7Cj4gIAlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNw
aW5hbmQgPSBuYW5kX3RvX3NwaW5hbmQobmFuZCk7Cj4gQEAgLTYxNCwxNiArNjQwLDEwIEBAIHN0
YXRpYyBpbnQgc3BpbmFuZF9tYXJrYmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qg
c3RydWN0IG5hbmRfcG9zICpwb3MpCj4gIAlpbnQgcmV0Owo+ICAKPiAgCS8qIEVyYXNlIGJsb2Nr
IGJlZm9yZSBtYXJraW5nIGl0IGJhZC4gKi8KPiAtCXJldCA9IHNwaW5hbmRfc2VsZWN0X3Rhcmdl
dChzcGluYW5kLCBwb3MtPnRhcmdldCk7Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4g
LQo+IC0JcmV0ID0gc3BpbmFuZF93cml0ZV9lbmFibGVfb3Aoc3BpbmFuZCk7Cj4gKwlyZXQgPSBf
X3NwaW5hbmRfZXJhc2UobmFuZCwgcG9zLCBmYWxzZSk7Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVy
biByZXQ7Cj4gIAo+IC0Jc3BpbmFuZF9lcmFzZV9vcChzcGluYW5kLCBwb3MpOwo+IC0KPiAgCXJl
dHVybiBzcGluYW5kX3dyaXRlX3BhZ2Uoc3BpbmFuZCwgJnJlcSk7Cj4gIH0KPiAgCj4gQEAgLTY0
NCwyNyArNjY0LDcgQEAgc3RhdGljIGludCBzcGluYW5kX210ZF9ibG9ja19tYXJrYmFkKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZmcykKPiAgCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9l
cmFzZShzdHJ1Y3QgbmFuZF9kZXZpY2UgKm5hbmQsIGNvbnN0IHN0cnVjdCBuYW5kX3BvcyAqcG9z
KQo+ICB7Cj4gLQlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQgPSBuYW5kX3RvX3NwaW5h
bmQobmFuZCk7Cj4gLQl1OCBzdGF0dXM7Cj4gLQlpbnQgcmV0Owo+IC0KPiAtCXJldCA9IHNwaW5h
bmRfc2VsZWN0X3RhcmdldChzcGluYW5kLCBwb3MtPnRhcmdldCk7Cj4gLQlpZiAocmV0KQo+IC0J
CXJldHVybiByZXQ7Cj4gLQo+IC0JcmV0ID0gc3BpbmFuZF93cml0ZV9lbmFibGVfb3Aoc3BpbmFu
ZCk7Cj4gLQlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gLQo+IC0JcmV0ID0gc3BpbmFuZF9l
cmFzZV9vcChzcGluYW5kLCBwb3MpOwo+IC0JaWYgKHJldCkKPiAtCQlyZXR1cm4gcmV0Owo+IC0K
PiAtCXJldCA9IHNwaW5hbmRfd2FpdChzcGluYW5kLCAmc3RhdHVzKTsKPiAtCWlmICghcmV0ICYm
IChzdGF0dXMgJiBTVEFUVVNfRVJBU0VfRkFJTEVEKSkKPiAtCQlyZXQgPSAtRUlPOwo+IC0KPiAt
CXJldHVybiByZXQ7Cj4gKwlyZXR1cm4gX19zcGluYW5kX2VyYXNlKG5hbmQsIHBvcywgdHJ1ZSk7
Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQgc3BpbmFuZF9tdGRfZXJhc2Uoc3RydWN0IG10ZF9pbmZv
ICptdGQsCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
