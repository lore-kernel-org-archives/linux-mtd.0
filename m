Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70ABCEF48ED
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 09:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qExmFidqS659wTeV1ENqfkz2qDtwKx1pH96OXaAsz64=; b=ec3Ifao5Hhc4SR
	FmF3V8w61pvEvtIOO4VoyMRNein5vK/OFgLQsFyrt+L9L9Ltf+g7glm0EYz+bPxYqyBhO/gKKXgtK
	LQO7/P5wkwtZLDn/+hZH//5lUVhCRA6LADexAJTuVrZh4xWNtLUH/b0RmcybvNcqzzPXGcZxIrHoq
	OsFR2BZRyQDZJIT8Y7SbWHSuw9BySxivLmifcWS35C4fc0M8DCxhwBupf17vQH6B5tRoRaalJA/LN
	QARzAH/ZyDboMpshPnEihow/FztM10/X+z43BhZclQplXLoMvXJvoVfy4VMY4845d+9lfAgMY77Ga
	Gysu9kCX14/DUGkEtJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqp3X-00000003CtQ-1sIL;
	Fri, 13 Feb 2026 09:01:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqp3V-00000003CsI-0C92
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 09:01:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5A915C1E4A2;
	Fri, 13 Feb 2026 09:01:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2E35606CC;
	Fri, 13 Feb 2026 09:01:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D05910368D90;
	Fri, 13 Feb 2026 10:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770973292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rp1eDOIRhaqWCkYz+NWbK33lJyO3gCS1N2c/2rJWg/E=;
	b=ajnFwvybN/0XFrBUedxR74LHa2roePtEFDzO102eE0A34vTv8r/teN6VmAyqa5UaQ3PAS5
	nCSZFLxbHzsN0+Gwxsk0vV/Fc7Gp3KOXPPhgR8ATlUbvlAkNk1BRb9AFPJHWbKennAVtes
	zWj8QxYJpIFfqHx5V6o8iIA62QSD5hwxd8lacmpYG2mNdSFsf5m+bhEUXxzM205MJYcIQ2
	4Ac7speu6a2fbuuV1FGAoHu7eNwrOYxfnMXTCrKA9B6ng3mv46LV7UmvhFkMzbz4GyiELR
	hOn/psaAkqctQA8IQUKxZTjiRERWxnwFnwZh9sKNQ0ft1qzBvDK/fVTVembZKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 00/12] spi: cadence-quadspi: add PHY tuning support
