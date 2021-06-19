Return-Path: <SRS0=ZPU8=LN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB82C2B9F4
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jun 2021 18:41:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 900DD611B0
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jun 2021 18:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 900DD611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLuQbuaDhW6TJdSf6I/OlHLjUm0falWFJYZ5dVjsANM=; b=tRg8lEciszR1Cb
	GvsvP+gfx6z7xXbBEfZUroDilDnmVv3YgxCprjaHe/2UyvtzBIA/4mwmQiXVTmDrFZaJHY9EkP1gW
	6RyM0GNEVCxvR57vkzr5Ewhu7RFyTuSVBBT9sdcWY9yQIXMPq+kqpdgy+G2JKvlxa2AXQ1vx3+4k6
	k71Q0EMOZmAF/MCjAvsOkM2TSp5nt2aFftwTr4VkgtI+wiH729r/cqyfOYrdeMLoJjT/O7lP7Taf9
	rf827AMRbhn2rI88wAQM239ffblzCDSPTwYBG1eDQATXxKhw2W1w/cE3eBZYSmWkBApiK70L6xpe0
	2girEVcEAdwZv6+jzzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lufti-00HQl5-Vi; Sat, 19 Jun 2021 18:40:51 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lufte-00HQhl-EA
 for linux-mtd@lists.infradead.org; Sat, 19 Jun 2021 18:40:48 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 28249200006;
 Sat, 19 Jun 2021 18:40:36 +0000 (UTC)
Date: Sat, 19 Jun 2021 20:40:35 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip
 (4b/512B)
Message-ID: <20210618225032.69cdc30c@xps13>
In-Reply-To: <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
 <20210618084326.0a074fb7@xps13>
 <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210619_114046_819757_C4AAE19E 
X-CRM114-Status: GOOD (  30.16  )
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

