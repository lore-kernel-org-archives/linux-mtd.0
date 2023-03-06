Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1F4C6FA99
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJxlMc9grDQIM2owziKd7dSdvGI+I9qUqulnBm3geck=; b=evhQRJkNQGqXmr
	go+9kdA3t37rE83uWYjoBdpsNptKPXvluAUkxxEohT152Csis78qTWXE1463XUPD+m/E0h3hb/eBm
	a7SDq5BykC7GrTYP9qlGDGiIHzNDrgJfA8SIY+yQH3177gwiEVAFdmk9DJIeVAjOrV/b+4Mh9Z3Wh
	0gVN18lSHl7djVL47WiXy7epZNrtxXAzrRdCfDzDUq5G3leCuNQvKxL2XDy/LuMe3QvX2/MOtj1VW
	kW25Ss/1hOlw3zoVb4syXtURmk+p427Im6hhK7avsSgXvZNbv5EY8C3XO8fAZoFqjvbwIRIS8CKZR
	PyDb3frDU23gHGjPvcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCAw-00DQm3-AA; Mon, 06 Mar 2023 14:50:54 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBzP-00DL1s-0x
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 14:39:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 24CE820010;
	Mon,  6 Mar 2023 14:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678113535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CihFIQuO8EkmKbOqb/odYY87aF0bfbQPJr+dXyqKWM=;
	b=imwyQChFmKzT+FDHfXvNHpYEw+0cNlqq2MzSIf0Y6kQRaRnympSOGcJyCF6oa+u0s++p1f
	z0TZhBtyQLY3G4mMI2RJcpXyltBnvfqIRMmpCk/QB2jt1ItcexfiduaTzQHjv7dCHyT+Ew
	fg6wrc11NJX8dsfzZ/4AlqToIGTn5U+35lJ8Z4GQAiLBy/OH/HH/EFfE2xQ2XXcxinDmTE
	bi8an4Vs5CU+ULHj85iPNr/Vv9D8pPQwOFl6ugxdO2aOz3EYXuDOAfsmabOrOZimj4LV1b
	ZJq50BHsr/xVg9cHoEb7RR/WgqiM9jwk9lWFotMS6aOIPc22YDwZFiPRPZzArg==
Date: Mon, 6 Mar 2023 15:38:51 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <robh+dt@kernel.org>, <vigneshr@ti.com>, <richard@nod.at>,
 <agross@kernel.org>, <bjorn.andersson@linaro.org>,
 <quic_srichara@quicinc.com>, <qpic_varada@quicinc.com>,
 <quic_sjaganat@quicinc.com>
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi
 nand
Message-ID: <20230306153851.0dcdda27@xps-13>
In-Reply-To: <b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
References: <1602307902-16761-1-git-send-email-mdalam@codeaurora.org>
	<1602307902-16761-3-git-send-email-mdalam@codeaurora.org>
	<20201029100751.713e27df@collabora.com>
	<b70ddb40-a1f1-f967-6b7b-057a39b0bcc2@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_063859_361971_4D1B2005 
X-CRM114-Status: GOOD (  20.87  )
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

