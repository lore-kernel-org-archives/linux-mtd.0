Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FE3E95375
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oz2a9ZekMaVV37fV9v8uqglBnvv8U6ltO/BY9X+MYNs=; b=oSFiKbQZdd+skA
	l8mJByXGgcLx4q573bQ4jMsul3T9hJ+q0Dri4m4KfHp1gF62e09aws/w0iO2o+N5MPR4wuA99Zz72
	7AuWkmcM+WcqwCwBJ3t7QWxoJhtfqQJxi+36jNsMeArYixwpWoJw1uCK5QGryKdH1l1Pg/4LM4OZd
	D7msRJ4zsSllQ1JlmTX7S4gqmwojebaQRDxxV1/ZfKRbddcCkliH975ZXxJWICaVHMvIvxklRf0qe
	QQDTUcErhcET8OuwtgZOWYnE+CJroS/l2s1a/8ZblTc47Uv3YDrvma5Onbpdz4n3O25xavcPIm3ca
	LXqtCAkLy/+dxKD+GEIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna8N-00000008HsX-1qsO;
	Wed, 04 Feb 2026 10:29:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vna8K-00000008HsD-1jx6
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 10:29:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 75AAE4E423F3;
	Wed,  4 Feb 2026 10:29:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46B1B60745;
	Wed,  4 Feb 2026 10:29:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 136BF119A865B;
	Wed,  4 Feb 2026 11:29:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770200952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=01QzhpC+ZgIOpSS8o+hjNlELWio1HwrhuHHzfZRg1Sk=;
	b=oaqQ7l765iQGfSSBX//MES/7TjJpX1/lKC0GyoQDpXOQCn65sDKixQW1izvZx0JghaJrOR
	w45VURFbK+s0tQgpoqr7mbYdRn0x5WCWZyM//0viVoBMTSS4gCKawU3MKv5Osd/aFc+5VO
	8/c2T/N35yj8P/tpq+LNDCg4fXIJ8XD6iqV6uACasvhqgE6pi/WuDwqkor2klF3/FzMhf1
	pBhHOnGlp7ruQd7rI0sHSzEdPo1+W9EiYGx/WvBDlrChXYT3E1wEQTQD/ZiANCYS9+xEQm
	C3tL1rmp2UyPyAjsjDHiKzWhq7Ek+UCm/NwDP/t62jGxMEFqIFeaR9eZUUqaOg==
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
In-Reply-To: <20260113141617.1905039-1-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:05 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 04 Feb 2026 11:29:07 +0100
Message-ID: <87343ghkek.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_022916_718304_E63E1BF7 
X-CRM114-Status: GOOD (  16.39  )
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

