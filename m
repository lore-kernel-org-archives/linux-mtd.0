Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 001F7C624DE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mtAZx1084lp1WQ9fza3aobhbB4glbTrIPZBjFvvZm8c=; b=SblkUKXi5BMJQM
	Xr2+xzdmInQjuMF6eqg7zGHRw5Z79bVtz/88PYz5IArku5BxfhDDsc9aLB6CtMxIJpmPaTyBtbvy1
	JIlfdfn/m2DcUG8qY+9glieV+GLanSgwj2xzeoCKIGrJd0B/5zYQKxzykHGk3CsdRIp+7xx16Db1q
	vIElJ/aa3p5gjAXxVCsWY85V0Y3sl33tOEhtRjvsUyPa5Vl2vhWgqAGyFKXzVmdm0Fx1yzk6USy1i
	x6jIMkmMxLI8QCPP+VcJY1orPEmIeeUXL78jpLWhDfBEUnjzNkZfpymd0D3zV+E2gIWdbwlF/hM3s
	tFjXFWl8k/uSW8sdqWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Whe-00000002imD-2CgA;
	Fri, 04 Sep 2026 16:23:46 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Whb-00000002ilE-3Fbh
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 16:23:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E052A4E41512;
	Fri,  4 Sep 2026 16:23:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8E71F6057F;
	Fri,  4 Sep 2026 16:23:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EF0E11C79C68;
	Fri,  4 Sep 2026 18:23:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788539020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=beA9Hwr4TwjUwiJxPVmXZ1FsjfJHk0fAVCLyi9HMpZ4=;
	b=AxI2E/r9I3pQTt9xZjQWKK1WHdYdyrMzUaJOcuKbbaVruQUbop5q7Y5O22DP+kzbCXVvOW
	Xksi3xx2Ky9a7cuTFBXyRL4hIawKAVjWwIEcsnzsVe5Da8BelGT9MtZyXhszla35yHL5Qz
	lJ8NqhmKWeLlrv5QmL+h2Hze1p8oz6d25GOqwF+FrGIA/Lx8GH++eJ1BK00gUrJ/E9rhz5
	9kbw7myXGgvZvOipcR5Q/4R2h1eT1lwhQg5LB3RaRRKM9+1ktZF3aYBRv8xlm4TZAUbq5X
	/x7LUwcgZdADqYsNr7oH4z3A+e3LcUc7NE6EtMes3lr/mwO9U+dRz/hb5gHfDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,
  <sebin.francis@ti.com>,  <u-kumar1@ti.com>,  <a-dutta@ti.com>
