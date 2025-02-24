Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9288C021BB
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmbT7lV98njTgahi6UPJTmb3EiKir+Gm+cWYjvre6iE=; b=HVvuv9yRrRGmWJ
	vEn7Xyj/brXwnLaL1nWX3Nt737GfBoeHITjsr39+u0Gr4E+fvJzsDFbe4zmPbmfD8qIZ7QT1d7JVs
	0K2aiVh99Dw6HcuePsKoDPoLNpdKiHufXhr29PLLteYn7/v/UybEDq1/fHqiFxh6HsqcfgujwBF3S
	FHg49pfyteswBf6e0CDu7AHgJL7wVhbOlUonVNIpEMrsv40/xFay5qw3BO8hc2N/uoXKpkCkLEtD3
	ElCg74eGMnjweD1DRzojcRjaFAbvsj7JHfZ4vb+z9GVmc5Z1X6welvwqIrXXOfm/PG1KyuvHy5NhH
	n5FIxLK9YpQJIq7/3MBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaYR-0000000EJK1-1mt1;
	Mon, 24 Feb 2025 15:39:35 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaVd-0000000EIjn-4Awc
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 15:36:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0475444281;
	Mon, 24 Feb 2025 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740411397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8e+QUEACEMP9vSayM7dLVeCNo0bcfzKj1qkl0cfnorU=;
	b=lmgCafSlaWX4FJWfhbRr3/uGb3GKmpOjg+NFrXJ3TbBCjaRJsqeYCRiGP/NbQNyQNbfq/G
	ZCxnWXScG4vU/fFl6+AVipSym7D8L0BQCnmnMShCKmqQsuIySZoU5c/DvxvuPSvbh9MZIs
	I+a12r8ylTg4MZQHt0YMc3APuWtqfrKhEZrzPwg5o6AkSpdaTgqgIewpPQ8ISNfbdXMtGA
	0t+hNpfijn+NJ7TsV4EmWUiPAsXaBJkKxFKFYlbRvebgDOZGfCRBZ0+o7GxzhbUIiCpXPn
	T7Iwh0CldgCkZMz1EzAnpIfhj4WD40xwlTPcsELFHK8pn+CV8xNG6fD2+/TjPQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  David.Woodhouse@intel.com,
  jarkko.lavinen@nokia.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: Fix potential UAF for mtdswap_dev pointers
In-Reply-To: <20250224133007.3037357-1-make24@iscas.ac.cn> (Ma Ke's message of
	"Mon, 24 Feb 2025 21:30:07 +0800")
References: <20250224133007.3037357-1-make24@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 24 Feb 2025 16:36:30 +0100
Message-ID: <875xkzfj7l.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejleduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppedvudejrdduuddvrddukeelrddukedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddujedrudduvddrudekledrudekuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehmrghkvgdvgeesihhstggrshdrrggtrdgtnhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepffgrvhhiugdrhghoohguhhhouhhsvgesihhnthgvlhdrtghomhdprhgtphhtthhopehjrghrkhhkohdrlhgrvhhinhgvnhesnhhokhhirgdrtghomhdprhgtphhtthhopehlihhnu
 higqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_073642_342724_6DD97B0C 
X-CRM114-Status: UNSURE (   7.62  )
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

SGVsbG8gTWEsCgpPbiAyNC8wMi8yMDI1IGF0IDIxOjMwOjA3ICswOCwgTWEgS2UgPG1ha2UyNEBp
c2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IEluIHRoZSBtdGRzd2FwX2luaXQoKSwgaWYgdGhlIGFsbG9j
YXRpb25zIGZhaWwsIHRoZSBlcnJvciBoYW5kbGluZwo+IHBhdGggZnJlZXMgZC0+cGFnZV9idWYs
IGQtPmViX2RhdGEsIGQtPnJldm1hcCBhbmQgZC0+cGFnZV9kYXRhIHdpdGhvdXQKPiBzZXR0aW5n
IHRoZXNlIHBvaW50ZXJzIHRvIE5VTEwuIFRoaXMgY291bGQgbGVhZCB0byBVQUYgaWYgc3Vic2Vx
dWVudAo+IGVycm9yIGhhbmRsaW5nIG9yIGRldmljZSByZXNldCBvcGVyYXRpb25zIGF0dGVtcHQg
dG8gcmVsZWFzZSB0aGVzZQo+IHBvaW50ZXJzIGFnYWluLgo+Cj4gU2V0IGQtPnBhZ2VfYnVmLCBk
LT5lYl9kYXRhLCBkLT5yZXZtYXAgYW5kIGQtPnBhZ2VfZGF0YSB0byBOVUxMCj4gaW1tZWRpYXRl
bHkgYWZ0ZXIgZnJlZWluZyB0aGVtIHRvIHByZXZlbnQgbWlzdXNlLiBSZWxlYXNlIGltbWVkaWF0
ZWx5Cj4gYW5kIHNldCB0byBOVUxMLCBhZGhlcmluZyB0byB0aGUgJ3JlbGVhc2UgaW1wbGllcyBp
bnZhbGlkJyBkZWZlbnNpdmUKPiBwcm9ncmFtbWluZyBwcmluY2lwbGUuCj4KPiBGb3VuZCBieSBj
b2RlIHJldmlldy4KPgo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gRml4ZXM6IGEzMjE1
OTAyNDYyMCAoIm10ZDogQWRkIG10ZHN3YXAgYmxvY2sgZHJpdmVyIikKCkkgYW0gc29ycnkgYnV0
IGFyZSB5b3UgcmVhbGx5IGZpeGluZyBzb21ldGhpbmc/IFRoZXJlIGFyZSB0aG91c2FuZCBvZgpk
cml2ZXJzIGRvaW5nIG5vdGhpbmcgd2l0aCB0aGVpciBmcmVlZCBwb2ludGVycyBpbiB0aGUgZXJy
b3IgcGF0aCwKYmVjYXVzZSB0aGV5IGp1c3QgY2Fubm90IGJlIHVzZWQgYW55bW9yZS4KClRoYW5r
cywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