SGkgU2FudGhvc2gsCgpPbiAxMy8wMS8yMDI2IGF0IDE5OjQ2OjA1ICswNTMwLCBTYW50aG9zaCBL
dW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IFRoaXMgc2VyaWVzIGltcGxlbWVudHMgUEhZ
IHR1bmluZyBzdXBwb3J0IGZvciB0aGUgQ2FkZW5jZSBRU1BJIGNvbnRyb2xsZXIgdG8KPiBlbmFi
bGUgcmVsaWFibGUgaGlnaC1zcGVlZCBvcGVyYXRpb25zLiBXaXRob3V0IFBIWSB0dW5pbmcsIGNv
bnRyb2xsZXJzIHVzZQo+IGNvbnNlcnZhdGl2ZSB0aW1pbmcgdGhhdCBsaW1pdHMgdGhlIHBlcmZv
cm1hbmNlLiBQSFkgdHVuaW5nIGNhbGlicmF0ZXMgUlgvVFgKPiBkZWxheSBsaW5lcyB0byBmaW5k
IG9wdGltYWwgZGF0YSBjYXB0dXJlIHRpbWluZyB3aW5kb3dzLCBlbmFibGluZyBvcGVyYXRpb24g
dXAKPiB0byB0aGUgY29udHJvbGxlcidzIG1heGltdW0gZnJlcXVlbmN5Lgo+Cj4gQmFja2dyb3Vu
ZDoKPiBIaWdoLXNwZWVkIFNQSSBtZW1vcnkgY29udHJvbGxlcnMgcmVxdWlyZSBwcmVjaXNlIHRp
bWluZyBjYWxpYnJhdGlvbiBmb3IKPiByZWxpYWJsZSBvcGVyYXRpb24uIEF0IGhpZ2hlciBmcmVx
dWVuY2llcywgYm9hcmQtdG8tYm9hcmQgdmFyaWF0aW9ucyBtYWtlCj4gZml4ZWQgdGltaW5nIHBh
cmFtZXRlcnMgaW5hZGVxdWF0ZS4gVGhlIENhZGVuY2UgUVNQSSBjb250cm9sbGVyIGluY2x1ZGVz
Cj4gYSBQSFkgaW50ZXJmYWNlIHdpdGggcHJvZ3JhbW1hYmxlIGRlbGF5IGxpbmVzICgwLTEyNyB0
YXBzKSBmb3IgUlggYW5kIFRYCj4gcGF0aHMsIGJ1dCB0aGVzZSByZXF1aXJlIHJ1bnRpbWUgY2Fs
aWJyYXRpb24gdG8gZmluZCB0aGUgdmFsaWQgdGltaW5nIHdpbmRvdy4KPgo+IEFwcHJvYWNoOgo+
IEFkZCBTRFIvRERSIFBIWSB0dW5pbmcgYWxnb3JpdGhtcyBmb3IgdGhlIENhZGVuY2UgY29udHJv
bGxlcjoKPgo+IFNEUiBNb2RlIFR1bmluZyAoMUQgc2VhcmNoKToKPiAtIFNlYXJjaGVzIGZvciB0
d28gY29uc2VjdXRpdmUgdmFsaWQgUlggZGVsYXkgd2luZG93cwo+IC0gU2VsZWN0cyB0aGUgbGFy
Z2VyIHdpbmRvdyBhbmQgdXNlcyBpdHMgbWlkcG9pbnQgZm9yIG1heGltdW0gbWFyZ2luCj4gLSBU
WCBkZWxheSBmaXhlZCBhdCBtYXhpbXVtICgxMjcpIGFzIGl0J3MgbGVzcyBjcml0aWNhbCBpbiBT
RFIKPgo+IEREUiBNb2RlIFR1bmluZyAoMkQgc2VhcmNoKToKPiAtIEZpbmRzIFJYIGJvdW5kYXJp
ZXMgKHJ4bG93L3J4aGlnaCkgdXNpbmcgVFggd2luZG93IHN3ZWVwcwo+IC0gRmluZHMgVFggYm91
bmRhcmllcyAodHhsb3cvdHhoaWdoKSBhdCBmaXhlZCBSWCBwb3NpdGlvbnMKPiAtIERlZmluZXMg
dmFsaWQgcmVnaW9uIGNvcm5lcnMgYW5kIGRldGVjdHMgZ2FwcyB2aWEgYmluYXJ5IHNlYXJjaAo+
IC0gQXBwbGllcyB0ZW1wZXJhdHVyZSBjb21wZW5zYXRpb24gZm9yIG9wdGltYWwgcG9pbnQgc2Vs
ZWN0aW9uCj4gLSBIYW5kbGVzIHNpbmdsZSBvciBkdWFsIHBhc3NpbmcgcmVnaW9ucyB3aXRoIGRp
ZmZlcmVudCBzdHJhdGVnaWVzCj4KPiBEUVMgU3VwcG9ydDoKPiAtIEFkZHMgb3B0aW9uYWwgRFFT
IChEYXRhIFN0cm9iZSkgbW9kZSBmb3IgaW1wcm92ZWQgdGltaW5nIG1hcmdpbnMKPiAtIENvbmZp
Z3VyZXMgcmVhZCBkYXRhIGNhcHR1cmUgdG8gdXNlIGRlZGljYXRlZCBzdHJvYmUgc2lnbmFsCgpJ
IGFtIGdsYWQgdG8ga25vdyB0aGlzIHNpZ25hbCBpcyB1c2VmdWwuIEkgZG8gbm90IGNvbnNpZGVy
IHRoZSBEVApwcm9wZXJ0eSBhcyBiZWluZyB0aGUgY29ycmVjdCB3YXkgdG8gY2FycnkgdGhpcyBp
bmZvcm1hdGlvbiBBVE0sIHNvIEkKd2lsbCBpbnZlc3RpZ2F0ZSBhIGJpdCBhIHByb3Bvc2UgYSBz
b2x1dGlvbiB0aGF0IGlzIG1vcmUgdW5pZm9ybSB3aXRoCnRoZSByZXN0IG9mIHRoZSBjaGlwcyBk
ZXNjcmlwdGlvbiB3ZSBoYXZlIHRvZGF5LgoKPiBQYXRjaCBkZXNjcmlwdGlvbjoKPiBJbmZyYXN0
cnVjdHVyZSAoMS01KToKPiAtIFBhdGNoIDE6ICAgQWRkIERUIGJpbmRpbmcgZm9yIHNwaS1oYXMt
ZHFzIHByb3BlcnR5Cj4gLSBQYXRjaCAyOiAgIEltcGxlbWVudCBzcGlfbWVtX2V4ZWN1dGVfdHVu
aW5nKCkgQVBJIGluIFNQSSBjb3JlCj4gLSBQYXRjaCAzLTU6IFJlZmFjdG9yIGFuZCBpbnRlZ3Jh
dGUgdHVuaW5nIGluIE1URCBTUEktTkFORC9OT1IgbGF5ZXJzIGFuZCBjYWxsCj4gICAgICAgICAg
ICAgIHR1bmluZyBkdXJpbmcgcHJvYmUKPgo+IENhZGVuY2UgUVNQSSBJbXBsZW1lbnRhdGlvbiAo
Ni0xMik6Cj4gLSBQYXRjaCA2LTg6IFByZXBhcmF0b3J5IHJlZmFjdG9yaW5nIGFuZCBEUVMgc3Vw
cG9ydAo+IC0gUGF0Y2ggOTogICBBZGQgUEhZIHR1bmluZyBpbmZyYXN0cnVjdHVyZSB3aXRoIHBs
YWNlaG9sZGVycwo+IC0gUGF0Y2ggMTA6ICBJbXBsZW1lbnQgY29tcGxldGUgU0RSL0REUiB0dW5p
bmcgYWxnb3JpdGhtcwo+IC0gUGF0Y2ggMTE6ICBSZXN0cmljdCBQSFkgZnJlcXVlbmN5IHRvIGNh
bGlicmF0ZWQgb3BlcmF0aW9ucyBvbmx5Cj4gLSBQYXRjaCAxMjogIEVuYWJsZSBQSFkgZm9yIGRp
cmVjdCBtZW1vcnktbWFwcGVkIHJlYWRzIGFuZCBsYXJnZSB3cml0ZXMKPgo+IFRlc3Rpbmc6Cj4g
VGhpcyBzZXJpZXMgd2FzIHRlc3RlZCBvbiBUSSdzCj4gQU02MkEgU0sgd2l0aCBPU1BJIE5BTkQg
Zmxhc2ggYW5kCj4gQU02MlAgU0sgd2l0aCBPU1BJIE5PUiBmbGFzaDoKPgo+IFJlYWQgdGhyb3Vn
aHB1dDoKPiB8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXwKPiB8ICAgICAg
ICAgICB8IHdpdGhvdXQgUEhZIHwgd2l0aCBQSFkgIHwKPiB8LS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLXwgICAgICAgICAgIAo+IHxPU1BJIE5PUiAgIHwgMzcuNSBNQi9zICAg
fCAyMTYgTUIvcyAgfAo+IHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAo+
IHxPU1BJIE5BTkQgIHwgOS4yIE1CL3MgICAgfCAzNS4xIE1CL3MgfAo+IHwtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfAoKSSBhbSBzdXJwcmlzZWQgYnkgdGhlc2UgbnVtYmVy
cywgSSB3b3VsZCBleHBlY3QgdGhlc2UgdG8gZ2V0IGhpZ2hlciBmb3IKU1BJIE5BTkRzLiBJIHdp
bGwgdGVzdCB0aGUgc2VyaWVzIGFuZCByZXBvcnQgbXkgb2JzZXJ2YXRpb25zLCBlc3BlY2lhbGx5
CnNpbmNlIHRoZXJlIGlzIGFsc28gT0REUiBTUEkgTkFORCBzdXBwb3J0IG5vdyAoaW4gbmFuZC9u
ZXh0LCBzaG91bGQgYmUKcGFydCBvZiBteSB1cGNvbWluZyBtZXJnZSByZXF1ZXN0IHRvIExpbnVz
IGZvciA2LjE5KzEpOwoKPiBXcml0ZSB0aHJvdWdocHV0Ogo+IHwtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tfAo+IHwgICAgICAgICAgIHwgd2l0aG91dCBQSFkgfCB3aXRoIFBI
WSAgfAo+IHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tfCAgICAgICAgICAg
Cj4gfE9TUEkgTkFORCAgfCA2IE1CL3MgICAgICB8IDkuMiBNQi9zICB8Cj4gfC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18CgpPdmVyYWxsIEkgd2FudCB0byBzYXkgdGhhdCB0
aGlzIHNlcmllcyBoYXMgZ3JlYXRseSBpbXByb3ZlZCBhbHJlYWR5LCBJCmFtIHJlYWxseSBsb29r
aW5nIGZvcndhcmQgc2VlaW5nIHRoaXMgbWVyZ2VkLiBJIGhhdmUgc2V2ZXJhbCBjb21tZW50cyB0
bwptYWtlLCBidXQgdGhleSBhcmUgbW9zdGx5IG1pbm9yIGltcHJvdmVtZW50cyB3aGljaCB3b24n
dCBiZSB2ZXJ5CmltcGFjdGluZy4KClRoZSB0dW5pbmcgcHJvY2VkdXJlIGlzIHZlcnkgd2VsbCBk
ZXNjcmliZWQgaW4gdGhlIGNvZGUgYXMgd2VsbCwgd2hpY2gKaXMgYXBwcmVjaWF0ZWQuCgpQbGVh
c2UgcmVtb3ZlIHRoZSBSRkMgcHJlZml4IGZvciB2MywgaXQgaXMgY2xlYXJseSBubyBsb25nZXIg
bmVlZGVkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
