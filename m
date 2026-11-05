Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00001606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mvijvr9R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cD1NjL2O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3fgr2dSy55njdw5A/Hss7Z5HMDmUUza9+21mx6xlryg=; b=mvijvr9RiOcX2fLACBH8q75pz0
	HW044MhF/h3OmyJzdi2sdNWafhA6nEdVLMnimg08PDKGhZ9xgitjCd93GaQ1tBMnmrDimFyOTklOa
	IrgfPLvxwrVT7nIDSEJ/+CeQzS9TSvKZeam0oy0OSXW/j+jxZFrev91ZzawGNkD+x76WCITOh4gyX
	Q3rQXtFpLp8bVFnHr/Q6Fg9f8iI/OdBk8XpUX0kKxQlAuTvsafNJ4QNkKNu+nl49uO15KlvscUkqw
	WkKcXLeX2AZBr/mgMvoZ1G/2CoRppGXzpsdnSOBoPIS+UEkEJSwEAHHj9jFPDaKBpWVnm5x5X18XO
	FslepTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOot6-00000007ktL-1ieq;
	Thu, 05 Nov 2026 04:15:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOot5-00000007kt8-12MK
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:15:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEAF260267;
	Thu,  5 Nov 2026 04:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8091F000C1;
	Thu,  5 Nov 2026 04:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793852142;
	bh=7QlmC33vIQZdRRKeJS6A1RAXQoIugg9X8c69cd+BNJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cD1NjL2OWAqkrIMGKi08PCjL69bHlzVvd5APP92un7/4irUJhs910yoCFnRGGacFI
	 1Isr0AKQPKNLwX1ucejl0N0q/jyeO/wn3K7ScM1jNHS+S+iUG9jumroSCuCsLMpXEZ
	 fhtw6ybykBA3wopdO0JNclF9xW0INaQFOluLSJEgVl7FN8qj1p8TEkqqR/HWPo5peV
	 7McH7riaM2gTloD3+7B7HbqSv+l8EUR8EmbOR3BUinSWOjQg/uBgrUitYCAvRZvDNz
	 6tvnjIhOdqHj1wLz/jOWlf40lA2cIlJLJWK40eOK2uYZpNd4kmdgbnlFnZM2HrkzpW
	 KjFGTOdyyMaWw==
Message-ID: <sashiko-outbox-198545@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mtd: rawnand: ingenic: validate BCH error index in
 jz4780_correct()
To: "Guanglei Zhu" <zhugl3@xiaopeng.com>, "Paul Cercueil" <paul@crapouillou.net>, "Harvey
 Hunt" <harveyhuntnexus@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, linux-mtd@lists.infradead.org, "Weibin
 Liu" <liuwb@xiaopeng.com>
In-Reply-To: <20261105040153.66597-2-zhugl3@xiaopeng.com>
References: <20261105040153.66597-1-zhugl3@xiaopeng.com>
 <20261105040153.66597-2-zhugl3@xiaopeng.com>
