Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67621C53200
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Feb 2026 08:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpvn1YeS1RJuCNH1YFKCoDNWQGvyvfM3uq3nPzWh+h4=; b=ulCdfXCT9F3iwH
	1GdLtTASi8Vp9FSm/RvzlFtigGusl4Y2EyMD7QYD3OXUjYjUFsze5KiuUYHsd2qvxhHOreM2Mp+UQ
	+vtX4gTlMQ+Z26kzq0wF9AJd5kAqjDWcTURYQbEh9F73+0Knj+ods0zhUX7DUjxhqRscG/+sXmoYS
	11S6z5SCvJdywV1KVntHoVZKwDsLwTsnnH209+y4LCDGKtunqLBORmCfuSCp+ncKQym60bN5tOu2Z
	ArnKZ0ku5FAL1CkdEj/M35gDnSG0bt5lziBer+4QS4d1XdRPXVKvmoSW2Gd3wAHu2+zRxmsZU83VC
	XA/CCkGw45eViyhx8YoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLlj-0000000DPKN-0HqD;
	Fri, 20 Feb 2026 08:21:47 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtLle-0000000DPK2-2DCF
	for linux-mtd@lists.infradead.org;
	Fri, 20 Feb 2026 08:21:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 200EFC1E4AD;
	Fri, 20 Feb 2026 08:21:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41DB65FA8F;
	Fri, 20 Feb 2026 08:21:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D0F6103687A2;
	Fri, 20 Feb 2026 09:21:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771575698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m3LCq1v4f6VsgqqRgj0dFsfM15EC0OKWM7IoAXqpJBQ=;
	b=BUAwBgK3bv1Kex5xQIYvTcHZ0JROJdSfxpcSeQc2mpdC7AzY14UP8Chix3zR3TOYFVVGnf
	xD+CfdmqHMBWBS3QBePkagWqbav4HvBhvC8XSXLMXk3ufL8D8N2vc1mUTOkDm3rdctnyNP
	+dXImFv1vyZ/XjAxgOkGhGusWk8fXUFpVwdggMpXusWNwcu6V9C1PTVIS5AD5nwZdAIzL2
	F7LAkZMAWi+Eop4zlBeDvHWKAgv1vkCDCWZEqyTkg0KklzaYQjX/3a67vP9iZcvHEmB3Sg
	ZTjyoKdDutu7r9hJfxLqkp1L04mGrDclX2s/112lgT/akg24z0NT29GQdmHcow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Santhosh Kumar K" <s-k6@ti.com>,  <broonie@kernel.org>,
  <robh@kernel.org>,  <krzk+dt@kernel.org>,  <conor+dt@kernel.org>,
  <richard@nod.at>,  <vigneshr@ti.com>,  <tudor.ambarus@linaro.org>,
  <pratyush@kernel.org>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <p-mantena@ti.com>,  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 08/12] spi: cadence-quadspi: read 'has-dqs' DT
 property
In-Reply-To: <DGIXI3RVPSJW.3J77RFU4JK6O2@kernel.org> (Michael Walle's message
	of "Thu, 19 Feb 2026 13:14:39 +0100")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-9-s-k6@ti.com> <87h5rvgkjs.fsf@bootlin.com>
	<DGIXI3RVPSJW.3J77RFU4JK6O2@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 20 Feb 2026 09:21:32 +0100
Message-ID: <87h5rbsu43.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_002143_136637_06A86BEF 
X-CRM114-Status: GOOD (  20.58  )
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

