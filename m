Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37479C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gmrnclZxLrOp6ECw6q1JwZqb/Tutph2Vt2V77kxjN0=; b=ONdPV4dCDPvbIL
	+eOqQDf/DMpA8foq8plCj3L8air58cN6N577p1B8wss47XS+17fdq6c+9yD3CBptlH8Hc/jXgBJp6
	Rq44+KLx05b2CIjNIZMAG0bf9VL3Ku3Tkyr82T77Rq0fqaQjb/2oSOIFT9hSlflvyjsx7aq8oVuhv
	Gm6QwP9n2z1wWu6jSs78rrx/Qmh2Jrwf0ZdhGXzg3deJG1Vp9fdaM0ejLkl9mTge95x/qHs6AUa2M
	2JVC3Cox1I1xNMHAY2YLGuaqWYnRoilKXU65cKFdmfse3CHxY1tXYH/S13YeTTp8Xe0fluXagaEtQ
	IU2IakCo6QcN4Vnvl8FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAHgf-007KVP-UH; Wed, 19 Jan 2022 20:36:09 +0000
Received: from perseus.uberspace.de ([95.143.172.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAHga-007KUR-UH
 for linux-mtd@lists.infradead.org; Wed, 19 Jan 2022 20:36:07 +0000
Received: (qmail 15401 invoked by uid 988); 19 Jan 2022 20:36:02 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Message-ID: <8d578f8e-9cfd-58a0-940f-b085074c5d30@david-bauer.net>
Date: Wed, 19 Jan 2022 21:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Nick <vincent@systemli.org>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <20211227091638.177917-1-vincent@systemli.org>
 <20211227091638.177917-2-vincent@systemli.org>
 <0db13110-ee6f-2e02-abf9-d5b9eecafcb4@microchip.com>
 <a187ec1b-3bae-659d-86c5-4e2b3403eca4@systemli.org>
 <22bd791798d15d74060c44f65620921c@walle.cc>
From: David Bauer <mail@david-bauer.net>
In-Reply-To: <22bd791798d15d74060c44f65620921c@walle.cc>
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.688246) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.788246
Received: from unknown (HELO unkown) (::1)
 by perseus.uberspace.de (Haraka/2.8.28) with ESMTPSA;
 Wed, 19 Jan 2022 21:36:01 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_123605_289082_254E9E72 
X-CRM114-Status: GOOD (  21.41  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk9uIDEvMTkvMjIgMTY6NDksIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gQW0g
MjAyMS0xMi0zMSAxMDoxMCwgc2NocmllYiBOaWNrOgo+PiBJIGxvb2tlZCBub3cgdGhyb3VnaCBh
bGwgZGF0YXNoZWV0cyBJIGZvdW5kIGFuZCB0aGUgc2l6ZXMgb2YgdGhlCj4+IHN0YXR1cyByZWdp
c3Rlci4gSG93ZXZlciwgSSBkaWQgbm90IGZpbmQgYW55IGRhdGFzaGVldCBmb3IgdGhlCj4+ICJt
eDY2bDFnNTVnIi4KPj4gSG93ZXZlciwgSSBhbSBub3Qgc3VyZSBpZiBJIG1heWJlIG1pc3Mgc29t
ZXRoaW5nIHRvIHNlZSBpZgo+PiAiU05PUl9GX0hBU18xNkJJVF9TUiIgaXMgc3VwcG9ydGVkLiBJ
IG9ubHkgbG9va2VkIGF0IHRoZSBzdGF0dXMKPj4gcmVnaXN0ZXIgc2l6ZS4KPiAKPiBIb3cgZGlk
IHlvdSBjaGVjayB0aGF0Pwo+IAo+IHJhbmRvbSBleGFtcGxlOgo+PiBteDY2dTUxMjM1ZjogOGJp
dAo+PiBodHRwczovL3d3dy5tYWNyb25peC5jb20vTGlzdHMvRGF0YXNoZWV0L0F0dGFjaG1lbnRz
Lzc2NzQvTVg2NlU1MTIzNUYsJTIwMS44ViwlMjA1MTJNYiwlMjB2MS4xLnBkZgo+PiAoc2xpZGUg
MzQpCj4gCj4gRmlndXJlIDIzOgo+IFdSU1IgdGFrZXMgYm90aCBzdGF0dXMgcmVnaXN0ZXIgYW5k
IGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIuCj4gCj4gVGhhdCBiZWluZyBzYWlkLiBJJ2QgcHJlZmVy
IHRvIGhhdmUgYSBzYW5lIGRlZmF1bHQgZm9yIHRoYXQKPiBmbGFnIC0gd2hpY2ggaXMgdG8gX25v
dF8gc2V0IGl0IGJ5IGRlZmF1bHQuIEZvciBub3csIHdlIGNhbgo+IGp1c3QgcmVtb3ZlIHRoZSBm
bGFnIGZyb20gc3BpX25vcl9pbml0X2RlZmF1bHRfcGFyYW1zKCkgYW5kCj4gbW92ZSBpdCBpbnRv
IHRoZSBtYW51ZmFjdHVyZXIgZGVmYXVsdCBpbml0LiBUaGVuIHdlIGNhbgo+IGdvIHRocm91Z2gg
dGhlIGZsYXNoZXMgYW5kIHJlbW92ZSB0aGUgZmxhZyB0aGVyZS4KCkkgd2FzIHdvcmtpbmcgb24g
YSBzaW1pbGFyIHNlcmllcyBpbiBwYXJhbGxlbCAtIGFuZCBpIGp1c3Qgd2FudCB0bwpjb25maXJt
IHRoaXMgYmVmb3JlIGkgc3VibWl0IGl0LiBbMF0KCllvdXIgdGFrZSB3b3VsZCBiZSB0byByZW1v
dmUgdGhlIGZsYWcgZnJvbSBzcGlfbm9yX2luaXRfZGVmYXVsdF9wYXJhbXMKYW5kIHBsYWNlIGl0
IGluIGFsbCB2ZW5kb3IgaW5pdC1jYWxscywgcmlnaHQ/CgpNeSBjdXJyZW50IHRha2Ugd291bGQg
YmUgdG8gYWRkIGEgbmV3IGZsYWcgd2hpY2ggZGVub3RlcyBmbGFzaGVzIHRoYXQKb25seSBoYXZl
IGEgc2luZ2xlIDgtYml0IFNSLCBubyBzZWNvbmQgU1IgLyBDUi4KClRoaXMgd291bGQgcmVxdWly
ZSBtaW5pbWFsIGNoYW5nZXMsIGFsdGhvdWdoIGFmdGVyIHlvdXIgRS1NYWlsIGkgd291bGQKcmVu
YW1lIGl0IHNvIGl0IGJlY29tZXMgY2xlYXIgaXQgaXMgcmF0aGVyIGZvciBkZW5vdGluZyBmbGFz
aGVzIHdoaWNoCm9ubHkgc3VwcG9ydCB3cml0aW5nIGEgc2luZ2xlIDgtYml0IHJlZ2lzdGVyIHdp
dGggYSBXUlNSIGNvbW1hbmQuCgpXaGF0IGRvIHlvdSB0aGluaz8KClswXSBodHRwczovL2dpdGh1
Yi5jb20vYmxvY2t0cnJvbi9saW51eC9jb21taXRzL3NwaS1ub3QtOHNyLWZsYWcKCkJlc3QKRGF2
aWQKCj4gCj4gVGhpcyBpcyBtYWlubHkgYmVjYXVzZSBpdCBzZWVtcyB0byBiZSBhIGxlZ2FjeSBm
ZWF0dXJlLiBUbwo+IHF1b3RlIHRoZSBkYXRhc2hlZXQgb2YgdGhlIFdpbmJvbmQgVzI1UTMyRlcg
WzFdOgo+IAo+IHwgVGhlIFcyNVEzMkZXIGlzIGFsc28gYmFja3dhcmQgY29tcGF0aWJsZSB0byBX
aW5ib25k4oCZcyBwcmV2aW91cwo+IHwgZ2VuZXJhdGlvbnMgb2Ygc2VyaWFsIGZsYXNoIG1lbW9y
aWVzLCBpbiB3aGljaCB0aGUgU3RhdHVzCj4gfCBSZWdpc3Rlci0xJjIgY2FuIGJlIHdyaXR0ZW4g
dXNpbmcgYSBzaW5nbGUg4oCcV3JpdGUgU3RhdHVzCj4gfCBSZWdpc3Rlci0xICgwMWgp4oCdIGNv
bW1hbmQuCj4gCj4gLW1pY2hhZWwKPiAKPiBbMV0gaHR0cHM6Ly93d3cud2luYm9uZC5jb20vcmVz
b3VyY2UtZmlsZXMvdzI1cTMyZnclMjByZXZqJTIwMDQyNDIwMTglMjBzZmRwLnBkZgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
