Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB3C88E45
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 14:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2yP63AewRDpDlqqH+umkx3B+IO2it2iGku6q4eKB0w=; b=dloroMGDlZzD3B
	F5IWzt3OPmGjO89BlCXrx+0bQnc3fCRu/4QXV9lnT6WZUrc4GDm+tIXJbD2BxnjPYu5eKUzRV0gmQ
	gMdxI9bCjJBVu0wO9QTBN0LKJ9pRXVyremD41Pmuqu9EJ4xM34PT4RY/B/4KDk903gqNxdbksHbF7
	Bj3AvP2cyGNzA79VSIoG3709g14ijDUfPSx56fZ3HAntn63DT6LltMNs2w8Y4CirWrQEAqkIhF4H8
	y1MCcdxcas6payLgT6DmZs+bvfBwIIR+gpX30VObKSC3PNzsrwI4VO/7EVKSfwxiaGOg3Pp6M0zzX
	qkZsxmfCsF/8jBl8VjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x529Z-0000000GtrJ-3XdR;
	Fri, 11 Sep 2026 14:22:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x529Y-0000000Gtqp-31ME
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 14:22:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C98116020C;
	Fri, 11 Sep 2026 14:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF8021F000FF;
	Fri, 11 Sep 2026 14:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789136575;
	bh=0VmbmJtI47Wz1vz2OJjXjhLSnpo7E61Rpd6tNIPeOLs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F/wg20jJfMC9PIBkYVjCkjc1rPH5BPSp9ZiP11n3ZljXYx1UoPZTBr9LVDpgmkN2u
	 FDjokAPQPumBvrI1WE3UUlQolYBBHn6cgyF1morFscxUs7tfl+Rk2j8MZro5tWJP98
	 j07HBPmZubF6FHwyk3QiG4IP2+XL5nIXOcdt0rdrJcer3dAFXakfdaGL4wzbE/73fG
	 4faHNCZ6RZ7SDZoF/zqH3kg1gBWyQCKgPkwSu4GHRoKTkFszndbg9K51JtzSonc/fL
	 IzQfGk1u+nT5HhHkhk2+VUj251ftZKRrlpTkEpwXANJBqa9KYk1uNsAuGPuCINGOym
	 3MbvI7Ay9HVQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
To: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Jon
 Hunter" <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, "Steam Lin" <STLin2@winbond.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com>
