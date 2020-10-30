Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F18C4741F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:49:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF8020A8B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dEOnQ3qu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF8020A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wmixE777wKlb9yTDJeAhCqazQl1xmQLdZkId75R0Zok=; b=dEOnQ3quh47W4kcVjnbTADLAA
	avEZkJsnuMGYNPlETviWiHxhwSNRAp1+xQnAVKTyDAt62L19BMmEWFbeJHRswLVKf5J1KjGTFCok/
	fCU095pU51aqfl9BzwLPn1R2cd+P49MOUcSVaEGtH3W857mFduOpDq/Z0TWHI5ZH34Zs+2JI8P195
	SRPJzRgcL5LfSWPKX4nngiQ26NSpW2+MGuCGA2IlNhgeptf9iCywW7q8PkBK1Cz3oN4BALkrSezny
	vjMHP/WUkcz8RaJZ68oyYkQKhcpII0JZUnk5CW6lRDlFclaJkft+I9jtsDx1MOx7QdlWK0pTn18A/
	AfMwvNW9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYV5-0002SQ-1B; Fri, 30 Oct 2020 17:47:43 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYV2-0002RK-90
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:47:41 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B88B1C000A;
 Fri, 30 Oct 2020 17:47:37 +0000 (UTC)
Date: Fri, 30 Oct 2020 18:47:36 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Message-ID: <20201030184736.4ec434f5@xps13>
In-Reply-To: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
References: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_134740_433156_9339442E 
X-CRM114-Status: GOOD (  18.19  )
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
Cc: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9ha2ltLAoKUGxlYXNlIENjIHRoZSBNVEQgbWFpbnRhaW5lcnMsIG5vdCBvbmx5IHRoZSBs
aXN0IChnZXRfbWFpbnRhaW5lcnMucGwpLgoKSm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJu
bHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlIG9uIFRodSwgMjIgT2N0CjIwMjAgMTc6NDU6MDYgKzAy
MDA6Cgo+IENvbW1pdCAibXRkOiBjZmlfY21kc2V0XzAwMDI6IEFkZCBzdXBwb3J0IGZvciBwb2xs
aW5nIHN0YXR1cyByZWdpc3RlciIKPiBhZGRlZCBzdXBwb3J0IGZvciBwb2xsaW5nIHRoZSBzdGF0
dXMgcmF0aGVyIHRoYW4gdXNpbmcgRFEgcG9sbGluZy4KPiBIb3dldmVyLCBzdGF0dXMgcmVnaXN0
ZXIgaXMgdXNlZCBvbmx5IHdoZW4gRFEgcG9sbGluZyBpcyBtaXNzaW5nLgo+IExldHMgdXNlIHN0
YXR1cyByZWdpc3RlciB3aGVuIGF2YWlsYWJsZSBhcyBpdCBpcyBzdXBlcmlvciB0byBEUSBwb2xs
aW5nLgo+IAoKSSB3aWxsIGxldCB2aWduZXNoIGNvbW1lbnQgYWJvdXQgdGhlIGNvbnRlbnQgKGxv
b2tzIGZpbmUgYnkgbWUpIGJ1dCB5b3Ugd2lsbApuZWVkIGEgRml4ZXMgdGFnIGhlcmUuCgo+IFNp
Z25lZC1vZmYtYnk6IEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEu
Y29tPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gIGRyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvY2hpcHMv
Y2ZpX2NtZHNldF8wMDAyLmMgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYwo+
IGluZGV4IGExZjNlMTAzMWMzZC4uZWU5YjMyMmU2M2JiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
bXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2Zp
X2NtZHNldF8wMDAyLmMKPiBAQCAtMTE3LDcgKzExNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgbXRkX2No
aXBfZHJpdmVyIGNmaV9hbWRzdGRfY2hpcGRydiA9IHsKPiAgc3RhdGljIGludCBjZmlfdXNlX3N0
YXR1c19yZWcoc3RydWN0IGNmaV9wcml2YXRlICpjZmkpCj4gIHsKPiAgCXN0cnVjdCBjZmlfcHJp
X2FtZHN0ZCAqZXh0cCA9IGNmaS0+Y21kc2V0X3ByaXY7Cj4gLQl1OCBwb2xsX21hc2sgPSBDRklf
UE9MTF9TVEFUVVNfUkVHIHwgQ0ZJX1BPTExfRFE7Cj4gKwl1OCBwb2xsX21hc2sgPSBDRklfUE9M
TF9TVEFUVVNfUkVHOwo+ICAKPiAgCXJldHVybiBleHRwLT5NaW5vclZlcnNpb24gPj0gJzUnICYm
Cj4gIAkJKGV4dHAtPlNvZnR3YXJlRmVhdHVyZXMgJiBwb2xsX21hc2spID09IENGSV9QT0xMX1NU
QVRVU19SRUc7CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
