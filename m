Return-Path: <SRS0=7qTJ=LM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006AAC48BDF
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 06:44:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5BD3610EA
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jun 2021 06:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5BD3610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJ/e+P9QsTNfx8FYP6NbFhB4yq4/MtHyXIJ3lllMAx0=; b=tgMfQjaIURUeUd
	ZIlQEfQXwR3Rkww9UPxzN8n3/h5Viralu5Bnh2ZKo/fkOMS/sNLfPyuLyYLkPiKQYiUus1AN2WYWz
	T/X8IisusWb6mA5vbKGrQhZRW4UulGcF/aoIA6qc83udpksYDU31GwF40vHT/yb4M5ElXbT6ES0OH
	cKEt/h4BQUMIyF45gXwVg3lYeI5PYpXRbLdizbafxz9jKLnL/qcy1e7fbh3cpaV84ime7h2u7+z59
	e+iSVJazUiM7X/vH011tubDB1UhXh0fC6CKhfOpWAX9mENT9w64SgBSZlgS2IaAMa9b6b4IW/D4O9
	WRZCDVyVdTIta5ztQMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lu8E4-00CtgK-26; Fri, 18 Jun 2021 06:43:36 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lu8E0-00CtbZ-Tu
 for linux-mtd@lists.infradead.org; Fri, 18 Jun 2021 06:43:35 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 125F9FF802;
 Fri, 18 Jun 2021 06:43:27 +0000 (UTC)
Date: Fri, 18 Jun 2021 08:43:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip
 (4b/512B)
