Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5A8CE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TvWEZ5Kmg8p9ol46ool94KkQ168WLLoz7EiAfStgnYg=; b=k6dJllu9Ujdkp6etkKYm/asaIW
	GSnGNys821jCe7tyhDhDq+uz3CuGQHW+N99hVq2RyAzuvjeEyB6bCeoXnTYS+DQYd6WgeCVq2x5RZ
	QQPDocPmpjIgKzxUhwqifxYzbMTW3JvwWcFnrp3TThkb5y9B1Wdo/+8JZQb8/6L+57dn2FexRGjCd
	hywB3/bIeiYyjMpQtyQOD+dYO2xHtsToHGnYy3rAOBoIQ6/ntFNxaz/PpjpPgyH+GN4F5KDwlEbBi
	DuUG5uG0ZD/FmLQ0Og5SPlqcUga8hLY0OfguFvlRBQ0ZLBD782Y0OfGCVvdD5sGRQ0ZQxCWeZGEXp
	j2EQvM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhg9-00DpKT-00;
	Mon, 25 Sep 2023 09:14:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkhg5-00DpIg-20
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 09:14:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D28EB635DB51;
	Mon, 25 Sep 2023 11:14:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id cwlQYeZ-qSy9; Mon, 25 Sep 2023 11:14:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 80AE3622F591;
	Mon, 25 Sep 2023 11:14:40 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id wy4TAeGHhR-E; Mon, 25 Sep 2023 11:14:40 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 5D5FD635DB51;
	Mon, 25 Sep 2023 11:14:40 +0200 (CEST)
Date: Mon, 25 Sep 2023 11:14:40 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	yi zhang <yi.zhang@huawei.com>, yangerkun@huawei.com, 
	Miquel Raynal <miquel.raynal@bootlin.com>
Message-ID: <495954216.80155.1695633280285.JavaMail.zimbra@nod.at>
In-Reply-To: <20230925104938.3f7b4284@xps-13>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com> <20230925104938.3f7b4284@xps-13>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix error code loss in mtdchar_read() function.
Thread-Index: TtuXiU41OYpt7ia3mZdS86/izvLuwg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_021453_811898_33408D59 
X-CRM114-Status: GOOD (  14.63  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+PiAndG90YWxfcmV0bGVuJyBpcyAwLCBu
b3QgdGhlIGVycm9yIGNvZGUuCj4gCj4gQWN0dWFsbHkgYWZ0ZXIgbG9va2luZyBhdCB0aGUgY29k
ZSwgSSBoYXZlIG5vIHN0cm9uZyBvcGluaW9uCj4gcmVnYXJkaW5nIHdoZXRoZXIgd2Ugc2hvdWxk
IHJldHVybiAwIG9yIGFuIGVycm9yIGNvZGUgaW4gdGhpcyBjYXNlLgo+IAo+IFRoZXJlIGlzIHRo
aXMgY29tbWVudCByaWdodCBhYm92ZSwgYW5kIEknbSBub3Qgc3VyZSBpdCBpcyBzdGlsbCB1cCB0
bwo+IGRhdGUgYmVjYXVzZSBJIGJlbGlldmUgbWFueSBkcml2ZXJzIGp1c3QgZG9uJ3QgcHJvdmlk
ZSB0aGUgZGF0YSB1cG9uCj4gRUNDIGVycm9yOgo+IAo+ICAgICAgICAgICAgICAgIC8qIE5hbmQg
cmV0dXJucyAtRUJBRE1TRyBvbiBFQ0MgZXJyb3JzLCBidXQgaXQgcmV0dXJucwo+ICAgICAgICAg
ICAgICAgICAqIHRoZSBkYXRhLiBGb3Igb3VyIHVzZXJzcGFjZSB0b29scyBpdCBpcyBpbXBvcnRh
bnQKPiAgICAgICAgICAgICAgICAgKiB0byBkdW1wIGFyZWFzIHdpdGggRUNDIGVycm9ycyEKPiAg
ICAgICAgICAgICAgICAgKiBGb3Iga2VybmVsIGludGVybmFsIHVzYWdlIGl0IGFsc28gbWlnaHQg
cmV0dXJuIC1FVUNMRUFOCj4gICAgICAgICAgICAgICAgICogdG8gc2lnbmFsIHRoZSBjYWxsZXIg
dGhhdCBhIGJpdGZsaXAgaGFzIG9jY3VycmVkIGFuZCBoYXMKPiAgICAgICAgICAgICAgICAgKiBi
ZWVuIGNvcnJlY3RlZCBieSB0aGUgRUNDIGFsZ29yaXRobS4KPiAgICAgICAgICAgICAgICAgKiBV
c2Vyc3BhY2Ugc29mdHdhcmUgd2hpY2ggYWNjZXNzZXMgTkFORCB0aGlzIHdheQo+ICAgICAgICAg
ICAgICAgICAqIG11c3QgYmUgYXdhcmUgb2YgdGhlIGZhY3QgdGhhdCBpdCBkZWFscyB3aXRoIE5B
TkQKPiAgICAgICAgICAgICAgICAgKi8KPiAKPj4gVGhpcyBwcm9ibGVtIGNhdXNlcyB0aGUgdXNl
ci1zcGFjZSBwcm9ncmFtIHRvIGVuY291bnRlciBFT0Ygd2hlbiBpdCBoYXMKPj4gbm90IGZpbmlz
aGVkIHJlYWRpbmcgdGhlIG10ZCBwYXJ0aW9uLCBhbmQgdGhpcyBhbHNvIHZpb2xhdGVzIHRoZSBy
ZWFkCj4+IHN5c3RlbSBjYWxsIHN0YW5kYXJkIGluIFBPU0lYLgoKVGhpcyBpcyBhIHNwZWNpYWwg
cHVycG9zZSBkZXZpY2UgZmlsZSBhbmQgbm90IGEgcmVndWxhciBmaWxlLgpQbGVhc2UgZXhwbGFp
biBpbiBkZXRhaWwgd2h5IHRoaXMgdmlvbGF0ZXMgUE9TSVggYW5kIHdoaWNoIHByb2dyYW0gYnJl
YWtzLgoKQXMgcG9pbnRlZCBvdXQgYnkgTWlxdWVsLCB0aGUgY29tbWVudCBtYWtlcyBpdCBjbGVh
biB0aGF0IHRoaXMgYmVoYXZpb3IgaXMKb24gcHVycG9zZS4gSWYgd2UgcmV0dXJuIG5vdyBhbGwg
b2YgYSBzdWRkZW4gLUVCQURNU0cgZm9yIHRoZSBkZXNjcmliZWQKc2NlbmFyaW8gd2UgbWlnaHQg
ZXZlbiBicmVhayBleGlzdGluZyBNVEQgdXNlcnNwYWNlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
