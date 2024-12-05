Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9346E7716C
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Dec 2024 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqF3ht0zsqJXRWkg6A5LEq09s6Fs/KYmXbjoSDkS5f0=; b=f4VgiDJ0CHGHZT
	1bXgc8D8jMhHzsRMX1hg3DDPrsfe5IUxArHl0HkWW6f4Cvkv1P/CU8REYl88PNJxQsCweXMuQ3TQO
	A9RaXHdQz48osij/3rxWbevJpWuoAr2jJbZAKj9Py/QToM6Wr0Cw+bDIcdeDSGNn3PwCJTaVxzgXp
	aTH0gT4txyp1IZwTx3bWWsdngyDVB2xjxFrRILBnO7uw6wglWMEWaXoDSPgDVN6cm2yH38OcpZha8
	i+L/qxxSOiJnc56v0nlZ8Hfi2s1qXGYQR0qeTDp+K8iytdAM7t6Ck00X1viwSG76pxBJMfG2Uy6yt
	KB661TzL97KCRS5P3lZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8dm-0000000FR6p-1zij;
	Thu, 05 Dec 2024 09:59:22 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8cB-0000000FQrK-3wqt
	for linux-mtd@lists.infradead.org;
	Thu, 05 Dec 2024 09:57:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62FF860008;
	Thu,  5 Dec 2024 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733392658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asMdUS02UFeTgHBuIcDcycZwkfGKntAm0QKtWLar3FI=;
	b=LWjBbzcMhQhmq1NPUtjqkyNNAxfS+5mnQI1aPD2Ok0Sn7+yN/1HDrurQ7zstLHrZtLGwYA
	Lao3U+F8f4gIyLW57e4gMTsg2ts5TX2VVGLUtB8JrYyCYd14OQdBuBVD5d9yPoseEQTyru
	hDtXdQfMFqhK70YB3xQZsp1aCqthpW46Hp/g/i31GS3hH/dAv41r9/vK/HujVoYjZHWjis
	BUCTKHQIYHtkGq49BjtxIUtM7Qw618ZHLZGA5yd3VxT2UvCe9pBu0m7Vvj6VUVFBrfHbDR
	wdOnPfvbYmT72VjaKEM59y+amCcljHzbSp+/8CA0IuBwsCu+qD43YXVOyaubqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
  devicetree@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  linux-kernel@vger.kernel.org,
  Vignesh Raghavendra <vigneshr@ti.com>,  Conor Dooley
 <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: fixed-partitions: Fix "compression" typo
In-Reply-To: <173324605959.1986625.7343237766910696825.robh@kernel.org> (Rob
	Herring's message of "Tue, 3 Dec 2024 11:14:21 -0600")
References: <20241113225632.1783241-1-robh@kernel.org>
	<173324605959.1986625.7343237766910696825.robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 05 Dec 2024 10:57:37 +0100
Message-ID: <87y10uwiy6.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_015744_112273_817E49B6 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

SGkgUm9iLAoKT24gMDMvMTIvMjAyNCBhdCAxMToxNDoyMSAtMDYsICJSb2IgSGVycmluZyAoQXJt
KSIgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgMTMgTm92IDIwMjQgMTY6NTY6
MzEgLTA2MDAsIFJvYiBIZXJyaW5nIChBcm0pIHdyb3RlOgo+PiBUaGUgZXhhbXBsZSBlcnJvbmVv
dXNseSBoYXMgImNvbXByZXNzIiBwcm9wZXJ0eSByYXRoZXIgdGhhbiB0aGUKPj4gZG9jdW1lbnRl
ZCAiY29tcHJlc3Npb24iIHByb3BlcnR5Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJp
bmcgKEFybSkgPHJvYmhAa2VybmVsLm9yZz4KPj4gLS0tCj4+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9tdGQvcGFydGl0aW9ucy9maXhlZC1wYXJ0aXRpb25zLnlhbWwgICAgfCAyICstCj4+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4gCj4KPiBBcHBs
aWVkLCB0aGFua3MhCgpObyBwcm9ibGVtLCBJIGFsd2F5cyBoYXZlIGEgYml0IG9mIGRlbGF5IGJ1
dCB0aGlzIHdhcyBpbiBteSAidG8gYXBwbHkiCmxpc3QgOykKCkNoZWVycywKTWlxdcOobAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
