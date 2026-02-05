Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C202ECD994
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 18:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bz1X+q4GRDmSrP6Z6hS4XFNEdJJ/IXEC9R9ACNen644=; b=fsu5gl+FZk6RcU
	Xf5SnLvIbA+Bi4OBn14NGz1Mcvb1CSQTzxOOprVOlZL3Q5gyUHyijEsf9UfF3Mv7Ib+xH5D7DcdCB
	QdEpj8woNT2VduVZWkJECoBgC9EPHyPt7NkbsBkqIxwDax398sGASADhFm9YLUzP0jiELVUFOH9JE
	sZQuDF1WgdfMT/nGhS4w3wZPFGPcLaIKkjtxH5uLHc1C6pzqJDalZXCOc/3wI1IR6Wk/tOsF5PDIi
	YIwOh0CVNX1KoElenmIQhPlAt4bIe0Nc5IZevcs4ocwXCuExQGczj48+7NOSdCLYhPfwsag1yT8gV
	wma3wG/RWIIIG1mvGVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3kW-0000000ALDI-49NX;
	Thu, 05 Feb 2026 18:06:40 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3kT-0000000ALCk-21Lf
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 18:06:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DB1FCC243B0;
	Thu,  5 Feb 2026 18:06:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FD956074D;
	Thu,  5 Feb 2026 18:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2926102F2A49;
	Thu,  5 Feb 2026 19:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770314793; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5zGV4Eo/lLwbXu9NHaompHv0eaeIUotj8YObgAjPRAA=;
	b=E6QMn7gb3JOFKlnXT+UHLYYdqWdbLczkCe1hemUj4Oz1z+NecQAvgWmwhCrkwfkzqYpicA
	kx4Ce5P84tfJml6Uztv7nDSN1D7App5IXj1xJC0p1A+QvmAj2fWcR2X68Yl/dPcb1WNLn+
	3RCFTiLLpNZLydCVSSW2WvyYbW1FB+8g8zFth8M7/x5OJzewCZRQpPv1dHDjCm8ZICBuGD
	HRJXdCdMMi5hTANnHtu9WLOfQO/J7e0Qj7hrNj6RffkMwNXEFnFe3LpjPIXZnfmydirDop
	YfZ7sWAkt8RaTY33KV9vbuQ+kzAJo2TEoMfK1dpaHHeOJ/trsa1RmcNe/ARxRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 01/12] spi: dt-bindings: add spi-has-dqs property
