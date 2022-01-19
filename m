Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E61BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 15:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpEzBSZvutXGnyxkRk1Ztu07TSSbAJiKEcKgNY05MFQ=; b=Dx90n35IBZCrFYeMA/IvsWu+Bf
	VQ3i/qdDKfoVo7Xp/4ebFVMY3CKbLNJ5sZwdqUeU0CA/Bo1TgHU8mGHI3c0q2JRHBvQrrpT92wmpy
	AV66krkpyYoJ/wkLmjHTbx+ftY7vZd7ARsl8v614Ozg2SmBBqzHN9HCZOLjGDNcqCaEPHb+4CHJVc
	X/3PcCiCh8rOrPhfPeZnza9kbSTfodWfC/0aN+6VjeDzTASDhfFVooIX6yZGJEkjANIIkIqpyh/Kt
	p2+5c+bCD51MkBMjXRQL3g4GnjB5ezNFlG0pgKVJt+BkeBJStjajT+cqIsSZ8HoKsIz1BOMqfJ3ir
	J/C/rZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nADDp-006DnP-PD; Wed, 19 Jan 2022 15:50:05 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nADDl-006Dly-CS
 for linux-mtd@lists.infradead.org; Wed, 19 Jan 2022 15:50:03 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A2B9622175;
 Wed, 19 Jan 2022 16:49:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1642607397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dtcA+WKJs7irWegZONjEkZgZiCTTQaVTi+Rl5eLOVhk=;
 b=QhO0ki9ItUnj7BmgPIJE8Lp54kr9avDc35TohqsR1lIMIJC8IQvIEcWBXiIY8iPuKjGPI4
 Gt5dsN23oRbTwAzozcTn67jocOkOIU4kz9T1bAS9GdL077iyzSnShnCFpi6Tdc5u2wlyyo
 7PEI0CvvoHg9Kve/HrM1jF2loV7QJYs=
MIME-Version: 1.0
Date: Wed, 19 Jan 2022 16:49:56 +0100
From: Michael Walle <michael@walle.cc>
To: Nick <vincent@systemli.org>
Cc: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org,
 mail@david-bauer.net
Subject: Re: [PATCH 2/2] mtd: spi-nor: disable 16-bit-sr for macronix
In-Reply-To: <a187ec1b-3bae-659d-86c5-4e2b3403eca4@systemli.org>
References: <20211227091638.177917-1-vincent@systemli.org>
 <20211227091638.177917-2-vincent@systemli.org>
 <0db13110-ee6f-2e02-abf9-d5b9eecafcb4@microchip.com>
 <a187ec1b-3bae-659d-86c5-4e2b3403eca4@systemli.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <22bd791798d15d74060c44f65620921c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_075001_610348_A5B5399A 
X-CRM114-Status: GOOD (  14.05  )
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

QW0gMjAyMS0xMi0zMSAxMDoxMCwgc2NocmllYiBOaWNrOgo+IEkgbG9va2VkIG5vdyB0aHJvdWdo
IGFsbCBkYXRhc2hlZXRzIEkgZm91bmQgYW5kIHRoZSBzaXplcyBvZiB0aGUKPiBzdGF0dXMgcmVn
aXN0ZXIuIEhvd2V2ZXIsIEkgZGlkIG5vdCBmaW5kIGFueSBkYXRhc2hlZXQgZm9yIHRoZQo+ICJt
eDY2bDFnNTVnIi4KPiBIb3dldmVyLCBJIGFtIG5vdCBzdXJlIGlmIEkgbWF5YmUgbWlzcyBzb21l
dGhpbmcgdG8gc2VlIGlmCj4gIlNOT1JfRl9IQVNfMTZCSVRfU1IiIGlzIHN1cHBvcnRlZC4gSSBv
bmx5IGxvb2tlZCBhdCB0aGUgc3RhdHVzCj4gcmVnaXN0ZXIgc2l6ZS4KCkhvdyBkaWQgeW91IGNo
ZWNrIHRoYXQ/CgpyYW5kb20gZXhhbXBsZToKPiBteDY2dTUxMjM1ZjogOGJpdAo+IGh0dHBzOi8v
d3d3Lm1hY3Jvbml4LmNvbS9MaXN0cy9EYXRhc2hlZXQvQXR0YWNobWVudHMvNzY3NC9NWDY2VTUx
MjM1RiwlMjAxLjhWLCUyMDUxMk1iLCUyMHYxLjEucGRmCj4gKHNsaWRlIDM0KQoKRmlndXJlIDIz
OgpXUlNSIHRha2VzIGJvdGggc3RhdHVzIHJlZ2lzdGVyIGFuZCBjb25maWd1cmF0aW9uIHJlZ2lz
dGVyLgoKVGhhdCBiZWluZyBzYWlkLiBJJ2QgcHJlZmVyIHRvIGhhdmUgYSBzYW5lIGRlZmF1bHQg
Zm9yIHRoYXQKZmxhZyAtIHdoaWNoIGlzIHRvIF9ub3RfIHNldCBpdCBieSBkZWZhdWx0LiBGb3Ig
bm93LCB3ZSBjYW4KanVzdCByZW1vdmUgdGhlIGZsYWcgZnJvbSBzcGlfbm9yX2luaXRfZGVmYXVs
dF9wYXJhbXMoKSBhbmQKbW92ZSBpdCBpbnRvIHRoZSBtYW51ZmFjdHVyZXIgZGVmYXVsdCBpbml0
LiBUaGVuIHdlIGNhbgpnbyB0aHJvdWdoIHRoZSBmbGFzaGVzIGFuZCByZW1vdmUgdGhlIGZsYWcg
dGhlcmUuCgpUaGlzIGlzIG1haW5seSBiZWNhdXNlIGl0IHNlZW1zIHRvIGJlIGEgbGVnYWN5IGZl
YXR1cmUuIFRvCnF1b3RlIHRoZSBkYXRhc2hlZXQgb2YgdGhlIFdpbmJvbmQgVzI1UTMyRlcgWzFd
OgoKfCBUaGUgVzI1UTMyRlcgaXMgYWxzbyBiYWNrd2FyZCBjb21wYXRpYmxlIHRvIFdpbmJvbmTi
gJlzIHByZXZpb3VzCnwgZ2VuZXJhdGlvbnMgb2Ygc2VyaWFsIGZsYXNoIG1lbW9yaWVzLCBpbiB3
aGljaCB0aGUgU3RhdHVzCnwgUmVnaXN0ZXItMSYyIGNhbiBiZSB3cml0dGVuIHVzaW5nIGEgc2lu
Z2xlIOKAnFdyaXRlIFN0YXR1cwp8IFJlZ2lzdGVyLTEgKDAxaCnigJ0gY29tbWFuZC4KCi1taWNo
YWVsCgpbMV0gCmh0dHBzOi8vd3d3LndpbmJvbmQuY29tL3Jlc291cmNlLWZpbGVzL3cyNXEzMmZ3
JTIwcmV2aiUyMDA0MjQyMDE4JTIwc2ZkcC5wZGYKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
