Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D18C7619F
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A803920801
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTznm+F2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A803920801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQ7zjd9t3NlfmYrJ3zl5wl9nHMggs/VLpnJath2V0Sc=; b=DTznm+F2l+1lb1
	tXTaz3ItiE1zS207ovuwgJ0L2ug1otd0KsyNXQvtCjRMYMHqfi8bKGksea3FMLgXheOkzs8hXqRaH
	1fE5QC3FjeGqO2v4Xz4SFd5k6lAKOqiSo7PfMa4X+pCSLxBTQ3J00kZhjd26wMv5j6oxavoJrHlbZ
	V9vn7ax2+FnhqhECwUkfFOppdRCEoJ3hupO7NfU4s7Xum+l8xR4IGwCM4rEd7Nhg6fsPSUUqw8v6k
	1fCgXpLkkdC6BykBu4c8RCf7FWKcBdfl077dsLoIWIFhlbRqfq3llBX2cYbedXlIedYYmjaBdQ2MN
	Lj2QWthdTfuvBg3QFTkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3eLs-0005a0-00; Mon, 17 Feb 2020 11:14:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3eLo-0005ZF-8q
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 11:14:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1CC2D29313C;
 Mon, 17 Feb 2020 11:14:06 +0000 (GMT)
Date: Mon, 17 Feb 2020 12:14:02 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish
 before writing a bad block marker
Message-ID: <20200217121402.44e00350@collabora.com>
In-Reply-To: <20200217113919.0508acc4@xps13>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-4-frieder.schrempf@kontron.de>
 <20200217113919.0508acc4@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_031408_578706_1C337258 
