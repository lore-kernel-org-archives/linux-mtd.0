Return-Path: <SRS0=6eB4=YA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85162C4740A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:46:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 536B92064A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2019 08:46:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FVsW5wwD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="d0ab5WqK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 536B92064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRvixjS9iF1YD+H8A/kFr1JsTvKFtPaAyMGGVDe28bg=; b=FVsW5wwDeCtrqS
	nto0P6PnshGd0pMlXySM/zXi0BfeuQBqT9jDPvF93/wrx9astb73bboAhSdFg8l73a6FUcNv2VCj5
	rZe26SfXUTSAtQnX+AzGKEezaL8VsW7kltweAFBkPYVjzW9gxm3FExxoWJJ32SouLsRWZhWTzUy+B
	Lx8x3Lawjhc79qBb6ADws4SzeQDUDhrVtl5Tt32wrSBt0VmwX/ONR4Kf6OfBnkE7kYxldLDm22sfy
	/QJ3ImTGS5Q9LaWLewhfWNRevgt/vwwn/f2F78QQ0A9y1sDPsO2UmX21Qo8Cb5TRaA0cLxSydIfwy
	PYk57KjS5JtX3gowVFnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHOeh-0008K4-OY; Mon, 07 Oct 2019 08:46:11 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHOea-00084H-5b
 for linux-mtd@bombadil.infradead.org; Mon, 07 Oct 2019 08:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKLzd4HX7sr9L651cSewS81Z5E9fE+mF+U7HEC04mZg=; b=d0ab5WqKdY1kjdreV8maJLOU4c
 XVVsNYb7XL1jTo3zcjK0aIw0ExRMl2bi09Ay82YSUAW8pTXMSthGsoDEDdw21jQe1ZzZHNM3knC0v
 tY2Vhf7HRn7eSX9ZTL+rIo9OpPbjYUDfUeZ0x9XlmS69V1w8NbXTPFY7GqyW6nMG+dAEfwDoaAVqJ
 mjJuOX2ajqFWCcm9SjcQwyj6LluaS2AOfX15mG+Y8qfYE3/fFglzZZipFyP7kUUleRidrzPMN6xm+
 UDngtzuiIvGBRTGLrg6gMllNQU+zk00sjlYlfqLDdJjF7fWde79IloLRZghY5XuWkNUssZmCZw/iE
 C+6BGaSA==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHOeV-0000JV-QC
 for linux-mtd@lists.infradead.org; Mon, 07 Oct 2019 08:46:01 +0000
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E24661C0015;
 Mon,  7 Oct 2019 08:45:11 +0000 (UTC)
Date: Mon, 7 Oct 2019 10:45:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH RFC 2/3] mtd: rawnand: Add support Macronix Block
 Protection function
Message-ID: <20191007104511.5aa7b8f2@xps13>
In-Reply-To: <1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-2-git-send-email-masonccyang@mxic.com.tw>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

