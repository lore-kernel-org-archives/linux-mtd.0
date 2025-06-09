Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF7BC5B552
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Jun 2025 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cbgAlryf5tDSakNv94e64+JV3RLgH1CRhwMRf1luXSs=; b=Ao8R9XbxKuh3u2
	HhdqwmACC/xh565JDJ+rPY87O7LUW/Qu7Raw5CGMm7/G8aQbS2Gm2GxWcNDJh3+4uwoXXeqp6rfVo
	C621t9/1kXGRcRoS7r5FFYqWgXKW7+3RRklvcQMDjg7ki7LwBSqLS8wKSoKC6w+LzvX/QGvU9NTNs
	Y4u+RuQ4jQjQ0bJZfACUg0MzqX0L6ivt9/d2haDcCx91Aefz+oFFyts4r0BifqDQ+HRY3rp5n1vSz
	9AM6PlYR8/AXKoX6v2N9X21/yDoVTXVVpXlcWi5ac7Libz6QhxADGl/lwWf5YKEx11rf9pX0KneZ4
	32D9ywFU/c9puYG2UO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYp2-00000003mg8-1VfU;
	Mon, 09 Jun 2025 09:29:40 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYfu-00000003kfo-3pzu
	for linux-mtd@lists.infradead.org;
	Mon, 09 Jun 2025 09:20:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4040433B5;
	Mon,  9 Jun 2025 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749460811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MLaNxGQJpPD63Lzluapai/rclx1n81PqQJs/TSEMG4w=;
	b=KulvjbB45hPm/V2VhKf82WKHPbA3PglbYXW4s2OaNh1vyKZkkzzFNHzZppTAjkQ4nwsNB8
	hOijW1NSI+XjdeDqUkKRvIODg5mcHhT5eTUpbyhiiFobiVuYw/woxtXdMeU5jKmy6IPfvW
	R26bB8wOUeGILTONH6ZBW85xetzCmZeFyI37sQ0Dh2Y5jzOHdvVwR+2dPOwdK61gsV47Qr
	YrvWxVylACnW0KOsjHOKv98UBIxSaLGvVXZN7fWYlMjBxOAZQd/p3j1ORoaUoDjfmEO+yI
	Ll6JE68dKDR0UawzaJ4XTq65KV+l/KKc6+5CucI24oGxf7/lzrGASYZQUuqsOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Regan <dregan@broadcom.com>
Cc: linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,
  bcm-kernel-feedback-list@broadcom.com,  william.zhang@broadcom.com,
  anand.gore@broadcom.com,  florian.fainelli@broadcom.com,
  kamal.dasu@broadcom.com,  dan.beygelman@broadcom.com,  =?utf-8?Q?=C3=81l?=
 =?utf-8?Q?varo_Fern=C3=A1ndez?=
 Rojas <noltari@gmail.com>,  rafal@milecki.pl,
  computersforpeace@gmail.com,  frieder.schrempf@kontron.de,
  vigneshr@ti.com,  richard@nod.at,  bbrezillon@kernel.org,
  kdasu.kdev@gmail.com,  jaimeliao.tw@gmail.com,  kilobyte@angband.pl,
  jonas.gorski@gmail.com,  dgcbueu@gmail.com,  dregan@mail.com
Subject: Re: [PATCH v2] mtd: nand: brcmnand: fix mtd corrected bits stat
In-Reply-To: <20250606165756.1531164-1-dregan@broadcom.com> (David Regan's
	message of "Fri, 6 Jun 2025 09:57:03 -0700")
References: <20250606165756.1531164-1-dregan@broadcom.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Jun 2025 11:20:09 +0200
Message-ID: <8734c9z2ye.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeludduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvvddprhgtphhtthhopegurhgvghgrnhessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhto
 hepfihilhhlihgrmhdriihhrghnghessghrohgruggtohhmrdgtohhmpdhrtghpthhtoheprghnrghnugdrghhorhgvsegsrhhorggutghomhdrtghomhdprhgtphhtthhopehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepkhgrmhgrlhdruggrshhusegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_022015_081221_FFE4D1E1 
X-CRM114-Status: GOOD (  11.47  )
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

