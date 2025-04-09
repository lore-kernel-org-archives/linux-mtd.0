Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71833C36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 07:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tF5wfaWRVPU70EjkZKfvamiXD3K9HYvpUD0G18sORl8=; b=1nXiqiz51GcFLN
	GYOI39TlCBk/16Lkargln5U0VqIdxirY3cudbQJs8M8kxlwrIEZSJiS0KLVgRbX3RaiDaDQRkdTpX
	WMq1+3P1WahsUZi5fBIziZj4PDXiBbXJ0WKI2i4K4I0m0/hmaQYGASKDWN3bboKPnqU5W+oAdOw5t
	VZwjD2ACufaYLh4UrZALhYk2PxMDwHaVb8K+L7M0/qUZnQEayb/e/jkIBkDXOtc14JCrDHHtLjHb7
	IblJujIP4raVJw2ubf8zu1zbREAFSAc0q1d0kiEIY8CZf2XgwmdWbyZ1QJQhLVOEpHt/btYsX8xo6
	4bRgNW3CAU3XGBmGdceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q1b-00000006Res-1W9o;
	Wed, 09 Apr 2025 07:39:07 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q0w-00000006RaI-0kC7
	for linux-mtd@lists.infradead.org;
	Wed, 09 Apr 2025 07:38:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 980D344443;
	Wed,  9 Apr 2025 07:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744184299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KfpRXUCxzkoQbCGtnWTHiZepgMVHCRh0eaffx0cA0xY=;
	b=C8P4Xhw+MZU+F89vQSeyNet/H3rSTmbg76soqo8S9hujFZlwC/lMUfamO7+Fan4Fbme0Mg
	w+2VPXwHkUZ12gLJawWZxVU6qUOruJxh8BCpqRkUHUV4LHIAUbQAXT2Fte9p7TLtqEziGu
	unvjrAEpPvQIXoGOl54iLh1rFVdxLZqWfDDEbsL9XzBViIYCykHkGYXHQW3QCMAwdVxchc
	SGI0RQGY8E+IhIKfSwtfWxjKISd10upmdgyG/dm8I4Y1G9Mqi5zrKpQa1YNaxllvmmi3Lm
	FyTz55Aw/UTEUTVU4HGVTUarra6MYDZWft836O8B34UBz83EgHiBO5FcGhCs2A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Arkhipov <m.arhipov@rosa.ru>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  lvc-project@linuxtesting.org
Subject: Re: [PATCH] mtd: nand: ecc-mxic: Fix use of uninitialized variable ret
In-Reply-To: <20250408213906.23129-1-m.arhipov@rosa.ru> (Mikhail Arkhipov's
	message of "Wed, 9 Apr 2025 00:39:06 +0300")
References: <20250408213906.23129-1-m.arhipov@rosa.ru>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 09 Apr 2025 09:38:17 +0200
Message-ID: <87v7rdhjiu.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehgeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumedvtdgtfeemsggufhdtmegvgehftdemfhejudhfmehfsggrvdemkegufhejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepmhdrrghrhhhiphhovhesrhhoshgrrdhruhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguv
 ggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlvhgtqdhprhhojhgvtghtsehlihhnuhigthgvshhtihhnghdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_003827_496884_08E93711 
X-CRM114-Status: GOOD (  10.74  )
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

T24gMDkvMDQvMjAyNSBhdCAwMDozOTowNiArMDMsIE1pa2hhaWwgQXJraGlwb3YgPG0uYXJoaXBv
dkByb3NhLnJ1PiB3cm90ZToKCj4gSWYgY3R4LT5zdGVwcyBpcyB6ZXJvLCB0aGUgbG9vcCBwcm9j
ZXNzaW5nIEVDQyBzdGVwcyBpcyBza2lwcGVkLAo+IGFuZCB0aGUgdmFyaWFibGUgcmV0IHJlbWFp
bnMgdW5pbml0aWFsaXplZC4gSXQgaXMgbGF0ZXIgY2hlY2tlZAo+IGFuZCByZXR1cm5lZCwgd2hp
Y2ggbGVhZHMgdG8gdW5kZWZpbmVkIGJlaGF2aW9yIGFuZCBtYXkgY2F1c2UKPiB1bnByZWRpY3Rh
YmxlIHJlc3VsdHMgaW4gdXNlciBzcGFjZSBvciBrZXJuZWwgY3Jhc2hlcy4KPgo+IFRoaXMgc2Nl
bmFyaW8gY2FuIGJlIHRyaWdnZXJlZCBpbiBlZGdlIGNhc2VzIHN1Y2ggYXMgbWlzY29uZmlndXJl
ZAo+IGdlb21ldHJ5LAoKV291bGQgY2xlYXJseSBiZSBhIGh1Z2UgYnVnLCBub3RoaW5nIGVsc2Ug
d291bGQgd29yayBpbiB0aGlzIGNhc2UsIG5vdCBhCnNpbmdsZSByZWFkLCBpZS4gd2Ugd291bGQg
c3RvcCB3YXkgYmVmb3JlIHJlYWNoaW5nIHRoaXMgcG9pbnQuCgo+IEVDQyBlbmdpbmUgbWlzdXNl
LAoKRGl0dG8uCgo+IG9yIGlmIGN0eC0+c3RlcHMgaXMgbm90IHZhbGlkYXRlZCBhZnRlciBpbml0
aWFsaXphdGlvbi4KCnN0ZXBzID0gbXRkLT53cml0ZXNpemUgLyAxSwphbmQKd2Ugb25seSBydW4g
b24gbGFyZ2UtcGFnZSBOQU5EcywgaWUuIGNoaXBzIHdpdGggbXRkLT53cml0ZXNpemUgPj0gMUsu
CnNvIHRoaXMgY2FzZSBpcyBub3QgcGxhdXNpYmxlLgoKPiBJbml0aWFsaXplIHJldCB0byB6ZXJv
IGJlZm9yZSB0aGUgbG9vcCB0byBlbnN1cmUgY29ycmVjdCBhbmQgc2FmZQo+IGJlaGF2aW9yIHJl
Z2FyZGxlc3Mgb2YgdGhlIGN0eC0+c3RlcHMgdmFsdWUuCj4KPiBGb3VuZCBieSBMaW51eCBWZXJp
ZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKSB3aXRoIFNWQUNFLgo+Cj4gRml4ZXM6
IDQ4ZTY2MzNhOWZhMiAoIm10ZDogbmFuZDogbXhpYy1lY2M6IEFkZCBNYWNyb25peCBleHRlcm5h
bCBFQ0MKPiBlbmdpbmUgc3VwcG9ydCIpCgpJIHdpbGwgYXBwbHksIGJ1dCBob25lc3RseSBJIGRv
IG5vdCB0aGluayB0aGlzIGZpeGVzIGFueXRoaW5nLgoKPiBTaWduZWQtb2ZmLWJ5OiBNaWtoYWls
IEFya2hpcG92IDxtLmFyaGlwb3ZAcm9zYS5ydT4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
