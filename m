Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D758DC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 17:04:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25FA760FE3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 17:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25FA760FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FmHybaV5SA+E8nnUL3iWegtqtOLoRT3/jpMx2SAzcR0=; b=DqhjTW32c+7OUbj7b07EMWA35
	oJtdjoRZ/n+5Um8a3RX44anE1Nu8bUYuAaPZaBdWcBuEgSGVGZ+ey/sha8sAqMV/x8ls9q3EsYazb
	kUHtZHtWYE+9Z855nM3rU5W4DgQ8x6tErNM3GXHgSGPcLQ6K1Q+wqn78mwyn8tWcHmzyQQkqctUL8
	NIFevp7R0cLaoWESni7KpTb7j0z7asnoH0SKLJCkkpFKsVaejh+qTnpTqjjRK1l6aXKUTvveUDylT
	o0SFqQSU/a9EighyMA26lOtEw2YuilF/sQ+UYQ1Q4gCFpGn9/QTiulzs5/xQWkWjAdwllUycvkbe8
	jJvNypQ4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg9JH-00F4sR-1k; Mon, 10 May 2021 17:03:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg9Gn-00F41Z-4B
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 17:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=VbncuI8j1h1+3ucx35SNHvtNo9StaGEiRrq645qNjx8=; b=ha7Qp0s67BCHQvU8PLylDfOEHX
 6slMiprX0w0LDeU9E+YJI7aY5X78fwkSBHxqDoZLJ8LD0CDYQgie26fosHdxuTipP/cB8aiUkj9F6
 oaPD/i91Js1lsmn5Vzn4iiNpeMwmABSKhyjAeSbZVgr9At4z2snoU+gSO9nUT9sFsQF5qAK/qnsRn
 NwPj0698SeM5HViXaw278eLxAzhN8YRDtxfQaKEPCqQqaUD6TPfN8O17aTII3oMEGptwN+sjgcWst
 W07XtmBGSkgZ0olk1liJCa/D1GF5PyRHBCF4vTOLJAkPG0d9BeR218TXmpgSOpzeJEBNt1/q0bcEb
 k/rfZ6kA==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg9Gk-008x5P-8V
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 17:00:35 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6EB5A20012;
 Mon, 10 May 2021 17:00:28 +0000 (UTC)
Date: Mon, 10 May 2021 19:00:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, Naga Sureshkumar Relli
 <nagasure@xilinx.com>, Michal Simek <monstr@monstr.eu>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 1/5] dt-binding: mtd: nand: Document gpio-cs property
Message-ID: <20210510190027.7bf97008@xps13>
In-Reply-To: <20210510165125.GA261277@robh.at.kernel.org>
References: <20210510104051.9701-1-miquel.raynal@bootlin.com>
 <20210510104051.9701-2-miquel.raynal@bootlin.com>
 <20210510165125.GA261277@robh.at.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_100034_466914_36B1FD1B 
X-CRM114-Status: GOOD (  25.42  )
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

