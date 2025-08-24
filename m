Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EE0CA0EFC
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3IHwULuZpUkwfHQy1/69b60XM8C9tsS/IGGI+aF/w0=; b=BkzLB7ON3LjRi1
	uQdXXVV69IjDFq03UfpuFy7B+/QsUycLANuuxueK2HZWrFv+1bJ19CI1HNT/M1aOKEKLLtFe4SCkZ
	4tsjM79ksR3yfFm7j+ZxzKwJ/nSUiBPC2JtfmGuLp21t2H4+vTBw7PP4h5TZn2SyrjXg5qHQlS4UQ
	NoMxW7rSncAFiiR2URq4lPuBJ8vEsTzaTDnVdHkN4n2pfl2PUcA9+Fg4hpjQmbefOybfLLBGuZYlm
	yh5f86CjFr64m0arj5xzxYS5TO3GVgrBOF5Lr+tnvkFA+Tufe2W8VG/LDIGtvOIdD4FPqFIRP85FB
	3RAPOSlH0yz6xMrrWSDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCvV-00000006JNR-2eef;
	Sun, 24 Aug 2025 15:46:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCvS-00000006JMz-1Kd6
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 15:46:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 38E91C653ED
	for <linux-mtd@lists.infradead.org>; Sun, 24 Aug 2025 15:46:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1702C605F1;
	Sun, 24 Aug 2025 15:46:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 887CB1C22D3DD;
	Sun, 24 Aug 2025 17:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756050389; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w+MfyVmxQJvp2V9muLXwNpG8LH7o2E766a2xaru6xZY=;
	b=FM4FZwWCIPKCigLET/chS3RubLIDbVL5zYyYeiw5wmuiMDMaplt86JyDbEAu8TewJPy7Sr
	gYKI7TKjy0WZCccQz3QjwrngwzxvauAGLNwGcsC14VR2g3jMAw1jFhUorNkSnPvV7remSQ
	0SEAG6zpCNifRUYXlfuA7CFH1A/uKfTeSM3xmRHlCPazOdD8IE7r68AZPfL+cxbevUbJEa
	R3k7fG9eanpcpXs2kxnrTSekaHzp4E+wcwE2Vp/OktQ6oDnOt1np69Og1gAcCwEPXaz7vt
	p7dxLhqi75SAWJs6AEd7nEJBVRfCJJ6NmKCmUmp/jsjCJjelb8IVv6jU2rBkew==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tianling Shen <cnsztl@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Mark Brown
 <broonie@kernel.org>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spinand: add support for FudanMicro FM25S01A
In-Reply-To: <20250810133852.52389-1-cnsztl@gmail.com> (Tianling Shen's
	message of "Sun, 10 Aug 2025 21:38:52 +0800")
References: <20250810133852.52389-1-cnsztl@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:46:18 +0200
Message-ID: <87wm6sk9it.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_084634_533487_8F9F89F6 
X-CRM114-Status: GOOD (  14.70  )
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

SGVsbG8gVGlhbmxpbmcsCgpPbiAxMC8wOC8yMDI1IGF0IDIxOjM4OjUyICswOCwgVGlhbmxpbmcg
U2hlbiA8Y25zenRsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciBGdWRhbk1p
Y3JvIEZNMjVTMDFBIFNQSSBOQU5ELgo+IERhdGFzaGVldDogaHR0cDovL2VuZy5mbXNoLmNvbS9u
dm0vRk0yNVMwMUFfZHNfZW5nLnBkZgo+Cj4gU2lnbmVkLW9mZi1ieTogVGlhbmxpbmcgU2hlbiA8
Y25zenRsQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUg
fCAgMiArLQo+ICBkcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMgICB8ICAxICsKPiAgZHJpdmVy
cy9tdGQvbmFuZC9zcGkvZm1zaC5jICAgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L210ZC9zcGluYW5kLmggICB8ICAxICsKPiAgNCBmaWxl
cyBjaGFuZ2VkLCA3NyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNoLmMKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3NwaS9NYWtlZmlsZSBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxl
Cj4gaW5kZXggMjU4ZGE0MjQ1MWE0Li5lMjg4NzQyZWE4ZjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9NYWtl
ZmlsZQo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCj4gLXNwaW5hbmQtb2JqcyA6PSBjb3JlLm8gb3RwLm8KPiArc3BpbmFuZC1vYmpzIDo9IGNv
cmUubyBmbXNoLm8gb3RwLm8KCllvdSdyZSBhZGRpbmcgYSBtYW51ZmFjdHVyZXIgZHJpdmVyIGlu
IHRoZSBtaWRkbGUgb2YgdGhlIGNvcmUgZmlsZXMuIEZvcgpub3cgd2Uga2luZCBvZiBpbmZvcmNl
IGFuIGFscGhhYmV0aWNhbCBvcmRlciwgc28gcGxlYXNlIG1vdmUgaXQgYmVsb3cuCgo+ICBzcGlu
YW5kLW9ianMgKz0gYWxsaWFuY2VtZW1vcnkubyBhdG8ubyBlc210Lm8gZm9yZXNlZS5vIGdpZ2Fk
ZXZpY2Uubwo+ICBtYWNyb25peC5vCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBeCkhlcmUKCj4gIHNwaW5hbmQtb2JqcyArPSBtaWNyb24ubyBwYXJhZ29u
Lm8gc2t5aGlnaC5vIHRvc2hpYmEubyB3aW5ib25kLm8geHR4Lm8KPiAgb2JqLSQoQ09ORklHX01U
RF9TUElfTkFORCkgKz0gc3BpbmFuZC5vCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IGluZGV4IGIwODk4OTkw
YjJhNS4uZWE0NzAyOGQwMjFhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL2Nv
cmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+IEBAIC0xMTg0LDYgKzEx
ODQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaW5hbmRfbWFudWZhY3R1cmVyICpzcGluYW5k
X21hbnVmYWN0dXJlcnNbXSA9IHsKPiAgCSZhbGxpYW5jZW1lbW9yeV9zcGluYW5kX21hbnVmYWN0
dXJlciwKPiAgCSZhdG9fc3BpbmFuZF9tYW51ZmFjdHVyZXIsCj4gIAkmZXNtdF9jOF9zcGluYW5k
X21hbnVmYWN0dXJlciwKPiArCSZmbXNoX3NwaW5hbmRfbWFudWZhY3R1cmVyLAo+ICAJJmZvcmVz
ZWVfc3BpbmFuZF9tYW51ZmFjdHVyZXIsCj4gIAkmZ2lnYWRldmljZV9zcGluYW5kX21hbnVmYWN0
dXJlciwKPiAgCSZtYWNyb25peF9zcGluYW5kX21hbnVmYWN0dXJlciwKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvZm1zaC5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvZm1zaC5j
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjhiMjA5N2JmYzc3
MQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9mbXNoLmMKCk90
aGVyaXNlIHRoZSBkcml2ZXIgaXMgc2ltcGxlIGVub3VnaCwgc28gdjIgc2hvdWxkIG1ha2UgaXQg
OikKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
