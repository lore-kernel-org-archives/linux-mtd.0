Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85E860A2609
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rIQi1RH/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2w4IsVbA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mh0ilp5mU1FqpZNZ5GLB3w5OuRU2+oSxrJk1zARcV4o=; b=rIQi1RH/EE7sIZUtZDcaVm5QIn
	k9BvAIKqAoOsaQalfBOPuRyM4nEpzYb5iC7JYXTXk2Q6yI5m7Y/lVVuYrd9w6hzZnIERLKa9iAdYM
	Fw1HBVulMSccNak5YaVZSsJdSBciShDkYDCVPQ6qukM1k6r3tkMsEEvUykxXpIlyDpyVeJf/f6cIW
	glu/bhzhPb7Z1MV0uDZyksi5UdsQ7Iv9y2eAJjI8vaLeOeJkVmGvc5N466A8RM+GcrfEPrd9wN/kh
	97aLZhqyKzJCHq3qtthWvrKbsi16rLKA8a7qFmoW6W6uCWl4BTrr+YL09JtLa5N3F24sJbGNG02dJ
	YBgZ5SWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOVp-0000000F55R-01Gh;
	Fri, 20 Nov 2026 13:18:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOVm-0000000F54z-0DRB
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 13:18:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 51A4B1A1748;
	Fri, 20 Nov 2026 13:18:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23B7E601B9;
	Fri, 20 Nov 2026 13:18:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7854611BC017C;
	Fri, 20 Nov 2026 14:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795180718; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=61GJjhwg5oOvms+aARYdro5wTTJ4sOIsLi6nvULglvA=;
	b=2w4IsVbAQRTkTGYemx/0oRtViPXyOE0KkUbuv49VjBXdHmRnPbyS1I4C6rx05vpF1EplHc
	D8fvFnixkqXgxca4MrcWmjcaALBKSrjssO0IxbFZ8nNzRaG4p2qzu7MJSEGc1OFRiALigY
	0Rd83VmxTlqCDNOULfTWF1ALyNMWv8B39GvcIZXHdBL0wW3HbvBrMOMY2o1peBxbygRZEa
	/L8gjADasA2YHLR8a61gDVbCxZ5aIRWqKh192/PKhkGHSD3Pfk9AHdUAqPfKX49PqsKHwn
	sG2A1VNhg4rqYlgwHt7kdny058RU0UvQc1P3YcEiO+Qk02o9dhTTN4hP7MPm5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <pratyush@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,
  <sebin.francis@ti.com>,  <u-kumar1@ti.com>,
  <srikanth.boyapally@amd.com>,  <m-shah@ti.com>
Subject: Re: [PATCH v11 00/19] spi: cadence-quadspi: add PHY tuning support
In-Reply-To: <DN01ZL81VTHB.3PB0JO4WI6WU0@kernel.org> (Michael Walle's message
	of "Fri, 20 Nov 2026 13:56:44 +0100")
References: <20261105105832.2134313-1-s-k6@ti.com>
	<DN01ZL81VTHB.3PB0JO4WI6WU0@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 20 Nov 2026 14:18:31 +0100
