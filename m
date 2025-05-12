Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DB8C3ABCB
	for <linux-mtd@archiver.kernel.org>; Mon, 12 May 2025 15:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggXIxYxBF+W2V1ZxwT3tlglLHQ4mPxNX1OxO1QJmwqo=; b=abyGMyy2ckMGsf
	O6KdOXIf4jHMP5IHxNie53Sx6xD7jszU8bVF9Z11HtBhDxxTViFQR97V14G224+xYgZUnBTkJ0DzB
	kYgGC+XfwUtppyT8IJKhyybaQI81NeMbLfp3H0VU29l4EtQIOknpwMjoQjSALst4w9/pk6LaBCvPe
	z6L7s7bNMvIDYED+bKesWqELkOaLHF3lixqeJMYZ8tRgXN8utuxGZ9cPZzFBeVYJX4d2EbsHt7vdj
	pofCsjPTiVgEaXQO2oeDh1lY44/N1uswI24LdRUSmewBg+pHEK8jblx4xRM4xgsp2Nw1q5R2ueIYo
	d9rreWkeSZ1tYu+LHMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVSI-00000009wdi-2uLM;
	Mon, 12 May 2025 15:52:38 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEV9o-00000009sea-2O4T
	for linux-mtd@lists.infradead.org;
	Mon, 12 May 2025 15:33:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A6E31FCEC;
	Mon, 12 May 2025 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747064009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3nppZjhciBZhLeJLxjh7ZLlfMua9hGZ5VJuDw19EWI=;
	b=RHLmSF0Hlh9PYHo4GQvjF53CCW0Le14W7MAJlAFMkuUNLSMVTIEW/ny4K4t8bxtKfAFSPP
	wbl0wMl74ZD2axDk/hndzpa5xNf0n37IxlrupaoukYQjYi/YodYy2F99FS8luuJWUe4xWv
	uCh2wAD392tr/H8IvRZEaYKXyoElsa2Mhl/gB6hbSEkvaDtVQMYZR9Bh/r3YLsSsX5QUlr
	5fe91EcZxdBUCkC5HYHngvtaYMFjrRGq9ell6dVNn2ejgwDlB4+z+Fuk7XJ+ie2Kg/P9U4
	1LX4ACBHhy5TynAV28pfiq8ha8/ecx+JD0VwWBCWzecVBCvGkPQccwYk3gi+gA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>,  linux-mtd
 <linux-mtd@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v3] mtd: Verify written data in paranoid mode
