Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4704EC47420
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 09:23:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804D020B1F
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 09:23:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gpBF+Y2v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=agner.ch header.i=@agner.ch header.b="hroJCYAi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804D020B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=agner.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7YakTLsGCfeuSEmspFC5NWfuWHD7qzoNKJkv4hb18i8=; b=gpBF+Y2v4jp9mKb6xcSMstHhp
	fuoJuJFi4TtHNVG/BLME3EtJbKKQiYtJARbzG5hhsKXVQgLLA4ZsLWeJa2azE5tsMWH7KO82iauRm
	6INHu5NrurNT913NdqwY7dMGMnxxnrj09F4OK4dDfjeTCNdJZJnKZRzUxw1cPKKmqlwDl/Jj4vy+Z
	5mij0Jg9X9+fu6oMWsTVsGzMVfM+0f71MJmOkPrkmz38Y3jW7GdN3UB79Xq9OdkTNLu6tLBgZ/m1W
	H8unToU5NS4Ez/+BptlgtJyyWQjinruF833CvszKLeatdnLH+qJY4bEPDzBMk1b5/EzUL2hFOlAjN
	Pkzv8YXPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNun1-0002VT-Sk; Thu, 01 Oct 2020 09:22:15 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNumG-0001vH-37
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 09:21:29 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id DEF2E5C02DF;
 Thu,  1 Oct 2020 11:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1601544082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJK2/g5MDYjG3Sxi9BcFtEIq5rC8/bqmlZd0eKbR634=;
 b=hroJCYAiStf8dHR+l235HZ4Q/wXFIt0RGC0QrXUjZM6vMQtcSlNWvSatOm5CqbWHVcLPoz
 sH1xFsuRN5uEi9y63ljnone2N3VCyU4jkQPNXCZi1jc8KbD9y4vMkSNaJeXum7vJWBhwlv
 xqJ3IorFVg1q/EFjnE8eC2J2ylTrBrk=
MIME-Version: 1.0
Date: Thu, 01 Oct 2020 11:21:22 +0200
From: Stefan Agner <stefan@agner.ch>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
In-Reply-To: <20201001101206.6e4beea7@xps13>
References: <20200930210824.GA12277@embeddedor>
 <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
 <20200930213634.GA12855@embeddedor>
 <CAG48ez3XqE0m2UmRh+OtmYJRhyCBYY=sdJKaWBXtJZKCRpLMYQ@mail.gmail.com>
 <20201001101206.6e4beea7@xps13>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <22e3b020f4c7e7a8cd0c1f474ba07cad@agner.ch>
X-Sender: stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_052128_355675_1FAE21DE 
X-CRM114-Status: GOOD (  25.23  )
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
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jann Horn <jannh@google.com>, Richard Weinberger <richard@nod.at>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-tegra@vger.kernel.org,
 kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMjAyMC0xMC0wMSAxMDoxMiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBKYW5uLAo+IAo+
