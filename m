Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F21C25B74
	for <linux-mtd@archiver.kernel.org>; Sat, 18 May 2024 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=StLT/TAKe5osGQwZPYVPgamvFkFUKRidLyLN/P6sI00=; b=C3RNg5sZ8oldhg
	19gMxkWHPutxGLG8b7gu6TGUfOy030QqF2XPReHHxye0UIrkVslOr5U/y1e+n8pKAuX5H5F/pjSjd
	xlp4sFbDXuhgfzAckl8EelBdTrpQOJugABHaYJZFxrFIPSMwG7DAIWFokxHlyhQfclEChQihkLd/H
	NnLfiQDOx1wWRZceqOSmQwj7FCYcBJFUywjeL0zPUXX+dEW13Rwy0D3pUqYxwQqnGUoLQ2FjsMTt/
	EN+M7gT1kA9nFPpPB6OVsEaA5oq4QKXN1QLUT7omw2fOqnrvZSOl3avbHMFDv67usEB02lQPXDrP4
	0Wl4D+Wjf2frJbqrFJtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8HYH-00000009v1j-0TYf;
	Sat, 18 May 2024 10:44:33 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8HYC-00000009v0g-3EmM;
	Sat, 18 May 2024 10:44:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0661D40003;
	Sat, 18 May 2024 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716029063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+g0Djet6VPor+0w2My6R6Rpd8gd93fTaLQzxiswyYc8=;
	b=dJ1HM4sVgpsZAO+szA2uDJZWhF2Xaigaf8SQ/cwA6DxsJD9fN3RFW2thSnsxioBdD11sGy
	m6zCzsjLDg1wSAwYoYRgiJlLNL9RdmRqKXLyfg1Xvmo8Z0uJBrf/agKf0X3vrBcBqnPit3
	mYxHPYcpDMpZIee5Z1IShXvt8EPkNr1q6v6JsmdVRQL2FCkNSuLAJZtvrYeNKB2akQLd6r
	+quT7wUKLbNb66kNqBsVo4hweJrp+vOtpd2IBzMFfK1sU+0B1NQdhmuc1KJZoB8LePNocv
	AUZGzIbI2LbNdabEAX3+TlI1kURXa5IfohYgK5b1glIkgNMAgynbvHeCY9fZNg==
Date: Sat, 18 May 2024 12:44:19 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Val Packett <val@packett.cool>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Heiko Stuebner <heiko@sntech.de>, Stephen Rothwell
 <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: rockchip: reject NVDDR timings when
 checked
Message-ID: <20240518124404.472eb60b@xps-13>
In-Reply-To: <20240518033923.5577-2-val@packett.cool>
References: <20240518033923.5577-2-val@packett.cool>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_034429_119261_EE0DBB15 
X-CRM114-Status: GOOD (  14.21  )
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

SGkgVmFsLAoKSSBtaWdodCBwcm9wb3NlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHRpdGxlIHdoaWNo
IEkgdGhpbmsgYmV0dGVyCmRlc2NyaWJlcyB0aGUgc2l0dWF0aW9uOgoibXRkOiByYXduYW5kOiBy
b2NrY2hpcDogZW5zdXJlIE5WRERSIHRpbWluZ3MgYXJlIHJlamVjdGVkIgoKdmFsQHBhY2tldHQu
Y29vbCB3cm90ZSBvbiBTYXQsIDE4IE1heSAyMDI0IDAwOjMxOjEzIC0wMzAwOgoKPiAuc2V0dXBf
aW50ZXJmYWNlIGZpcnN0IGdldHMgY2FsbGVkIHdpdGggYSBuZWdhdGl2ZSAidGFyZ2V0IiB2YWx1
ZQoKSnVzdCBhcyBhbiBGWUksIHRoZSBmYWN0IHRoYXQgaXQgaXMgbmVnYXRpdmUgaXMgYW4gaW1w
bGVtZW50YXRpb24KZGV0YWlsLCBidXQgeW91IG1lbnRpb24gdGhlICNkZWZpbmUgb2YgdGhlIHZh
bHVlIGJlbG93LCBzbyB0aGF0J3MgZmluZS4KIAo+IE5BTkRfREFUQV9JRkFDRV9DSEVDS19PTkxZ
LCBpbiB3aGljaCBjYXNlIGFuIGVycm9yIGlzIGV4cGVjdGVkCj4gaWYgdGhlIGNvbnRyb2xsZXIg
ZHJpdmVyIGRvZXMgbm90IHN1cHBvcnQgdGhlIHRpbWluZyBtb2RlIChOVkREUikuCj4gCgpIZXJl
IEkgd291bGQgd2VsY29tZSB0d28gdGFncyBpbiBvcmRlciB0byBnZXQgdGhpcyBiYWNrcG9ydGVk
IGFzIGVhcmx5CmFzIG5lZWRlZCBpbiBzdGFibGUga2VybmVsczoKCkNjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCkZpeGVzOiBhOWVjYzhjODE0ZTkgKCJtdGQ6IHJhd25hbmQ6IENob29zZSB0aGUg
YmVzdCB0aW1pbmdzLCBOVi1ERFIgaW5jbHVkZWQiKQoKPiBTaWduZWQtb2ZmLWJ5OiBWYWwgUGFj
a2V0dCA8dmFsQHBhY2tldHQuY29vbD4KPiAtLS0KPiBIZWxsbyBldmVyeW9uZSwgZmlyc3QgTGlu
dXggcGF0Y2ggZnJvbSBhIGxvbmcgdGltZSBGcmVlQlNEIHBlcnNvbiA6KQo+IAo+IFRoaXMgd2Fz
IHJlcXVpcmVkIHRvIGdldCB0aGUgTkFORCBjb250cm9sbGVyIHRvIGF0dGFjaCBvbiB0aGUgcmFu
ZG9tCj4gb2xkIFJLMzA2NiB0YWJsZXQgSSdtIGJyaW5naW5nIHVwIG1haW5saW5lIG9uLgoKV2Vs
Y29tZSEgVGhlIGZpeCBsb29rcyByaWdodCBiZXNpZGVzIG1pbm9yIG5pdHMgaW4gdGhlIGNvbW1p
dCBsb2cuIEknbGwKcHJvYmFibHkgdGFrZSB0aGUgdjIgd2hlbiBpdCdzIG91dCBhZnRlciAtcmMx
IGhhcyBiZWVuIHRhZ2dlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
