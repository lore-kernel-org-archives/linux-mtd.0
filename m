Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF81E7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 10:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kp1b6BRW2uxCFcvDeDCJoGGnbqP4+uJKuadJUIu01tg=; b=ysUcwt5KOAEQrr
	FCVEMtkxIUtXGqmXYNn8/fr36AIo9JRMkQH/lgtFD3cToYCJkPHtprWMv9dyujwv5BKEW+CnyTXr5
	Qvj+Kk01Fu6DwN2IF5IwSPN0qxvGVraMlqyVgzzTWD5O137Cr6oIZw0wmXtgJc+0GFTR8Vp6zQqSw
	DRLHx2a61Eyi2g7/JLagVcB8G6UVYfr5topTvdHPibNr8VA0jJXJac90x6RkAJ7XRtYRrgBC5XiCV
	xPzLSy0RMCT+09bUiStPFJfZY+6e2NHPfeBEYm7OMCnelMsx3/nZD9sU0qWc+CmPJ7dtxHYIgumXH
	1wQ6t6PkpXZBww1i15Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3CG-00000003TEW-1h3M;
	Fri, 13 Dec 2024 10:47:00 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3CD-00000003TCO-0eNq
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 10:46:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5DCF0FF803;
	Fri, 13 Dec 2024 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734086812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cpv1f4d1Denqxrkp/DJziBw32IQoHhesGRzVxzzRqrc=;
	b=Vn0yJgrpJ9sNCTp7+S8LY7raiq1WrUd2hXY2cTBL7DjOSfWLycK4rvw3Kmz2dn1KY0q/Mp
	ws2NecT6ZCuNjrzw2z6GBQMyDM8mh40radLnItljyIj8PWR1zGlVFY1RO3C6Ll3m+Z344Q
	TIejjkeCxx7e97oRmQTOiAahqJVUi6fjDF52InsR3FxU9vSAAttjtaogq7YsxHI4epDElL
	TazyINj/HTI/Z60GJamPFt3LU3RRecazS/fzdzGYuGgj3D+K+gA39xX0UuaiRdSUAUGYzm
	knCmP2zaqRA4ql4U+iHZh8Ow42HIFFz+mst5RuvVBSOf1sklgc7eW0+DuAGfhQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 01/24] spi: spi-mem: Extend spi-mem operations with a
 per-operation maximum frequency
In-Reply-To: <e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 13:07:09 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-2-miquel.raynal@bootlin.com>
	<e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 11:46:47 +0100
Message-ID: <87jzc3oo6g.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_024657_457513_808C5A41 
X-CRM114-Status: GOOD (  20.60  )
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