Subject: Re: [PATCH v9 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
In-Reply-To: <20260825171737.776052-17-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 25 Aug 2026 22:47:35 +0530")
References: <20260825171737.776052-1-s-k6@ti.com>
	<20260825171737.776052-17-s-k6@ti.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 18:23:36 +0200
Message-ID: <8733vp0yuv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092343_946571_A4A4857C 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
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

SGVsbG8gU2FudGhvc2gsCgo+ICtzdGF0aWMgYm9vbCBzcGluYW5kX3RyeV9yYW5rZWRfdmFyaWFu
dChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gKwkJCQkgICAgICAgc3RydWN0IHNw
aV9tZW0gKm1lbSwKPiArCQkJCSAgICAgICBlbnVtIHNwaW5hbmRfYnVzX2ludGVyZmFjZSBpZmFj
ZSwKPiArCQkJCSAgICAgICB1MzIgKnRyaWVkX21hc2spCj4gK3sKPiArCWNvbnN0IHN0cnVjdCBz
cGluYW5kX29wX3ZhcmlhbnRzICp2YXJpYW50cyA9IHNwaW5hbmQtPmFsbF9yZWFkX3ZhcmlhbnRz
Owo+ICsJc3RydWN0IHNwaW5hbmRfbWVtX29wcyAqdGVtcGxhdGVzID0gaWZhY2UgPT0gT0RUUiA/
Cj4gKwkJJnNwaW5hbmQtPm9kdHJfb3BfdGVtcGxhdGVzIDogJnNwaW5hbmQtPnNzZHJfb3BfdGVt
cGxhdGVzOwo+ICsJY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKmJlc3Q7Cj4gKwlpbnQgcmV0Owo+
ICsKPiArCWlmICghdmFyaWFudHMpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCXdoaWxlICgo
YmVzdCA9IHNwaW5hbmRfb3BfZmluZF9iZXN0X3ZhcmlhbnQoc3BpbmFuZCwgdmFyaWFudHMsIGlm
YWNlLAo+ICsJCQkJCQkgICAgKnRyaWVkX21hc2ssIE5VTEwpKSkgewo+ICsJCSp0cmllZF9tYXNr
IHw9IEJJVChiZXN0IC0gdmFyaWFudHMtPm9wcyk7Cj4gKwkJc3BpbmFuZC0+bWF4X3JlYWRfb3Ag
PSAqYmVzdDsKPiArCQlzcGluYW5kLT5tYXhfcmVhZF9vcC5tYXhfZnJlcSA9IDA7Cj4gKwkJc3Bp
bmFuZC0+bWF4X3dyaXRlX29wLm1heF9mcmVxID0gMDsKPiArCQlyZXQgPSBzcGlfbWVtX2V4ZWN1
dGVfdHVuaW5nKG1lbSwgJnNwaW5hbmQtPm1heF9yZWFkX29wLAo+ICsJCQkJCSAgICAgJnNwaW5h
bmQtPm1heF93cml0ZV9vcCk7Cj4gKwkJaWYgKHJldCAmJiByZXQgIT0gLUVPUE5PVFNVUFApCj4g
KwkJCWRldl9kYmcoJm1lbS0+c3BpLT5kZXYsICIlcyBvcHRpbWl6YXRpb24gZmFpbGVkOiAlZFxu
IiwKPiArCQkJCWlmYWNlID09IE9EVFIgPyAiT0RUUiIgOiAiU1NEUiIsIHJldCk7Cj4gKwkJaWYg
KCFyZXQgJiYgc3BpbmFuZC0+bWF4X3JlYWRfb3AubWF4X2ZyZXEpIHsKPiArCQkJdGVtcGxhdGVz
LT5yZWFkX2NhY2hlID0gYmVzdDsKPiArCQkJaWYgKHNwaW5hbmQtPmFsbF9jb250X3JlYWRfdmFy
aWFudHMpIHsKPiArCQkJCXRlbXBsYXRlcy0+Y29udF9yZWFkX2NhY2hlID0KPiArCQkJCQlzcGlu
YW5kX2ZpbmRfY29udF9yZWFkX3ZhcmlhbnQoc3BpbmFuZCwgYmVzdCwgaWZhY2UpOwo+ICsJCQkJ
c3BpbmFuZC0+Y29udF9yZWFkX3Bvc3NpYmxlID0KPiArCQkJCQkhIXRlbXBsYXRlcy0+Y29udF9y
ZWFkX2NhY2hlOwoKSSBiZWxpZXZlIHlvdSBhbG1vc3QgYWRkcmVzc2VkIHRoZSBjb25jZXJucyBy
YWlzZWQgaW4gdjcgYWJvdXQKY29udF9yZWFkX3Bvc3NpYmxlLCBleGNlcHQgd2hhdCB5b3UgZG8g
aGVyZSBpcyBzdGlsbCBhIGJpdCBkYW5nZXJvdXMKc2luY2UgeW91IGNvdWxkIHJlLWVuYWJsZSBj
b250aW51b3VzIHJlYWRzIG9uIG5vX2NzX2Fzc2VydGlvbiBjYXBhYmxlCmNvbnRyb2xsZXJzLiBJ
IGJlbGlldmUgeW91IHNob3VsZCBjbGVhciB0aGUgZmxhZyBvbmx5LCBuZXZlciByaXNrIHRvIHNl
dAppdCwgc29tZXRoaW5nIGxpa2U6CgppZiAoIXRlbXBsYXRlcy0+Y29udF9yZWFkX2NhY2hlKQog
ICAgc3BpbmFuZC0+Y29udF9yZWFkX3Bvc3NpYmxlID0gZmFsc2U7CgpXaXRoIHRoaXMgZml4ZWQs
CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4K
CkkgYmVsaWV2ZSBJIHdpbGwgdGFrZSB0aGlzIHBhdGNoIG9ubHkgYWZ0ZXIgTWFyayB0YWtlcyB0
aGUgYmF0Y2ggYmVmb3JlLAp3aGljaCBsb29rcyBtb3N0bHkgZ29vZCBmb3IgbXkgbm9uLXNwaS1l
eHBlcnQgZXllcy4gRWl0aGVyIE1hcmsgc2hhcmVzCmFuIGltbXV0YWJsZSB0YWcsIG9yIEkgd2Fp
dCBvbmUgY3ljbGUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
