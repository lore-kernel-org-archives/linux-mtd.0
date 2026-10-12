Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443A7CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 20:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAl0KmKt/4NZFSxKyzIyuM0tNcLcZetUxYBMwXsiesQ=; b=pklqZgFEdqTPvT
	nDOJp2ZSohRfZJULgNw02egTl3aZSe6LgWEVjVKohmqoDfPN/GAPew9T415eecnPT02of3noYrudY
	pJvjv11HeEPqmtJSL8MFl7lYKDGQpPIaMqdQwYSQYeZ7jRshbbMesyVIpg5mR/WbrUFLyjYD3CprE
	3PhdJosFGQ5pFTHWnVEdrkyAEVqTeK75MwTA+jj0uPYYa/bnQRF4uamY8IkLPIS/c8K74wlQIeeKv
	FWR4m7Cjgg79XQCxGKGjy65gQa2kAoM3bNZry6QvrZITZouppCWnlzxX3L1aWJk54nSdbEnLRg//N
	NP1IanOxBaVXqSGiB+Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGN1p-0000000BVbb-0UJt;
	Mon, 12 Oct 2026 20:53:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGN1k-0000000BVbD-36mW
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 20:53:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 565C41A109E;
	Mon, 12 Oct 2026 20:53:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20E96601A6;
	Mon, 12 Oct 2026 20:53:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8162311D70BEA;
	Mon, 12 Oct 2026 22:53:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791838409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Yzsm7UcLWz95w7mf2csUHMiUJrt8gEY4jLejuhdiuAM=;
	b=TnqxEC8om1vFtcEub3V/hkQWm1SBJYORapt54lhZfyc8VpvxaKlWoT/AP5A82neKZGZrzA
	P/1iSrfE1Yf+O8OJOQUbtHcvABWj2WNUpKdVe3pBwUL1aP1XcFZlef17BmegzDl1yKfuvV
	yUKT+fDCcr1RV4nxqc6OzVFANsub2kAmba3+Av/8HezTYdNhjhnLGbCoc2KK1Fg35ywZZf
	wtpstfHAPYAtF4uYod7oKQIfRYfGP5eozhv1hQfSr0Pou/wWHDSvgMWqZ9d+/zSSwacz9S
	hrNaBr2GD2Wt4uc2m5jA+sndXOso0K0gEf7Ec+SNaYaOnJUli/zxWNHVjzfZIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  Richard Genoud <richard.genoud@bootlin.com>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
