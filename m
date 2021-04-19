Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E499C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 06:38:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F93260FDB
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 06:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F93260FDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PmNPP5TTtHhRyV189AhFaeQkXUBrVtl5syMXb/gKc/A=; b=P/VdUPIiUpcy2Yz25o4u+NvY9
	ZEdmGN3IKr+K6W1TsdQFrb5jjpNWoLpuZyKbMVKuVZpvlXfREYQCKzVZo75PF18myJ3TZbAjH6kuE
	b6C+JzNfpg1u+ld3RsvcY9EFxOPn9g/EeoyUE22d0rzpw5Pr2UkikkuiKzTm75STdF8jGyH8VSBmW
	6n9zGglwJObK0ke3gnQgpNREl3BrqtdjaIjqT8seldDCIIo75QyZi8lcCPFfgHWg0Dze2PgTev1Tf
	NumZ1xxoVG7rSl7G3PEPUGR6/J3XEK1YYo5DPk8FGG7bFw5S4e+N7J6wtXReA2tf0IcSfNqNe6TOT
	9mhavjBRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYNXd-009EXB-S8; Mon, 19 Apr 2021 06:37:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYNXb-009EWI-Q5
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 06:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=huFVr0QwiHNMcsXxmxKDCzorG+ZMGBRNMOEA20sDaCI=; b=jvx3GF3e9shrm98GyeET9CXMix
 2TZv61EV6zK1dFmyGTvP+9/cJykrKv01lcw4DDq8aGLNoulvT/magwgMZaVyp3oBTBLQ6tlfQD2ot
 7MIKl7de8xJ7qfmRnZFuOlLh0Re4wcz7TZGEgey67/IOlh7WlhgdHT964xqkbg7Rsi4f5F5gY88Pg
 xbG3uOucDjkqu95IVIAvPB7RlxEIn2FsMB0MuIvogIkn/cAv8flSFdBaKeM+4CbL7/I52ZkHhKTGB
 lhUTh2GdhwZGZ+b98UnFjWPSKGYNsJXFXfOFlY+HZIpSU2xsz1XrHUPqp089QJEiF8JUvBsoFHhxP
 huD3zKng==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYNXW-00B4Xs-K7
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 06:37:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13 (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr [90.89.138.59])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C34F920004;
 Mon, 19 Apr 2021 06:37:40 +0000 (UTC)
Date: Mon, 19 Apr 2021 08:37:38 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: imx27: No space left to write bad block table
Message-ID: <20210419083738.07a28a20@xps13>
In-Reply-To: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_233746_816016_145D6453 
X-CRM114-Status: GOOD (  15.26  )
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

