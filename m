Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22E5CC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=khcpGD4nj6KA4hnnnlTO0f81ekZ4l98mas3bCSfWW3M=; b=aqJ4n+ioHKjla4
	TnKYJhDcYtga4FMSbJo3vvpv1FjFNjdRwf/xT+IC7+gXnZ9lL8GPR50HpIBWZrDY2ufFR3AY3K4G/
	Yht3F0WU+HvMzjPy9I3QhoijZP0QtFN+aFxnlKzfYMGJ7XDMbCdp4wf8qAvDBBSLCkWhGLmYX04bo
	QaHVC9D51blDORQrB4RXX+wEraUZpdcHKh+cC5v449SbWeEHcnAbOSyd5LYhsHRT8/PfozPKTs5Xq
	dRNl0tL/T90ojcxuCLPr9TWEp5OJvAlq6kudOREcvQaSsbuThrVMNyZ2DyaNPtP17khe00zTnyKlf
	a4ymkCT565IUNqqK4jLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfHE-0000000DUFy-1bqU;
	Tue, 13 Oct 2026 16:22:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfHB-0000000DUFH-012e
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:22:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 152281A1213;
	Tue, 13 Oct 2026 16:22:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D589E60362;
	Tue, 13 Oct 2026 16:22:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CA4D11D717F6;
	Tue, 13 Oct 2026 18:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791908565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wZAJ5jFiSG5gx8vSPdPgyJ2D5rMYe8c+FASpWn5HpVE=;
	b=fXtR/tLXz5pFR0hdkSjPYaqmrllPKM5BowwNupxzr86xRFB/9zPtQ3o2AsM+b36Nrt2urf
	XZiV7DIn72jdDfDKuHN5LLXZY5vu/1RD4GO7d4eaUP9DQp64TSGFMshhgkI6xXVL1AMX1Y
	OwOFAuKhmcayfgwyFnn1clgDQO3vAUrfELmDSp28pWnLBhuRrFwBUuzW6DjafUjO20tKIg
	RzkmMes4MNK6ZIeKXi1Y9zDa0Hs1uLaF5yS5qvlzqRB57xenJ5788mdEVH9immUVnsdz9b
	/FJGnkBeYel8Y3FRdOQ8N4r+pGAa2bbO3AEkTlfCUHD0BtTFo4Nsobfop5VY3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>,  "Michael Walle"
 <mwalle@kernel.org>,  "Pratyush Yadav" <pratyush@kernel.org>,  "Richard
 Weinberger" <richard@nod.at>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  sashiko-reviews@lists.linux.dev,  "Steam
 Lin" <STLin2@winbond.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 10/17] mtd: spi-nor: winbond: Prepare the
 introduction of W35TxxNW parts
In-Reply-To: <20261004214530.837371F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 04 Oct 2026 21:45:30
	+0000")
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
	<20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
	<20261004214530.837371F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 18:22:40 +0200
Message-ID: <87qzhtvacv.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_092253_213055_FEF0AE06 
X-CRM114-Status: GOOD (  12.06  )
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