SGVsbG8sCgpxdWljX21kYWxhbUBxdWljaW5jLmNvbSB3cm90ZSBvbiBNb24sIDYgTWFyIDIwMjMg
MTk6NDU6NTggKzA1MzA6Cgo+IE9uIDEwLzI5LzIwMjAgMjozNyBQTSwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+ID4gSGVsbG8sCj4gPgo+ID4gT24gU2F0LCAxMCBPY3QgMjAyMCAxMTowMTozOSAr
MDUzMAo+ID4gTWQgU2FkcmUgQWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPiA+
ICAKPiA+PiBUaGlzIGNoYW5nZSB3aWxsIGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIHFzcGkgKHNl
cmlhbCBuYW5kKS4KPiA+Pgo+ID4+IFFQSUMgVmVyc2lvbiB2LjIuMCBvbndhcmRzIHN1cHBvcnRz
IHNlcmlhbCBuYW5kIGFzIHdlbGwgc28gdGhpcwo+ID4+IGNoYW5nZSB3aWxsIGluaXRpYWxpemUg
YWxsIHJlcXVpcmVkIHJlZ2lzdGVyIHRvIGVuYWJsZSBxc3BpIChzZXJpYWwKPiA+PiBuYW5kKS4K
PiA+Pgo+ID4+IFRoaXMgY2hhbmdlIGlzIHN1cHBvcnRpbmcgdmVyeSBiYXNpYyBmdW5jdGlvbmFs
aXR5IG9mIHFzcGkgbmFuZCBmbGFzaC4KPiA+Pgo+ID4+IDEuIFJlc2V0IGRldmljZSAoUmVzZXQg
UVNQSSBOQU5EIGRldmljZSkuCj4gPj4KPiA+PiAyLiBEZXZpY2UgZGV0ZWN0aW9uIChSZWFkIGlk
IFFTUEkgTkFORCBkZXZpY2UpLiAgCj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGF0J3Mgbm90IGdvaW5n
IHRvIHdvcmsgaW4gdGhlIGxvbmcgdGVybS4gWW91J3JlCj4gPiBiYXNpY2FsbHkgaGFja2luZyB0
aGUgcmF3IE5BTkQgZnJhbWV3b3JrIHRvIG1ha2UgU1BJIE5BTkRzIGZpdC4gSSBkbwo+ID4gdW5k
ZXJzdGFuZCB0aGUgcmF0aW9uYWxlIGJlaGluZCB0aGlzIGRlY2lzaW9uIChyZS11c2luZyB0aGUg
Y29kZSBmb3IKPiA+IEVDQyBhbmQgcHJvYmFibHkgb3RoZXIgdGhpbmdzKSwgYnV0IHRoYXQncyBu
b3QgZ29pbmcgdG8gd29yay4gU28gSSdkCj4gPiByZWNvbW1lbmQgZG9pbmcgdGhlIGZvbGxvd2lu
ZyBpbnN0ZWFkOgo+ID4KPiA+IDEvIGltcGxlbWVudCBhIFNQSS1tZW0gY29udHJvbGxlciBkcml2
ZXIKPiA+IDIvIGltcGxlbWVudCBhbiBFQ0MgZW5naW5lIGRyaXZlciBzbyB0aGUgRUNDIGxvZ2lj
IGNhbiBiZSBzaGFyZWQKPiA+ICAgICBiZXR3ZWVuIHRoZSBTUEkgY29udHJvbGxlciBhbmQgcmF3
IE5BTkQgY29udHJvbGxlciBkcml2ZXJzCj4gPiAzLyBjb252ZXJ0IHRoZSByYXcgTkFORCBkcml2
ZXIgdG8gdGhlIGV4ZWNfb3AoKSBpbnRlcmZhY2UgKG5vbmUgb2YKPiA+ICAgICB0aGlzIGhhY2sg
d291bGQgaGF2ZSBiZWVuIHBvc3NpYmxlIGlmIHRoZSBkcml2ZXIgd2FzIHVzaW5nIHRoZSBuZXcK
PiA+ICAgICBBUEkpCj4gPgo+ID4gUmVnYXJkcywKPiA+Cj4gPiBCb3Jpcwo+ID4gIAo+ICDCoMKg
IFNvcnJ5IGZvciBsYXRlIHJlcGx5LCBhZ2FpbiBzdGFydGVkIHdvcmtpbmcgb24gdGhpcyBmZWF0
dXJlIHN1cHBvcnQuwqAgVGhlIFFQSUMgdjIgb24gd2FyZHMgdGhlcmUgaXMgc2VyaWFsIG5hbmQg
c3VwcG9ydCBnb3QgYWRkZWQgLCBpdHMgbm90IGEgc3RhbmRhcmQgU1BJIGNvbnRyb2xsZXIKPiAK
PiAgwqDCoCBpdHMgUVBJQyBjb250cm9sbGVyIGhhdmluZyBzdXBwb3J0IGZvciBzZXJpYWwgbmFu
ZC4gQWxsIFNQSSByZWxhdGVkIGNvbmZpZ3VyYXRpb24gZG9uZSBieSBRUElDIGhhcmR3YXJlIGFu
ZCBpdHMgbm90IGV4cG9zZWQgYXMgU1BJIGJ1cyB0byB0aGUgZXh0ZXJuYWwgd29ybGQuIE9ubHkg
YmFzZWQgb24KPiAKPiAgwqDCoCBRUElDX1NQSV9DRkcgPSAxLCBzZXJpYWwgZnVuY3Rpb25hbGl0
eSB3aWxsIGdldCBzZWxlY3RlZC4gU28gdGhhdCBubyBuZWVkIHRvIGltcGxlbWVudCBhcyBTUEkt
bWVtIGNvbnRyb2xsZXIgZHJpdmVyLCBzaW5jZSBpdHMgbm90IGEgU1BJIGNvbnRyb2xsZXIuCj4g
Cj4gIMKgIFBsZWFzZSBjaGVjayB0aGUgYmVsb3cgZGlhZ3JhbSBmb3IgdG9wIHZpZXcgb2YgUVBJ
QyBjb250cm9sbGVyLgoKT25lIG9mIHRoZSBoYXJkIHRoaW5ncyBpbiB0aGUgTGludXgga2VybmVs
IGlzIHRvIG1ha2UgZGV2aWNlcyBmaXQKZnJhbWV3b3Jrcy4gVGhpcyBmZWF0dXJlIGRvZXMgbm90
IGZpdCB0aGUgcmF3IE5BTkQgZnJhbWV3b3JrLiBJdCBkb2VzCm5vdCBmb2xsb3cgYW55IG9mIHRo
ZSBjb252ZW50aW9ucyB0YWtlbiB0aGVyZS4gSXQgaXMgbm90IGdvbm5hIGJlCmFjY2VwdGVkIHRo
ZXJlLiBZb3UgbmVlZCB0byBleHBvc2Ugc3BpLW1lbSBmdW5jdGlvbmFsaXRpZXMsIGV2ZW4gaWYg
dGhlCnNwaS1wcm9wZXIgZmVhdHVyZXMgYXJlIG5vdCBhdmFpbGFibGUuIEkgYmVsaWV2ZSB5b3Vy
IHNpdHVhdGlvbiBzdGlsbApmaXRzIHRoZSBzcGktbWVtIGFic3RyYWN0aW9uLgoKVGhhbmtzLApN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