SGkgRmFiaW8sCgpGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+IHdyb3RlIG9uIFNh
dCwgMTcgQXByIDIwMjEgMTI6NTk6MjIKLTAzMDA6Cgo+IEhpLAo+IAo+IEkgbm90aWNlZCB0aGlz
IGVycm9yIHJlY2VudGx5IG9uIGEgaW14MjctcGh5dGVjLXBoeWNhcmQtcy1yZGsgcmVwb3J0ZWQK
PiBvbiBrZXJuZWxjaToKPiAKPiBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJlciBJRDog
MHgyMCwgQ2hpcCBJRDogMHhhMQo+IG5hbmQ6IFNUIE1pY3JvIE5BTkQwMUdSM0IyQ1pBNgo+IG5h
bmQ6IDEyOCBNaUIsIFNMQywgZXJhc2Ugc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAyMDQ4LCBP
T0Igc2l6ZTogNjQKPiBCYWQgYmxvY2sgdGFibGUgbm90IGZvdW5kIGZvciBjaGlwIDAKPiBCYWQg
YmxvY2sgdGFibGUgbm90IGZvdW5kIGZvciBjaGlwIDAKPiBTY2FubmluZyBkZXZpY2UgZm9yIGJh
ZCBibG9ja3MKPiByYW5kb206IGZhc3QgaW5pdCBkb25lCj4gQmFkIGVyYXNlYmxvY2sgMzI5IGF0
IDB4MDAwMDAyOTIwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzMwIGF0IDB4MDAwMDAyOTQwMDAwCj4g
QmFkIGVyYXNlYmxvY2sgMzMxIGF0IDB4MDAwMDAyOTYwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzMy
IGF0IDB4MDAwMDAyOTgwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzMzIGF0IDB4MDAwMDAyOWEwMDAw
Cj4gQmFkIGVyYXNlYmxvY2sgMzM0IGF0IDB4MDAwMDAyOWMwMDAwCj4gQmFkIGVyYXNlYmxvY2sg
MzM1IGF0IDB4MDAwMDAyOWUwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzM2IGF0IDB4MDAwMDAyYTAw
MDAwCj4gQmFkIGVyYXNlYmxvY2sgMzM3IGF0IDB4MDAwMDAyYTIwMDAwCj4gQmFkIGVyYXNlYmxv
Y2sgMzM4IGF0IDB4MDAwMDAyYTQwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzM5IGF0IDB4MDAwMDAy
YTYwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzQwIGF0IDB4MDAwMDAyYTgwMDAwCj4gQmFkIGVyYXNl
YmxvY2sgMzQxIGF0IDB4MDAwMDAyYWEwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzQyIGF0IDB4MDAw
MDAyYWMwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzQzIGF0IDB4MDAwMDAyYWUwMDAwCj4gQmFkIGVy
YXNlYmxvY2sgMzQ0IGF0IDB4MDAwMDAyYjAwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMzQ1IGF0IDB4
MDAwMDAyYjIwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMTAyMCBhdCAweDAwMDAwN2Y4MDAwMAo+IEJh
ZCBlcmFzZWJsb2NrIDEwMjEgYXQgMHgwMDAwMDdmYTAwMDAKPiBCYWQgZXJhc2VibG9jayAxMDIy
IGF0IDB4MDAwMDA3ZmMwMDAwCj4gQmFkIGVyYXNlYmxvY2sgMTAyMyBhdCAweDAwMDAwN2ZlMDAw
MAo+IE5vIHNwYWNlIGxlZnQgdG8gd3JpdGUgYmFkIGJsb2NrIHRhYmxlCj4gbmFuZF9iYnQ6IGVy
cm9yIHdoaWxlIHdyaXRpbmcgYmFkIGJsb2NrIHRhYmxlIC0yOAo+IG14Y19uYW5kOiBwcm9iZSBv
ZiBkODAwMDAwMC5uYW5kLWNvbnRyb2xsZXIgZmFpbGVkIHdpdGggZXJyb3IgLTI4Cj4gCj4gRnVs
bCBsb2c6Cj4gaHR0cHM6Ly9zdG9yYWdlLmtlcm5lbGNpLm9yZy9uZXh0L21hc3Rlci9uZXh0LTIw
MjEwNDE2L2FybS9pbXhfdjRfdjVfZGVmY29uZmlnL2djYy04L2xhYi1wZW5ndXRyb25peC9iYXNl
bGluZS1pbXgyNy1waHl0ZWMtcGh5Y2FyZC1zLXJkay5odG1sCj4gCj4gSSBkb24ndCBoYXZlIGFj
Y2VzcyB0byB0aGlzIGJvYXJkIGJ1dCBqdXN0IHdhbnRlZCB0byByZXBvcnQgaXQuCgpUaGFua3Mg
Zm9yIHRoZSByZXBvcnQhCgpJbmRlZWQgdGhhdCdzIGEgbWlzYmVoYXZpb3IsIHRoaXMgaGFwcGVu
cyB3aGVuICpzb21ldGhpbmcqIGlzIG5vdApoYXBwZW5pbmcgY29ycmVjdGx5IGFuZCB0aGUgYm9h
cmQgYm9vdHMgb3ZlciBhbmQgb3ZlciwgZWFjaCB0aW1lCmRlY3JlbWVudGluZyB0aGUgYmxvY2sg
c3VwcG9zZWQgdG8gY29udGFpbiB0aGUgQkJUIHVudGlsIHRoZXJlIGFyZSBub25lCmF2YWlsYWJs
ZSBhbnltb3JlLiBIb3dldmVyIEknbSBub3Qgc3VyZSB0aGlzIGhhcyBiZWVuIGNhdXNlZCBieSBh
CnJlY2VudCBpc3N1ZSBhcyB0aGVyZSBoYXZlIG5vdCBiZWVuIG1ham9yIGNoYW5nZXMgaW4gdGhl
IGNvcmUgbm9yIGluCnRoaXMgZHJpdmVyIHNpbmNlIHlvdXIgbGFzdCBmaXguIE1heWJlIHRoaXMg
aXMgYSBsZWZ0b3ZlciBvZiB0aGUKcHJldmlvdXMgc2l0dWF0aW9uLiBXb3VsZCB0aGlzIGJlIHBv
c3NpYmxlPyBEbyB5b3UgaGF2ZSBhIG1lYW4gdG8gZmluZApvdXQgdGhlIGRheS9rZXJuZWwgdmVy
c2lvbiB3aGljaCBzdGFydGVkIGZhaWxpbmc/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
