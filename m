Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C5C02181
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2025 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63ZLtIBFaBSUNkhAHxbrHi1ij5r1LE1X3G97nIJG074=; b=uF/LwatwsW2Lzn
	aZsoFTOWzrlfAlwvjR+Z+VrcmR+PbPXcvFznyteRbFLUR5yHTKCrFPwYzfIKs7USWthsCMEEY0dlO
	1yCcs6FpyQgxuUPg2xHap5+258fkbZ2iUbHb6OL15Lw4exVU79T3YpShB6+cVuIzhj3ENAiJ+bYC/
	PwdTamIiZpZRseIyf1vIY5pWsyTCPVyEMbU6XHdV5mSwbn6gjgI+A7irPQGEZgezQiBCC56I6zsog
	zlU8+Rorr6/d8AJudbwSPs65KaYNd4LaIXPwFg2goXn2Pe+G/v4i/4PyeN+41ROU3Q8Q8GSkC6olE
	U01PLO1qiRTqAneOg1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrBO-00000005Zam-2nl3;
	Mon, 20 Jan 2025 12:47:10 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZrBL-00000005ZaR-47Mf
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jan 2025 12:47:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97BD3240006;
	Mon, 20 Jan 2025 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737377225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pybhlp0sJJPGmvMFF+Q4zrcQH0eGqr+y65cHiD+UM64=;
	b=iul40Ob8F2t57mhP2461QNZoMg30Z8wLSAQLIqZChGLMXlkGkZpdQHoVSooyIZGTHpfQrK
	Fpd6Ujlh8ry8rcSI7XM5pLMhTMEsYdhl0p8sd0M+f+yy3ILFP3YkUoOlNRjNvvSBkPsoaJ
	OZXdjYnsUv0P8h4ZKRctB/8HBfry564zFkKjIPem0aXRMEH78u1lct/VFrxzv5C5DqT5jg
	F3/D55mASFEhn/x2hI6rSRppgnleBRUfmTEtI0Euqy/oTZ8nEtbs5+1rMQ29GKtBxcUSXo
	tBY7LnBtboXiOOSx6icQ8Jn24/CNz3XVGzYowLOB8rhJ32NFrfMMRHWoX3dUOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
