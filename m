Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DF3C5321D
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 15:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMXb3a0JfQHIPb3eDK+HtdV4ohrtLaevaqQ2fMhx7yk=; b=cgIGTFaop27h2a
	LQPJh6Qm5Gx6IGMuKr6ehIIfMVd3PNMTuVt+EvPKCbNhcIkscYoUFrAUjY9igDUyNfftAUxMgpKjP
	e40lqmJOtMY14KpCva9cxKyAlcgpY7pC1AD4Hv8zHmCMQpRhfLeigYjnFK+NB4PdLf/kKumjXUVfl
	UttencRXo1Q7j5f5ssK3mdX3S/2HsUPvggGUnQsMElcmwCA9s5WZBo0AucN3uBbzCyb3oh6D6Hj91
	PFJrbBvYpGzwavXzai19VNDvhazXKRjSrWxHpcBfBALHe1Hml1O3c9wQW9L6Ofzj+diQtINz3CdP1
	qQaHs4AILTxVQq/9wVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWXN-0000000HOQC-0Kq0;
	Fri, 23 Aug 2024 15:49:17 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWVe-0000000HNvO-10od
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 15:47:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 155B660002;
	Fri, 23 Aug 2024 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724428046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aXndtgjyosFUz5tRo1q1Sp82wNsQ66T54+uokgzMrmw=;
	b=J3KKWS890Sw1Rr0I9uXcVa2bcZZan9r5EUU57pG2hUPzLr/AwG7/uag2eNrx4+xnFqvfGy
	FoqR6bqNgEun8vtEre4vlcR+h0hurkw76+Ez4Kn+SrhM/OQehTLljVsNUTfviuLa4kyCbC
	JC/7lu2zBC/GadRtcdhhcOCmMValC/9m/auoRd/YbeI0RCz/4HniM4Z4g7T4MdQ8l29x5K
	bLpd3fZCI80pgViNrPxSnoasO3TJMlHJTwZ2ODQOe/jX8mf7rV+P9Mf4nOAnnSWE8xF6Sj
	a9ntcjSVBcll4s5pCobDvBjP87BzH4SFiODEyp3YY6x3rLn2sORNuToXx11qkQ==
Date: Fri, 23 Aug 2024 17:47:23 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxim Anisimov <maxim.anisimov.ua@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>, Michael
 Walle <michael@walle.cc>, Mark Brown <broonie@kernel.org>, "Chia-Lin Kao
 (AceLan)" <acelan.kao@canonical.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: Add support for HeYangTek HYF1GQ4UDACAE
Message-ID: <20240823174723.403a3342@xps-13>
In-Reply-To: <3d14b0c8-3c25-4a9a-b84a-192f071fa919@gmail.com>
References: <20240624061246.5292-1-maxim.anisimov.ua@gmail.com>
	<20240701095906.2bc4a0d2@xps-13>
	<3d14b0c8-3c25-4a9a-b84a-192f071fa919@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_084730_659618_82E09F27 
X-CRM114-Status: GOOD (  24.35  )
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

