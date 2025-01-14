Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AE4C02185
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2025 17:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azOSg0Vj4nsDjvZt82I988e1CzTK68pv+tnb7SUzh0I=; b=nDwf7yqKtoUU1K
	D4VjZ6OlZ7qvfJ9nZ46ahk+uofJkMsD9LxrJzUiE38vL77REzNfHTJ5OMn7zvgYz6AgtuSMs4eaEW
	YFB5ptCFqQqCU05PluJ4CunNrgEQ4seGhS5c5ByENgXYAzzrhrPT61ELy19J0ISnGi577oJOVuMol
	9awB+f7by/hzBu1UFN2HCsTWWPx4JmBC1vx2/dZGN6RdFVn0XP2PHr4cu2GpbAIcQwStgGuPRTtqZ
	ImaFvH9JL2Yjb627VR3LxrvG1rpCrtkOyGGN9WILVUlTpYaDc+/XYhME81uFTi8tAX5/ZrRgyQv9Z
	pyA0sWipw6NGnWWraEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl4s-00000009FTx-45cu;
	Tue, 14 Jan 2025 17:51:46 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXl4o-00000009FSY-3Yni
	for linux-mtd@lists.infradead.org;
	Tue, 14 Jan 2025 17:51:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0794C1C0007;
	Tue, 14 Jan 2025 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736877100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vXrbWWwouiOx3yRkqgUv0mzdSo2ohjgt018nIlxC86g=;
	b=JJo/2yeBbPQkrJ9gqV9ju4t/cLDYVYnOg9ZE3ot05ZGuDn93A6XG6+PpnqtnP5lcSobEeW
	YWtguohSqHUIvWyaT4MHj2gSFw1Cn9zAQ21HwVleOoc+u2FP21fPMWh0v9mnBLs6sa0Mz8
	Q/Bc4YSEQOqXk9ngZgbe3eTNwwmje//SyZWpBp90KBCfof4s49Q7mypzaxA1OGv99j/qL9
	iS63HUOrmV5aFNT63wZBVfQYymuikqIRiIG4OeW+/C+F/a8Bbqb87B+7w4W35f62W7tRBj
	aW0Yv7ICpBmfrb4djndmcO1zgx8+qzZN53d9+LXtGBDbzxdSQBPvsEfE+ZaB5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
  tudor.ambarus@linaro.org,  mwalle@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,  stable@vger.kernel.org,
  Cheng Ming Lin <linchengming884@gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
