Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F632E7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUS1cGbk6zVv6D15HEFR3y4pFha1kzReOwTBmNQMBPc=; b=ROusM3vgMp+nlv
	fU3WDuPimJc/aVFMVRCfHn2yRFAFyePBZnyHKxt0ssdWupMciK+8Ds84A9V5OL+h8VAfn0k3Bher5
	BLVJ4rDyD5pXYsV5E8pFzjYurJom1fTfDCOL5vpEGM9QnvyHzXfXrDIOriLYKPIRQNEACgZ5quyIx
	9nuzUnql+Yj6kWa+VrI62Z3OGvqh5HxePWKGvfIhI4vgET71G5Fev9AIWalbvQwQunOq2YIehSeZM
	WsHJ+I/dxrYLoqRZ/uZchcxqYpoSQlxVF7BuJRvpulNOjcDQdnLcZIkrotL7OAvJfcUIah7IcXt9Q
	rVgxJQQAMh5RcJv4GNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ2VQ-0000000BoRK-3uop;
	Tue, 24 Dec 2024 10:51:16 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Ma-0000000Bc3c-3AjS
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 09:38:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 82280C0007;
	Tue, 24 Dec 2024 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735033082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBPPOxtHffFdeWaNXscLfKp/7O7VkfykoygWXPPAjsg=;
	b=hU6IkXoaqfaaCeRa5aRTsich4mHwfabEBJ7s0XQFIKyaaLODFmp9F8pGEfdVOijjhHsSNF
	HBuPIaKEgcumcS23+bZ+pq3O0ETBZIRn0lSB8GrnzIn7d1S9mFmS3zPrxggFW4QfkDQXJ+
	nlK5Zn+IWyst59ZwvqtSCB7CwsxBFbe39NpLbDp5L//EfDUunAAuPayw3Z9EPk3CBR+lOQ
	wXRrYB36+++R/OQgKMzkVdVosOhlKq2WuWfz5iUHuqckvvH1lUZqoApbJCEscqhJR2OXok
	lBwBhbcWPeMxlOOQDkm+ZYX4ReJW54KtdCpjxSMGGVEt1akUVXIxQxRwGH8sLg==
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
Subject: Re: [PATCH 24/24] mtd: spinand: winbond: Add support for DTR
 operations
In-Reply-To: <87o712uunf.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 23
	Dec 2024 19:22:12 +0100")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-25-miquel.raynal@bootlin.com>
	<6029a01f-dc4d-4a35-ad21-fd17e3fed9fc@linaro.org>
	<87o712uunf.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 24 Dec 2024 10:38:00 +0100
Message-ID: <87ttato1zb.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_013805_221945_DFD0FF38 
X-CRM114-Status: GOOD (  17.55  )
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

