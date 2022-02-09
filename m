Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81AFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lpa4VlQXDcM+xEjdS/m8vyt3KyUYzOSJJgLNMCCZEYE=; b=rteBLm30deRFix
	gKfxSpVyAuDbaCbRZB/ZRst6szOJ+lMl9Saw7NDQU7sx4yxHRvl7usjv08hExVJktdOOqYBsIexFn
	NbcSF7LXkqFzwUnRA20U9JSj21OuXy3T4lhkrxdHvl+PcxkWdVdhT3DVSCtQv4og7SH5CvfyIDxBi
	nMwYS7kisViHxcNAGQ3jE2o5vvKVFds6DhHLz5EnlBIxPbu7J7FW8RaMAZjcvxafeBL8+YmHTyN/Z
	4hPA9ktPOqhaS3ytBdk7fiRnIb3LWQTp+VToni0yhgfBVUsr9gXtViUuCgg7z4G6a9ESPm5wTPFEG
	6WaqhZDi3dQnSnd2LEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHo8l-000OaF-KA; Wed, 09 Feb 2022 14:40:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHo8X-000OVF-BH; Wed, 09 Feb 2022 14:40:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1487061AFE;
 Wed,  9 Feb 2022 14:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C524C340E7;
 Wed,  9 Feb 2022 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644417599;
 bh=0SIeUiOXn0tjCrDKJuQB6ouGPPgP7RefTUZM9lUB+bo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yx7skvXkeC7Yb8x+LzaigC623tgLZJZmHr47Xp5TzrMg30z6TdgwnrhPtHkGHdBqg
 sBkwNDHq71K6WoWZdhmFRZ/U987CBrHfNf3C+VCG3uf/Dtfqm0+tPrmoOByOZB6xam
 XjQwIRM8wv561tpKIWzHO89GMvjFAnnvk8un4WWI2RpMyLD1yLPTsJK3IHmJ495Cri
 WyheG/uhDgCE5zNHlg1few2vl8b858u3UbcK6axI6tFlQAei2sX3ghjJZVhhsgLkNu
 RSj5IVHt5jTZ5URG7iCDkk8gFg29D+BJrxIU2brLXTaiU82T720o7vhFMhSrHMaRKM
 I3PtBdPo/G3Vg==
Message-ID: <7572e50b-3e6b-2888-a9e0-3ca5020c7e0e@kernel.org>
Date: Wed, 9 Feb 2022 16:39:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd/memory: omap: Fix build dependencies
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20220127105652.1063624-1-miquel.raynal@bootlin.com>
 <20220209135732.fig35edxzgwdgugd@those>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20220209135732.fig35edxzgwdgugd@those>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_064001_508934_8E8F79B2 
X-CRM114-Status: GOOD (  25.50  )
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