In-Reply-To: <mafs0zfjt5q3n.fsf@kernel.org> (Pratyush Yadav's message of "Tue,
	14 Jan 2025 16:15:24 +0000")
References: <20241112075242.174010-1-linchengming884@gmail.com>
	<20241112075242.174010-2-linchengming884@gmail.com>
	<3342163.44csPzL39Z@steina-w> <mafs0zfjt5q3n.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 14 Jan 2025 18:51:38 +0100
Message-ID: <87wmexp9lh.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_095143_342316_CED031E2 
X-CRM114-Status: GOOD (  21.83  )
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

SGVsbG8gUHJhdHl1c2gsCgpPbiAxNC8wMS8yMDI1IGF0IDE2OjE1OjI0IEdNVCwgUHJhdHl1c2gg
WWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+IHdyb3RlOgoKPj4+IC0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4g
QEAgLTg5LDcgKzg5LDcgQEAgdm9pZCBzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChjb25zdCBzdHJ1
Y3Qgc3BpX25vciAqbm9yLAo+Pj4gIAkJb3AtPmFkZHIuYnVzd2lkdGggPSBzcGlfbm9yX2dldF9w
cm90b2NvbF9hZGRyX25iaXRzKHByb3RvKTsKPj4+ICAKPj4+ICAJaWYgKG9wLT5kdW1teS5uYnl0
ZXMpCj4+PiAtCQlvcC0+ZHVtbXkuYnVzd2lkdGggPSBzcGlfbm9yX2dldF9wcm90b2NvbF9hZGRy
X25iaXRzKHByb3RvKTsKPj4+ICsJCW9wLT5kdW1teS5idXN3aWR0aCA9IHNwaV9ub3JfZ2V0X3By
b3RvY29sX2RhdGFfbmJpdHMocHJvdG8pOwoKRmFjaW5nIHJlY2VudGx5IGEgc2ltaWxhciBpc3N1
ZSBteXNlbGYgaW4gdGhlIFNQSSBOQU5EIHdvcmxkLCBJIGJlbGlldmUKd2Ugc2hvdWxkIGdldCBy
aWQgb2YgdGhlIG5vdGlvbiBvZiBiaXRzIHdoZW4gaXQgY29tZXMgdG8gdGhlIGR1bW15CnBoYXNl
LiBJIHdvdWxkIGFwcHJlY2lhdGUgYSBjbGFyaWZpY2F0aW9uIGxpa2UgImR1bW15LmN5Y2xlcyIg
d2hpY2gKd291bGQgdHlwaWNhbGx5IG5vdCByZXF1aXJlIGFueSBidXMgd2lkdGggaW1wbGljYXRp
b25zLgoKLi4uCgo+IE1vc3QgY29udHJvbGxlcidzIHN1cHBvcnRzX29wIGhvb2sgY2FsbCBzcGlf
bWVtX2RlZmF1bHRfc3VwcG9ydHNfb3AoKSwKPiBpbmNsdWRpbmcgbnhwX2ZzcGlfc3VwcG9ydHNf
b3AoKS4gSW4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKCksCj4gc3BpX21lbV9jaGVja19i
dXN3aWR0aCgpIGlzIGNhbGxlZCB0byBjaGVjayBpZiB0aGUgYnVzd2lkdGhzIGZvciB0aGUgb3AK
PiBjYW4gYWN0dWFsbHkgYmUgc3VwcG9ydGVkIGJ5IHRoZSBib2FyZCdzIHdpcmluZy4gVGhpcyB3
aXJpbmcgaW5mb3JtYXRpb24KPiBjb21lcyBmcm9tIChhbW9uZyBvdGhlciB0aGluZ3MpIHRoZSBz
cGkte3R4LHJ4fS1idXMtd2lkdGggRFQgcHJvcGVydGllcy4KPiBCYXNlZCBvbiB0aGVzZSBwcm9w
ZXJ0aWVzLCBTUElfVFhfKiBvciBTUElfUlhfKiBmbGFncyBhcmUgc2V0IGJ5Cj4gb2Zfc3BpX3Bh
cnNlX2R0KCkuIHNwaV9tZW1fY2hlY2tfYnVzd2lkdGgoKSB0aGVuIHVzZXMgdGhlc2UgZmxhZ3Mg
dG8KPiBtYWtlIHRoZSBkZWNpc2lvbiB3aGV0aGVyIGFuIG9wIGNhbiBiZSBzdXBwb3J0ZWQgYnkg
dGhlIGJvYXJkJ3Mgd2lyaW5nCj4gKGluIGEgd2F5LCBpbmRpcmVjdGx5IGNoZWNraW5nIGFnYWlu
c3Qgc3BpLXtyeCx0eH0tYnVzLXdpZHRoKS4KClRoYW5rcyBmb3IgdGhlIHdob2xlIGV4cGxhbmF0
aW9uLCBpdCdzIHByZXR0eSBjbGVhci4KCj4gSW4gYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2Nh
bGUvaW14OG1wLXRxbWE4bXBxbC5kdHNpIHdlIGhhdmU6Cj4KPiAJZmxhc2gwOiBmbGFzaEAwIHsK
PiAJCXJlZyA9IDwwPjsKPiAJCWNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciI7Cj4gCQlzcGkt
bWF4LWZyZXF1ZW5jeSA9IDw4MDAwMDAwMD47Cj4gCQlzcGktdHgtYnVzLXdpZHRoID0gPDE+Owo+
IAkJc3BpLXJ4LWJ1cy13aWR0aCA9IDw0PjsKPgo+IE5vdyB0aGUgdHJpY2t5IGJpdCBoZXJlIGlz
IHdlIGRvIHRoZSBiZWxvdyBpbiBzcGlfbWVtX2NoZWNrX2J1c3dpZHRoKCk6Cj4KPiAJaWYgKG9w
LT5kdW1teS5uYnl0ZXMgJiYKPiAJICAgIHNwaV9jaGVja19idXN3aWR0aF9yZXEobWVtLCBvcC0+
ZHVtbXkuYnVzd2lkdGgsIHRydWUpKQo+IAkJcmV0dXJuIGZhbHNlOwoKTWF5IEkgY2hhbGxlbmdl
IHRoaXMgZW50aXJlIHNlY3Rpb24/IElzIHRoZXJlICphbnkqIHJlYXNvbiB0byBjaGVjawphbnl0
aGluZyBhZ2FpbnN0IGR1bW15IGN5Y2xlcyB3cnQgdGhlIHdpZHRoPyBNYXliZSBhICJjYW4gaGFu
ZGxlIHgKY3ljbGVzIiBjaGVjayB3b3VsZCBiZSBpbnRlcmVzdGluZyB0aG91Z2gsIGJ1dCBJJ2Qg
Z28gZm9yIGEgZGlmZmVyZW50CmhlbHBlciwgdGhhdCBpcyBzcGVjaWZpYyB0byB0aGUgZHVtbXkg
Y3ljbGVzLgoKPiBUaGUgInRydWUiIHBhcmFtZXRlciBoZXJlIG1lYW5zIHRvICJ0cmVhdCB0aGUg
b3AgYXMgVFgiLiBTaW5jZSB0aGUKPiBib2FyZCBvbmx5IHN1cHBvcnRzIDEtYml0IFRYLCB0aGUg
NC1iaXQgZHVtbXkgVFggaXMgY29uc2lkZXJlZCBhcwo+IHVuc3VwcG9ydGVkLCBhbmQgdGhlIG9w
IGdldHMgcmVqZWN0ZWQuIEluIHJlYWxpdHksIGEgZHVtbXkgcGhhc2UgaXMKPiBuZWl0aGVyIGEg
Ulggbm9yIGEgVFguIFdlIHNob3VsZCBpZGVhbGx5IHRyZWF0IGl0IGRpZmZlcmVudGx5LCBhbmQK
PiBvbmx5IGNoZWNrIGlmIGl0IGlzIG9uZSBvZiAxLCAyLCA0LCBvciA4LCBhbmQgbm90IHRlc3Qg
aXQgYWdhaW5zdCB0aGUKPiBib2FyZCBjYXBhYmlsaXRpZXMgYXQgYWxsLgoKLi4uCgo+IFNpbmNl
IHdlIGFyZSBxdWl0ZSBsYXRlIGluIHRoZSBjeWNsZSwgYW5kIHRoYXQgY2hhbmdpbmcKPiBzcGlf
bWVtX2NoZWNrX2J1c3dpZHRoKCkgbWlnaHQgY2F1c2UgYWxsIHNvcnRzIG9mIGJyZWFrYWdlcywg
SSB0aGluayB0aGUKPiBiZXN0IGlkZWEgY3VycmVudGx5IHdvdWxkIGJlIHRvIHJldmVydCB0aGlz
IHBhdGNoLCBhbmQgcmVzZW5kIGl0IHdpdGgKPiB0aGUgb3RoZXIgY2hhbmdlcyBsYXRlci4KPgo+
IFR1ZG9yLCBNaWNoYWVsLCBNaXF1ZWwsIHdoYXQgZG8geW91IHRoaW5rIGFib3V0IHRoaXM/IFdl
IGFyZSBhdCByYzcgYnV0Cj4gSSB0aGluayB3ZSBzaG91bGQgc2VuZCBvdXQgYSBmaXhlcyBQUiB3
aXRoIGEgcmV2ZXJ0LiBJZiB5b3UgYWdyZWUsIEkKPiB3aWxsIHNlbmQgb3V0IGEgcGF0Y2ggYW5k
IGEgUFIuCgpFaXRoZXIgd2F5IEkgYW0gZmluZS4gdGhlIC1yYyBjeWNsZXMgYXJlIGFsc28gYXZh
aWxhYmxlIGZvciB1cyB0bwpzZXR0bGUuIEJ1dCBpdCdzIHRydWUgd2UgY2FuIGJpa2VzaGVkIGEg
bGl0dGxlIGJpdCwgc28gZmVlbCBmcmVlIHRvCnJldmVydCB0aGlzIHBhdGNoIGJlZm9yZSBzZW5k
aW5nIHRoZSBNUi4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
