Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E564C10F16
	for <linux-mtd@archiver.kernel.org>; Mon,  6 May 2024 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxFO/txsG/RCNLjGEn2HegDFsY0W1zvx7YwIBmdQfgo=; b=c3sBoPCcycN/Dq
	/rcvXmqRBr4+x75v4CFIGizaT7ZPB5Evwi61vADFbOFIAdJnlarCTTPesBs+Z2bMjiv+5qLOWA3VR
	DTBc0eujR4DaX+O/bzUe1jJKr5g7FZAznuaZJJiZDEULeZsJRS6JIx4goS7RDCqe97RLKLEAVPJwS
	QFYNHBvJNWIqGJLxEKBbApvAAADpkY5Wsfn77sLygXya6SK+kQunPEwFN8FL/6i2PzLXpOufGE1IQ
	XUudSvs4UYsn5T1/Azy6vuVYSsR7xinPJ5FyewcUUbTVOhQSDU0N3AiBPeAfLjgxnm8IwyVA3Kttz
	nyrOMzZ9slPg6gaYm9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yvn-00000007ZWp-0iFG;
	Mon, 06 May 2024 14:03:03 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yvj-00000007ZWA-11vK
	for linux-mtd@lists.infradead.org;
	Mon, 06 May 2024 14:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B66BE0009;
	Mon,  6 May 2024 14:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715004175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zFrEFhO9TjFGR+Ywqd04S0jsdBATnoKGEa06T3fRaqA=;
	b=hySbyhml1EE7UT+stCg4Gbc8H/SHXW4yY9NO/FgdqCHsj3MbMkDTaeonzD2SVkNTBzXieV
	4qoFaa3C9sdI69aUuDhAZ/3+Tkyjb0DuK5JhCsejaLQRM0JJHx6ZymwflmsGACbvymhF92
	5npwMf8NKX/T3j2EJbGNfz8mUIaM2DRc6OZtQGtmWckkx4R3zLetjHFDCplTL4/Xl8h8oO
	XG5kUxvtfwsL4C/tEg21VFUetQsPuwG0oOI/2aMsJYhCJM4t4Q6d9Cx2tAiL38rxMjmnvx
	wAVJqn+EhnPJbTccJwuL+Ri/o2vEWNbdvPlHb/Haxiuyhe6NTwkv987/M7+ozQ==
Date: Mon, 6 May 2024 16:02:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] mtd: nand: mxc_nand: implement exec_op
Message-ID: <20240506160254.19089e94@xps-13>
In-Reply-To: <20240417-mtd-nand-mxc-nand-exec-op-v1-2-d12564fe54e9@pengutronix.de>
References: <20240417-mtd-nand-mxc-nand-exec-op-v1-0-d12564fe54e9@pengutronix.de>
	<20240417-mtd-nand-mxc-nand-exec-op-v1-2-d12564fe54e9@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_070259_457148_2C790757 
X-CRM114-Status: GOOD (  17.60  )
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

