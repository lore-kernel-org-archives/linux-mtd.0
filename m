Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3C3C47089
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 15:37:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74241613B4
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 15:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74241613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cw3xtAzbra5syb2QsFY+k9aK2+z6+6efw1cs4FsJlmA=; b=jldvEY1KRrQmwc
	FgGyO3I+UqxWWZrWD/x9bCIiz8Xrzy2plMAd19ewsyMHCs3rMWskE4/6utmIAph0bpYgMC0iajC/q
	+PAZ/v1A53guf2bvAk69+MDF5FtGzdR55Jpb9Bf2XG7x1WiTUjpncFHi531RCGDEbwiu/lVwPV0ib
	FBnomKve2YpVIB8D5EG7a0NeVHKcKfcw8AVKXPKa7jYSVm2uN/REYqITct4bhL8R+xaAAG6NxIdpB
	ytnNwUj4pJdTQvZNzy8Moufqf4/QR3K36O5CEiXJUzQKTcruviVlWWtNP+v5FLnAPv84NGjzoRRHr
	tpf09ffcZFWHhUMjBZww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmI3x-007H47-4v; Thu, 27 May 2021 15:36:45 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmHXV-0070hO-Vm
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 15:03:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D2B14100007;
 Thu, 27 May 2021 15:03:10 +0000 (UTC)
Date: Thu, 27 May 2021 17:03:09 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Colin King <colin.king@canonical.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: ensure return variable is initialized
Message-ID: <20210527170309.4d99bc31@xps13>
In-Reply-To: <20210527145048.795954-1-colin.king@canonical.com>
References: <20210527145048.795954-1-colin.king@canonical.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_080314_232838_DDE3BD05 
X-CRM114-Status: GOOD (  18.29  )
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

SGkgQ29saW4sCgpDb2xpbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+IHdyb3RlIG9u
IFRodSwgMjcgTWF5IDIwMjEKMTU6NTA6NDggKzAxMDA6Cgo+IEZyb206IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+Cj4gCj4gQ3VycmVudGx5IHRoZXJlIGFyZSBjb3Ju
ZXIgY2FzZXMgd2hlcmUgc3BlY190aW1lcyBpcyBOVUxMIGFuZAo+IGNoaXAtPnBhcmFtZXRlcnMu
b25maSBvciB3aGVuIGJlc3RfbW9kZSBpcyB6ZXJvIHdoZXJlIHJldCBpcwoKICAgICAgICAgICAg
ICAgICAgICAgICBeCnNvbWV0aGluZyBpcyBtaXNzaW5nIGhlcmUsIHRoZSBzZW50ZW5jZSBpcyBu
b3QgY2xlYXIKCj4gbm90IGFzc2lnbmVkIGEgdmFsdWUgYW5kIGFuIHVuaW5pdGlhbGl6ZWQgcmV0
dXJuIHZhbHVlIGNhbiBiZQo+IHJldHVybmVkLiBGaXggdGhpcyBieSBlbnN1cmluZyByZXQgaXMg
aW5pdGlhbGl6ZWQgdG8gLUVJTlZBTC4KCkkgZG9uJ3Qgc2VlIGhvdyB0aGlzIHNpdHVhdGlvbiBj
YW4gaGFwcGVuLgoKSW4gYm90aCBjYXNlcywgbm8gbWF0dGVyIHRoZSB2YWx1ZSBvZiBiZXN0X21v
ZGUsIHRoZSBmb3IgbG9vcCB3aWxsCmFsd2F5cyBleGVjdXRlIGF0IGxlYXN0IG9uZSB0aW1lICht
b2RlIDApIHNvIHJldCB3aWxsIGJlIHBvcHVsYXRlZC4KCk1heWJlIHRoZSByb2JvdCBkb2VzIG5v
dCBrbm93IHRoYXQgYmVzdF9tb2RlIGNhbm5vdCBiZSBuZWdhdGl2ZSBhbmQKc2hvdWxkIGJlIGRl
ZmluZWQgdW5zaWduZWQsIGJ1dCB0aGUgY3VycmVudCBwYXRjaCBpcyBpbnZhbGlkLgoKPiBBZGRy
ZXNzZXMtQ292ZXJpdHk6ICgiVW5pbml0aWFsaXplZCBzY2FsYXIgdmFyaWFibGUiKQo+IEZpeGVz
OiA5ZDMxOTRiZjJhZWYgKCJtdGQ6IHJhd25hbmQ6IEFsbG93IFNEUiB0aW1pbmdzIHRvIGJlIG5h
Y2tlZCIpCj4gRml4ZXM6IGE5ZWNjOGM4MTRlOSAoIm10ZDogcmF3bmFuZDogQ2hvb3NlIHRoZSBi
ZXN0IHRpbWluZ3MsIE5WLUREUiBpbmNsdWRlZCIpCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFu
IEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFu
ZC9yYXcvbmFuZF9iYXNlLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+IGluZGV4
IDU3YTU4MzE0OWNjMC4uMThkYjc0MmY2NTBjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfYmFzZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMKPiBAQCAtOTI2LDcgKzkyNiw3IEBAIGludCBuYW5kX2Nob29zZV9iZXN0X3Nkcl90aW1pbmdz
KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4gIAkJCQkgc3RydWN0IG5hbmRfc2RyX3RpbWluZ3Mg
KnNwZWNfdGltaW5ncykKPiAgewo+ICAJY29uc3Qgc3RydWN0IG5hbmRfY29udHJvbGxlcl9vcHMg
Km9wcyA9IGNoaXAtPmNvbnRyb2xsZXItPm9wczsKPiAtCWludCBiZXN0X21vZGUgPSAwLCBtb2Rl
LCByZXQ7Cj4gKwlpbnQgYmVzdF9tb2RlID0gMCwgbW9kZSwgcmV0ID0gLUVJTlZBTDsKPiAgCj4g
IAlpZmFjZS0+dHlwZSA9IE5BTkRfU0RSX0lGQUNFOwo+ICAKPiBAQCAtOTc3LDcgKzk3Nyw3IEBA
IGludCBuYW5kX2Nob29zZV9iZXN0X252ZGRyX3RpbWluZ3Moc3RydWN0IG5hbmRfY2hpcCAqY2hp
cCwKPiAgCQkJCSAgIHN0cnVjdCBuYW5kX252ZGRyX3RpbWluZ3MgKnNwZWNfdGltaW5ncykKPiAg
ewo+ICAJY29uc3Qgc3RydWN0IG5hbmRfY29udHJvbGxlcl9vcHMgKm9wcyA9IGNoaXAtPmNvbnRy
b2xsZXItPm9wczsKPiAtCWludCBiZXN0X21vZGUgPSAwLCBtb2RlLCByZXQ7Cj4gKwlpbnQgYmVz
dF9tb2RlID0gMCwgbW9kZSwgcmV0ID0gMDsKPiAgCj4gIAlpZmFjZS0+dHlwZSA9IE5BTkRfTlZE
RFJfSUZBQ0U7Cj4gIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
