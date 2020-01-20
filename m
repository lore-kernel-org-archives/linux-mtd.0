Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF473C2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 10:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F6620684
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 10:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIS9t94W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F6620684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g1/rbsSDfs7W98F4uVNbNEUHCxf1S7qXUYaoyeh7usw=; b=pIS9t94WYWEee2
	cmkiiG5SIOZjDFEHDdd7JzRi+/jb2eSXwx4hcIYCOEsIDOjdUvSlnhuXHk86XcoZx7Jxvalb/r3sS
	pUD8bscg31Eoxurxc9eqPbhRBDPXjaDmDhthIx2n7+qDwfmFUHU4tUhZMEWVWINdGH/FoTyax1Nj5
	ubieCa8WXAo8M49eKaUj9pjxMuUqFeEg2iGSL970/lWVeGRHkquIkZPCBNIs8bDeQ3kPIiQ+RVLzG
	BT51+pBr9Atih81zCLk35NwOcTTk29PS1RWkJGTKTMdlV/FvuEOTL61tm2fM3kqoeUIx8dP38v0Ak
	aLHz4et5K03Mz1rMvBEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itU6t-00029F-Jw; Mon, 20 Jan 2020 10:16:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itU6m-00028b-RV
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 10:16:42 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 18B1C100004;
 Mon, 20 Jan 2020 10:16:28 +0000 (UTC)
Date: Mon, 20 Jan 2020 11:16:26 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: shiva.linuxworks@gmail.com
Subject: Re: [PATCH 3/4] mtd: spinand: Add M70A series Micron SPI NAND devices
Message-ID: <20200120111626.7cb2f6c5@xps13>
In-Reply-To: <20200119145432.10405-4-sshivamurthy@micron.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
 <20200119145432.10405-4-sshivamurthy@micron.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_021637_027538_91DC7579 
