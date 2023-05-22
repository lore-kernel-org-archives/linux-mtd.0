Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2C3C7EE23
	for <linux-mtd@archiver.kernel.org>; Mon, 22 May 2023 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eLZW8RhyZepSikN2s2hSt9rS+9ONJ1zsi6ut8jra0Q=; b=DFuBg4ExVCHgww
	hhwgsG0BcxVtBcextNcNI/8L9olrUl0cTS5Tls0mpy2/m6kBheO39I/GKIOmzopZtfKQuVxMMwPzS
	hZXM2hNgfPX/U0jQfLH4/23CmP85tJXzbw2o3AmW80SRuXva5p+7CyEV+/DBNdffMj+ZgWvBUISk2
	QSpGNvmhS5qgqpgKOtxXMSMnIdejA4cSwxJYUnwt4GUSNP6fKK/cP+x37pl8iUm6yMivzp42a7BGL
	OK1TynCofoAfkdbDwbwuuYBXR+kDGfbHEoAv6TfHCnTKtOOIIgmChnXyhLox1AbFN30lycC3iLmpn
	xDip76b2vawXh6k6WOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q17hR-0074Gx-00;
	Mon, 22 May 2023 15:43:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q17hM-0074Db-33;
	Mon, 22 May 2023 15:43:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3DFB82000D;
	Mon, 22 May 2023 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684770225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ox+wsPpRCNR227lvEXncicX9pnHGCiMOaGeBN0930yg=;
	b=DStJfJA4msEKW9NT2t6xDdbkIi2McFz+PEwtOSRxKG3ARYJmLpo50FI6A0PnUpTjVHZw5W
	AtJ1SqAfOIlQkS/6/97yOIrlwBQZWdjA+3E6fOX1bgPWGj3TzEqoDFVlxjfkI/lALSd9+K
	eMItGikC6vqJjvxBeAR5p8hurFbMnanzHwnLHJ9DrNDvaiM4NV3nRZd9bja8S+Gt39DWyr
	jH5cz+YZ/BLoL+KbW2paNL6QJsgNTZSdMPcKqJaFMup0MzEEOPkGi94mIe4q/+nKQb0umb
	7PHi88VFIJnjFkCGNeUd7jFo2RcY3/+m9sHFa3HM7ETGvxCW1cycGT49YbChRg==
Date: Mon, 22 May 2023 17:43:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Liang Yang <liang.yang@amlogic.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Yixun Lan <yixun.lan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, <oxffffaa@gmail.com>,
 <kernel@sberdevices.ru>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] mtd: rawnand: meson: check buffer length
Message-ID: <20230522174342.71bf6e88@xps-13>
In-Reply-To: <20230515094440.3552094-5-AVKrasnov@sberdevices.ru>
References: <20230515094440.3552094-1-AVKrasnov@sberdevices.ru>
	<20230515094440.3552094-5-AVKrasnov@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_084349_251316_B371B58B 
X-CRM114-Status: GOOD (  17.94  )
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