IEphbm4gSG9ybiA8amFubmhAZ29vZ2xlLmNvbT4gd3JvdGUgb24gVGh1LCAxIE9jdCAyMDIwIDAw
OjMyOjI0ICswMjAwOgo+IAo+PiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCAxMTozMCBQTSBHdXN0
YXZvIEEuIFIuIFNpbHZhCj4+IDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IE9u
IFdlZCwgU2VwIDMwLCAyMDIwIGF0IDExOjEwOjQzUE0gKzAyMDAsIEphbm4gSG9ybiB3cm90ZToK
Pj4gPiA+IE9uIFdlZCwgU2VwIDMwLCAyMDIwIGF0IDExOjAyIFBNIEd1c3Rhdm8gQS4gUi4gU2ls
dmEKPj4gPiA+IDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+ID4gPiBUaGVyZSBp
cyBhIHJlZ3VsYXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFy
ZSBoYXZpbmcKPj4gPiA+ID4gYSBkeW5hbWljYWxseSBzaXplZCBzZXQgb2YgdHJhaWxpbmcgZWxl
bWVudHMgaW4gYSBzdHJ1Y3R1cmUuIEtlcm5lbCBjb2RlCj4+ID4gPiA+IHNob3VsZCBhbHdheXMg
dXNlIOKAnGZsZXhpYmxlIGFycmF5IG1lbWJlcnPigJ1bMV0gZm9yIHRoZXNlIGNhc2VzLiBUaGUg
b2xkZXIKPj4gPiA+ID4gc3R5bGUgb2Ygb25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlz
IHNob3VsZCBubyBsb25nZXIgYmUgdXNlZFsyXS4KPj4gPiA+Cj4+ID4gPiBCdXQgdGhpcyBpcyBu
b3Qgc3VjaCBhIGNhc2UsIHJpZ2h0PyBJc24ndCB0aGlzIGEgdHJ1ZSBmaXhlZC1zaXplCj4+ID4g
PiBhcnJheT8gSXQgc291bmRzIGxpa2UgeW91J3JlIGp1c3QgY2hhbmdpbmcgaXQgYmVjYXVzZSBp
dAo+PiA+ID4gcGF0dGVybi1tYXRjaGVkIG9uICJhcnJheSBvZiBsZW5ndGggMSBhdCB0aGUgZW5k
IG9mIGEgc3RydWN0Ii4KPj4gPgo+PiA+IFllYWg7IEkgc2hvdWxkIGhhdmUgY2hhbmdlZCB0aGF0
ICdkeW5hbWljYWxseScgcGFydCBvZiB0aGUgdGV4dCBhYm92ZQo+PiA+IGEgYml0LiBIb3dldmVy
LCBhcyBJIGNvbW1lbnRlZCBpbiB0aGUgdGV4dCBiZWxvdywgaW4gdGhlIGNhc2UgdGhhdCBtb3Jl
Cj4+ID4gQ1MgSURzIGFyZSBuZWVkZWQgKGxldCdzIHdhaXQgZm9yIHRoZSBtYWludGFpbmVycyB0
byBjb21tZW50IG9uIHRoaXMuLi4pCj4+ID4gaW4gdGhlIGZ1dHVyZSwgdGhpcyBjaGFuZ2UgbWFr
ZXMgdGhlIGNvZGUgbW9yZSBtYWludGFpbmFibGUsIGFzIGZvcgo+PiA+IHRoZSBhbGxvY2F0aW9u
IHBhcnQsIHRoZSBkZXZlbG9wZXIgd291bGQgb25seSBoYXZlIHRvIHVwZGF0ZSB0aGUgQ1NfTgo+
PiA+IG1hY3JvIHRvIHRoZSBudW1iZXIgb2YgQ1MgSURzIHRoYXQgYXJlIG5lZWRlZC4KPj4KPj4g
QnV0IGluIHRoYXQgY2FzZSwgc2hvdWxkbid0IHlvdSBjaGFuZ2UgaXQgdG8gImludCBjc1tDU19O
XSIgYW5kIGdldAo+PiByaWQgb2YgdGhlIHN0cnVjdF9zaXplKCkgc3R1ZmY/Cj4gCj4gSSBkbyBh
Z3JlZSB3aXRoIEphbm4sIEkgdGhpbmsgaXQncyBiZXN0IHRvIGNvbnNpZGVyIHRoaXMgYSBmaXhl
ZC1zaXplCj4gYXJyYXkgZm9yIG5vdy4gSWYgd2UgZXZlciB3YW50IHRvIGV4dGVuZCB0aGUgbnVt
YmVyIG9mIHN1cHBvcnRlZCBDUywKPiB0aGVyZSBpcyBtdWNoIG1vcmUgcmV3b3JrIGludm9sdmVk
IGFueXdheS4KCkkgYWdyZWUsIHRvbywganVzdCBhc3N1bWUgdGhpcyBpcyBhIGZpeGVkLXNpemUg
YXJyYXkgb2YgMSBlbGVtZW50LgoKSW4gZmFjdCwgSSBhbSBub3QgYXdhcmUgb2YgYSBkZXNpZ24g
d2hpY2ggbmVlZHMgbXVsdGlwbGUgY2hpcCBzZWxlY3RzLgoKLS0KU3RlZmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