SGkgUm9iLAoKUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGUgb24gTW9uLCAxMCBN
YXkgMjAyMSAxMTo1MToyNSAtMDUwMDoKCj4gT24gTW9uLCBNYXkgMTAsIDIwMjEgYXQgMTI6NDA6
NDdQTSArMDIwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRvIHJlYWNoIGhpZ2hlciBjYXBh
Y2l0aWVzLCBhcnJheXMgb2YgY2hpcHMgYXJlIG5vdyBwcmV0dHkgY29tbW9uLgo+ID4gVW5mb3J0
dW5hdGVseSwgbW9zdCBvZiB0aGUgY29udHJvbGxlcnMgaGF2ZSBiZWVuIGRlc2lnbmVkIGEgZGVj
YWRlIGFnbwo+ID4gYW5kIGRpZCBub3QgYWxsIGFudGljaXBhdGUgdGhlIG5lZWQgZm9yIHNldmVy
YWwgY2hpcC1zZWxlY3RzLiBUaGUgbmV3Cj4gPiBjcy1ncGlvcyBwcm9wZXJ0eSBhbGxvd3MgdG8g
d29ya2Fyb3VuZCB0aGlzIGxpbWl0YXRpb24gYnkgYWRkaW5nIGFzIG1hbnkKPiA+IEdQSU8gY2hp
cC1zZWxlY3QgYXMgbmVlZGVkLiAgCj4gCj4gU3ViamVjdCBhbmQgZXhhbXBsZSBoYXZlIHdyb25n
IHByb3BlcnR5IG5hbWUuCgpUcnVlLgoKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwgfCAxNiArKysrKysrKysrKysrKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+
ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbmFu
ZC1jb250cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L25hbmQtY29udHJvbGxlci55YW1sCj4gPiBpbmRleCA2NzhiMzk5NTI1MDIuLjcwYTQwMGUzODVi
MiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
bmFuZC1jb250cm9sbGVyLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvbmFuZC1jb250cm9sbGVyLnlhbWwKPiA+IEBAIC0zOCw2ICszOCwxNSBAQCBw
cm9wZXJ0aWVzOgo+ID4gIAo+ID4gICAgcmFuZ2VzOiB0cnVlCj4gPiAgCj4gPiArICBjcy1ncGlv
czoKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgQXJyYXkgb2YgY2hpcC1zZWxlY3Qg
YXZhaWxhYmxlIHRvIHRoZSBjb250cm9sbGVyLiBUaGUgZmlyc3QKPiA+ICsgICAgICBlbnRyaWVz
IGFyZSBhIDE6MSBtYXBwaW5nIG9mIHRoZSBhdmFpbGFibGUgY2hpcC1zZWxlY3Qgb24gdGhlCj4g
PiArICAgICAgTkFORCBjb250cm9sbGVyIChldmVuIGlmIHRoZXkgYXJlIG5vdCB1c2VkKS4gQXMg
bWFueSBhZGRpdGlvbmFsCj4gPiArICAgICAgY2hpcC1zZWxlY3QgYXMgbmVlZGVkIG1heSBmb2xs
b3cgYW5kIHNob3VsZCBiZSBwaGFuZGxlcyBvZiBHUElPCj4gPiArICAgICAgbGluZXMuICdyZWcn
IGVudHJpZXMgb2YgdGhlIE5BTkQgY2hpcCBzdWJub2RlcyBiZWNvbWUgaW5kZXhlcyBvZgo+ID4g
KyAgICAgIHRoaXMgYXJyYXkgd2hlbiB0aGlzIHByb3BlcnR5IGlzIHByZXNlbnQuICAKPiAKPiBD
YW4gd2UgcHV0IHNvbWUgJ21heEl0ZW1zJyB2YWx1ZSBoZXJlLiBJIHdhbnQgdG8gbWFrZSB0aGUg
bWV0YS1zY2hlbWEgCj4gZW5mb3JjZSB0aGF0LiBJIHJlYWxpemUgdGhlcmUncyBub3QgcmVhbGx5
IG9uZSBoZXJlLCBidXQgYSAnc2hvdWxkIGJlIAo+IGVub3VnaCcgdmFsdWUgaXMgZmluZS4gV2Ug
Y2FuIGJ1bXAgaXQgdXAgaWYgbmVlZGVkLgoKT2ssIEkgYWxyZWFkeSBoYXZlIGFuIGV4YW1wbGUg
d2l0aCA4IGVudHJpZXMsIHdlIGNhbiBzZXQgbWF4SXRlbXMgdG8gOAphbmQgc2VlIGhvdyBpdCBn
b2VzLgoKUGxlYXNlIGlnbm9yZSB2MyB3aGljaCB3YXMgc2VudCB0byBmaXggYW5vdGhlciB1bnJl
bGF0ZWQgaXNzdWUsIGF0IHRoZQpzYW1lIHRpbWUgeW91IHJldmlld2VkIHYyLgoKPiA+ICsKPiA+
ICBwYXR0ZXJuUHJvcGVydGllczoKPiA+ICAgICJebmFuZEBbYS1mMC05XSQiOgo+ID4gICAgICB0
eXBlOiBvYmplY3QKPiA+IEBAIC0xNjQsMTQgKzE3MywxOSBAQCBleGFtcGxlczoKPiA+ICAgICAg
bmFuZC1jb250cm9sbGVyIHsKPiA+ICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiA+ICAg
ICAgICAjc2l6ZS1jZWxscyA9IDwwPjsKPiA+ICsgICAgICBncGlvLWNzID0gPDA+LCA8JmdwaW9B
IDE+OyAvKiBBIHNpbmdsZSBuYXRpdmUgQ1MgaXMgYXZhaWxhYmxlICovCj4gPiAgCj4gPiAgICAg
ICAgLyogY29udHJvbGxlciBzcGVjaWZpYyBwcm9wZXJ0aWVzICovCj4gPiAgCj4gPiAgICAgICAg
bmFuZEAwIHsKPiA+IC0gICAgICAgIHJlZyA9IDwwPjsKPiA+ICsgICAgICAgIHJlZyA9IDwwPjsg
LyogTmF0aXZlIENTICovCj4gPiAgICAgICAgICBuYW5kLXVzZS1zb2Z0LWVjYy1lbmdpbmU7Cj4g
PiAgICAgICAgICBuYW5kLWVjYy1hbGdvID0gImJjaCI7Cj4gPiAgCj4gPiAgICAgICAgICAvKiBj
b250cm9sbGVyIHNwZWNpZmljIHByb3BlcnRpZXMgKi8KPiA+ICAgICAgICB9Owo+ID4gKwo+ID4g
KyAgICAgIG5hbmRAMSB7Cj4gPiArICAgICAgICByZWcgPSA8MT47IC8qIEdQSU8gQ1MgKi8KPiA+
ICsgICAgICB9Owo+ID4gICAgICB9Owo+ID4gLS0gCj4gPiAyLjI3LjAKPiA+ICAgCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