References: <20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com>
Date: Fri, 11 Sep 2026 14:22:54 +0000
Message-Id: <20260911142254.EF8021F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBTcHVyaW91cyAtRUlPIGZhaWx1cmUgZHVyaW5nIHdyaXRlIHZlcmlmaWNhdGlvbiBp
biBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfc3IyX2FuZF9jaGVjaygpIGZvciBmbGFzaGVzIHdpdGgg
UUVSPTQgb3IgNSAoZS5nLiwgQkZQVF9EV09SRDE1X1FFUl9TUjJfQklUMV9OT19SRCkuCi0tCgpj
b21taXQgNjVmODg1ZGEzNjc4MTRiOTg1Mjk4MzBkOTc0MzhmOTZiNmYyOWFhMApBdXRob3I6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgptdGQ6IHNwaS1ub3I6IEZp
eCBxdWFkLWVuYWJsZSBmb3IgZmxhc2hlcyB3aXRoIFFFUiBiaXQgaW4gU1IxCgpUaGlzIGNvbW1p
dCBhdHRlbXB0cyB0byBmaXggcXVhZC1lbmFibGUgZm9yIGZsYXNoZXMgbGFja2luZyBhbiBTUjIg
cmVnaXN0ZXIKYnkgaGF2aW5nIHRoZSBnZW5lcmljIGhlbHBlciByZXR1cm4gMCB3aGVuIFNSMiBy
ZWFkcyBhcmUgdW5zdXBwb3J0ZWQuIEl0IGFsc28KdXBkYXRlcyB0aGUgU0ZEUCBwYXJzaW5nIHN0
ZXAgdG8gYXNzZXJ0IHRoYXQgbm8gY2hpcCBoYXMgYW4gU1IyIHdyaXRlIHBhdGgKd2l0aG91dCBh
biBTUjIgcmVhZCBwYXRoLgoKUmVwb3J0ZWQtYnk6IEpvbiBIdW50ZXIgPGpvbmF0aGFuaEBudmlk
aWEuY29tPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNzg4NzY3
MTkyMzIuMzU0MzkwMi4xNDQ1MTYyNTAzNzY3NjQyMTI1NC5iNC10eUBiNC9ULyNtNWJjNGJhNjc3
NjQzNmYyODcwY2VkMGViNTc4OWQyMjkwMzdhZDg0MApGaXhlczogNjM0ODkwMDJkMzk3ICgibXRk
OiBzcGktbm9yOiBSZWZhY3RvciBSZWFkIFN0YXR1cy9Xcml0ZSBTdGF0dXMgc3VwcG9ydCIpCgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gaW5kZXggZTJiNmVmYWZkZDhkMC4uNjJiNTM5MzM5MjdmMiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY29yZS5jCj4gQEAgLTg2NCw3ICs4NjUsMTIgQEAgaW50IHNwaV9ub3JfcmVhZF9zcjFf
YW5kX3NyMihzdHJ1Y3Qgc3BpX25vciAqbm9yLCB1OCAqc3IpCj4gIAlpZiAocmV0KQo+ICAJCXJl
dHVybiByZXQ7Cj4gIAo+IC0JcmV0dXJuIHNwaV9ub3JfcmVhZF9zcjIobm9yLCAmc3JbMV0pOwo+
ICsJaWYgKG5vci0+cGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyKQo+ICsJCXJldCA9IHNwaV9ub3Jf
cmVhZF9zcjIobm9yLCAmc3JbMV0pOwo+ICsJZWxzZQo+ICsJCXNyWzFdID0gMDsKCltTZXZlcml0
eTogSGlnaF0KVGhpcyBpcyBhIHByZS1leGlzdGluZyBpc3N1ZSwgYnV0IGRvZXMgZm9yY2luZyBz
clsxXSB0byAwIGhlcmUgY2F1c2UgYQpzcHVyaW91cyAtRUlPIGZhaWx1cmUgZG93bnN0cmVhbSBk
dXJpbmcgd3JpdGUgdmVyaWZpY2F0aW9uPwoKRm9yIGZsYXNoZXMgd2l0aCBRRVI9NCBvciA1IChl
LmcuLCBCRlBUX0RXT1JEMTVfUUVSX1NSMl9CSVQxX05PX1JEKSwgU0ZEUApwYXJzaW5nIGRpc2Fi
bGVzIHJlYWRpbmcgU1IyIChyZWFkX3NyMiA9IDApIGJ1dCByZXRhaW5zIGEgMTYtYml0IHdyaXRl
IHBhdGgKdmlhIHdyaXRlX3NyMV9hbmRfc3IyIGFuZCBzZXRzIHFlX21hc2tbMV0gPSBCSVQoMSku
CgpEdXJpbmcgcXVhZCBlbmFibGUsIHNyWzFdIGdldHMgcG9wdWxhdGVkIHdpdGggQklUKDEpIGFu
ZCBpcyB3cml0dGVuIHVzaW5nIHRoZQoxNi1iaXQgY29tbWFuZC4gSG93ZXZlciwgc3BpX25vcl93
cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSB2ZXJpZmllcyB0aGUKd3JpdGUgYnkgY2FsbGlu
ZyB0aGlzIGZ1bmN0aW9uLCB3aGljaCBmb3JjZWZ1bGx5IHNldHMgdG1wWzFdID0gMC4KClRoZSBj
aGVjayBpZiAoc3JbMF0gIT0gdG1wWzBdIHx8IHNyWzFdICE9IHRtcFsxXSkgdGhlbiBjb21wYXJl
cyBzclsxXT0weDAyCmFnYWluc3QgdG1wWzFdPTB4MDAsIGZhaWxzLCBhbmQgcmV0dXJucyAtRUlP
LiBUaGlzIGxlYXZlcyBwcm9iaW5nIGNvbXBsZXRlbHkKYnJva2VuIGZvciB0aGVzZSBmbGFzaGVz
LgoKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9zcGktbm9yL3NmZHAuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gaW5kZXggYzIx
YTY5NTNkYjk2MC4uNjQxZjE3YWQ1MWEwOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGkt
bm9yL3NmZHAuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4gQEAgLTY1Niw3
ICs2NTYsOCBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfYmZwdChzdHJ1Y3Qgc3BpX25vciAq
bm9yLAo+ICAKPiAgCS8qIG9wY29kZXMgc2FuaXR5IGNoZWNrICovCj4gIAlXQVJOX09OKCFwYXJh
bXMtPm9wY29kZXMucmVhZF9zcjEgfHwKPiAtCQkoIXBhcmFtcy0+b3Bjb2Rlcy53cml0ZV9zcjEg
JiYgIXBhcmFtcy0+b3Bjb2Rlcy53cml0ZV9zcjFfYW5kX3NyMikpOwo+ICsJCSghcGFyYW1zLT5v
cGNvZGVzLndyaXRlX3NyMSAmJiAhcGFyYW1zLT5vcGNvZGVzLndyaXRlX3NyMV9hbmRfc3IyKSB8
fAo+ICsJCSghcGFyYW1zLT5vcGNvZGVzLnJlYWRfc3IyICYmIHBhcmFtcy0+b3Bjb2Rlcy53cml0
ZV9zcjIpKTsKCltTZXZlcml0eTogSGlnaF0KVGhpcyBpc24ndCBhIGJ1ZyBpbnRyb2R1Y2VkIGJ5
IHRoaXMgcGF0Y2gsIGJ1dCBkb2VzIHRoaXMgc2FuaXR5IGNoZWNrIGZhaWwgdG8KYWNjb3VudCBm
b3Igd3JpdGVfc3IxX2FuZF9zcjI/CgpBIGNoaXAgY2FuIGxhY2sgcmVhZF9zcjIgKHJlYWRfc3Iy
ID0gMCkgYW5kIHdyaXRlX3NyMiAod3JpdGVfc3IyID0gMCksIHBhc3NpbmcKdGhpcyBXQVJOX09O
LCBidXQgc3RpbGwgcG9zc2VzcyBhIHZhbGlkIFNSMiB3cml0ZSBwYXRoIHZpYSB3cml0ZV9zcjFf
YW5kX3NyMi4KCkZvciBRRVI9NCBvciA1LCB0aGlzIG1lYW5zIHdlIGNhbiB3cml0ZSB0byBTUjIg
d2l0aG91dCBiZWluZyBhYmxlIHRvIHJlYWQgaXQsCndoaWNoIHRoZSBXQVJOX09OIGZhaWxzIHRv
IGNhdGNoLCBnaXZpbmcgYSBmYWxzZSBzZW5zZSBvZiBzYWZldHkuCgo+ICAKPiAgCWR3b3JkID0g
YmZwdC5kd29yZHNbU0ZEUF9EV09SRCgxNildICYgQkZQVF9EV09SRDE2XzRCX0FERFJfTU9ERV9N
QVNLOwo+ICAJaWYgKFNGRFBfTUFTS19DSEVDSyhkd29yZCwgQkZQVF9EV09SRDE2XzRCX0FERFJf
TU9ERV9CUldSKSkKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA5MTEtcGVyc28tZml4LXNwaS1ub3ItcWUtbXhpYy12My0xLTJlY2Fl
ZmIyZWYyY0Bib290bGluLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
