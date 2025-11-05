Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9D6CCF9F8
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 09:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7TSS51H6Zot2yjguXpDXWA7Mf+A8KFV8euyCp0zXbg=; b=P1Phc4yaX76wut
	zKDUSkh9DYGJs7yxDTedZLeaQVEMUZxyQyaIGEkw56ptJ0heN3N9ifpSZn2xhSQfOzTw76JDhn8qa
	Fewodk4zAWWt/KDNHajy1ZZ0YIyahomVVueo1IlRWMJJw96+7lbJ/ZrMC4Bfyu8ERF/DPfLkvSx1z
	B9NAnCwriAAbHwCmfxtlZQ6vpdFzNz64UXfqsvsvhmgpCKITow+uVzx0/M0XrA6erWy3Eov2TW8fx
	/AQx5GJzWz6+pT6GPX6uikIduzZ9bhf6Ce3JRcw7XhyWcpxOz6s1C+CwFxPwU6nlrNfRZ+wYebU7i
	gEl/XbqvWgyBhOtkks5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZw4-0000000DOfM-1p9m;
	Wed, 05 Nov 2025 09:36:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZvx-0000000DOdN-3TCs
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 09:36:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 751F8C0E61E;
	Wed,  5 Nov 2025 09:35:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46ED560693;
	Wed,  5 Nov 2025 09:36:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70CEA10B51A41;
	Wed,  5 Nov 2025 10:35:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762335359; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AWeVjAfEvwayrrcgeg/g3uKL1HZRS3340/63t2geN6g=;
	b=oyb86cw/BzojwJZ92zdlAfbHZrS8ukqgwp/wMRBsJo/g1M2ARfyxMT3IDPA5VxtdCBjL7e
	/74P04K3HbKdQVkylkn9zWf8ebOiA0eOq7PM6Ekqrjhg93NprxDdebhHME9QOBz88VU8kb
	Z95rSJS18vUuVp0TD/yt9mqZhlcCWHH2RgqsAz2r7gqrpQKpr4YHFf/3tZmaA55g9L3yS0
	AWDOIqedVWeoTVdWfay1f+O1iqL/szEK4PACbQRfKgKU91CEFj/Eo2Q3GqM9LBhtpIz+dn
	lh0cchJIIlsnq/kIW/HevJPhGiB014f/FoOaT6aY276SR2XUDybFWNTJCqd/Uw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <broonie@kernel.org>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <p-mantena@ti.com>,  <linux-spi@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <a-dutta@ti.com>,  <u-kumar1@ti.com>,  <praneeth@ti.com>
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
In-Reply-To: <ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com> (Santhosh Kumar
	K.'s message of "Wed, 5 Nov 2025 14:25:58 +0530")
References: <20250811193219.731851-1-s-k6@ti.com>
	<20250811193219.731851-2-s-k6@ti.com> <87seguemzu.fsf@bootlin.com>
	<cb04a4ec-c643-4b80-9288-8fd8944cb4f7@ti.com>
	<87qzunt4n4.fsf@bootlin.com>
	<ea19bc64-a775-4309-8f3b-ce9dd8ac02ee@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 05 Nov 2025 10:35:55 +0100
Message-ID: <87ecqcakjo.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_013606_093670_8E9FF9D5 
X-CRM114-Status: GOOD (  13.27  )
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

SGVsbG8gU2FudGhvc2gsCgo+Pj4gICAgIC0gT24gdHVuaW5nIGZhaWx1cmUsIHJldHJ5IGJ5IHJl
LXJ1bm5pbmcgc3BpX21lbV9uZWVkc190dW5pbmcoKSB3aXRoCj4+PiB0aGUgc2Vjb25kIGJlc3Qg
c2V0IG9mIG9wcyAobWF4IHRocm91Z2hwdXQgLSAxKQo+PiBJIHdvdWxkIGxpa2UgdG8gY2hhbGxl
bmdlIHRoaXMgbmVlZC4gQ2FuIHRoZSBzYW1lIGNhbGlicmF0aW9uIGZhaWwgaWYKPj4gYXR0ZW1w
dGVkIG11bHRpcGxlIHRpbWVzIChlZy4gYmVjYXVzZSBvZiB0aGUgaGVhdD8pIElmIHllcywgdGhl
biB3ZSBuZWVkCj4+IGEgZmFsbGJhY2sgaW5kZWVkLiBPdGhlcndpc2UsIEknZCBiZSBpbiBmYXZv
ciBvZiBqdXN0IGZhaWxpbmcgdGhlCj4+IHByb2JlLiBDYWxpYnJhdGlvbiBpcyBhbiBvcHQtaW4g
LT4gdXNlcnMgbXVzdCBhbGxvdyBhIGhpZ2hlciBmcmVxdWVuY3kKPj4gdGhhbiB0aGV5IHVzZSB0
byBpbiBvcmRlciB0byBlbmFibGUgdGhlIGZlYXR1cmU/Cj4KPiBJdCdzIHBvc3NpYmxlIHRoZSBz
YW1lIGNhbGlicmF0aW9uIHdpbGwgZmFpbCBpbnRlcm1pdHRlbnRseSBmb3IKPiBkaWZmZXJlbnQg
cmVhc29ucyAodGVtcGVyYXR1cmUgY2hhbmdlcywgYXMgeW91IG1lbnRpb25lZCkuIElmIHR1bmlu
Zwo+IGZhaWxzLCB0aGUgZHJpdmVyIHNob3VsZCBmYWxsYmFjayB0byB0aGUgbm9uLVBIWSBmcmVx
dWVuY3kgc28gdGhlIGZsYXNoCj4gY29udGludWVzIG9wZXJhdGluZyB3aXRoIHNsb3dlciByZWFk
cy93cml0ZXMgcmF0aGVyIHRoYW4gZmFpbGluZyB0aGUKPiBwcm9iZSAoYXZhaWxhYmlsaXR5IHNo
b3VsZCBiZSBwcmlvcml0aXplZCwgcmlnaHQ/KS4KCkFncmVlZCwgaWYgdGhlIHR1bmluZyBtYXkg
ZmFpbCB3ZSBtdXN0IGZhbGxiYWNrIGluIHRoaXMgY2FzZS4gSG93ZXZlcgp0aGVyZSBpcyBhbm90
aGVyIHNpdHVhdGlvbiB0aGF0IG11c3QgYmUgaGFuZGxlZCBpbiB0aGlzIGNhc2U6IG9uY2UKdHVu
aW5nIGlzIGRvbmUgYW5kIHdlIHdhbnQgdG8gdXNlIFBIWS1vcHRpbWl6ZWQgcGF0aHMsIHdlIG11
c3QgZmFsbGJhY2sKdG8gbW9yZSBiYXNpYy9zbG93ZXIgcmVhZHMgaWYgZm9yIHNvbWUgZXh0ZXJu
YWwgcmVhc29uLCB0aGV5IHN0YXJ0CmZhaWxpbmcsIHJpZ2h0PwoKVGhlIG9idmlvdXMgY2hvaWNl
IGluIHRoaXMgY2FzZSB3b3VsZCBiZSB0byBsZXQgdGhpcyBlcnJvciBoYW5kbGluZyB0bwp0aGUg
Y29udHJvbGxlciBkcml2ZXIuIFJlLXVzaW5nIHRoZSBzYW1lIG9wZXJhdGlvbiBhdCBhIGxvd2Vy
IHNwZWVkCndvdWxkIGJlIHN1Ym9wdGltYWwsIGJlY2F1c2UgdGhlIGZhc3Rlc3Qgb3BlcmF0aW9u
IGF0IGEgaGlnaCBzcGVlZCBtaWdodApub3QgYmUgdGhlIG1vc3QgZWZmaWNpZW50IGF0IHNsb3dl
ciBzcGVlZHMgZHVlIHRvIHRoZSBudW1iZXIgb2YgZHVtbXkKY3ljbGVzIG5lZWRlZCwuIEJ1dCBJ
IGJlbGlldmUgdGhpcyBpcyBuZWdsaWdpYmxlIGJhc2VkIG9uIHRoZSBmYWN0IHRoYXQKd2UgYWxy
ZWFkeSBhcmUgaW4gZGVncmFkZWQgbW9kZSBhdCB0aGF0IHN0YWdlLgoKSG93ZXZlciwgdGhpcyBt
YXkgY29uZmxpY3Qgd2l0aDoKLSByZWFkIHJldHJpZXMKLSBjb250aW51b3VzIHJlYWRzICg/KQoK
U28gaW4gcHJhY3RpY2UgdGhlIGZhbGxiYWNrIG1pZ2h0IGJlIG5lZWRlZCBvbiB0aGUgU1BJIE5B
TkQvTk9SIHNpZGUKKHRoaXMgY2FuIGJlIGZ1cnRoZXIgZGlzY3Vzc2VkKS4KCkJ1dCBvbmNlIHdl
IHNvbHZlIHRoaXMsIGNvbWVzIGEgc2ltaWxhciBwcm9ibGVtIG9uIHRoZSB3cml0ZSBzaWRlLiBI
b3cKZG8gd2Uga25vdyBpZiBhIHdyaXRlIHdpbGwgb3IgZGlkIGZhaWwgYmVjYXVzZSBvZiBhIHRl
bXBlcmF0dXJlIGNoYW5nZT8KV2hhdCBtYXkgYmUgdGhlIGhldXJpc3RpY3MgdG8gZmFsbGJhY2sg
aW4gdGhpcyBjYXNlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
