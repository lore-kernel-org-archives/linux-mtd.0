Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043D5CD6E45
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 09:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7ptB0Wpd/I4G639FZGR+SZetHKCdamZzUkd8hpdMgk=; b=tE0dhEf+mYVOLb
	RfdeWy53R1FaEPyN182YPiygwIirxN8ILBwhISbsVOY3I/c9QqpOzX4VtewZisMGQtzxv+jfv7Qm9
	Lke0w0wrqStYWORUPKO7J73VGCdEnR/y4hjz5+kUOoBPAgOhYDTlvxGh8LalUb5ssZhzZH1AlyXMV
	QEWA3b+8E4P4o55GQOiIHDvExNjJAkd6IejFJJTfNcbh5XgrvMjIfVL0X+lWCwsYip4oQYlAgzpZ4
	5+aPnw++uJmeNi0yT7KK6prgHLbmh/cr2Szph8HvwomnGVRH8CADhrym6dVv8vcYAgRanZ2hSvhDO
	M/UhXRoXbcsLmJt4lNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWcO-00000005SKj-0GMA;
	Thu, 28 May 2026 09:01:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSWcI-00000005SK5-0BLw
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 09:01:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 561B64E42D73;
	Thu, 28 May 2026 09:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22BA060495;
	Thu, 28 May 2026 09:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B81F110888C9D;
	Thu, 28 May 2026 11:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779958883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CJpI4CzMT+8wAw7NoB3I1or94sKydUL6L2mKBp4EKXQ=;
	b=DIRrlmuxStj9KBs0JSi48AC0JrPQE/twnav1z4XLSjIajztm7yy1shy7cUOhMQ8NpBPH/S
	1jUK1LKuD3yf2gIauHb/jkxUxTR08HfXpL90lpkhhoo82vyYX4A5KpXkWtVXa4jn1ZLLqH
	e0DhknVWndP/8vboFIjB/Rmc/cCcw4injCAM3z7AEMo2jfpkntYNskpCL+H/VnCD6MrNA5
	dwlivWKG6ljsxB0F5daCKxB9oDMODMFj/fXsiUHoUb4j5EoP9ri4gfaBrHHXOPrNktSBU8
	PYzgr3WrXPXDGhR9o89XHqP456EgMXfxf2dXndriUSA72RkSbNO45KkU8/Q87w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <takahiro.kuwano@infineon.com>,  <linux-spi@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <praneeth@ti.com>,  <u-kumar1@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [PATCH v3 09/13] spi: cadence-quadspi: reject 2-byte-address
 DDR ops on PHY-tunable hardware
In-Reply-To: <20260527175527.2247679-10-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Wed, 27 May 2026 23:25:23 +0530")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-10-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 28 May 2026 11:01:19 +0200
Message-ID: <87y0h3gb6o.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_020128_330045_56E4FCFE 
X-CRM114-Status: GOOD (  18.46  )
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

