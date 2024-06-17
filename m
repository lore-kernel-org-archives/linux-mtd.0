Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB38C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 16:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CEz5Fd+vthzZYG7ZMFcQVRWXHOGJ7oQrC82Wm2ka2dM=; b=riDH7JivvUZQSGqSQ1M7sxqYfP
	p+WDeqpXgZ/Ipk0lUCxRrkYHoWqRw8QooypbbD1+QUcl/6SGmEBARX01euq+3QXcDlzhkpL8JT7zU
	dySaTG6XRbwdbtPePbyGvD6Qe48cHIqYV1iXSNazDeOXrejD0sxkmAYjJDlj5Ima5tJ3lfj17Qttq
	cx/iZlSkjAooqNsuBscTuCLmXVs2JnrhJgH2ZvEDZxvr5fyMFByZgVgkZaLXwdrbL7Kxevd7H7RsT
	QX9H6jmTuv2p1+TQKXBmo0SEgprI9yIga+NZ8G/gHxX2bDMlqe7ICbwvtPs1InSVEU0cy9vkBxtvS
	vzdGBIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEmT-0000000BcsR-1nli;
	Mon, 17 Jun 2024 16:00:29 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEmQ-0000000Bcr2-0J6O
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 16:00:27 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 9617961966A6;
	Mon, 17 Jun 2024 18:00:24 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id djS-ZRq9K2u8; Mon, 17 Jun 2024 18:00:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 40D4B61966CF;
	Mon, 17 Jun 2024 18:00:24 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IgyOjvHuzgzt; Mon, 17 Jun 2024 18:00:24 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1701261966A6;
	Mon, 17 Jun 2024 18:00:24 +0200 (CEST)
Date: Mon, 17 Jun 2024 18:00:23 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Gagan Sidhu <broly@mac.com>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, 
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	dpervushin <dpervushin@embeddedalley.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	yangerkun <yangerkun@huawei.com>, yi zhang <yi.zhang@huawei.com>
Message-ID: <1641029267.251608.1718640023954.JavaMail.zimbra@nod.at>
In-Reply-To: <14779870-BA54-4ABF-8ABF-FF1D23D172A7@mac.com>
References: <CFAC276E-E652-40CD-B3D8-563B95E679A8@mac.com> <561660214.251562.1718638970757.JavaMail.zimbra@nod.at> <14779870-BA54-4ABF-8ABF-FF1D23D172A7@mac.com>
Subject: Re: [PATCH v2] ubi: gluebi: Fix NULL pointer dereference caused by
 ftl notifier
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: gluebi: Fix NULL pointer dereference caused by ftl notifier
Thread-Index: GratdiGYJcZL29llyYc0ImwlBGth1Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_090026_317846_2B34F259 
X-CRM114-Status: UNSURE (   8.27  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkdhZ2FuIFNpZGh1IiA8YnJv
bHlAbWFjLmNvbT4KPiB5ZXMsIGkgaGF2ZSBhIHNxdWFzaGZzIGluc2lkZSBhIHViaSB2b2x1bWUs
IGFuZCBpIGNyZWF0ZSB1YmkgYmxvY2sgZGV2aWNlIGZyb20KPiBpdC4KPiAKPiBpIGRvIHVzZSBj
b25maWdfbXRkX3ViaV9ibG9jayBiZWNhdXNlIHRoZSBmaWxlc3lzdGVtIGlzIHNxdWFzaGZzLgo+
IAo+IHNvIGkgdGhpbmsgaXTigJlzIGFmZmlybWF0aXZlIHRvIGJvdGggcXVlc3Rpb25zLiBnbHVl
YmkgZm9yIHRoZSBibG9jayBkZXZpY2UgZnJvbQo+IHRoZSB1YmkuZnMgZmlsZSwgdGhlbiBjb25m
aWdfbXRkX3ViaV9ibG9jayB0byBtb3VudCB0aGlzIHJlYWQtb25seSBmaWxlc3lzdGVtCj4gYXMg
YSBibG9jayBkZXZpY2UuCj4gCj4gdGhlIGVuZCByZXN1bHQgb2YgYm90aCBvcHRpb25zIGlzIGEg
cmVhZC1vbmx5IGJsb2NrIGRldmljZSB0aGF0IGNhbiBoYW5kbGUgYmFkCj4gYmxvY2tzIG9uIG5h
bmQgZGV2aWNlcy4KPiAKPiBpZiBpIHdhcyB1c2luZyBhbiBNMjVQODAsIGkgd291bGRu4oCZdCBl
dmVuIGJlIHVzaW5nIHViaS4KPiAKPiBzbyBDT05GSUdfTVREX1VCSV97R0xVRUJJLEJMT0NLfSBh
cmUgaGFuZHkgZm9yIGNhc2VzIHdoZXJlIHlvdSBuZWVkIGFuIG10ZCBibG9jawo+IGRldmljZSB3
aXRoIGEgcmVhZC1vbmx5IGZpbGUgc3lzdGVtIHdoZXJlIHRoZSBVQkkgdGFrZXMgY2FyZSBvZiB0
aGUKPiBpZGlvc3luY3Jhc2llcyB0aGF0IG1ha2UgTkFORCAoaW1vLCBvZmMpIGluZmVyaW9yIHRv
IFNQSQoKSXNuJ3QgTVREIC0+IFVCSSAtPiBHTFVCSSAtPiBNVEQgLT4gTVREQkxPQ0sgcGVyZm9y
bWFuY2Ugd2lzZSBhIG5pZ2h0bWFyZT8KV2UgaGF2ZSBVQklCbG9jayBmb3IgdGhpcyB1c2UgY2Fz
ZS4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