In-Reply-To: <mafs08qrc5g44.fsf@kernel.org> (Pratyush Yadav's message of "Wed,
	15 Jan 2025 14:03:23 +0000")
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
	<20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
	<mafs0zfkk7pfm.fsf@kernel.org> <871pxp798c.fsf@bootlin.com>
	<mafs0ldve7qms.fsf@kernel.org> <87a5btslfl.fsf@bootlin.com>
	<mafs08qrc5g44.fsf@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:47:04 +0100
Message-ID: <87jzapsldj.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_044708_434354_95ECC888 
X-CRM114-Status: GOOD (  18.32  )
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

SGkgUHJhdHl1c2gsCgo+IE9rYXksIEkgYW0gY29uZnVzZWQgYmVjYXVzZSB5b3Ugc2FpZCBlYXJs
aWVyIHRoYXQ6Cj4KPj4gVGhlIGJ1ZyB0aGF0IGhhcyBiZWVuIGV4cGVyaWVuY2VkIGZvbGxvd2Vk
IHRoaXMgc2VxdWVuY2U6Cj4+IC0gc2VuZCB0aGUgd3JpdGUgZW5hYmxlIGNvbW1hbmQgKG5vbi12
b2xhdGlsZSkKPj4gLSB3YWl0IGZvciB0aGUgcmVhZHkvYnVzeSBiaXQsIGllLiB3YWl0IGZvciB0
aGUgV0VMIGJpdCB0byBiZSBzZXQKPj4gICBiZWNhdXNlIGl0IGlzIG5vbi12b2xhdGlsZSB3cml0
ZQo+PiAtIGFjdGl2ZSBkaWUgaXMgcmVhZHksIChidXQgaWRsZSBkaWUgaXMgbm90ISkKPj4gLSBl
bnRlciA0LWJ5dGUgYWRkcmVzcyBtb2RlLCBvbmx5IHRoZSBkaWUgdGhhdCBpcyByZWFkeSBwcm9j
ZXNzZXMgdGhlCj4+ICAgY29tbWFuZC4KPgo+IFdoaWNoIHNheXMgdGhlIFdFTCBiaXQgYmVpbmcg
c2V0IGl0c2VsZiBpcyByYWN5LiBXaGF0IEkgdW5kZXJzdGFuZCBmcm9tCj4gdGhhdCBpcyBvbmUg
ZGllIGlzIHJlYWR5IHRvIHRha2Ugd3JpdGVzIGFuZCB0aGUgb3RoZXIgaXMgbm90LiBOb3cgd2hl
bgo+IHlvdSB0cnkgdG8gd3JpdGUgdGhlIFNSIHRvIGVuYWJsZSA0QiBtb2RlLCBpdCB3b3VsZCBv
bmx5IHdvcmsgb24gdGhlIGRpZQo+IHRoYXQgZ290IHRoZSBXRUwgc2V0LiBUaGUgb3RoZXIgb25l
IGlnbm9yZXMgaXQgYW5kIHN0YXlzIGluIDNCIG1vZGUuIERvCj4gSSB1bmRlcnN0YW5kIHRoaXMg
Y29ycmVjdGx5PyBUbyBmaXggdGhpcyB5b3UgbmVlZCB0byB3YWl0IGFmdGVyIHRoZQo+IHdyaXRl
IGVuYWJsZSwgYmVmb3JlIHlvdSBpbml0aWF0ZSB0aGUgd3JpdGUgU1Igb3BlcmF0aW9uLgoKU29y
cnkgZm9yIHRoZSBjb25mdXNpb24sIEkgZ290IG15c2VsZiBjb25mdXNlZCBhcyB3ZWxsLiBJIGRv
dWJsZSBjaGVja2VkCndpdGggV2luYm9uZCBhbmQgSSB0aGluayBJIGhhdmUgdGhlIGNvcnJlY3Qg
ZXhwbGFuYXRpb24gbm93OgoKVGhlIFdFTCBiaXQgaXMgdm9sYXRpbGUsIHRoZXJlIGlzIG5vIGRl
bGF5IHdoZW4gc2V0dGluZyBpdCAod2VsbCwgYWJvdXQKMTBucywgYnV0IG5vIHNwZWNpZmljIGRl
dmlhdGlvbikuCgpPbiBtb3N0IGNoaXBzLCBXRUwgZW5hYmxlcyBhbGwgd3JpdGUgb3BlcmF0aW9u
czoKICAqIChzaW5nbGUvZHVhbC9xdWFkKSBwYWdlIHByb2dyYW1zCiAgKiAoc2VjdG9yL2Jsb2Nr
L2NoaXApIGVyYXNlcwogICogc3RhdHVzIHJlZ2lzdGVyIHdyaXRlCiAgKiBlcmFzZS9wcm9ncmFt
IG9mIG90aGVyIGludGVybmFsIHJlZ2lzdGVycyAobGlrZSBzZWN1cml0eSByZWdpc3RlcnMpCgpP
biBXaW5ib25kLCB0aGUgYWJvdmUgYXBwbGllcywgYnV0IHdpdGggdGhlIHVzdWFsICJXcml0ZSBF
bmFibGUgY29tbWFuZAooMDZoKSIsIHRoZSBzdGF0dXMgcmVnaXN0ZXIgYml0cyBhcmUgbm9uLXZv
bGF0aWxlLCBpZS4gdGhleSBhcmUgc3RvcmVkCmluIG5vbi12b2xhdGlsZSBjZWxscyAod2hpY2gg
dGFrZXMgdGltZSB0byBwcm9ncmFtIGFuZCBhcmUgc3ViamVjdAp0byBkZXZpYXRpb25zIGFjcm9z
cyBkaWVzKS4gSGVuY2UsIHRoZXkgYWRkZWQgYW5vdGhlciBjb21tYW5kLCBjYWxsZWQKIldyaXRl
IEVuYWJsZSBmb3IgVm9sYXRpbGUgU3RhdHVzIFJlZ2lzdGVyICg1MGgpIiB3aGljaCBpcyBhbiBh
ZGRpdGlvbgp0byB0aGUgdXN1YWwgIldyaXRlIEVuYWJsZSBjb21tYW5kICgwNmgpIiB3aGljaCBj
YXVzZXM6Ci0gZW5hYmxpbmcgd3JpdGVzIG9uIHRoZSBzdGF0dXMgcmVnaXN0ZXIgb25seSAoaWYg
dGhlIFdFTCBiaXQgaXMgbm90IHlldAogIHNldCkKLSB1c2luZyB2b2xhdGlsZSB3cml0ZXMgZm9y
IHRoZSBzdGF0dXMgcmVnaXN0ZXIgYml0cyAoaWUuIHRoZXkgYXJlIHVzaW5nCiAgc29tZSBraW5k
IG9mIGxvY2FsIGNhY2hlIHdoaWNoIHVwZGF0ZSBhbG1vc3QgaW1tZWRpYXRlbHkpLgoKU28gYmFz
aWNhbGx5LCBpZiB5b3UgZG8gdGhlIGZvbGxvd2luZzoKLSBzdGF0dXMgcmVnaXN0ZXIgd3JpdGUK
LSBjaGVjayB0aGUgc3RhdHVzIGJpdCB3aXRoIHRoZSBzdGFuZGFyZCBoZWxwZXIKLSAoYW5kIHF1
aWNrbHkgYWZ0ZXIpIGRvIGFueXRoaW5nIGVsc2Ugb24gdGhlIGlkbGUgZGllCkluIHRoaXMgY2Fz
ZSB5b3UgY291bGQgZXhwZXJpZW5jZSBhIHJhY2UsIGJ1dCB0aGF0IGlzIG5vdCByZWxhdGVkIHRv
IHRoZQpXcml0ZSBFbmFibGUgY29tbWFuZC4KCkluIGdlbmVyYWwgSSBiZWxpZXZlIGVuYWJsaW5n
IHZvbGF0aWxlIHN0YXR1cyByZWdpc3RlciB3cml0ZXMgd291bGQgbm90CmJlIHVzZWZ1bCBhcyBs
b25nIGFzIHdlIGhhdmUgdGhlICJyZWFkIHRoZSBzdGF0dXMgZnJvbSBhbGwgZGllcyIKd29ya2Fy
b3VuZC4KCkxldCBtZSBrbm93IGlmIHNvbWV0aGluZyBpcyBzdGlsbCB1bmNsZWFyLgoKVGhhbmtz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
