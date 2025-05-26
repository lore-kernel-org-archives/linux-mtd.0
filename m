Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CBCC54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGHriR/0LLqKVIChVnyQq0SWInAJedHXBKyQodBgSBc=; b=19qOopLF0jVgFP
	xGTmENGiC+Kut59XWhge7iX4iKOcGNOgnDNRHR85UP0CMzbzClurRZ4XnVJyX6dlmQdT5D2/xjKF0
	gal3LuLRj9dPpnVDk1Wqn2xiqCGlMEm+CQ0oOgAZBafluWpCw6fXbBK4svlTCp9FQGTI5qQ5VG888
	/VUfrcUq/1UJYzsH85MvNxlWhbXM/3KreveglkU30W/IkMTOd0LYM/bhNLPq/dgCIrJn2GBvC6wR+
	BBrWY4BQgdRH6KRh1K6MZs7vNkhx68/xzh/XkHqJswhcPkYT4G41YFKaW81RU18nq3ZwtsCdwRGG+
	V1W6Btsa0L35npGTuxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSyb-00000008MVv-0hgO;
	Mon, 26 May 2025 08:14:29 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSwR-00000008LzI-0NaD;
	Mon, 26 May 2025 08:12:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B610342DFF;
	Mon, 26 May 2025 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748247132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5ar1+ii+EEJg36aGo+is3ncJ1EKGEqq8suROqpajvc=;
	b=VALR+SSJ/mrK8uubAwfd02c0E4HinwQa3Fr7aSxh2mvFGRSNLT7oirBd3JBdl0XvI/I3ve
	2evkgdxzo/ok6EblNKPz8JAivojF0jfEoOaHHvsMM6gZ153NrNmis2Ih6WYiek0TF5Obk+
	9Osx6wN9VUphURRJ1Y0YBs+5kC2/gCXZyT5BVBSyqp1uqRTk0iB4Ix+CzG46DN6W6+1InP
	O/E8XOVgCJHzfMfIRQJvTkNMbod2JDgssODpznMUBg0438gMUwyOx5HZpNRqEXcs45lSht
	A4OsIziIr6c12taUyHJIck7wOISnWiIipl9sk0JfPb9p5UghhjUj5t2KZkckcA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  wens@csie.org,
  jernej.skrabec@gmail.com,  samuel@sholland.org,  ruanjinjie@huawei.com,
  u.kleine-koenig@baylibre.com,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: sunxi: Add randomizer configuration in
 sunxi_nfc_hw_ecc_write_chunk
In-Reply-To: <20250526034344.517-1-vulab@iscas.ac.cn> (Wentao Liang's message
	of "Mon, 26 May 2025 11:43:44 +0800")
References: <20250526034344.517-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 10:12:09 +0200
Message-ID: <8734cr3i5i.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedttdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhop
 ehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_011215_259860_280C785B 
X-CRM114-Status: GOOD (  13.11  )
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

SGkgTGlhbmcsCgpPbiAyNi8wNS8yMDI1IGF0IDExOjQzOjQ0ICswOCwgV2VudGFvIExpYW5nIDx2
dWxhYkBpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IFRoZSBmdW5jdGlvbiBzdW54aV9uZmNfaHdfZWNj
X3dyaXRlX2NodW5rKCkgY2FsbHMgdGhlCj4gc3VueGlfbmZjX2h3X2VjY193cml0ZV9jaHVuaygp
LCBidXQgZG9lcyBub3QgY2FsbCB0aGUgY29uZmlndXJhdGlvbgo+IGZ1bmN0aW9uIHN1bnhpX25m
Y19yYW5kb21pemVyX2NvbmZpZygpLiBDb25zZXF1ZW50bHksIHRoZSByYW5kb21pemF0aW9uCj4g
bWlnaHQgbm90IGNvbmR1Y3QgY29ycmVjdGx5LCB3aGljaCB3aWxsIGFmZmVjdCB0aGUgbGlmZXNw
YW4gb2YgTkFORCBmbGFzaC4KPiBBIHByb3BlciBpbXBsZW1lbnRhdGlvbiBjYW4gYmUgZm91bmQg
aW4gc3VueGlfbmZjX2h3X2VjY193cml0ZV9wYWdlX2RtYSgpLgo+Cj4gQWRkIHRoZSBzdW54aV9u
ZmNfcmFuZG9taXplcl9jb25maWcoKSB0byBjb25maWcgcmFuZG9taXplci4KPgo+IEZpeGVzOiA0
YmU0ZTAzZWZjN2YgKCJtdGQ6IG5hbmQ6IHN1bnhpOiBhZGQgcmFuZG9taXplciBzdXBwb3J0IikK
PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIHY0LjYKPiBTaWduZWQtb2ZmLWJ5OiBXZW50
YW8gTGlhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9zdW54aV9uYW5kLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gaW5kZXggOTE3OTcxOWY2MzllLi4xNjJjZDVm
NGYyMzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gQEAgLTEwNTAsNiArMTA1
MCw3IEBAIHN0YXRpYyBpbnQgc3VueGlfbmZjX2h3X2VjY193cml0ZV9jaHVuayhzdHJ1Y3QgbmFu
ZF9jaGlwICpuYW5kLAo+ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiArCXN1bnhp
X25mY19yYW5kb21pemVyX2NvbmZpZyhuYW5kLCBwYWdlLCBmYWxzZSk7Cj4gIAlzdW54aV9uZmNf
cmFuZG9taXplcl9lbmFibGUobmFuZCk7Cj4gIAlzdW54aV9uZmNfaHdfZWNjX3NldF9wcm90X29v
Yl9ieXRlcyhuYW5kLCBvb2IsIDAsIGJibSwgcGFnZSk7CgpQbGVhc2UgbmV4dCB0aW1lIHNlbmQg
YWxsIHRoZXNlICJpZGVudGljYWwiIGNoYW5nZXMgaW4gYSBzaW5nbGUgcGF0Y2guCgpDaGVlcnMs
Ck1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
