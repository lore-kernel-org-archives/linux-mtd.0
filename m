Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F74C88E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 09:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pkxm3YNbzXR/0vMNW1yZ3fa4kHaYN4+XyV3whkx2/hs=; b=3rvtSQSlQZP0TN
	S6cz0SAsvAS6HFgThua+hf/OdC4H2ea7SSbBo6NpbSkF45l2R/Xf7E0ien3At/5LIyCaJN55eWhUM
	5NK9SI5Ae8KjpGm8z+rQG1CaGpiOMKjmJuZbvLofA6WLF0RlNY3sei7yGwPJlYoGwkroHdGGdj3WH
	0TJNWKGgyW0wLwoCT+2Zc7wcVJ8u2pmd7Vq8/G4neQWXgBqlRvE8DDxjUHQXdn2q5apNEwH1QM8SC
	X4zFL7VEzIVuhX4FCDzscN0/IOIDvYL85HQ6zRVQubkKDqqzWY+4YetinEW/ZMbrwqI1sXs5EkgHg
	/v2GWUzH6ltt1doDYhkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xeD-0000000GHTa-3B8b;
	Fri, 11 Sep 2026 09:34:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xeB-0000000GHSg-1wxA
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 09:34:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E74B9C653FD;
	Fri, 11 Sep 2026 09:34:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BA31601DE;
	Fri, 11 Sep 2026 09:34:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98DDF11C7AF9B;
	Fri, 11 Sep 2026 11:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789119252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+MSaCxEM6gtqRPIrYStu8q24HQw4U2YfE0GfMr+ewmI=;
	b=1YYLQtdq0okmGVYwORjL52h0am5CKoc+uAFc5VDCrPz2TaU62SD/cfYxz3GeMN6HyLdVqt
	z42ZL1QWrKjgdp+DUPyeeX8y/sIjCZbQ19Bkpx/kH/4WjxqHYaAIoqR88XWgo+IGSH/Eqw
	vZKBPDfNcvQTvWNpk2njunedtYVK3Oq7TLem33yUENGTl6Iujixdj5E/ZeWXP6wgLUOFrc
	hYgAuVX/9/ICYyBZ8xszZ/jGTT6ra/Kbr1PRlTtzKcJS02i5j+TCi6m5EqVUURbS74mARP
	lRoMVjD/CitYQHhgerDkc46VS2MZBEyu6N4aGgLRVeUNJdQrBw5OKveMtBkPmw==
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
In-Reply-To: <87o6e4qh5g.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 11
	Sep 2026 11:19:39 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
	<DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 11:34:09 +0200
Message-ID: <87ik4cqgha.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_023415_666209_1C8B6959 
X-CRM114-Status: GOOD (  13.26  )
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

