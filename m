Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20133EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DVCXMk7wgYqGgLxA8Nu1iCuk8kaUGXs3+qly0Ovpy4=; b=GWaHqt91HmgeJq
	WBqtzxgH92LYTf1QaNHCa8TBJiAjtyOeExHlOJDoHgeFuZalS08OLKSUNNauP9FrBx0XvOtJb67kH
	YMCpLaAljrnRFSHSy6O/eAQb9FQDrgNwGMV+mNJQeLr7z0kDAcZl5uMMCVUxN44oVWSmFhozSvVoc
	UseqTVU0F7r/9XlFSG424lcjEHa0cDUawT4AT1yK5XeUh98/m+fySMjJALNT8WvFFm1PDhieTayaP
	z2JIMo0taaodYkIi4sZbsZLblwy3aUYaYEiUoiR45ToDipxP8LySjqtagslCoRYu4uzmyo9rwRvmH
	BJIpSSV0ApEgXWp8iKvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5c2-007J3T-1x;
	Wed, 19 Jul 2023 11:44:58 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5by-007J2P-0r
	for linux-mtd@lists.infradead.org;
	Wed, 19 Jul 2023 11:44:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69ED920007;
	Wed, 19 Jul 2023 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689767090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+1elfCls/87MTi+eYwm3wYorwbH6Ef6dJRi4wxk4Sh4=;
	b=GWLtlTHcB0MozJzX5pZFkD4txrLFsy3qONC8X/ZqCUaqBnyYj/rgu/bcWM/aAF27TsgbSo
	D9vtVN/9hSTnehCpAaoaAvjL4Ioesvw6HJivMj7QbjQvmpwmrpyBHTQjI3ol5DlUfxFHtb
	7n91dWcl+TQEaNP4+/A2U/XVXxVGC66jdFfIb84HAoaUs2/2kHxq9V/056PebpB/S9XjxO
	cyHYeOOL5+CqlHgT6mHPOQT2obXsG4JSfNSgHF1zWcnNIhnc7tzkNfj7NYQZ5pu0A6BnKO
	B2x8jgDsjygXyD3MRL3vcsAlbnnfoFiArKGps4F1H1bwH5eGWFgMmZUAhtxf8A==
Date: Wed, 19 Jul 2023 13:44:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>, Alexander Shiyan <eagle.alexander923@gmail.com>,
 Domenico Punzo <dpunzo@micron.com>, Bean Huo <beanhuo@micron.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230719134445.08476f5c@xps-13>
In-Reply-To: <yw1xttu0xnf2.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
	<20230716174917.3a9ca7a7@xps-13>
	<yw1x7cqzzr4d.fsf@mansr.com>
	<20230717091900.52ed815a@xps-13>
	<yw1x351mznr0.fsf@mansr.com>
	<20230717183645.32ef90b0@xps-13>
	<yw1xy1jdxqot.fsf@mansr.com>
	<20230719102153.2ef93cfe@xps-13>
	<yw1xttu0xnf2.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_044454_730827_C995C1DA 
X-CRM114-Status: GOOD (  38.31  )
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

SGkgTcOlbnMsCgptYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBXZWQsIDE5IEp1bCAyMDIzIDEwOjI2
OjA5ICswMTAwOgoKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cml0ZXM6Cj4gCj4gPiBIaSBNw6VucywKPiA+Cj4gPiBtYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBU
dWUsIDE4IEp1bCAyMDIzIDE1OjAzOjE0ICswMTAwOgo+ID4gIAo+ID4+IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKPiA+PiAgIAo+ID4+ID4gSGkgTcOl
bnMsCj4gPj4gPgo+ID4+ID4gbWFuc0BtYW5zci5jb20gd3JvdGUgb24gTW9uLCAxNyBKdWwgMjAy
MyAxNDoxMTozMSArMDEwMDoKPiA+PiA+ICAgIAo+ID4+ID4+IE1pcXVlbCBSYXluYWwgPG1pcXVl
bC5yYXluYWxAYm9vdGxpbi5jb20+IHdyaXRlczoKPiA+PiA+PiAgICAgCj4gPj4gPj4gPiBTbywg
SSBzaG91bGQgaGF2ZSBkb25lIHRoYXQgZWFybGllciBidXQsIGNvdWxkIHlvdSBwbGVhc2Ugc2xv
dyB0aGUKPiA+PiA+PiA+IHdob2xlIG9wZXJhdGlvbiBkb3duLCBqdXN0IHRvIHNlZSBpZiB0aGVy
ZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCB0aGUKPiA+PiA+PiA+IHRpbWluZ3Mgb3IgaWYgd2Ug
c2hvdWxkIGxvb2sgaW4gYW5vdGhlciBkaXJlY3Rpb24uCj4gPj4gPj4gPgo+ID4+ID4+ID4gTWF5
YmUgeW91IGNvdWxkIGFkZCBhIGJvb2xlYW4gdG8gZmxhZyBpZiB0aGUgbGFzdCBDTUQgd2FzIGEK
PiA+PiA+PiA+IFJFQURDQUNIRVNFUSwgUkVBRENBQ0hFU1RBUlQgb3IgUkVBRENBQ0hFRU5ELCBh
bmQgaWYgdGhlIGZsYWcgaXMKPiA+PiA+PiA+IHRydWUsIHBsZWFzZSBnZXQgdGhlIGppZmZpZXMg
YmVmb3JlIGFuZCBhZnRlciBlYWNoIHdhaXRyZHkgYW5kCj4gPj4gPj4gPiBkZWxheV9ucy4gRmlu
YWxseSwgcGxlYXNlIHByaW50IHRoZSBleHBlY3RlZCBkZWxheSBhbmQgdGhlIGFjdHVhbCBvbmUK
PiA+PiA+PiA+IGFuZCBjb21wYXJlIHRvIHNlZSBpZiBzb21ldGhpbmcgd2FzIHRvbyBmYXN0IGNv
bXBhcmVkIHRvIHdoYXQgd2UKPiA+PiA+PiA+IGV4cGVjdGVkLiAgICAgIAo+ID4+ID4+IAo+ID4+
ID4+IEJldHdlZW4gd2hpY2ggcG9pbnRzIGV4YWN0bHkgc2hvdWxkIHRoZSBkZWxheSBiZSBtZWFz
dXJlZD8gIEFsc28sIHRoZXJlCj4gPj4gPj4gaXMgbm8gY29tbWFuZCBjYWxsZWQgUkVBRENBQ0hF
U1RBUlQuICBEaWQgeW91IG1lYW4gUkVBRFNUQVJUIG9yCj4gPj4gPj4gc29tZXRoaW5nIGVsc2U/
ICAgIAo+ID4+ID4KPiA+PiA+IFllYWgsIHdoYXRldmVyIGNvbW1hbmQgaXMgc3BlY2lmaWMgdG8g
c2VxdWVudGlhbCBjYWNoZSByZWFkczoKPiA+PiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMjTDEy
MTgKPiA+PiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2Uv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMjTDEyMjggICAgCj4gPj4gCj4gPj4gSSdt
IHN0aWxsIG5vdCBzdXJlIHdoYXQgZXhhY3RseSB5b3Ugd2FudCB0byBtZSBtZWFzdXJlLiAgVGhl
IHdhaXRyZHkgYW5kCj4gPj4gbmRlbGF5IGNvbWJpbmVkLCBlYWNoIHNlcGFyYXRlbHksIG9yIHNv
bWV0aGluZyBlbHNlPwo+ID4+ICAgCj4gPgo+ID4gSSB3b3VsZCBsaWtlIHRvIGtub3csIGhvdyBt
dWNoIHRpbWUgd2Ugc3BlbmQgd2FpdGluZyBpbiBib3RoIGNhc2VzLiAgCj4gCj4gV2hpY2ggImJv
dGgiIGNhc2VzPwoKbmRlbGF5IGFuZCBtb3JlIGltcG9ydGFudGx5LCB3YWl0cmR5OgoKLS0tIGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvb21hcDIuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9v
bWFwMi5jCkBAIC0yMTExLDYgKzIxMTEsNyBAQCBzdGF0aWMgaW50IG9tYXBfbmFuZF9leGVjX2lu
c3RyKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCiAKICAgICAgICBzd2l0Y2ggKGluc3RyLT50eXBl
KSB7CiAgICAgICAgY2FzZSBOQU5EX09QX0NNRF9JTlNUUjoKKyAgICAgICAgICAgICAgIC8vIHRy
YWNlIHRoZSBvcGNvZGUKICAgICAgICAgICAgICAgIGlvd3JpdGU4KGluc3RyLT5jdHguY21kLm9w
Y29kZSwKICAgICAgICAgICAgICAgICAgICAgICAgIGluZm8tPnJlZy5ncG1jX25hbmRfY29tbWFu
ZCk7CiAgICAgICAgICAgICAgICBicmVhazsKQEAgLTIxMzUsMTYgKzIxMzYsMjEgQEAgc3RhdGlj
IGludCBvbWFwX25hbmRfZXhlY19pbnN0cihzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogICAgICAg
ICAgICAgICAgYnJlYWs7CiAKICAgICAgICBjYXNlIE5BTkRfT1BfV0FJVFJEWV9JTlNUUjoKKyAg
ICAgICAgICAgICAgIC8vIHN0YXJ0IHdhaXRyZHkKICAgICAgICAgICAgICAgIHJldCA9IGluZm8t
PnJlYWR5X2dwaW9kID8KICAgICAgICAgICAgICAgICAgICAgICAgbmFuZF9ncGlvX3dhaXRyZHko
Y2hpcCwgaW5mby0+cmVhZHlfZ3Bpb2QsIGluc3RyLT5jdHgud2FpdHJkeS50aW1lb3V0X21zKSA6
CiAgICAgICAgICAgICAgICAgICAgICAgIG5hbmRfc29mdF93YWl0cmR5KGNoaXAsIGluc3RyLT5j
dHgud2FpdHJkeS50aW1lb3V0X21zKTsKKyAgICAgICAgICAgICAgIC8vIGVuZAogICAgICAgICAg
ICAgICAgaWYgKHJldCkKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKICAgICAg
ICAgICAgICAgIGJyZWFrOwogICAgICAgIH0KIAotICAgICAgIGlmIChpbnN0ci0+ZGVsYXlfbnMp
CisgICAgICAgaWYgKGluc3RyLT5kZWxheV9ucykgeworICAgICAgICAgICAgICAgLy8gc3RhcnQg
ZGVsYXkKICAgICAgICAgICAgICAgIG5kZWxheShpbnN0ci0+ZGVsYXlfbnMpOworICAgICAgICAg
ICAgICAgLy8gZW5kCisgICAgICAgfQogCiAgICAgICAgcmV0dXJuIDA7CiB9Cgo+ID4gSXMgdGhl
cmUgc29tZXRoaW5nIHdyb25nIHdpdGggdGhlICJ3YWl0IHJlYWR5Ij8gQXMgd2UgY2Fubm90IG9i
c2VydmUKPiA+IHRoZSB0aW1pbmdzIHdpdGggYSBzY29wZSwgYmVjYXVzZSB3ZSBhcmUgdXNpbmcg
YSAic29mdCIgY29udHJvbGxlcgo+ID4gaW1wbGVtZW50YXRpb24gc29tZWhvdywgd2UgY2FuIGVh
c2lseSBtZWFzdXJlIGhvdyBtdWNoIHRpbWUgd2Ugc3BlbmQKPiA+IGluIGVhY2ggb3BlcmF0aW9u
IGJ5IG1lYXN1cmluZyB0aGUgdGltZSBiZWZvcmUgYW5kIGFmdGVyLgo+ID4KPiA+IFRoZXNlIGlu
Zm9ybWF0aW9uIGFyZSBvbmx5IHVzZWZ1bCB3aGVuIHdlIGFyZSBkb2luZyBvcGVyYXRpb25zIHJl
bGF0ZWQKPiA+IHRvIHNlcXVlbnRpYWwgcmVhZHMuICAKPiAKPiBJIGhhdmUgaG9va2VkIHVwIHNv
bWUgc3BhcmUgR1BJT3MgdG8gYSBzY29wZSwgd2hpY2ggc2hvdWxkIGJlIG1vcmUKPiBhY2N1cmF0
ZSAobmFub3NlY29uZCkgdGhhbiBzb2Z0d2FyZSB0aW1lc3RhbXBzLiAgQWxsIEkgbmVlZCB0byBr
bm93IGlzCj4gd2hhdCB0byBtZWFzdXJlIGFuZCB3aGF0IHRvIGxvb2sgZm9yIGluIHRob3NlIG1l
YXN1cmVtZW50cy4KCkdyZWF0LiBUaGUgb25seSBpc3N1ZSB3aXRoIHRoZSBzY29wZSBpcyB0aGUg
ZmFjdCB0aGF0IHdlIG1pZ2h0IGFjdHVhbGx5Cmxvb2sgYXQgc29tZXRoaW5nIHRoYXQgaXMgbm90
IGEgZmF1bHR5IHNlcXVlbnRpYWwgcmVhZCBvcC4gVW5sZXNzIHlvdQpoYWNrIGludG8gdGhlIGNv
cmUgdG8gcGVyZm9ybSB0aGVzZSBpbiBhIGxvb3AgKHdpdGggYSBicnV0YWwgIndoaWxlCigxKSIp
LiBCdXQgSSBkb24ndCB0aGluayB3ZSByZXF1aXJlIGJpZyBwcmVjaXNpb24gaGVyZSwgYXQgbGVh
c3QgYXMgYQpmaXJzdCBzdGVwLCBsb29raW5nIGF0IHNvZnR3YXJlIHRpbWVzdGFtcHMgbGlrZSBo
aW50ZWQgYWJvdmUgaXMgZW5vdWdoCnNvIHdlIGNhbiBlYXNpbHkgaWRlbnRpZnkgdGhlIGRpZmZl
cmVudCBkZWxheXMgYW5kIGNvbXBhcmUgdGhlbSB3aXRoCm5hbmRfdGltaW5ncy5jLgoKUGxlYXNl
IHVzZSB3aGF0ZXZlciBtZXRob2QgaXMgZWFzaWVyIGZvciB5b3UuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