SGkgQ2hyaXN0b3BoZSwKCj4gPj4gTm93IGFuZCB0aGVuIEknbSB1c2luZyBvbmUgb2YgdGhlIGxh
dGVzdCBrZXJuZWxzIChUb2RheSBpcyA1LjEzLXJjNiksIGFuZCBzb21ldGltZSBpbiBvbmUgb2Yg
dGhlIDUueCByZWxlYXNlcywgSSBzdGFydGVkIHRvIGdldCBlcnJvcnMgbGlrZToKPiA+Pgo+ID4+
IFsgICAgNS4wOTgyNjVdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUND
IGVycm9yCj4gPj4gWyAgICA1LjEwMzg1OV0gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDogZXJy
b3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjAKPiA+PiAgICBieXRlcyBmcm9tIFBF
QiA5OTo1OTgyNCwgcmVhZCBvbmx5IDYwIGJ5dGVzLCByZXRyeQo+ID4+IFsgICAgNS41MjU4NDNd
IGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4gPj4gWyAg
ICA1LjUzMTU3MV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJy
b3IKPiA+PiBbICAgIDUuNTM3NDkwXSB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAt
NzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyAzMAo+ID4+IDczIGJ5dGVzIGZyb20gUEVCIDEw
NzoxMDg5NzYsIHJlYWQgb25seSAzMDczIGJ5dGVzLCByZXRyeQo+ID4+IFsgICAgNS42OTExMjFd
IGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4gPj4gWyAg
ICA1LjY5NjcwOV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJy
b3IKPiA+PiBbICAgIDUuNzAyNDI2XSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3Rh
YmxlIEVDQyBlcnJvcgo+ID4+IFsgICAgNS43MDgxNDFdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6
IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4gPj4gWyAgICA1LjcxNDEwM10gdWJpMCB3YXJuaW5n
OiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgMzAKPiA+
PiAzNSBieXRlcyBmcm9tIFBFQiAxMDc6MjUxNDQsIHJlYWQgb25seSAzMDM1IGJ5dGVzLCByZXRy
eQo+ID4+IFsgICAyMC41MjM2ODldIHJhbmRvbTogY3JuZyBpbml0IGRvbmUKPiA+PiBbICAgMjEu
ODkyMTMwXSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcgo+
ID4+IFsgICAyMS44OTc3MzBdIHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC03NCAo
RUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDEzCj4gPj4gOTQgYnl0ZXMgZnJvbSBQRUIgMTE2Ojc1
Nzc2LCByZWFkIG9ubHkgMTM5NCBieXRlcywgcmV0cnkKPiA+Pgo+ID4+IE1vc3Qgb2YgdGhlIHRp
bWUsIHdoZW4gdGhlIHJlYWRpbmcgb2YgdGhlIGZpbGUgZmFpbHMsIEkganVzdCBoYXZlIHRvIHJl
YWQgaXQgb25jZSBtb3JlIGFuZCBpdCBnZXRzIHJlYWQgd2l0aG91dCB0aGF0IGVycm9yLiAgCj4g
PiAKPiA+IEl0IHJlYWxseSBsb29rcyBsaWtlIGEgcmVndWxhciBiaXRmbGlwIGhhcHBlbmluZyAi
c29tZXRpbWVzIi4gSXMgdGhpcyBhCj4gPiBib2FyZCB3aGljaCBhbHJlYWR5IGhhZCBhIGxpZmU/
IFdoYXQgYXJlIHRoZSB1c2FnZSBjb3VudGVycyAoVUJJIHNob3VsZAo+ID4gdGVsbCB5b3UgdGhp
cykgY29tcGFyZWQgdG8gdGhlIG9mZmljaWFsIGVuZHVyYW5jZSBvZiB5b3VyIGNoaXAgKHNlZSB0
aGUKPiA+IGRhdGFzaGVldCk/ICAKPiAKPiBUaGUgYm9hcmQgaGFkIGEgcGVhY2VmdWxsIGxpZmU6
Cj4gCj4gVUJJIHJlcG9ydHMgInViaTA6IG1heC9tZWFuIGVyYXNlIGNvdW50ZXI6IDQ5LzIwLCBX
TCB0aHJlc2hvbGQ6IDQwOTYiCgpNbW1oLiBJbmRlZWQuCgo+IAo+IEkgaGF2ZSB0cmllZCB3aXRo
IGhhbGYgYSBkb3plbiBvZiBib2FyZHMgYW5kIGFsbCBoYXZlIHRoZSBpc3N1ZS4KPiAKPiA+ICAg
Cj4gPj4gV2hhdCBhbSBJIHN1cHBvc2VkIHRvIGRvIHRvIGF2b2lkIHRoZSBFQ0Mgd2Vha25lc3Mg
d2FybmluZyBhdCBzdGFydHVwIGFuZCB0byBmaXggdGhhdCBFQ0MgZXJyb3IgaXNzdWUgPyAgCj4g
PiAKPiA+IEkgaG9uZXN0bHkgZG9uJ3QgdGhpbmsgdGhlIGVycm9ycyBjb21lIGZyb20gdGhlIDUu
MXgga2VybmVscyBnaXZlbiB0aGUKPiA+IGFib3ZlIGxvZ3MuIElmIHlvdSBmbGFzaCBiYWNrIHlv
dXIgb2xkIDQuMTQgSSBhbSBwcmV0dHkgc3VyZSB5b3UnbGwKPiA+IGhhdmUgdGhlIHNhbWUgZXJy
b3JzIGF0IHNvbWUgcG9pbnQuICAKPiAKPiBJIGRvbid0IGhhdmUgYW55IHByb2JsZW0gbGlrZSB0
aGF0IHdpdGggNC4xNCB3aXRoIGFueSBvZiB0aGUgYm9hcmQuCj4gCj4gV2hlbiBib290aW5nIGEg
NC4xNCBrZXJuZWwgSSBkb24ndCBnZXQgYW55IHByb2JsZW0gb24gdGhlIHNhbWUgYm9hcmQuCj4g
CgpJZiB5b3UgY2FuIHJlbGlhYmx5IHNob3cgdGhhdCB3aGVuIHJldHVybmluZyB0byBhIDQuMTQg
a2VybmVsIHRoZSBFQ0MKd2Vha25lc3MgZGlzYXBwZWFycywgdGhlbiB0aGVyZSBpcyBjZXJ0YWlu
bHkgc29tZXRoaW5nIG5ldy4gV2hhdCBkcml2ZXIKYXJlIHlvdSB1c2luZz8gTWF5YmUgeW91IGNh
biBkbyBhIGJpc2VjdGlvbj8KCj4gPiAKPiA+IE5BTkQgcmVhbGx5IGlzIGEgZnJhZ2lsZSBzdG9y
YWdlIG1lZGl1bSwgbm90IGZvbGxvd2luZyBpbiBhIHByb2R1Y3Rpb24KPiA+IGVudmlyb25tZW50
IHRoZSBtaW5pbXVtIEVDQyBzY2hlbWUgKHRoZXJlIGlzIGEgcmVhbCBkaWZmZXJlbmNlIGJldHdl
ZW4KPiA+IDEvMjU2IHZzIDQvNTEyKSByZWFsbHkgbGVhZHMgdG8gY29tcGxpY2F0ZWQgc29sdXRp
b25zIGxpa2UgdGhpcyBvbmUsCj4gPiB1bmZvcnR1bmF0ZWx5Li4uICAKPiAKPiBJIHNlZSBrZXJu
ZWwgaGFzICJTb2Z0d2FyZSBCQ0ggRUNDIi4gU2hvdWxkIEkgdXNlIHRoYXQgd2l0aCB0aGF0IGNo
aXAgPwo+IAo+IElmIHllcywgaG93IGRvIEkgdXNlIGl0ID8gU2VlbXMgbGlrZSBzZWxlY3Rpbmcg
dGhlIG9wdGlvbiBhdCBLZXJuZWwgYnVpbGQgaXMgbm90IGVub3VnaCwgZG8gSSBoYXZlIHRvIGNv
bmZpZ3VyZSBzb21ldGhpbmcgc29tZXdoZXJlLCBmb3IgaW5zdGFuY2UgaW4gdGhlIGRldmljZSB0
cmVlID8gQXQgdGhlIHRpbWUgYmVpbmcgSSBoYXZlIHRoZSBmb2xsb3dpbmcgaW4gdGhlIGRldmlj
ZSB0cmVlOgoKRW5hYmxpbmcgc29mdHdhcmUgQkNIIGluIHRoZSBjb25maWd1cmF0aW9uIHdpbGwg
anVzdCBidWlsdC1pbiB0aGUKc3VwcG9ydC4gWW91IHRoZW4gbmVlZCB0byBmb2xsb3cgdGhlIE5B
TkQgY29udHJvbGxlciBiaW5kaW5ncywgc2VlIHRoZQpleGFtcGxlIGluIFsxXS4KCkhvd2V2ZXIs
IGdpdmVuIGFsbCB0aGUgZGF0YSB5b3UgcHJvdmlkZWQsIEkga25vdyB0aGluayB0aGF0IHRoZXJl
IGlzCnNvbWV0aGluZyB3ZWlyZCBoYXBwZW5pbmcgaW4gdGhlIGRyaXZlciB5b3UgdXNlLCBpdCBt
aWdodCBiZSByZWxldmFudAp0byB0cnkgdG8gdW5kZXJzdGFuZCB3aGF0LiAKClsxXSBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL25hbmQtY29udHJvbGxlci55YW1sCgpUaGFu
a3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