T24gMTEvMDkvMjAyNiBhdCAxMToxOTozOSArMDIsIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXlu
YWxAYm9vdGxpbi5jb20+IHdyb3RlOgoKPj4+IC0JcmV0ID0gc3BpX25vcl9yZWFkX3NyMV9hbmRf
c3IyKG5vciwgc3IpOwo+Pj4gKwlpZiAocWVfbWFza1swXSkKPj4+ICsJCXJldCA9IHNwaV9ub3Jf
cmVhZF9zcjEobm9yLCBzcik7Cj4+PiArCWVsc2UKPj4+ICsJCXJldCA9IHNwaV9ub3JfcmVhZF9z
cjFfYW5kX3NyMihub3IsIHNyKTsKPj4KPj4gU2hvdWxkbid0IHRoYXQgYmUgdGhlIG90aGVyIHdh
eSBhcm91bmQ/Cj4+Cj4+ICsJaWYgKHFlX21hc2tbMV0pCj4+ICsJCXJldCA9IHNwaV9ub3JfcmVh
ZF9zcjFfYW5kX3NyMihub3IsIHNyKTsKPj4gKwllbHNlCj4+ICsJCXJldCA9IHNwaV9ub3JfcmVh
ZF9zcjEobm9yLCBzcik7Cj4+Cj4+IEkga25vdyBxZV9tYXNrIHdvbid0IGJlIHNwcmVhZCBhY3Jv
c3MgdHdvIFNScy4gSnVzdCB0byBiZQo+PiBjb3JyZWN0IGFuZCBtYWtlIGl0IGVhc2llciB0byBn
cm9rLgo+Cj4gV2h5IGlzIHRoZSBzZWNvbmQgdmVyc2lvbiBlYXNpZXIgdG8gcGFyc2U/IEZpcnN0
IHZlcnNpb24gaXMgbWF5YmUgbW9yZQo+IGZ1dHVyZSBwcm9vZiBzaW5jZSB3ZSBhcmUgdHJlYXRp
bmcgYSBzcGVjaWZpYyBjYXNlLiBCZWNhdXNlIGVpdGhlciBpdCBpcwo+IGEgc3BlY2lmaWMgY2hp
cCAoTXhpYykgb3Igd2UgZW5kIHVwIGluIHRoZSBtb3JlIGNvbW1vbiBjYXNlLiBUaGVyZSBpcwo+
IG9ubHkgb25lIFFFUiBlbnRyeSBmb3IgcWVfbWFza1swXSwgbWFueSBmb3IgcWVfbWFza1sxXSwg
YW5kIGNoYW5jZXMgYXJlCj4gdGhhdCBpbiB0aGUgZnV0dXJlIHdlIHdpbGwgbW9zdGx5IHNlZSBu
ZXcgY2hpcHMgb25seSB1c2luZyBhIHFlX21hc2tbMV0KPiBtYXNrLiBTbyBoYXZpbmcgdGhpcyBp
biB0aGUgZWxzZSBkb2Vzbid0IHNvdW5kIHNvIHN0cmFuZ2UgdG8gbWU/IEkgYWxzbwo+IGRvbid0
IHRoaW5rIHdlIHdpbGwgZXZlciBzZWUgbWFza3Mgc3Bhbm5pbmcgdGhlIHR3byByZWdpc3RlcnMu
CgpUaGUgcHJvYmxlbSBzdGlsbCBwZXJzaXN0cyBiZWNhdXNlIHRoZXJlIGlzIHRoZSBjaGVjayB3
aGljaCBhbHNvIGZhaWxzCnJlYWRpbmcgU1IyLgoKTWljaGFlbCwgd2UgbW92ZWQgdG8gc3dwLmMg
dGhhdCBoYW5kbGluZywgaW50cm9kdWNpbmcgYSAiY2FyZWZ1bCIKcmV2aXNpb24sIHdhcyB0aGlz
IGFjdHVhbGx5IHJlbGV2YW50PyBTaG91bGRuJ3Qgd2UgaGF2ZSB0aGUgaGFuZGxpbmcgb2YKdGhl
IGxhY2sgb2YgU1IyIHJlYWQgYmFjayBpbnRvIHRoZSBtYWluIGNvcmUgbGlrZSBiZWZvcmU/CgpQ
b3NzaWJsZSBzdGVwcyBmb3J3YXJkOgoxLSBBZGQgZXh0cmEgbG9naWMgaW4gdGhlICJhbmRfY2hl
Y2siIGhlbHBlciwga2luZCBvZiBkdXBsaWNhdGluZyB3aGF0CiAgIGlzIGluIHRoZSBzd3AuYyBm
aWxlIChub3QgbXkgZmF2b3VyaXRlKQoyLSBNb3ZlIHRoZSAiY2FyZWZ1bCIgaGFuZGxpbmcgKHdo
aWNoIGRvZXMgbm90IHJldHVybiBlcnJvcnMgd2hlbiBhCiAgIHJlZ2lzdGVyIHJlYWQgaXMgYWJz
ZW50KSBiYWNrIGZyb20gc3dwLmMgaW50byBjb3JlLmMuCgpXaGF0IGRvIHlvdSBwcmVmZXI/CgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
