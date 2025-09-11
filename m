Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C76DCAC58E
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Sep 2025 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FeO7YkGlBAenBRaR1AWfRodUkLM/iEl50QpjN2BnHWk=; b=3UKxVI64RxHRSJ
	zBjGT2V7JuNhK9oCiiidNzoERMFe5WaP/KXgRtQ0jarW3rUDx+L96yBMBblx2psSC/sjAYuuxlUkE
	C9u501lOMzcJYQ2nJQDGeoeffCZKFZPGMiKsI3e6FjLnHEteWQK/vSvWkE8mk+6bU7tJfD8/DWm3f
	hPlTlhD8cgR2YxRxr/zkZvi0+/W3xeLk4b0Tvv5eK42s71p7Bl+9H4S9SrAWREYGO7jhcSLu9HTme
	ecdif2V/61GmZDNup8yEIXmK4dc6M9UYgFRALkYwu5G6DNzDTLvWMKbrds7oxIxLrdIxGmQNOZBo1
	aEBpeGq9jovchHQ8LjLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgy4-000000037wV-0Qn1;
	Thu, 11 Sep 2025 13:04:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwgy3-000000037vu-0dfU
	for linux-mtd@lists.infradead.org;
	Thu, 11 Sep 2025 13:04:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E9D1601B1;
	Thu, 11 Sep 2025 13:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D88C4CEF0;
	Thu, 11 Sep 2025 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757595842;
	bh=GwqAHVRPsszIE7g35d/vmUuyVRMTwBHaHgAjeOkpHK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b/RqLoLgtL3sgmIEZ1Vld4VoMBD9bicGqKbkFUhP4M/7ZzlxS2U+K3cS+udDxmCLQ
	 RJ6bzdG4i5o0cQp/b0Vbv44OXcEhW87PiaCKxPen2uxh2Vr5cYcirgUl5n9j0HuaKR
	 A/9iTmMryZRKPBUD++2wtt4LeTRYshF3/tmZNVRybSROgOK9mDg/WTgLVAAOc4JHnV
	 o8ah2TicKR/FyOaZ3W0lC+PJO0fYXIEKMcaSUSldVZeGsk/AMoLfy08PaMg8Vzdnrw
	 ew5Si9T1xsPX6M6IgdaEs6RkYbKTe66jt9HAD82onoPrRKtHL6U+NKSAXl/i7PBxoU
	 2Fb5jROE0frIg==
From: Pratyush Yadav <pratyush@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,  Santhosh Kumar K
 <s-k6@ti.com>,  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v2] mtd: core: always verify OOB offset in
 mtd_check_oob_ops()
In-Reply-To: <a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com>
References: <20250901-mtd-validate-ooboffs-v2-1-c1df86a16743@gmail.com>
	<175708415877.334139.11409801733118104229.b4-ty@bootlin.com>
	<454e092d-5b75-4758-a0e9-dfbb7bf271d7@ti.com> <87348tbeqg.fsf@bootlin.com>
	<a208824c-acf6-4a48-8fde-f9926a6e4db5@gmail.com>
Date: Thu, 11 Sep 2025 15:03:58 +0200
Message-ID: <mafs0v7lpi1j5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