SGVsbG8gVHVkb3IsCgpPbiAxMS8xMS8yMDI0IGF0IDEzOjA3OjA5IEdNVCwgVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gT24gMTAvMjUvMjQgNToxNCBQ
TSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPgo+IGN1dAo+Cj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zcGkvc3BpLW1lbS5jIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4+IGluZGV4IDE3Yjhi
YWY3NDllNi4uYWI2NTBhZTk1M2JiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVt
LmMKPj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLW1lbS5jCj4+IEBAIC0zNTYsNiArMzU2LDcgQEAg
aW50IHNwaV9tZW1fZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3Bp
X21lbV9vcCAqb3ApCj4+ICB7Cj4+ICAJdW5zaWduZWQgaW50IHRtcGJ1ZnNpemUsIHhmZXJwb3Mg
PSAwLCB0b3RhbHhmZXJsZW4gPSAwOwo+PiAgCXN0cnVjdCBzcGlfY29udHJvbGxlciAqY3RsciA9
IG1lbS0+c3BpLT5jb250cm9sbGVyOwo+PiArCXVuc2lnbmVkIGludCB4ZmVyX3NwZWVkID0gb3At
Pm1heF9mcmVxOwo+Cj4gYmUgYXdhcmUgdGhhdCBmb3IgY29udHJvbGxlcnMgdGhhdCBkb24ndCBz
dXBwb3J0IFNQSU1FTSBvcHMsIHlvdSBwYXNzCj4gdGhlIGZyZXF1ZW5jeSBmcm9tIHRoZSB1cHBl
ciBsYXllcnMsIHdpdGhvdXQgYWRqdXN0aW5nIGl0IHdpdGgKPiBzcGktPm1heF9zcGVlZF9oei4g
V2FzIHRoaXMgaW50ZW50aW9uYWw/CgpUaGF0IGlzIGV4YWN0bHkgdGhlIG9wcG9zaXRlIG9mIHdo
YXQgSSB3YW50ZWQgdG8gYWNoaWV2ZQppbml0aWFsbHkuIFRoYXQncyBhIHZlcnkgZ29vZCBjYXRj
aC4KCj4+ICAJc3RydWN0IHNwaV90cmFuc2ZlciB4ZmVyc1s0XSA9IHsgfTsKPj4gIAlzdHJ1Y3Qg
c3BpX21lc3NhZ2UgbXNnOwo+PiAgCXU4ICp0bXBidWY7Cj4+IEBAIC0zNjgsNiArMzY5LDkgQEAg
aW50IHNwaV9tZW1fZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3Bp
X21lbV9vcCAqb3ApCj4+ICAJaWYgKCFzcGlfbWVtX2ludGVybmFsX3N1cHBvcnRzX29wKG1lbSwg
b3ApKQo+PiAgCQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICAKPj4gKwlpZiAoIW9wLT5tYXhfZnJl
cSB8fCBvcC0+bWF4X2ZyZXEgPiBtZW0tPnNwaS0+bWF4X3NwZWVkX2h6KQo+PiArCQkoKHN0cnVj
dCBzcGlfbWVtX29wICopb3ApLT5tYXhfZnJlcSA9IG1lbS0+c3BpLT5tYXhfc3BlZWRfaHo7Cj4K
PiBub3QgYSBiaWcgZmFuIG9mIGNhc3RpbmcgdGhlIGNvbnN0IG91dC4gSG93IGFib3V0IGludHJv
ZHVjaW5nIGEKPiBzcGlfbWVtX2FkanVzdF9vcF9mcmVxKCk/IFRoZSB1cHBlciBsYXllcnMgd2ls
bCB1c2UgdGhhdCB3ZXJlIG5lZWRlZCwKPiBhbmQgeW91J2xsIHN0aWxsIGJlIGFibGUgdG8gcGFz
cyBhIGNvbnN0IG9wIHRvIHNwaV9tZW1fZXhlY19vcCgpCgpJIGtub3cgaXQgaXMgbm90IGlkZWFs
IHNvIHRvIGZvbGxvdyB5b3VyIGlkZWEgSSBkcmFmdGVkIHRoZSB1c2Ugb2YKc3BpX21lbV9hZGp1
c3Rfb3BfZnJlcSgpLiBJbiBvcmRlciB0byBhdm9pZCB0aGUgY2FzdCwgd2UgYWN0dWFsbHkgbmVl
ZAp0byBjYWxsIHRoaXMgZnVuY3Rpb24gZXZlcnl3aGVyZSBpbiB0aGUgY29yZSBhbmQgdGhlIGRy
aXZlcnMgdG8gbWFrZQpzdXJlIHdlIG5ldmVyIGdldCBvdXQgb2YgYm91bmRzLCBidXQgaGVyZSBp
cyB0aGUgcHJvYmxlbToKCiAgICAkIGdpdCBncmVwIC13IHNwaV9tZW1fZXhlY19vcCAtLSBkcml2
ZXJzLyB8IHdjIC1sCiAgICA0MgoKVGhpcyBhcHByb2FjaCByZXF1aXJlcyB0byBhZGQgYSBjYWxs
IHRvIHNwaV9tZW1fYWRqdXN0X29wX2ZyZXEoKSBiZWZvcmUKKmV2ZXJ5KiBzcGlfbWVtX2V4ZWNf
b3AoKS4gWWVzIEkgY2FuIGRvIHRoYXQgYnV0IHRoYXQgbWVhbnMgdG8gYmUgdmVyeQphdHRlbnRp
dmUgdG8gdGhlIGZhY3QgdGhhdCB0aGVzZSB0d28gZnVuY3Rpb25zIGFyZSBhbHdheXMgY2FsbGVk
CnRvZ2V0aGVyLiBJIGFtIG5vdCBzdXJlIGl0IGlzIGEgZ29vZCBpZGVhLgoKV2hhdCBhYm91dCBk
b2luZyB0aGUgZm9sbG93aW5nIG9uY2UgaW4gc3BpX21lbV9leGVjX29wKCkgaW5zdGVhZD8KCiAg
ICBzcGlfbWVtX2FkanVzdF9vcF9mcmVxKGRlc2MtPm1lbSwgKHN0cnVjdCBzcGlfbWVtX29wICop
b3ApOwoKSSBrbm93IHdlIHN0aWxsIGhhdmUgYSBjYXN0LCBidXQgaXQgZmVlbHMgbW9yZSBhY2Nl
cHRhYmxlIHRoYW4gdGhlIG9uZSBJCmluaXRpYWxseSBwcm9wb3NlZCBhbmQgY292ZXJzIGFsbCBj
YXNlcy4gSSB3b3VsZCBub3QgYWNjZXB0IHRoYXQgaW4gYQpkcml2ZXIsIGJ1dCBoZXJlIHdlIGFy
ZSBpbiB0aGUgY29yZSwgc28gdGhhdCBzb3VuZHMgYWNjZXB0YWJsZS4KCkFub3RoZXIgcG9zc2li
aWxpdHkgb3RoZXJ3aXNlIHdvdWxkIGJlIHRvIGRyb3AgdGhlIGNvbnN0IGZyb20gdGhlCnNwaV9t
ZW1fb3Agc3RydWN0dXJlIGVudGlyZWx5LiBCdXQgSSBwcmVmZXIgdGhlIGFib3ZlIGZ1bmN0aW9u
IGNhbGwuCgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oIGIvaW5j
bHVkZS9saW51eC9zcGkvc3BpLW1lbS5oCj4+IGluZGV4IGY4NjZkNWM4ZWQzMi4uODk2M2YyMzY5
MTFiIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NwaS9zcGktbWVtLmgKPj4gKysrIGIv
aW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oCj4+IEBAIC02OCw2ICs2OCw5IEBAIGVudW0gc3Bp
X21lbV9kYXRhX2RpciB7Cj4+ICAJU1BJX01FTV9EQVRBX09VVCwKPj4gIH07Cj4+ICAKPj4gKyNk
ZWZpbmUgU1BJX01FTV9PUF9NQVhfRlJFUShfX2ZyZXEpCQkJCVwKPj4gKwkubWF4X2ZyZXEgPSBf
X2ZyZXEKPj4gKwo+PiAgLyoqCj4+ICAgKiBzdHJ1Y3Qgc3BpX21lbV9vcCAtIGRlc2NyaWJlcyBh
IFNQSSBtZW1vcnkgb3BlcmF0aW9uCj4+ICAgKiBAY21kLm5ieXRlczogbnVtYmVyIG9mIG9wY29k
ZSBieXRlcyAob25seSAxIG9yIDIgYXJlIHZhbGlkKS4gVGhlIG9wY29kZSBpcwo+PiBAQCAtOTUs
NiArOTgsOSBAQCBlbnVtIHNwaV9tZW1fZGF0YV9kaXIgewo+PiAgICoJCSBvcGVyYXRpb24gZG9l
cyBub3QgaW52b2x2ZSB0cmFuc2ZlcnJpbmcgZGF0YQo+PiAgICogQGRhdGEuYnVmLmluOiBpbnB1
dCBidWZmZXIgKG11c3QgYmUgRE1BLWFibGUpCj4+ICAgKiBAZGF0YS5idWYub3V0OiBvdXRwdXQg
YnVmZmVyIChtdXN0IGJlIERNQS1hYmxlKQo+PiArICogQG1heF9mcmVxOiBmcmVxdWVuY3kgbGlt
aXRhdGlvbiB3cnQgdGhpcyBvcGVyYXRpb24uIDAgbWVhbnMgdGhlcmUgaXMgbm8KPj4gKyAqCSAg
ICAgIHNwZWNpZmljIGNvbnN0cmFpbnQgYW5kIHRoZSBoaWdoZXN0IGFjaGlldmFibGUgZnJlcXVl
bmN5IGNhbiBiZQo+PiArICoJICAgICAgYXR0ZW1wdGVkKS4KPgo+IG5pdDogeW91IGNsb3NlIGEg
cGFyZW50aGVzaXMgd2l0aG91dCBvcGVuaW5nIG9uZQoKQ29ycmVjdGVkIQoKVGhhbmtzIGZvciB0
aGlzIHZlcnkgdXNlZnVsIGZlZWRiYWNrIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
