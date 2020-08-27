Return-Path: <SRS0=zDbm=CF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F02C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 12:47:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C9122CAE
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2020 12:47:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z+drBo7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C9122CAE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CIcUqo6OC8Idc/vE22E77n0cvcut8o9gSSKaBIafAhM=; b=z+drBo7BFrwdUpOZmkPteqwf2
	D7KGcpOkTC5/vhQHRKhHqXrOGIGXMlgnPy/Nczpwm0C+EF6Sqipkbjolc8/UT60gFJ0HiBd+63LuM
	CUI+UXbztP5mIyDS/XafWr+nJ+bxbrs3Bu47FWbsq4DuvLVRRoqlLFYdgTxKjnTIv/PdQ6E9/PMI/
	vdUIR6nwVKl6Syg73MMp9xU3uY8mBYEQAGzPePy4PanZt+KvF9pwx7rGXFj7A0zANCeE6eB/QZsyY
	SdzfOFpoHSOEy04hLfnOklr2awayM0gu7gQFq25/4iWImwHkXSVFm6Bp94vd5oAKQTVIwqudY40bs
	K7v6uCWqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBHID-00076p-Lr; Thu, 27 Aug 2020 12:46:13 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBHI8-00075p-2x
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2020 12:46:11 +0000
X-Originating-IP: 77.204.107.57
Received: from xps13 (57.107.204.77.rev.sfr.net [77.204.107.57])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 37F96E0008;
 Thu, 27 Aug 2020 12:46:02 +0000 (UTC)
Date: Thu, 27 Aug 2020 14:46:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Bond <jameslouisebond@gmail.com>
Subject: Re: [PATCH] mtd: ck804xrom: fix missing pci device put in error paths
Message-ID: <20200827144600.2ec7c4ab@xps13>
In-Reply-To: <20200821070537.30317-1-jameslouisebond@gmail.com>
References: <20200821070537.30317-1-jameslouisebond@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_084608_241799_32BF141C 
X-CRM114-Status: GOOD (  16.79  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Ryan Jackson <rjackson@lnxi.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmFtZXMsCgpKYW1lcyBCb25kIDxqYW1lc2xvdWlzZWJvbmRAZ21haWwuY29tPiB3cm90ZSBv
biBGcmksIDIxIEF1ZyAyMDIwCjAyOjA1OjM2IC0wNTAwOgoKPiBwY2lfZGV2X2dldCBpbmNyZWFz
ZXMgdGhlIHJlZmNvdW50IG9mICJwZGV2Ii4KPiBJbiB0aGUgZXJyb3IgcGF0aHMsIHBjaV9kZXZf
cHV0IHNob3VsZCBiZSBjYWxsZWQKPiB0byBoYW5kbGUgdGhlICJwZGV2IiBhbmQgZGVjcmVhc2Ug
dGhlIGNvcnJlc3BvbmRpbmcgcmVmY291bnQuCj4gCj4gRml4ZXM6IDkwYWZmZmM4YmQ3OSAoIltN
VERdIFtNQVBTXSBTdXBwb3J0IGZvciBCSU9TIGZsYXNoIGNoaXBzIG9uIHRoZSBudmlkaWEgY2s4
MDQgc291dGhicmlkZ2UiKQo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEJvbmQgPGphbWVzbG91aXNl
Ym9uZEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL21hcHMvY2s4MDR4cm9tLmMgfCAz
ICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL21hcHMvY2s4MDR4cm9tLmMgYi9kcml2ZXJzL210ZC9tYXBzL2NrODA0eHJv
bS5jCj4gaW5kZXggNDYwNDk0MjEyZjZhLi4xNmFmOGI1ZWU2NTMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvbWFwcy9jazgwNHhyb20uYwo+ICsrKyBiL2RyaXZlcnMvbXRkL21hcHMvY2s4MDR4
cm9tLmMKPiBAQCAtMTk1LDYgKzE5NSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNrODA0eHJvbV9p
bml0X29uZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgCWlmICghd2luZG93LT52aXJ0KSB7Cj4g
IAkJcHJpbnRrKEtFUk5fRVJSIE1PRF9OQU1FICI6IGlvcmVtYXAoJTA4bHgsICUwOGx4KSBmYWls
ZWRcbiIsCj4gIAkJCXdpbmRvdy0+cGh5cywgd2luZG93LT5zaXplKTsKPiArCQlwY2lfZGV2X3B1
dChwZGV2KTsKPiAgCQlnb3RvIG91dDsKPiAgCX0KPiAgCj4gQEAgLTIyMiw2ICsyMjMsNyBAQCBz
dGF0aWMgaW50IF9faW5pdCBjazgwNHhyb21faW5pdF9vbmUoc3RydWN0IHBjaV9kZXYgKnBkZXYs
Cj4gIAo+ICAJCWlmICghbWFwKSB7Cj4gIAkJCXByaW50ayhLRVJOX0VSUiBNT0RfTkFNRSAiOiBr
bWFsbG9jIGZhaWxlZCIpOwo+ICsJCQlwY2lfZGV2X3B1dChwZGV2KTsKPiAgCQkJZ290byBvdXQ7
Cj4gIAkJfQo+ICAJCW1lbXNldChtYXAsIDAsIHNpemVvZigqbWFwKSk7Cj4gQEAgLTI5NSw2ICsy
OTcsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBjazgwNHhyb21faW5pdF9vbmUoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsCj4gIAkJaWYgKG10ZF9kZXZpY2VfcmVnaXN0ZXIobWFwLT5tdGQsIE5VTEwsIDAp
KSB7Cj4gIAkJCW1hcF9kZXN0cm95KG1hcC0+bXRkKTsKPiAgCQkJbWFwLT5tdGQgPSBOVUxMOwo+
ICsJCQlwY2lfZGV2X3B1dChwZGV2KTsKPiAgCQkJZ290byBvdXQ7Cj4gIAkJfQo+ICAKCkkgc3Vw
cG9zZSBpbiB0aGVzZSB0aHJlZSBjYXNlcywgdGhlIHdpbmRvdy0+bWFwcyBsaXN0IHdpbGwgYmUg
ZW1wdHkgYW5kCnlvdSB3aWxsIGVuZCB1cCByZXR1cm5pbmcgLUVOT0RFViBhbmQgdGhlIGJvdHRv
bSBvZiB0aGUgZnVuY3Rpb24/IElmCnllcywgaXQgd291ZGwgcHJvYmFibHkgYmUgYmV0dGVyIHRv
IG1vdmUgdGhlc2UgcGNpX2Rldl9wdXQoKSBjYWxscyB0bwp0aGlzIGxvY2F0aW9uLgoKT3RoZXJ3
aXNlLCBpdCBtaWdodCBiaXQgaW50ZXJlc3RpbmcgdG8gY2xlYW4gdXAgYSBsaXR0bGUgYml0IHRo
ZSBlcnJvcgpwYXRoIGFuZCBwZXJoYXBzIGhhdmUgYSBkaXN0aW5jdCBzdWNjZXNzIHZzLiBmYWls
dXJlIHBhdGguCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