X-CRM114-Status: GOOD (  26.42  )
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
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Jeff Kletsky <git-commits@allycomm.com>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNyBGZWIgMjAyMCAxMTozOToxOSArMDEwMApNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSGkgRnJpZWRlciwKPiAKPiBTY2hyZW1wZiBG
cmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdyb3RlIG9uIFR1ZSwgMTEgRmVi
Cj4gMjAyMCAxNjozNTo1MyArMDAwMDoKPiAKPiA+IEZyb206IEZyaWVkZXIgU2NocmVtcGYgPGZy
aWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4KPiA+IAo+ID4gQ3VycmVudGx5IHdoZW4gbWFya2lu
ZyBhIGJsb2NrLCB3ZSB1c2Ugc3BpbmFuZF9lcmFzZV9vcCgpIHRvIGVyYXNlCj4gPiB0aGUgYmxv
Y2sgYmVmb3JlIHdyaXRpbmcgdGhlIG1hcmtlciB0byB0aGUgT09CIGFyZWEgd2l0aG91dCB3YWl0
aW5nCj4gPiBmb3IgdGhlIG9wZXJhdGlvbiB0byBzdWNjZWVkLiBUaGlzIGNhbiBsZWFkIHRvIHRo
ZSBtYXJraW5nIGZhaWxpbmcKPiA+IHNpbGVudGx5IGFuZCBubyBiYWQgYmxvY2sgbWFya2VyIGJl
aW5nIHdyaXR0ZW4gdG8gdGhlIGZsYXNoLgo+ID4gCj4gPiBUbyBmaXggdGhpcyB3ZSByZXVzZSB0
aGUgc3BpbmFuZF9lcmFzZSgpIGZ1bmN0aW9uLCB0aGF0IGFscmVhZHkgZG9lcwo+ID4gZXZlcnl0
aGluZyB3ZSBuZWVkIHRvIGRvIGJlZm9yZSBhY3R1YWxseSB3cml0aW5nIHRoZSBtYXJrZXIuCj4g
PiAgIAo+IAo+IFRoYW5rcyBhIGxvdCBmb3IgdGhpcyBzZXJpZXMhCj4gCj4gWWV0IEkgZG9uJ3Qg
cmVhbGx5IHVuZGVyc3RhbmQgdGhlIHBvaW50IG9mIHdhaXRpbmcgZm9yIHRoZSBlcmFzdXJlIGlm
Cj4gaXQgZmFpbGVkOiB3ZSBkb24ndCByZWFsbHkgY2FyZSBhcyBwcm9ncmFtbWluZyAoMSAtPiAw
KSBjZWxscyBpcyBhbHdheXMKPiBwb3NzaWJsZS4gQXJlIHlvdSBzdXJlIHRoaXMgbGVhZCB0byBh
biBlcnJvcj8KCkFjdHVhbGx5LCBJIHRoaW5rIEkgYWxyZWFkeSBwb2ludGVkIG91dCB0aGF0IHdl
IHNob3VsZCBwcm9iYWJseSB3cml0ZQp0aGUgQkJNIHdpdGhvdXQgZXJhc2luZyB0aGUgYmxvY2su
IElJUkMsIHRoaXMgbG9naWMgaGFzIGJlZW4gY29waWVkCmZyb20gcmF3bmFuZCB3aGVyZSBzb21l
IGNvbnRyb2xsZXJzIGRvbid0IGRpc2FibGUgdGhlIEVDQyBlbmdpbmUgd2hlbgpkb2luZyByYXcg
YWNjZXNzZXMsIGxlYWRpbmcgdG8gRUNDIGVycm9ycyBpZiB0aGUgYmxvY2sgaXMgbm90IGVyYXNl
ZApiZWZvcmUgQkJNcyBhcmUgcHJvZ3JhbW1lZC4gQXNzdW1pbmcgd2UgZG9uJ3QgbGV0IHN1Y2gg
ZHJpdmVycyBiZWluZwptZXJnZWQgaW4gc3BpbmFuZCwgdGhpcyBlcmFzZSBvcGVyYXRpb24gY2Fu
IGJlIGRyb3BwZWQuCgo+IAo+IEFsc28sIHdoeSBqdXN0IG5vdCBjYWxsaW5nIHNwaW5hbmRfZXJh
c2UoKSBpbnN0ZWFkIG9mCj4gc3BpbmFuZF9lcmFzZV9vcCgpIGZyb20gc3BpbmFuZF9tYXJrYmFk
KCk/Cj4gCj4gPiBGaXhlczogNzUyOWRmNDY1MjQ4ICgibXRkOiBuYW5kOiBBZGQgY29yZSBpbmZy
YXN0cnVjdHVyZSB0byBzdXBwb3J0IFNQSSBOQU5EcyIpCj4gPiBDYzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hy
ZW1wZkBrb250cm9uLmRlPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
IHwgNTYgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L2NvcmUuYwo+ID4gaW5kZXggOTI1ZGI2MjY5ODYxLi44YTY5ZDEzNjM5ZTIgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL25h
bmQvc3BpL2NvcmUuYwo+ID4gQEAgLTYwMCw2ICs2MDAsMzIgQEAgc3RhdGljIGludCBzcGluYW5k
X210ZF9ibG9ja19pc2JhZChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mZnMpCj4gPiAg
CXJldHVybiByZXQ7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgX19zcGluYW5kX2VyYXNl
KHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qgc3RydWN0IG5hbmRfcG9zICpwb3MsCj4g
PiArCQkJICAgYm9vbCBoYXJkX2ZhaWwpCgpJIGhhdGUgdGhvc2UgX18gcHJlZml4LiBQbGVhc2Ug
ZmluZCBhIG1vcmUgZGVzY3JpcHRpdmUgbmFtZQooc3BpbmFuZF9lcmFzZV9ibG9jaygpIG9yIHNw
aW5hbmRfZXJhc2VfYW5kX3dhaXQoKT8pCgo+ID4gK3sKPiA+ICsJc3RydWN0IHNwaW5hbmRfZGV2
aWNlICpzcGluYW5kID0gbmFuZF90b19zcGluYW5kKG5hbmQpOwo+ID4gKwl1OCBzdGF0dXM7Cj4g
PiArCWludCByZXQ7Cj4gPiArCj4gPiArCXJldCA9IHNwaW5hbmRfc2VsZWN0X3RhcmdldChzcGlu
YW5kLCBwb3MtPnRhcmdldCk7Cj4gPiArCWlmIChyZXQpCj4gPiArCQlyZXR1cm4gcmV0Owo+ID4g
Kwo+ID4gKwlyZXQgPSBzcGluYW5kX3dyaXRlX2VuYWJsZV9vcChzcGluYW5kKTsKPiA+ICsJaWYg
KHJldCkKPiA+ICsJCXJldHVybiByZXQ7Cj4gPiArCj4gPiArCXJldCA9IHNwaW5hbmRfZXJhc2Vf
b3Aoc3BpbmFuZCwgcG9zKTsKPiA+ICsJaWYgKHJldCAmJiBoYXJkX2ZhaWwpCj4gPiArCQlyZXR1
cm4gcmV0Owo+ID4gKwo+ID4gKwlyZXQgPSBzcGluYW5kX3dhaXQoc3BpbmFuZCwgJnN0YXR1cyk7
Cj4gPiArCWlmICghcmV0ICYmIChzdGF0dXMgJiBTVEFUVVNfRVJBU0VfRkFJTEVEKSkKPiA+ICsJ
CXJldCA9IC1FSU87Cj4gPiArCj4gPiArCXJldHVybiByZXQ7Cj4gPiArfQo+ID4gKwo+ID4gIHN0
YXRpYyBpbnQgc3BpbmFuZF9tYXJrYmFkKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwgY29uc3Qg
c3RydWN0IG5hbmRfcG9zICpwb3MpCj4gPiAgewo+ID4gIAlzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2Ug
KnNwaW5hbmQgPSBuYW5kX3RvX3NwaW5hbmQobmFuZCk7Cj4gPiBAQCAtNjE0LDE2ICs2NDAsMTAg
QEAgc3RhdGljIGludCBzcGluYW5kX21hcmtiYWQoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLCBj
b25zdCBzdHJ1Y3QgbmFuZF9wb3MgKnBvcykKPiA+ICAJaW50IHJldDsKPiA+ICAKPiA+ICAJLyog
RXJhc2UgYmxvY2sgYmVmb3JlIG1hcmtpbmcgaXQgYmFkLiAqLwo+ID4gLQlyZXQgPSBzcGluYW5k
X3NlbGVjdF90YXJnZXQoc3BpbmFuZCwgcG9zLT50YXJnZXQpOwo+ID4gLQlpZiAocmV0KQo+ID4g
LQkJcmV0dXJuIHJldDsKPiA+IC0KPiA+IC0JcmV0ID0gc3BpbmFuZF93cml0ZV9lbmFibGVfb3Ao
c3BpbmFuZCk7Cj4gPiArCXJldCA9IF9fc3BpbmFuZF9lcmFzZShuYW5kLCBwb3MsIGZhbHNlKTsK
PiA+ICAJaWYgKHJldCkKPiA+ICAJCXJldHVybiByZXQ7Cj4gPiAgCj4gPiAtCXNwaW5hbmRfZXJh
c2Vfb3Aoc3BpbmFuZCwgcG9zKTsKPiA+IC0KPiA+ICAJcmV0dXJuIHNwaW5hbmRfd3JpdGVfcGFn
ZShzcGluYW5kLCAmcmVxKTsKPiA+ICB9Cj4gPiAgCj4gPiBAQCAtNjQ0LDI3ICs2NjQsNyBAQCBz
dGF0aWMgaW50IHNwaW5hbmRfbXRkX2Jsb2NrX21hcmtiYWQoc3RydWN0IG10ZF9pbmZvICptdGQs
IGxvZmZfdCBvZmZzKQo+ID4gIAo+ID4gIHN0YXRpYyBpbnQgc3BpbmFuZF9lcmFzZShzdHJ1Y3Qg
bmFuZF9kZXZpY2UgKm5hbmQsIGNvbnN0IHN0cnVjdCBuYW5kX3BvcyAqcG9zKQo+ID4gIHsKPiA+
IC0Jc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kID0gbmFuZF90b19zcGluYW5kKG5hbmQp
Owo+ID4gLQl1OCBzdGF0dXM7Cj4gPiAtCWludCByZXQ7Cj4gPiAtCj4gPiAtCXJldCA9IHNwaW5h
bmRfc2VsZWN0X3RhcmdldChzcGluYW5kLCBwb3MtPnRhcmdldCk7Cj4gPiAtCWlmIChyZXQpCj4g
PiAtCQlyZXR1cm4gcmV0Owo+ID4gLQo+ID4gLQlyZXQgPSBzcGluYW5kX3dyaXRlX2VuYWJsZV9v
cChzcGluYW5kKTsKPiA+IC0JaWYgKHJldCkKPiA+IC0JCXJldHVybiByZXQ7Cj4gPiAtCj4gPiAt
CXJldCA9IHNwaW5hbmRfZXJhc2Vfb3Aoc3BpbmFuZCwgcG9zKTsKPiA+IC0JaWYgKHJldCkKPiA+
IC0JCXJldHVybiByZXQ7Cj4gPiAtCj4gPiAtCXJldCA9IHNwaW5hbmRfd2FpdChzcGluYW5kLCAm
c3RhdHVzKTsKPiA+IC0JaWYgKCFyZXQgJiYgKHN0YXR1cyAmIFNUQVRVU19FUkFTRV9GQUlMRUQp
KQo+ID4gLQkJcmV0ID0gLUVJTzsKPiA+IC0KPiA+IC0JcmV0dXJuIHJldDsKPiA+ICsJcmV0dXJu
IF9fc3BpbmFuZF9lcmFzZShuYW5kLCBwb3MsIHRydWUpOwo+ID4gIH0KPiA+ICAKPiA+ICBzdGF0
aWMgaW50IHNwaW5hbmRfbXRkX2VyYXNlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCAgCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