T24gMjcvMDUvMjAyNiBhdCAyMzoyNToyMyArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBFcnJhdHVtIGkyMzgzIGFmZmVjdHMgdGhlIEFNNjU0IE9TUEkgY29u
dHJvbGxlcjogaW4gUEhZIEREUiBtb2RlLAo+IG9wZXJhdGlvbnMgd2l0aCBhIDItYnl0ZSBhZGRy
ZXNzIGNhdXNlIGFuIGludGVybmFsIHN0YXRlIG1hY2hpbmUgdG8KPiBtaXMtY29tcGFyZSB0aGUg
dHJhbnNtaXR0ZWQgYWRkcmVzcyBieXRlIGNvdW50IGFnYWluc3QgMSBpbnN0ZWFkIG9mIDIsCj4g
bG9ja2luZyB1cCB0aGUgYWRkcmVzcyBwaGFzZS4gWzBdCj4KPiBBZGQgYSBDUVNQSV9OT18yQllU
RV9BRERSX1BIWV9ERFIgcXVpcmsgZmxhZyBhbmQgc2V0IGl0IG9uIHRoZSBhbTY1NF9vc3BpCj4g
cGxhdGZvcm0gZGF0YS4gSW4gY3FzcGlfc3VwcG9ydHNfbWVtX29wKCksIHdoZW4gYSBjb250cm9s
bGVyIGNhcnJpZXMgdGhpcwo+IHF1aXJrIGFuZCBoYXMgUEhZIHR1bmluZyBzdXBwb3J0LCByZWpl
Y3QgRERSIG9wZXJhdGlvbnMgdGhhdCB1c2UgMi1ieXRlCj4gYWRkcmVzc2luZy4KPgo+IFswXSBo
dHRwczovL3d3dy50aS5jb20vbGl0L2VyL3Nwcno1NDRjL3Nwcno1NDRjLnBkZgo+Cj4gU2lnbmVk
LW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
c3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyB8IDE1ICsrKysrKysrKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyBiL2RyaXZlcnMvc3BpL3NwaS1jYWRl
bmNlLXF1YWRzcGkuYwo+IGluZGV4IDUwOGJjNWJjNGFiNS4uNzIyMDhkMzc2MzA1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+ICsrKyBiL2RyaXZlcnMv
c3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYwo+IEBAIC00OSw2ICs0OSw3IEBAIHN0YXRpY19hc3Nl
cnQoQ1FTUElfTUFYX0NISVBTRUxFQ1QgPD0gU1BJX0RFVklDRV9DU19DTlRfTUFYKTsKPiAgI2Rl
ZmluZSBDUVNQSV9ESVNBQkxFX1JVTlRJTUVfUE0JQklUKDEwKQo+ICAjZGVmaW5lIENRU1BJX05P
X0lORElSRUNUX01PREUJCUJJVCgxMSkKPiAgI2RlZmluZSBDUVNQSV9IQVNfV1JfUFJPVEVDVAkJ
QklUKDEyKQo+ICsjZGVmaW5lIENRU1BJX05PXzJCWVRFX0FERFJfUEhZX0REUglCSVQoMTMpCj4g
IAo+ICAvKiBDYXBhYmlsaXRpZXMgKi8KPiAgI2RlZmluZSBDUVNQSV9TVVBQT1JUU19PQ1RBTAkJ
QklUKDApCj4gQEAgLTE2MjcsNiArMTYyOCwxOCBAQCBzdGF0aWMgYm9vbCBjcXNwaV9zdXBwb3J0
c19tZW1fb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwKPiAgCQlpZiAob3AtPmRhdGEubmJ5dGVzICYm
IG9wLT5kYXRhLmJ1c3dpZHRoICE9IDgpCj4gIAkJCXJldHVybiBmYWxzZTsKPiAgCj4gKwkJLyoK
PiArCQkgKiBFcnJhdHVtIGkyMzgzOiBJbiBQSFkgRERSIG1vZGUsIDItYnl0ZSBhZGRyZXNzaW5n
IGNhdXNlcyBhbgo+ICsJCSAqIGludGVybmFsIHN0YXRlIG1hY2hpbmUgdG8gbWlzLWNvbXBhcmUg
dGhlIHRyYW5zbWl0dGVkCj4gKwkJICogYWRkcmVzcyBieXRlIGNvdW50IGFnYWluc3QgMSBpbnN0
ZWFkIG9mIDIsIGxvY2tpbmcgdXAgdGhlCj4gKwkJICogYWRkcmVzcyBwaGFzZS4gUmVqZWN0IHN1
Y2ggb3BzIG9uIGNvbnRyb2xsZXJzIHRoYXQgbmVlZCBpdC4KPiArCQkgKi8KPiArCQlpZiAoY3Fz
cGktPmRkYXRhICYmCj4gKwkJICAgIChjcXNwaS0+ZGRhdGEtPnF1aXJrcyAmIENRU1BJX05PXzJC
WVRFX0FERFJfUEhZX0REUikpIHsKPiArCQkJaWYgKG9wLT5hZGRyLm5ieXRlcyA9PSAyICYmIGNx
c3BpLT5kZGF0YS0+ZXhlY3V0ZV90dW5pbmcpCj4gKwkJCQlyZXR1cm4gZmFsc2U7Cj4gKwkJfQoK
SSBkb24ndCB0aGluayB0aGlzIGlzIGEgdmFsaWQgYXBwcm9hY2guIFdoYXQgd2Ugd2FudCBpcyB0
byBwcmV2ZW50CnR1bmluZyBpbiBvY3RhbCBEVFIgbW9kZSB3aXRoIDIgYnl0ZXMgYWRkcmVzc2lu
ZywgaW5zdGVhZCBvZiBwcmV2ZW50aW5nCnJlYWRzL3dyaXRlcyBpbiBvY3RhbCBEVFIgbW9kZXMg
YWZ0ZXIgdHVuaW5nLiBIYXZlIHlvdSB0cmllZCBvbiBhbiBBTTYyQSBMUApTSz8gSSBiZXQgcHJv
YmUgZmFpbHMuLgoKVGhlIHF1aXJrIHNob3VsZCBiZSBoYW5kbGVkIGF0IHRoZSBiZWdpbm5pbmcg
b2YgdGhlIHR1bmluZyBwcm9jZWR1cmUsIHNvCndlIHNraXAgdHVuaW5nIGVudGlyZWx5IGluIHRo
aXMgY2FzZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
