Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDB6C88E4A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 10:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oVnl5kr/brMw3OyDxNL5QZIVVQfrwje9k0YEU9VM3w=; b=e4YIx8wgtrTYHG
	QDrPqDIWKv1bmWeelKWEvGbSZ93Iw1M+CcANLvxpEOgtciKzih7dRbKIeF10ZhZ6egBL6d1c3s4aY
	eqXxBhxzrJOaPmaekHDMKckcV6AfFVMKu5yNo4Yew15rPNlDpGR7moY4Gb/CoLNJ8aX98BdLP9wKy
	QetRIQQ5HHf4C07AOLAK0wTU62SGVITPC35B6tmmI8XF5CobtKjWabB1jXcev4nCfMOGAYmTMgdcP
	T54J7FAx1KvTfhtEF7qNG02ovPpre/9JBgvTuJwY4aOmCApNkBrSsT7pJJanVLsXkSw6x1Y4hopD3
	nqXVEhxyz2a+wRGWRp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yjY-0000000GPlh-0q85;
	Fri, 11 Sep 2026 10:43:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yjU-0000000GPkr-0RJN
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 10:43:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E0120C653FA;
	Fri, 11 Sep 2026 10:44:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2963D601DE;
	Fri, 11 Sep 2026 10:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCFD511C7AF8E;
	Fri, 11 Sep 2026 12:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789123424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=boUfY/RM5+3Ru1aDcdiU0te7jtZsjz+i4xhWWiIY8F8=;
	b=xo/1BQbIyCrbhI5Juu969ZJ9jEcCF95ynlFlyD/RmC7bVFVnAMAmbI9S1FW1fWclidOwkB
	r+1Fk/lxSpCcuvOT5zqg/Lz1Y3rMML5lsOz8kKvVMiMHtvz5WWO3sHtYxBdy/5eJXPv7hM
	Mhabcu/ktw7t2gN9Fel7K0hiOTpWu1d9O0JNjwVqTwvqO41BZcq/AXtqM95ZiFuSa+HNFw
	Ar2BYxWGe6X8AF7Rq+iXvvsUBVi8tvw+rHJdkA56Wd6d1Hy+zYkMk6G+jE7xLfr8Wbgo8a
	bXrS6dK5RzGRJeVkRr3xcKq0HHXWB0ay1Kszplsk6OFilAPGLWAWuFHfvR7rlw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Jon Hunter" <jonathanh@nvidia.com>,
  "Steam Lin" <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
