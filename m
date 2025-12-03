Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872A3D1266D
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Dec 2025 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yX2e88jhUMEsbfSbkqoklkA0YA79BXgCnXsItrBKvbs=; b=bIIEg2hwfxzjzq
	Nz1qIRo290r7IMF3kcBa3G8Yr12018B8K97UanL8wDgdzxFnuUtL13fXuDTIbChPbB923UKcJpcHq
	7Md5KaYS3cWgPmz+EKJPmWWC5zOtflpyZ2Rwa6cC1FrBRIoBF6z7YBEegjW87KR41ZQyXYyuU/5qY
	okIEzdEBHXgHAEibR8k7uS/zV1G/IpFPyg/ngw3FdWIu6VN5kOboZlUSsEl+ytbff9WUl5FvifXoW
	hVtIVIWmZKCu7+sNsMfiGGoXIV6UNe7w8+oiVSC17lcGOrBmpCkOgLCip1vT8QKorzOpiwlFBs8ca
	bR3tT/2BqIjCl4aUCmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQih9-00000006L0a-07Na;
	Wed, 03 Dec 2025 08:58:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQih5-00000006L0B-1kU2
	for linux-mtd@lists.infradead.org;
	Wed, 03 Dec 2025 08:58:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 952C31A1EEE;
	Wed,  3 Dec 2025 08:58:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69E8560706;
	Wed,  3 Dec 2025 08:58:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8B6CD11920028;
	Wed,  3 Dec 2025 09:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764752314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=46tD3zsoJ4hX5zvhzFuvsgVMFq9fE/0WHdvp1aoe7Eg=;
	b=Sel8Ga0jVQVhgT3EqCe5q36TTTI9aH9UaDfHKXlQy1W1weC3Zd7H0qELeXsqyUmXnSTcgI
	K1KFD1E9seeGqoK8vkMFQoXUk69HU45ufqDaC7QmCjJzrmAzxFj9A5YR8r+O40l0Ot57n/
	sEcoGcye5gnzetrs/7W+WhjiKOdTat0nCe1dyGhZO5v1bAGBSssZY92gCiTzHicxIIrMPS
	HvhG7pNrc1gshBrpk7vM4my8KlPLl/os+GNABX1ozthdEbv19qjaEM1WXl694K60oARiLa
	yWo7FjeWXQL8IQmIOGAfmaWhdVSt9dC/yNCaMRV6KHMQcWketmSAn2InwjDi0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <broonie@kernel.org>,  <tudor.ambarus@linaro.org>,
  <mwalle@kernel.org>,  <p-mantena@ti.com>,  <linux-spi@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <a-dutta@ti.com>,  <u-kumar1@ti.com>,  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <cf87ced7-aa66-4b15-98e5-92cb76737073@ti.com> (Santhosh Kumar
	K.'s message of "Wed, 3 Dec 2025 13:32:16 +0530")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
	<cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com>
	<87qzunt4n4.fsf@bootlin.com>
	<ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com>
	<87ecqcakjo.fsf@bootlin.com> <mafs0ms4j4fuz.fsf@kernel.org>
	<cf87ced7-aa66-4b15-98e5-92cb76737073@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 03 Dec 2025 09:58:28 +0100
Message-ID: <87v7io9c23.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_005839_939627_875B94F6 
X-CRM114-Status: GOOD (  15.01  )
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

PiBKdXN0IHRvIHN1bW1hcml6ZSwgZmFsbGJhY2sgbG9naWMgZHVyaW5nIHByb2JlOgo+ICAgIC0g
SWYgdGhlIGNvbnRyb2xsZXIgcmVwb3J0cyBhIHR1bmluZyBmYWlsdXJlLCB0aGUgc3BpLW1lbSBj
bGllbnQgbWF5Cj4gZWl0aGVyIHJldHJ5IHR1bmluZyB3aXRoIHRoZSBuZXh0LWJlc3QgKG1heC0x
KSBvcGVyYXRpb24KClRoZXJlIGlzIG5vIHN1Y2ggIm5leHQtYmVzdCIgdmFyaWFudCBvbmNlIGlu
IE9ERFIgbW9kZSB1bmZvcnR1bmF0ZWx5LiBXZQp3aWxsIGhhdmUgdG8gcmV0dXJuIGFuIGVycm9y
IGluZGljYXRpbmcgdGhhdCBQSFkgY2FsaWJyYXRpb24gbmVlZHMgdG8KaGFwcGVuIGFnYWluIGFu
ZCBqdXN0IHJldHJ5IHdpdGhvdXQgaXQuCgpBcyB0byB3aGVuL2lmIHdlIHNoYWxsIHBlcmZvcm0g
aXQgYWdhaW4sIHRoaXMgaXMgYSBkZWxpY2F0ZSB0b3BpYy4gQmVpbmcKY29uc2VydmF0aXZlIG1p
Z2h0IGltcGx5IGp1c3QgZGlzYWJsaW5nIHRoZSBmZWF0dXJlIGFuZCBubyBsb25nZXIgdXNpbmcK
aXQgZnJvbSBhIFNQSSBjb250cm9sbGVyIHBlcnNwZWN0aXZlIHVudGlsIFNQSSBOQU5EL05PUiBj
YWxscyBmb3IKY2FsaWJyYXRpb24gYWdhaW4sIGJ1dCBpdCBpcyB1bmNsZWFyIHRvIG1lIHdoZW4g
dGhpcyBzaG91bGQKaGFwcGVuLiBNYXliZSB3ZSBjb3VsZCB0cmlnZ2VyIGEgYmFja2dyb3VuZCBq
b2Igd2l0aCBhIGxvdyBwcmlvcml0eSBmb3IKdGhhdC4gQnV0IGRvbid0IGJvdGhlciBpbXBsZW1l
bnRpbmcgdGhpcyBpbiB0aGUgZmlyc3QgcGxhY2UuIEp1c3QgbWFrZQppdCB3b3JrLCBtYWtlIGl0
IGZpdCBpbiB0aGUgY3VycmVudCBzdWJzeXN0ZW1zLCBqdXN0IEtJU1MuIFdlIGNhbiBmaWd1cmUK
dGhpcyBvdXQgaW4gYSBzZWNvbmQgdGltZSwgZXNwZWNpYWxseSBzaW5jZSBmYWlsdXJlcyBhcmUg
bm90IHN1cHBvc2VkIHRvCmhhcHBlbiB2ZXJ5IG9mdGVuLgoKPiBvciBmYWxsYmFjayB0bwo+IHRo
ZSBub24tUEhZLCBzbG93ZXIgb3BlcmF0aW9uIGFuZCBhZGp1c3QgdGhlIGR1bW15IGN5Y2xlcyBh
Y2NvcmRpbmdseSB0bwo+IHVzZSB0aGUgb3B0aW1hbCBub24tUEhZIHZhcmlhbnQuCgpXaHkgYWRq
dXN0aW5nIHRoZSBkdW1teSBjeWNsZXM/IEkgYW0gbm90IGF3YXJlIG9mIGEgZGlmZmVyZW50IG51
bWJlciBvZgpjeWNsZXMgd2l0aCBhbmQgd2l0aG91dCBQSFkgbW9kZS4gSXQgc2hvdWxkIGJlIGlk
ZW50aWNhbCwgbm8/IFRoZQpkaWZmZXJlbmNlIGxheXMgaW4gdGhlIGZyZXF1ZW5jeSB3ZSB1c2Us
IG5vdCB0aGUgZmFjdCB0aGF0IFBIWSBpcwphY3RpdmUuIEFuZCBvbmNlIHdlJ3ZlIGRlY2lkZWQg
YSBjb25maWd1cmF0aW9uLCB3ZSBjYW4gYWx3YXlzIGhhbmRsZQpzbG93ZXIgZnJlcXVlbmNpZXMs
IGF0IHRoZSBjb3N0IG9mIGEgZmV3IDEwMGtpQi9zIG1heWJlLiBTbyBJIHdvdWxkIG5vdApzZWUg
dGhpcyBhcyBhIGNvbmNlcm4uCgo+IEFuZCB5ZXMsIGZvciBub3cgdGhlIHByaW9yaXR5IGlzIHRv
IGhhdmUgYSByb2J1c3QgcHJvYmUtdGltZSB0dW5pbmcgZmxvdwo+IGJlZm9yZSBhZGRyZXNzaW5n
IGFueSBydW50aW1lIHR1bmluZyBjb25jZXJucy4KClllcy4KCj4+PiBCdXQgb25jZSB3ZSBzb2x2
ZSB0aGlzLCBjb21lcyBhIHNpbWlsYXIgcHJvYmxlbSBvbiB0aGUgd3JpdGUgc2lkZS4gSG93Cj4+
PiBkbyB3ZSBrbm93IGlmIGEgd3JpdGUgd2lsbCBvciBkaWQgZmFpbCBiZWNhdXNlIG9mIGEgdGVt
cGVyYXR1cmUgY2hhbmdlPwo+Pj4gV2hhdCBtYXkgYmUgdGhlIGhldXJpc3RpY3MgdG8gZmFsbGJh
Y2sgaW4gdGhpcyBjYXNlPwo+PiBTYW50aG9zaCwgZG8geW91IGhhdmUgYW55IG51bWJlcnMgb24g
d3JpdGUgcGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzPyBJCj4+IGFtIGN1cmlvdXMgaWYgaXQgaXMg
ZXZlbiB3b3J0aCB0aGUgZWZmb3J0Lgo+Cj4gVGhlcmUncyBubyByZWFsIHBlcmZvcm1hbmNlIGdh
aW4gZm9yIFNQSSBOT1IsIGJ1dCBTUEkgTkFORCBzaG93cyBub3RhYmxlCj4gaW1wcm92ZW1lbnQg
d3J0LiBwYWdlIHNpemUuCj4KPiBXcml0ZSBwZXJmb3JtYW5jZSBudW1iZXJzIGZyb20gQU02MkEg
U0sgd2l0aCBXMzVOMDFKVyBPU1BJIE5BTkQ6Cj4KPiAgICAtIHdpdGhvdXQgUEhZOiA2IE1CL3MK
PiAgICAtIHdpdGggUEhZOiA5LjIgTUIvcwoKRWFnZXIgdG8gc2VlIHRoaXMgaW4gU1BJIE5BTkQg
KG9ubHkpIHRoZW4hCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
