Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA5606A333
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 06:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qo/XxjgM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nayCYQt4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lanLqmLSrBvGwGMoh+EAMq6yIdy57Q57hUUpXL4cjEs=; b=Qo/XxjgMZ0QfRfEv4h+QCNbUUt
	hE4BOtwoC35o1yRphMNYw7Vyf3gmJmub9yQboT6wIngZCx+hMcyHuRuZ3u6KSgqNhQR1uHM18cMaT
	fyLCJSiu3VF8cR91pRFuiKjYDbAPk0lB4ougBxkQeKE94nCtTN9eZvQ/QTRnuI8cllD42ETPgEMCa
	CqpguFVzQPAecu8ROl/1tzMphpQ/CPvPfo2lMhjcLfNJfdTDOGYkpIgYqNFTyNB4OQ5kxdx9LImTz
	IG/RX2gnbMZ8HC2EBNL3oZ8mYIWl/Bn93ssRDRracLaRfkV0PWtseeEBnVcVwVSnz5vJIurIWkyEs
	eB4BAQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTD4K-00000004hHR-2kIa;
	Tue, 17 Nov 2026 06:53:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTD4J-00000004hH1-1kVh
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 06:53:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4ED8060DD3;
	Tue, 17 Nov 2026 06:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73A81F000C4;
	Tue, 17 Nov 2026 06:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794898406;
	bh=ykMsiaDKzMw3A5NaeJ1406Xixm44+f8KmbYJM9dsb7s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nayCYQt4YKfv7Zy5KcjSzpZmEM+slR43/Mt2Caq4uIb4wgywOQW55MHELcHvU8sFA
	 vIUTglCZ4lE7vK7i3BaKJoYzdM9lwF4VmezN57Ul5Qc8IpznbL9/r0x+9IKyb0j86N
	 ETIULXKlLfCCKMRIFy1EzW/1zUEjFRU6k1smaO6te7I94L8Alf+bbtdVRgiLe+UXia
	 W8YPlQWRI2K4MqvGuzLRnsl3a2GwumDsjGa8a4nPAhRhjhgiBFpJ24oVZOxTfnej5D
	 0IbhBGIZ9al2mfJKtYF8fyY5oDiDj3/s/6wymu7YcrKREPa6FqQSiGtc469Y3Sr6cC
	 NCOY8IcdtLRig==
Message-ID: <sashiko-outbox-218282@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: blktrans: keep reclaim out of the ->release
 paths
To: "Shuai Liu" <847807867@qq.com>, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com
In-Reply-To: <tencent_9B9358CCE5C39B1E7017C4B42600DC95A409@qq.com>
References: <sashiko-outbox-218218@kernel.org>
 <tencent_9B9358CCE5C39B1E7017C4B42600DC95A409@qq.com>