Date: Thu, 05 Nov 2026 04:15:41 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogcmF3bmFuZDog
aW5nZW5pYzogZmFsc2UgLUVCQURNU0cgb24gcGFyaXR5IGJpdGZsaXBzIGluIGp6NDc4MF9jb3Jy
ZWN0KCkKLS0KCmNvbW1pdCA4ZGU5NGU5NjE1ZmM0ZjU5N2QwNjU5MWUzMjJjNzNhMDJhYzE4YjUw
CkF1dGhvcjogV2VpYmluIExpdSA8bGl1d2JAeGlhb3BlbmcuY29tPgoKbXRkOiByYXduYW5kOiBp
bmdlbmljOiB2YWxpZGF0ZSBCQ0ggZXJyb3IgaW5kZXggaW4gano0NzgwX2NvcnJlY3QoKQoKVGhp
cyBjb21taXQgYWRkcyBhIGJvdW5kcyBjaGVjayBvbiB0aGUgQkNIIGVycm9yIGluZGV4IGluIGp6
NDc4MF9jb3JyZWN0KCkKYW5kIHJldHVybnMgLUVCQURNU0cgaWYgdGhlIHJlcG9ydGVkIGJ5dGUt
cGFpciBpbmRleCBleGNlZWRzIHBhcmFtcy0+c2l6ZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzgwX2JjaC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
aW5nZW5pYy9qejQ3ODBfYmNoLmMKPiBpbmRleCAxMmI1YjA0ODRmZTk3Li4yMDRiYzg1M2MxYjQy
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2luZ2VuaWMvano0NzgwX2JjaC5j
Cj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9qejQ3ODBfYmNoLmMKPiBAQCAt
MjE2LDYgKzIxNiwxMSBAQCBzdGF0aWMgaW50IGp6NDc4MF9jb3JyZWN0KHN0cnVjdCBpbmdlbmlj
X2VjYyAqYmNoLAo+ICAJCQkJCQlCQ0hfQkhFUlJfTUFTS19TSElGVDsKPiAgCQkJaW5kZXggPSAo
cmVnICYgQkNIX0JIRVJSX0lOREVYX01BU0spID4+Cj4gIAkJCQkJCUJDSF9CSEVSUl9JTkRFWF9T
SElGVDsKPiArCQkJaWYgKChpbmRleCAqIDIpICsgMSA+PSBwYXJhbXMtPnNpemUpIHsKPiArCQkJ
CXJldCA9IC1FQkFETVNHOwo+ICsJCQkJZ290byBvdXQ7Cj4gKwkJCX0KCltTZXZlcml0eTogSGln
aF0KV29uJ3QgdGhpcyBpbnRyb2R1Y2UgYSByZWdyZXNzaW9uIHdoZW4gYSBjb3JyZWN0YWJsZSBi
aXRmbGlwIG9jY3VycyBpbiB0aGUKT09CIEVDQyBwYXJpdHkgYnl0ZXM/CgpJbiBkcml2ZXJzL210
ZC9uYW5kL3Jhdy9pbmdlbmljL2p6NDc4MF9iY2guYywgano0NzgwX2NvcnJlY3QoKSB3cml0ZXMg
Ym90aAp0aGUgZGF0YSBidWZmZXIgYW5kIHRoZSByZWFkIEVDQyBwYXJpdHkgYnl0ZXMgdG8gdGhl
IEJDSCBjb250cm9sbGVyIHNvIGl0CmRlY29kZXMgdGhlIGVudGlyZSBjb2Rld29yZCBvZiBwYXJh
bXMtPnNpemUgKyBwYXJhbXMtPmJ5dGVzIGJ5dGVzOgoKCWp6NDc4MF9iY2hfcmVzZXQoYmNoLCBw
YXJhbXMsIGZhbHNlKTsKCWp6NDc4MF9iY2hfd3JpdGVfZGF0YShiY2gsIGJ1ZiwgcGFyYW1zLT5z
aXplKTsKCWp6NDc4MF9iY2hfd3JpdGVfZGF0YShiY2gsIGVjY19jb2RlLCBwYXJhbXMtPmJ5dGVz
KTsKCldoZW4gYSBiaXRmbGlwIG9jY3VycyBvbiBmbGFzaCB3aXRoaW4gdGhlIEVDQyBwYXJpdHkg
Ynl0ZXMgKGFuZCB0b3RhbApjb2Rld29yZCBiaXRmbGlwcyBhcmUgd2l0aGluIHBhcmFtcy0+c3Ry
ZW5ndGgpLCB0aGUgaGFyZHdhcmUgcmVwb3J0cyBhCmNvcnJlY3RhYmxlIGVycm9yIChCQ0hfQkhJ
TlRfRVJSIHNldCwgQkNIX0JISU5UX1VOQ09SIGNsZWFyKSB3aXRoIGluZGV4CnBvaW50aW5nIGlu
dG8gdGhlIHBhcml0eSByZWdpb24gW3BhcmFtcy0+c2l6ZSwgcGFyYW1zLT5zaXplICsgcGFyYW1z
LT5ieXRlcyksCnN1Y2ggYXMgaW5kZXggPT0gMjU2IHdoZW4gcGFyYW1zLT5zaXplID09IDUxMi4K
CldpdGggdGhpcyBjaGVjayByZXR1cm5pbmcgLUVCQURNU0cgYW5kIGp1bXBpbmcgdG8gb3V0IHdo
ZW5ldmVyCihpbmRleCAqIDIpICsgMSA+PSBwYXJhbXMtPnNpemUsIGFueSBjb3JyZWN0YWJsZSBi
aXRmbGlwIGluIHRoZSBwYXJpdHkgYXJlYQphYm9ydHMgdGhlIGxvb3AgKGxlYXZpbmcgYW55IHN1
YnNlcXVlbnQgZGF0YS1hcmVhIGVycm9yIGVudHJpZXMgaW4KQkNIX0JIRVJSbiB1bmNvcnJlY3Rl
ZCkgYW5kIGZhaWxzIHRoZSBwYWdlIHJlYWQgYXMgYW4gdW5jb3JyZWN0YWJsZSBFQ0MKZXJyb3Iu
CgpCeSBjb21wYXJpc29uLCB0aGUgc2libGluZyBkcml2ZXIgaW4KZHJpdmVycy9tdGQvbmFuZC9y
YXcvaW5nZW5pYy9qejQ3NDBfZWNjLmM6ano0NzQwX2VjY19jb3JyZWN0KCkgc2tpcHMKbW9kaWZ5
aW5nIGJ1ZiB3aGVuIHRoZSBpbmRleCBmYWxscyBvdXRzaWRlIHRoZSBkYXRhIGFyZWEgd2l0aG91
dCBmYWlsaW5nCnRoZSByZWFkOgoKCQlmb3IgKGkgPSAwOyBpIDwgZXJyb3JfY291bnQ7ICsraSkg
ewoJCQllcnJvciA9IHJlYWRsKGVjYy0+YmFzZSArIEpaX1JFR19OQU5EX0VSUihpKSk7CgkJCWlu
ZGV4ID0gKChlcnJvciA+PiAxNikgJiAweDFmZikgLSAxOwoJCQlpZiAoaW5kZXggPj0gMCAmJiBp
bmRleCA8IHBhcmFtcy0+c2l6ZSkKCQkJCWp6X25hbmRfY29ycmVjdF9kYXRhKGJ1ZiwgaW5kZXgs
IGVycm9yICYgMHgxZmYpOwoJCX0KClNob3VsZCBqejQ3ODBfY29ycmVjdCgpIHNraXAgdGhlIGJ1
ZiBYT1Igd2hlbiBpbmRleCBmYWxscyBpbiB0aGUgcGFyaXR5CnJlZ2lvbiBhbmQgb25seSByZXR1
cm4gLUVCQURNU0cgaWYgdGhlIHJlcG9ydGVkIGxvY2F0aW9uIGxpZXMgYmV5b25kIHRoZQpmdWxs
IGNvZGV3b3JkIChwYXJhbXMtPnNpemUgKyBwYXJhbXMtPmJ5dGVzKT8KCi0tIApTYXNoaWtvIEFJ
IHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDUwNDAxNTMu
NjY1OTctMS16aHVnbDNAeGlhb3BlbmcuY29tP3BhcnQ9MgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