Message-ID: <87cxrzbpzs.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_051842_241464_F5D04CE5 
X-CRM114-Status: GOOD (  12.13  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMjAvMTEvMjAyNiBhdCAxMzo1Njo0NCArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUgTm92IDUsIDIwMjYgYXQgMTE6NTggQU0gQ0VULCBT
YW50aG9zaCBLdW1hciBLIHdyb3RlOgo+PiBUaGlzIHNlcmllcyBpbXBsZW1lbnRzIFBIWSB0dW5p
bmcgc3VwcG9ydCBmb3IgdGhlIENhZGVuY2UgUVNQSSBjb250cm9sbGVyCj4+IHRvIGVuYWJsZSBy
ZWxpYWJsZSBoaWdoLXNwZWVkIG9wZXJhdGlvbnMuIFdpdGhvdXQgUEhZIHR1bmluZywgY29udHJv
bGxlcnMKPj4gdXNlIGNvbnNlcnZhdGl2ZSB0aW1pbmcgdGhhdCBsaW1pdHMgcGVyZm9ybWFuY2Uu
IFBIWSB0dW5pbmcgY2FsaWJyYXRlcwo+PiBSWC9UWCBkZWxheSBsaW5lcyB0byBmaW5kIG9wdGlt
YWwgZGF0YSBjYXB0dXJlIHRpbWluZyB3aW5kb3dzLCBlbmFibGluZwo+PiBvcGVyYXRpb24gdXAg
dG8gdGhlIGNvbnRyb2xsZXIncyBtYXhpbXVtIGZyZXF1ZW5jeS4KPj4KPj4gQmFja2dyb3VuZDoK
Pj4gSGlnaC1zcGVlZCBTUEkgbWVtb3J5IGNvbnRyb2xsZXJzIHJlcXVpcmUgcHJlY2lzZSB0aW1p
bmcgY2FsaWJyYXRpb24gZm9yCj4+IHJlbGlhYmxlIG9wZXJhdGlvbi4gQXQgaGlnaGVyIGZyZXF1
ZW5jaWVzLCBib2FyZC10by1ib2FyZCB2YXJpYXRpb25zIG1ha2UKPj4gZml4ZWQgdGltaW5nIHBh
cmFtZXRlcnMgaW5hZGVxdWF0ZS4gVGhlIENhZGVuY2UgUVNQSSBjb250cm9sbGVyIGluY2x1ZGVz
Cj4+IGEgUEhZIGludGVyZmFjZSB3aXRoIHByb2dyYW1tYWJsZSBkZWxheSBsaW5lcyAoMC0xMjcg
dGFwcykgZm9yIFJYIGFuZCBUWAo+PiBwYXRocywgYnV0IHRoZXNlIHJlcXVpcmUgcnVudGltZSBj
YWxpYnJhdGlvbiB0byBmaW5kIHRoZSB2YWxpZCB0aW1pbmcKPj4gd2luZG93Lgo+Pgo+PiBBcHBy
b2FjaDoKPj4gQWRkIFNEUi9ERFIgUEhZIHR1bmluZyBhbGdvcml0aG1zIGZvciB0aGUgQ2FkZW5j
ZSBjb250cm9sbGVyOgo+Pgo+PiBTRFIgTW9kZSBUdW5pbmcgKDFEIHNlYXJjaCk6Cj4+ICAtIFNl
YXJjaGVzIGZvciB0d28gY29uc2VjdXRpdmUgdmFsaWQgUlggZGVsYXkgd2luZG93cwo+PiAgLSBT
ZWxlY3RzIHRoZSBsYXJnZXIgd2luZG93IGFuZCB1c2VzIGl0cyBtaWRwb2ludCBmb3IgbWF4aW11
bSBtYXJnaW4KPj4gIC0gVFggZGVsYXkgZml4ZWQgYXQgbWF4aW11bSAoMTI3KSBhcyBpdCdzIGxl
c3MgY3JpdGljYWwgaW4gU0RSCj4+Cj4+IEREUiBNb2RlIFR1bmluZyAoMkQgc2VhcmNoKToKPj4g
IC0gRmluZHMgUlggYm91bmRhcmllcyAocnhsb3cvcnhoaWdoKSB1c2luZyBUWCB3aW5kb3cgc3dl
ZXBzCj4+ICAtIEZpbmRzIFRYIGJvdW5kYXJpZXMgKHR4bG93L3R4aGlnaCkgYXQgZml4ZWQgUlgg
cG9zaXRpb25zCj4+ICAtIERlZmluZXMgdmFsaWQgcmVnaW9uIGNvcm5lcnMgYW5kIGRldGVjdHMg
Z2FwcyB2aWEgYmluYXJ5IHNlYXJjaAo+PiAgLSBBcHBsaWVzIHRlbXBlcmF0dXJlIGNvbXBlbnNh
dGlvbiBmb3Igb3B0aW1hbCBwb2ludCBzZWxlY3Rpb24KPj4gIC0gSGFuZGxlcyBzaW5nbGUgb3Ig
ZHVhbCBwYXNzaW5nIHJlZ2lvbnMgd2l0aCBkaWZmZXJlbnQgc3RyYXRlZ2llcwo+Pgo+PiBQYXRj
aCBkZXNjcmlwdGlvbjoKPj4gSW5mcmFzdHJ1Y3R1cmUgKDEtNSk6Cj4+ICAtIFBhdGNoIDE6ICAg
QWRkIHNwaS1tYXgtcG9zdC1jb25maWctZnJlcXVlbmN5LWh6IHRvIGRlc2NyaWJlIG1heGltdW0K
Pj4gICAgICAgICAgICAgICBmcmVxdWVuY3kgYWNoaWV2YWJsZSBwb3N0IGNvbnRyb2xsZXIgY29u
ZmlndXJhdGlvbgo+PiAgLSBQYXRjaCAyOiAgIEFkZCBzcGktcGh5LXBhdHRlcm4tcGFydGl0aW9u
IHBoYW5kbGUgZm9yCj4+ICAgICAgICAgICAgICAgTk9SIGZsYXNoIFBIWSB0dW5pbmcgcGF0dGVy
biBsb2NhdGlvbgo+PiAgLSBQYXRjaCAzOiAgIFBhcnNlIHNwaS1tYXgtcG9zdC1jb25maWctZnJl
cXVlbmN5LWh6IGluIHNwaS5jOyBhZGRzCj4+ICAgICAgICAgICAgICAgc3BpX2RldmljZS5wb3N0
X2NvbmZpZ19tYXhfc3BlZWRfaHogKDAgd2hlbiBub3Qgc2V0Cj4+ICAgICAgICAgICAgICAga2Vl
cGluZyBhbGwgZXhpc3RpbmcgRFQgZnVsbHkgY29tcGF0aWJsZSkKPj4gIC0gUGF0Y2ggNDogICBF
eHRlbmQgc3BpX21lbV9hZGp1c3Rfb3BfZnJlcSgpIHdpdGggYSBieXBhc3M6IGlmCj4+ICAgICAg
ICAgICAgICAgb3AtPm1heF9mcmVxIGVxdWFscyBwb3N0X2NvbmZpZ19tYXhfc3BlZWRfaHosIHJl
dHVybgo+PiAgICAgICAgICAgICAgIGltbWVkaWF0ZWx5IGxlYXZpbmcgb3AtPm1heF9mcmVxIHVu
Y2hhbmdlZC4gQWxsIG90aGVyCj4+ICAgICAgICAgICAgICAgb3BzIGFyZSBjYXBwZWQgdG8gbWF4
X3NwZWVkX2h6LiBBbHNvIHJlcXVpcmUgcGVyX29wX2ZyZXEKPj4gICAgICAgICAgICAgICBjb250
cm9sbGVyIGNhcGFiaWxpdHkgZm9yIHBvc3QtY29uZmlnIG9wcyBpbgo+PiAgICAgICAgICAgICAg
IHNwaV9tZW1fZGVmYXVsdF9zdXBwb3J0c19vcCgpCj4+ICAtIFBhdGNoIDU6ICAgQWRkIGV4ZWN1
dGVfdHVuaW5nIGNhbGxiYWNrIHRvIHNwaV9jb250cm9sbGVyX21lbV9vcHMgYW5kCj4+ICAgICAg
ICAgICAgICAgc3BpX21lbV9leGVjdXRlX3R1bmluZygpIHdyYXBwZXIgaW4gU1BJLU1FTSBjb3Jl
Owo+PiAgICAgICAgICAgICAgIHNlcmlhbGlzZXMgYWNjZXNzIHZpYSBzcGlfbWVtX2FjY2Vzc19z
dGFydC9lbmQgYW5kCj4+ICAgICAgICAgICAgICAgcmVqZWN0cyBHUElPIGNoaXAgc2VsZWN0cwo+
Pgo+PiBDYWRlbmNlIFFTUEkgSW1wbGVtZW50YXRpb24gKDYtMTQpOgo+PiAgLSBQYXRjaCA2OiAg
IE1vdmUgY3FzcGlfcmVhZGRhdGFfY2FwdHVyZSgpIGVhcmxpZXIgKHByZXBhcmF0b3J5KQo+PiAg
LSBQYXRjaCA3OiAgIEFkZCBEUVMgYml0IHRvIGNxc3BpX3JlYWRkYXRhX2NhcHR1cmUoKSAocHJl
cGFyYXRvcnkpCj4+ICAtIFBhdGNoIDg6ICAgQWRkIGNvbXBsZXRlIFBIWSB0dW5pbmcgc3VwcG9y
dDogRExMIG1hbmFnZW1lbnQsIHBhdHRlcm4KPj4gICAgICAgICAgICAgICB2ZXJpZmljYXRpb24g
KE5PUiB2aWEgc3BpLXBoeS1wYXR0ZXJuLXBhcnRpdGlvbiBwaGFuZGxlLAo+PiAgICAgICAgICAg
ICAgIE5BTkQgdmlhIHdyaXRlLXRvLWNhY2hlKSwgU0RSIDFEIGFuZCBERFIgMkQgc2VhcmNoCj4+
ICAgICAgICAgICAgICAgYWxnb3JpdGhtcyB3aXRoIHRlbXBlcmF0dXJlIGNvbXBlbnNhdGlvbiwg
QU02NTQtc3BlY2lmaWMKPj4gICAgICAgICAgICAgICBleGVjdXRlX3R1bmluZyBlbnRyeSBwb2lu
dAo+PiAgLSBQYXRjaCA5OiAgIFJlamVjdCAyLWJ5dGUtYWRkcmVzcyBERFIgb3BlcmF0aW9ucyB2
aWEgYSBuZXcKPj4gICAgICAgICAgICAgICBDUVNQSV9OT19QSFlfVFVOSU5HX1dJVEhfT0REUl8y
Ql9BRERSIHF1aXJrIGZsYWcgdG8gd29yawo+PiAgICAgICAgICAgICAgIGFyb3VuZCBBTTY1NCBP
U1BJIGVycmF0dW0gaTIzODMKPj4gIC0gUGF0Y2ggMTA6ICBSZWZhY3RvciBkaXJlY3QgcmVhZCBw
YXRoIGZvciBQSFkgc3VwcG9ydCAocHJlcGFyYXRvcnkpCj4+ICAtIFBhdGNoIDExOiAgRW5hYmxl
IFBIWSBmb3IgZGlyZWN0IHJlYWRzIGF0IHRoZSBjYWxpYnJhdGVkIGZyZXF1ZW5jeQo+PiAgICAg
ICAgICAgICAgIHdoZW4gYm90aCB0cmFuc2ZlciBib3VuZGFyaWVzIGFyZSAxNi1ieXRlIGFsaWdu
ZWQsCj4+ICAgICAgICAgICAgICAgZmFsbGluZyBiYWNrIHRvIG5vbi1QSFkgRE1BIG90aGVyd2lz
ZTsgYWxzbyByZXByb2dyYW1zCj4+ICAgICAgICAgICAgICAgRExMIG9uIGNoaXAtc2VsZWN0IHN3
aXRjaCB3aGVuIHR3byBkZXZpY2VzIGhhdmUKPj4gICAgICAgICAgICAgICBkaWZmZXJlbnQgY2Fs
aWJyYXRlZCBzZXR0aW5ncwo+PiAgLSBQYXRjaCAxMjogIEVuYWJsZSBQSFkgZm9yIGluZGlyZWN0
IHdyaXRlcyBvZiBhdCBsZWFzdAo+PiAgICAgICAgICAgICAgIENRU1BJX1BIWV9NSU5fSU5ESVJF
Q1RfV1JJVEVfTEVOIGJ5dGVzCj4+ICAtIFBhdGNoIDEzOiAgUmVwcm9ncmFtIHBlci1kZXZpY2Ug
Q1MgdGltaW5nIG9uIGFueSBjaGlwLXNlbGVjdCBzd2l0Y2gKPj4gIC0gUGF0Y2ggMTQ6ICBSZXBy
b2dyYW0gdGhlIFBIWSBETEwgKG1hc3RlciBjb25maWcgYW5kIFJYL1RYIHRhcHMpIG9uCj4+ICAg
ICAgICAgICAgICAgcnVudGltZSByZXN1bWUsIHNpbmNlIHRoZSBETEwgbG9zZXMgaXRzIGxvY2sg
d2hlbiB0aGUKPj4gICAgICAgICAgICAgICBPU1BJIGNvbnRyb2xsZXIgaXMgcG93ZXItZ2F0ZWQK
Pj4KPj4gTVREIGNvcmUgKDE1LTE5KToKPj4gIC0gUGF0Y2ggMTU6ICBFeHRyYWN0IHNwaW5hbmRf
c2VsZWN0X29wX3ZhcmlhbnQoKSBpbnRvIGEgc2hhcmVkIGhlbHBlcgo+PiAgICAgICAgICAgICAg
IHNwaW5hbmRfb3BfZmluZF9iZXN0X3ZhcmlhbnQoKSB3aXRoIGEgc2tpcF9tYXNrCj4+ICAtIFBh
dGNoIDE2OiAgTmVnb3RpYXRlIG9wdGltYWwgY29udHJvbGxlciBvcGVyYXRpbmcgcG9pbnQgYmVm
b3JlIGRpcm1hcAo+PiAgICAgICAgICAgICAgIGNyZWF0aW9uOyBpdGVyYXRlIGFsbCByZWFkIHZh
cmlhbnRzIGluIHBlcmZvcm1hbmNlIG9yZGVyCj4+ICAgICAgICAgICAgICAgYWNyb3NzIE9EVFIg
YW5kIFNTRFIgaW50ZXJmYWNlczsgcmUtcGFpciBjb250X3JlYWRfY2FjaGUgYWZ0ZXIKPj4gICAg
ICAgICAgICAgICBQSFkgdHVuaW5nIHZpYSBwcm90b2NvbC1zaGFwZSBtYXRjaGluZwo+PiAgLSBQ
YXRjaCAxNzogIEV4dHJhY3Qgc3BpX25vcl9zcGltZW1fZ2V0X3JlYWRfb3AoKSBoZWxwZXIgKHBy
ZXBhcmF0b3J5KQo+PiAgLSBQYXRjaCAxODogIEV4ZWN1dGUgY29udHJvbGxlciBvcHRpbWl6YXRp
b24gaW4gc3BpX25vcl9wcm9iZSgpIGJlZm9yZQo+PiAgICAgICAgICAgICAgIGNyZWF0aW5nIGRp
cm1hcHMKPj4gIC0gUGF0Y2ggMTk6ICBSZXNldCBtYXhfcmVhZF9vcCBmcmVxdWVuY3kgZm9yIHNl
Y3VyaXR5IHJlZ2lzdGVyIHJlYWRzCj4KPiBTbyB3aGF0IGlzIHRoZSBtZXJnaW5nIHN0cmF0ZWd5
IGhlcmU/IEdldHRpbmcgdGhlIGZpcnN0IHBhcnRzIGluIGFuZAo+IHRoZW4gZ2V0dGluZyB0aGUg
c3BpbmFuZCBhbmQgc3BpX25vciBpbiBpbiB0aGUgbmV4dCBjeWNsZT8KCkFncmVlZC4KCj4gRldJ
VywgdGhlIHNwaS1ub3IgcGFydHMgbG9va3MgZ29vZC4KClNhbWUgZm9yIHRoZSBTUEkgTkFORCBi
aXRzLgoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
