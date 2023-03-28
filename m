Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CC6C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msoigqRysJ4DJ/1Uq//S6oUo3WcH9PLYNsMr19FgKlg=; b=OI3B/j79lTtNlX
	FRvcz8TdSSIlrkQWYOB7AWOyls0BN9xjyjsUUlmf5KYgWleXuRjQ7AGroyXQO1QoYvBmJyEx4tmgl
	2PVGhVgvx8UQR7RZtnr49dDBtxuzHc8GylnAI1Z24egEv+hH4Z0WV5XTtT2Zn/BHZlLkBDhub6NFD
	VkD/xI87e6mothsDExVn4U4NVk/OKnSBb2FMFt5SYjLHqErxsLEYAro5FHNFcTAIs8OSC+z/5xqvU
	EQvbTXG3iHOxkOVSxgZYbgxS6uDEJBNB0DJPI/EIc0nGhaU6uX0wTLU90mHi0bZ1xFYFQo/LBGk2E
	K1OujG9ejJL1FFXSVk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph4CG-00DXZP-23;
	Tue, 28 Mar 2023 07:56:48 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph4CD-00DXY2-0A
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 07:56:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A5C92100008;
	Tue, 28 Mar 2023 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679990198;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zr1o5TB0Xj1P1dQ5QPlZqlhmW5d3VRuBkiP3EgOGwTw=;
	b=eioNhmkwx4o6qxydayUajT7JJJwg2Ee8Ma2qYzqPd+QNmP8g9tAgZz4ik0cEEHBl8+UqP4
	nC+GHT1SCbGQTUoQsVBBMOJmk7fhg1hhdesjsh6051Cu+nVKqAbLB31zo+M1ZRQeLQHeWV
	sg8dX/J26JIyt6+oYnh7PvEMJ+B88MbdLMeajQBazRAZgsl7/PpcUkL+xmm23Pxxsa3TBj
	4RcYNJaouNTjqxqIOv7HmXQIAfwXKE+dNbadr6pOjmq5iZBas/HHdIColfTxL2ki9dMmIV
	W1Mxht/dvCOmphpl0p4u2J0dgEm1j7bCVIFbpUuTDE00euphHMYAnuNAAQSMsA==
Date: Tue, 28 Mar 2023 09:56:33 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use timings.mode
 instead of checking tRC_min
Message-ID: <20230328095633.188aff27@xps-13>
In-Reply-To: <6759a843-409b-d9fe-8a00-ed6d69144aaf@foss.st.com>
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
	<20230327094742.38856-3-christophe.kerello@foss.st.com>
	<75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
	<20230327124313.1ccd3d66@xps-13>
	<70d0a8b6-62c2-fa3e-df5c-f86ba75484d0@linaro.org>
	<6759a843-409b-d9fe-8a00-ed6d69144aaf@foss.st.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_005645_389064_0C709205 
X-CRM114-Status: GOOD (  27.87  )
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