SGkgU2FzY2hhLAoKcy5oYXVlckBwZW5ndXRyb25peC5kZSB3cm90ZSBvbiBXZWQsIDE3IEFwciAy
MDI0IDA5OjEzOjI5ICswMjAwOgoKPiBUaGlzIGNvbnZlcnRzIHRoZSBkcml2ZXIgdG8gdGhlIG1v
cmUgbW9kZXJuIGV4ZWNfb3Agd2hpY2ggZ2V0cyB1cyByaWQKPiBvZiBhIGJ1bmNoIG9mIGxlZ2Fj
eSBjb2RlLiBUZXN0ZWQgb24gaS5NWDI3IGFuZCBpLk1YMjUuCgpUaGFua3MgYSBsb3QgZm9yIHRo
aXMgY29udHJpYnV0aW9uIQoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTYXNjaGEgSGF1ZXIgPHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU+CgouLi4KCj4gIHN0YXRpYyBpbnQgbXhjX25hbmRfcmVhZF9wYWdl
X3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCj4gIAkJCQkgIGludCBv
b2JfcmVxdWlyZWQsIGludCBwYWdlKQo+ICB7Cj4gKwlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5h
bmRfdG9fbXRkKGNoaXApOwo+ICAJc3RydWN0IG14Y19uYW5kX2hvc3QgKmhvc3QgPSBuYW5kX2dl
dF9jb250cm9sbGVyX2RhdGEoY2hpcCk7Cj4gLQl2b2lkICpvb2JfYnVmOwo+ICsJaW50IHJldDsK
PiArCj4gKwlob3N0LT5kZXZ0eXBlX2RhdGEtPmVuYWJsZV9od2VjYyhjaGlwLCBmYWxzZSk7CgpJ
biBnZW5lcmFsIHRoZSBleHBlY3RlZCBsb2dpYyB3b3VsZCBiZSB0byBrZWVwIHRoZSBFQ0MgZW5n
aW5lIGRpc2FibGVkCmFuZCBqdXN0IGVuYWJsZS91c2UgaXQvZGlzYWJsZSBpbiB0aGUgcGFnZSBo
ZWxwZXJzLgoKPiArCj4gKwlyZXQgPSBuYW5kX3JlYWRfcGFnZV9vcChjaGlwLCBwYWdlLCAwLCBi
dWYsIG10ZC0+d3JpdGVzaXplKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAgCj4g
IAlpZiAob29iX3JlcXVpcmVkKQo+IC0JCW9vYl9idWYgPSBjaGlwLT5vb2JfcG9pOwo+IC0JZWxz
ZQo+IC0JCW9vYl9idWYgPSBOVUxMOwo+ICsJCWNvcHlfc3BhcmUobXRkLCB0cnVlLCBjaGlwLT5v
b2JfcG9pKTsKPiAgCj4gLQlyZXR1cm4gaG9zdC0+ZGV2dHlwZV9kYXRhLT5yZWFkX3BhZ2UoY2hp
cCwgYnVmLCBvb2JfYnVmLCAwLCBwYWdlKTsKPiArCXJldHVybiAwOwo+ICB9Cj4gIAoKLi4uCgo+
ICBzdGF0aWMgaW50IG14Y25kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
QEAgLTE3NTIsMTMgKzE1OTQsNiBAQCBzdGF0aWMgaW50IG14Y25kX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJbmFuZF9zZXRfY29udHJvbGxlcl9kYXRhKHRoaXMs
IGhvc3QpOwo+ICAJbmFuZF9zZXRfZmxhc2hfbm9kZSh0aGlzLCBwZGV2LT5kZXYub2Zfbm9kZSk7
Cj4gLQl0aGlzLT5sZWdhY3kuZGV2X3JlYWR5ID0gbXhjX25hbmRfZGV2X3JlYWR5Owo+IC0JdGhp
cy0+bGVnYWN5LmNtZGZ1bmMgPSBteGNfbmFuZF9jb21tYW5kOwo+IC0JdGhpcy0+bGVnYWN5LnJl
YWRfYnl0ZSA9IG14Y19uYW5kX3JlYWRfYnl0ZTsKPiAtCXRoaXMtPmxlZ2FjeS53cml0ZV9idWYg
PSBteGNfbmFuZF93cml0ZV9idWY7Cj4gLQl0aGlzLT5sZWdhY3kucmVhZF9idWYgPSBteGNfbmFu
ZF9yZWFkX2J1ZjsKPiAtCXRoaXMtPmxlZ2FjeS5zZXRfZmVhdHVyZXMgPSBteGNfbmFuZF9zZXRf
ZmVhdHVyZXM7Cj4gLQl0aGlzLT5sZWdhY3kuZ2V0X2ZlYXR1cmVzID0gbXhjX25hbmRfZ2V0X2Zl
YXR1cmVzOwoKVmVyeSBuaWNlIGRpZmYgb3ZlcmFsbC4gSSdtIGZpbmUgd2l0aCB0aGUgZmlyc3Qg
dHdvIHBhdGNoZXMsIGRvIHlvdQptaW5kIGlmIEkgbWVyZ2UgMSBhbmQgMiBmb3Igbm93PyBXZSBu
ZWVkIHRvIGRpc2N1c3MgZnVydGhlciB0aGUgc3VicGFnZQppc3N1ZS4KCkFzIG1lbnRpb25lZCBh
Ym92ZSwgSSB3b3VsZCB3ZWxjb21lIGEgcGF0Y2ggc2V0dGluZyB0aGUgSFcgRUNDIGVuZ2luZSB0
bwpmYWxzZSBieSBkZWZhdWx0IGFuZCBvbmx5IGVuYWJsaW5nIGl0IGluIHRoZSBwYWdlIGhlbHBl
cnMgKHdoZW4gdXNpbmcKdGhlIG9uLWhvc3QgRUNDIGVuZ2luZSBvZiBjb3Vyc2UpLiBUaGlzIHdv
dWxkIGJlIGEgZ29vZCBtaW5vciBzdGVwLAp3aXRoIG9yIHdpdGhvdXQgc29mdHdhcmUgRUNDIHN1
cHBvcnQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
