Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E441D41C1D
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JW7MsfsUel1ypV4tsuHHUBRmzT84KNTPT24VBknz4kA=; b=j4O3SkN/jzrjNo
	wNsuq/DglGKaQ5LX5b7pXDn2l735ZcEzPeFG0H2LWbIsiGmt3O5dYkVF2GyRNmY66FoIczOEOycd6
	zOifscs4qoCjcsnGVDpNRYcjjoQM+u4wy0u9Hq/FEPar7kqCgF5LJtdDArV9SifuuXZ3Qh/YCG48K
	7L02Uhj3Fek++/QuGqOx8GdBGfQFs91SUbewsVolWXYPwQqvuacm6SuGiAtwO1EnZS87npw07mtjc
	JDaFAGxb1wCN2WGPFW/3gMm+oGr6Z5FkWwOJNtEUeQtCFU4Dp1vhXMOy0b7IMWCYx8cBW4MVjOwaL
	LgwVvtyyxHabjIqvA/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9P3-00000006Cl5-31qb;
	Wed, 13 Nov 2024 09:11:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9P0-00000006CiD-0nLd
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 09:11:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BBC54FF80B;
	Wed, 13 Nov 2024 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731489061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L7L1NeDzcHT0/WA+GQpxgIvQmTB3fsrw7V4xKspE2Mg=;
	b=ToE3Fz95JhEBqIVS5PaEjd3MuO7u+rbzfb6atscIDvLNk3UOCYUspawNBhDWypESe3H5wW
	laoHgCCz1jBRqRGgtFzDfGwUoEnGyEuLHJrlS5sMwYrBo4INsHbyRfWkFe1ZnfCulpmWxI
	IUdpq1AQzIbnP56TnA1ACEvgwkOFJOpdpwPlERCe4yFWQyiGqn1eFmeDdrMcfC3e3RF6vd
	rUk5aAteT/qf1H4fZxW6OBfwCV3gXdwlCigqE5L+JeYTvPFmUgSAoRLwQKSboN2qhXzCPs
	SKDD4pHabK8doRmNH8ziECCnnZeMumf6Fe5+4Hk2r/QsXSlJJM/AorKOr6J3Rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  kr.kim@skyhighmemory.com,  zhi.feng@skyhighmemory.com,
  Bacem.Daassi@infineon.com,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 1/2] mtd: spinand: Introduce a way to avoid raw access