T24gMDQvMTAvMjAyNiBhdCAyMTo0NTozMCBHTVQsIHNhc2hpa28tYm90QGtlcm5lbC5vcmcgd3Jv
dGU6Cgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3
IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNvbnNpZGVyOgo+IC0gW0hpZ2hdIG10ZDog
c3BpLW5vcjogd2luYm9uZDogbWlzc2luZyBGbGFnIFJlZ2lzdGVyIHBvbGxpbmcgaWdub3JlcyBQ
L0UgZXJyb3JzCj4gLS0KPgo+IGNvbW1pdCBlZWYxYmRhZTk3YmY4ZWM2YzVlZThmNDdmMjM1OGNj
NDM1MWUyNThiCj4gQXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgo+Cj4gbXRkOiBzcGktbm9yOiB3aW5ib25kOiBQcmVwYXJlIHRoZSBpbnRyb2R1Y3Rpb24g
b2YgVzM1VHh4TlcgcGFydHMKPgo+IFRoaXMgY29tbWl0IHByZXBhcmVzIGZvciBhIG5ldyBvY3Rh
bCBEVFIgZmFtaWx5IGJ5IGFkZGluZyBjYWxsYmFja3MgZm9yIG9jdGFsCj4gRFRSIG1vZGVzIGFu
ZCBkdW1teSBjeWNsZXMgY29uZmlndXJhdGlvbi4gSXQgYWxzbyBtZW50aW9ucyB0aGVzZSBjaGlw
cyBmZWF0dXJlCj4gU0VDREVDIGFuZCBsYWNrIFNSMiwgYnV0IHRoZXkgZG8gaGF2ZSBhIGZsYWcg
cmVnaXN0ZXIuCj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5j
IGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPj4gaW5kZXggNTFmNmJjZDNmOGU1Yi4u
MDU4YTI5NTFjMTg0ZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25k
LmMKPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMKPj4gQEAgLTExLDYgKzEx
LDEzIEBACj4+ICAjZGVmaW5lIFdJTkJPTkRfTk9SX09QX1JERUFSCTB4YzgJLyogUmVhZCBFeHRl
bmRlZCBBZGRyZXNzIFJlZ2lzdGVyICovCj4+ICAjZGVmaW5lIFdJTkJPTkRfTk9SX09QX1dSRUFS
CTB4YzUJLyogV3JpdGUgRXh0ZW5kZWQgQWRkcmVzcyBSZWdpc3RlciAqLwo+PiAgI2RlZmluZSBX
SU5CT05EX05PUl9PUF9TRUxESUUJMHhjMgkvKiBTZWxlY3QgYWN0aXZlIGRpZSAqLwo+PiArI2Rl
ZmluZSBXSU5CT05EX05PUl9PUF9XUl9WQ1IJMHg4MQkvKiBXcml0ZSBWQ1IgcmVnaXN0ZXJzICov
Cj4+ICsjZGVmaW5lICAgV0lOQk9ORF9OT1JfVkNSX0lPX01PREVfQ0ZHX1JFRyAweDAwIC8qIElP
IG1vZGUgY29uZmlndXJhdGlvbiBhZGRyZXNzIChWQ1IpICovCj4+ICsjZGVmaW5lICAgICBXSU5C
T05EX05PUl9WQ1JfSU9fTU9ERV9TU0RSIDB4RkYKPj4gKyNkZWZpbmUgICAgIFdJTkJPTkRfTk9S
X1ZDUl9JT19NT0RFX09ERFIgMHhFNwo+PiArI2RlZmluZSAgIFdJTkJPTkRfTk9SX1ZDUl9EVU1N
WV9DRkdfUkVHIDB4MDEgLyogRHVtbXkgY3ljbGUgY29uZmlndXJhdGlvbiBhZGRyZXNzIChWQ1Ip
ICovCj4+ICsjZGVmaW5lIFdJTkJPTkRfTk9SX09QX1JEX0ZSCTB4NzAJLyogUmVhZCBGbGFnIHJl
Z2lzdGVycyAqLwo+PiArI2RlZmluZSBXSU5CT05EX05PUl9PUF9DTF9GUgkweDUwCS8qIENsZWFy
IEZsYWcgcmVnaXN0ZXJzICovCj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gQXJlIHRoZXNlIGZsYWcg
cmVnaXN0ZXIgb3Bjb2RlcyBvbWl0dGVkIGZyb20gdGhlIGRyaXZlciBsb2dpYz8KCkknbGwgZHJv
cCB0aGVzZS4KCj4+ICtzdGF0aWMgaW50IHdpbmJvbmRfdzM1dHh4bndfbm9yX2xhdGVfaW5pdChz
dHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiArewo+PiArCW5vci0+cGFyYW1zLT5zZXRfb2N0YWxfZHRy
ID0gd2luYm9uZF93MzV0eHhud19ub3Jfc2V0X29jdGFsX2R0cjsKPj4gKwlub3ItPnBhcmFtcy0+
c2V0X2R1bW15ID0gd2luYm9uZF93MzV0eHhud19ub3Jfc2V0X2R1bW15Owo+PiArCW5vci0+cGFy
YW1zLT5vcGNvZGVzLnJlYWRfc3IyID0gMDsKPj4gKwlub3ItPnBhcmFtcy0+b3Bjb2Rlcy53cml0
ZV9zcjFfYW5kX3NyMiA9IDA7Cj4KPiBbU2V2ZXJpdHk6IEhpZ2hdCj4gU2hvdWxkIGEgY3VzdG9t
IHJlYWR5IGNhbGxiYWNrIGJlIGFzc2lnbmVkIGhlcmUgdG8gcG9sbCB0aGUgRmxhZyBSZWdpc3Rl
cj8KPgo+IFNpbmNlIG5vIGN1c3RvbSBjYWxsYmFjayBpcyBhc3NpZ25lZCwgdGhlIGRyaXZlciBm
YWxscyBiYWNrIHRvIHRoZSBkZWZhdWx0Cj4gc3BpX25vcl9zcl9yZWFkeSwgd2hpY2ggb25seSBj
aGVja3MgdGhlIFNSMSBXSVAgYml0IGFuZCBkb2VzIG5vdCBjaGVjayB0aGUgCj4gRmxhZyBSZWdp
c3RlciBmb3IgZXJyb3JzLgoKVGhlIHJlYWR5IGNhbGxiYWNrIGlzIG5vdCBoZXJlIGZvciB0aGF0
LiBJdCBzaGFsbCBqdXN0IHJldHVybiBvbmNlIHRoZQpvcGVyYXRpb24gaXMgZG9uZSwgcmVnYXJk
bGVzcyBvZiBpdHMgc3VjY2Vzcy4KCldoYXQgSSBoYXZlIGluIG1pbmQgaXMgdG8gbWF5YmUsIGlm
IEkgY29udGludWUgdGhlIEVDQyByb3V0ZSwgdG8gb3Blbgp0aGUgd2F5IGZvciBuZXcgY2FsbGJh
Y2tzIGFsbG93aW5nIHRvIGNoZWNrIHRoZSB2YWxpZGl0eSBvZiB0aGUgZGF0YQooU0VDREVDKSBh
ZnRlciByZWFkcywgZXJhc2VzIGFuZCB3cml0ZXMsIHJlcG9ydCBjb3JyZWN0ZWQgYml0ZmxpcHMg
d2hlbgpwb3NzaWJsZSwgYnV0IGFsc28gd2h5IG5vdCBtYWtlIGZ1bGwgbWVtb3J5IHJhbmdlcyBj
aGVja3MgYW5kIGZ1bGx5IHVzZQp0aGUgRmxhZyBSZWdpc3RlciAob3IgbGV0IHRoYXQgdG8gYmUg
ZG9uZSBieSB1YmloZWFsdGhkLCBJIGRvbid0IGtub3cKeWV0KS4KCkJ1dCBmb3Igbm93IGxldCdz
IGZvY3VzIG9uIGJhc2ljIHN1cHBvcnQuCgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
