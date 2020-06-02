Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EA7EC433DF
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 07:06:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51FC8206A2
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 07:06:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BT3IhsRy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51FC8206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzzbG0XNb0cpVywThnWXbSgRsPTD8EQgSI1ndqtCS4U=; b=BT3IhsRyrWY3Jj
	aj/y3f8LF1FdQb0kcKUSgA7ZfJMFj8FfSgp81kBxe7iBy9xnBpw0zlTlxw7wzeGr6jKsl6J4lDxEK
	GNwdUzWpMW7r9uwUbdngH44ddJc0+D0vTFbQsNIW6oHbul8zJZlqa+U3hT8T5nx5XzXO0II338Xft
	2OzohbfBHAXuaEYzIThBcBRbZctfSJeDOCVdo6ajrEFq0MjRyjFclLoOi7ZSnEXWiJPPa1jKwWzlp
	6BZ6hxYdF2amSCQG59/216I3JFq6vtI+brSncD1V7r/VLxOViasWtTg0gDmxNQF4+ALzGt7hbvdO4
	bfNq+D2TF3N1FqRyDr0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg0zr-0001s1-A5; Tue, 02 Jun 2020 07:06:03 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg0zn-0001r4-Rk
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2020 07:06:01 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 39728FF807;
 Tue,  2 Jun 2020 07:05:52 +0000 (UTC)
Date: Tue, 2 Jun 2020 09:05:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bean Huo <huobean@gmail.com>
Subject: Re: [PATCH v6 0/5] Micron SLC NAND filling block
Message-ID: <20200602090550.2e6403f3@xps13>
In-Reply-To: <0a4fc94213ca5c2040796a66942f626587483721.camel@gmail.com>
References: <20200525121814.31934-1-huobean@gmail.com>
 <829d76189beff5a50ddc56123d22bff3aa6a3378.camel@gmail.com>
 <0a4fc94213ca5c2040796a66942f626587483721.camel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_000600_031846_FAABC822 
