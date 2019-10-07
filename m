Return-Path: <SRS0=6eB4=YA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945B5C4740A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 09:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643A72084D
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 09:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="suhVV7Oi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643A72084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSdRQV4Q7yjAvUd4q595JgPl2jESOPKA7HGcIKs8XhA=; b=suhVV7Oi8ymJbl
	unnWQTBZSqTIyMngZ42/GpFkp0Of9/SAi2QpAw2nSQForMZ+4HGU4SvUeblLEPw9NikV/5xSNao6P
	/Py04SAz5eMgoBow+TgSvHZxGh1j+eVE2YTSgG//zEL8n2FRRBzzs+NqlOceACzj1ihPB/VyywnO1
	uogS3lHWPHfVvAUV9uc6KbQXq1nIAWomcoKVmd+yIdrywDxAGboqS81Q87l11RfYCZ+3r1G2cKh33
	Dyovv/um3xGzGJaM5M5GdpTM3eiXFwQCk8POwMy+yMB0lcYfr/DqYGPcvYoqohgOpEpHNP762OrB3
	MMrxeP8MzdfKPlNEOHuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHPHs-0008Gr-UK; Mon, 07 Oct 2019 09:26:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHPHp-0008Ft-DM
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2019 09:26:39 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DD96CE0010;
 Mon,  7 Oct 2019 09:26:33 +0000 (UTC)
Date: Mon, 7 Oct 2019 11:24:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
Message-ID: <20191007112442.783e4fbe@xps13>
In-Reply-To: <20191007104511.5aa7b8f2@xps13>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
 <20191007104511.5aa7b8f2@xps13>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_022637_720782_F37C3EFD 
