Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1BEE7718A
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Dec 2024 10:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4U86Ny3+bohQmB4Qj+pTKk5PCiALSNjiQefCIOuf+M=; b=nk98jgIfWtPdDb
	gNjCrXbcm3RSfCs1QQ8zMBYOFj/5U0Tn9gFFMWDpRaTXMltHsD6yVWGi4YhO8LNTtGxlugSPpyhuQ
	nG0edEd25zNCIdhKKqXxMgLf6DwxZf7dZRFw4I5GKiFdSLeUGohzzE3AvSyc8DXDH7MqxcQh6aZX1
	GT8MRoG/t7ZlvTvHy0e0pKq3bz89DPat/W0XWQZ/BokeAs4wKSVys+niVO+dCT94b3VJwGzwKGmkY
	2UVVcNIZITB/CEcA89B8gfIocQIB1kFgF4Pvw0ghkrMAvU1NdWgfYmQMxjS5H2jATyxXAcYgcz8BY
	Z/tboPZYF6lCLqA2st3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhw-0000000GLZ7-1QWp;
	Wed, 18 Dec 2024 10:55:12 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqUS-0000000G8VL-2Uwa
	for linux-mtd@lists.infradead.org;
	Wed, 18 Dec 2024 09:37:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27210C0004;
	Wed, 18 Dec 2024 09:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734514630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2IUfVG2ymBHDabdRbkyKDirMaGDsjbAhvPisQo1LMTg=;
	b=oHJB1j0NtAv+D4tmGyxnlDfgk+1kCVB/U6Zvzj5lmg8BFgIWR5HFLrsSzYBNySAFeRkzCn
	YAqJCAxsKdkoLcWZEX7+0VsZ89enQFWr+TgQ0QfSa2k0grs8B8efKr28p7L5RNvsrdkZOH
	PPVG+sVGVSolJDVndBqRRUvHX1xJbm5nBvgqmjiEQ7EsoOpd6u4A9iIVNkAn5b/JlCiwRR
	UGh8ivWr56F4v5VkwKPmFcYQ5sJIwQ0veXUGZoE2H0HKYO9wnSqOGYw7gR/EGRfcR+G1hs
	CjkxiSJ2Lf7giY5SnIwPOltUrU/Q+ac2636S0yFf93jnED9eEpt1Ejc3KwRM8g==
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
In-Reply-To: <01f1bddd-7aee-4c90-9fa0-3b94c87eb469@linaro.org> (Tudor
	Ambarus's message of "Wed, 18 Dec 2024 08:07:24 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-2-miquel.raynal@bootlin.com>
	<e76ff30b-342e-4e4c-aa84-40312c3ffc72@linaro.org>
	<87jzc3oo6g.fsf@bootlin.com>
	<01f1bddd-7aee-4c90-9fa0-3b94c87eb469@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 18 Dec 2024 10:37:07 +0100
Message-ID: <878qsde3i4.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_013712_892719_7FAFE72F 
X-CRM114-Status: GOOD (  17.18  )
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

T24gMTgvMTIvMjAyNCBhdCAwODowNzoyNCBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDEyLzEzLzI0IDEwOjQ2IEFNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+PiBIZWxsbyBUdWRvciwKPj4gCj4KPiBIaSEKPgo+PiBPbiAxMS8xMS8yMDI0
IGF0IDEzOjA3OjA5IEdNVCwgVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3Jn
PiB3cm90ZToKPj4gCj4+PiBPbiAxMC8yNS8yNCA1OjE0IFBNLCBNaXF1ZWwgUmF5bmFsIHdyb3Rl
Ogo+Pj4KPj4+IGN1dAo+Pj4KPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGkt
bWVtLmMgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPj4+PiBpbmRleCAxN2I4YmFmNzQ5ZTYuLmFi
NjUwYWU5NTNiYiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPj4+PiAr
KysgYi9kcml2ZXJzL3NwaS9zcGktbWVtLmMKPgo+IGN1dAo+Cj4+Pj4gKwlpZiAoIW9wLT5tYXhf
ZnJlcSB8fCBvcC0+bWF4X2ZyZXEgPiBtZW0tPnNwaS0+bWF4X3NwZWVkX2h6KQo+Pj4+ICsJCSgo
c3RydWN0IHNwaV9tZW1fb3AgKilvcCktPm1heF9mcmVxID0gbWVtLT5zcGktPm1heF9zcGVlZF9o
ejsKPj4+Cj4+PiBub3QgYSBiaWcgZmFuIG9mIGNhc3RpbmcgdGhlIGNvbnN0IG91dC4gSG93IGFi
b3V0IGludHJvZHVjaW5nIGEKPj4+IHNwaV9tZW1fYWRqdXN0X29wX2ZyZXEoKT8gVGhlIHVwcGVy
IGxheWVycyB3aWxsIHVzZSB0aGF0IHdlcmUgbmVlZGVkLAo+Pj4gYW5kIHlvdSdsbCBzdGlsbCBi
ZSBhYmxlIHRvIHBhc3MgYSBjb25zdCBvcCB0byBzcGlfbWVtX2V4ZWNfb3AoKQo+PiAKPj4gSSBr
bm93IGl0IGlzIG5vdCBpZGVhbCBzbyB0byBmb2xsb3cgeW91ciBpZGVhIEkgZHJhZnRlZCB0aGUg
dXNlIG9mCj4+IHNwaV9tZW1fYWRqdXN0X29wX2ZyZXEoKS4gSW4gb3JkZXIgdG8gYXZvaWQgdGhl
IGNhc3QsIHdlIGFjdHVhbGx5IG5lZWQKPj4gdG8gY2FsbCB0aGlzIGZ1bmN0aW9uIGV2ZXJ5d2hl
cmUgaW4gdGhlIGNvcmUgYW5kIHRoZSBkcml2ZXJzIHRvIG1ha2UKPj4gc3VyZSB3ZSBuZXZlciBn
ZXQgb3V0IG9mIGJvdW5kcywgYnV0IGhlcmUgaXMgdGhlIHByb2JsZW06Cj4+IAo+PiAgICAgJCBn
aXQgZ3JlcCAtdyBzcGlfbWVtX2V4ZWNfb3AgLS0gZHJpdmVycy8gfCB3YyAtbAo+PiAgICAgNDIK
Pj4gCj4+IFRoaXMgYXBwcm9hY2ggcmVxdWlyZXMgdG8gYWRkIGEgY2FsbCB0byBzcGlfbWVtX2Fk
anVzdF9vcF9mcmVxKCkgYmVmb3JlCj4+ICpldmVyeSogc3BpX21lbV9leGVjX29wKCkuIFllcyBJ
IGNhbiBkbyB0aGF0IGJ1dCB0aGF0IG1lYW5zIHRvIGJlIHZlcnkKPj4gYXR0ZW50aXZlIHRvIHRo
ZSBmYWN0IHRoYXQgdGhlc2UgdHdvIGZ1bmN0aW9ucyBhcmUgYWx3YXlzIGNhbGxlZAo+PiB0b2dl
dGhlci4gSSBhbSBub3Qgc3VyZSBpdCBpcyBhIGdvb2QgaWRlYS4KPj4gCj4+IFdoYXQgYWJvdXQg
ZG9pbmcgdGhlIGZvbGxvd2luZyBvbmNlIGluIHNwaV9tZW1fZXhlY19vcCgpIGluc3RlYWQ/Cj4+
IAo+PiAgICAgc3BpX21lbV9hZGp1c3Rfb3BfZnJlcShkZXNjLT5tZW0sIChzdHJ1Y3Qgc3BpX21l
bV9vcCAqKW9wKTsKPj4gCj4+IEkga25vdyB3ZSBzdGlsbCBoYXZlIGEgY2FzdCwgYnV0IGl0IGZl
ZWxzIG1vcmUgYWNjZXB0YWJsZSB0aGFuIHRoZSBvbmUgSQo+PiBpbml0aWFsbHkgcHJvcG9zZWQg
YW5kIGNvdmVycyBhbGwgY2FzZXMuIEkgd291bGQgbm90IGFjY2VwdCB0aGF0IGluIGEKPj4gZHJp
dmVyLCBidXQgaGVyZSB3ZSBhcmUgaW4gdGhlIGNvcmUsIHNvIHRoYXQgc291bmRzIGFjY2VwdGFi
bGUuCj4+IAo+PiBBbm90aGVyIHBvc3NpYmlsaXR5IG90aGVyd2lzZSB3b3VsZCBiZSB0byBkcm9w
IHRoZSBjb25zdCBmcm9tIHRoZQo+PiBzcGlfbWVtX29wIHN0cnVjdHVyZSBlbnRpcmVseS4gQnV0
IEkgcHJlZmVyIHRoZSBhYm92ZSBmdW5jdGlvbiBjYWxsLgo+Cj4gSG93IGFib3V0IGludHJvZHVj
aW5nIGEgc3BpX25hbmRfc3BpbWVtX2V4ZWNfb3AoKSB3aGVyZSB5b3UgY2FsbAo+IHNwaV9tZW1f
YWRqdXN0X29wX2ZyZXEoKSBhbmQgc3BpX21lbV9leGVjX29wKCk/CgpUaGF0IHdvdWxkIHdvcmsg
dG8gbWFrZSB0aGUgY2FzdCBkaXNhcHBlYXIgYnV0IFRCSCB3b3VsZCBub3QgYmUgdG90YWxseQpy
ZWxldmFudCBhcyBhZGp1c3RpbmcgdGhlIGZyZXF1ZW5jeSBpcyB0eXBpY2FsbHkgc29tZXRoaW5n
IHRoYXQgd291bGQKYmVuZWZpdCB0byBzcGktbm9yIGFzIHdlbGwgKG1heWJlIGluIHRoZSBmdXR1
cmUpIGFuZCB0aGVyZWZvcmUgd291bGQKZnVsbHkgYXBwbHkgdG8gc3BpIG1lbW9yaWVzIGFzIGEg
d2hvbGUsIG5vdCBqdXN0IHNwaS1uYW5kLiBXZSBjYW4gdGhpbmsKYWJvdXQgYW5vdGhlciBuYW1p
bmcgbWF5YmUsIGJ1dCBJIGZpbmQgbGlrZSBzcGlfbWVtX2V4ZWNfb3AoKSBpcyB0aGUKcmlnaHQg
bG9jYXRpb24gdG8gZG8gdGhpcy4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