In-Reply-To: <baeab3bf-fedf-4258-84d6-a0c53cb59ef0@gmail.com> (Takahiro
	Kuwano's message of "Wed, 13 Nov 2024 11:06:21 +0900")
References: <cover.1730340421.git.Takahiro.Kuwano@infineon.com>
	<81c9caf04c94cba1a5ae4ba79dd09e0789583fcd.1730340421.git.Takahiro.Kuwano@infineon.com>
	<87bjylsirs.fsf@bootlin.com>
	<baeab3bf-fedf-4258-84d6-a0c53cb59ef0@gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 13 Nov 2024 10:11:00 +0100
Message-ID: <87zfm3qz17.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_011106_512755_F057EFC8 
X-CRM114-Status: GOOD (  18.86  )
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

T24gMTMvMTEvMjAyNCBhdCAxMTowNjoyMSArMDksIFRha2FoaXJvIEt1d2FubyA8dGt1dzU4NDky
NEBnbWFpbC5jb20+IHdyb3RlOgoKPiBIaSwKPgo+IE9uIDExLzEyLzIwMjQgMzo1NCBBTSwgTWlx
dWVsIFJheW5hbCB3cm90ZToKPj4gSGksCj4+IAo+PiBPbiAzMS8xMC8yMDI0IGF0IDExOjIxOjU0
ICswOSwgdGt1dzU4NDkyNEBnbWFpbC5jb20gd3JvdGU6Cj4+IAo+Pj4gRnJvbTogVGFrYWhpcm8g
S3V3YW5vIDxUYWthaGlyby5LdXdhbm9AaW5maW5lb24uY29tPgo+Pj4KPj4+IFNreUhpZ2ggc3Bp
bmFuZCBkZXZpY2UgaGFzIEVDQyBlbmFibGUgYml0IGluIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIg
YnV0Cj4+PiBpdCBtdXN0IGJlIGFsd2F5cyBlbmFibGVkLiBJZiBFQ0MgaXMgZGlzYWJsZWQsIHJl
YWQgYW5kIHdyaXRlIG9wcwo+Pj4gcmVzdWx0cyBpbiB1bmRldGVybWluZWQgc3RhdGUuIEZvciBz
dWNoIGRldmljZXMsIGEgd2F5IHRvIGF2b2lkIHJhdwo+Pj4gYWNjZXNzIGlzIG5lZWRlZC4KPj4+
Cj4+PiBJbnRyb2R1Y2UgU1BJTkFORF9OT19SQVdfQUNDRVNTIGZsYWcgdG8gYWR2ZXJ0aXNlIHRo
ZSBkZXZpY2UgZG9lcyBub3QKPj4+IHN1cHBvcnQgcmF3IGFjY2Vzcy4gUmVhZCBhbmQgd3JpdGUg
cGFnZSBpbiByYXcgbW9kZSBmb3IgdGhlIGRldmljZQo+Pj4gcmV0dXJucyBlcnJvci4KPj4+Cj4+
PiBDaGVja2luZyBhbmQgbWFya2luZyBCQk0gbmVlZCB0byBiZSBwZXJmb3JtZWQgd2l0aCBFQ0Mg
ZW5hYmxlZCB0byByZWFkCj4+PiBhbmQgd3JpdGUgdGhlIEJCTSBjb3JyZWN0bHkuCj4+IAo+PiBJ
IHNlZSB5b3VyIHBvaW50IGJ1dCBJJ20gYSBiaXQgcHV6emxlZCBieSBob3cgaXQncyBiZWluZyBk
b25lLgo+PiAKPj4gRmlyc3QsIHlvdSBkaXNyZWdhcmQgY29tcGxldGVseSB0aGUgaXNiYWQoKSBh
bmQgbWFya2JhZCgpCj4+IHNpdHVhdGlvbnMuIFBsZWFzZSBoYXZlIGxvb2sgaW50byB0aGF0IGJl
Y2F1c2UgdGhlc2UgZnVuY3Rpb25zIGFyZQo+PiBicm9rZW4gd2l0aCB5b3VyIGRldmljZXMuCj4+
IAo+IFllcy4uLiBub3cgSSB1bmRlcnN0YW5kIGhvdyB0aGV5IGFyZSBicm9rZW4uCj4KPj4gU2Vj
b25kLCB3aGF0IGFib3V0IGFkZGluZyB0aGlzIGRldGFpbCB0byB0aGUgb25kaWUgRUNDIGVuZ2lu
ZT8gWW91IGNvdWxkCj4+IHNpbXBseSByZXR1cm4gYW4gZXJyb3IgZnJvbSB0aGVyZSwgc28gYmFz
aWNhbGx5IGEgc2luZ2xlIChvciBtYXliZSB0d28pCj4+IGNoYW5nZXMgb3ZlcmFsbC4KPj4gCj4g
VGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4KPiBIb3cgYWJvdXQgY2hhbmdlIGxpa2UgYmVs
b3cgaW4gcHJlcGFyZV9maW5pc2hfaW9fcmVxKCk/Cj4KPiBzdGF0aWMgaW50IHNwaW5hbmRfb25k
aWVfZWNjX3ByZXBhcmVfaW9fcmVxKHN0cnVjdCBuYW5kX2RldmljZSAqbmFuZCwKPiAJCQkJCSAg
ICBzdHJ1Y3QgbmFuZF9wYWdlX2lvX3JlcSAqcmVxKQo+IHsKPiAJc3RydWN0IHNwaW5hbmRfZGV2
aWNlICpzcGluYW5kID0gbmFuZF90b19zcGluYW5kKG5hbmQpOwo+IAlib29sIGVuYWJsZSA9IChy
ZXEtPm1vZGUgIT0gTVREX09QU19SQVcpOwo+Cj4gKwkvKgo+ICsJICogRm9yIHRoZSBkZXZpY2Vz
IHRoYXQgcHJvaGliaXQgcmF3IGFjY2VzcyAob24tZGllIEVDQyBtdXN0IGJlIGFsd2F5cwo+ICsJ
ICogZW5hYmxlZCksIHJldHVybiBlcnJvciBpbiBjYXNlIG9mIHJhdyBkYXRhIGFjY2Vzcy4gQWNj
ZXNzaW5nIHRvIE9PQgo+ICsJICogbmVlZHMgdG8gYmUgYWxsb3dlZCB3aXRoIG9uLWRpZSBFQ0Mg
ZW5hYmxlZCB0byBzdXBwb3J0IEJCTSBjaGVja2luZwo+ICsJICogYW5kIG1hcmtpbmcuCj4gKwkg
Ki8KPiArCWlmICghZW5hYmxlICYmIHNwaW5hbmQtPmZsYWdzICYgU1BJTkFORF9OT19SQVdfQUND
RVNTKSB7Cj4gKwkJaWYgKHJlcS0+ZGF0YWxlbikKPiArCQkJcmV0dXJuIC1FTk9UU1VQUDsKCkVP
UE5PVFNVUFAKCj4gKwo+ICsJCWVuYWJsZSA9IHRydWU7Cj4gKwl9CgpObywgdGhpcyBpcyBseWlu
ZywgSSBkb24ndCBsaWtlIHRoYXQuCgpXaGF0IGFib3V0IGp1c3QgcmV0dXJuaW50IGFuIGVycm9y
IGhlcmUgaWYgeW91IGNhbm5vdCBkbyB3aGF0IHRoZSB1cHBlcgpsYXllciBoYXMgYXNrZWQgeW91
IHRvIGRvLiBBbmQgaW4gdGhlIHVwcGVyIGxheWVyLCB5b3UgY2FuIGFkZCB0d28Kc3BlY2lmaWMg
Y29uZGl0aW9ucyB0byBpc19iYWQvbWFya19iYWQoKSBhbGxvd2luZyB0byBmYWxsYmFjayB0byBh
ICJ3aXRoCkVDQyIgb3BlcmF0aW9uIGluIHRoZSBFT1BOT1RTVVBQIGNhc2UgKHdpdGggYSBzaG9y
dCBjb21tZW50KS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
