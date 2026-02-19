Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC0FE9A03B
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Feb 2026 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEtSMjb331EYk0pbN77rJ3kl9Z2RIJujNRRshYjXYFg=; b=evhNLAIR5FdWYp
	PeRkHXYcYn3exD6nbzC14QcaufRmHrPbM1eHwx2fRwyXzaftSnTqX1oBrlMrsgdTXrAPI9Z1P3Pof
	MKJ795hT4ZBtKwBRA+u5jKT3X2TMGX7DH8mCbgAIz2PHsg2o3SXq4NjMXy0Ln4l7VSkRgUTGUURF1
	s/sUe7X60lwb8I4DYuPsalz2EIub7pUhtV5ixwOt6oTSAtzgA+CX9PqTeKVEcPfHjEhlEXvrYGslc
	ZPck0AsoXT+/wFn/MaiKX/2hzCN2QCi0ZOiEKPfA1+rNGQn1FAKdMMI4DajlgV2JrhD5xp5KQCWln
	5pITM2zZOHgFgoWiOLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1JA-0000000BE8T-0XaW;
	Thu, 19 Feb 2026 10:30:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1J7-0000000BE7y-1r63
	for linux-mtd@lists.infradead.org;
	Thu, 19 Feb 2026 10:30:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39C64C2F4EF;
	Thu, 19 Feb 2026 10:31:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D766E5FB45;
	Thu, 19 Feb 2026 10:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C35910368C91;
	Thu, 19 Feb 2026 11:30:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771497044; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=x5h6dSzaRazgNOk4NVSUO9wlD+x70M8Q2BQei2ERMhM=;
	b=Booxv9PbJN7mvEol1b8efv6ZI0Uqn4d8M8SzKeniy2eAuYg+MSzDsNwj9/1/oGC7PRtGuT
	gMrHMl4ZE0kGFFTlsFe6q0Cj5SD6I1WHrtv2g/d021QaKUwIbxsB06n0i7dMbg7Ph1peiG
	P+H/PuqvWmQ0GKtFfFVLYfVOtCXwrpZ5LDz/7VgWjKuHw4LZbLpCVoOZxDMcmtJ2Q0EnHA
	j1ObB0AOFn28+dnynxDS0pYIMx2mX73wn4v7/axwNgd9DK7Gp7MMC+gfEcE9JvaUkwRIKD
	TQXizrbkuOUWECOPiVgu2ZpmLjGinlG627DAuRM3PNfJhGiY301vkMcjRd2InA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