X-CRM114-Status: GOOD (  16.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 linux-mtd@lists.infradead.org, Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2hpdmEsCgpUaGlzIGlzIHJlbWFyayBjb21tb24gdG8gdGhlIGZvdXIgcGF0Y2hlczogeW91
IG1pc3MgdGhlICd2MicgcHJlZml4IGluCnRoZSBvYmplY3QuCgpzaGl2YS5saW51eHdvcmtzQGdt
YWlsLmNvbSB3cm90ZSBvbiBTdW4sIDE5IEphbiAyMDIwIDE1OjU0OjMxICswMTAwOgoKPiBGcm9t
OiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAKPiBBZGQg
ZGV2aWNlIHRhYmxlIGZvciBNNzBBIHNlcmllcyBNaWNyb24gU1BJIE5BTkQgZGV2aWNlcy4KPiAK
PiBXaGlsZSBhdCBpdCwgZGlzYWJsZSB0aGUgQ29udGludW91cyBSZWFkIGZlYXR1cmUgd2hpY2gg
aXMgZW5hYmxlZCBieQo+IGRlZmF1bHQuCgpDYW4geW91IHBsZWFzZSBnaXZlIHVzIG1vcmUgZGV0
YWlsIG9uIHdoeSB0aGlzIGlzIGFuIGlzc3VlPwoKU2hhbGwgd2UgYmFja3BvcnQgaXQgdG8gc3Rh
YmxlPwoKQXMgYSBydWxlIG9mIHRodW1iLCB3aGVuIHlvdSBzdGFydCBhIHNlbnRlbmNlIGJ5ICJ3
aGlsZSBhdCBpdCIgaW4gYQpjb21taXQgbWVzc2FnZSBhbmQgdGhpcyBpcyBub3QgYSB0cml2aWFs
IGNoYW5nZSA6IHNwbGl0IHRoZSBwYXRjaCwKcGxlYXNlLiBVbmxlc3MgdGhpcyBpcyByZWFsbHkg
cmVsYXRlZCBhbmQgaW4gdGhpcyBjYXNlIGV4cGxhaW4gaG93IGFuZAp3aHkgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hp
dmFtdXJ0aHlAbWljcm9uLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9u
LmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAzMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3Bp
L21pY3Jvbi5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiBpbmRleCA1ZmQxZjky
MWVmMTIuLjQ1ZmMzN2M1OGY4YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9t
aWNyb24uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jCj4gQEAgLTEzMSw2
ICsxMzEsMjYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX2luZm8gbWljcm9uX3NwaW5h
bmRfdGFibGVbXSA9IHsKPiAgCQkgICAgIDAsCj4gIAkJICAgICBTUElOQU5EX0VDQ0lORk8oJm1p
Y3Jvbl84X29vYmxheW91dCwKPiAgCQkJCSAgICAgbWljcm9uXzhfZWNjX2dldF9zdGF0dXMpKSwK
PiArCS8qIE03MEEgNEdiIDMuM1YgKi8KPiArCVNQSU5BTkRfSU5GTygiTVQyOUY0RzAxQUJBRkQi
LCAweDM0LAo+ICsJCSAgICAgTkFORF9NRU1PUkcoMSwgNDA5NiwgMjU2LCA2NCwgMjA0OCwgNDAs
IDEsIDEsIDEpLAo+ICsJCSAgICAgTkFORF9FQ0NSRVEoOCwgNTEyKSwKPiArCQkgICAgIFNQSU5B
TkRfSU5GT19PUF9WQVJJQU5UUygmcmVhZF9jYWNoZV92YXJpYW50cywKPiArCQkJCQkgICAgICAm
d3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50
cyksCj4gKwkJICAgICAwLAo+ICsJCSAgICAgU1BJTkFORF9FQ0NJTkZPKCZtaWNyb25fOF9vb2Js
YXlvdXQsCj4gKwkJCQkgICAgIG1pY3Jvbl84X2VjY19nZXRfc3RhdHVzKSksCj4gKwkvKiBNNzBB
IDRHYiAxLjhWICovCj4gKwlTUElOQU5EX0lORk8oIk1UMjlGNEcwMUFCQkZEIiwgMHgzNSwKPiAr
CQkgICAgIE5BTkRfTUVNT1JHKDEsIDQwOTYsIDI1NiwgNjQsIDIwNDgsIDQwLCAxLCAxLCAxKSwK
PiArCQkgICAgIE5BTkRfRUNDUkVRKDgsIDUxMiksCj4gKwkJICAgICBTUElOQU5EX0lORk9fT1Bf
VkFSSUFOVFMoJnJlYWRfY2FjaGVfdmFyaWFudHMsCj4gKwkJCQkJICAgICAgJndyaXRlX2NhY2hl
X3ZhcmlhbnRzLAo+ICsJCQkJCSAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLAo+ICsJCSAg
ICAgMCwKPiArCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmbWljcm9uXzhfb29ibGF5b3V0LAo+ICsJ
CQkJICAgICBtaWNyb25fOF9lY2NfZ2V0X3N0YXR1cykpLAo+ICB9Owo+ICAKPiAgc3RhdGljIGlu
dCBtaWNyb25fc3BpbmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5kKQo+
IEBAIC0xNTMsOCArMTczLDE5IEBAIHN0YXRpYyBpbnQgbWljcm9uX3NwaW5hbmRfZGV0ZWN0KHN0
cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPiAgCXJldHVybiAxOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgaW50IG1pY3Jvbl9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kKQo+ICt7Cj4gKwkvKgo+ICsJICogTTcwQSBkZXZpY2Ugc2VyaWVzIGVuYWJsZSBDb250aW51
b3VzIFJlYWQgZmVhdHVyZSBhdCBQb3dlci11cCwKPiArCSAqIHdoaWNoIGlzIG5vdCBzdXBwb3J0
ZWQuIERpc2FibGUgdGhpcyBiaXQgdG8gYXZvaWQgYW55IHBvc3NpYmxlCj4gKwkgKiBmYWlsdXJl
Lgo+ICsJICovCj4gKwlyZXR1cm4gc3BpbmFuZF91cGRfY2ZnKHNwaW5hbmQsIENGR19RVUFEX0VO
QUJMRSwgMCk7Cj4gK30KPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFj
dHVyZXJfb3BzIG1pY3Jvbl9zcGluYW5kX21hbnVmX29wcyA9IHsKPiAgCS5kZXRlY3QgPSBtaWNy
b25fc3BpbmFuZF9kZXRlY3QsCj4gKwkuaW5pdCA9IG1pY3Jvbl9zcGluYW5kX2luaXQsCj4gIH07
Cj4gIAo+ICBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9tYW51ZmFjdHVyZXIgbWljcm9uX3NwaW5hbmRf
bWFudWZhY3R1cmVyID0gewoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
