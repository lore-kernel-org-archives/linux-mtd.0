Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB4B606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 17:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CKvK+xmT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LiNpPB8r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SQbJjFquQbZqLFAsuuJC0W5aMUyjfNc7Pg3V2ZLyR9M=; b=CKvK+xmTxOhSAdaZYgfzG82kAj
	LJQ4OmXA8McGgE//c5dCII8x4GX4mm/tWVFtw6z8GN5yQW0UDyXUTDuOwb6XeLKE6cXAyV8G/Wag9
	fJNAK6wfFuvH8+zOXI26CDOTC+0g26UxyDzISa0hUlQO6Pi20wPRtyBQliOx/kMn6zDLY6KLA6LpO
	ReQ3DtfiRNQVUpkqw0jtlDlzOdHhBbk23vTKGV4j6TShxBlf0AOS8XAvmXKGUDcZSysXHjajeXDSs
	fetJPbZo+7RogF8EGYRODV3FvcMhn5muOVTiy7hj1Yc4nMgNw3lcQ2Uw4UuE8NTeYzt+DMecWcu0f
	/2SYXc1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdMT-0000000E4gO-0iJe;
	Thu, 26 Nov 2026 17:34:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdMQ-0000000E4fV-1db5
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 17:34:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 97A8AC2B9D3;
	Thu, 26 Nov 2026 17:34:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1CF9560558;
	Thu, 26 Nov 2026 17:34:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C44511E69167;
	Thu, 26 Nov 2026 18:34:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795714450; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZrHQ5khre1DkrWkgBl9aumcO/ImQop/ZVlpMoHp+2ZY=;
	b=LiNpPB8rzaiL3I26xFGiYwy68pXAoVR02F9+RM0KIpyaJMIHeeYsiSUPpB0DMzF+4sUMzU
	B8+kUMtUjA+SXx3blvFrN+gpGOnJYPcIoT0iWu3+NYuBzcq4uy705tvd9t5NpVdYXJndos
	JOVY/fibGjnUbBA0FxVERZHdtVDTERlq4EznI1eMYMXyssEZ6nq4UtC+r7zP0EgMtdJlNX
	aUUhsZxzfz4F/21h1AIJtFndntA1dykSM9eTFTO62z9o4O53X5ghju7qHSa2sTfGXPw1ql
	lb3b/zYuxjDgedKCdJkUQVEvkL7QrE4he5tww7EGraxMYuMXHlw7OIAd9ECgVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Arseniy Krasnov <AVKrasnov@sberdevices.ru>,  Boris
 Brezillon <bbrezillon@kernel.org>,  Kyle Roeschley
 <kyle.roeschley@ni.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: macronix: serialize OTP access
 with NAND operations