T24gVGh1LCBTZXAgMTEgMjAyNSwgR2Fib3IgSnVob3Mgd3JvdGU6Cgo+IEhpIE1pcXVlbCwgU2Fu
dGhvc2gsCj4KPiAyMDI1LiAwOS4gMTEuIDEwOjAwIGtlbHRlesOpc3NlbCwgTWlxdWVsIFJheW5h
bCDDrXJ0YToKPj4gSGVsbG8sCj4+IAo+PiBPbiAxMS8wOS8yMDI1IGF0IDExOjUyOjI3ICswNTMw
LCBTYW50aG9zaCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cj4+IAo+Pj4gSGVsbG8sCj4+
Pgo+Pj4gT24gMDUvMDkvMjUgMjA6MjUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4gT24gTW9u
LCAwMSBTZXAgMjAyNSAxNjoyNDozNSArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4+Pj4+IFVz
aW5nIGFuIE9PQiBvZmZzZXQgcGFzdCBlbmQgb2YgdGhlIGF2YWlsYWJsZSBPT0IgZGF0YSBpcyBp
bnZhbGlkLAo+Pj4+PiBpcnJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGUgJ29vYmxlbicgaXMgc2V0
IGluIHRoZSBvcHMgb3Igbm90LiBNb3ZlCj4+Pj4+IHRoZSByZWxldmFudCBjaGVjayBvdXQgZnJv
bSB0aGUgaWYgc3RhdGVtZW50IHRvIGFsd2F5cyB2ZXJpZnkgdGhhdC4KPj4+Pj4KPj4+Pj4gVGhl
ICdvb2J0ZXN0JyBtb2R1bGUgZXhlY3V0ZXMgZm91ciB0ZXN0cyB0byB2ZXJpZnkgaG93IHJlYWRp
bmcvd3JpdGluZwo+Pj4+PiBPT0IgZGF0YSBwYXN0IGVuZCBvZiB0aGUgZGV2aWNlcyBpcyBoYW5k
bGVkLiBJdCBleHBlY3RzIGVycm9ycyBpbiBjYXNlCj4+Pj4+IG9mIHRoZXNlIHRlc3RzLCBidXQg
dGhpcyBleHBlY3RhdGlvbiBmYWlscyBpbiB0aGUgbGFzdCB0d28gdGVzdHMgb24KPj4+Pj4gTVRE
IGRldmljZXMsIHdoaWNoIGhhdmUgbm8gT09CIGJ5dGVzIGF2YWlsYWJsZS4KPj4+Pj4KPj4+Pj4g
Wy4uLl0KPj4+PiBBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCj4+Pj4gWzEvMV0gbXRkOiBj
b3JlOiBhbHdheXMgdmVyaWZ5IE9PQiBvZmZzZXQgaW4gbXRkX2NoZWNrX29vYl9vcHMoKQo+Pj4+
ICAgICAgICBjb21taXQ6IGJmN2QwNTQzYjI2MDJiZTVjYjQ1MGQ4ZWM1YTg3MTA3ODc4MDZmODgK
Pj4+Cj4+PiBJJ20gc2VlaW5nIGEgZmFpbHVyZSBpbiBTUEkgTk9SIGZsYXNoZXMgZHVlIHRvIHRo
aXMgcGF0Y2g6Cj4+PiAoVGVzdGVkIG9uIEFNNjJ4IFNLIHdpdGggUzI4SFM1MTJUIE9TUEkgTk9S
IGZsYXNoKQo+Cj4gU29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlLgo+Cj4+IEdhYm9yLCBjYW4g
eW91IGNoZWNrIHdoYXQgaGFwcGVucyB3aXRoIG10ZGJsb2NrPwoKTXkgZ3Vlc3MgZnJvbSBhIHF1
aWNrIGxvb2sgYXQgdGhlIGNvZGUgaXMgdGhhdCBOT1IgZGV2aWNlcyBoYXZlCm10ZC0+b29ic2l6
ZSA9PSAwIGFuZCBtdGRfcmVhZCgpIHNldHMgb3BzLT5vb2JvZmZzIGFuZCBvcHMtPm9vYmxlbiB0
byAwLgpTbyBub3cgdGhhdCB0aGlzIGNoZWNrIGlzIG5vdCBndWFyZGVkIGJ5IGlmIChvcHMtPm9v
YmxlbiksIGl0IGdldHMKdHJpZ2dlcmVkIGZvciBOT1IgZGV2aWNlcyBvbiB0aGUgbXRkX3JlYWQo
KSBwYXRoIGFuZCBlc3NlbnRpYWxseSB0dXJucwppbnRvIGFuIGlmICgwID49IDApLCByZXR1cm5p
bmcgLUVJTlZBTC4KCk1heWJlIGEgYmV0dGVyIGNoZWNrIGlzIGlmICgob3BzLT5vb2JvZmZzICsg
b3BzLT5vb2JsZW4pID4gbXRkX29vYmF2YWlsKCkpPwoKTm90ZSB0aGF0IHRoZSBlcXVhbGl0eSBp
cyBub3QgYW4gZXJyb3IgaW4gdGhpcyBjYXNlLiBJIGhhdmVuJ3Qgd29ya2VkCndpdGggdGhlIE9P
QiBjb2RlIG11Y2ggc28gSSBhbSBub3Qgc3VyZSBpZiB0aGlzIGNvbmRpdGlvbiBtYWtlcyBzZW5z
ZSwKYnV0IHNlZW1zIHRvIGRvIHNvIGF0IGZpcnN0IGdsYW5jZSBhdCBsZWFzdC4KClsuLi5dCgot
LSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
