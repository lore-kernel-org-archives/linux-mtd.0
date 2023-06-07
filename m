Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C31EC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dfdirxZkCwt8orIBTHHb74RzSw3RNofm56U2E/Hibc=; b=agdegvJgkoo+C5
	h+hNcoD8m1RZQ2PUL74oQJ6Q4sWVgugT2vUbZ6+hLJf9lHiBCCkXK1vPWez7CeK9phJS3hWjka0BM
	wopBaOXDyKSJir1ML+sua0u4jiiqMmKSLB7KJKRjg6gwJgTN6tOIPYXocn6/pO36Xy19f/OyV6bzQ
	g5kr5gGxB2hpvrOSG4uQ1bMwqBDfnwerWZWpklPmLt8SGcxVVq3o5Ns6PrS6I5YyQPqvOEG2v4L+4
	n8Kv63s3AIVdtviu88npEs1erNFbu3GhQa6b73ycNMv/Gs7koLYf86qM/5de82jIOqOL6/AAtzpKq
	0LpWUQPJzoBWz7/sNksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pXi-005GR5-2g;
	Wed, 07 Jun 2023 09:33:26 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6pXe-005GOB-2K
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 09:33:24 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686130397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yq+u6KBIixoyRRSctbLzLzxRpq6stiZ8c6Ns65RSIuA=;
	b=Q2Y+AHSyZBKNzlTG+6grWLT4eLbw6EXKMBRCq3tIWdwxpDsTeOkFfwFca4sK2tQwx9s07+
	zDbpsRoG40WZCRtp/aFscYccumUovEDaKHCNRQx/lOouwjeOKBHwAlpeyqNVWZEEP2gcCE
	hLG2nZiyhFSDdiLs0DeQUuduHW4+4gEDxPotjX84VOR12lwK2lIqZjju60dYMmUfSP2MPu
	v1Q14VenbLFWgU3mUqvvgZSyIoKirqgvZTLu2AePmvg60gJHjIW7UG/7WjMw4SiTZRM0Kb
	2KO7Wjgt43uwMG34to2ovhVF8LQDaBdPBHXbiqX9lt3QiVPlXVnVKFD5cqipMg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1227A24000F;
	Wed,  7 Jun 2023 09:33:14 +0000 (UTC)
Date: Wed, 7 Jun 2023 11:33:14 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Chris
 Packham <Chris.Packham@alliedtelesis.co.nz>, Pratyush Yadav
 <pratyush@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Walle <michael@walle.cc>, Paul Cercueil
 <paul@crapouillou.net>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2 07/17] dt-bindings: mtd: ingenic: Prevent NAND chip
 unevaluated properties
Message-ID: <20230607113314.5da62276@xps-13>
In-Reply-To: <168607750937.1468225.8457774415279003681.robh@kernel.org>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
	<20230606175246.190465-8-miquel.raynal@bootlin.com>
	<168607750937.1468225.8457774415279003681.robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_023323_067319_B2EE6BAC 
X-CRM114-Status: GOOD (  22.95  )
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