SGkgTWF4aW0sCgptYXhpbS5hbmlzaW1vdi51YUBnbWFpbC5jb20gd3JvdGUgb24gTW9uLCAyMiBK
dWwgMjAyNCAwOTo1NDo1NSArMDMwMDoKCj4gSGkgTWlxdWVsLAo+IAo+IFNvcnJ5IGZvciBsYXRl
IGFuc3dlci4gSSB3YXMgb24gdm9jYXRpb24uIFRvIGJlIGhvbmVzdCwgSSBkb24ndCB1bmRlcnN0
YW5kIHZlcnkgd2VsbCBob3cgdGhpcyB3b3Jrcy4gT25lIG9mIHRoZSBPcGVuV3J0IGRldmVsb3Bl
cnMgYXNrZWQgbWUgdG8gc2VuZCB0aGlzIHBhdGNoIHRvIExpbnV4IHVwc3RyZWFtLiBSZWxhdGVk
IE9wZW5XcnQgcHVsbCByZXF1ZXN0IGlzIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL29wZW53cnQv
b3BlbndydC9wdWxsLzE1NTUxIC4gT3JpZ2luYWxseSB0aGlzIHBhdGNoIGNvZGUgd2FzIHRha2Vu
IGZyb20gdGhlIGRldmljZSBtYW51ZmFjdHVyZXIncyByZXBvc2l0b3J5IGh0dHBzOi8vZ2l0aHVi
LmNvbS9rZWVuZXRpYy9rZXJuZWwtNDkvY29tbWl0L2JhY2FkZTU2OWZiMTJiYzBhZDMxYmEwOWJj
YTliODkwMTE4ZmJjYTcgLiBJIHBvaW50ZWQgdG8gdGhpcyBpbiB0aGUgc291cmNlIGNvZGUuIEZy
b20gbXkgc2lkZSBJIG9ubHkgYWRhcHRlZCB0aGUgY29kZSBmb3Igc3VjY2Vzc2Z1bCBjb21waWxh
dGlvbiBvbiB0aGUgTGludXggdXBzdHJlYW0uIEl0J3MgZGlmZmljdWx0IGZvciBtZSB0byBhbnN3
ZXIgeW91ciBxdWVzdGlvbnMgYmVjYXVzZSBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRoZSBzcGkg
bmFuZCBmcmFtZXdvcmsgd29ya3MuIEkgY2FuIG1ha2UgY29ycmVjdGlvbnMgaW4gdGhlIHBhdGNo
IGJ1dCB3aXRoIG91dHNpZGUgaGVscC4gVGhhbmtzIQoKSSdtIHNvcnJ5IEkgY2Fubm90IHdyaXRl
IHRoZSBjaGFuZ2VzIGZvciB5b3UsIGJ1dCBJIGNhbiBleHBsYWluIG15CnBvaW50IGJlbG93LgoK
PiA+PiArc3RhdGljIGludCBoeWZ4Z3E0dWRhX29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZv
ICptdGQsIGludCBzZWN0aW9uLAo+ID4+ICsJCQkJICAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpy
ZWdpb24pCj4gPj4gK3sKPiA+PiArCWlmIChzZWN0aW9uID4gMykKPiA+PiArCQlyZXR1cm4gLUVS
QU5HRTsKPiA+PiArCj4gPj4gKwlyZWdpb24tPm9mZnNldCA9IHNlY3Rpb24gKiAxNiArIDg7Cj4g
Pj4gKwlyZWdpb24tPmxlbmd0aCA9IDg7ICAKPiA+IFRoaXMgaXM6IDgtMTUsIDI0LTMxLCA0MC00
NywgNTYtNjIKPiA+ICAKPiA+PiArCj4gPj4gKwlyZXR1cm4gMDsKPiA+PiArfQo+ID4+ICsKPiA+
PiArc3RhdGljIGludCBoeWZ4Z3E0dWRhX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAq
bXRkLCBpbnQgc2VjdGlvbiwKPiA+PiArCQkJCSAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVn
aW9uKQo+ID4+ICt7Cj4gPj4gKwlpZiAoc2VjdGlvbiA+IDMpCj4gPj4gKwkJcmV0dXJuIC1FUkFO
R0U7Cj4gPj4gKwo+ID4+ICsJLyogRUNDLXByb3RlY3RlZCB1c2VyIG1ldGEtZGF0YSAqLwo+ID4+
ICsJcmVnaW9uLT5vZmZzZXQgPSBzZWN0aW9uICogMTYgKyA0Owo+ID4+ICsJcmVnaW9uLT5sZW5n
dGggPSA0OyAgCj4gPiBUaGlzIGlzOiA0LTcsIDIwLTIzLCAzMi0zNSwgNDgtNTEKPiA+Cj4gPiBT
byB3aGF0IGFib3V0IDItNCwgMTYtMTksIDM2LTM5LCA1Mi01NSwgNjMtNjQgPwoKVGhlIE9PQiBh
cmVhIGlzIGEgc3BlY2lmaWMgYXJlYSB3aGVyZSB3ZSBzdG9yZToKLSB0aGUgYmFkIGJsb2NrIG1h
cmtlcjogaXQgaXMgYXQgb2Zmc2V0IDAgYW5kIDEgYW5kIG11c3QgYmUgZXhjbHVkZWQKICBmcm9t
IGJvdGggZnVuY3Rpb25zLgotIEVDQyBieXRlcywgc28gZGF0YSBmb3IgdGhlIGNvcnJlY3Rpb24g
ZW5naW5lOiB0aGUgYW1vdW50IGRlcGVuZCBvbgogIHRoZSBzdHJlbmd0aCBvZiB5b3VyIGNvcnJl
Y3Rpb24gYW5kIHRoZSBwb3NpdGlvbiBkZXBlbmRzIG9uIHRoZQogIGhhcmR3YXJlLiBJZiB0aGlz
IGlzIG5vdCB0b2xkIGluIHRoZSBkYXRhc2hlZXQgZXhwbGljaXRseSB5b3UgY2FuCiAgcGxheSB3
aXRoIGZsYXNoX2VyYXNlL25hbmR3cml0ZS9uYW5kZHVtcDogeW91IGNhbiB3cml0ZSBhIGtub3du
CiAgcGF0dGVybiB0byBhbiBPT0IgYXJlYSB3aXRoIHRoZSBFQ0MgZW5naW5lIGVuYWJsZWQgYW5k
IHlvdSdsbCBzZWUKICB3aGF0IGJ5dGVzIGhhdmUgYmVlbiBzbWFzaGVkIGJ5IHRoZSBFQ0MgZW5n
aW5lLgotIHRoZSByZXN0IGlzIHVzZXIgZGF0YSAodHlwaWNhbGx5IGpmZnMyIG1ldGFkYXRhKS4K
CkluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBzb21lIGJ5dGVzIGFyZSBqdXN0IHVuZGVm
aW5lZCwgd2hpY2ggaXMKbm90IGV4cGVjdGVkLgoKPiA+ICAKPiA+PiArCj4gPj4gKwlyZXR1cm4g
MDsKPiA+PiArfQoKLi4uCgo+ID4+ICtzdGF0aWMgaW50IGh5ZnhncTR1ZGFfZWNjX2dldF9zdGF0
dXMoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kLAo+ID4+ICsJCQkJICAgICB1OCBzdGF0
dXMpCj4gPj4gK3sKPiA+PiArCXN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCA9IHNwaW5hbmRfdG9f
bmFuZChzcGluYW5kKTsKPiA+PiArCj4gPj4gKwlzd2l0Y2ggKHN0YXR1cyAmIFNUQVRVU19FQ0Nf
TUFTSykgewo+ID4+ICsJY2FzZSBTVEFUVVNfRUNDX05PX0JJVEZMSVBTOgo+ID4+ICsJCXJldHVy
biAwOwo+ID4+ICsKPiA+PiArCWNhc2UgU1RBVFVTX0VDQ19VTkNPUl9FUlJPUjoKPiA+PiArCQly
ZXR1cm4gLUVCQURNU0c7Cj4gPj4gKwo+ID4+ICsJY2FzZSBTVEFUVVNfRUNDX0hBU19CSVRGTElQ
UzoKPiA+PiArCQlyZXR1cm4gbmFuZGRldl9nZXRfZWNjX2NvbmYobmFuZCktPnN0cmVuZ3RoID4+
IDE7ICAKPiA+IE1heWJlIGFuIGV4cGxhbmF0aW9uIG9mIHRoaXMgbGluZSBpcyBuZWVkZWQuIElz
IHRoaXMganVzdCBndWVzc2luZyBvcgo+ID4gaXMgdGhpcyBkZWZpbmVkIGluIHRoZSBkYXRhc2hl
ZXQ/CgpUaGUgZGF0YXNoZWV0IHNob3VsZCB0ZWxsIHlvdSB3aGF0IHRoaXMgYml0IG1lYW5zLiBJ
ZiBpdCBtZWFucyBzb21lCmJpdHMgaGF2ZSBiZWVuIGNvcnJlY3RlZCB1cCB0byBoYWxmIG9mIHRo
ZSBzdHJlbmd0aCBjYXBhYmlsaXR5LCB0aGVuCnRoaXMgaXMgZmluZS4gQnV0IHBsZWFzZSBtYWtl
IHN1cmUgdGhpcyBpcyByaWdodCBieSB1c2luZyBuYW5kYml0ZXJycwotaSBmcm9tIHRoZSBtdGQt
dXRpbHMgdGVzdCBzdWl0ZS4KCj4gPiBBbHNvIHBsZWFzZSBkbyBub3QgdXNlIHNoaWZ0cyB3aGVu
IHlvdSB3YW50IHRvIGRpdmlkZS4gSnVzdCB1c2UgLyAyCj4gPiB3aGljaCBpcyBlYXNpZXIgdG8g
dW5kZXJzdGFuZC4gQ29tcGlsZXJzIGtub3cgaG93IHRvIG9wdGltaXplIHRoYXQuCgpUaGlzIGlz
IHNlbGYgZXhwbGFuYXRvcnkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