Message-ID: <20210618084326.0a074fb7@xps13>
In-Reply-To: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_234333_280665_12CC7736 
X-CRM114-Status: GOOD (  16.12  )
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91
cC5ldT4gd3JvdGUgb24gVGh1LCAxNyBKdW4KMjAyMSAxOToxNzowNSArMDIwMDoKCj4gSGVsbG8g
TWlxdWVsLAo+IAo+IEkgaGF2ZSBhIGJvYXJkIHJ1bm5pbmcgbGF0ZXN0IGtlcm5lbCB3aXRoIHRo
ZSBmb2xsb3dpbmcgTkFORDoKPiAKPiBbICAgIDEuNTIzMDc2XSBuYW5kOiBkZXZpY2UgZm91bmQs
IE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhkYQo+IFsgICAgMS41Mjk1MDVdIG5h
bmQ6IE1pY3JvbiBNVDI5RjJHMDhBQkFFQVdQCj4gWyAgICAxLjUzMzUyNl0gbmFuZDogMjU2IE1p
QiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lCLCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXoKPiBl
OiA2NAo+IFsgICAgMS41NDExOTZdIG5hbmQ6IFdBUk5JTkc6IGEwMDAwMDAwLm5hbmQ6IHRoZSBF
Q0MgdXNlZCBvbiB5b3VyIHN5c3RlbSAoMWIvMjU2Cj4gQikgaXMgdG9vIHdlYWsgY29tcGFyZWQg
dG8gdGhlIG9uZSByZXF1aXJlZCBieSB0aGUgTkFORCBjaGlwICg0Yi81MTJCKQo+IAo+IFVudGls
IG5vdyBJIHdhcyB1c2luZyBrZXJuZWwgNC4xNCBhbmQgSSB3YXMgaGF2aW5nIG5vIHByb2JsZW0s
IGFsbHRob3VnaCBpdCB3YXMgYWxzbyBleGhpYml0aW5nIHRoZSBmb2xsb3dpbmcgKGxlc3MgZGV0
YWlsZWQpIHdhcm5pbmcKClllcywgSSBkZWNpZGVkIHRvIGdpdmUgbW9yZSBpbmZvIG9mIHdoYXQg
aXMgdGhlIG1pbmltdW0gRUNDIHNjaGVtZSB0aGF0CnNob3VsZCBiZSB1c2VkIGFuZCB3aGF0IGlz
IHRoZSBvbmUgYmVpbmcgYXBwbGllZC4KCj4gWyAgICAwLjU5MTAwOV0gbmFuZDogV0FSTklORzog
YTAwMDAwMDAubmFuZDogdGhlIEVDQyB1c2VkIG9uIHlvdXIgc3lzdGVtIGlzIHRvbyB3ZWFrIGNv
bXBhcmVkIHRvIHRoZSBvbmUgcmVxdWlyZWQgYnkgdGhlIE5BTkQgY2hpcAo+IAo+IE5vdyBhbmQg
dGhlbiBJJ20gdXNpbmcgb25lIG9mIHRoZSBsYXRlc3Qga2VybmVscyAoVG9kYXkgaXMgNS4xMy1y
YzYpLCBhbmQgc29tZXRpbWUgaW4gb25lIG9mIHRoZSA1LnggcmVsZWFzZXMsIEkgc3RhcnRlZCB0
byBnZXQgZXJyb3JzIGxpa2U6Cj4gCj4gWyAgICA1LjA5ODI2NV0gZWNjX3N3X2hhbW1pbmdfY29y
cmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPiBbICAgIDUuMTAzODU5XSB1YmkwIHdhcm5p
bmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2MAo+
ICAgYnl0ZXMgZnJvbSBQRUIgOTk6NTk4MjQsIHJlYWQgb25seSA2MCBieXRlcywgcmV0cnkKPiBb
ICAgIDUuNTI1ODQzXSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3RhYmxlIEVDQyBl
cnJvcgo+IFsgICAgNS41MzE1NzFdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFi
bGUgRUNDIGVycm9yCj4gWyAgICA1LjUzNzQ5MF0gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDog
ZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgMzAKPiA3MyBieXRlcyBmcm9tIFBF
QiAxMDc6MTA4OTc2LCByZWFkIG9ubHkgMzA3MyBieXRlcywgcmV0cnkKPiBbICAgIDUuNjkxMTIx
XSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcgo+IFsgICAg
NS42OTY3MDldIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9y
Cj4gWyAgICA1LjcwMjQyNl0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBF
Q0MgZXJyb3IKPiBbICAgIDUuNzA4MTQxXSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJl
Y3RhYmxlIEVDQyBlcnJvcgo+IFsgICAgNS43MTQxMDNdIHViaTAgd2FybmluZzogdWJpX2lvX3Jl
YWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDMwCj4gMzUgYnl0ZXMgZnJv
bSBQRUIgMTA3OjI1MTQ0LCByZWFkIG9ubHkgMzAzNSBieXRlcywgcmV0cnkKPiBbICAgMjAuNTIz
Njg5XSByYW5kb206IGNybmcgaW5pdCBkb25lCj4gWyAgIDIxLjg5MjEzMF0gZWNjX3N3X2hhbW1p
bmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IKPiBbICAgMjEuODk3NzMwXSB1Ymkw
IHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGlu
ZyAxMwo+IDk0IGJ5dGVzIGZyb20gUEVCIDExNjo3NTc3NiwgcmVhZCBvbmx5IDEzOTQgYnl0ZXMs
IHJldHJ5Cj4gCj4gTW9zdCBvZiB0aGUgdGltZSwgd2hlbiB0aGUgcmVhZGluZyBvZiB0aGUgZmls
ZSBmYWlscywgSSBqdXN0IGhhdmUgdG8gcmVhZCBpdCBvbmNlIG1vcmUgYW5kIGl0IGdldHMgcmVh
ZCB3aXRob3V0IHRoYXQgZXJyb3IuCgpJdCByZWFsbHkgbG9va3MgbGlrZSBhIHJlZ3VsYXIgYml0
ZmxpcCBoYXBwZW5pbmcgInNvbWV0aW1lcyIuIElzIHRoaXMgYQpib2FyZCB3aGljaCBhbHJlYWR5
IGhhZCBhIGxpZmU/IFdoYXQgYXJlIHRoZSB1c2FnZSBjb3VudGVycyAoVUJJIHNob3VsZAp0ZWxs
IHlvdSB0aGlzKSBjb21wYXJlZCB0byB0aGUgb2ZmaWNpYWwgZW5kdXJhbmNlIG9mIHlvdXIgY2hp
cCAoc2VlIHRoZQpkYXRhc2hlZXQpPwoKPiBXaGF0IGFtIEkgc3VwcG9zZWQgdG8gZG8gdG8gYXZv
aWQgdGhlIEVDQyB3ZWFrbmVzcyB3YXJuaW5nIGF0IHN0YXJ0dXAgYW5kIHRvIGZpeCB0aGF0IEVD
QyBlcnJvciBpc3N1ZSA/CgpJIGhvbmVzdGx5IGRvbid0IHRoaW5rIHRoZSBlcnJvcnMgY29tZSBm
cm9tIHRoZSA1LjF4IGtlcm5lbHMgZ2l2ZW4gdGhlCmFib3ZlIGxvZ3MuIElmIHlvdSBmbGFzaCBi
YWNrIHlvdXIgb2xkIDQuMTQgSSBhbSBwcmV0dHkgc3VyZSB5b3UnbGwKaGF2ZSB0aGUgc2FtZSBl
cnJvcnMgYXQgc29tZSBwb2ludC4KCk5BTkQgcmVhbGx5IGlzIGEgZnJhZ2lsZSBzdG9yYWdlIG1l
ZGl1bSwgbm90IGZvbGxvd2luZyBpbiBhIHByb2R1Y3Rpb24KZW52aXJvbm1lbnQgdGhlIG1pbmlt
dW0gRUNDIHNjaGVtZSAodGhlcmUgaXMgYSByZWFsIGRpZmZlcmVuY2UgYmV0d2VlbgoxLzI1NiB2
cyA0LzUxMikgcmVhbGx5IGxlYWRzIHRvIGNvbXBsaWNhdGVkIHNvbHV0aW9ucyBsaWtlIHRoaXMg
b25lLAp1bmZvcnR1bmF0ZWx5Li4uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