In-Reply-To: <775d8dce-b567-4f21-963c-a843e409fea5@ti.com> (Santhosh Kumar
	K.'s message of "Sat, 7 Feb 2026 00:58:03 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<87343ghkek.fsf@bootlin.com> <87v7gbdwdh.fsf@bootlin.com>
	<775d8dce-b567-4f21-963c-a843e409fea5@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Feb 2026 10:01:28 +0100
Message-ID: <87y0kxvwyf.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_010141_229983_AC4A6CB0 
X-CRM114-Status: GOOD (  16.10  )
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

T24gMDcvMDIvMjAyNiBhdCAwMDo1ODowMyArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBPbiAwNS8wMi8yNiAyMToxOCwgTWlxdWVsIFJheW5hbCB3cm90ZToK
Pj4gSGkgU2FudGhvc2gsCj4+IAo+Pj4gSSBhbSBzdXJwcmlzZWQgYnkgdGhlc2UgbnVtYmVycywg
SSB3b3VsZCBleHBlY3QgdGhlc2UgdG8gZ2V0IGhpZ2hlciBmb3IKPj4+IFNQSSBOQU5Ecy4gSSB3
aWxsIHRlc3QgdGhlIHNlcmllcyBhbmQgcmVwb3J0IG15IG9ic2VydmF0aW9ucywgZXNwZWNpYWxs
eQo+Pj4gc2luY2UgdGhlcmUgaXMgYWxzbyBPRERSIFNQSSBOQU5EIHN1cHBvcnQgbm93IChpbiBu
YW5kL25leHQsIHNob3VsZCBiZQo+Pj4gcGFydCBvZiBteSB1cGNvbWluZyBtZXJnZSByZXF1ZXN0
IHRvIExpbnVzIGZvciA2LjE5KzEpOwo+PiBJIGp1c3QgdGVzdGVkIHRoZSBzZXJpZXMsIGhlcmUg
YXJlIHNvbWUgbnVtYmVycyBJIGdyYWJiZWQgb24gVEkgQU02MkE3Cj4+IExQIFNLIHdpdGggYSBX
aW5ib25kIFczNU4wMiBTUEkgTkFORCBjaGlwIChzbyBpbiB0aGUgZW5kIHZlcnkgY2xvc2UgdG8K
Pj4geW91ciByZXBvcnQpOgo+PiAgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0rCj4+ICAgfCBTUEkgTkFORCAgICAgICAgfCBubyB0dW5pbmcgfCBQSFkgdHVuaW5n
IHwKPj4gICB8IFVuaXQ6IE1pQi9zICAgICB8ICAgMjVNSHogICB8ICAgMTY2TUh6ICAgfAo+PiAg
IHwtLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0tLS18Cj4+ICAgfCBPY3Rh
bCBTRFIgcmVhZCAgfCAgIDEzLjggICAgfCAgICAzNC4yICAgIHwKPj4gICB8ICAgICAgICAgICB3
cml0ZSB8ICAgIDcuMiAgICB8ICAgIDEwLjIgICAgfAo+PiAgIHwtLS0tLS0tLS0tLS0tLS0tLSst
LS0tLS0tLS0tLSstLS0tLS0tLS0tLS18Cj4+ICAgfCBPY3RhbCBEVFIgcmVhZCAgfCAgIDIxLjIg
ICAgfCAgICAgTi9BICAgIHwKPj4gICB8ICAgICAgICAgICB3cml0ZSB8ICAgIDkuMCAgICB8ICAg
ICBOL0EgICAgfAo+PiAgICstLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0rCj4+IFBsZWFzZSBtaW5kIEkgdXNlZCBNaUIvcyBhbmQgbm90IE1CL3MgKHNvIGtpQiAvIDEw
MjQpLCBJIGRvbid0IGtub3cKPj4gd2hpY2ggb25lIHlvdSB1c2VkIGZvciBtZWFzdXJpbmcsIGFz
IHlvdSBtYXJrZWQgTUIsIHdoZXJlYXMgdGhlIG1vc3QKPj4gY29tbW9uIHVuaXQgc2VlbXMgdG8g
YmUgTWlCLgo+PiBIb3dldmVyIFBIWSB0dW5pbmcgZmFpbGVkIGluIE9jdGFsIERUUiBtb2RlICh5
b3VyIHNlcmllcyBhcHBsaWVkIG9uCj4+IHRvcAo+PiBvZiBuYW5kL25leHQpIHdpdGggdGhlIGZv
bGxvd2luZyBsb2dzLCBjYW4geW91IGhhdmUgYSBsb29rPwo+PiBbICAgIDIuMjYxNjQ3XSBzcGkt
bmFuZCBzcGkwLjA6IFdpbmJvbmQgU1BJIE5BTkQgd2FzIGZvdW5kLgo+PiBbICAgIDIuMjY2OTU2
XSBzcGktbmFuZCBzcGkwLjA6IDEyOCBNaUIsIGJsb2NrIHNpemU6IDI1NiBLaUIsIHBhZ2Ugc2l6
ZTogNDA5NiwgT09CIHNpemU6IDEyOAo+PiBbICAgIDIuMjg1MjU3XSBjYWRlbmNlLXFzcGkgZmM0
MDAwMC5zcGk6IFBIWSB0dW5pbmcgZmFpbGVkOiAtMgo+PiBbICAgIDIuMjkwODM1XSBzcGktbmFu
ZCBzcGkwLjA6IEZhaWxlZCB0byBleGVjdXRlIFBIWSB0dW5pbmc6IC0yCj4KPiBVbmZvcnR1bmF0
ZWx5LCBkdWUgdG8gYSBrbm93biBlcnJhdHVtIGluIHRoZSBDYWRlbmNlIGNvbnRyb2xsZXIsIFBI
WSBERFIKPiBtb2RlIGNhbm5vdCBiZSB1c2VkIHdpdGggMi1ieXRlIGFkZHJlc3NpbmcuCj4KPiBS
ZWZlcjoKPiBFcnJhdGEgaTIzODM6IE9TUEk6IDItYnl0ZSBhZGRyZXNzIGlzIG5vdCBzdXBwb3J0
ZWQgaW4gUEhZIEREUiBtb2RlIFsxXQo+Cj4gQXMgYSByZXN1bHQsIHRoZSBDYWRlbmNlIGNvbnRy
b2xsZXIgc3VwcG9ydHMgb25seSB0aGUgZm9sbG93aW5nCj4gb3BlcmF0aW5nIG1vZGVzOgo+ICAt
IFBIWSBERFIgbW9kZSB3aXRoIDQtYnl0ZSBhZGRyZXNzaW5nCj4gIC0gUEhZIFNEUiBtb2RlCj4g
IC0gVEFQIChub24tUEhZKSBERFIgbW9kZQo+ICAtIFRBUCAobm9uLVBIWSkgU0RSIG1vZGUKCkkg
ZG8gbm90IHRoaW5rIHdlIGhhdmUgNC1ieXRlIGFkZHJlc3NpbmcgY2FwYWJpbGl0aWVzIG9uIFNQ
SSBOQU5EIGNoaXBzLAplc3AuIFdpbmJvbmQncyBjaGlwcy4gU28gdGhlcmUgaXMgYSBkb3duIHNp
ZGU6IHRoZSBjb3JlIHdpbGwgcGljay11cApPY3RhbCBEVFIgbW9kZXMgcmF0aGVyIHRoYW4gT2N0
YWwgU0RSICh3aXRoIFBIWSkgbW9kZSwgd2hpY2ggaXMgbm90IHRoZQpmYXN0ZXN0IG1vZGUuIE1h
eWJlIHdlIGNhbiBndWVzcyB0aGF0IG9uY2Ugd2UgaGF2ZSBhY2Nlc3MgdG8gdGhlIG1heAoodHVu
ZWQgUEhZKSBzcGkgZnJlcXVlbmN5LCB3aXRoIGFuIGV4dHJhIGZsYWcgaW4gdGhlIGRyaXZlciBp
bmRpY2F0aW5nCnRoYXQgdGhlIFBIWSBzcGVlZCBpcyBub3QgYWNjZXNzaWJsZSBpbiBEVFIgbW9k
ZS4gQnV0IHRoaXMgYWdhaW4KcmVxdWlyZXMgZGlmZmVyZW50IGhhbmRsaW5nIGJldHdlZW4gU1BJ
IE5BTkQgYW5kIFNQSSBOT1IsIGFzIFNQSSBOT1IKSUlSQyBtYXkgaGF2ZSA0LWJ5dGUgYWRkcmVz
c2luZyBjYXBhYmlsaXRpZXMuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
