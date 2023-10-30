Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB04C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Oct 2023 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NZThU6NPPwSMjpghvDARLyfCN6CaJ9CqOnJOrONnUhY=; b=mN4qyyYS7m5pKr+m7eAjqgO3pt
	HnhBggR/mJnDDjBMKXEPPdyjuz5/IhO6CaRTa827nQu8MZaH267UQWVhZcUc9w0XlB+rZ2f5ibK7N
	THHD2lBnLBUi6+ULcv8Rw8NjMaM9/6DfbaftjQ5qdu8oirC2tcG9vfollTreZcTYV/m4E2XXPUj//
	ofMbKdpnUmLwYcnwhFaWsHF5R515LrmyOZqLMV6klqGhc9GNa10zUl4dq/WtWO3NOPSxDvLlbTIRr
	l3Kb/e+Tiuuad7KwlgzFFaHUj5g5BtWZ0qI9jxpcMpG0Kph4yznevCAnx2oiwlK0ynztdXACIc2V/
	063iWzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTXG-003VbY-0e;
	Mon, 30 Oct 2023 14:46:34 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTXD-003VZf-2R
	for linux-mtd@lists.infradead.org;
	Mon, 30 Oct 2023 14:46:33 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 24DF36340E17;
	Mon, 30 Oct 2023 15:46:26 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 83_rsuiJP0iL; Mon, 30 Oct 2023 15:46:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id ABA436340DE6;
	Mon, 30 Oct 2023 15:46:25 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id F8QdIGKLfYwY; Mon, 30 Oct 2023 15:46:25 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 830996342D49;
	Mon, 30 Oct 2023 15:46:25 +0100 (CET)
Date: Mon, 30 Oct 2023 15:46:25 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: hch <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-block <linux-block@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, zhongjinghua@huawei.com, 
	yukuai1@huaweicloud.com
Message-ID: <400425098.23787.1698677185386.JavaMail.zimbra@nod.at>
In-Reply-To: <20231030140106.1393384-1-hch@lst.de>
References: <20231030140106.1393384-1-hch@lst.de>
Subject: Re: [PATCH 1/2] ubi: block: don't use gendisk->first_minor for the
 idr_alloc return value
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: block: don't use gendisk->first_minor for the idr_alloc return value
Thread-Index: z+akUlFSTPw9+Ic4xTj+k92LkiWxmQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_074631_943642_822769B8 
X-CRM114-Status: GOOD (  12.70  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IGlkcl9hbGxvYyByZXR1cm5zIGFuIGlu
dCB0aGF0IGlzIGVpdGhlciBhIG5lZ2F0aXZlIGVycm5vLCBvciB0aGUKPiBpZGVudGlmaWVyIGFj
dHVhbGx5IGFsbG9jYXRlZC4gIFVzZSBzaWduZWQgaW50ZWdlciByZXQgdmFyaWFibGUgdG8KPiBj
YXRjaCB0aGUgcmV0dXJuIHZhbHVlIGFuZCBvbmx5IGFzc2lnbiBpdCB0byBnZC0+Zmlyc3RfbWlu
b3IgdG8gcHJlcGFyZQo+IGZvciBtYXJraW5nIHRoZSBmaXJzdF9taW5vciBmaWVsZCBpbiB0aGUg
Z2VuZGlzayBzdHJ1Y3R1cmUgYXMgdW5zaWduZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMg
fCA1ICsrKy0tCj4gMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2Jsb2NrLmMgYi9kcml2ZXJzL210
ZC91YmkvYmxvY2suYwo+IGluZGV4IDQzN2M1YjgzZmZlNTEzLi41MWQwMGI1MThkMzE5NyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC91YmkvYmxvY2suYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3Vi
aS9ibG9jay5jCj4gQEAgLTQwMiwxMyArNDAyLDE0IEBAIGludCB1YmlibG9ja19jcmVhdGUoc3Ry
dWN0IHViaV92b2x1bWVfaW5mbyAqdmkpCj4gCWdkLT5mb3BzID0gJnViaWJsb2NrX29wczsKPiAJ
Z2QtPm1ham9yID0gdWJpYmxvY2tfbWFqb3I7Cj4gCWdkLT5taW5vcnMgPSAxOwo+IC0JZ2QtPmZp
cnN0X21pbm9yID0gaWRyX2FsbG9jKCZ1YmlibG9ja19taW5vcl9pZHIsIGRldiwgMCwgMCwgR0ZQ
X0tFUk5FTCk7Cj4gLQlpZiAoZ2QtPmZpcnN0X21pbm9yIDwgMCkgewo+ICsJcmV0ID0gaWRyX2Fs
bG9jKCZ1YmlibG9ja19taW5vcl9pZHIsIGRldiwgMCwgMCwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAo
cmV0IDwgMCkgewo+IAkJZGV2X2VycihkaXNrX3RvX2RldihnZCksCj4gCQkJImJsb2NrOiBkeW5h
bWljIG1pbm9yIGFsbG9jYXRpb24gZmFpbGVkIik7Cj4gCQlyZXQgPSAtRU5PREVWOwo+IAkJZ290
byBvdXRfY2xlYW51cF9kaXNrOwo+IAl9Cj4gKwlnZC0+Zmlyc3RfbWlub3IgID0gcmV0OwoKU3Vw
ZXIgbWlub3Igbml0LCByZWR1bmRhbnQgc3BhY2UuCgpBY2tlZC1ieTogUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
