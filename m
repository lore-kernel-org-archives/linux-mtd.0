Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CEAE77180
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zzd+yFq/7KFRnulUwAAaL4iL4NK5cs3e1Y/gaxaSHzA=; b=2SpR4nGhQGw9QO
	7Pjl6fS4emtbme/CE6eF1TWWWzJE00moxC8wG0R9/b8cDRYKu2Ws8UYBJRPIeTI2JRIwHJkZVfp0u
	8yuz7MATA1YmZOLG68r0qIxeRnxQg1IlsHZNgjq/AKL5VeLFR8Kc4V8GkHeRfP+aSw864gp1ERQOy
	EkJ+/xsMxruyduKjVdUJjcV3U8/8aKBBDZyx/3zMIregUeG2fKdpxN9FB9kGa9E61UfucQ7L0pA+9
	s0c/rQH8EAcVAM5EMMLBu4Jdz6OTzwD2eFTbpn4fahjlPvGB/fgXu15ScKBmZ22rI8UgDCPC0kIrs
	KebsZ/dIUxzfwSAmRjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4jJ-00000003hRi-0ZvK;
	Fri, 13 Dec 2024 12:25:13 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4jG-00000003hQD-17N5
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 12:25:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D15D1C0007;
	Fri, 13 Dec 2024 12:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734092708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNkaMwOFTWL7O+KUqEytGfx0AzC6/gMcfU1OW6erpzY=;
	b=DrirYdF4kTOc3fSbEvnJNIPlHYrhjdTXkNZKYFS4B0TJXaU000F+K1qNviss930aApyh2R
	a1ra3bGm2m2UDBNfCvM8QkuQw+ogONPyjaVuGeLo19oUkbziI4+uKzKqHEVd45Iw0rBfQ0
	CnN2o/d57+rqgZXXh7ldlxYd8M7Z/KZUuxpJtEgG4omgn2gDFECKcvFNxo2kxJd3JbegDi
	Iw+eyv0p406urMh6fX3tthzzOp3YhpbkC/VZ8F5BedWxLcAOHi3gYVrw/01MpgS5BjnQVx
	RgPL6wq4V7LjD+ls26Ze3yeN/nRXZ9f3N4wmqICwb2dMEw1jNmz+pT9X/PCLYw==
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
Subject: Re: [PATCH 23/24] mtd: spinand: winbond: Add comment about naming
In-Reply-To: <71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 14:38:53 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-24-miquel.raynal@bootlin.com>
	<71d0cf83-6866-46be-b76f-291a8a6a1346@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 13:25:05 +0100
Message-ID: <87wmg3kbxa.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_042510_608972_DE7EE2CB 
X-CRM114-Status: GOOD (  14.10  )
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

T24gMTEvMTEvMjAyNCBhdCAxNDozODo1MyBHTVQsIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFy
dXNAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IE9uIDEwLzI1LzI0IDU6MTUgUE0sIE1pcXVlbCBSYXlu
YWwgd3JvdGU6Cj4+IE1ha2UgdGhlIGxpbmsgYmV0d2VlbiB0aGUgY29yZSBtYWNyb3MgYW5kIHRo
ZSBkYXRhc2hlZXQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJv
bmQuYyB8IDUgKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4gCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgYi9kcml2ZXJzL210
ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4gaW5kZXggNjg2ZTg3MmZlMGZmLi45ZTI1NjI4MDVkMjMg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYwo+PiArKysgYi9k
cml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKPj4gQEAgLTE4LDYgKzE4LDExIEBACj4+ICAK
Pj4gICNkZWZpbmUgVzI1TjA0S1ZfU1RBVFVTX0VDQ181XzhfQklURkxJUFMJKDMgPDwgNCkKPj4g
IAo+PiArLyoKPj4gKyAqICJYMiIgaW4gdGhlIGNvcmUgaXMgZXF1aXZhbGVudCB0byAiZHVhbCBv
dXRwdXQiIGluIHRoZSBkYXRhc2hlZXRzLAo+PiArICogIlg0IiBpbiB0aGUgY29yZSBpcyBlcXVp
dmFsZW50IHRvICJxdWFkIG91dHB1dCIgaW4gdGhlIGRhdGFzaGVldHMuCj4+ICsgKi8KPgo+IGRv
ZXNuJ3QgaGVscCBncmVhdCBmb3IgYW4gb3V0c2lkZXIgbGlrZSBtZS4gSXMgcXVhZCByZWZlcnJp
bmcgdG8gY21kLAo+IGFkZHIgb3IgZGF0YT8gT3IgbWF5YmUgb2YgYWxsPyBJIG5lZWQgdG8gcmVh
ZCB0aGUgY29kZSBhbnl3YXkuCgpJIGFsc28gZG9uJ3QgbGlrZSB0aGVzZSB0ZXJtcy4gSUlSQyAi
b3V0cHV0IiBpcyByZWZlcnJpbmcgdG8gdGhlIGRhdGEgY3ljbGVzLApvdGhlcndpc2UgaXQgbWVh
bnMgYWRkcmVzcyAoZHVtbXkpIGFuZCBkYXRhIGN5Y2xlcy4KCkluIHNpbmdsZSwgZHVhbCBvciBx
dWFkIG1vZGUgdGhlIG5hbWluZyBpcyB1bmNsZWFyIGJ1dCAib2theSIuIEJ1dCBvY3RhbApERFIg
bW9kZXMgY2FuIHJlcXVpcmUgdGhlIG9wY29kZSB0byBiZSBzZW50IGluIG9jdGFsIG1vZGUgYXMg
d2VsbCwgd2hpY2gKaXMgbmV3LiBJZiB3ZSBzdXBwb3J0IHRoYXQsIEknbGwgdGFrZSBjYXJlIG9m
IHVzaW5nIGEgbW9yZQp1bmRlcnN0YW5kYWJsZSBuYW1pbmcgZm9yIGFsbCBtYWNyb3MgbGlrZSBY
eS1YeS1YeSwgWCBiZWluZyB0aGUKYnVzd2lkdGgsIHkgYmVpbmcgUyAoc2RyKSBvciBEIChkZHIp
IGFuZCB0aGUgdGhyZWUgbWVtYmVycyBiZWluZwpDb21tYW5kLUFkZHJlc3MtRGF0YS4gSSBtaWdo
dCBldmVuIGJlIHRlbXB0ZWQgdG8gaW5jbHVkZSBkdW1teSBjeWNsZXMgYXMKd2VsbCwgYmVjYXVz
ZSBpdCBpcyBpbXBvcnRhbnQgdG8gYmUgY2xlYXIgaWYgZWcuIGluIG9jdGFsIG1vZGUgIjEiIG1l
YW5zCiIxIGN5Y2xlIiBvciAiOCBjeWNsZXMiLgoKPj4gKwo+PiAgc3RhdGljIFNQSU5BTkRfT1Bf
VkFSSUFOVFMocmVhZF9jYWNoZV9kdHJfdmFyaWFudHMsCj4+ICAJCVNQSU5BTkRfUEFHRV9SRUFE
X0ZST01fQ0FDSEVfUVVBRElPX09QKDAsIDIsIE5VTEwsIDApLAo+PiAgCQlTUElOQU5EX1BBR0Vf
UkVBRF9GUk9NX0NBQ0hFX1g0X09QKDAsIDEsIE5VTEwsIDApLAoKVGhhbmtzLApNaXF1w6hsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