SGksCgpPbiAwOS8wMi8yMDIyIDE1OjU3LCBOaXNoYW50aCBNZW5vbiB3cm90ZToKPiBPbiAxMTo1
Ni0yMDIyMDEyNywgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4gVGhlIE9tYXAyIHJhdyBOQU5EIGNv
bnRyb2xsZXIgKE1URF9OQU5EX09NQVAyKSBzZWxlY3RzIHRoZSBPbWFwIG1lbW9yeQo+PiBjb250
cm9sbGVyIChPTUFQX0dQTUMpIGZvciB0aGUgQVJDSF9LMyBwbGF0Zm9ybXMgYW5kIGZvciBjb21w
aWxlCj4+IHRlc3RpbmcuCj4+Cj4+IFRoZSBPbWFwIG1lbW9yeSBjb250cm9sbGVyIChPTUFQX0dQ
TUMpIGRlcGVuZHMgb24gT0ZfQUREUkVTUyBiZWNhdXNlIHRoZQo+PiBkcml2ZXIgdXNlcyBvZl9h
ZGRyZXNzX3RvX3Jlc291cmNlKCkuCj4+Cj4+IFRoaXMgbWF5IHByb2R1Y2UgdGhlIGZvbGxvd2lu
ZyB3YXJuaW5nOgo+PiBXQVJOSU5HOiB1bm1ldCBkaXJlY3QgZGVwZW5kZW5jaWVzIGRldGVjdGVk
IGZvciBPTUFQX0dQTUMKPj4gRGVwZW5kcyBvbiBbbl06Cj4+ICAgLSBNRU1PUlkgWz15XSAmJiBP
Rl9BRERSRVNTIFs9bl0KPj4gU2VsZWN0ZWQgYnkgW21dOgo+PiAgIC0gTVREX05BTkRfT01BUDIg
Wz1tXSAmJiBNVEQgWz1tXSAmJiBNVERfUkFXX05BTkQgWz1tXSAmJgo+PiAgICAgKEFSQ0hfT01B
UDJQTFVTIHx8IEFSQ0hfS0VZU1RPTkUgfHwgQVJDSF9LMyB8fCBDT01QSUxFX1RFU1QgWz15XSkg
JiYKPj4gICAgIEhBU19JT01FTSBbPXldCj4+Cj4+IEFzIHRoZSBvZl9hZGRyZXNzX3RvX3Jlc291
cmNlKCkgaGVscGVyIGhhcyBhIGR1bW15IGltcGxlbWVudGF0aW9uCj4+IHJldHVybmluZyBhbiBl
cnJvciB3aGVuIE9GX0FERFJFU1MgaXMgbm90IHNlbGVjdGVkLCB3ZSBkbyBub3QgbmVlZCB0bwo+
PiBzZWxlY3QgT0ZfQUREUkVTUyBmcm9tIHRoZSBPTUFQX0dQTUMgS2NvbmZpZyBtZW51IGZvciBj
b21waWxlIHRlc3RpbmcKPj4gcHVycG9zZXMuIE5vciB3ZSBhY3R1YWxseSBkbyBmb3IgSzMgcGxh
dGZvcm1zLCBidXQgaW4gb3JkZXIgdG8gbm90IGJyZWFrCj4+IHRoZXNlIHBsYXRmb3JtcyB3ZSBj
YW4ganVzdCBzZWxlY3QgT0ZfQUREUkVTUyBmcm9tIEFSQ0hfSzMgZGlyZWN0bHkuCj4+Cj4+IEZp
eGVzOiBkYmNiMTI0YWNlYmQgKCJtdGQ6IHJhd25hbmQ6IG9tYXAyOiBTZWxlY3QgR1BNQyBkZXZp
Y2UgZHJpdmVyIGZvciBBUkNIX0szIikKPj4gUmVwb3J0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4+IFN1Z2dlc3RlZC1ieTogVXdlIEts
ZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPj4gU2lnbmVkLW9m
Zi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPj4gLS0tCj4+
ICBhcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zIHwgMSArCj4+ICBkcml2ZXJzL21lbW9yeS9L
Y29uZmlnICAgICAgIHwgMSAtCj4+ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L0tjb25maWcucGxhdGZv
cm1zIGIvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jtcwo+PiBpbmRleCA3ZDVkNTg4MDAxNzAu
LjFhMGQ0YjU3NWI5NSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02NC9LY29uZmlnLnBsYXRmb3Jt
cwo+PiArKysgYi9hcmNoL2FybTY0L0tjb25maWcucGxhdGZvcm1zCj4+IEBAIC0xMjMsNiArMTIz
LDcgQEAgY29uZmlnIEFSQ0hfSzMKPj4gIAlzZWxlY3QgVElfU0NJX0lOVFJfSVJRQ0hJUAo+PiAg
CXNlbGVjdCBUSV9TQ0lfSU5UQV9JUlFDSElQCj4+ICAJc2VsZWN0IFRJX0szX1NPQ0lORk8KPj4g
KwlzZWxlY3QgT0ZfQUREUkVTUwo+IAo+IEkgdW5kZXJzdGFuZCB0aGUgYnVpbGQgZmFpbHVyZSwg
YnV0LCBJIGRvbid0IHNlZSBhbnkgb3RoZXIgU29DIHNlbGVjdGluZwo+IE9GX0FERFJFU1MgYmVj
YXVzZSBhIGRyaXZlciBoYXMgYSBwcm9ibGVtPwo+IAo+IAo+PiAgCWhlbHAKPj4gIAkgIFRoaXMg
ZW5hYmxlcyBzdXBwb3J0IGZvciBUZXhhcyBJbnN0cnVtZW50cycgSzMgbXVsdGljb3JlIFNvQwo+
PiAgCSAgYXJjaGl0ZWN0dXJlLgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvS2NvbmZp
ZyBiL2RyaXZlcnMvbWVtb3J5L0tjb25maWcKPj4gaW5kZXggMzBiZmY2Y2IxYjhkLi4yNDFmMDky
NWNiZjEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbWVtb3J5L0tjb25maWcKPj4gKysrIGIvZHJp
dmVycy9tZW1vcnkvS2NvbmZpZwo+PiBAQCAtMTA0LDcgKzEwNCw2IEBAIGNvbmZpZyBUSV9FTUlG
Cj4+ICAKPj4gIGNvbmZpZyBPTUFQX0dQTUMKPj4gIAlib29sICJUZXhhcyBJbnN0cnVtZW50cyBP
TUFQIFNvQyBHUE1DIGRyaXZlciIgaWYgQ09NUElMRV9URVNUCj4+IC0JZGVwZW5kcyBvbiBPRl9B
RERSRVNTCj4gCj4gVGhvdWdodHMgUm9nZXI/CgpPTUFQX0dQTUMgaXMgbm90IHZpc2libGUgZW50
cnkgc28gc29tZW9uZSBoYXMgdG8gc2VsZWN0IGl0LgpXZSBmaXJzdCB0cmllZCBzZWxlY3Rpbmcg
aXQgaW4gQVJDSF9LMyBidXQgdGhhdCB3YXMgbm90IGFjY2VwdGVkIGZvciBmYWlyIHJlYXNvbi4K
VGhlbiB3ZSB0cmllZCB0byBzZWxlY3QgaXQgZnJvbSBNVERfTkFORF9PTUFQMiBhbmQgaXQgY2F1
c2VkIHRoZSBpc3N1ZSB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBmaXguCgpPbmx5IG90aGVyIG9w
dGlvbiBsZWZ0IGlzIHRvIG1ha2UgT01BUF9HUE1DIGEgdmlzaWJsZSBlbnRyeSBhbmQganVzdCBt
YXJrIE1URF9OQU5EX09NQVAyIHRvIGRlcGVuZCBvbiBpdD8KVGhlIHJlbGV2YW50IFNvQyBkZWZj
b25maWcgZmlsZXMgY2FuIGVuYWJsZSBPTUFQX0dQTUMgYW5kIE1URF9OQU5EX09NQVAyLgoKRG9l
cyB0aGlzIHNvdW5kIG9rPwoKPj4gIAlzZWxlY3QgR1BJT0xJQgo+PiAgCWhlbHAKPj4gIAkgIFRo
aXMgZHJpdmVyIGlzIGZvciB0aGUgR2VuZXJhbCBQdXJwb3NlIE1lbW9yeSBDb250cm9sbGVyIChH
UE1DKQo+PiAtLSAKPj4gMi4yNy4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCj4gCgpjaGVlcnMsCi1yb2dlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