X-CRM114-Status: GOOD (  16.03  )
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
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, derosier@gmail.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8KCkJlYW4gSHVvIDxodW9iZWFuQGdtYWlsLmNvbT4gd3JvdGUgb24gTW9uLCAwMSBKdW4g
MjAyMCAyMzoxMDo0MyArMDIwMDoKCj4gSGkgUmljaGFyZCAKPiB3b3VsZCB5b3UgcGxlYXNlIGhl
bHAgdXMgY29uZmlybSBiZWxvdyBxdWVzdGlvbj8/Cj4gCj4gVGhhbmtzLAo+IEJlYW4KPiAKPiBP
biBUaHUsIDIwMjAtMDUtMjggYXQgMTY6MTQgKzAyMDAsIEJlYW4gSHVvIHdyb3RlOgo+ID4gaGks
IFJpY2hhcmQKPiA+IAo+ID4gCj4gPiBPbiBNb24sIDIwMjAtMDUtMjUgYXQgMTQ6MTggKzAyMDAs
IEJlYW4gSHVvIHdyb3RlOiAgCj4gPiA+IEFmdGVyIHN1Ym1pc3Npb24gb2YgcGF0Y2ggVjEgWzFd
IGFuZCBWMiBbMl0sIHdlIHN0b3BwZWQgaXRzIHVwZGF0ZQo+ID4gPiBzaW5jZSB3ZSBnZXQKPiA+
ID4gc3R1Y2sgaW4gdGhlIHNvbHV0aW9uIG9uIGhvdyB0byBhdm9pZCB0aGUgcG93ZXItbG9zcyBp
c3N1ZSBpbiBjYXNlCj4gPiA+IHBvd2VyLWN1dAo+ID4gPiBoaXRzIHRoZSBibG9jayBmaWxsaW5n
LiBJbiB0aGUgdjEgYW5kIHYyLCB0byBhdm9pZCB0aGlzIGlzc3VlLCB3ZQo+ID4gPiBhbHdheXMg
ZGFtYWdlZAo+ID4gPiBwYWdlMCwgcGFnZTEsIHRoaXMncyBiYXNlZCBvbiB0aGUgaHlwb3RoZXNp
cyB0aGF0IE5BTkQgRlMgaXMgVUJJRlMuCj4gPiA+IFRoaXMKPiA+ID4gRlMtc3BlY2lmaWNhbCBj
b2RlIGlzIHVuYWNjZXB0YWJsZSBpbiB0aGUgTVREIGxheWVyLiBBbHNvLCBpdAo+ID4gPiBjYW5u
b3QKPiA+ID4gY292ZXIgYWxsCj4gPiA+IE5BTkQgYmFzZWQgZmlsZSBzeXN0ZW0uIEJhc2VkIG9u
IHRoZSBjdXJyZW50IGRpc2N1c3Npb24sIHNlZW1zIHRoYXQKPiA+ID4gcmUtd3JpdGUgYWxsCj4g
PiA+IGZpcnN0IDE1IHBhZ2UgZnJvbSBwYWdlMCBpcyBhIHNhdGlzZmFjdG9yeSBzb2x1dGlvbi4g
IAo+ID4gICAKPiAKPiA+IFRoaXMgcGF0Y2ggaGFzIG92ZXJ3cml0ZSBwYWdlMH5wYWdlMTQsIGRh
bWFnZSBFQyBhbmQgVklEIGhlYWRlcgo+ID4gYm90aHMuCj4gPiBJIGtub3cgdGhpcyBpcyBzYWZl
IGZvciBVQklGUywgZXZlbiBmYXN0bWFwIGlzIGVuYWJsZWQgKHlvdSBmaXhlZAo+ID4gdGhpcyBp
biAodWJpOiBmYXN0bWFwOiBDb3JyZWN0bHkgaGFuZGxlIGludGVycnVwdGVkIGVyYXN1cmVzIGlu
Cj4gPiBFQkEpKS4KPiA+IE5vdywgaG93IGFib3V0IGpmZnMyPyAKPiA+IAo+ID4gCj4gPiBUaGFu
a3MsCj4gPiBCZWFuCj4gPiAgIAo+IAoKRllJLCBCZWFuIGFscmVhZHkgYXNrZXMgbWUgcHJpdmF0
ZWx5IGFuZCBoZXJlIHdhcyBteSBhbnN3ZXIuIEZlZWwgZnJlZQp0byBjb21tZW50LgoKLS0tODwt
LS0KSSdtIG5vdCBzdXJlIHdlIGFyZSBzeW5jZWQgb24gdGhpcyBpc3N1ZSwgYmVjYXVzZSBpdCBp
cyBjbGVhcmx5Cm5vdCBhZGRyZXNzZWQgaW4geW91ciBwYXRjaHNldC4KClF1b3RpbmcgUmljaGFy
ZCwgdGhlIHViaWZzIGxvZyB1c2VzIGEgZml4ZWQgcmFuZ2Ugb2YgTEVCcy4gSXQgcmVwbGF5cwp0
aGVtIHVwb24gbW91bnQgYW5kIGNoZWNrcyB3aGV0aGVyIHRoZXkgYXJlIGVtcHR5LCBuZXcgb3Ig
b3V0ZGF0ZWQgcmVmcwppdCBhc3N1bWVzIHRoYXQgaW50ZXJydXB0ZWQgZXJhc2UgZ290IGRldGVj
cmVkIGJ5IFVCSSBhbmQgc3VjaCBhIExFQgp3aWxsIGp1c3QgY29udGFpbiAweEZGIGJ5dGVzLiBS
ZXdyaXRpbmcgdGhlIHBhZ2UgYmVmb3JlIGVyYXNlIGJhc2ljYWxseQpmYWlscyB0aGlzIGFzc3Vt
cHRpb24uCgpGb3IgSkZGUzIsIHRoZSBwcm9ibGVtIGlzIHRoZSBjbGVhbiBtYXJrZXIuIFlvdSBj
YW5ub3QgZGVzdHJveSB0aGUKcGF5bG9hZCB3aGlsZSBrZWVwaW5nIHRoZSBjbGVhbiBtYXJrZXIg
d2hpY2ggc2F5cyAidGhpcyBibG9jayBpcyBmaW5lCmFuZCBjb250YWluIGRhdGEiLgoKQWxzbywg
aWYgeW91IGRlc3Ryb3kgdGhlIGNsZWFuIG1hcmtlciwgeW91IG5lZWQgdG8gdGFrZSBjYXJlIG9m
IG5vdAp0dXJuaW5nIHRoZSBibG9jayBiZWluZyBkaXNjb3ZlcmVkIGFzICJiYWQiIGF0IHJlYm9v
dCB0aW1lIGlmIGEgcG93ZXIKY3V0IGhhcHBlbnMgYmVmb3JlIHRoZSBlcmFzdXJlLgoKQWxsIG9m
IHRoaXMgaXMgbm90IGltcG9zc2libGUgYnV0OgotIHdlIG5lZWQgdG8gd3JpdGUgc3BlY2lmaWMg
Y29kZSBmb3IgZWFjaCB1c2VyCi0gd2UgZG9uJ3Qgd2FudCB0byBjcmVhdGUgbW9yZSBwcm9ibGVt
cyB0aGF0IHdlIGFscmVhZHkgaGF2ZQoKSSBjYW5ub3QgZ2l2ZSB5b3UgbW9yZSBkZXRhaWxzIGJl
Y2F1c2UgdGhpcyBpcyBub3Qgc29tZXRoaW5nIHRoYXQgSQptYXN0ZXIuIEFzayBSaWNoYXJkIGRp
cmVjdGx5IGlmIHlvdSBuZWVkIG1vcmUgZGV0YWlscyBvbiB0aGlzLgotLS0+OC0tLQoKQ2hlZXJz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