In-Reply-To: <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
	(James Hilliard's message of "Mon, 12 Oct 2026 13:17:23 -0600")
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
	<20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
	<8733ua23xs.fsf@bootlin.com>
	<CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
	<877bjmzqkr.fsf@bootlin.com>
	<CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 12 Oct 2026 22:53:22 +0200
Message-ID: <87pkxey725.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_135344_944321_FD95195B 
X-CRM114-Status: GOOD (  15.96  )
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

Cj4+ID4+IGNvbW1pdCBsb2csIEkgbm93IGRpc2FncmVlIHdpdGggdGhlIGZpcnN0IHBhcnQgb2Y6
Cj4+ID4+Cj4+ID4+ID5UaGUgb2xkIGhhbmRsZXIgY2FuIGFsc28gY29tcGxldGUgdGhlIG5ldyB3
YWl0IG9yIHJlc3RvcmUgYW4gb2Jzb2xldGUgaW50ZXJydXB0IG1hc2suCj4+ID4+Cj4+ID4+ICJj
b21wbGV0ZSB0aGUgbmV3IHdhaXQiPyBJIGRvbid0IHNlZSBob3cgYSBzdGFsZSBoYW5kbGVyIGNv
bXBsZXRlcyB0aGUKPj4gPj4gbmV4dCB3YWl0IGdpdmVuIHRoZSBoYW5kbGVyIGlzIGEgaGFyZCBJ
UlEgYW5kIHRoZSBpbnRlcnJ1cHQgZW5hYmxlCj4+ID4+IHJlZ2lzdGVyIGlzIGNsZWFyZWQgb24g
dGltZW91dC4KPj4gPgo+PiA+IFRoZSBjYXNlIEkgaGFkIGluIG1pbmQgaXMgYW4gYWxyZWFkeS1y
dW5uaW5nIGhhbmRsZXIgb24gYW5vdGhlciBDUFU6Cj4+ID4KPj4gPiBDUFUgMDogUmVhZCBzdCBh
bmQgaWVuIGZvciBvcGVyYXRpb24gQS4KPj4gPiBDUFUgMTogVGltZSBvdXQgb3BlcmF0aW9uIEEs
IG1hc2svYWNrbm93bGVkZ2UgaXRzIGludGVycnVwdHMsCj4+ID4gICAgICAgIHRoZW4gZXZlbnR1
YWxseSByZWluaXRpYWxpemUgdGhlIGNvbXBsZXRpb24gZm9yIG9wZXJhdGlvbiBCLgo+PiA+IENQ
VSAwOiBDYWxsIGNvbXBsZXRlKCkgYmFzZWQgb24gdGhlIHNhdmVkIHN0IGFuZCBpZW4gZnJvbSBv
cGVyYXRpb24gQS4KPj4KPj4gRm9yIHRoaXMgdG8gZmlyZSwgdGhlIGhhcmQgSVJRIGhhbmRsZXIg
b24gQ1BVMCB3b3VsZCBoYXZlIHRvIGJlIHN0b3BwZWQKPj4gYmV0d2VlbiByZWFkaW5nIHN0L2ll
biBhbmQgY2FsbGluZyBjb21wbGV0ZSgpIGxvbmcgZW5vdWdoIHRvIHNwYW46Cj4+IC0gQSdzIHRp
bWVvdXQKPj4gLSBBJ3MgY2xlYW51cAo+PiAtIEIncyB3YWl0IGJlaW5nIHJlYXJtZWQKPj4gT24g
dGhpcyBoYXJkd2FyZSwgaG93IGlzIHRoaXMgcmVhY2hhYmxlPwo+Cj4gQ09ORklHX1BSRUVNUFRf
UlQgcHJvdmlkZXMgYSBjb25jcmV0ZSBtZWNoYW5pc20uIFRoZSBkcml2ZXIgcmVxdWVzdHMgdGhp
cwo+IElSUSB3aXRoIGZsYWdzID0gMCwgd2l0aG91dCBJUlFGX05PX1RIUkVBRCwgc28gdGhlIGhh
bmRsZXIgaXMKPiBmb3JjZWQtdGhyZWFkZWQuIEEgaGlnaGVyLXByaW9yaXR5IHRhc2sgY2FuIHBy
ZWVtcHQgdGhhdCBJUlEgdGhyZWFkCj4gYWZ0ZXIgaXQgcmVhZHMgc3QvaWVuOgoKVGhhdCBhcmd1
bWVudCBvbmx5IGFwcGVhcnMgaW4gdGhpcyByZXBseS4gSXQgaXMgbm90IGluIHRoZSBjb21taXQg
bG9nCm5vciBpbiB0aGUgZGlmZiwgYm90aCBvZiB3aGljaCByZWFzb24gYWJvdXQgYSBoYXJkIElS
USwgbm8/IEknbGwgaGFwcGlseQp0YWtlIHRoZSBQUkVFTVBUX1JUIGNhc2UgaW50byBhY2NvdW50
OiBpbiB0aGF0IGNvbmZpZ3VyYXRpb24gdGhlIGNhc2UgaXMKcmVhY2hhYmxlLCBidXQgaXQgcmVh
ZHMgYXMgYSBqdXN0aWZpY2F0aW9uIGFkZGVkIGFmdGVyIHRoZSBmYWN0LgoKVGhlbiwgSSdtIGN1
cmlvdXMgdG8ga25vdyBob3cgdGhlIEFJIGp1c3RpZmllcyB0aGUgdXNlIG9mIGRpc2FibGVfaXJx
KCkKYXMgdGhlIFJULWFwcHJvcHJpYXRlIGNob2ljZTogZG9lc24ndCBpdCBibG9jayB3aXRob3V0
IGEgdGltZW91dCBvbiB0aGUKdmVyeSBJUlEgdGhyZWFkIHRoZSBzY2VuYXJpbyByZWxpZXMgb24g
YmVpbmcgc3RhcnZlZCAoYW5kIGdpdmVzIG5vCnByaW9yaXR5IGluaGVyaXRhbmNlKT8KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
