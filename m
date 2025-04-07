Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F40C36010
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 06:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THpWDn8eq2n2xyKx1bwd3x7gCuEJA71QRFcuZdXbASs=; b=08jLPukxZfHX9J
	Wxdo73xpALEti3+R0J3/HIkeVssNwLRzIzRu+vdzDSZKoDsRaRgz25TfQRU1rgIv3n4ce0GwtaZCK
	FgHsZbOjn+LaNJ1WV6yb6PYfZyzbH3o60/Atoz2Pa15HizB5mZu59oMUvl8EfvgzIid8Enh2KN/LK
	qXbLBgka/EBQ1HhgBHpRPajfYdQb9CMdDR5W1/gE9Dw28e9N9sYQfZYU5BYxGxH0CneRw3GUrr5JM
	29KIcKJferjD/Mo+ewD+EBZvCyi7NC8vZu3Su1tJZZr9UdjitoizeQEGaHgL6UiLESSiB6xRc+AUQ
	5VxNxsXXRzsOl6lBzd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gK7-0000000Gd5u-1TEb;
	Mon, 07 Apr 2025 06:51:11 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gK2-0000000Gd56-3be1
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 06:51:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0AEA44354;
	Mon,  7 Apr 2025 06:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744008662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CtkCibXJB/RAmbeTC0As2u6SgcfbFFbzL81/+9wXhXA=;
	b=f4Fxxy8P4A8uNP2ya5EyjjqSi8Jlhk+SbkkDPZMSuBCy2I4z7CrB0NoeTp+9wF1ic9GcIo
	ynP4N5mlg/G0CAOwRSnJ7DenxNN7zlKfQM9PrmKyx0KxlmpZRIRXRbYgIL/qB1T9DCySpE
	pmykKA6sWDHCEq5nu0c5+Ke1jflZQvuRve+hcolWZcRJrvAw3RB5IK1FB6NhBEGP4zjyNe
	FNPZK2gmtqi37AvlQiVPxqn1UfrkryW4MrC3T+ydQFlvAqlRikT/UxE68FS5+7gCtcpUOs
	HL5xr6BNP1Re6aLILxxklJgBABEr0J4VsG1A3yBfaKGE8LRnTGnZJRisRZ7jHw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: bcm47xxnflash: Add error handling for
 bcm47xxnflash_ops_bcm4706_ctl_cmd()
In-Reply-To: <20250405143348.2477-1-vulab@iscas.ac.cn> (Wentao Liang's message
	of "Sat, 5 Apr 2025 22:33:47 +0800")
References: <20250405143348.2477-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 07 Apr 2025 08:51:00 +0200
Message-ID: <875xjgihwr.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleelhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddtkedrfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_235107_656737_CE2E0D3A 
X-CRM114-Status: GOOD (  18.26  )
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

SGVsbG8gTGlhbmcsCgpPbiAwNS8wNC8yMDI1IGF0IDIyOjMzOjQ3ICswOCwgV2VudGFvIExpYW5n
IDx2dWxhYkBpc2Nhcy5hYy5jbj4gd3JvdGU6Cgo+IFRoZSBiY200N3h4bmZsYXNoX29wc19iY200
NzA2X2NtZF9jdHJsKCkgY2FsbHMKPiBiY200N3h4bmZsYXNoX29wc19iY200NzA2X2N0bF9jbWQo
KSB3aXRob3V0IHByaW50aW5nIGVycm9yIG1lc3NhZ2UuIEEKPiBwcm9wZXIgaW1wbGVtZW50YXRp
b24gY2FuIGJlIGZvdW5kIGluCj4gYmNtNDd4eG5mbGFzaF9vcHNfYmNtNDcwNl93cml0ZSgpLgoK
VGhpcyBpcyBhIHByb2JsZW0gd2l0aCBjbWRfY3RybCwgYnV0IHRoaXMgaW50ZXJmYWNlIGhhcyBi
ZWVuIGRlcHJlY2F0ZWQKfjV5IGFnbyBhbmQgcGVvcGxlIGVuY291cmFnZWQgdG8gdHJhbnNpdGlv
biB0byAtPmV4ZWNfb3AoKS4gRGlkIHlvdQpwZXJzb25hbGx5IGV4cGVyaWVuY2UgaXNzdWVzIHdp
dGggdGhhdCBvciBpcyB0aGlzIGp1c3QgY29kZSBhbmFseXNpcz8gSWYKeW91IGFyZSBhY3R1YWxs
eSB1c2luZyB0aGlzIGRyaXZlciwgSSdkIGhpZ2hseSBzdWdnZXN0IHRvIHVwZGF0ZSB0aGUKZHJp
dmVyLgoKPiBBZGQgZXJyb3IgbG9nIHRvIHRoZSBiY200N3h4bmZsYXNoX29wc19iY200NzA2X2N0
bF9jbWQoKSB0byBwcmV2ZW50Cj4gc2lsZW50IGZhaWx1cmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBX
ZW50YW8gTGlhbmcgPHZ1bGFiQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5k
L3Jhdy9iY200N3h4bmZsYXNoL29wc19iY200NzA2LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYmNtNDd4eG5mbGFzaC9vcHNfYmNtNDcwNi5jCj4gaW5kZXggNjQ4N2RmYzY0MjU4
Li5jODkxMjk1ODhiYjYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4
eG5mbGFzaC9vcHNfYmNtNDcwNi5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYmNtNDd4
eG5mbGFzaC9vcHNfYmNtNDcwNi5jCj4gQEAgLTE4Miw3ICsxODIsOCBAQCBzdGF0aWMgdm9pZCBi
Y200N3h4bmZsYXNoX29wc19iY200NzA2X2NtZF9jdHJsKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmRf
Y2hpcCwKPiAgCWlmIChjbWQgIT0gTkFORF9DTURfUkVTRVQpCj4gIAkJY29kZSB8PSBOQ1RMX0NT
QTsKPiAgCj4gLQliY200N3h4bmZsYXNoX29wc19iY200NzA2X2N0bF9jbWQoYjQ3bi0+Y2MsIGNv
ZGUpOwo+ICsJaWYgKGJjbTQ3eHhuZmxhc2hfb3BzX2JjbTQ3MDZfY3RsX2NtZChiNDduLT5jYywg
Y29kZSkpCj4gKwkJcHJfZXJyKCIlcyBjdGxfY21kIGRpZG4ndCB3b3JrIVxuIiwgX19mdW5jX18p
OwoKZGV2X2VycigpIGlzIHByb2JhYmx5IGJldHRlcgpfX2Z1bmNfXyBpcyBub3QgbmVlZGVkCklm
IHdlIHdhbnQgdG8gbWFrZSBpdCBhIGJpdCB1c2FibGUsIEknZCBzYXkgdGhhdCB0aGUgcmV0dXJu
IGNvZGUgc2hhbGwKYmUgdGhlcmUgYXMgd2VsbC4KCj4gIH0KPiAgCj4gIC8qIERlZmF1bHQgbmFu
ZF9zZWxlY3RfY2hpcCBjYWxscyBjbWRfY3RybCwgd2hpY2ggaXMgbm90IHVzZWQgaW4gQkNNNDcw
NiAqLwoKVGhhbmtzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