In-Reply-To: <fcdeadca-5bd4-4b03-8076-34d6cad940cc@ti.com> (Santhosh Kumar
	K.'s message of "Wed, 18 Feb 2026 23:37:59 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-10-s-k6@ti.com> <87bji3gkda.fsf@bootlin.com>
	<012a44f3-973f-4f34-be69-286cf924a6c6@ti.com>
	<87a4xdxdht.fsf@bootlin.com>
	<fcdeadca-5bd4-4b03-8076-34d6cad940cc@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 19 Feb 2026 11:30:38 +0100
Message-ID: <87cy21t48h.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_023053_621124_66BBBCE4 
X-CRM114-Status: GOOD (  13.72  )
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

SGVsbG8sCgo+Pj4+IFRoaXMgaXMgdGhlIHNlY29uZCAoYW5kIGxhc3QpIG1haW4gaXNzdWUgSSBo
YXZlIHdpdGggdGhlIHNlcmllcyBhcyBpdAo+Pj4+IGlzCj4+Pj4gcmlnaHQgbm93LiBXZSBjYW5u
b3Qgc2V0IHRoaXMgdHlwZSBvZiBmcmVxdWVuY3kgaW4gdGhlIGRyaXZlciBJTU8sIGl0IGlzCj4+
Pj4gdG9vIGJvYXJkIHNwZWNpZmljLgo+Pj4+IFdlIGN1cnJlbnRseSBoYXZlIGEgRFQgcHJvcGVy
dHkgZm9yIHRoZSBTUEkgbWF4aW11bSBzdXBwb3J0ZWQKPj4+PiBmcmVxdWVuY3kuIEkgYmVsaWV2
ZSB0aGlzIGlzIG5vIGxvbmdlciBlbm91Z2guIFdoeSBub3QgbWFraW5nIHRoaXMKPj4+PiBmcmVx
dWVuY3kgcHJvcGVydHkgYW4gYXJyYXk/IEZpcnN0IGZyZXF1ZW5jeSB3b3VsZCBiZSB0aGUgZGVm
YXVsdCwKPj4+PiBub24gdHVuZWQgbWF4aW11bSBmcmVxdWVuY3kuIFRoZSBzZWNvbmQgd291bGQg
YmUgdGhlIG1heGltdW0gZnJlcXVlbmN5Cj4+Pj4gcmVhY2hhYmxlIHdoZW4gdHVuaW5nIHRoZSBQ
SFkuCj4+Pgo+Pj4gSWYgdGhlIGNvbmNlcm4gaXMgb25seSBhYm91dCB3aGVyZSB0aGlzIGlzIHNl
dCwgd2UgY291bGQgaW50cm9kdWNlIGEgRFQKPj4+IHByb3BlcnR5IHN1Y2ggYXMgIm5vbi1waHkt
bWF4LWZyZXEiIHRvIGNhcnJ5IHRoaXMgaW5mb3JtYXRpb24uIFRoaXMKPj4+IHdvdWxkIGFsbG93
IHVzIHRvIGF2b2lkIGFueSBjaGFuZ2VzIHRvIHRoZSBleGlzdGluZyAic3BpLW1heC1mcmVxdWVu
Y3kiCj4+PiBoYW5kbGluZy4gTGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cyBvbiB0aGlzLgo+PiBO
YW1pbmcgaXMgZGlmZmljdWx0LCBub24tcGh5LW1heC1mcmVxIGlzIHRvbyBUSSBzcGVjaWZpYy4g
SSB3YXMKPj4gcHJvcG9zaW5nIHRoZSBldm9sdXRpb24gb2Ygc3BpLW1heC1mcmVxdWVuY3kgYmVj
YXVzZSBpdCBpcyBiYWNrd2FyZAo+PiBjb21wYXRpYmxlLiBUaGUgbmFtaW5nIGNhbiBiZSBkaXNj
dXNzZWQgYWZ0ZXIgeW91IHNlbmQgYSBwcm9wb3NhbCwgYnV0Cj4+IGRvIG5vdCBpbmNsdWRlICJu
b24tcGh5IiBpbiBpdC4gSXQgc2hhbGwgcmVmbGVjdCB0aGUgZmFjdCB0aGF0IHdpdGggZmluZQo+
PiB0dW5pbmcgd2UgY2FuIHJlYWNoIGhpZ2hlciBmcmVxdWVuY2llcyBvbiBjZXJ0YWluIG9wZXJh
dGlvbnMuCj4KPiBJIHRyaWVkIHlvdXIgc3VnZ2VzdGlvbiBvZiBrZWVwaW5nIGFuIGFycmF5IG9m
IGZyZXF1ZW5jaWVzIGluCj4gc3BpLW1heC1mcmVxdWVuY3k6Cj4KPiBzcGktbWF4LWZyZXF1ZW5j
eSA9IDwyNTAwMDAwMCAxNjYwMDAwMDA+Owo+ICAgICAgICAgICAgICAgICAgIChub25fcGh5X2Zy
ZXEgcGh5X2ZyZXEpCj4KPiBhbmQgdXBkYXRpbmcgbWF4X3NwZWVkX2h6IHdpdGggcGh5X2ZyZXEg
b25jZSB0dW5pbmcgc3VjY2VlZHMuCj4KPiBCYWQgbmV3cyEgdGhpcyBkb2Vzbid0IHNlZW0gdG8g
d29yayBhcyB3ZSBleHBlY3RlZC4gVGhlCj4gcmVhZF9vcC0+bWF4X2ZyZXEgZm9yIGJvdGggTk9S
IGFuZCBOQU5EIGlzIGluaXRpYWxseSBzZXQgdG8KPiBub25fcGh5X2ZyZXEsIGFuZCBpdCBkb2Vz
IG5vdCBhcHBlYXIgdG8gYmUgdXBkYXRlZCBhZ2FpbiBieQo+IGFkanVzdF9vcF9mcmVxKCkgYWZ0
ZXIgdHVuaW5nIGNvbXBsZXRlcyBhcyB0aGUgaWYgY2FzZSBmYWlscy4KClllcywgbm9uZSBvZiB0
aGUgY29yZSBwYXJ0cyBhcmUgcmVhZHkgZm9yIHRoaXMsIHdlIG1heSBuZWVkIGV4dHJhIGxvZ2lj
CnRvIGhhbmRsZSB0aGlzIGdyYWNlZnVsbHkuIEJ1dCB3aXRoIHN1Y2ggYW4gb3B0aW9uLCBvbmNl
IHR1bmluZyBoYXMKaGFwcGVuZWQsIHRoZSBjb3JlIGNvdWxkIHVzZSB0aGUgY29ycmVjdCBmcmVx
dWVuY3kgZm9yIGVhY2ggb3BlcmF0aW9uPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