In-Reply-To: <CADvTj4q79XR9ymtzBHr7TUc+TnuoB2R-sUa+BWOCS1u7UTEUkA@mail.gmail.com>
	(James Hilliard's message of "Tue, 24 Nov 2026 09:10:06 -0700")
References: <20261122-submit-rawnand-operation-locking-v1-v2-0-030bc867f0c7@gmail.com>
	<20261122-submit-rawnand-operation-locking-v1-v2-1-030bc867f0c7@gmail.com>
	<87a4mys2ia.fsf@bootlin.com>
	<CADvTj4q79XR9ymtzBHr7TUc+TnuoB2R-sUa+BWOCS1u7UTEUkA@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 26 Nov 2026 18:34:05 +0100
Message-ID: <87y0afv6nm.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_093418_597813_D76A1675 
X-CRM114-Status: GOOD (  29.97  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjQvMTEvMjAyNiBhdCAwOToxMDowNiAtMDcsIEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKCj4gT24gVHVlLCBOb3YgMjQsIDIwMjYgYXQgNzo1NeKA
r0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+
Pgo+PiA+IE9UUCBJL08gY2FuIGFsc28gcnVuIHdoaWxlIHRoZSBjaGlwIGlzIHN1c3BlbmRlZC4K
Pj4KPj4gUmVhbGx5PyBXaGVyZSBkb2VzIHRoYXQgY29tZSBmcm9tPwo+Cj4gSSB3YXMgcmVmZXJy
aW5nIHRvIGNoaXAtPnN1c3BlbmRlZCBpbiBuYW5kX2Jhc2UuYy4gbmFuZF9zdXNwZW5kKCkgc2V0
cwo+IHRoYXQgZmxhZyBldmVuIHdoZW4gdGhlIGNoaXAgaGFzIG5vIHN1c3BlbmQgaG9vay4gTm9y
bWFsIE5BTkQgSS9PIHdhaXRzCj4gZm9yIHJlc3VtZSBpbiBuYW5kX2dldF9kZXZpY2UoKSwgYnV0
IE1URCBjYWxscyB0aGUgTWFjcm9uaXggdXNlci1PVFAKPiByZWFkIGFuZCB3cml0ZSBjYWxsYmFj
a3MgZGlyZWN0bHksIGJ5cGFzc2luZyB0aGF0IGNoZWNrLgo+Cj4gSSBoYXZlbid0IG9ic2VydmVk
IE9UUCBJL08gZHVyaW5nIHN5c3RlbSBzdXNwZW5kLiBVc2Vyc3BhY2UgaXMgbm9ybWFsbHkKPiBm
cm96ZW4gYmVmb3JlIGRldmljZSBzdXNwZW5kLCBhbmQgdGhlIE1hY3Jvbml4IGRyaXZlciBkb2Vz
bid0IGluc3RhbGwKPiBpdHMgZGVlcC1wb3dlci1kb3duIGhvb2sgb24gdGhlIE1YMzBMRnhHMThB
QyBwYXJ0cy4KPgo+Pgo+PiBbLi4uXQo+Pgo+PiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L25hbmRfYmFzZS5jCj4+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMK
Pj4gPiBAQCAtMjA3LDcgKzIwNyw3IEBAIEVYUE9SVF9TWU1CT0xfR1BMKG5hbmRfZGVzZWxlY3Rf
dGFyZ2V0KTsKPj4gPiAgICoKPj4gPiAgICogUmVsZWFzZSBjaGlwIGxvY2sgYW5kIHdha2UgdXAg
YW55b25lIHdhaXRpbmcgb24gdGhlIGRldmljZS4KPj4gPiAgICovCj4+ID4gLXN0YXRpYyB2b2lk
IG5hbmRfcmVsZWFzZV9kZXZpY2Uoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4gPiArdm9pZCBu
YW5kX3JlbGVhc2VfZGV2aWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4+Cj4+IFlvdSBleHBv
cnQgYSBjb3JlIGhlbHBlci4uLgo+Pgo+PiA+ICB7Cj4+ID4gICAgICAgLyogUmVsZWFzZSB0aGUg
Y29udHJvbGxlciBhbmQgdGhlIGNoaXAgKi8KPj4gPiAgICAgICBtdXRleF91bmxvY2soJmNoaXAt
PmNvbnRyb2xsZXItPmxvY2spOwo+PiA+IEBAIC0zMzYsNyArMzM2LDcgQEAgc3RhdGljIGludCBu
YW5kX2lzYmFkX2JibShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBsb2ZmX3Qgb2ZzKQo+PiA+ICAg
Kgo+PiA+ICAgKiBMb2NrIHRoZSBkZXZpY2UgYW5kIGl0cyBjb250cm9sbGVyIGZvciBleGNsdXNp
dmUgYWNjZXNzCj4+ID4gICAqLwo+PiA+IC1zdGF0aWMgdm9pZCBuYW5kX2dldF9kZXZpY2Uoc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCkKPj4gPiArdm9pZCBuYW5kX2dldF9kZXZpY2Uoc3RydWN0IG5h
bmRfY2hpcCAqY2hpcCkKPj4gPiAgewo+PiA+ICAgICAgIC8qIFdhaXQgdW50aWwgdGhlIGRldmlj
ZSBpcyByZXN1bWVkLiAqLwo+PiA+ICAgICAgIHdoaWxlICgxKSB7Cj4+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfbWFjcm9uaXguYwo+PiA+IGluZGV4IDE2ODQ3ZjI4YjE5ZC4uZDdmNWE5ZTdjMjQw
IDEwMDY0NAo+PiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+
PiA+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+PiA+IEBAIC0z
ODAsNiArMzgwLDcgQEAgc3RhdGljIGludCBfX21hY3Jvbml4XzMwbGZ4ZzE4YWNfcndfb3RwKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLAo+PiA+ICAgICAgIGludCByZXQsIGNsZWFudXBfcmV0Owo+PiA+
Cj4+ID4gICAgICAgbmFuZCA9IG10ZF90b19uYW5kKG10ZCk7Cj4+ID4gKyAgICAgbmFuZF9nZXRf
ZGV2aWNlKG5hbmQpOwo+Pgo+PiAuLi5hbmQgeW91IHVzZSBpdCBhY3Jvc3MgdGhlIGVudGlyZSBP
VFAgb3BlcmF0aW9uLi4uCj4KPiBUaGUgcmFjZSBkb2Vzbid0IHJlcXVpcmUgc3VzcGVuZDogYW4g
b3JkaW5hcnkgcGFnZSByZWFkIG9uIHRoZSBzYW1lCj4gY2hpcCBjYW4gaXNzdWUgaXRzIGNvbW1h
bmQgYWZ0ZXIgdGhlIE9UUCBjYWxsYmFjayBoYXMgZW5hYmxlZCBPVFAgbW9kZQo+IGFuZCBiZWZv
cmUgaXQgcmVzdG9yZXMgbm9ybWFsIG1vZGUuIExvY2tpbmcgZWFjaCBjb21tYW5kIHNlcGFyYXRl
bHkKPiB3b3VsZCBzdGlsbCBsZWF2ZSB0aGF0IHdpbmRvdyBvcGVuLgoKPwoKWW91IGFyZSB1c2lu
ZyBuYW5kX2dldF9kZXZpY2UoKS9uYW5kX3JlbGVhc2VfZGV2aWNlKCksIEkgYW0gbm90CmRpc3B1
dGluZyB0aGF0IGNob2ljZS4gWW91IGFyZSB1c2luZyB0aGVtIGluIGVhY2ggYW5kIGV2ZXJ5IG90
cCBvcAppbXBsZW1lbnRhdGlvbiwgd2hpY2ggZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UuIEl0IGRv
ZXMgbm90IG1hdHRlciBpZgp0aGVyZSBpcyBhIHNpbmdsZSB1c2VyIGZvciBub3cuCgo+PiA+ICAg
ICAgIG5hbmRfc2VsZWN0X3RhcmdldChuYW5kLCAwKTsKPj4gPgo+PiA+ICAgICAgIHJldCA9IG1h
Y3Jvbml4XzMwbGZ4ZzE4YWNfb3RwX2VuYWJsZShuYW5kKTsKPj4gPiBAQCAtNDI2LDYgKzQyNyw3
IEBAIHN0YXRpYyBpbnQgX19tYWNyb25peF8zMGxmeGcxOGFjX3J3X290cChzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCwKPj4gPiAgICAgICAgICAgICAgICAgICAgICAgd3JpdGUgPyAid3JpdGUiIDogInJl
YWQiKTsKPj4gPgo+PiA+ICAgICAgIG5hbmRfZGVzZWxlY3RfdGFyZ2V0KG5hbmQpOwo+PiA+ICsg
ICAgIG5hbmRfcmVsZWFzZV9kZXZpY2UobmFuZCk7Cj4+ID4KPj4gPiAgICAgICByZXR1cm4gcmV0
ID8gcmV0IDogY2xlYW51cF9yZXQ7Cj4+ID4gIH0KPj4KPj4gLi4uYW5kIGluIHRoZSBjb21taXQg
bG9nIHlvdSBtZW50aW9uOgo+Pgo+PiA+IE1ha2UgdGhlIGV4aXN0aW5nIE5BTkQgc2VyaWFsaXph
dGlvbiBoZWxwZXJzIGF2YWlsYWJsZSB3aXRoaW4gdGhlIHJhdwo+PiA+IE5BTkQgY29yZSBhbmQg
aG9sZCB0aGVtIGFjcm9zcyB0aGUgZW50aXJlIE9UUCB0cmFuc2FjdGlvbgo+Pgo+PiBXaHkgYXJl
IHlvdSBkb2luZyB0aGUgc2VyaWFsaXphdGlvbiBpbiBvbmUgdmVuZG9yIGRyaXZlciB0aGVuPyBB
cmVuJ3QKPj4gYWxsIHRoZSB2ZW5kb3JzIGFmZmVjdGVkIGJ5IHRoZSBleGFjdCBzYW1lIGlzc3Vl
PyBXaHkgaXNuJ3QgdGFraW5nIHRoZQo+PiBsb2NrIG9uY2UgZm9yIGFsbCBpbiB0aGUgY29yZSBh
IGJldHRlciBpZGVhPwo+Cj4gTWFjcm9uaXggaXMgdGhlIG9ubHkgaW4tdHJlZSByYXcgTkFORCBt
YW51ZmFjdHVyZXIgdGhhdCBpbnN0YWxscyBNVEQKPiB1c2VyLU9UUCByZWFkIGFuZCB3cml0ZSBj
YWxsYmFja3MuCgpUaGF0J3Mgbm90IGEgcmVhc29uLCB3ZSBkb24ndCB3YW50IHRoZSByYWNlIHRv
IHJlLW9wZW4gZXZlcnkgdGltZQpzb21lb25lIGFkZHMgbmV3IE9UUCBvcHMsIHJpZ2h0PwoKPiBC
b3RoIHVzZSB0aGUgc2FtZSBoZWxwZXIsIHNvIHRha2luZwo+IHRoZSBsb2NrcyB0aGVyZSBjb3Zl
cnMgYm90aCBwYXRocyB3aXRob3V0IGNoYW5naW5nIHRoZSBpbnRlcmZhY2UuCgpZb3Ugd291bGRu
J3QgYmUgImNoYW5naW5nIHRoZSBpbnRlcmZhY2UiIHdoYXRldmVyIHRoYXQgYWN0dWFsbHkgbWVh
bnMuCgo+IEEgY29yZSB3cmFwcGVyIGNvdWxkIHRha2UgdGhlIGNoaXAgYW5kIGNvbnRyb2xsZXIg
bG9ja3MgYXJvdW5kIGEKPiBtYW51ZmFjdHVyZXIncyBPVFAgY2FsbGJhY2ssIG11Y2ggYXMgbmFu
ZF9sb2NrKCkgZG9lcyBmb3IKPiBjaGlwLT5vcHMubG9ja19hcmVhLiBUaGF0IHdvdWxkIGdpdmUg
ZnV0dXJlIGltcGxlbWVudGF0aW9ucyB0aGUgc2FtZQo+IGxvY2tpbmcsIGJ1dCBpdCB3b3VsZCBt
ZWFuIGFkZGluZyByYXcgTkFORCBPVFAgaG9va3Mgd2hlcmUgTVREIGN1cnJlbnRseQo+IGNhbGxz
IHRoZSBvbmUgaW1wbGVtZW50YXRpb24gZGlyZWN0bHkuIElzIHRoYXQgdGhlIGFwcHJvYWNoIHlv
dSBoYWQgaW4KPiBtaW5kPwoKVGhhdCBwZW51bHRpbWF0ZSBzZW50ZW5jZSBkb2VzIG5vdCBtZWFu
IGFueXRoaW5nLCB5b3Ugc2hvdWxkIHJlYWxseQp3cml0ZSB5b3VyIG93biBhbnN3ZXJzLiBBbnl3
YXksIEkgdGhpbmsgdGhlIGFuc3dlciBJIHNob3VsZCBnaXZlIGhlcmUgaXMKInllcyIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
