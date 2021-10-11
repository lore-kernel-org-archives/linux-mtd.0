Return-Path: <SRS0=sMU9=O7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C395FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 05:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8658060238
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Oct 2021 05:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8658060238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hkj/trU0AoOjLMzYM3C5pEJ2ypbpwNs2MdM3qQU+YRg=; b=tul06FYnXRuEqc
	6xxWK2VBb4O31lcHreNxGJgWWrd/5QpWRQN4nnHlmBB6H3MV36zvQsW+78b+GO7h4TdtLBiWl3jp0
	w5RITHUbeSShFJHVHtC4xxyE5yAGx3m+az7Y0XWcpxxp/C1t3vEHD/N6SapJBBU0vquxJpFL6kKPm
	CaZmD6UEW1ooFD+dJsbqtwq4YRrp5XdW+/WG7GuYC6Yi3f4WCrDg+xXpPUB+G1ZW2/AymbPMEmXxe
	9CAFOL7jL+uYWPkgHMhUDfuLwDQ93SLzcQ2xRnYyThGO+9vp2PKhAzXVMa6Ed57eVrPGEIM21kiq3
	KIiApRojn43osNBOeRGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZoG6-007qn6-AR; Mon, 11 Oct 2021 05:53:58 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZoG0-007qlB-Rn
 for linux-mtd@lists.infradead.org; Mon, 11 Oct 2021 05:53:54 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id B4D7C805F;
 Mon, 11 Oct 2021 05:54:23 +0000 (UTC)
Date: Mon, 11 Oct 2021 08:53:50 +0300
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Roger Quadros <rogerq@kernel.org>,
 =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 nsekhar@ti.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
Message-ID: <YWPRbmaJQN85wRIO@atomide.com>
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
 <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
 <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64b65579-7153-1e7d-9866-77ce07fd1df5@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_225352_960107_56E2CCE1 
X-CRM114-Status: GOOD (  12.72  )
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

KiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGNhbm9uaWNhbC5jb20+
IFsyMTEwMDkgMTQ6NTZdOgo+IE9uIDA4LzEwLzIwMjEgMjE6MTAsIFJvZ2VyIFF1YWRyb3Mgd3Jv
dGU6Cj4gPiBLcnp5c3p0b2YsCj4gPiAKPiA+IE9uIDA3LzEwLzIwMjEgMjA6MzcsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4gT24gMDcvMTAvMjAyMSAxNDowOCwgUm9nZXIgUXVhZHJv
cyB3cm90ZToKPiA+Pj4gSGksCj4gPj4+Cj4gPj4+IFRoaXMgc2VyaWVzIGNvbnZlcnRzIHRpLGdw
bWMgbWVtb3J5IGNvbnRyb2xsZXIgYW5kIHRpLGdwbWMtbmFuZCBhbmQKPiA+Pj4gdGksZ3BtYy1v
bmVuYW5kIE1URCBjb250cm9sbGVyIGJpbmRpbmdzIHRvIHlhbWwuCj4gPj4+Cj4gPj4+IGNoZWVy
cywKPiA+Pj4gLXJvZ2VyCj4gPj4+Cj4gPj4KPiA+PiBIaSwKPiA+Pgo+ID4+IEFsdGhvdWdoIHlv
dSBkaWQgbm90IG1lbnRpb24gaXQgaGVyZSwgaXQgbG9va3MgbGlrZSB5b3UgaGF2ZSBzb21lCj4g
Pj4gZGVwZW5kZW5jaWVzIGJldHdlZW4gdGhlIHBhdGNoZXMuIE1heWJlIHRoaXMgc2hhbGwgZ28g
c2ltcGx5IHZpYSBSb2IncyB0cmVlPwo+ID4+Cj4gPiAKPiA+IFJvYiBoYXMgYWNrZWQgYWxsIHRo
ZSBEVCBiaW5kaW5nIHBhdGNoZXMuCj4gPiBTbyBpdCBpcyB1cHRvIHlvdSBhbmQgTWlxdcOobCB0
byBkZWNpZGUgdGhlIGJlc3Qgd2F5LiBNVEQgdHJlZSBvciBNZW1vcnkgY29udHJvbGxlciB0cmVl
Cj4gPiBmb3IgdGhlIGR0LWJpbmRpbmdzIHBhdGNoZXMuCj4gPiAKPiA+IFRoZSBBUk06IGR0cyBj
aGFuZ2VzIHNob3VsZCBnbyB2aWEgVG9ueSdzIE9NQVAgU29DIHRyZWUuCj4gPiAKPiA+IE9yIGlm
IFRvbnkgaXMgT0sgd2l0aCBpdCB0aGVuIG1heWJlIGFsbCBwYXRjaGVzIGNhbiBnbyB2aWEgVG9u
eSdzIHRyZWU/IDopCj4gPiAKPiAKPiAKPiBJIHJldmlld2VkIHRoZSB0d28gbWVtb3J5LWNvbnRy
b2xsZXIgcGF0Y2hlcywgc28gZmVlbCBmcmVlIHRvIHRha2UgdGhlbQo+IHZpYSBNVEQgb3IgT01B
UCBTb0MuCgpTb3VuZHMgbGlrZSBJIHNob3VsZCBwaWNrIHVwIHRoZXNlIGJlY2F1c2Ugb2YgdGhl
IGR0cyBjaGFuZ2VzLgoKVGhhbmtzLAoKVG9ueQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
