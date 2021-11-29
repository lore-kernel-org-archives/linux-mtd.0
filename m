Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA71C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 08:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tb41S2KvfnpJ80rMWbUv6nJLeUyZDkF0gnSs3RCHYwc=; b=oj/mnGnU2EgnYx
	lheJoKZ6j3cy8my0e2ryepMpUs49uLhg+/EI4MQ0crL1VYVkacGRjq+gwc6GSe4McXPTrZA9jyhHh
	PZP6C2ftcU8eh4XqLcuERbVHMsNhHf08oEufIioRUvYHvR3pEUBMsgZpbEVcsnYYVpH4+Jz6P6WJg
	l3sik5yti+mSsd6nLcWSAMbSiEBPhdwa8S+7bgnk7zS0LG3pk45bRHDev7maHduhZbqJyP8DPr5EW
	/qUiRvzDETGkKspzFdE+NP6y9ME6ndUTf6zaMFwEOFSCFm/T87cNeqz1kCuKjIooBUF9sMHQ6Oz8H
	dtFB25BTx2g1el7FGEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrcSI-000Aun-Iq; Mon, 29 Nov 2021 08:56:10 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrcSF-000AtI-JU
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 08:56:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 53923E0006;
 Mon, 29 Nov 2021 08:56:00 +0000 (UTC)
Date: Mon, 29 Nov 2021 09:55:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Olga Kitaina <okitain@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Message-ID: <20211129095559.01aa63a6@xps13>
In-Reply-To: <20211127180758.30884-1-okitain@gmail.com>
References: <20211127180758.30884-1-okitain@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_005607_820845_6E579EB4 
X-CRM114-Status: GOOD (  21.82  )
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

SGkgT2xnYSwKClBsZWFzZSBhZGQgYWxsIHRoZSBNVEQgbWFpbnRhaW5lcnMgaW4gY29weSwgYXMg
cmVxdWVzdGVkIGJ5CmdldF9tYWludGFpbmVycy5wbC4KCm9raXRhaW5AZ21haWwuY29tIHdyb3Rl
IG9uIFNhdCwgMjcgTm92IDIwMjEgMjE6MDc6NTgKKzAzMDA6Cgo+IEFjY29yZGluZyB0byB0aGUg
QXJhc2FuIE5BTkQgY29udHJvbGxlciBzcGVjLAo+IHRoZSBmbGFzaCBjbG9jayByYXRlIGZvciBT
RFIgbXVzdCBiZSA8PSAxMDAgTUh6LAo+IHdoaWxlIGZvciBOVi1ERFIgaXQgbXVzdCBiZSB0aGUg
c2FtZSBhcyB0aGUgcmF0ZQo+IG9mIHRoZSBDTEsgbGluZSBmb3IgdGhlIG1vZGUuCgpJIGNvbXBs
ZXRlbHkgbWlzc2VkIHRoYXQsIHdoZXJlIGRpZCB5b3UgZ2V0IHRoZSBpbmZvcm1hdGlvbj8KCj4g
VGhlIGRyaXZlciBwcmV2aW91c2x5IGFsd2F5cyBzZXQgMTAwIE1IeiBmb3IgTlYtRERSLCB3aGlj
aAo+IHdvdWxkIHJlc3VsdCBpbiBpbmNvcnJlY3QgYmVoYXZpb3IgZm9yIE5WLUREUiBtb2RlcyAw
LTQuCj4gCj4gVGhlIGFwcHJvcHJpYXRlIGNsb2NrIHJhdGUgY2FuIGJlIGNhbGN1bGF0ZWQKPiBm
cm9tIHRoZSBOVi1ERFIgdGltaW5nIHBhcmFtZXRlcnMgYXMgMS90Q0ssIG9yIGZvciByYXRlcwo+
IG1lYXN1cmVkIGluIHBpY29zZWNvbmRzLCAxMF4xMiAvIG5hbmRfbnZkZHJfdGltaW5ncy0+dENL
X21pbi4KPiAKCllvdSBuZWVkIGEgY291cGxlIG9mIEZpeGVzICsgQ2M6IHN0YWJsZSB0YWdzIGhl
cmUsIG90aGVyd2lzZSB0aGUKcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KCj4gU2lnbmVkLW9mZi1i
eTogT2xnYSBLaXRhaW5hIDxva2l0YWluQGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXJhc2FuLW5hbmQtY29udHJvbGxlci5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYyBiL2RyaXZlcnMv
bXRkL25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYwo+IGluZGV4IDUzYmQxMDczODQx
OC4uZWQ0ZWU5OTQyNDQxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNh
bi1uYW5kLWNvbnRyb2xsZXIuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2FyYXNhbi1u
YW5kLWNvbnRyb2xsZXIuYwo+IEBAIC0xOCw2ICsxOCw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9n
cGlvL2NvbnN1bWVyLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2lvcG9sbC5oPgo+ICsjaW5jbHVkZSA8bGludXgvbWF0aDY0Lmg+Cj4gICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L210ZC9tdGQuaD4KPiAgI2lu
Y2x1ZGUgPGxpbnV4L210ZC9wYXJ0aXRpb25zLmg+Cj4gQEAgLTEwNDMsNyArMTA0NCwxMiBAQCBz
dGF0aWMgaW50IGFuZmNfc2V0dXBfaW50ZXJmYWNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIGlu
dCB0YXJnZXQsCj4gIAkJCQkgRFFTX0JVRkZfU0VMX09VVChkcXNfbW9kZSk7Cj4gIAl9Cj4gIAo+
IC0JYW5hbmQtPmNsayA9IEFORkNfWExOWF9TRFJfREZMVF9DT1JFX0NMSzsKPiArCWlmIChuYW5k
X2ludGVyZmFjZV9pc19zZHIpCj4gKwkJYW5hbmQtPmNsayA9IEFORkNfWExOWF9TRFJfREZMVF9D
T1JFX0NMSzsKPiArCWVsc2UKPiArCQkvKiBPTkZJIHRpbWluZ3MgYXJlIGRlZmluZWQgaW4gcGlj
b3NlY29uZHMgKi8KPiArCQlhbmFuZC0+Y2xrID0gZGl2X3U2NCgodTY0KU5TRUNfUEVSX1NFQyAq
IDEwMDAsCj4gKwkJCQkgICAgIGNvbmYtPnRpbWluZ3MubnZkZHIudENLX21pbik7Cj4gIAo+ICAJ
LyoKPiAgCSAqIER1ZSB0byBhIGhhcmR3YXJlIGJ1ZyBpbiB0aGUgWnlucU1QIFNvQywgU0RSIHRp
bWluZyBtb2RlcyAwLTEgd29yawo+IAo+IGJhc2UtY29tbWl0OiBmNTNkNGMxMDlhNjY2YmYxYTQ4
ODNiNDVkNTQ2ZmJhMDc5MjU4NzE3CgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
