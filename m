Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59339C2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 17:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2412067D
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 17:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FRgqYoGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2412067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gMdV9/jp4cuvUvZSBGRocVG1x6WxcQ58Qij/A8Bc94k=; b=FRgqYoGNrHYcTdV/fAZMHWTNF
	IHuE68E0j2CI9U/+Tui1S+9TUmPJ9S379D7TIZX4CV0N1Bp2sge6XMVtn6HTWnCkDi9R5OFc0uggJ
	ypq5O/1fZ7QZaLpqQyqgyswCbMK4fzRZGoPLTEJlsooZLvOvjdNTGZPG12xqt+Mz7QsBtPDhOrKiU
	0cGAwwLIzUxX9eymoxaS/+xxMp8UcMib1uUaHouuN5qBhycsJVqIJCFqG2FQ71fR6UupgT78zm9im
	+mVsCAY0ji2Wv3l7X/dViSe5wZza1Qn/5x7faLwNR45V4Ao0gg8OwQjYlqv5aeecz7qYJ8bXjWYdT
	j6SmMZ9+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaMkW-0007lY-FJ; Wed, 04 Nov 2020 17:39:08 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaMkU-0007kJ-5H
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 17:39:07 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 99DDE200008;
 Wed,  4 Nov 2020 17:39:00 +0000 (UTC)
Date: Wed, 4 Nov 2020 18:38:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Kernel 5.10-rc1 not mounting NAND flash (Bisected to
 d7157ff49a5b ("mtd: rawnand: Use the ECC framework user input parsing
 bits"))
Message-ID: <20201104183859.590f0806@xps13>
In-Reply-To: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
References: <20201104183353.Horde.FyqZycHkfr5KHDjPaOEBpQ7@messagerie.c-s.fr>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_123906_308070_49136A2D 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JvdGUgb24gV2VkLCAwNCBOb3YKMjAyMCAxODozMzo1MyArMDEwMDoKCj4gSGkgTWlx
dWVsLAo+IAo+IEknbSB1bmFibGUgdG8gYm9vdCA1LjEwLXJjMSBvbiBteSBib2FyZHMuIEkgZ2V0
IHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gCj4gWyAgICA0LjEyNTgxMV0gbmFuZDogZGV2aWNlIGZv
dW5kLCBNYW51ZmFjdHVyZXIgSUQ6IDB4YWQsIENoaXAgSUQ6IDB4NzYKPiBbICAgIDQuMTMxOTky
XSBuYW5kOiBIeW5peCBOQU5EIDY0TWlCIDMsM1YgOC1iaXQKPiBbICAgIDQuMTM2MTczXSBuYW5k
OiA2NCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTYgS2lCLCBwYWdlIHNpemU6IDUxMiwgT09CIHNp
emU6IDE2Cj4gWyAgICA0LjE0MzUzNF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0t
LS0tCj4gWyAgICA0LjE0NzkzNF0gVW5zdXBwb3J0ZWQgRUNDIGFsZ29yaXRobSEKPiBbICAgIDQu
MTUyMTQyXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxIGF0IGRyaXZlcnMvbXRkL25hbmQvcmF3L25h
bmRfYmFzZS5jOjUyNDQgbmFuZF9zY2FuX3dpdGhfaWRzKzB4MTI2MC8weDE2NDAKPiAuLi4KPiBb
ICAgIDQuMzMyMDUyXSAtLS1bIGVuZCB0cmFjZSBlM2EzNmY2MmNhZTRhYzU2IF0tLS0KPiBbICAg
IDQuMzM2ODgyXSBncGlvLW5hbmQ6IHByb2JlIG9mIGMwMDAwMDAwLm5hbmQgZmFpbGVkIHdpdGgg
ZXJyb3IgLTIyCj4gCj4gQmlzZWN0ZWQgdG8gY29tbWl0IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3
bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3JrIHVzZXIgaW5wdXQgcGFyc2luZyBiaXRzIikKPiAK
PiBNeSBmaXJzdCBpbXByZXNzaW9uIGlzIHRoYXQgd2l0aCB0aGF0IGNoYW5nZSwgdGhlIHZhbHVl
IHNldCBpbiBjaGlwLT5lY2MuYWxnbwo+IGJ5IGdwaW9fbmFuZF9wcm9iZSgpIGluIGRyaXZlcnMv
bXRkL25hbmQvcmF3L2dwaW8uYyBnZXRzIG92ZXJ3cml0dGVuIGluIHJhd25hbmRfZHRfaW5pdCgp
Cj4gCj4gVGhlIGZvbGxvd2luZyBjaGFuZ2UgZml4ZXMgdGhlIHByb2JsZW0sIHRob3VnaCBJJ20g
bm90IHN1cmUgaXQgaXMgdGhlIHJpZ2h0IGZpeC4gQ2FuIHlvdSBoYXZlIGEgbG9vayA/Cj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMKPiBpbmRleCAxZjBkNTQyZDU5MjMuLmFhNzQ3OTdjZjJk
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2UuYwo+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jCj4gQEAgLTUwMzIsNyArNTAzMiw4IEBA
IHN0YXRpYyBpbnQgcmF3bmFuZF9kdF9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gICAJ
CWNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IG5hbmQtPmVjYy5kZWZhdWx0cy5lbmdpbmVfdHlwZTsK
PiAKPiAgIAljaGlwLT5lY2MucGxhY2VtZW50ID0gbmFuZC0+ZWNjLnVzZXJfY29uZi5wbGFjZW1l
bnQ7Cj4gLQljaGlwLT5lY2MuYWxnbyA9IG5hbmQtPmVjYy51c2VyX2NvbmYuYWxnbzsKPiArCWlm
IChjaGlwLT5lY2MuYWxnbyA9PSBOQU5EX0VDQ19BTEdPX1VOS05PV04pCj4gKwkJY2hpcC0+ZWNj
LmFsZ28gPSBuYW5kLT5lY2MudXNlcl9jb25mLmFsZ287Cj4gICAJY2hpcC0+ZWNjLnN0cmVuZ3Ro
ID0gbmFuZC0+ZWNjLnVzZXJfY29uZi5zdHJlbmd0aDsKPiAgIAljaGlwLT5lY2Muc2l6ZSA9IG5h
bmQtPmVjYy51c2VyX2NvbmYuc3RlcF9zaXplOwo+IAo+IC0tLQo+IAo+IFRoYW5rcwo+IENocmlz
dG9waGUKClNvcnJ5IGZvciBpbnRyb2R1Y2luZyB0aGlzIGlzc3VlLCBJIGRpZG4ndCBoYWQgdGhl
IHRpbWUgdG8gc2VuZCB0aGUKRml4ZXMgUFIgeWV0IGJ1dCBJIHRoaW5rIHRoaXMgaXNzdWUgaGFz
IGJlZW4gc29sdmVkIGFscmVhZHkuIENvdWxkCnlvdSBwbGVhc2UgdHJ5IHdpdGggYSByZWNlbnQg
bGludXgtbmV4dD8KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