SGkgQ2hyaXN0b3BoZSwKCmNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0LmNvbSB3cm90ZSBvbiBU
dWUsIDI4IE1hciAyMDIzIDA5OjI3OjU1ICswMjAwOgoKPiBIZWxsbyBNaXF1ZWwsCj4gCj4gT24g
My8yNy8yMyAxMzowNiwgVHVkb3IgQW1iYXJ1cyB3cm90ZToKPiA+IAo+ID4gCj4gPiBPbiAzLzI3
LzIzIDExOjQzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4gSGkgVHVkb3IsCj4gPj4KPiA+
PiB0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gTW9uLCAyNyBNYXIgMjAyMyAxMToz
MDo1MSArMDEwMDoKPiA+PiAgCj4gPj4+IE9uIDMvMjcvMjMgMTA6NDcsIENocmlzdG9waGUgS2Vy
ZWxsbyB3cm90ZTogIAo+ID4+Pj4gVGhpcyBwYXRjaCBpcyB1c2luZyB0aW1pbmdzLm1vZGUgdmFs
dWUgaW5zdGVhZCBvZiBjaGVja2luZyB0UkNfbWluIHRpbWluZwo+ID4+Pj4gZm9yIEVETyBtb2Rl
IHN1cHBvcnQuICAKPiA+Pj4+ICAgID4+PiAgCj4gPj4+IEZpeGVzIGFuZCBDYyB0byBzdGFibGUg
aGVyZSB0b28sIGFzIHlvdSdkIGxpa2UgdG8gaGF2ZSB0aGlzIGJhY2twb3J0ZWQKPiA+Pj4gYXMg
d2VsbCwgZG9uJ3QgeW91PyAgCj4gPj4KPiA+PiBBY3R1YWxseSB0aGUgcmVhc29uIHdoeSBDaHJp
c3RvcGhlIHNwbGl0IHRoaXMgaW50byB0d28gcGF0Y2hlcyBpcwo+ID4+IGJlY2F1c2UgdGltaW5n
cy5tb2RlIHdhcyBpbnRyb2R1Y2VkIHJhdGhlciBsYXRlbHksIGhlIHdhbnRlZCB0aGUgc2FtZQo+
ID4+IHBhdGNoIHRvIGFwcGx5IG9uIGFsbCBzdGFibGUga2VybmVscywgaGUgYWN0dWFsbHkgYXNr
ZWQgZm9yIHRoYXQgc3BsaXQKPiA+PiBhbmQgSSBhZ3JlZWQgKGFub3RoZXIgc29sdXRpb24gd291
bGQgaGF2ZSBiZWVuIHRvIHNlbmQgdGhpcyBjdXJyZW50Cj4gPj4gcGF0Y2ggdG8gTGludXMgYW5k
IGhhdmUgdGhlIG90aGVyIHZlcnNpb24gc2VudCB0byBzdGFibGUsIGJ1dCBpdAo+ID4+IHJlcXVp
cmVzIGEgYml0IG9mIHNjaGVkdWxpbmcgb24gYm90aCBlbmRzKS4KPiA+Pgo+ID4+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIzMDMyNzEwMTE1Ni4wZWMyODE2YUB4
cHMtMTMvVC8jdCAgCj4gPiAKPiA+IFJpZ2h0LCBJIHVuZGVyc3Rvb2QgdGhhdCBmcm9tIHRoZSBi
ZWdpbm5pbmcuIElmIGl0IHdlcmUgdG8gbWUsIEkgd291bGQKPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnICN2NS40KyBmb3IgdGhlIGZpcnN0IHBhdGNoIGFuZAo+ID4gQ2M6IHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmcgI3Y1LjEwKyBmb3IgdGhlIHNlY29uZC4KPiA+IAo+ID4gU28gZmlyc3Qg
d291bGQgYmUgYWxvbmUganVzdCBpbiB2NS40LCBhbmQgc3RhcnRpbmcgd2l0aCB2NS4xMCB3ZSds
bCBoYXZlCj4gPiBib3RoIGFuZCB3ZSdsbCBtaW1pYyB3aGF0IHdlIGN1cnJlbnRseSBoYXZlIGlu
IHVwc3RyZWFtIG1haW5saW5lLgo+ID4gICAKPiAKPiBJIGNhbiBzZW5kIGEgVjMgd2l0aCBjYyB0
YWcgYWRkZWQgYXMgcGVyIFR1ZG9yJ3Mgc3VnZ2VzdGlvbi4KPiBPciBjYyB0YWcgd2lsbCBiZSBh
ZGRlZCB3aGVuIHRoZSBwYXRjaGVzIHdpbGwgYmUgYXBwbGllZD8KCkknbGwgaGFuZGxlIGl0LCBu
byBwcm9ibGVtLiBJcyBpdCBmaW5lIGlmIEkgc2VuZCB0aGlzIGFzIHBhcnQgb2YgdGhlCm5leHQg
bWVyZ2Ugd2luZG93IG9yIGRvIHlvdSBleHBlY3QgdGhpcyBmaXggdG8gYmUgYXBwbGllZCBlYXJs
aWVyPyBJCmp1c3Qgc2VudCBteSBmaXhlcyBQUiBvbiBNb25kYXkgbW9ybmluZy4KCj4gCj4gUmVn
YXJkcywKPiBDaHJpc3RvcGhlIEtlcmVsbG8uCj4gCj4gPj4gIAo+ID4+PiAgCj4gPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEtlcmVsbG8gPGNocmlzdG9waGUua2VyZWxsb0Bmb3NzLnN0
LmNvbT4gIAo+ID4+Pgo+ID4+PiBSZXZpZXdlZC1ieTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1i
YXJ1c0BsaW5hcm8ub3JnPgo+ID4+PiAgCj4gPj4+PiAtLS0KPiA+Pj4+ICAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3RtMzJfZm1jMl9uYW5kLmMgfCAyICstCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jCj4gPj4+PiBpbmRleCAzYWJiNjNkMDBhMGIuLjllNzRi
Y2Q5MGFhYSAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3N0bTMyX2Zt
YzJfbmFuZC5jCj4gPj4+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25h
bmQuYwo+ID4+Pj4gQEAgLTE1MzEsNyArMTUzMSw3IEBAIHN0YXRpYyBpbnQgc3RtMzJfZm1jMl9u
ZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGludCBjaGlwbnIsCj4g
Pj4+PiAgIAlpZiAoSVNfRVJSKHNkcnQpKQo+ID4+Pj4gICAJCXJldHVybiBQVFJfRVJSKHNkcnQp
OyAgCj4gPj4+PiAgID4+Pj4gLQlpZiAoc2RydC0+dFJDX21pbiA8IDMwMDAwKSAgCj4gPj4+PiAr
CWlmIChjb25mLT50aW1pbmdzLm1vZGUgPiAzKQo+ID4+Pj4gICAJCXJldHVybiAtRU9QTk9UU1VQ
UDsgIAo+ID4+Pj4gICA+Pj4+ICAgCWlmIChjaGlwbnIgPT0gTkFORF9EQVRBX0lGQUNFX0NIRUNL
X09OTFkpICAKPiA+Pgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+IE1pcXXDqGwgIAoKClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