T24gMDYvMDYvMjAyNSBhdCAwOTo1NzowMyAtMDcsIERhdmlkIFJlZ2FuIDxkcmVnYW5AYnJvYWRj
b20uY29tPiB3cm90ZToKCj4gQ3VycmVudGx5IHdlIGF0dGVtcHQgdG8gZ2V0IHRoZSBhbW91bnQg
b2YgZmxpcHBlZCBiaXRzIGZyb20gYSBoYXJkd2FyZQo+IGxvY2F0aW9uIHdoaWNoIGlzIHJlc2V0
IG9uIGV2ZXJ5IHN1YnBhZ2UuIEluc3RlYWQgb2J0YWluIHRvdGFsIGZsaXBwZWQKPiBiaXRzIHN0
YXQgZnJvbSBoYXJkd2FyZSBhY2N1bXVsYXRvci4gSW4gYWRkaXRpb24gaWRlbnRpZnkgdGhlIGNv
cnJlY3QKPiBtYXhpbXVtIHN1YnBhZ2UgY29ycmVjdGVkIGJpdHMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZpZCBSZWdhbiA8ZHJlZ2FuQGJyb2FkY29tLmNvbT4KPiBSZXZpZXdlZC1ieTogV2lsbGlh
bSBaaGFuZyA8d2lsbGlhbS56aGFuZ0Bicm9hZGNvbS5jb20+Cj4gLS0tCgpIZWxsbywKCkNhbiB5
b3UgcGxlYXNlIGdpdmUgdGhlIG91dHB1dCBvZiBuYW5kYml0ZXJycyAtaSAvZGV2L210ZFg/Cgo+
ICB2MjogQWRkID49IHY0IE5BTkQgY29udHJvbGxlciBzdXBwb3J0IGFzIHJlcXVlc3RlZCBieSBK
b25hcy4KPiAgICAgIG10ZC0+ZWNjX3N0YXRzLmNvcnJlY3RlZCBhY2N1bXVsYXRlcyBpbnN0ZWFk
IG9mIHNldCB0byB0b3RhbC4KPiAgICAgIFJlbW92ZSBETUEgc3BlY2lmaWMgZmxpcHBlZCBiaXRz
IGNvdW50LgoKVGhlIGNoYW5nZWxvZyBkb2VzIG5vdCBtZW50aW9uIHRoZSBmYWN0IHRoYXQgeW91
IHJldHVybiB0aGUgbWF4aW11bQpudW1iZXIgb2YgY29ycmVjdGVkIGJpdGZsaXBzIGFzIEkgcmVx
dWVzdGVkLCBhbmQgdGhlIGRpZmYgZG9lcyBub3Qgc2hvdwphIHN0cmFpZ2h0Zm9yd2FyZCBpbXBs
ZW1lbnRhdGlvbiBvZiB0aGF0LiBJdCBpcyB2ZXJ5IGltcG9ydGFudCB0byBnZXQKdGhpcyByaWdo
dC4KCklmIHdlIHRha2UgdGhlIGZvbGxvd2luZyBleGFtcGxlIG9mIGEgcGFnZSB3aXRoIDQgRUND
IHN0ZXBzLCBpZiB3ZSBnZXQKcmVzcGVjdGl2ZWx5OiAwLCAyLCAzLCAwIGJpdGZsaXBzIHBlciBz
dGVwLCB0aGUgcmV0dXJuZWQgdmFsdWUgc2hhbGwgYmUKMy4KClRvIGJlIHZlcnkgY2VydGFpbiB0
aGF0IHRoaXMgaXMgY29ycmVjdCwgeW91IGNhbiB1c2UgdGhlIG5hbmRmbGlwYml0CnRvb2wgZnJv
bSB0aGUgbXRkLXV0aWxzIHRlc3Qgc3VpdGUuIFlvdSBjYW4gbWFudWFsbHkgaW5zZXJ0IGJpdGZs
aXBzIGluCnZhcmlvdXMgYXJlYXMgb2YgYSBwYWdlIGFuZCB0aGVuIHJlYWQgdGhlIHBhZ2UgYWdh
aW4gd2l0aCBFQ0MgZW5hYmxlZAphbmQgc2VlIGhvdyBtYW55IGJpdCBlcnJvcnMgYXJlIHJlcG9y
dGVkLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