In-Reply-To: <DLCEE908FEIF.380PG73T1SQXV@kernel.org> (Michael Walle's message
	of "Fri, 11 Sep 2026 12:00:08 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
	<DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com>
	<87ik4cqgha.fsf@bootlin.com> <DLCEE908FEIF.380PG73T1SQXV@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 12:43:42 +0200
Message-ID: <87cxukqd9d.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_034348_308531_AA237FB5 
X-CRM114-Status: GOOD (  22.60  )
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

T24gMTEvMDkvMjAyNiBhdCAxMjowMDowOCArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBGcmkgU2VwIDExLCAyMDI2IGF0IDExOjM0IEFNIENFU1Qs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDExLzA5LzIwMjYgYXQgMTE6MTk6MzkgKzAyLCBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPj4KPj4+Pj4g
LQlyZXQgPSBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjIobm9yLCBzcik7Cj4+Pj4+ICsJaWYgKHFl
X21hc2tbMF0pCj4+Pj4+ICsJCXJldCA9IHNwaV9ub3JfcmVhZF9zcjEobm9yLCBzcik7Cj4+Pj4+
ICsJZWxzZQo+Pj4+PiArCQlyZXQgPSBzcGlfbm9yX3JlYWRfc3IxX2FuZF9zcjIobm9yLCBzcik7
Cj4+Pj4KPj4+PiBTaG91bGRuJ3QgdGhhdCBiZSB0aGUgb3RoZXIgd2F5IGFyb3VuZD8KPj4+Pgo+
Pj4+ICsJaWYgKHFlX21hc2tbMV0pCj4+Pj4gKwkJcmV0ID0gc3BpX25vcl9yZWFkX3NyMV9hbmRf
c3IyKG5vciwgc3IpOwo+Pj4+ICsJZWxzZQo+Pj4+ICsJCXJldCA9IHNwaV9ub3JfcmVhZF9zcjEo
bm9yLCBzcik7Cj4+Pj4KPj4+PiBJIGtub3cgcWVfbWFzayB3b24ndCBiZSBzcHJlYWQgYWNyb3Nz
IHR3byBTUnMuIEp1c3QgdG8gYmUKPj4+PiBjb3JyZWN0IGFuZCBtYWtlIGl0IGVhc2llciB0byBn
cm9rLgo+Pj4KPj4+IFdoeSBpcyB0aGUgc2Vjb25kIHZlcnNpb24gZWFzaWVyIHRvIHBhcnNlPyBG
aXJzdCB2ZXJzaW9uIGlzIG1heWJlIG1vcmUKPj4+IGZ1dHVyZSBwcm9vZiBzaW5jZSB3ZSBhcmUg
dHJlYXRpbmcgYSBzcGVjaWZpYyBjYXNlLiBCZWNhdXNlIGVpdGhlciBpdCBpcwo+Pj4gYSBzcGVj
aWZpYyBjaGlwIChNeGljKSBvciB3ZSBlbmQgdXAgaW4gdGhlIG1vcmUgY29tbW9uIGNhc2UuIFRo
ZXJlIGlzCj4+PiBvbmx5IG9uZSBRRVIgZW50cnkgZm9yIHFlX21hc2tbMF0sIG1hbnkgZm9yIHFl
X21hc2tbMV0sIGFuZCBjaGFuY2VzIGFyZQo+Pj4gdGhhdCBpbiB0aGUgZnV0dXJlIHdlIHdpbGwg
bW9zdGx5IHNlZSBuZXcgY2hpcHMgb25seSB1c2luZyBhIHFlX21hc2tbMV0KPj4+IG1hc2suIFNv
IGhhdmluZyB0aGlzIGluIHRoZSBlbHNlIGRvZXNuJ3Qgc291bmQgc28gc3RyYW5nZSB0byBtZT8g
SSBhbHNvCj4+PiBkb24ndCB0aGluayB3ZSB3aWxsIGV2ZXIgc2VlIG1hc2tzIHNwYW5uaW5nIHRo
ZSB0d28gcmVnaXN0ZXJzLgo+Pgo+PiBUaGUgcHJvYmxlbSBzdGlsbCBwZXJzaXN0cyBiZWNhdXNl
IHRoZXJlIGlzIHRoZSBjaGVjayB3aGljaCBhbHNvIGZhaWxzCj4+IHJlYWRpbmcgU1IyLgo+Cj4g
SSBkb24ndCBnZXQgaXQuIFdoeSB3b3VsZCB5b3UgcmVhZCBTUjIgaWYgYml0NiBpcyBzZXQgaW4g
cWVfbWFza1swXT8KPiBPciBkbyB5b3UgbWVhbiBpbiB0aGUgc3BpX25vcl93cml0ZV9zcjFfYW5k
X3NyMl9hbmRfY2hlY2soKS4gWWVhaAo+IHRoYXQgc2hvdWxkIGFsc28gcHJvYmFibHkgb25seSB3
cml0ZSBTUjEgaWYgcWVfbWFza1sxXSA9PSAwLCBubz8KClllcywgcHJvYmFibHkuIE15IHByb2Js
ZW0gaXMgdGhhdCBJIGluaXRpYWxseSB0aG91Z2h0IHRoZSBiaWcKcmVmYWN0b3JpbmcgaW4gYSB3
YXkgdGhhdCB3b3VsZCBtYWtlIHRoZSB1c2VycyBvZiB0aG9zZSBoZWxwZXJzIG5vCmxvbmdlciBh
d2FyZSBvZiB0aGUgc3VidGxldGllcy4gQnV0IHNpbmNlIHlvdSBpbnNpc3RlZCBvbiBtb3Zpbmcg
c29tZQpwYXJ0cyB0byBzd3AuYywgaXQgYnJva2UgbXkgYXNzdW1wdGlvbnMgYW5kIGFsc28gdGhl
IGtlcm5lbCBkb2MgY29tbWVudHMKd2hpY2ggYXJlIG5vIGxvbmdlciByZWxldmFudC4gQW5kIG5v
dyB3ZSBhcmUgYmFjayB0byB0aGUgaW5pdGlhbApzaXR1YXRpb24sIHdoZXJlIGF3YXJlbmVzcyBp
cyBuZWVkZWQgZnJvbSB0aGUgY2FsbGVycyBhbmQgdGhlIEFQSSBpcyBubwpsb25nZXIgYmFsYW5j
ZWQ6Ci0gc3BpX25vcl9yZWFkX3NyMV9hbmRfc3IyIGlzIG5vdCBzYWZlCi0gc3BpX25vcl93cml0
ZV9zcjFfYW5kX3NyMiBpcyBzYWZlCi0gc3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hl
Y2sgaXMgbm8gbG9uZ2VyIHNhZmUKSSBkaXNsaWtlIHRoaXMga2luZCBvZiBsYWNrIG9mIHVuaWZv
cm1pdHkuIE9uZSBvZiBteSBpbml0aWFsCm1vdGl2YXRpb25zIHdhcyB0byBnZXQgcmlkIG9mIHRo
ZW0uCgo+PiBQb3NzaWJsZSBzdGVwcyBmb3J3YXJkOgo+PiAxLSBBZGQgZXh0cmEgbG9naWMgaW4g
dGhlICJhbmRfY2hlY2siIGhlbHBlciwga2luZCBvZiBkdXBsaWNhdGluZyB3aGF0Cj4+ICAgIGlz
IGluIHRoZSBzd3AuYyBmaWxlIChub3QgbXkgZmF2b3VyaXRlKQo+PiAyLSBNb3ZlIHRoZSAiY2Fy
ZWZ1bCIgaGFuZGxpbmcgKHdoaWNoIGRvZXMgbm90IHJldHVybiBlcnJvcnMgd2hlbiBhCj4+ICAg
IHJlZ2lzdGVyIHJlYWQgaXMgYWJzZW50KSBiYWNrIGZyb20gc3dwLmMgaW50byBjb3JlLmMuCj4+
Cj4+IFdoYXQgZG8geW91IHByZWZlcj8KPgo+IDMtIG1ha2UgdGhlIGdlbmVyaWNfcXVhZF9lbmFi
bGUgZGlmZmVyZW50aWF0ZSBiZXR3ZWVuICJxZSBiaXQgaXMgaW4KPiBTUjEiIG9yICJxZSBiaXQg
aXMgaW4gU1IyIi4gSWYgaXQncyBpbiBTUjEsIGp1c3QgdXNlCj4gc3BpX25vcl97cmVhZCx3cml0
ZX1fc3IxLiBpZiBpdCdzIGluIFNSMiwga2VlcCB0aGUgY3VycmVudCBoYW5kbGluZy4KPgo+IERv
IEkgbWlzcyBzb21ldGhpbmc/CgpXZWxsLCBubywgYnV0IHRoaXMgaXMgYmFja3dhcmRzLiBXZSBy
ZWludHJvZHVjZSBjb21wbGV4aXR5IGluIGEgcGF0aAp3aGljaCBkb2VzIG5vdCBuZWVkIHRoaXMg
Y29tcGxleGl0eS4KCkkgZHJhZnRlZCBhbm90aGVyIHByb3Bvc2FsOgoKNC0gTWFrZSBzcGlfbm9y
X3JlYWRfc3IxX2FuZF9zcjIoKSBpbW11bmUgdG8gdGhlIFNSMiBhYnNlbmNlLiBzd3AuYwpzdGls
bCB1c2VzIGl0cyBfY2FyZWZ1bCgpIHZlcnNpb24uIEd1YXJkIHRoZSBmYWN0IHRoYXQgd2UgY2Fu
bm90IGhhdmUKd3JpdGVfc3IyIGJ1dCBubyByZWFkX3NyMi4gVGhpcyB3YXkgdGhlIEFQSSBpcyBl
dmVuIG9uIHRoZSBTUjIgaGFuZGxpbmcsCnRoZSBjb2RlIGluIHRoZSBjb3JlIHN0YXlzIHZlcnkg
c2ltcGxlLCB3ZSBkbyBub3QgbGVhayB0aGUgYXdmdWwgc3dwCmhhbmRsaW5nIGluIHRoZSBnZW5l
cmljIHBhdGggYW5kIHRoZSBTUjEtb25seSBjYXNlIGlzIHBlcmZlY3RseSBoYW5kbGVkCmluIHRo
ZSBnZW5lcmljIGhlbHBlciB3aXRob3V0IG1vcmUgY2FyZSAod2hpY2ggd2FzIG15IGluaXRpYWwg
aW50ZW50KS4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDI2MDkx
MS1wZXJzby1maXgtc3BpLW5vci1xZS1teGljLXYyLTEtNzBjMzI0ZTlmMzBlQGJvb3RsaW4uY29t
L1QvI3UgIyB2MgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