T24gMTkvMDIvMjAyNiBhdCAxMzoxNDozOSArMDEsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUgRmViIDUsIDIwMjYgYXQgNjozNSBQTSBDRVQsIE1p
cXVlbCBSYXluYWwgd3JvdGU6Cj4+IE9uIDEzLzAxLzIwMjYgYXQgMTk6NDY6MTMgKzA1MzAsIFNh
bnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPiB3cm90ZToKPj4KPj4+IEFkZCBhIGJvb2xlYW4g
ZmllbGQgdG8gc3RydWN0IGNxc3BpX2ZsYXNoX3BkYXRhIHRvIHN0b3JlIHdoZXRoZXIgdGhlCj4+
PiBhdHRhY2hlZCBmbGFzaCBkZXZpY2Ugc3VwcG9ydHMgRFFTIChEYXRhIFN0cm9iZSkgbW9kZS4g
UmVhZCB0aGlzIGZyb20KPj4+IHRoZSAnc3BpLWhhcy1kcXMnIGRldmljZSB0cmVlIHByb3BlcnR5
IGR1cmluZyBmbGFzaCBub2RlIHBhcnNpbmcuCj4+Pgo+Pj4gVGhpcyBpcyBwcmVwYXJhdG9yeSBp
bmZyYXN0cnVjdHVyZSBmb3IgUEhZIHR1bmluZyBzdXBwb3J0LiBUaGUgZmllbGQKPj4+IHdpbGwg
YmUgdXNlZCBieSBzdWJzZXF1ZW50IHBhdGNoZXMgdG8gY29uZmlndXJlIHJlYWQgZGF0YSBjYXB0
dXJlIHRpbWluZwo+Pj4gd2l0aCBEUVMgZW5hYmxlZCBmb3IgaW1wcm92ZWQgbWFyZ2lucyBpbiBo
aWdoLXNwZWVkIG9wZXJhdGlvbnMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3Vt
YXIgSyA8cy1rNkB0aS5jb20+Cj4+Cj4+IEFzIG1lbnRpb25lZCBpbiBteSBhbnN3ZXIgdG8gdGhl
IGNvdmVyIGxldHRlciwgSSBhbSBub3QgdG9vIG11Y2ggaW4KPj4gZmF2b3VyIG9mIHRoaXMgcHJv
cGVydHkgYmVjYXVzZSB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IGlzIHNvbWV3aGF0Cj4+IHJlbGF0
ZWQgdG8gdGhlIGNoaXAgSUQsIHRodXMgZGlzY292ZXJhYmxlLiBJIGRyYWZ0ZWQgc29tZXRoaW5n
IHRvIGdldAo+PiByaWQgb2YgdGhpcyBwcm9wZXJ0eSBhbHJlYWR5LCBJIHdpbGwgc2hhcmUgaXQg
Zm9yIG9wZW5pbmcgdGhlCj4+IGRpc2N1c3Npb24uCj4+Cj4+IEhvd2V2ZXIsIGZvciBub3cgSSBh
bSBjbG9zaW5nIG15IGV5ZXMgb24gdGhlIGZhY3QgdGhhdCB0aGUgRFFTIHBpbiBtaWdodAo+PiBu
b3QgYmUgd2lyZWQgdG8gdGhlIGNvbnRyb2xsZXIuIEluIHRoaXMgY2FzZSB3ZSB3aWxsIG5lZWQg
c29tZSBraW5kIG9mCj4+ICJkcXMtbm90LXdpcmVkIiBEVCBwcm9wZXJ0eSwgdGhhdCdzIHRydWUs
IGJ1dCBhbHNvIGVhc2lseSBtYW5hZ2VhYmxlIGF0Cj4+IHRoZSBjb3JlIGxldmVsIGxhdGVyLCB3
aGVuL2lmIHRoZSBuZWVkIGFyaXNlcy4KPgo+IFVzdWFsbHksIGEgRFFTIHBpbiBpcyBvcHRpb25h
bC4gQUZBSUssIHRoZXJlIGlzIG5vIHJlcXVpcmVtZW50IGZvcgo+IGl0LiBJLmUuIGl0IHdpbGwg
cHJvYmFibHkgd29yayBmaW5lIHdpdGggc2xvd2VyIGZyZXF1ZW5jaWVzIGFuZAo+IHVzaW5nIGFu
IGludGVybmFsIGxvb3BiYWNrLiBTbyBpZiB5b3UgcnVuIHlvdXIgZmxhc2ggd2l0aCBzbG93ZXIK
PiBmcmVxdWVuY3kgeW91IGNhbiBwcm9iYWJseSBzYXZlIG9uZSBwaW4gYW5kIHVzZSBpdCBmb3Ig
c29tZXRoaW5nCj4gZGlmZmVyZW50Lgo+Cj4gV2hhdCBJIHdhbnRlZCB0byBzYXkgaXMsIHRoYXQg
bm90IGhhdmluZyBhIERRUyBwaW4gd2lyZWQgaXMgbm90Cj4gcmVhbGx5IGEgbWlzdGFrZS4gQnV0
ICJkcXMtbm90LXdpcmVkIiBzb3VuZHMgZXhhY3RseSBsaWtlIGl0Lgo+IFNvIElNSE8gaXQgc2hv
dWxkIGJlIHRoZSBvdGhlciB3YXkgYXJvdW5kIGFuZCB0aGUgZGV2aWNlIHRyZWUgc2hvdWxkCj4g
dGVsbCB5b3UgdGhhdCAqaXMqIHdpcmVkLCBpZiB3ZSBjYW5ub3QgZmluZCBkZXRlY3QgaXQgb3Ro
ZXJ3aXNlLAo+IGxpa2UgbG9va2luZyBhdCBwaW5tdXhpbmcgZm9yIGV4YW1wbGUgKG5vdCBzdXJl
IHRoYXQgaXMgZmVhc2libGUKPiB0aG91Z2gpLgoKSSB3YXMgaW4gZmF2b3VyIG9mIHRoZSBvcHQt
b3V0IHByb3BlcnR5IGJlY2F1c2UgSSBmZWVsIGxpa2UgaXQgZG9lc24ndAptYWtlIHNlbnNlIHRv
IGZpbGwgaW4gdGhlIGhpZ2ggc3BlZWQgc3BpIHByb3BlcnR5IHdoaWNoIGludm9sdmVzIHR1bmlu
ZywKd2l0aG91dCB3aXJpbmcgdGhlIERRUyBwaW4uIEl0IGlzIHBvc3NpYmxlLCBidXQgaWYgeW91
J3JlIGxvb2tpbmcgZm9yCnNwZWVkLCBpdCBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSBJTU8uIEhl
bmNlIEkgd2FzIHNlZWluZyB0aGlzIGFzIGEKc3BlY2lmaWMgY2FzZSB3aGljaCBsZWdpdGltYXRl
bHkgbmVlZHMgYSBwcm9wZXJ0eS4gQnV0IEkgZG9uJ3Qgd2FudCB0bwpiaWtlc2hlZCBvbiB0aGF0
IGZvciB0b28gbG9uZywgSSdtIGZpbmUgd2l0aCB0aGUgb3Bwb3NpdGUgYXBwcm9hY2gsCmxldCdz
IG1ha2UgaXQgYSAiZHFzLWlzLXdpcmVkIiAob3Igc29tZXRoaW5nIGFsaWtlKSBwcm9wZXJ0eS4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
