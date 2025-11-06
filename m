Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C12CCF9F8
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 16:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3X4bQVmi7GFi270P7n/5ceL/GsK0EHU7wAoFzkwD6w0=; b=0QvFrLna+a57Bs
	vFQMCGsiBpkpf502KEVyon8CguUKZVIguzRcnBay08S6iOjNVOfL6DEM3ivBuxlTHSwSayCPVIJxs
	hHOdllAREQse2T+LPOdGK9Be5/LpMl6wNJWDltKDnin7qOkVc1TWstWknkorfARZncbWLHUyYsi4/
	L5eRwwcRprjoo9Av5qh+eS2UsljKiTDGB1nkqY3xuMcZoP9NmzbQNHXio+eeOjvSsfGfcdfApq7/j
	Hl/DDesqWE54tHBjFTTPcM4t3ivBn22qWT44YucreOp+SLCB3/iNephc7gf3TgQoBP+L03pgzQ75Y
	EQQCgL25XR0RnGe3GmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2PA-0000000FrHy-20EA;
	Thu, 06 Nov 2025 16:00:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2P3-0000000FrDE-3oif
	for linux-mtd@lists.infradead.org;
	Thu, 06 Nov 2025 16:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55D1D43D2E;
	Thu,  6 Nov 2025 15:59:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64129C116B1;
	Thu,  6 Nov 2025 15:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762444799;
	bh=kMevgBC3784Ru3EW9QJAXWDvODDi8xcAADr0sE14jHI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FQYtabMxQzNGwYpM1TktPaQ1EAJDPPduPQ2aWZqE/uG8noq7yWaBvbyTV2QIiDySb
	 jmOgs9AOzFCBVLnzpMS8E0OaNRDRY7pj8Ju4kNh0wcmvWmhH3lyGpS3jvMgzgICo4N
	 rzMuaWseYumZ+dMId44VqDVFGidHBM85erlClvmHC4kGSt5tY300GOzhKzzeqoKZDo
	 91ie2XrHhy+OHzWl8ImmccbeCDu+Z1FFArrN3r9iOFkh8OmGRzr0ImYHEn2GKeYK9U
	 z95X92OQw+Ujq2FATT+HOAR9qkHVlHnuxSAc3RLJN+7zI35PHHYIdnkldqLfxU37y2
	 w0zVc/JsJT8ZQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH 0/6] Hello,
In-Reply-To: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
 (Miquel
	Raynal's message of "Wed, 05 Nov 2025 18:26:59 +0100")
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
Date: Thu, 06 Nov 2025 16:59:56 +0100
Message-ID: <mafs0h5v7b18j.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_080002_042912_CA2E6FFD 
X-CRM114-Status: GOOD (  15.59  )
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

T24gV2VkLCBOb3YgMDUgMjAyNSwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4gSGVyZSBpcyBhIHNl
cmllcyBhZGRpbmcgc3VwcG9ydCBmb3IgNiBXaW5ib25kIFNQSSBOT1IgY2hpcHMuIERlc2NyaWJp
bmcKPiB0aGVzZSBjaGlwcyBpcyBuZWVkZWQgb3RoZXJ3aXNlIHRoZSBibG9jayBwcm90ZWN0aW9u
IGZlYXR1cmUgaXMgbm90Cj4gYXZhaWxhYmxlLiBFdmVyeXRoaW5nIGVsc2UgbG9va3MgZmluZSBv
dGhlcndpc2UuCj4KPiBJbiBwcmFjdGljZSBJIGFtIG9ubHkgYWRkaW5nIDYgdmVyeSBzaW1pbGFy
IElEcyBidXQgSSBzcGxpdCB0aGUgY29tbWl0cwo+IGJlY2F1c2UgdGhlIGFtb3VudCBvZiBtZXRh
IGRhdGEgdG8gc2hvdyBwcm9vZiB0aGF0IGFsbCB0aGUgY2hpcHMgaGF2ZQo+IGJlZW4gdGVzdGVk
IGFuZCB3b3JrIGlzIHByZXR0eSBiaWcuCj4KPiBBcyB0aGUgY29tbWl0cyBzaW1wbHkgYWRkIGFu
IElELCBJIGFtIENjJ2luZyBzdGFibGUgd2l0aCB0aGUgaG9wZSB0bwo+IGdldCB0aGVzZSBiYWNr
cG9ydGVkIHRvIExUUyBrZXJuZWxzIGFzIGFsbG93ZWQgYnkgdGhlIHN0YWJsZSBydWxlcyAoc2Vl
Cj4gbGluayBiZWxvdywgYnV0IEkgaG9wZSBJIGFtIGRvaW5nIHRoaXMgcmlnaHQpLgo+Cj4gTGlu
azogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuMTcuNy9zb3VyY2UvRG9jdW1l
bnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1rZXJuZWwtcnVsZXMucnN0I0wxNQo+Cj4gVGhhbmtzLAo+
IE1pcXXDqGwKPgo+IC0tLQo+IE1pcXVlbCBSYXluYWwgKDYpOgo+ICAgICAgIG10ZDogc3BpLW5v
cjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNVEwMU5XeHhJUSBjaGlwcwo+ICAgICAgIG10
ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNVEwMU5XeHhJTSBjaGlwcwo+
ICAgICAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcyNVEwMk5XeHhJ
TSBjaGlwcwo+ICAgICAgIG10ZDogc3BpLW5vcjogd2luYm9uZDogQWRkIHN1cHBvcnQgZm9yIFcy
NUg1MTJOV3h4QU0gY2hpcHMKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6IEFkZCBzdXBw
b3J0IGZvciBXMjVIMDFOV3h4QU0gY2hpcHMKPiAgICAgICBtdGQ6IHNwaS1ub3I6IHdpbmJvbmQ6
IEFkZCBzdXBwb3J0IGZvciBXMjVIMDJOV3h4QU0gY2hpcHMKPgo+ICBkcml2ZXJzL210ZC9zcGkt
bm9yL3dpbmJvbmQuYyB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+IC0tLQo+IGJhc2UtY29tbWl0OiA0NzliYTdmYzcwNDkz
NmI3NGE5MWVlMzUyZmUxMTNkNjM5MWQ1NjJmCj4gY2hhbmdlLWlkOiAyMDI1MTEwNS13aW5ib25k
LXY2LTE4LXJjMS1zcGktbm9yLTdmNzhjYjI3ODVkNgo+Cj4gQmVzdCByZWdhcmRzLAoKQXBwbGll
ZCB0byBzcGktbm9yL25leHQuIFRoYW5rcyEKCi0tIApSZWdhcmRzLApQcmF0eXVzaCBZYWRhdgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