In-Reply-To: <1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at>
	(Richard Weinberger's message of "Mon, 12 May 2025 17:23:16 +0200
	(CEST)")
References: <20250512084033.69718-1-csokas.bence@prolan.hu>
	<87frhambri.fsf@bootlin.com>
	<d70952c1-e4ca-4f09-ac23-2ad13e0facc0@prolan.hu>
	<1200504110.30346467.1747054025727.JavaMail.zimbra@nod.at>
	<4ebe2146-ee1c-4325-8259-be3803475f1f@prolan.hu>
	<87r00ugcat.fsf@bootlin.com>
	<1689545397.30901605.1747063396608.JavaMail.zimbra@nod.at>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 12 May 2025 17:33:28 +0200
Message-ID: <87y0v1g7xz.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdduieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtoheptghsohhkrghsrdgsvghntggvsehprhholhgrnhdrhhhupdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_083333_061412_F308EFBA 
X-CRM114-Status: GOOD (  12.48  )
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

T24gMTIvMDUvMjAyNSBhdCAxNzoyMzoxNiArMDIsIFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFy
ZEBub2QuYXQ+IHdyb3RlOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4+IFZv
bjogIk1pcXVlbCBSYXluYWwiIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+Pj4gVGhlIHBy
b2JsZW0gd2UgX2hhdmVfIHRob3VnaCBoYXBwZW5zIHRvIGJlIGEgYml0IGRpZmZlcmVudDogaGVy
ZSB3ZSBhcmUKPj4+IGJsdXJzZWQgd2l0aCBhIHN5c3RlbSB0aGF0IGNvcnJ1cHRzIGRhdGEgYXQg
YSBub3RpY2VhYmxlCj4+PiBwcm9iYWJpbGl0eS4gQnV0IHRoZSBtb2RlbCBpcyB0aGUgc2FtZTog
YSBzdG9jaGFzdGljIHByb2Nlc3MgaW50cm9kdWNpbmcKPj4+IGJpdCBlcnJvcnMgb24gd3JpdGUu
IEJ1dCBJIHNpbmNlcmVseSBob3BlIG5vIG9uZSBlbHNlIGhhcyB0aGlzIHByb2JsZW0sCj4+PiBh
bmQgdGhpcyBpcyAqbm90KiB0aGUgcHJpbWFyeSBhaW0gb2YgdGhpcyBwYXRjaDsgaXQganVzdCBo
YXBwZW5zIHRvCj4+PiBzb2x2ZSBvdXIgaXNzdWUgYXMgd2VsbC4gQnV0IEkgaW50ZW5kIGl0IHRv
IGJlIHVzZWZ1bCBmb3IgdGhlIGxhcmdlcgo+Pj4gTGludXggY29tbXVuaXR5LCB0aHVzIHRoZSBw
cmltYXJ5IGdvYWwgaXMgdG8gc29sdmUgdGhlIGZpcnN0IGlzc3VlLgo+PiAKPj4gSSBkb24ndCBo
YXZlIGEgc3Ryb25nIG9waW5pb24gdGhlcmUgYnV0IEkgZG9uJ3QgZGlzbGlrZSB0aGlzIGlkZWEK
Pj4gYmVjYXVzZSBpdCBtaWdodCBhbHNvIGhlbHAgdHJvdWJsZXNob290aW5nIGVycm9ycyBzb21l
dGltZXMuIEl0IGlzIHZlcnkKPj4gaGFyZCB0byB1bmRlcnN0YW5kIGlzc3VlcyB3aGljaCBoYXBw
ZW4gdG8gYmUgZGlzY292ZXJlZCB3YXkgYWZ0ZXIgdGhleQo+PiBoYXZlIGJlZW4gZ2VuZXJhdGVk
ICh0eXBpY2FsbHkgZHVyaW5nIGEgcmVhZCwgd2F5IGxhdGVyIHRoYW4gYSAiZmF1bHR5Igo+PiB3
cml0ZSkuIEhhdmluZyB0aGlzIHBhcmFub2lkIG9wdGlvbiB3b3VsZCBnaXZlIGEgbW9yZSBzeW5j
aHJvbm91cwo+PiBhcHByb2FjaCB3aGljaCBpcyBlYXNpZXIgdG8gd29yayB3aXRoIHNvbWV0aW1l
cy4KPgo+IFVCSSBvZmZlcnMgdGhpcyBhbHJlYWR5LCB0aGVyZSBpcyBhIHdyaXRlIHNlbGYtY2hl
Y2sgYXMgcGFydCBvZiB0aGUgaW8KPiBjaGVja3MgdGhhdCBjYW4gYmUgZW5hYmxlZAo+IHZpYSBk
ZWJ1Z2ZzIHBlciBVQkkgZGV2aWNlLgo+IFNvIGZvciB0cm91Ymxlc2hvb3RpbmcgdGhpcyBzaG91
bGQgYmUgZ29vZCBlbm91Z2guCj4gVGhlcmUgaXMgcm9vbSBmb3IgaW1wcm92ZW1lbnQsIHRob3Vn
aC4gQ3VycmVudGx5IGl0IHVzZXMgdm1hbGxvYygpLgoKVUJJIGlzIGZ1bGwgb2YgdW5jb3ZlcmVk
IHJlc291cmNlcyA6LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