Date: Tue, 17 Nov 2026 06:53:25 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogYmxrdHJhbnM6IG1p
c3NpbmcgbWVtYWxsb2Nfbm9pb19zYXZlKCkgaW4gbXRkX3F1ZXVlX3JxKCkKICBJL08gcGF0aAot
LQoKY29tbWl0IDhhOGZmYTNlMGM3NTMwNjcwOGUwYTQwOWJlZmY2OGM3ZDIwODQwY2EKQXV0aG9y
OiBTaHVhaSBMaXUgPDg0NzgwNzg2N0BxcS5jb20+CgptdGQ6IGJsa3RyYW5zOiBrZWVwIHJlY2xh
aW0gb3V0IG9mIHRoZSAtPnJlbGVhc2UgcGF0aHMKClRoaXMgY29tbWl0IHdyYXBzIHRoZSB0cmFu
c2xhdG9yIC0+cmVsZWFzZSgpIGNhbGxiYWNrcyBpbgpibGt0cmFuc19yZWxlYXNlKCkgYW5kIGRl
bF9tdGRfYmxrdHJhbnNfZGV2KCkgd2l0aCBtZW1hbGxvY19ub2lvX3NhdmUoKQphbmQgbWVtYWxs
b2Nfbm9pb19yZXN0b3JlKCkgdG8gcHJldmVudCBtZW1vcnkgcmVjbGFpbSBmcm9tIHJlY3Vyc2lu
ZyBpbnRvCnRoZSBibG9jayBxdWV1ZSB1bmRlciBkZXYtPmxvY2suCgo+ICAgICBUaGUgaW8gcGF0
aCBpcyBhbHJlYWR5IHByb3RlY3RlZDogbXRkX3F1ZXVlX3JxKCkgZGlzYWJsZXMgcmVjbGFpbQo+
ICAgICBhY3Jvc3MgZGlzcGF0Y2ggd2l0aCBtZW1hbGxvY19ub2lvX3NhdmUoKSwgYmVjYXVzZSB0
cmFuc2xhdG9ycyBtYXkKPiAgICAgYWxsb2NhdGUgd2hpbGUgcHJvY2Vzc2luZyByZXF1ZXN0cyB1
bmRlciBkZXYtPmxvY2sgYW5kIHRoZSBzcmN1IHJlYWQKPiAgICAgc2lkZS4gLT5yZWxlYXNlKCkg
cnVucyB1bmRlciB0aGUgc2FtZSBsb2Nrcywgc28gZ2l2ZSBpdCB0aGUgc2FtZQo+ICAgICB0cmVh
dG1lbnQgaW4gYmxrdHJhbnNfcmVsZWFzZSgpIGFuZCBkZWxfbXRkX2Jsa3RyYW5zX2RldigpLgoK
WyAuLi4gXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYyBiL2RyaXZl
cnMvbXRkL210ZF9ibGtkZXZzLmMKPiBpbmRleCA0ZDJlN2I3Nzc0ZTkwLi44NmE4NjQ0ODgxY2U3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiArKysgYi9kcml2ZXJz
L210ZC9tdGRfYmxrZGV2cy5jCj4gQEAgLTIyOCw2ICsyMjgsNyBAQCBzdGF0aWMgaW50IGJsa3Ry
YW5zX29wZW4oc3RydWN0IGdlbmRpc2sgKmRpc2ssIGJsa19tb2RlX3QgbW9kZSkKPiAgc3RhdGlj
IHZvaWQgYmxrdHJhbnNfcmVsZWFzZShzdHJ1Y3QgZ2VuZGlzayAqZGlzaykKPiAgewo+ICAJc3Ry
dWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldiA9IGRpc2stPnByaXZhdGVfZGF0YTsKPiArCXVuc2ln
bmVkIGludCBub2lvX2ZsYWdzOwo+ICAKPiAgCW11dGV4X2xvY2soJmRldi0+bG9jayk7Cj4gIAo+
IEBAIC0yMzcsOCArMjM4LDEyIEBAIHN0YXRpYyB2b2lkIGJsa3RyYW5zX3JlbGVhc2Uoc3RydWN0
IGdlbmRpc2sgKmRpc2spCj4gIAltb2R1bGVfcHV0KGRldi0+dHItPm93bmVyKTsKPiAgCj4gIAlp
ZiAoZGV2LT5tdGQpIHsKPiAtCQlpZiAoZGV2LT50ci0+cmVsZWFzZSkKPiArCQlpZiAoZGV2LT50
ci0+cmVsZWFzZSkgewo+ICsJCQkvKiBSZWNsYWltIG11c3Qgbm90IHJlY3Vyc2UgaW50byBJL08g
d2hpbGUgcmVsZWFzaW5nIHRoZSBkZXZpY2UuICovCj4gKwkJCW5vaW9fZmxhZ3MgPSBtZW1hbGxv
Y19ub2lvX3NhdmUoKTsKPiAgCQkJZGV2LT50ci0+cmVsZWFzZShkZXYpOwo+ICsJCQltZW1hbGxv
Y19ub2lvX3Jlc3RvcmUobm9pb19mbGFncyk7Cj4gKwkJfQo+ICAJCV9fcHV0X210ZF9kZXZpY2Uo
ZGV2LT5tdGQpOwo+ICAJfQoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIG10ZF9xdWV1ZV9ycSgpIG9y
IG10ZF9ibGt0cmFuc193b3JrKCkgYWN0dWFsbHkgY2FsbAptZW1hbGxvY19ub2lvX3NhdmUoKT8K
CkNvbnRyYXJ5IHRvIHRoZSBjb21taXQgbWVzc2FnZSwgbmVpdGhlciBmdW5jdGlvbiBzZXRzIFBG
X01FTUFMTE9DX05PSU86Cgpkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jOm10ZF9xdWV1ZV9ycSgp
IHsKCS4uLgoJc3Bpbl9sb2NrX2lycSgmZGV2LT5xdWV1ZV9sb2NrKTsKCWxpc3RfYWRkX3RhaWwo
JmJkLT5ycS0+cXVldWVsaXN0LCAmZGV2LT5ycV9saXN0KTsKCW10ZF9ibGt0cmFuc193b3JrKGRl
dik7CglzcGluX3VubG9ja19pcnEoJmRldi0+cXVldWVfbG9jayk7CgoJcmV0dXJuIEJMS19TVFNf
T0s7Cn0KCkR1cmluZyBub3JtYWwgcmVxdWVzdCBkaXNwYXRjaCB1bmRlciBzZXQtPnNyY3UgYW5k
IGRldi0+bG9jaywKbXRkX2Jsa3RyYW5zX3dvcmsoKSAtPiBkb19ibGt0cmFuc19yZXF1ZXN0KCkg
aW52b2tlcyB0cmFuc2xhdG9yIGNhbGxiYWNrcwp0aGF0IGFsbG9jYXRlIHdpdGggR0ZQX0tFUk5F
TC4gIEZvciBleGFtcGxlLCBhIFJFUV9PUF9GTFVTSCByZXF1ZXN0IGNhbGxzCm10ZGJsb2NrX2Zs
dXNoKCksIHdoaWNoIHRha2VzIG10ZGJsay0+Y2FjaGVfbXV0ZXggYW5kIHJ1bnMKd3JpdGVfY2Fj
aGVkX2RhdGEoKSAtPiBlcmFzZV93cml0ZSgpIC0+IG10ZF9lcmFzZSgpIC0+IGNvbmNhdF9lcmFz
ZSgpLApoaXR0aW5nIHRoZSBzYW1lIGZzX3JlY2xhaW0gbG9ja2RlcCBjeWNsZSBhbmQgcmVjbGFp
bSBkZWFkbG9jayBvbiB0aGUgSS9PCnBhdGggYXMgd2VsbC4KCi0tIApTYXNoaWtvIEFJIHJldmll
dyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvdGVuY2VudF85QjkzNThDQ0U1QzM5
QjFFNzAxN0M0QjQyNjAwREM5NUE0MDlAcXEuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