In-Reply-To: <ba78303e-36aa-4f40-9416-c22ff12b7458@ti.com> (Santhosh Kumar
	K.'s message of "Thu, 5 Feb 2026 23:16:47 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-2-s-k6@ti.com> <87wm0sg50q.fsf@bootlin.com>
	<ba78303e-36aa-4f40-9416-c22ff12b7458@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 19:06:30 +0100
Message-ID: <87ldh7f4k9.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_100637_671602_B9956777 
X-CRM114-Status: GOOD (  18.50  )
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

SGkgU2FudGhvc2gsCgo+PiBUaGlzIGluZm9ybWF0aW9uIGlzIGN1cnJlbnRseSBsYWNraW5nIGlu
ZGVlZCwgbW9zdGx5IGJlY2F1c2Ugbm9ib2R5Cj4+IGV2ZXIKPj4gY2FyZWQgYWJvdXQgaXQuIFRo
ZSBEVCBwcm9wZXJ0eSBpcyBJTU8gbm90IHRoZSBjb3JyZWN0IHdheSB0byBnaXZlIHRoaXMKPj4g
aW5mb3JtYXRpb24gZm9yIHR3byByZWFzb25zOgo+PiAtIHRoaXMgaXMgYSBjYXBhYmlsaXR5IG9m
IHRoZSBjaGlwLCB3ZSBkaXNjb3ZlciB0aGUgY2hpcCBkeW5hbWljYWxseSBpbgo+PiAgICBib3Ro
IGNhc2VzIChOQU5EIGFuZCBOT1IpIGFuZCBhdHRhY2ggbWFueSBjYXBhYmlsaXRpZXMgdG8gdGhl
IGNoaXBzCj4+ICAgIGFscmVhZHksIHNvIEkgYmVsaWV2ZSB0aGlzIGluZm9ybWF0aW9uIHNob3Vs
ZCBiZSBwcm92aWRlZCB0aHJvdWdoIGEKPj4gICAgZmxhZy4KPj4gLSB0aGUgZmFjdCB0aGF0IHRo
ZSBEUVMgc2lnbmFsIG1pZ2h0IGJlIHN1cHBvcnRlZCBkb2VzIG5vdCBpbmRpY2F0ZSBpdAo+PiAg
ICBpcyBhY3R1YWxseSBkcml2ZW4uIFdpbmJvbmQgY2hpcHMsIGZvciBpbnN0YW5jZSwgY2FuIGVp
dGhlciBlbmFibGUgaXQKPj4gICAgb3Igbm90IGRlcGVuZGluZyBvbiB0aGVpciBjb25maWd1cmF0
aW9uIChwcm9iYWJseSB0aHJvdWdoIHRoZWlyIFZDUgo+PiAgICByZWdpc3RlciwgSSBuZWVkIHRv
IGNoZWNrIGFnYWluKS4KPgo+IEkgYWdyZWUuIFRoZSBmbGFzaCBkZXZpY2UncyBjYXBhYmlsaXR5
IHRvIHByb3ZpZGUgRFFTIC0gd2hldGhlciBpbiBTRFIsCj4gRERSIG9yIGJvdGggbW9kZXMgLSBj
YW4gYmUgcmVwcmVzZW50ZWQgYXMgYSBmbGFnIGluIHRoZSBmbGFzaAo+IGRlc2NyaXB0aW9uLiBX
ZSBjYW4gbGlzdCBvdXQgdGhlIHBvc3NpYmxlIGNvbWJpbmF0aW9ucyBhbmQgdXNlIHRoZW0gdG8K
PiBjbGVhcmx5IGRlc2NyaWJlIHRoZSBmbGFzaCdzIHN1cHBvcnRlZCBjYXBhYmlsaXRpZXMuCj4K
PiBIb3dldmVyLCB3aGV0aGVyIHRoZSBEUVMgc2lnbmFsIGlzIGFjdHVhbGx5IGNvbm5lY3RlZCB0
byB0aGUgY29udHJvbGxlcgo+IGlzIGEgbm9uLWRpc2NvdmVyYWJsZSBoYXJkd2FyZSBkZXRhaWwg
YW5kIHNob3VsZCBiZSBkZXNjcmliZWQgb25seSB2aWEKPiBEZXZpY2UgVHJlZS4gVGhlIERUIHBy
b3BlcnR5IGlzIG5vdCBtZWFudCB0byBkZXNjcmliZSB0aGUgZmxhc2gncwo+IGNhcGFiaWxpdGll
cywgYnV0IHRvIGluZGljYXRlIHdoZXRoZXIgRFFTIGlzIHBoeXNpY2FsbHkgY29ubmVjdGVkIHRv
IHRoZQo+IGNvbnRyb2xsZXIuCj4KPj4gVGhlIHF1ZXN0aW9uIEkgaGF2ZSBpczogc2hhbGwgd2Ug
ZW5hYmxlIHRoZSBEUVMgcGluIGF1dG9tYXRpY2FsbHkgaWYKPj4gaXQKPj4gaXMgYXZhaWxhYmxl
PyBOb3QgYWxsIGNvbnRyb2xsZXJzIHN1cHBvcnQgaXQgSSBzdXBwb3NlLCBhbmQgd2lyaW5nIHRo
ZQo+PiBsaW5lIG1pZ2h0IGFzIHdlbGwgbm90IGJlIGRvbmUgKG9yIGluY29ycmVjdGx5KS4gRm9y
IHRoZXNlIGNhc2VzIHdlIG1heQo+PiBuZWVkIERUIHByb3BlcnRpZXMgaW4gdGhlIGZ1dHVyZS4g
QnV0IGZvciB0aGUgRFFTIHByZXNlbmNlIGluZGljYXRpb24sIEkKPj4gYmV0IGl0IGlzIG5vdCB1
c2VmdWwsIGFuZCBzaG91bGQgYmUgaGFuZGxlZCBhdCB0aGUgY29yZSBsZXZlbCAobm90Cj4+IHBh
cnNlZCBieSB0aGUgZHJpdmVyIGxpa2UgeW91IGRvKSBiZWNhdXNlIGl0IG1heSBoYXZlIGFuIGlt
cGFjdCBvbiB0aGUKPj4gY2hpcCBpbnRlcm5hbCBjb25maWd1cmF0aW9uLgo+Cj4gV2UgY2FuIGhh
bmRsZSB0aGlzIGluIGVpdGhlciB3YXk6IGtlZXAgRFFTIGRpc2FibGVkIGJ5IGRlZmF1bHQgYW5k
Cj4gZW5hYmxlIGl0IHVzaW5nIGEgImhhcy1kcXMiIHByb3BlcnR5LCBvciBlbmFibGUgaXQgYnkg
ZGVmYXVsdCBhbmQKPiBkaXNhYmxlIGl0IGV4cGxpY2l0bHkgdXNpbmcgYSAibm8tZHFzIiBwcm9w
ZXJ0eS4KCkkga25vdyB3ZSBjYW4gYmUgc3VycHJpc2VkIGJ5IG91ciBoYXJkd2FyZSBjb2xsZWFn
dWVzIDotKSwgYnV0IEkgd291bGQKY29uc2lkZXIgIm5vdCB3aXJpbmcgdGhlIERRUyBzaWduYWwg
b2YgYSAoRFFTIGNhcGFibGUpIG9jdGFsIERUUiBTUEkKbWVtb3J5IiBhIGJ1Zz8gSGVuY2UgSSB3
b3VsZCBvcHQgZm9yIGhhbmRsaW5nIHRoZSBicm9rZW4gY2FzZSwgd2hlbi9pZgp0aGF0IG5lZWQg
YXJpc2VzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
