Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32944D12696
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Dec 2025 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHQ/EtBbfqaO7c5nje2U9a4OTuKAKF6rsCGeebbwDbw=; b=Z8PcQg5flZAu4T
	bgOar1Ai5dDvLP8nDnwZHRupkwZVwnDu6cMZgD4kPvXuNB3MkX9W3rbjgsXYTsY+zIBOnkt/vUTG+
	/kyuNUr8AtmR6PWPgrOStAAiWDWMdl2eA8gPmt85EO5Kie+d155eVIQbqg+D6AEFIgLBNWgVGamzH
	+fSplSNYS98ANcYLLHcjHhM/2kwdCWKInCad0ve9/K+aASMgG8heZFp720GARQvkZJu9S1mC7qzcx
	0pmpUNaAATiI7JVoLJWXsHU9ZmZolKpnrMbqu2nKeFyWug+/Rvog3qFsNhHjMFdqMXBigWAItk6Ay
	2qWNlQiHyxTq9Imq/8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjVG-00000006PdU-2l2s;
	Wed, 03 Dec 2025 09:50:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjV8-00000006PbR-0Oqi
	for linux-mtd@lists.infradead.org;
	Wed, 03 Dec 2025 09:50:29 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 61BCC1A1EEB;
	Wed,  3 Dec 2025 09:50:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3637B60706;
	Wed,  3 Dec 2025 09:50:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 411F411920314;
	Wed,  3 Dec 2025 10:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764755418; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bwV59Poqvr4TETkpzfKMM8Wo2Gkh86LU/Q3T3dW528g=;
	b=d89o6SPV3H8UwGn6tgVBA2/mYk+pxDiQAuMzVnhJM36IBfoxayPN3cWwAbKYoiXDBLzgGs
	6YFdxEIuw0wWd+bdS6rbXC3DDWSTGWvsMX5LbNUWN3BHtvYlgltchwOoaIifHyJEMD9zEU
	34CxwQXoPwOLh1c59fEdszpQB/rFWdiaIAvglgrGWeMm+Lb+AWF9tsGaLXDuxJ70qBEq0B
	2vFBpgbUhVoX2J8xuayyuhU5NKydMAmSrvsahoBAlvbITuXBgsAQZAOg5Rp0x8QeD7dp9Y
	3q5pKQaPhX0kepssvyQBErbERYG+HixhosZNBonmXOgcg3N22rEc0pxg5QJLfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <broonie@kernel.org>,  <tudor.ambarus@linaro.org>,  <p-mantena@ti.com>,
  <linux-spi@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <a-dutta@ti.com>,  <u-kumar1@ti.com>,
  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <DEOH4AUI33SQ.DGKJ4W258658@kernel.org> (Michael Walle's message
	of "Wed, 03 Dec 2025 10:28:23 +0100")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
	<cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com>
	<mafs0ikf74fja.fsf@kernel.org>
	<fe103265-7a68-41b8-b168-15a5e19abb3f@ti.com>
	<DEOH4AUI33SQ.DGKJ4W258658@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 03 Dec 2025 10:50:12 +0100
Message-ID: <87jyz3ao8b.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_015022_263706_0EEF6971 
X-CRM114-Status: GOOD (  20.83  )
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

