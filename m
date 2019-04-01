Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D86FEC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:27:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6193208E4
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 15:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ssq+7o6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6193208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0RIHFYkxEfhCuR49CEiLgCgkfiQ2SO0fvKRx8iq/Kg=; b=Ssq+7o6Gp+DAdZ
	TdXSQJBlFwABjULFjSCyXzBIFC8QRN593OA8BqAav/hubIFKk4DTGYj+D2ibOsgtrvAl8tWyjmGKO
	bSp08vnTcplSKl2GbE2iW4cIrdpV2x1RhOpScyeAlm3XQpgVczkGN7Hst158s8NwzwLkmGbsoCW5g
	00hPq9eXh9ewndmOtAao1hLADPC5r0mYtnlmdBFOClonj46NpN8mLWrjXQ97WEB26oF06GHS1enSn
	K8/VQ9G31MnQJM1xiPr3b/rbZyHTqgXNm1PuoZH7PoWXhKNuYnBymBCnG6qDRbDntiUqdJlFrfXAW
	Hue8iDjsvo1RxM05YPfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAypu-0007px-MW; Mon, 01 Apr 2019 15:26:58 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAypr-0007pJ-Tz
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 15:26:57 +0000
X-Originating-IP: 90.88.32.136
Received: from xps13 (aaubervilliers-681-1-91-136.w90-88.abo.wanadoo.fr
 [90.88.32.136]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 9509C40006;
 Mon,  1 Apr 2019 15:26:52 +0000 (UTC)
Date: Mon, 1 Apr 2019 17:26:51 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aditya Pakki <pakki001@umn.edu>
Subject: Re: [PATCH] mtd: rawnand: vf610: Fix to check for NULL pointer
 dereference
Message-ID: <20190401172651.158c05fe@xps13>
In-Reply-To: <20190318232434.9246-1-pakki001@umn.edu>
References: <20190318232434.9246-1-pakki001@umn.edu>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_082656_112100_01896464 
X-CRM114-Status: GOOD (  14.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, kjlu@umn.edu,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQWRpdHlhLAoKQWRpdHlhIFBha2tpIDxwYWtraTAwMUB1bW4uZWR1PiB3cm90ZSBvbiBNb24s
IDE4IE1hciAyMDE5IDE4OjI0OjM0Ci0wNTAwOgoKPiBvZl9tYXRjaF9kZXZpY2UgY2FuIHJldHVy
biBOVUxMIGlmIHRoZXJlIGlzIG5vIG1hdGNoaW5nIGRldmljZSBpcyBmb3VuZC4KPiBUaGUgcGF0
Y2ggYXZvaWRzIGEgcG90ZW50aWFsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBieSBjaGVja2lu
ZyBmb3IgdGhlCj4gcmV0dXJuIHZhbHVlIGFuZCBwYXNzaW5nIHRoZSBlcnJvciB1cHN0cmVhbS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGl0eWEgUGFra2kgPHBha2tpMDAxQHVtbi5lZHU+Cj4gLS0t
Cj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25mYy5jIHwgMiArKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQv
cmF3L3ZmNjEwX25mYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvdmY2MTBfbmZjLmMKPiBpbmRl
eCBhNjYyY2ExOTcwZTUuLjk0NmFiYmIyNzVjMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy92ZjYxMF9uZmMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3ZmNjEwX25m
Yy5jCj4gQEAgLTg1MCw2ICs4NTAsOCBAQCBzdGF0aWMgaW50IHZmNjEwX25mY19wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJfQo+ICAKPiAgCW9mX2lkID0gb2ZfbWF0Y2hf
ZGV2aWNlKHZmNjEwX25mY19kdF9pZHMsICZwZGV2LT5kZXYpOwo+ICsJaWYgKCFvZl9pZCkKPiAr
CQlyZXR1cm4gLUVOT0RFVjsKPiAgCW5mYy0+dmFyaWFudCA9IChlbnVtIHZmNjEwX25mY192YXJp
YW50KW9mX2lkLT5kYXRhOwo+ICAKPiAgCWZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2Rl
KG5mYy0+ZGV2LT5vZl9ub2RlLCBjaGlsZCkgewoKCkFwcGxpZWQgdG8gZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQKb24gbmFuZC9uZXh0
IHdpdGggdGhlIHRpdGxlIGNoYW5nZWQgdG8KCiAgICAgICAgbXRkOiByYXduYW5kOiB2ZjYxMDog
QXZvaWQgYSBwb3RlbnRpYWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlCgphbmQgYSBzcGFjZSBh
ZnRlciB0aGUgcmV0dXJuIHN0YXRlbWVudC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