SGkgQXJzZW5peSwKCkFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBNb24sIDE1IE1h
eSAyMDIzIDEyOjQ0OjM4ICswMzAwOgoKPiBUaGlzIE5BTkQgY29udHJvbGxlciBoYXMgbGltaXRl
ZCBidWZmZXIgbGVuZ3RoLCBzbyBjaGVjayBpdCBiZWZvcmUKPiBjb21tYW5kIGV4ZWN1dGlvbiB0
byBhdm9pZCBsZW5ndGggdHJpbS4gQWxzbyBjaGVjayBNVEQgd3JpdGUgc2l6ZSBvbgo+IGNoaXAg
YXR0YWNoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNi
ZXJkZXZpY2VzLnJ1Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMg
fCAyMiArKysrKysrKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiBp
bmRleCBhMzExMDZjOTQzZDcuLmRjMGQ3MTYwNTIwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMKPiBAQCAtMTExLDYgKzExMSw4IEBACj4gICNkZWZpbmUgTkZDX1VTRVJfQllURVMJ
CTIKPiAgI2RlZmluZSBORkNfT09CX1BFUl9FQ0MobmFuZCkJKChuYW5kKS0+ZWNjLmJ5dGVzICsg
TkZDX1VTRVJfQllURVMpCj4gIAo+ICsjZGVmaW5lIE5GQ19DTURfUkFXX0xFTgkJR0VOTUFTSygx
MywgMCkKPiArCj4gIHN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwIHsKPiAgCXN0cnVjdCBsaXN0
X2hlYWQgbm9kZTsKPiAgCXN0cnVjdCBuYW5kX2NoaXAgbmFuZDsKPiBAQCAtMjg0LDcgKzI4Niw3
IEBAIHN0YXRpYyB2b2lkIG1lc29uX25mY19jbWRfYWNjZXNzKHN0cnVjdCBuYW5kX2NoaXAgKm5h
bmQsIGludCByYXcsIGJvb2wgZGlyLAo+ICAKPiAgCWlmIChyYXcpIHsKPiAgCQlsZW4gPSBtdGQt
PndyaXRlc2l6ZSArIG10ZC0+b29ic2l6ZTsKPiAtCQljbWQgPSAobGVuICYgR0VOTUFTSygxMywg
MCkpIHwgc2NyYW1ibGVyIHwgRE1BX0RJUihkaXIpOwo+ICsJCWNtZCA9IGxlbiB8IHNjcmFtYmxl
ciB8IERNQV9ESVIoZGlyKTsKPiAgCQl3cml0ZWwoY21kLCBuZmMtPnJlZ19iYXNlICsgTkZDX1JF
R19DTUQpOwo+ICAJCXJldHVybjsKPiAgCX0KPiBAQCAtNTYyLDYgKzU2NCw5IEBAIHN0YXRpYyBp
bnQgbWVzb25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGlu
dCBsZW4pCj4gIAl1MzIgY21kOwo+ICAJdTggKmluZm87Cj4gIAo+ICsJaWYgKGxlbiA+IE5GQ19D
TURfUkFXX0xFTikKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gIAlpbmZvID0ga3phbGxvYyhQ
RVJfSU5GT19CWVRFLCBHRlBfS0VSTkVMKTsKPiAgCWlmICghaW5mbykKPiAgCQlyZXR1cm4gLUVO
T01FTTsKPiBAQCAtNTcxLDcgKzU3Niw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3JlYWRfYnVm
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYsIGludCBsZW4pCj4gIAlpZiAocmV0KQo+
ICAJCWdvdG8gb3V0Owo+ICAKPiAtCWNtZCA9IE5GQ19DTURfTjJNIHwgKGxlbiAmIEdFTk1BU0so
MTMsIDApKTsKPiArCWNtZCA9IE5GQ19DTURfTjJNIHwgbGVuOwo+ICAJd3JpdGVsKGNtZCwgbmZj
LT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPiAgCj4gIAltZXNvbl9uZmNfZHJhaW5fY21kKG5m
Yyk7Cj4gQEAgLTU5MCwxMiArNTk1LDE1IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3dyaXRlX2J1
ZihzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCB1OCAqYnVmLCBpbnQgbGVuKQo+ICAJaW50IHJldCA9
IDA7Cj4gIAl1MzIgY21kOwo+ICAKPiArCWlmIChsZW4gPiBORkNfQ01EX1JBV19MRU4pCj4gKwkJ
cmV0dXJuIC1FSU5WQUw7CgpJIHRoaW5rIHRoaXMgaGVscGVyIGlzIHJlbGF0ZWQgdG8gZXhlY19v
cCwgaWYgeWVzLCB5b3Ugc2hvdWxkIHByb2JhYmx5CmFzayBhbiBlYXJseSBjaGVjayBpbiB0aGUg
ZXhlY19vcCBpbXBsZW1lbnRhdGlvbiAocGVyaGFwcyBhcyBwYXJ0IG9mIGEKZGVkaWNhdGVkIGhl
bHBlcikuCgpTYW1lIGFib3ZlLgoKT3RoZXJ3aXNlIGxvb2tzIGdvb2QuCgo+ICsKPiAgCXJldCA9
IG1lc29uX25mY19kbWFfYnVmZmVyX3NldHVwKG5hbmQsIGJ1ZiwgbGVuLCBOVUxMLAo+ICAJCQkJ
CSAwLCBETUFfVE9fREVWSUNFKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4g
LQljbWQgPSBORkNfQ01EX00yTiB8IChsZW4gJiBHRU5NQVNLKDEzLCAwKSk7Cj4gKwljbWQgPSBO
RkNfQ01EX00yTiB8IGxlbjsKPiAgCXdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVH
X0NNRCk7Cj4gIAo+ICAJbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+IEBAIC0xMzI4LDYgKzEz
MzYsNyBAQCBzdGF0aWMgaW50IG1lc29uX25hbmRfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hp
cCAqbmFuZCkKPiAgCXN0cnVjdCBtZXNvbl9uZmNfbmFuZF9jaGlwICptZXNvbl9jaGlwID0gdG9f
bWVzb25fbmFuZChuYW5kKTsKPiAgCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19tdGQo
bmFuZCk7Cj4gIAlpbnQgbnNlY3RvcnMgPSBtdGQtPndyaXRlc2l6ZSAvIDEwMjQ7Cj4gKwlpbnQg
cmF3X3dyaXRlc2l6ZTsKPiAgCWludCByZXQ7Cj4gIAo+ICAJaWYgKCFtdGQtPm5hbWUpIHsKPiBA
QCAtMTMzOSw2ICsxMzQ4LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25fbmFuZF9hdHRhY2hfY2hpcChz
dHJ1Y3QgbmFuZF9jaGlwICpuYW5kKQo+ICAJCQlyZXR1cm4gLUVOT01FTTsKPiAgCX0KPiAgCj4g
KwlyYXdfd3JpdGVzaXplID0gbXRkLT53cml0ZXNpemUgKyBtdGQtPm9vYnNpemU7Cj4gKwlpZiAo
cmF3X3dyaXRlc2l6ZSA+IE5GQ19DTURfUkFXX0xFTikgewo+ICsJCWRldl9lcnIobmZjLT5kZXYs
ICJ0b28gYmlnIHdyaXRlIHNpemUgaW4gcmF3IG1vZGU6ICVkID4gJWxkXG4iLAo+ICsJCQlyYXdf
d3JpdGVzaXplLCBORkNfQ01EX1JBV19MRU4pOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+
ICsKPiAgCWlmIChuYW5kLT5iYnRfb3B0aW9ucyAmIE5BTkRfQkJUX1VTRV9GTEFTSCkKPiAgCQlu
YW5kLT5iYnRfb3B0aW9ucyB8PSBOQU5EX0JCVF9OT19PT0I7Cj4gIAoKClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