SGVsbG8gVHVkb3IsCgpPbiAyMy8xMi8yMDI0IGF0IDE5OjIyOjEyICswMSwgTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlbGxvIFR1ZG9yLAo+Cj4g
T24gMTEvMTEvMjAyNCBhdCAxNDo0MDo1OSBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPj4gT24gMTAvMjUvMjQgNToxNSBQTSwgTWlxdWVsIFJh
eW5hbCB3cm90ZToKPj4+IFcyNU4wMUpXIGFuZCBXMjVOMDJKVyBzdXBwb3J0IG1hbnkgRFRSIHJl
YWQgbW9kZXMgaW4gc2luZ2xlLCBkdWFsIGFuZAo+Pj4gcXVhZCBjb25maWd1cmF0aW9ucy4KPj4+
IAo+Pj4gRFRSIG1vZGVzIGhvd2V2ZXIgY2Fubm90IGJlIHVzZWQgYXQgMTY2TUh6LCBhcyB0aGUg
YnVzIGZyZXF1ZW5jeSBpbgo+Pj4gdGhpcyBjYXNlIG11c3QgYmUgbG93ZXJlZCB0byA4ME1Iei4K
Pj4KPj4gaGEsIHdoYXQncyB0aGUgYmVuZWZpdCB0aGVuPyBBcmVuJ3Qgd2UgYmV0dGVyIG9mIHdp
dGggbm9uIGR0ciBtb2Rlcwo+PiB0aGVuPyA4MCBNSHogKiAyIDwgMTY2IE1Iej8KPgo+IFRoaXMg
aXMgYWN0dWFsbHkgYSBnb29kIHF1ZXN0aW9uLCBhbmQgeW91IGFyZSByaWdodCBERFIgaW4gdGhp
cyBjYXNlCj4gZG9lcyBub3QgYnJpbmcgYmV0dGVyIHRocm91Z2hwdXRzLCBpdCBjYW4gZXZlbiBt
YWtlIGl0IGEgbGl0dGxlIGJpdAo+IHNsb3dlci4gSSB0aGluayBob3dldmVyIHdlIHNob3VsZCBl
eHBlY3Qgc29tZSBnYWlucyBhdCB0aGUgUENCIGRlc2lnbgo+IHN0ZXAsIHdoaWNoIG1heSBiZSB3
YXkgc2ltcGxlciBhcyByb3V0aW5nIDggMTY2TUh6IGxpbmVzIG1pZ2h0Cj4gYXBwYXJlbnRseSBi
ZSBjaGFsbGVuZ2luZy4gSXQgaXMgY29tbW9uIHRvIGhhdmUgUENCIGxpbWl0YXRpb25zIG9uIHRo
ZQo+IGZyZXF1ZW5jeSwgc28gZW5hYmxpbmcgRERSIGNhbiBiZSBhIGdyZWF0IHdheSB0byBrZWVw
IHNpZ25hbCBpbnRlZ3JpdHkKPiB3aGlsZSBkZWZpbml0ZWx5IGltcHJvdmluZyB0aGUgcGVyZm9y
bWFuY2VzLiBIb3dldmVyLCB5b3UncmUgcmlnaHQsIEkKPiBzaG91bGQgcHJvYmFibHkgbW92ZSB0
aGVzZSBkZWZpbml0aW9ucyBsb3dlciBpbiB0aGUgdGFibGUgdG8gbWFrZSBzdXJlCj4gd2UgcnVu
IGF0IDE2Nk1IeiBpZiB0aGF0J3MgcG9zc2libGUuCgpBY3R1YWxseSB0aGlzIGlzIHByb2JhYmx5
IG5vdCBhIGdvb2Qgc29sdXRpb24uIFRoaXMgc3RhYmxlIGlzIHBhcnNlZApvbmNlIGZyb20gdG9w
IHRvIGJvdHRvbS4gVGhlIGVsZW1lbnRzIG9yZGVyIGRlY2lkZSB3aGV0aGVyIHdlJ2xsIHVzZSBh
CnZhcmlhbnQgb3IgYW5vdGhlciwgbm90IGJ5IGRlY2lkaW5nIHdoaWNoIG9uZSBpcyB0aGUgZmFz
dGVzdCwgYnV0IGJ5CnRha2luZyB0aGUgZmlyc3Qgb25lIHRoYXQgZml0cy4gQnV0IHdpdGggRFRS
IG9wZXJhdGlvbnMgaXQgbm8gbG9uZ2VyCndvcmtzIHNvIHdlbGwuIElmIEkgbGlzdCBpdGVtcyBs
aWtlIHRoYXQ6CgpTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1FVQURJT19EVFJfT1AoMCwg
OCwgTlVMTCwgMCwgODAgKiBIWl9QRVJfTUhaKSwKU1BJTkFORF9QQUdFX1JFQURfRlJPTV9DQUNI
RV9RVUFESU9fT1AoMCwgMiwgTlVMTCwgMCAvKiAxNjYgTUh6ICovKSwKCkl0IGlzIGxpa2VseSB0
aGF0IEkgd2lsbCBub3QgcnVuIGF0IHRoZSBmYXN0ZXN0IHBvc3NpYmxlIHRocm91Z2hwdXQsIGll
CmFib3V0IDE2ME1IeiBpbnN0ZWFkIG9mIDE2Nk1Iei4gQnV0IGlmIEkgZG8gdGhlIHJldmVyc2U6
CgpTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1FVQURJT19PUCgwLCAyLCBOVUxMLCAwIC8q
IDE2NiBNSHogKi8pLApTUElOQU5EX1BBR0VfUkVBRF9GUk9NX0NBQ0hFX1FVQURJT19EVFJfT1Ao
MCwgOCwgTlVMTCwgMCwgODAgKiBIWl9QRVJfTUhaKSwKCkkgd2lsbCBvbmx5IHJ1biBhdCB0aGUg
ZmFzdGVzdCB0aHJvdWdocHV0IGlmIHRoZSBQQ0IgbGluZXMgYXJlIHNvIHdlbGwKZGVzaWduZWQg
dGhhdCB0aGV5IGNhbiBzdXBwb3J0IDE2Nk1Iei4gSWYgdGhleSBvbmx5IHN1cHBvcnQgMTUwTUh6
IChvcgphbnl0aGluZyBsb3dlcikgaXQgd291bGQgaGF2ZSBiZWVuIGJldHRlciB0byBwaWNrIHRo
ZSBEVFIgb3AuCgpNeSBjb25jbHVzaW9uIGlzOiB0aGUgY3VycmVudCBsb2dpYyBuZWVkcyB0byBi
ZSBpbXByb3ZlZCwgc28gSSdtCmRyYWZ0aW5nIGEgc2xpZ2h0bHkgbW9yZSBjb21wbGV4IHZhcmlh
bnQgcGlja2VyIHdoaWNoIHdpbGwgZXZhbHVhdGUgdGhlCnRoZW9yZXRpY2FsIGxlbmd0aCBvZiBh
biBvcCBiYXNlZCBvbiB0aGUgc3BlZWQsIHBhcmFsbGVsIGxpbmVzLCBEVFIKY2FwYWJpbGl0eSwg
ZXRjLiBUaGlzIHdheSB0aGUgb3JkZXIgaW4gdGhpcyB0YWJsZSB3aWxsIG5vIGxvbmdlciBtYXR0
ZXIuCgpJIHdpbGwgc29vbiByZXNwaW4gYSBzZXJpZXMgYmVjYXVzZSBJJ3ZlIGVuaGFuY2VkIGEg
bG90IG9mIHRoaW5ncwppbnNpZGUuCgpDaGVlcnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