SGkgTWFzb24sCgpNYXNvbiBZYW5nIDxtYXNvbmNjeWFuZ0BteGljLmNvbS50dz4gd3JvdGUgb24g
V2VkLCAxOCBTZXAgMjAxOSAxNTo1NjoyNQorMDgwMDoKCj4gTWFjcm9uaXggQUMgc2VyaWVzIHN1
cHBvcnQgdXNpbmcgU0VUL0dFVF9GRUFUVVJFUyB0byBjaGFuZ2UKPiBCbG9jayBQcm90ZWN0aW9u
IGFuZCBVbnByb3RlY3Rpb24uCj4gCj4gTVREIGRlZmF1bHQgX2xvY2svX3VubG9jayBmdW5jdGlv
biByZXBsYWNlbWVudCBieSBtYW51ZmFjdHVyZXIKPiBwb3N0cG9uZWQgaW5pdGlhbGl6YXRpb24u
CgpXaHkgd291bGQgd2UgZG8gdGhhdD8KCkFueXdheSB5b3VyIHNvbHV0aW9uIGxvb2tzIG92ZXJr
aWxsLCBpZiB3ZSBldmVyIGRlY2lkZSB0bwppbXBsZW1lbnQgdGhlc2UgaG9va3MgZm9yIHJhdyBu
YW5kLCBpdCBpcyBiZXR0ZXIganVzdCB0byBub3QKb3ZlcndyaXRlIHRoZW0gaW4gbmFuZF9zY2Fu
X3RhaWwoKSBpZiB0aGV5IGhhdmUgYmVlbiBmaWxsZWQKcHJldmlvdXNseSAoaWUuIGJ5IHRoZSBt
YW51ZmFjdHVyZXIgY29kZSkuCgo+IFNpZ25lZC1vZmYtYnk6IE1hc29uIFlhbmcgPG1hc29uY2N5
YW5nQG14aWMuY29tLnR3Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX21hY3Jv
bml4LmMgfCA4MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfbWFjcm9uaXguYyBiL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRfbWFjcm9uaXguYwo+IGluZGV4IDU4NTExYWUuLjk5MWM2MzYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9tYWNyb25peC5jCj4gQEAgLTExLDYgKzExLDEwIEBACj4gICNk
ZWZpbmUgTUFDUk9OSVhfUkVBRF9SRVRSWV9CSVQgQklUKDApCj4gICNkZWZpbmUgTUFDUk9OSVhf
TlVNX1JFQURfUkVUUllfTU9ERVMgNgo+ICAKPiArI2RlZmluZSBPTkZJX0ZFQVRVUkVfQUREUl9N
WElDX1BST1RFQ1RJT04gMHhBMAo+ICsjZGVmaW5lIE1YSUNfQkxPQ0tfUFJPVEVDVElPTl9BTExf
TE9DSyAweDM4Cj4gKyNkZWZpbmUgTVhJQ19CTE9DS19QUk9URUNUSU9OX0FMTF9VTkxPQ0sgMHgw
Cj4gKwo+ICBzdHJ1Y3QgbmFuZF9vbmZpX3ZlbmRvcl9tYWNyb25peCB7Cj4gIAl1OCByZXNlcnZl
ZDsKPiAgCXU4IHJlbGlhYmlsaXR5X2Z1bmM7Cj4gQEAgLTU3LDEwICs2MSw3IEBAIHN0YXRpYyB2
b2lkIG1hY3Jvbml4X25hbmRfb25maV9pbml0KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gICAq
IHRoZSB0aW1pbmdzIHVubGlrZSB3aGF0IGlzIGRlY2xhcmVkIGluIHRoZSBwYXJhbWV0ZXIgcGFn
ZS4gVW5mbGFnCj4gICAqIHRoaXMgZmVhdHVyZSB0byBhdm9pZCB1bm5lY2Vzc2FyeSBkb3dudHVy
bnMuCj4gICAqLwo+IC1zdGF0aWMgdm9pZCBtYWNyb25peF9uYW5kX2ZpeF9icm9rZW5fZ2V0X3Rp
bWluZ3Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAtewo+IC0JdW5zaWduZWQgaW50IGk7Cj4g
LQlzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGJyb2tlbl9nZXRfdGltaW5nc1tdID0gewo+ICtz
dGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IGJyb2tlbl9nZXRfdGltaW5nc1tdID0gewo+ICAJCSJN
WDMwTEYxRzE4QUMiLAo+ICAJCSJNWDMwTEYxRzI4QUMiLAo+ICAJCSJNWDMwTEYyRzE4QUMiLAo+
IEBAIC03NSw3ICs3NiwxMSBAQCBzdGF0aWMgdm9pZCBtYWNyb25peF9uYW5kX2ZpeF9icm9rZW5f
Z2V0X3RpbWluZ3Moc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCQkiTVgzMFVGNEcxOEFDIiwK
PiAgCQkiTVgzMFVGNEcxNkFDIiwKPiAgCQkiTVgzMFVGNEcyOEFDIiwKPiAtCX07Cj4gK307Cj4g
Kwo+ICtzdGF0aWMgdm9pZCBtYWNyb25peF9uYW5kX2ZpeF9icm9rZW5fZ2V0X3RpbWluZ3Moc3Ry
dWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+ICsJdW5zaWduZWQgaW50IGk7Cj4gIAo+ICAJaWYg
KCFjaGlwLT5wYXJhbWV0ZXJzLnN1cHBvcnRzX3NldF9nZXRfZmVhdHVyZXMpCj4gIAkJcmV0dXJu
Owo+IEBAIC0xMDUsNiArMTEwLDcxIEBAIHN0YXRpYyBpbnQgbWFjcm9uaXhfbmFuZF9pbml0KHN0
cnVjdCBuYW5kX2NoaXAgKmNoaXApCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGljIGlu
dCBteGljX25hbmRfbG9jayhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcywgdWludDY0
X3QgbGVuKQo+ICt7Cj4gKwlzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwID0gbXRkX3RvX25hbmQobXRk
KTsKPiArCXU4IGZlYXR1cmVbT05GSV9TVUJGRUFUVVJFX1BBUkFNX0xFTl07Cj4gKwlpbnQgcmV0
Owo+ICsKPiArCWZlYXR1cmVbMF0gPSBNWElDX0JMT0NLX1BST1RFQ1RJT05fQUxMX0xPQ0s7Cj4g
KwluYW5kX3NlbGVjdF90YXJnZXQoY2hpcCwgMCk7Cj4gKwlyZXQgPSBuYW5kX3NldF9mZWF0dXJl
cyhjaGlwLCBPTkZJX0ZFQVRVUkVfQUREUl9NWElDX1BST1RFQ1RJT04sCj4gKwkJCQlmZWF0dXJl
KTsKPiArCW5hbmRfZGVzZWxlY3RfdGFyZ2V0KGNoaXApOwo+ICsJaWYgKHJldCkKPiArCQlwcl9l
cnIoIiVzIGFsbCBibG9ja3MgZmFpbGVkXG4iLCBfX2Z1bmNfXyk7Cj4gKwo+ICsJcmV0dXJuIHJl
dDsKPiArfQo+ICsKPiArc3RhdGljIGludCBteGljX25hbmRfdW5sb2NrKHN0cnVjdCBtdGRfaW5m
byAqbXRkLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdCBsZW4pCj4gK3sKPiArCXN0cnVjdCBuYW5kX2No
aXAgKmNoaXAgPSBtdGRfdG9fbmFuZChtdGQpOwo+ICsJdTggZmVhdHVyZVtPTkZJX1NVQkZFQVRV
UkVfUEFSQU1fTEVOXTsKPiArCWludCByZXQ7Cj4gKwo+ICsJZmVhdHVyZVswXSA9IE1YSUNfQkxP
Q0tfUFJPVEVDVElPTl9BTExfVU5MT0NLOwo+ICsJbmFuZF9zZWxlY3RfdGFyZ2V0KGNoaXAsIDAp
Owo+ICsJcmV0ID0gbmFuZF9zZXRfZmVhdHVyZXMoY2hpcCwgT05GSV9GRUFUVVJFX0FERFJfTVhJ
Q19QUk9URUNUSU9OLAo+ICsJCQkJZmVhdHVyZSk7Cj4gKwluYW5kX2Rlc2VsZWN0X3RhcmdldChj
aGlwKTsKPiArCWlmIChyZXQpCj4gKwkJcHJfZXJyKCIlcyBhbGwgYmxvY2tzIGZhaWxlZFxuIiwg
X19mdW5jX18pOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gKy8qCj4gKyAqIE1hY3Jv
bml4IEFDIHNlcmllcyBzdXBwb3J0IHVzaW5nIFNFVC9HRVRfRkVBVFVSRVMgdG8gY2hhbmdlCj4g
KyAqIEJsb2NrIFByb3RlY3Rpb24gYW5kIFVucHJvdGVjdGlvbi4KPiArICoKPiArICogTVREIGNh
bGwtYmFjayBmdW5jdGlvbiByZXBsYWNlbWVudCBieSBtYW51ZmFjdHVyZXIgcG9zdHBvbmVkCj4g
KyAqIGluaXRpYWxpemF0aW9uLgo+ICsgKi8KPiArc3RhdGljIHZvaWQgbWFjcm9uaXhfbmFuZF9w
b3N0X2luaXQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiArewo+ICsJdW5zaWduZWQgaW50IGks
IGJsb2NrcHJvdGVjdGVkID0gMDsKPiArCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gbmFuZF90b19t
dGQoY2hpcCk7Cj4gKwo+ICsJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoYnJva2VuX2dldF90
aW1pbmdzKTsgaSsrKSB7Cj4gKwkJaWYgKCFzdHJjbXAoYnJva2VuX2dldF90aW1pbmdzW2ldLCBj
aGlwLT5wYXJhbWV0ZXJzLm1vZGVsKSkgewo+ICsJCQlibG9ja3Byb3RlY3RlZCA9IDE7Cj4gKwkJ
CWJyZWFrOwo+ICsJCX0KPiArCX0KPiArCj4gKwlpZiAoYmxvY2twcm90ZWN0ZWQgJiYgY2hpcC0+
cGFyYW1ldGVycy5zdXBwb3J0c19zZXRfZ2V0X2ZlYXR1cmVzKSB7Cj4gKwkJYml0bWFwX3NldChj
aGlwLT5wYXJhbWV0ZXJzLnNldF9mZWF0dXJlX2xpc3QsCj4gKwkJCSAgIE9ORklfRkVBVFVSRV9B
RERSX01YSUNfUFJPVEVDVElPTiwgMSk7Cj4gKwkJYml0bWFwX3NldChjaGlwLT5wYXJhbWV0ZXJz
LmdldF9mZWF0dXJlX2xpc3QsCj4gKwkJCSAgIE9ORklfRkVBVFVSRV9BRERSX01YSUNfUFJPVEVD
VElPTiwgMSk7Cj4gKwo+ICsJCW10ZC0+X2xvY2sgPSBteGljX25hbmRfbG9jazsKPiArCQltdGQt
Pl91bmxvY2sgPSBteGljX25hbmRfdW5sb2NrOwo+ICsJfQo+ICt9Cj4gKwo+ICBjb25zdCBzdHJ1
Y3QgbmFuZF9tYW51ZmFjdHVyZXJfb3BzIG1hY3Jvbml4X25hbmRfbWFudWZfb3BzID0gewo+ICAJ
LmluaXQgPSBtYWNyb25peF9uYW5kX2luaXQsCj4gKwkucG9zdF9pbml0ID0gbWFjcm9uaXhfbmFu
ZF9wb3N0X2luaXQsCj4gIH07CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