SGkgUm9iLAoKcm9iaEBrZXJuZWwub3JnIHdyb3RlIG9uIFR1ZSwgMDYgSnVuIDIwMjMgMTI6NTI6
MDAgLTA2MDA6Cgo+IE9uIFR1ZSwgMDYgSnVuIDIwMjMgMTk6NTI6MzYgKzAyMDAsIE1pcXVlbCBS
YXluYWwgd3JvdGU6Cj4gPiBMaXN0IGFsbCB0aGUgcG9zc2libGUgcHJvcGVydGllcyBpbiB0aGUg
TkFORCBjaGlwIGFzIHBlciB0aGUgZXhhbXBsZSBhbmQKPiA+IHNldCB1bmV2YWx1YXRlZFByb3Bl
cnRpZXMgdG8gZmFsc2UgaW4gdGhlIE5BTkQgY2hpcCBzZWN0aW9uLgo+ID4gCj4gPiBDYzogUGF1
bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1
ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLG5hbmQueWFtbCB8IDQgKysr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+ICAgCj4gCj4gTXkgYm90
IGZvdW5kIGVycm9ycyBydW5uaW5nICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0gZHRfYmluZGlu
Z19jaGVjaycKPiBvbiB5b3VyIHBhdGNoIChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4x
Myk6Cj4gCj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOgo+IAo+IGR0c2NoZW1hL2R0YyB3YXJu
aW5ncy9lcnJvcnM6Cj4gLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2lu
Z2VuaWMsbmFuZC55YW1sOiBVbmFibGUgdG8gZmluZCBzY2hlbWEgZmlsZSBtYXRjaGluZyAkaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9yYXctbmFuZC1jaGlwLnlhbWwKCkl0
IHNlZW1zIGxpa2UgeW91ciBhdXRvbWF0ZWQgdG9vbGluZyBmYWlsZWQgdG8gYXBwbHkgdGhlIHNl
Y29uZCBwYXRjaAppbiB0aGlzIHNlcmllcyAoY3JlYXRpbmcgcmF3LW5hbmQtY2hpcC55YW1sKS4g
SXQgc2F5cyAic2hhMSBpbmZvcm1hdGlvbgppcyBsYWNraW5nIG9yIHVzZWxlc3MiLiBUaGlzIHdv
cmsgaXMgYmFzZWQgb24gYSByZWNlbnQgLXJjIHNvIEknbSBub3QKc3VyZSB3aGF0IGlzICJsYWNr
aW5nIG9yIHVzZWxlc3MiIGluIHRoaXMgY2FzZS4KCkFueXdheSwgZG8geW91IHBsYW4gdG8gZ2l2
ZSB0aGlzIHNlcmllcyBhIGxvb2sgYW55d2F5PyBPciBzaG91bGQgSQpyZWJhc2UgYWdhaW5zdCBh
IHNwZWNpZmljIGJyYW5jaD8KClRoYW5rcywKTWlxdcOobAoKPiAvYnVpbGRzL3JvYmhlcnJpbmcv
ZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
aW5nZW5pYyxuYW5kLmV4YW1wbGUuZHRiOiBuYW5kLWNvbnRyb2xsZXJAMTogbmFuZEAxOiBGYWxz
ZSBzY2hlbWEgZG9lcyBub3QgYWxsb3cgeydyZWcnOiBbWzFdXSwgJ25hbmQtZWNjLXN0ZXAtc2l6
ZSc6IFtbMTAyNF1dLCAnbmFuZC1lY2Mtc3RyZW5ndGgnOiBbWzI0XV0sICduYW5kLWVjYy1tb2Rl
JzogWydodyddLCAnbmFuZC1vbi1mbGFzaC1iYnQnOiBUcnVlLCAncGluY3RybC1uYW1lcyc6IFsn
ZGVmYXVsdCddLCAncGluY3RybC0wJzogW1s0Mjk0OTY3Mjk1XV0sICdwYXJ0aXRpb25zJzogeydj
b21wYXRpYmxlJzogWydmaXhlZC1wYXJ0aXRpb25zJ10sICcjYWRkcmVzcy1jZWxscyc6IFtbMl1d
LCAnI3NpemUtY2VsbHMnOiBbWzJdXSwgJ3BhcnRpdGlvbkAwJzogeydsYWJlbCc6IFsndS1ib290
LXNwbCddLCAncmVnJzogW1swLCAwLCAwLCA4Mzg4NjA4XV19LCAncGFydGl0aW9uQDgwMDAwMCc6
IHsnbGFiZWwnOiBbJ3UtYm9vdCddLCAncmVnJzogW1swLCA4Mzg4NjA4LCAwLCAyMDk3MTUyXV19
LCAncGFydGl0aW9uQGEwMDAwMCc6IHsnbGFiZWwnOiBbJ3UtYm9vdC1lbnYnXSwgJ3JlZyc6IFtb
MCwgMTA0ODU3NjAsIDAsIDIwOTcxNTJdXX0sICdwYXJ0aXRpb25AYzAwMDAwJzogeydsYWJlbCc6
IFsnYm9vdCddLCAncmVnJzogW1swLCAxMjU4MjkxMiwgMCwgNjcxMDg4NjRdXX0sICdwYXJ0aXRp
b25ANGMwMDAwMCc6IHsnbGFiZWwnOiBbJ3N5c3RlbSddLCAncmVnJzogW1swLCA3OTY5MTc3Niwg
MSwgNDIxNTI3NTUyMF1dfX19Cj4gCUZyb20gc2NoZW1hOiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQt
cmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5n
ZW5pYyxuYW5kLnlhbWwKPiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5nZW5pYyxuYW5kLmV4YW1wbGUu
ZHRiOiBuYW5kLWNvbnRyb2xsZXJAMTogbmFuZEAxOiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFy
ZSBub3QgYWxsb3dlZCAoJ25hbmQtZWNjLW1vZGUnLCAnbmFuZC1lY2Mtc3RlcC1zaXplJywgJ25h
bmQtZWNjLXN0cmVuZ3RoJywgJ25hbmQtb24tZmxhc2gtYmJ0JywgJ3BhcnRpdGlvbnMnLCAncmVn
JyB3ZXJlIHVuZXhwZWN0ZWQpCj4gCUZyb20gc2NoZW1hOiAvYnVpbGRzL3JvYmhlcnJpbmcvZHQt
cmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvaW5n
ZW5pYyxuYW5kLnlhbWwKPiAKPiBkb2MgcmVmZXJlbmNlIGVycm9ycyAobWFrZSByZWZjaGVja2Rv
Y3MpOgo+IAo+IFNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNl
dHJlZS1iaW5kaW5ncy9wYXRjaC8yMDIzMDYwNjE3NTI0Ni4xOTA0NjUtOC1taXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tCj4gCj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRo
ZSBsYXRlc3QgcmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5Cj4gc2hvdWxkIGJlIG5vdGVkIGlu
ICp0aGlzKiBwYXRjaC4KPiAKPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19j
aGVjaycgYW5kIGRpZG4ndCBzZWUgdGhlIGFib3ZlCj4gZXJyb3IocyksIHRoZW4gbWFrZSBzdXJl
ICd5YW1sbGludCcgaXMgaW5zdGFsbGVkIGFuZCBkdC1zY2hlbWEgaXMgdXAgdG8KPiBkYXRlOgo+
IAo+IHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKPiAKPiBQbGVhc2UgY2hlY2sgYW5k
IHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3Rl
Cj4gdGhhdCBEVF9TQ0hFTUFfRklMRVMgY2FuIGJlIHNldCB0byB5b3VyIHNjaGVtYSBmaWxlIHRv
IHNwZWVkIHVwIGNoZWNraW5nCj4geW91ciBzY2hlbWEuIEhvd2V2ZXIsIGl0IG11c3QgYmUgdW5z
ZXQgdG8gdGVzdCBhbGwgZXhhbXBsZXMgd2l0aCB5b3VyIHNjaGVtYS4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