Cj4+PiBJIHRoaW5rIHdlIHNob3VsZCBzdGFydCB3aXRoIHRoZSByZXF1aXJlbWVudCB0byBoYXZl
IHRoZSBwYXR0ZXJuIGZsYXNoZWQKPj4+IGFscmVhZHkgYW5kIGZpZ3VyZSBvdXQgaG93IFNQSSBO
T1Igb3IgU1BJIE5BTkQgY2FuIGRpc2NvdmVyIHRoYXQKPj4+IChwZXJoYXBzIHZpYSBOVk1FTT8p
Lgo+Cj4gQnV0IHdlIHNob3VsZCBhbHNvIGtlZXAgaW4gbWluZCB0aGF0IGNlcnRhaW4gZmxhc2hl
cyBtaWdodCByZXR1cm4KPiB0dW5pbmcgZGF0YSBkdXJpbmcgdGhlIGR1bW15IGN5Y2xlcy4gSS5l
LiB0aGUgUEhZIG1pZ2h0IHByb2JhYmx5IGJlCj4gdHVuZWQgb24gZWFjaCByZWFkIGFuZCB0aGVy
ZSBpcyBubyBuZWVkIGZvciBhbnkgcHJlLXByb2dyYW1tZWQKPiBwYXR0ZXJuLgo+Cj4gSSdtIG5v
dCBzYXlpbmcgaXQgc2hvdWxkIGJlIGltcGxlbWVudGVkLCBidXQgdGhlIGN1cnJlbnQKPiBpbXBs
ZW1lbnRhdGlvbiBzaG91bGQgYmUgdGhhdCBmbGV4aWJsZSB0aGF0IGl0IHdpbGwgYmUgZWFzeSB0
byBhZGQKPiB0aGF0IGxhdGVyLgoKQ29uY2VwdHVhbGx5LCB5ZXMsIGJ1dCBpbiBwcmFjdGljZSwg
SSBrbm93IG5vIGNvbnRyb2xsZXIgY2FwYWJsZSBvZgp1c2luZyBqdXN0IGEgZmV3IGN5Y2xlcyBl
dmVyeSB0cmFuc2ZlciB0byBjYWxpYnJhdGUgdGhlbXNlbHZlcwphdXRvbWF0aWNhbGx5IGFuZCBy
ZWFjaGluZyBzdWNoIGFuIG9wdGltaXplZCBzcGVlZCBzdGF0ZSBhcyB0aGUgY2FkZW5jZQpjb250
cm9sbGVyIGlzIGNhcGFibGUgb2YgQVRNLgoKRGVzcGl0ZSB0aGUgZW5kIHJlc3VsdCBiZWluZyBj
bG9zZSwgSSB3b3VsZCBzdGlsbCBjb25zaWRlciB0aGlzIG90aGVyCndheSB0byBvcHRpbWl6ZSB0
aGUgSS9PcyBzb21ld2hhdCBvcnRob2dvbmFsLiBJZiBzb21lb25lIGhhcyBzb21lCmtub3dsZWRn
ZSB0byBzaGFyZSBhYm91dCB0aGUgdHJhaW5pbmcgcGF0dGVybnMgc2VudCBkdXJpbmcgdGhlIGR1
bW15CmN5Y2xlcywgSSBhbSBhbGwgZWFycyB0aG91Z2guCgo+PiBGb3IgU1BJIE5PUiwgd2UgZG8g
bm90IGhhdmUgYW4gZXF1aXZhbGVudCAid3JpdGUtdG8tY2FjaGUiIHBvc3NpYmxlLCBzbwo+PiB3
ZSBzdGlsbCByZXF1aXJlIGEgcHJlLWZsYXNoZWQgcGF0dGVybiByZWdpb24uIEF0IHRoZSBtb21l
bnQgdGhpcyBpcwo+PiBwcm92aWRlZCB2aWEgYSBkZWRpY2F0ZWQgInBoeXBhdHRlcm4iIHBhcnRp
dGlvbiwgYW5kIGl0cyBvZmZzZXQgaXMKPj4gb2J0YWluZWQgdGhyb3VnaCB0aGUgb2ZfZ2V0Xyog
QVBJcy4KPj4KPj4gUmVnYXJkaW5nIHdheXMgdG8gbG9jYXRlIHRoZSBwYXJ0aXRpb246Cj4+Cj4+
IDEuIFVzaW5nIE5WTUVNOgo+PiAgICAgYS4gRXhwb3NpbmcgdGhlIHBoeXBhdHRlcm4gcGFydGl0
aW9uIGFzIGFuIE5WTUVNIGNlbGwgYW5kIGlzc3VpbmcgYW4KPj4gICAgICAgIE5WTUVNIHJlYWQg
ZHVyaW5nIHR1bmluZyBkb2VzIG5vdCB3b3JrIHJlbGlhYmx5LCBiZWNhdXNlIE5WTUVNCj4+ICAg
ICAgICBlbmRzIHVwIGNhbGxpbmcgaW50byB0aGUgTVREIHJlYWQgcGF0aCBhbmQgd2UgY2Fubm90
IGNvbnRyb2wgd2hpY2gKPj4gICAgICAgIHJlYWRfb3AgdmFyaWFudCBpcyB1c2VkIGZvciB0aGUg
cmVhZC4KPj4KPj4gICAgIGIuIEFkdmVydGlzaW5nIHRoZSBwYXJ0aXRpb24gYXMgYW4gTlZNRU0g
Y2VsbCBhbmQgdXNpbmcgTlZNRU0gb25seQo+PiAgICAgICAgdG8gZmV0Y2ggdGhlIG9mZnNldCBp
cyBub3QgcG9zc2libGUgZWl0aGVyLiBOVk1FTSBhYnN0cmFjdHMgdGhlCj4+ICAgICAgICBwcml2
YXRlIGRhdGEsIGluY2x1ZGluZyBwYXJ0aXRpb24gb2Zmc2V0cywgc28gd2UgY2FuJ3QgcmV0cmll
dmUKPj4gICAgICAgIHRoZSBvZmZzZXQgYXMgd2VsbC4KPgo+IFlvdSBjYW4gcHJvYmFibHkgZXh0
ZW5kIHRoZSBOVk1FTSBBUEkgaW4gc29tZSB3YXkgLSBvciBzd2l0Y2hpbmcgdGhlCj4gcmVhZF9v
cCBvbiB0aGUgZmx5Lgo+Cj4+IDIuIFVzaW5nIG9mX2dldF8qIEFQSXM6Cj4+ICAgICAgICBVc2lu
ZyB0aGUgc3RhbmRhcmQgT0YgaGVscGVycyB0byBsb2NhdGUgdGhlIHBoeXBhdHRlcm4gcGFydGl0
aW9uCj4+ICAgICAgICBhbmQgcmV0cmlldmUgaXRzIG9mZnNldCBpcyBib3RoIHJlbGlhYmxlIGFu
ZCBzdHJhaWdoZm9yd2FyZCwgYW5kCj4+ICAgICAgICBpcyB0aGUgYXBwcm9hY2ggY3VycmVudGx5
IGltcGxlbWVudGVkIGluIHYyLgo+Cj4gSSBkb24ndCBsaWtlIHRoYXQgaGFyZGNvZGVkIHBhcnRp
dGlvbiBuYW1lIHdoaWNoIGlzIGJhc2ljYWxseQo+IGJlY29taW5nIGFuIEFCSSB0aGVuLgo+Cj4g
QXQgbGVhc3Qgd2UnZCBuZWVkIHNvbWUga2luZCBvZiBwaGFuZGxlIHRvIHRoZSBwYXJ0aXRpb24g
aW5zaWRlIHRoZQo+IGNvbnRyb2xsZXIgbm9kZSAoYW5kIGdldCB0aGUgQUNLIGZyb20gdGhlIERU
IG1haW50YWluZXJzKS4KClllcywgYWdyZWVkLCB0aGlzIGlzIGNvbnRyb2xsZXIgc3BlY2lmaWMs
IGlmIHdlIG5lZWQgdG8gdXNlIGFuIG9mXyBBUEkKKHdoaWNoIGlzIHN0aWxsIG5vdCBuZWVkZWQg
Zm9yIFNQSSBOQU5Ecywgb25seSBmb3IgdHVuaW5nIHRoZSByZWFkIFNQSQpOT1IgcGF0aCksIGl0
IHNob3VsZCBub3QganVzdCBiZSBhIHBhcnRpdGlvbiBoYXJkY29kZWQgbmFtZSBidXQgYQpwaGFu
ZGxlIGluIHRoZSBjb250cm9sbGVyIG5vZGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
