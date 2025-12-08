Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D47D3B7DD
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 08:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QknrOWZqpYyWlOT1VCNvHzU+ZF7ZHXnTJIgYnZssOUM=; b=DAvHdFoe1HN+Zm
	yGyatXexm965wSueiLV0IptUDL/AJaVILO1+Fz2OJARK1Z+lL5gAFZCD9Cd4LNzcKZamE/okz3Szb
	qeO1yfDxohumpM4dvqf46pXGJpsp/NwhQLBITWUyiQ4ta40QkHamxJ/obfv0lA9bzH16tHZlDa5NI
	zyAI5SiorRA5QbZ62NrAbI3ZrqdhnzR/hPzmZFeq2WbeMIO2Ks++/+BMgR3QU2JGQlVFBGYHTOGq5
	xOJTeEh/MWT5KaSrvjX42C76QtuwaDsUe1LrY416ArDu0gxDDFGq50tgN8enrH/J2mU8UedVgjj2W
	pSxNsj2vpvoT9SHTwHpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWym-0000000Cppw-2O4k;
	Mon, 08 Dec 2025 08:52:24 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSWyi-0000000CppV-3zy2
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 08:52:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 42FC21A201B
	for <linux-mtd@lists.infradead.org>; Mon,  8 Dec 2025 08:52:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 17F7F60707;
	Mon,  8 Dec 2025 08:52:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 994FC102F0D51;
	Mon,  8 Dec 2025 09:52:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765183937; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8hGarfSPljfdjvvaFqnVE6KI08H7h3+flngId20ZoOg=;
	b=Fe+3Ipk8XpKTyI1kzQRBgTJwr7ch6Fv7jLuiFuJP6/PjbFojHF7XZ650hakTQ81UQ213Ex
	kfnOjCHsXziVsUfsku+1gxx57axv1/whHQ7KYMCj+EuEAkNmzcSdVkmIJMux0Kp8qzpHew
	c8QF0xIiAbabh/QFOvTICf5p51yI6tCBd6GFCDu6O0MN6eL7eFj5CVaZE3vlozvlUnahyq
	fubhQPB/E17eCXqJko0mx6QjNNrbnITYhPOgABz0VZ0tFt9Oe04tkUDYgb/7UOR0zrkl34
	tDYxbZs8jOOaq+g+GJQqngMMg4v8VDXLhuRhPRt1p9nrOhdfRGkqUD+GEF2irg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for Dosilicon DS35Q1GA/DS35M1GA
In-Reply-To: <20251207150923.86328-1-naseefkm@gmail.com> (Ahmed Naseef's
	message of "Sun, 7 Dec 2025 19:09:20 +0400")
References: <20251207150923.86328-1-naseefkm@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 08 Dec 2025 09:52:15 +0100
Message-ID: <87qzt573uo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_005221_127801_4E88F073 
X-CRM114-Status: GOOD (  10.38  )
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

SGkgQWhtZWQsIHRoYW5rcyBmb3IgdGhpcyBjb250cmlidXRpb24uCgo+ICtzdGF0aWMgU1BJTkFO
RF9PUF9WQVJJQU5UUyhyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ICsJCVNQSU5BTkRfUEFHRV9SRUFE
X0ZST01fQ0FDSEVfWDRfT1AoMCwgMSwgTlVMTCwgMCksCj4gKwkJU1BJTkFORF9QQUdFX1JFQURf
RlJPTV9DQUNIRV9YMl9PUCgwLCAxLCBOVUxMLCAwKSwKPiArCQlTUElOQU5EX1BBR0VfUkVBRF9G
Uk9NX0NBQ0hFX09QKHRydWUsIDAsIDEsIE5VTEwsIDApLAo+ICsJCVNQSU5BTkRfUEFHRV9SRUFE
X0ZST01fQ0FDSEVfT1AoZmFsc2UsIDAsIDEsIE5VTEwsIDApKTsKClRoZXNlIG1hY3JvcyBoYXZl
IGJlZW4gcmVuYW1lZCwgcGxlYXNlIHJlYmFzZSBhdCAtcmMxLgoKPiArCj4gK3N0YXRpYyBTUElO
QU5EX09QX1ZBUklBTlRTKHdyaXRlX2NhY2hlX3ZhcmlhbnRzLAo+ICsJCVNQSU5BTkRfUFJPR19M
T0FEX1g0KHRydWUsIDAsIE5VTEwsIDApLAo+ICsJCVNQSU5BTkRfUFJPR19MT0FEKHRydWUsIDAs
IE5VTEwsIDApKTsKPiArCj4gK3N0YXRpYyBTUElOQU5EX09QX1ZBUklBTlRTKHVwZGF0ZV9jYWNo
ZV92YXJpYW50cywKPiArCQlTUElOQU5EX1BST0dfTE9BRF9YNChmYWxzZSwgMCwgTlVMTCwgMCks
Cj4gKwkJU1BJTkFORF9QUk9HX0xPQUQoZmFsc2UsIDAsIE5VTEwsIDApKTsKPiArCj4gK3N0YXRp
YyBpbnQgZHMzNXh4X29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0
aW9uLAo+ICsJCQkJc3RydWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCj4gK3sKPiArCXJldHVy
biAtRVJBTkdFOwo+ICt9CgpUaGlzIGlzIHN0cmFuZ2UsIHRoZXJlIGlzIHVzdWFsbHkgc29tZSBz
cGFyZSBhcmVhIHVzZWQgZm9yIHN0b3JpbmcgdGhlCkVDQy4gQXJlIHlvdSBzdXJlIG5vbmUgb2Yg
dGhlIGJ5dGVzIGluIHRoZSBzcGFyZSBhcmVhIGFyZSBiZWluZyBzbWFzaGVkCndoZW4geW91IHdy
aXRlIHRoZW0/Cgo+ICtzdGF0aWMgaW50IGRzMzV4eF9vb2JsYXlvdXRfZnJlZShzdHJ1Y3QgbXRk
X2luZm8gKm10ZCwgaW50IHNlY3Rpb24sCj4gKwkJCQkgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpy
ZWdpb24pCj4gK3sKPiArCWlmIChzZWN0aW9uKQo+ICsJCXJldHVybiAtRVJBTkdFOwo+ICsJcmVn
aW9uLT5vZmZzZXQgPSAyOwo+ICsJcmVnaW9uLT5sZW5ndGggPSA2MjsKPiArCXJldHVybiAwOwo+
ICt9Cj4gKwoKTEdUTSBvdGhlcndpc2UuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
