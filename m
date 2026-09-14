Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993FAC88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPXYKfKPUx7WwzRVJu7zKhe0PKReR6wcUa75wslGo4s=; b=cagXulOsOX/gdF
	bA/VOANs8nuznV3S6sAYOM4oGRjNExzikkOO79CQfwikc19Xpne5hZ9F8UzRvX8OKvfeSADAiGjxl
	Q480aFJ9OK4mgKgzB+jMzWuZqYu0yyKCxViMnXGWkZ1ocNEQJ4g1CfWrCsOcicMQiDbXFNmNFWGq5
	QLoat/tOqAmFGJRYy+0uJhpz6v5WlHLUpCqnKcnMwOIFaUQWtq1GZ06NeuYRPyVus7+IXxKSYHTOq
	x6rCGTdBQU0gmi+nGyEk9rOX3COm2EBKhxk4W4u52UOSYvm1/9xE9SvP3ZevCX6A4ncqJGMUrxrzB
	j4ynL1rBZLTHZnT42d3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65tT-00000003ZsG-0uPO;
	Mon, 14 Sep 2026 12:34:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65tP-00000003ZrK-3QoG
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 12:34:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7633B4E40504;
	Mon, 14 Sep 2026 12:34:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45E8660323;
	Mon, 14 Sep 2026 12:34:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4189511C7AFD6;
	Mon, 14 Sep 2026 14:34:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789389275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6JNz5SnaTf+EKri56sx5gL/eZWOe6uWaInB9WB7P5mE=;
	b=lb9xdF2PC/WbAqGedrO5iI0eCjgOQk+pBMSr5TiHwhqWO+l62wwNf8wZ/4/FbHvYYVoF6S
	Wj6fp9gZwE03jdrsIV25aPwhaRFaMpLrEpLIRSOlsdqRpEwpc4XV+a7CLvauAyly+66Zd5
	/3Jl1EFf6EhFuXS2g4iVMAPL8mbHqG9iTwH5KhaerNoUtSPWEigfME7690lWFSIde/BZnw
	rjk9MA4jea79jr6nlNWSjW6ceSZYHtiPrErbcX5KxKkaMt2l7pzDIkAmLTO73wPpiuzFVy
	ehaySykzRUYAvHSnBFpfrQ+PT37pvZEGCFxWa8H/JWdlpdLqBEnqMejY0gdr3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Itai Handler" <itai.handler@gmail.com>,  <pratyush@kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <vigneshr@ti.com>,  <richard@nod.at>,  <takahiro.kuwano@infineon.com>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by
 spi_nor_rww_start_exclusive()
In-Reply-To: <DLF191CC4QMM.1SNYEHUFJ9GK2@kernel.org> (Michael Walle's message
	of "Mon, 14 Sep 2026 14:20:05 +0200")
References: <20260914081149.1916589-1-itai.handler@gmail.com>
	<20260914081149.1916589-2-itai.handler@gmail.com>
	<87ld94owzj.fsf@bootlin.com> <DLF191CC4QMM.1SNYEHUFJ9GK2@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 14:34:32 +0200
Message-ID: <874ifsovtz.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_053439_996626_1AB62EE3 
X-CRM114-Status: GOOD (  10.90  )
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

T24gMTQvMDkvMjAyNiBhdCAxNDoyMDowNSArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPj4gTWljaGFlbCwgc2luY2Ugd2UgYWxyZWFkeSBnb3QgYSBjeWNs
ZSB3aXRoIEFJIHdhbGxzIG9mIHRleHQganVzdCB0byB0ZWxsCj4+ICJmaXggdGhhdCBkYW1uIGNv
bnZlcnNpb24iLCBjYW4gSSAob3IgeW91KSBhcHBseSB0aGF0IG90aGVyIHBhdGNoLCBzbyB3ZQo+
PiBjYW4gZ2V0IHJpZCBvZiB0aGVzZT8gTGV0IG1lIGtub3cgd2hhdCB5b3UgcHJlZmVyLCBhbHRo
b3VnaCBJIGRvbid0Cj4+IHJlbWVtYmVyIHdoZXJlIHRoYXQgdGhyZWFkIGlzLgo+Cj4gSXQncyBh
bHJlYWR5IGluIHNwaS1ub3IvbmV4dCBzaW5jZSBsYXN0IGZyaWRheS4KPgo+IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQvbG9nLz9o
PXNwaS1ub3IvbmV4dAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNzg5MTMz
MTE3MDEuMTkxNTY1MS40NzkxNjI0MjE1Nzg3Mzk2MTg3LmI0LXR5QGI0L1QvI21lM2I1MWEyNDI0
NjlhNGQ5NzIyMDg5ZTE4NTQ3ZTg3ZmRjNjVkN2M5Cj4KPiAtbWljaGFlbAoKU2luY2UgdGhhdCBv
bmUgaXMgImJpZyIgSSB3b3VsZCBoYXZlIG1lcmdlZCBpdCB0aHJvdWdoIGEgZml4ZXMgUFIuIEkK
dXN1YWxseSBzZW5kIG9uZSBhcm91bmQgLXJjNC4gU28gZWl0aGVyIHlvdSBwdXNoIHRoZSBwYXRj
aCB0byBtdGQvZml4ZXMKKG9yIEkgZG8gaXQpIGFuZCBkcm9wIGl0IGZyb20gdGhlIHNwaS1ub3Iv
bmV4dCBicmFuY2gsIG9yIHdlIGtlZXAgdGhpbmdzCmxpa2UgdGhpcywgd2hpY2ggaXMgYWxzbyBr
aW5kIG9mIG9rLgoKUmVnYXJkaW5nIHRoZSB1c2Ugb2YgYGdpdCBwdXNoIC1mYCwgSSBrbm93IFJp
Y2hhcmQsIFByYXR5dXNoICYgVHVkb3IKaGlnaGx5IGRpc2xpa2UgaXQgYW5kIGF2b2lkIHRvIHVz
ZSBpdC4gSSBmaW5kIHRoaXMgdG9vbCBwcmV0dHkgdXNlZnVsIG9uCmJyYW5jaGVzIGxpa2Ugb3Vy
cyBhbmQgcHJlZmVyIHRvIGRyb3AgYSBwYXRjaCByYXRoZXIgdGhhbiBjYXJyeWluZyBpdHMKcmV2
ZXJ0LCBvciBtZXNzaW5nIGFyb3VuZCB3aXRoIG1lcmdlcy4gSSBwcmVmZXIgYSBjbGVhbiBoaXN0
b3J5IHJhdGhlcgp0aGFuIHRoZSBhYnNvbHV0ZSBsYWNrIG9mIC1mLiBXZSBhbHJlYWR5IGhhdmUg
dGhlIChMaW51cykgbWFzdGVyIGJyYW5jaAptaWxlc3RvbmUgd2hpY2ggaXMgc2V0IGluIHN0b25l
LCBJIGRvbid0IGdldCB0aGUgbmVlZCB0byBjcmVhdGUgb25lCm91cnNlbHZlcy4KClNvLCB1cCB0
byB5b3UgOykKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