X-CRM114-Status: GOOD (  21.36  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: juliensu@mxic.com.tw, vigneshr@ti.com, bbrezillon@kernel.org,
 marcel.ziswiler@toradex.com, richard@nod.at, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzb24sCgpNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90
ZSBvbiBNb24sIDcgT2N0IDIwMTkKMTA6NDU6MTEgKzAyMDA6Cgo+IEhpIE1hc29uLAo+IAo+IE1h
c29uIFlhbmcgPG1hc29uY2N5YW5nQG14aWMuY29tLnR3PiB3cm90ZSBvbiBXZWQsIDE4IFNlcCAy
MDE5IDE1OjU2OjI1Cj4gKzA4MDA6Cj4gCj4gPiBNYWNyb25peCBBQyBzZXJpZXMgc3VwcG9ydCB1
c2luZyBTRVQvR0VUX0ZFQVRVUkVTIHRvIGNoYW5nZQo+ID4gQmxvY2sgUHJvdGVjdGlvbiBhbmQg
VW5wcm90ZWN0aW9uLgo+ID4gCj4gPiBNVEQgZGVmYXVsdCBfbG9jay9fdW5sb2NrIGZ1bmN0aW9u
IHJlcGxhY2VtZW50IGJ5IG1hbnVmYWN0dXJlcgo+ID4gcG9zdHBvbmVkIGluaXRpYWxpemF0aW9u
LiAgCj4gCj4gV2h5IHdvdWxkIHdlIGRvIHRoYXQ/Cj4gCj4gQW55d2F5IHlvdXIgc29sdXRpb24g
bG9va3Mgb3ZlcmtpbGwsIGlmIHdlIGV2ZXIgZGVjaWRlIHRvCj4gaW1wbGVtZW50IHRoZXNlIGhv
b2tzIGZvciByYXcgbmFuZCwgaXQgaXMgYmV0dGVyIGp1c3QgdG8gbm90Cj4gb3ZlcndyaXRlIHRo
ZW0gaW4gbmFuZF9zY2FuX3RhaWwoKSBpZiB0aGV5IGhhdmUgYmVlbiBmaWxsZWQKPiBwcmV2aW91
c2x5IChpZS4gYnkgdGhlIG1hbnVmYWN0dXJlciBjb2RlKS4KCkFjdHVhbGx5IHlvdSBzaG91bGQg
YWRkIHR3byBOQU5EIGhvb2tzIHRoYXQgZG8gdGhlIGludGVyZmFjZSB3aXRoIHRoZQpNVEQgaG9v
a3MuIEluIHRoZSBOQU5EIGhvb2tzLCBjaGVjayB0aGF0IHRoZSByZXF1ZXN0IGlzIHRvIGxvY2sg
YWxsIHRoZQpkZXZpY2UsIG90aGVyd2lzZSByZXR1cm4gLUVOT1RTVVBQLgoKVGhlbiBmaWxsLWlu
IHRoZXNlIHR3byBob29rcyBmcm9tIHRoZSBtYW51ZmFjdHVyZXIgY29kZSwgd2l0aG91dCB0aGUK
cG9zdHBvbmVkIGluaXQuCgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWFzb24gWWFuZyA8bWFzb25j
Y3lhbmdAbXhpYy5jb20udHc+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X21hY3Jvbml4LmMgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYyBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYwo+ID4gaW5kZXggNTg1MTFhZS4uOTkx
YzYzNiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXgu
Ywo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jCj4gPiBAQCAt
MTEsNiArMTEsMTAgQEAKPiA+ICAjZGVmaW5lIE1BQ1JPTklYX1JFQURfUkVUUllfQklUIEJJVCgw
KQo+ID4gICNkZWZpbmUgTUFDUk9OSVhfTlVNX1JFQURfUkVUUllfTU9ERVMgNgo+ID4gIAo+ID4g
KyNkZWZpbmUgT05GSV9GRUFUVVJFX0FERFJfTVhJQ19QUk9URUNUSU9OIDB4QTAKPiA+ICsjZGVm
aW5lIE1YSUNfQkxPQ0tfUFJPVEVDVElPTl9BTExfTE9DSyAweDM4Cj4gPiArI2RlZmluZSBNWElD
X0JMT0NLX1BST1RFQ1RJT05fQUxMX1VOTE9DSyAweDAKPiA+ICsKPiA+ICBzdHJ1Y3QgbmFuZF9v
bmZpX3ZlbmRvcl9tYWNyb25peCB7Cj4gPiAgCXU4IHJlc2VydmVkOwo+ID4gIAl1OCByZWxpYWJp
bGl0eV9mdW5jOwo+ID4gQEAgLTU3LDEwICs2MSw3IEBAIHN0YXRpYyB2b2lkIG1hY3Jvbml4X25h
bmRfb25maV9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gPiAgICogdGhlIHRpbWluZ3Mg
dW5saWtlIHdoYXQgaXMgZGVjbGFyZWQgaW4gdGhlIHBhcmFtZXRlciBwYWdlLiBVbmZsYWcKPiA+
ICAgKiB0aGlzIGZlYXR1cmUgdG8gYXZvaWQgdW5uZWNlc3NhcnkgZG93bnR1cm5zLgo+ID4gICAq
Lwo+ID4gLXN0YXRpYyB2b2lkIG1hY3Jvbml4X25hbmRfZml4X2Jyb2tlbl9nZXRfdGltaW5ncyhz
dHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gLXsKPiA+IC0JdW5zaWduZWQgaW50IGk7Cj4gPiAt
CXN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgYnJva2VuX2dldF90aW1pbmdzW10gPSB7Cj4gPiAr
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBicm9rZW5fZ2V0X3RpbWluZ3NbXSA9IHsKPiA+ICAJ
CSJNWDMwTEYxRzE4QUMiLAo+ID4gIAkJIk1YMzBMRjFHMjhBQyIsCj4gPiAgCQkiTVgzMExGMkcx
OEFDIiwKPiA+IEBAIC03NSw3ICs3NiwxMSBAQCBzdGF0aWMgdm9pZCBtYWNyb25peF9uYW5kX2Zp
eF9icm9rZW5fZ2V0X3RpbWluZ3Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiA+ICAJCSJNWDMw
VUY0RzE4QUMiLAo+ID4gIAkJIk1YMzBVRjRHMTZBQyIsCj4gPiAgCQkiTVgzMFVGNEcyOEFDIiwK
PiA+IC0JfTsKPiA+ICt9Owo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIG1hY3Jvbml4X25hbmRfZml4
X2Jyb2tlbl9nZXRfdGltaW5ncyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gK3sKPiA+ICsJ
dW5zaWduZWQgaW50IGk7Cj4gPiAgCj4gPiAgCWlmICghY2hpcC0+cGFyYW1ldGVycy5zdXBwb3J0
c19zZXRfZ2V0X2ZlYXR1cmVzKQo+ID4gIAkJcmV0dXJuOwo+ID4gQEAgLTEwNSw2ICsxMTAsNzEg
QEAgc3RhdGljIGludCBtYWNyb25peF9uYW5kX2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkK
PiA+ICAJcmV0dXJuIDA7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgbXhpY19uYW5kX2xv
Y2soc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMsIHVpbnQ2NF90IGxlbikKPiA+ICt7
Cj4gPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGRfdG9fbmFuZChtdGQpOwo+ID4gKwl1
OCBmZWF0dXJlW09ORklfU1VCRkVBVFVSRV9QQVJBTV9MRU5dOwo+ID4gKwlpbnQgcmV0Owo+ID4g
Kwo+ID4gKwlmZWF0dXJlWzBdID0gTVhJQ19CTE9DS19QUk9URUNUSU9OX0FMTF9MT0NLOwo+ID4g
KwluYW5kX3NlbGVjdF90YXJnZXQoY2hpcCwgMCk7Cj4gPiArCXJldCA9IG5hbmRfc2V0X2ZlYXR1
cmVzKGNoaXAsIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVDVElPTiwKPiA+ICsJCQkJZmVh
dHVyZSk7Cj4gPiArCW5hbmRfZGVzZWxlY3RfdGFyZ2V0KGNoaXApOwo+ID4gKwlpZiAocmV0KQo+
ID4gKwkJcHJfZXJyKCIlcyBhbGwgYmxvY2tzIGZhaWxlZFxuIiwgX19mdW5jX18pOwo+ID4gKwo+
ID4gKwlyZXR1cm4gcmV0Owo+ID4gK30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IG14aWNfbmFuZF91
bmxvY2soc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMsIHVpbnQ2NF90IGxlbikKPiA+
ICt7Cj4gPiArCXN0cnVjdCBuYW5kX2NoaXAgKmNoaXAgPSBtdGRfdG9fbmFuZChtdGQpOwo+ID4g
Kwl1OCBmZWF0dXJlW09ORklfU1VCRkVBVFVSRV9QQVJBTV9MRU5dOwo+ID4gKwlpbnQgcmV0Owo+
ID4gKwo+ID4gKwlmZWF0dXJlWzBdID0gTVhJQ19CTE9DS19QUk9URUNUSU9OX0FMTF9VTkxPQ0s7
Cj4gPiArCW5hbmRfc2VsZWN0X3RhcmdldChjaGlwLCAwKTsKPiA+ICsJcmV0ID0gbmFuZF9zZXRf
ZmVhdHVyZXMoY2hpcCwgT05GSV9GRUFUVVJFX0FERFJfTVhJQ19QUk9URUNUSU9OLAo+ID4gKwkJ
CQlmZWF0dXJlKTsKPiA+ICsJbmFuZF9kZXNlbGVjdF90YXJnZXQoY2hpcCk7Cj4gPiArCWlmIChy
ZXQpCj4gPiArCQlwcl9lcnIoIiVzIGFsbCBibG9ja3MgZmFpbGVkXG4iLCBfX2Z1bmNfXyk7Cj4g
PiArCj4gPiArCXJldHVybiByZXQ7Cj4gPiArfQo+ID4gKwo+ID4gKy8qCj4gPiArICogTWFjcm9u
aXggQUMgc2VyaWVzIHN1cHBvcnQgdXNpbmcgU0VUL0dFVF9GRUFUVVJFUyB0byBjaGFuZ2UKPiA+
ICsgKiBCbG9jayBQcm90ZWN0aW9uIGFuZCBVbnByb3RlY3Rpb24uCj4gPiArICoKPiA+ICsgKiBN
VEQgY2FsbC1iYWNrIGZ1bmN0aW9uIHJlcGxhY2VtZW50IGJ5IG1hbnVmYWN0dXJlciBwb3N0cG9u
ZWQKPiA+ICsgKiBpbml0aWFsaXphdGlvbi4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgdm9pZCBtYWNy
b25peF9uYW5kX3Bvc3RfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+ID4gK3sKPiA+ICsJ
dW5zaWduZWQgaW50IGksIGJsb2NrcHJvdGVjdGVkID0gMDsKPiA+ICsJc3RydWN0IG10ZF9pbmZv
ICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiA+ICsKPiA+ICsJZm9yIChpID0gMDsgaSA8IEFS
UkFZX1NJWkUoYnJva2VuX2dldF90aW1pbmdzKTsgaSsrKSB7Cj4gPiArCQlpZiAoIXN0cmNtcChi
cm9rZW5fZ2V0X3RpbWluZ3NbaV0sIGNoaXAtPnBhcmFtZXRlcnMubW9kZWwpKSB7Cj4gPiArCQkJ
YmxvY2twcm90ZWN0ZWQgPSAxOwo+ID4gKwkJCWJyZWFrOwo+ID4gKwkJfQo+ID4gKwl9Cj4gPiAr
Cj4gPiArCWlmIChibG9ja3Byb3RlY3RlZCAmJiBjaGlwLT5wYXJhbWV0ZXJzLnN1cHBvcnRzX3Nl
dF9nZXRfZmVhdHVyZXMpIHsKPiA+ICsJCWJpdG1hcF9zZXQoY2hpcC0+cGFyYW1ldGVycy5zZXRf
ZmVhdHVyZV9saXN0LAo+ID4gKwkJCSAgIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVDVElP
TiwgMSk7Cj4gPiArCQliaXRtYXBfc2V0KGNoaXAtPnBhcmFtZXRlcnMuZ2V0X2ZlYXR1cmVfbGlz
dCwKPiA+ICsJCQkgICBPTkZJX0ZFQVRVUkVfQUREUl9NWElDX1BST1RFQ1RJT04sIDEpOwo+ID4g
Kwo+ID4gKwkJbXRkLT5fbG9jayA9IG14aWNfbmFuZF9sb2NrOwo+ID4gKwkJbXRkLT5fdW5sb2Nr
ID0gbXhpY19uYW5kX3VubG9jazsKPiA+ICsJfQo+ID4gK30KPiA+ICsKPiA+ICBjb25zdCBzdHJ1
Y3QgbmFuZF9tYW51ZmFjdHVyZXJfb3BzIG1hY3Jvbml4X25hbmRfbWFudWZfb3BzID0gewo+ID4g
IAkuaW5pdCA9IG1hY3Jvbml4X25hbmRfaW5pdCwKPiA+ICsJLnBvc3RfaW5pdCA9IG1hY3Jvbml4
X25hbmRfcG9zdF9pbml0LAo+ID4gIH07ICAKPiAKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
